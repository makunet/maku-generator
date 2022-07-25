package net.maku.generator.config.query;

import net.maku.generator.utils.DbType;
import org.apache.commons.lang.StringUtils;

/**
 * MySQL查询
 *
 * @author 阿沐 babamu@126.com
 */
public class SqlServerQuery implements AbstractQuery {

    @Override
    public DbType dbType() {
        return DbType.SqlServer;
    }

    @Override
    public String tablesSql(String tableName) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT DISTINCT d.name as table_name, f.value as table_comment FROM syscolumns a " +
                "LEFT JOIN systypes b ON a.xusertype= b.xusertype " +
                "INNER JOIN sysobjects d ON a.id= d.id  AND d.xtype= 'U' AND d.name<> 'dtproperties' " +
                "LEFT JOIN syscomments e ON a.cdefault= e.id " +
                "LEFT JOIN sys.extended_properties g ON a.id= G.major_id AND a.colid= g.minor_id " +
                "LEFT JOIN sys.extended_properties f ON d.id= f.major_id AND f.minor_id= 0 ");
        sql.append("where 1=1 ");
        //表名查询
        if(StringUtils.isNotBlank(tableName)){
            sql.append("and d.name = '").append(tableName).append("' ");
        }
        sql.append("order by d.name asc");
        return sql.toString();
    }

    @Override
    public String tableName() {
        return "table_name";
    }

    @Override
    public String tableComment() {
        return "table_comment";
    }

    @Override
    public String tableFieldsSql() {
        return " Select SCOL.NAME as column_name, STYPE.NAME AS data_type , (case when(\n" +
                "  SELECT COUNT (*) AS Is_PK\n" +
                " FROM syscolumns\n" +
                " JOIN sysindexkeys ON syscolumns.id = sysindexkeys.id AND syscolumns.colid = sysindexkeys.colid\n" +
                " JOIN sysindexes ON syscolumns.id = sysindexes.id AND sysindexkeys.indid = sysindexes.indid\n" +
                " JOIN sysobjects ON sysindexes.name = sysobjects.name AND sysobjects.xtype = 'PK'\n" +
                " WHERE syscolumns.name = SCOL.NAME AND syscolumns.id = SCOL.ID\n" +
                " ) > 0 then 'PRI' else '' end) column_key,    \n" +
                "\t(SELECT SYS.EXTENDED_PROPERTIES.VALUE FROM SYSCOLUMNS  \n" +
                "\tINNER JOIN SYS.EXTENDED_PROPERTIES ON SYSCOLUMNS.ID = SYS.EXTENDED_PROPERTIES.MAJOR_ID   \n" +
                "\tAND SYSCOLUMNS.COLID = SYS.EXTENDED_PROPERTIES.MINOR_ID \n" +
                "\tINNER JOIN SYSOBJECTS ON SYSCOLUMNS.ID = SYSOBJECTS.ID  \n" +
                "\tWHERE SYSOBJECTS.NAME = SO.NAME AND SYSCOLUMNS.NAME = SCOL.NAME) AS column_comment  \n" +
                "\tfrom SYSCOLUMNS AS SCOL\n" +
                "\tLEFT JOIN SYSOBJECTS SO ON SO.ID=SCOL.ID \n" +
                "\tLEFT JOIN SYSTYPES AS STYPE ON STYPE.xtype=SCOL.xtype\n" +
                "\tWhere \n" +
                "\tSCOL.ID=OBJECT_ID('%s')\n" +
                "\tAND STYPE.NAME<>'SYSNAME'";
    }

    @Override
    public String fieldName() {
        return "column_name";
    }

    @Override
    public String fieldType() {
        return "data_type";
    }

    @Override
    public String fieldComment() {
        return "column_comment";
    }

    @Override
    public String fieldKey() {
        return "column_key";
    }
}
