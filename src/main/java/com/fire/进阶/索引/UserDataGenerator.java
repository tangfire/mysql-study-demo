package com.fire.进阶.索引;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class UserDataGenerator {
    // 数据库连接配置
    private static final String URL = "jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&characterEncoding=utf8";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "8888.216";

    // 记录已使用的电话号码
    private static final Set<String> USED_PHONES = ConcurrentHashMap.newKeySet();

    // 模拟数据源
    private static final String[] PROFESSIONS = {
        "计算机科学", "金融", "医学", "工程", "教育", 
        "法律", "艺术", "市场营销", "心理学", "生物技术"
    };

    private static final String[] FIRST_NAMES = {
        "王", "李", "张", "刘", "陈", "杨", "黄", "赵", "周", "吴"
    };

    private static final String[] LAST_NAMES = {
        "明", "强", "华", "军", "丽", "秀", "英", "峰", "勇", "娜"
    };

    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver 未找到");
            e.printStackTrace();
            return;
        }

        int totalUsers = 300_000;
        int batchSize = 1000;

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
            connection.setAutoCommit(false);

            String sql = "INSERT IGNORE INTO user_info " +
                "(name, phone, email, profession, age, gender, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                Random random = new Random();
                int insertedCount = 0;

                while (insertedCount < totalUsers) {
                    // 生成一批用户数据
                    List<UserData> users = generateUsers(Math.min(batchSize, totalUsers - insertedCount), random);

                    // 批量插入
                    for (UserData user : users) {
                        pstmt.setString(1, user.name);
                        pstmt.setString(2, user.phone);
                        pstmt.setString(3, user.email);
                        pstmt.setString(4, user.profession);
                        
                        if (user.age != null) {
                            pstmt.setInt(5, user.age);
                        } else {
                            pstmt.setNull(5, java.sql.Types.INTEGER);
                        }
                        
                        pstmt.setString(6, user.gender);
                        pstmt.setInt(7, user.status);

                        pstmt.addBatch();
                    }

                    // 执行批量插入
                    int[] results = pstmt.executeBatch();
                    connection.commit();

                    // 计算实际插入的数量
                    int actualInserted = 0;
                    for (int result : results) {
                        if (result > 0) actualInserted++;
                    }

                    insertedCount += actualInserted;
                    System.out.println("已插入 " + insertedCount + " 条数据");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 生成唯一电话号码
    private static String generateUniquePhone(Random random) {
        while (true) {
            String phone = "1" + (random.nextBoolean() ? "3" : "5") + 
                           String.format("%09d", random.nextInt(1_000_000_000));
            
            // 使用CAS操作确保电话号码唯一
            if (USED_PHONES.add(phone)) {
                return phone;
            }
        }
    }

    // 生成用户数据批次
    private static List<UserData> generateUsers(int count, Random random) {
        List<UserData> users = new ArrayList<>(count);

        for (int i = 0; i < count; i++) {
            UserData user = new UserData();
            
            // 生成姓名
            user.name = generateName(random);
            
            // 生成唯一电话
            user.phone = generateUniquePhone(random);
            
            // 生成邮箱
            user.email = generateEmail(user.name);
            
            // 随机专业
            user.profession = random.nextDouble() > 0.2 ? 
                PROFESSIONS[random.nextInt(PROFESSIONS.length)] : null;
            
            // 随机年龄
            user.age = random.nextDouble() > 0.1 ? 
                random.nextInt(18, 66) : null;
            
            // 性别
            user.gender = random.nextBoolean() ? "M" : "F";
            
            // 状态 80%正常
            user.status = random.nextDouble() > 0.2 ? 1 : 0;

            users.add(user);
        }

        return users;
    }

    // 生成姓名
    private static String generateName(Random random) {
        return FIRST_NAMES[random.nextInt(FIRST_NAMES.length)] + 
               LAST_NAMES[random.nextInt(LAST_NAMES.length)];
    }

    // 生成邮箱
    private static String generateEmail(String name) {
        return name.toLowerCase() + 
               UUID.randomUUID().toString().substring(0, 5) + 
               "@" + 
               (new String[]{"qq.com", "163.com", "gmail.com", "outlook.com"})[new Random().nextInt(4)];
    }

    // 用户数据内部类
    static class UserData {
        String name;
        String phone;
        String email;
        String profession;
        Integer age;
        String gender;
        int status;
    }
}