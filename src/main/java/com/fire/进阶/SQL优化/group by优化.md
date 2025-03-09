以下是 MySQL 中 **GROUP BY 优化**的核心策略及实践方法，综合多个技术文档与实践案例整理：

---

### 一、**索引优化：提升分组效率的核心**
1. **松散索引扫描（Loose Index Scan）**
    - **原理**：当 `GROUP BY` 字段是索引的最左前缀时，MySQL 可直接跳过部分索引条目进行分组，减少扫描范围。
    - **示例**：若存在复合索引 `(col1, col2)`，且 `GROUP BY col1`，则优化器会直接利用索引快速定位 `col1` 的分组。
    - **条件**：
        - 查询仅涉及索引列和聚合函数。
        - `GROUP BY` 列顺序与索引一致，且无范围查询干扰。

2. **覆盖索引优化**
    - **原理**：通过创建包含 `GROUP BY` 列和聚合字段的索引，避免回表操作（`Using index`）。
    - **示例**：
      ```sql
      CREATE INDEX idx_cover ON orders (status, amount);
      SELECT status, SUM(amount) FROM orders GROUP BY status;
      ```

3. **去除冗余分组列**
    - **优化场景**：当 `GROUP BY` 包含常量或等价列时，MySQL 会自动剔除冗余字段。
    - **示例**：
      ```sql
      -- 原语句
      SELECT a, SUM(b) FROM t WHERE c=1 GROUP BY a, c;
      -- 优化后等价于
      SELECT a, SUM(b) FROM t WHERE c=1 GROUP BY a;
      ```

---

### 二、**分组算法选择：权衡内存与性能**
1. **哈希分组（Hash Aggregation）**
    - **原理**：通过哈希表快速匹配分组键，适用于分组数量较少的场景。
    - **优势**：内存占用低，适合随机分布的分组键。
    - **劣势**：哈希冲突可能导致性能下降，需合理选择哈希算法（如 FNV、CRC）。

2. **排序分组（Sort-Based Aggregation）**
    - **原理**：先对数据进行排序，再顺序扫描完成分组，适用于分组数量大或已有序的场景。
    - **优势**：内存消耗稳定，适合有序数据（如时间序列）。
    - **适用场景**：
        - `GROUP BY` 与 `ORDER BY` 列一致时，可合并排序操作。
        - 存在索引支持排序时（如 `INDEX(col1)`），避免额外排序开销。

3. **临时表优化**
    - **触发条件**：当无法通过索引完成分组时，MySQL 使用内存或磁盘临时表存储中间结果。
    - **调优建议**：
        - 增大 `tmp_table_size` 和 `max_heap_table_size`，优先使用内存临时表。
        - 选择 Memory 引擎临时表减少 I/O 开销。

---

### 三、**查询重写与逻辑优化**
1. **合并分组与排序**
    - **原理**：若 `GROUP BY` 和 `ORDER BY` 列相同且方向一致，优化器会合并操作，减少排序次数。
    - **示例**：
      ```sql
      SELECT col1, SUM(col2) FROM t GROUP BY col1 ORDER BY col1;
      -- 等价于直接使用索引排序完成分组
      ```

2. **利用等价关系简化分组**
    - **示例**：
      ```sql
      SELECT a, b FROM t1, t2 WHERE t1.a = t2.b GROUP BY a, b;
      -- 优化为
      SELECT a FROM t1, t2 WHERE t1.a = t2.b GROUP BY a;
      ```

3. **避免复杂子查询**
    - **优化方法**：将子查询改写为 `JOIN` 操作，减少临时表生成。
    - **示例**：
      ```sql
      -- 不推荐
      SELECT a, (SELECT SUM(b) FROM t2 WHERE t2.a = t1.a) FROM t1 GROUP BY a;
      -- 推荐
      SELECT t1.a, SUM(t2.b) FROM t1 JOIN t2 ON t1.a = t2.a GROUP BY t1.a;
      ```

---

### 四、**配置与参数调优**
1. **内存参数调整**
    - **`sort_buffer_size`**：增大排序缓冲区，减少磁盘临时表使用。
    - **`group_concat_max_len`**：调整 `GROUP_CONCAT` 结果的最大长度，避免截断。

2. **启用 `ONLY_FULL_GROUP_BY` 模式**
    - **作用**：强制严格分组规则，防止未聚合列出现在 `SELECT` 列表，避免数据不一致。
    - **设置方法**：
      ```sql
      SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY';
      ```

---

### 五、**监控与分析工具**
1. **`EXPLAIN` 执行计划分析**
    - **关键指标**：
        - `Using temporary`：表示使用临时表。
        - `Using filesort`：表示额外排序操作。
    - **优化目标**：通过索引消除临时表和排序。

2. **慢查询日志与性能模式**
    - **慢查询日志**：捕获执行时间过长的 `GROUP BY` 语句。
    - **Performance Schema**：分析分组阶段的资源消耗（如内存、CPU）。

---

### 六、**实际场景优化案例**
1. **分页查询优化**
    - **问题**：深分页（如 `LIMIT 100000, 10`）伴随 `GROUP BY` 时性能差。
    - **方案**：使用游标分页或延迟关联，减少临时表数据量。
      ```sql
      SELECT * FROM orders 
      WHERE id > 100000 
      GROUP BY category 
      ORDER BY id 
      LIMIT 10;
      ```

2. **大表分区优化**
    - **场景**：按时间分组的超大规模表。
    - **方案**：对表按时间分区，缩小分组操作的数据范围。
      ```sql
      CREATE TABLE sales (
        sale_date DATE,
        amount DECIMAL(10,2)
      ) PARTITION BY RANGE (YEAR(sale_date)) (
        PARTITION p2023 VALUES LESS THAN (2024),
        PARTITION p2024 VALUES LESS THAN (2025)
      );
      ```

---

### 总结
优化 `GROUP BY` 的核心思路是 **减少数据扫描量** 和 **避免临时表/排序**，具体策略包括：
1. **索引优先**：利用松散索引扫描和覆盖索引。
2. **算法适配**：根据数据分布选择哈希或排序分组。
3. **查询精简**：合并操作、去除冗余字段、改写复杂子查询。
4. **配置调优**：调整内存参数，启用严格分组模式。
5. **监控分析**：通过 `EXPLAIN` 和慢日志定位瓶颈。

实际应用中需结合业务场景灵活调整，例如高频分组查询可引入缓存（如 Redis）减轻数据库负载。