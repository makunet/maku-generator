package net.maku.generator.config;

import lombok.Data;
import net.maku.generator.config.query.*;
import net.maku.generator.entity.DataSourceEntity;
import net.maku.generator.utils.DbType;
import net.maku.generator.utils.DbUtils;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * 数据源信息
 *
 * @author 阿沐 babamu@126.com
 */
@Data
public class DataSourceInfo {
    /**
     * 数据源ID
     */
    private Long id;
    /**
     * 数据库类型
     */
    private DbType dbType;
    /**
     * 数据库URL
     */
    private String connUrl;
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码
     */
    private String password;

    private AbstractQuery dbQuery;

    private Connection connection;

    public DataSourceInfo(DataSourceEntity entity) {
        this.id = entity.getId();
        this.dbType = DbType.valueOf(entity.getDbType());
        this.connUrl = entity.getConnUrl();
        this.username = entity.getUsername();
        this.password = entity.getPassword();

        if(dbType == DbType.MySQL) {
            this.dbQuery = new MySqlQuery();
        }else if(dbType == DbType.Oracle) {
            this.dbQuery = new OracleQuery();
        }else if(dbType == DbType.PostgreSQL) {
            this.dbQuery = new PostgreSqlQuery();
        }else if(dbType == DbType.SqlServer) {
            this.dbQuery = new SqlServerQuery();
        }

        try {
            this.connection = DbUtils.getConnection(this);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public DataSourceInfo(Connection connection) throws SQLException {
        this.id = 0L;
        this.dbType = DbType.valueOf(connection.getMetaData().getDatabaseProductName());

        if(dbType == DbType.MySQL) {
            this.dbQuery = new MySqlQuery();
        }else if(dbType == DbType.Oracle) {
            this.dbQuery = new OracleQuery();
        }else if(dbType == DbType.PostgreSQL) {
            this.dbQuery = new PostgreSqlQuery();
        }else if(dbType == DbType.SqlServer) {
            this.dbQuery = new SqlServerQuery();
        }

        this.connection = connection;
    }
}
