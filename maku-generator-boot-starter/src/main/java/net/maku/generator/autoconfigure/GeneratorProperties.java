package net.maku.generator.autoconfigure;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * spring boot starter properties
 *
 * @author 阿沐 babamu@126.com
 */
@Data
@ConfigurationProperties("generator")
public class GeneratorProperties {
    /**
     * 模板路径
     */
    private String template = "/template/";
}
