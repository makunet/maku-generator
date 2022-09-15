package net.maku.generator.service;

import net.maku.generator.common.page.PageResult;
import net.maku.generator.common.query.Query;
import net.maku.generator.common.service.BaseService;
import net.maku.generator.entity.ProjectModifyEntity;

import java.io.IOException;

/**
 * 项目名变更
 *
 * @author 阿沐 babamu@126.com
 */
public interface ProjectModifyService extends BaseService<ProjectModifyEntity> {

    PageResult<ProjectModifyEntity> page(Query query);

    byte[] download(ProjectModifyEntity project) throws IOException;

}