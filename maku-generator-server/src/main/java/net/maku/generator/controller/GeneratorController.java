package net.maku.generator.controller;

import lombok.AllArgsConstructor;
import net.maku.generator.common.page.PageResult;
import net.maku.generator.common.query.Query;
import net.maku.generator.common.utils.Result;
import net.maku.generator.config.DataSourceInfo;
import net.maku.generator.entity.TableFieldEntity;
import net.maku.generator.entity.TableInfoEntity;
import net.maku.generator.service.GeneratorService;
import net.maku.generator.service.TableFieldService;
import net.maku.generator.service.TableInfoService;
import net.maku.generator.utils.DbUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 代码生成
 *
 * @author 阿沐 babamu@126.com
 */
@RestController
@RequestMapping("gen")
@AllArgsConstructor
public class GeneratorController {
    private final GeneratorService generatorService;
    private final TableInfoService tableInfoService;
    private final TableFieldService tableFieldService;

    @GetMapping("table/page")
    public Result<PageResult<TableInfoEntity>> pageTable(Query query){
        PageResult<TableInfoEntity> page = tableInfoService.page(query);

        return Result.ok(page);
    }

    @GetMapping("table/{id}")
    public Result<TableInfoEntity> getTable(@PathVariable("id") Long id){
        TableInfoEntity table = tableInfoService.getById(id);

        List<TableFieldEntity> fieldList = tableFieldService.getByTableName(table.getTableName());
        table.setFields(fieldList);

        return Result.ok(table);
    }

    @PutMapping("table")
    public Result<String> updateTable(@RequestBody TableInfoEntity tableInfo){
        tableInfoService.updateById(tableInfo);

        return Result.ok();
    }

    @DeleteMapping("table")
    public Result<String> deleteTable(@RequestBody Long[] ids){
        tableInfoService.deleteBatchIds(ids);

        return Result.ok();
    }

    /**
     * 获取数据源中所有表
     */
    @GetMapping("datasource/table/list/{id}")
    public Result<List<TableInfoEntity>> getDataSourceTableList(@PathVariable("id") Long id){
        try {
            //初始化配置信息
            DataSourceInfo info = generatorService.getDataSourceInfo(id);
            List<TableInfoEntity> tableInfoList = DbUtils.getTablesInfoList(info);

            return Result.ok(tableInfoList);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("数据源配置错误，请检查数据源配置！");
        }
    }

    /**
     * 导入数据源中的表
     */
    @PostMapping("datasource/table")
    public Result<String> datasourceTable(@RequestBody TableInfoEntity tableInfo) {
        generatorService.datasourceTable(tableInfo);

        return Result.ok();
    }

    /**
     * 更新列数据
     */
    @PutMapping("table/field/{tableId}")
    public Result<String> updateTableField(@PathVariable("tableId") Long tableId, @RequestBody List<TableFieldEntity> tableFieldList) {
        generatorService.updateTableField(tableId, tableFieldList);

        return Result.ok();
    }

    /**
     * 生成代码
     */
    @PostMapping("generator")
    public Result<String> generator(@RequestBody TableInfoEntity tableInfo) throws Exception {
        //保存表信息
        tableInfoService.updateById(tableInfo);

        //生成代码
        generatorService.generatorCode(tableInfo);

        return Result.ok();
    }
}