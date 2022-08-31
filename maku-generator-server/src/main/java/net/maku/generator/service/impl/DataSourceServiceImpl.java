package net.maku.generator.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import net.maku.generator.common.page.PageResult;
import net.maku.generator.common.query.Query;
import net.maku.generator.common.service.impl.BaseServiceImpl;
import net.maku.generator.dao.DataSourceDao;
import net.maku.generator.entity.DataSourceEntity;
import net.maku.generator.service.DataSourceService;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 数据源管理
 *
 * @author 阿沐 babamu@126.com
 */
@Service
public class DataSourceServiceImpl extends BaseServiceImpl<DataSourceDao, DataSourceEntity> implements DataSourceService {

    @Override
    public PageResult<DataSourceEntity> page(Query query) {
        IPage<DataSourceEntity> page = baseMapper.selectPage(
            getPage(query),
            getWrapper(query)
        );
        return new PageResult<>(page.getRecords(), page.getTotal());
    }

    @Override
    public List<DataSourceEntity> getList() {
        return baseMapper.selectList(Wrappers.emptyWrapper());
    }

}