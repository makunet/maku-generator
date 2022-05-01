package net.maku.generator.common.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;

import java.util.Date;

/**
 * mybatis-plus 自动填充字段
 *
 * @author 阿沐 babamu@126.com
 */
public class FieldMetaObjectHandler implements MetaObjectHandler {
    private final static String CREATE_TIME = "createTime";

    @Override
    public void insertFill(MetaObject metaObject) {
        // 创建时间
        strictInsertFill(metaObject, CREATE_TIME, Date.class, new Date());

    }

    @Override
    public void updateFill(MetaObject metaObject) {

    }
}