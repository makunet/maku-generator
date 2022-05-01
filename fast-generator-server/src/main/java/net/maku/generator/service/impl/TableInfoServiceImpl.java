package net.maku.generator.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import net.maku.generator.common.page.PageResult;
import net.maku.generator.common.query.Query;
import net.maku.generator.common.service.impl.BaseServiceImpl;
import net.maku.generator.dao.TableInfoDao;
import net.maku.generator.entity.TableInfoEntity;
import net.maku.generator.service.TableFieldService;
import net.maku.generator.service.TableInfoService;
import org.springframework.stereotype.Service;

import java.util.Arrays;


/**
 * 表
 *
 * @author 阿沐 babamu@126.com
 */
@Service
@AllArgsConstructor
public class TableInfoServiceImpl extends BaseServiceImpl<TableInfoDao, TableInfoEntity> implements TableInfoService {
    private final TableFieldService tableFieldService;

    @Override
    public PageResult<TableInfoEntity> page(Query query) {
        IPage<TableInfoEntity> page = baseMapper.selectPage(
            getPage(query),
            getWrapper(query)
        );
        return new PageResult<>(page.getRecords(), page.getTotal());
    }

    @Override
    public TableInfoEntity getByTableName(String tableName) {
        return baseMapper.getByTableName(tableName);
    }

    @Override
    public void deleteByTableName(String tableName) {
        baseMapper.deleteByTableName(tableName);
    }

    @Override
    public void deleteBatchIds(Long[] ids) {
        //删除表
        baseMapper.deleteBatchIds(Arrays.asList(ids));

        //删除列
        tableFieldService.deleteBatchTableIds(ids);
    }
}