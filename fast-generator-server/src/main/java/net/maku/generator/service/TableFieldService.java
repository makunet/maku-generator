package net.maku.generator.service;

import net.maku.generator.common.service.BaseService;
import net.maku.generator.entity.TableFieldEntity;

import java.util.List;

/**
 * 列
 *
 * @author 阿沐 babamu@126.com
 */
public interface TableFieldService extends BaseService<TableFieldEntity> {

    List<TableFieldEntity> getByTableName(String tableName);

    void deleteByTableName(String tableName);

    void deleteBatchTableIds(Long[] tableIds);
}