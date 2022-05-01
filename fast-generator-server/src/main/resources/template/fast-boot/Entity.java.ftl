package ${package}.modules.${moduleName}.entity<#if subModuleName??>.${subModuleName}</#if>;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
<#list imports as i>
import ${i!};
</#list>
<#if baseClassEntity??>
import ${baseClassEntity.packageName};
</#if>

/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
@Data
@EqualsAndHashCode(callSuper=false)
@TableName("${tableName}")
public class ${ClassName}Entity<#if baseClassEntity??> extends ${baseClassEntity.code}</#if> {
	private static final long serialVersionUID = 1L;

<#list columnList as column>
	<#if baseClassEntity?? && baseClassEntity.fields?split(",")?seq_contains(column.columnName)>
    <#else>
	<#if column.comment!?length gt 0>
	/**
	* ${column.comment}
	*/
	</#if>
    <#if "creator,create_date,dept_id"?split(",")?seq_contains(column.columnName)>
	@TableField(fill = FieldFill.INSERT)
	</#if>
    <#if "updater,update_date"?split(",")?seq_contains(column.columnName)>
	@TableField(fill = FieldFill.INSERT_UPDATE)
	</#if>
    <#if column.pk>
	@TableId
	</#if>
	private ${column.attrType} ${column.attrName};
	</#if>
</#list>
}