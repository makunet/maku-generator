package net.maku.generator.service;

import net.maku.generator.common.page.PageResult;
import net.maku.generator.common.query.Query;
import net.maku.generator.common.service.BaseService;
import net.maku.generator.entity.BaseClassEntity;

import java.util.List;

/**
 * 基类管理
 *
 * @author 阿沐 babamu@126.com
 */
public interface BaseClassService extends BaseService<BaseClassEntity> {

    PageResult<BaseClassEntity> page(Query query);

    List<BaseClassEntity> getList();
}