package net.maku.generator.common.config;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.BlockAttackInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import net.maku.generator.common.handler.FieldMetaObjectHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * mybatis-plus 配置
 *
 * @author 阿沐 babamu@126.com
 */
@Configuration
public class MybatisPlusConfig {

    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
        // 分页插件
        mybatisPlusInterceptor.addInnerInterceptor(new PaginationInnerInterceptor());
        // 防止全表更新与删除
        mybatisPlusInterceptor.addInnerInterceptor(new BlockAttackInnerInterceptor());

        return mybatisPlusInterceptor;
    }

    @Bean
    public FieldMetaObjectHandler fieldMetaObjectHandler(){
        return new FieldMetaObjectHandler();
    }
}
