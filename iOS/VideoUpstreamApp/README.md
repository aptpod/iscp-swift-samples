# Video Upstream App Sample
このサンプルアプリは、動画データ（JPEG）をintdashサーバーに送信する方法を示すサンプルです。
intdashへのログイン、送信エッジの選択、動画データの取得、データの送信、計測終了後の再送信までの一連の流れが実装されています。

※このサンプルではH.264やH.265のような高度なエンコード方法は実装されていません。

※このアプリはiPhone、iPadの `実機のみ` で動作します。

## ■ このサンプルアプリが送信するデータ

- データ名称: `jpeg`、 データ型: `jpeg`
    - `./Classes/Config.swift/JPEG_DATA_ID` で定義されています。

※ H.264による動画データの送信や、PCMやAACによる音声データの送信は、このサンプルアプリの方法ではできません。intdash Media SDK for Swift-iOSを使用する必要があります。
