package ${package}.modules.${moduleName}.service<#if subModuleName??>.${subModuleName}</#if>;

import ${package}.common.service.CrudService;
import ${package}.modules.${moduleName}.dto<#if subModuleName??>.${subModuleName}</#if>.${ClassName}DTO;
import ${package}.modules.${moduleName}.entity<#if subModuleName??>.${subModuleName}</#if>.${ClassName}Entity;

/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
public interface ${ClassName}Service extends CrudService<${ClassName}Entity, ${ClassName}DTO> {

}