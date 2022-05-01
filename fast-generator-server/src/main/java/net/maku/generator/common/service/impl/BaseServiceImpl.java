package net.maku.generator.common.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.maku.generator.common.query.Query;
import net.maku.generator.common.service.BaseService;
import org.apache.commons.lang.StringUtils;


/**
 * 基础服务类，所有Service都要继承
 *
 * @author 阿沐 babamu@126.com
 */
public class BaseServiceImpl<M extends BaseMapper<T>, T>  extends ServiceImpl<M, T> implements BaseService<T> {

    /**
     * 获取分页对象
     * @param query   分页参数
     */
    protected IPage<T> getPage(Query query) {
        Page<T> page = new Page<>(query.getPage(), query.getLimit());
        page.addOrder(OrderItem.desc("id"));
        return page;
    }

    protected QueryWrapper<T> getWrapper(Query query){
        QueryWrapper<T> wrapper = new QueryWrapper<>();
        wrapper.like(StringUtils.isNotEmpty(query.getCode()), "code", query.getCode());
        wrapper.like(StringUtils.isNotEmpty(query.getTableName()), "table_name", query.getTableName());
        wrapper.like(StringUtils.isNotEmpty(query.getAttrType()), "attr_type", query.getAttrType());
        wrapper.like(StringUtils.isNotEmpty(query.getColumnType()), "column_type", query.getColumnType());
        wrapper.like(StringUtils.isNotEmpty(query.getConnName()), "conn_name", query.getConnName());
        wrapper.eq(StringUtils.isNotEmpty(query.getDbType()), "db_type", query.getDbType());
        return wrapper;
    }

}