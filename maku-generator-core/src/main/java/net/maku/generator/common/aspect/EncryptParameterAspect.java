package net.maku.generator.common.aspect;

import lombok.extern.slf4j.Slf4j;
import net.maku.generator.common.annotation.EncryptParameter;
import net.maku.generator.common.utils.EncryptUtils;
import net.maku.generator.common.utils.Result;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * 处理参数加密解密切面
 *
 * @author 李淼 Milo 505754686@qq.com
 */
@Aspect
@Slf4j
@Component
public class EncryptParameterAspect {

    @Around("execution(* net.maku.generator.controller.DataSourceController.*(..))")
    public Object doProcess(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

        // 处理请求入参
        List<Object> methodArgs = this.getMethodArgs(proceedingJoinPoint);
        for (Object item : methodArgs) {
            if (item.getClass().getPackage().getName().startsWith("net.maku.generator.entity")) {
                handleItem(item, true);
            }
        }
        Object result = proceedingJoinPoint.proceed();

        // 处理返回值
        handleObject(result, false);
        return result;
    }

    /**
     * 获取方法的请求参数
     */
    private List<Object> getMethodArgs(ProceedingJoinPoint proceedingJoinPoint) {
        List<Object> methodArgs = new ArrayList<>();
        for (Object arg : proceedingJoinPoint.getArgs()) {
            if (null != arg) {
                methodArgs.add(arg);
            }
        }
        return methodArgs;
    }

    /**
     * 加密返回结果中的字段
     *
     * @param object
     * @throws Exception
     */
    private void handleObject(Object object, boolean isDecrypt) throws Exception {

        if (object instanceof Result) {
            Object item = ((Result<?>) object).getData();
            if (item.getClass().getPackage().getName().startsWith("net.maku.generator.entity")) {
                handleItem(item, isDecrypt);
            }
            if (item instanceof List){
                ((List<?>) item).forEach(f -> {
                    if (f.getClass().getPackage().getName().startsWith("net.maku.generator.entity")) {
                        try {
                            handleItem(f, isDecrypt);
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                    }
                });
            }

        }

    }

    /**
     * 加密/解密具体对象下的字段
     *
     * @param item      需要加解密的对象
     * @param isDecrypt true：解密，false：加密
     */
    private void handleItem(Object item, boolean isDecrypt) throws Exception {
        Field[] fields = item.getClass().getDeclaredFields();
        // 遍历所有字段
        for (Field field : fields) {
            // 若该字段被EncryptParameter注解,则进行解密/加密
            Class<?> fieldType = field.getType();
            if (fieldType == String.class && Objects.nonNull(AnnotationUtils.findAnnotation(field, EncryptParameter.class))) {
                // 设置private类型允许访问
                field.setAccessible(Boolean.TRUE);
                field.set(item, isDecrypt ? EncryptUtils.decrypt((String) field.get(item)) : EncryptUtils.encrypt((String) field.get(item)));
                field.setAccessible(Boolean.FALSE);
            }
        }
    }


}
