package net.maku.generator.service;

import net.maku.generator.common.page.PageResult;
import net.maku.generator.common.query.Query;
import net.maku.generator.common.service.BaseService;
import net.maku.generator.entity.DataSourceEntity;

import java.util.List;

/**
 * 数据源管理
 *
 * @author 阿沐 babamu@126.com
 */
public interface DataSourceService extends BaseService<DataSourceEntity> {

    PageResult<DataSourceEntity> page(Query query);

    List<DataSourceEntity> getList();
}