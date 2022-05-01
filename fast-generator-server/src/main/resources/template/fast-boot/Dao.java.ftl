package ${package}.modules.${moduleName}.dao<#if subModuleName??>.${subModuleName}</#if>;

import ${package}.common.dao.BaseDao;
import ${package}.modules.${moduleName}.entity<#if subModuleName??>.${subModuleName}</#if>.${ClassName}Entity;
import org.apache.ibatis.annotations.Mapper;

/**
* ${tableComment}
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Mapper
public interface ${ClassName}Dao extends BaseDao<${ClassName}Entity> {
	
}