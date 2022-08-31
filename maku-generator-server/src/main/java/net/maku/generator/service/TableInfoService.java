package net.maku.generator.service;

import net.maku.generator.common.page.PageResult;
import net.maku.generator.common.query.Query;
import net.maku.generator.common.service.BaseService;
import net.maku.generator.entity.TableInfoEntity;

/**
 * 表
 *
 * @author 阿沐 babamu@126.com
 */
public interface TableInfoService extends BaseService<TableInfoEntity> {

    PageResult<TableInfoEntity> page(Query query);

    TableInfoEntity getByTableName(String tableName);

    void deleteByTableName(String tableName);

    void deleteBatchIds(Long[] ids);
}