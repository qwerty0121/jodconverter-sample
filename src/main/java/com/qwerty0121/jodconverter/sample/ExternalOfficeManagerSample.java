package com.qwerty0121.jodconverter.sample;

import java.io.File;

import org.jodconverter.core.office.OfficeUtils;
import org.jodconverter.local.JodConverter;
import org.jodconverter.local.office.ExternalOfficeManager;

/**
 * ExternalOfficeManagerを利用してExcelファイルをPDFファイルに変換するサンプル実装
 */
public class ExternalOfficeManagerSample {
    public static void main(String[] args) throws Exception {
        var officeManger = ExternalOfficeManager.builder().install().portNumbers(2003).build();

        try {
            officeManger.start();

            // Excelファイル
            var template = ExternalOfficeManagerSample.class.getClassLoader().getResourceAsStream("template.xlsx");
            // 出力先
            var report = new File("output/invoice.pdf");

            // 変換: Excel -> PDF
            JodConverter.convert(template).to(report).execute();
        } finally {
            OfficeUtils.stopQuietly(officeManger);
        }
    }
}
