package net.maku.generator.service;

import java.util.zip.ZipOutputStream;

/**
 * 代码生成
 *
 * @author 阿沐 babamu@126.com
 */
public interface GeneratorService {

    void downloadCode(Long tableId, ZipOutputStream zip);

    void generatorCode(Long tableId);
}
