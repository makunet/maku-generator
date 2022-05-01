package net.maku.generator.common.query;

import lombok.Data;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * 查询公共参数
 *
 * @author 阿沐 babamu@126.com
 */
@Data
public class Query {
    @NotNull(message = "页码不能为空")
    @Min(value = 1, message = "页码最小值为 1")
    Integer page;

    @NotNull(message = "每页条数不能为空")
    @Range(min = 1, max = 1000, message = "每页条数，取值范围 1-1000")
    Integer limit;

    String code;
    String tableName;
    String attrType;
    String columnType;
    String connName;
    String dbType;


}
