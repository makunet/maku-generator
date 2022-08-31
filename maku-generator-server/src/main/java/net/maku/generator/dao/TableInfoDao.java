package net.maku.generator.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.maku.generator.entity.TableInfoEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 列
 *
 * @author 阿沐 babamu@126.com
 */
@Mapper
public interface TableInfoDao extends BaseMapper<TableInfoEntity> {
    TableInfoEntity getByTableName(String tableName);

    void deleteByTableName(String tableName);
}
