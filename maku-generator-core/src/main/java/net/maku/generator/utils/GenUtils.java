package net.maku.generator.utils;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import lombok.extern.slf4j.Slf4j;
import net.maku.generator.common.exception.ServerException;
import net.maku.generator.config.DbType;
import net.maku.generator.config.GenDataSource;
import net.maku.generator.config.query.AbstractQuery;
import net.maku.generator.entity.TableEntity;
import net.maku.generator.entity.TableFieldEntity;

import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * 代码生成器 工具类
 *
 * @author 阿沐 babamu@126.com
 */
@Slf4j
public class GenUtils {

    /**
     * 根据数据源，获取全部数据表
     *
     * @param datasource 数据源
     */
    public static List<TableEntity> getTableList(GenDataSource datasource) {
        List<TableEntity> tableList = new ArrayList<>();
        try {
            AbstractQuery query = datasource.getDbQuery();

            //查询数据
            PreparedStatement preparedStatement = datasource.getConnection().prepareStatement(query.tableSql(null));
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                TableEntity table = new TableEntity();
                table.setTableName(rs.getString(query.tableName()));
                table.setTableComment(rs.getString(query.tableComment()));
                table.setDatasourceId(datasource.getId());
                tableList.add(table);
            }

            datasource.getConnection().close();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        return tableList;
    }

    /**
     * 根据数据源，获取指定数据表
     *
     * @param datasource 数据源
     * @param tableName  表名
     */
    public static TableEntity getTable(GenDataSource datasource, String tableName) {
        try {
            AbstractQuery query = datasource.getDbQuery();

            // 查询数据
            PreparedStatement preparedStatement = datasource.getConnection().prepareStatement(query.tableSql(tableName));
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                TableEntity table = new TableEntity();
                table.setTableName(rs.getString(query.tableName()));
                table.setTableComment(rs.getString(query.tableComment()));
                table.setDatasourceId(datasource.getId());
                return table;
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        throw new ServerException("数据表不存在：" + tableName);
    }


    /**
     * 获取表字段列表
     *
     * @param datasource 数据源
     * @param tableId    表ID
     * @param tableName  表名
     */
    public static List<TableFieldEntity> getTableFieldList(GenDataSource datasource, Long tableId, String tableName) {
        List<TableFieldEntity> tableFieldList = new ArrayList<>();

        try {
            AbstractQuery query = datasource.getDbQuery();
            String tableFieldsSql = query.tableFieldsSql();
            if (datasource.getDbType() == DbType.Oracle) {
                DatabaseMetaData md = datasource.getConnection().getMetaData();
                tableFieldsSql = String.format(tableFieldsSql.replace("#schema", md.getUserName()), tableName);
            } else {
                tableFieldsSql = String.format(tableFieldsSql, tableName);
            }
            PreparedStatement preparedStatement = datasource.getConnection().prepareStatement(tableFieldsSql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                TableFieldEntity field = new TableFieldEntity();
                field.setTableId(tableId);
                field.setFieldName(rs.getString(query.fieldName()));
                String fieldType = rs.getString(query.fieldType());
                if (fieldType.contains(" ")) {
                    fieldType = fieldType.substring(0, fieldType.indexOf(" "));
                }
                field.setFieldType(fieldType);
                field.setFieldComment(rs.getString(query.fieldComment()));
                String key = rs.getString(query.fieldKey());
                field.setPrimaryPk(StringUtils.isNotBlank(key) && "PRI".equalsIgnoreCase(key));

                tableFieldList.add(field);
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        return tableFieldList;
    }

    /**
     * 获取模块名
     *
     * @param packageName 包名
     * @return 模块名
     */
    public static String getModuleName(String packageName) {
        return StrUtil.subAfter(packageName, ".", true);
    }

    /**
     * 获取功能名
     *
     * @param tableName 表名
     * @return 功能名
     */
    public static String getFunctionName(String tableName) {
        String functionName = StrUtil.subAfter(tableName, "_", true);
        if (StrUtil.isBlank(functionName)) {
            functionName = tableName;
        }

        return functionName;
    }
}
