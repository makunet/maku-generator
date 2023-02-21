package net.maku.generator.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.maku.generator.entity.BaseClassEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 基类管理
 *
 * @author 阿沐 babamu@126.com
 * <a href="https://maku.net">MAKU</a>
 */
@Mapper
public interface BaseClassDao extends BaseMapper<BaseClassEntity> {

}