package net.maku.generator.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.maku.generator.entity.TableFieldEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 表字段
 *
 * @author 阿沐 babamu@126.com
 */
@Mapper
public interface TableFieldDao extends BaseMapper<TableFieldEntity> {

    List<TableFieldEntity> getByTableId(Long tableId);

    void deleteBatchTableIds(Long[] tableIds);
}
