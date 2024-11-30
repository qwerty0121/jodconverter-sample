# jodconverter-sample

## 概要

JODConverterを利用するコードのサンプル。

## ビルド方法

```bash
mvn clean package
```

## 実行方法

### JODConverterでLibreOfficeプロセスを管理する場合

```bash
# 変換処理: Excel->PDF
mvn exec:java -Dexec.mainClass="com.qwerty0121.jodconverter.sample.LocalOfficeManagerSample"
```

### JODConverterでLibreOfficeプロセスを管理しない場合

```bash
# 手動でLibreOfficeを起動
soffice --headless --accept="socket,host=127.0.0.1,port=2003;urp;"

# 変換処理: Excel->PDF
mvn exec:java -Dexec.mainClass="com.qwerty0121.jodconverter.sample.ExternalOfficeManagerSample"
```
