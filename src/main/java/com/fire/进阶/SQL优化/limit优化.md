以下是 MySQL 中 **LIMIT 优化** 的核心策略与实践方法，综合多个技术文档与实践案例整理：

---

### 一、**深分页性能瓶颈与优化**
1. **问题根源**
    - **传统分页问题**：`LIMIT offset, row_count` 需要扫描并跳过前 `offset` 行数据，当 `offset` 值较大时（如 `LIMIT 100000, 10`），会导致大量无效 I/O 和 CPU 消耗。
    - **性能对比**：`offset` 越大，查询时间线性增长。例如，`LIMIT 1000000,10` 可能比 `LIMIT 10` 慢数百倍。

2. **游标分页优化**
    - **原理**：基于有序字段（如自增主键或时间戳）记录上一页的最后一个值，通过 `WHERE` 条件直接定位起始位置。
    - **示例**：
      ```sql
      -- 下一页
      SELECT * FROM orders WHERE id > 100000 ORDER BY id LIMIT 10;
      -- 上一页
      SELECT * FROM orders WHERE id < 100000 ORDER BY id DESC LIMIT 10;
      ```
    - **优势**：跳过无效数据扫描，时间复杂度稳定为 O(1)。

---

### 二、**索引优化与覆盖索引**
1. **利用索引排序**
    - **原理**：若 `ORDER BY` 字段与索引顺序一致，可直接利用索引有序性跳过排序阶段。
    - **示例**：
      ```sql
      CREATE INDEX idx_created_at ON orders(created_at);
      SELECT * FROM orders ORDER BY created_at LIMIT 1000, 10;
      ```

2. **覆盖索引加速**
    - **原理**：将查询字段包含在索引中，避免回表操作（`Using index`）。
    - **示例**：
      ```sql
      CREATE INDEX idx_cover ON orders(created_at, amount);
      SELECT created_at, amount FROM orders ORDER BY created_at LIMIT 1000, 10;
      ```

---

### 三、**延迟关联与子查询优化**
1. **延迟关联**
    - **原理**：先通过子查询获取主键，再关联原表获取完整数据，减少回表次数。
    - **示例**：
      ```sql
      SELECT o.* 
      FROM orders o 
      JOIN (SELECT id FROM orders ORDER BY id LIMIT 100000, 10) AS tmp 
      ON o.id = tmp.id;
      ```
    - **优势**：子查询仅扫描索引，减少临时表数据量。

2. **分页预计算**
    - **原理**：提前存储分页关键值（如最大/最小 ID），避免实时计算偏移量。

---

### 四、**参数调优与配置优化**
1. **内存参数调整**
    - **`sort_buffer_size`**：增大排序缓冲区（默认 256KB），减少磁盘临时表使用。
    - **`read_rnd_buffer_size`**：提升随机读性能（适用于非索引排序场景）。

2. **避免隐式转换**
    - **问题**：字段类型与查询值类型不匹配会导致索引失效，影响分页效率。
    - **优化示例**：
      ```sql
      -- 错误：bpn 字段为 VARCHAR，查询值为整数
      SELECT * FROM my_balance WHERE bpn = 14000000123;
      -- 正确：显式转换为字符串
      SELECT * FROM my_balance WHERE bpn = '14000000123';
      ```

---

### 五、**分页场景扩展优化**
1. **无排序分页**
    - **原理**：若无需排序，直接使用主键分页，效率最高。
    - **示例**：
      ```sql
      SELECT * FROM orders WHERE id BETWEEN 100000 AND 100010;
      ```

2. **分布式分页**
    - **策略**：结合分库分表中间件（如 ShardingSphere），将分页计算下推到各数据节点。

---

### 总结
优化 `LIMIT` 的核心思路是 **减少无效数据扫描** 和 **提升索引利用率**，具体策略包括：
1. **游标分页**：替代传统 `LIMIT offset`，避免深分页性能问题。
2. **索引设计**：优先使用覆盖索引，确保排序字段与索引一致。
3. **延迟关联**：通过子查询减少回表开销。
4. **参数调优**：调整内存参数，规避隐式转换陷阱。

实际应用中需结合业务场景灵活选择方案。例如，高频分页查询可引入缓存（如 Redis）存储热点分页结果。