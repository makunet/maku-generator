package ${package}.modules.${moduleName}.service<#if subModuleName??>.${subModuleName}</#if>.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import ${package}.common.service.impl.CrudServiceImpl;
import ${package}.common.constant.Constant;
import ${package}.modules.${moduleName}.dao<#if subModuleName??>.${subModuleName}</#if>.${ClassName}Dao;
import ${package}.modules.${moduleName}.dto<#if subModuleName??>.${subModuleName}</#if>.${ClassName}DTO;
import ${package}.modules.${moduleName}.entity<#if subModuleName??>.${subModuleName}</#if>.${ClassName}Entity;
import ${package}.modules.${moduleName}.service<#if subModuleName??>.${subModuleName}</#if>.${ClassName}Service;
import ${package}.modules.security.user.SecurityUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
@Service
public class ${ClassName}ServiceImpl extends CrudServiceImpl<${ClassName}Dao, ${ClassName}Entity, ${ClassName}DTO> implements ${ClassName}Service {

    @Override
    public QueryWrapper<${ClassName}Entity> getWrapper(Map<String, Object> params){
        QueryWrapper<${ClassName}Entity> wrapper = new QueryWrapper<>();

        <#list columnList as column>
        <#if column.query>
        <#if column.formType == 'date'>
        String startDate = (String)params.get("startDate");
        String endDate = (String)params.get("endDate");
        wrapper.gt(StringUtils.isNotBlank(startDate), "${column.columnName}", startDate);
        wrapper.lt(StringUtils.isNotBlank(endDate), "${column.columnName}", endDate);
        <#elseif column.formType == 'datetime'>
        String startDateTime = (String)params.get("startDateTime");
        String endDateTime = (String)params.get("endDateTime");
        wrapper.ge(StringUtils.isNotBlank(startDateTime), "${column.columnName}", startDateTime);
        wrapper.le(StringUtils.isNotBlank(endDateTime), "${column.columnName}", endDateTime);
        <#else>
        String ${column.attrName} = (String)params.get("${column.attrName}");
        <#switch column.queryType>  
        <#case "=">  
        wrapper.eq(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        <#break>  
        <#case "!=">  
        wrapper.ne(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        <#break>  
        <#case ">">  
        wrapper.gt(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        <#break>  
        <#case ">=">  
        wrapper.ge(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        <#break> 
        <#case "<">  
        wrapper.lt(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        <#break>  
        <#case "<=">  
        wrapper.le(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        <#break>   
        <#case "like">  
        wrapper.like(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        <#break>
        <#case "left like">  
        wrapper.likeLeft(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        <#break> 
        <#case "right like">  
        wrapper.likeRight(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        <#break>        
        <#default>  
        wrapper.ne(StringUtils.isNotBlank(${column.attrName}), "${column.columnName}", ${column.attrName});
        </#switch>
        </#if>
        </#if>
        </#list>

        return wrapper;
    }


}