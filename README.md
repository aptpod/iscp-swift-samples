# iSCP 2.0 Client Library for Swift Samples

[iSCP 2.0 Client Library for Swift](https://github.com/aptpod/iscp-swift) を用いてアプリケーションを開発するためのサンプル集です。

## Requirements

- iOS 13 or later
- Xcode 13.0 (13A233) or later
- iSCP Swift v0.11.0
- intdash REST API v2.3.0 or later

## Sample Projects

- [Sensor GPS Upstream App](./iOS/SensorGPSUpstreamApp): iOSデバイスのセンサーデータとGPSデータを、intdashサーバーに送信するサンプルです。
- [Sensor GPS Downstream App](./iOS/SensorGPSDownstreamApp): 他のエッジからintdashサーバーに送信されているセンサーデータやGPSデータを、サーバーから受信し可視化するサンプルです。
- [Video Upstream App](./iOS/VideoUpstreamApp): iOSデバイスのカメラで動画を撮影しながらintdashサーバーにリアルタイムで送信するサンプルです。
- [Video Downstream App](./iOS/VideoDownstreamApp): 他のエッジからintdashサーバーに送信されている動画データを、サーバーから受信し可視化するサンプルです。
- [Accessing Measurement Data Sample](./iOS/AccessingMeasurementDataSample): intdashサーバーに保存されている過去のデータを取得するサンプルです。

※サンプルを利用するには `Common/Classes/Common.swift` と、利用するプロジェクトの `各プロジェクト/Classes/Config.swift` を修正する必要があります。
詳しくは、次の「Setup」を参照してください。

## Setup

サンプルアプリケーションを動作させるには事前準備が必要です。

1\. intdashサーバーの管理者からOAuth2.0のクライアントIDを入手します。  
（例：`abcdefg123456`）

2\. アクセスするintdashサーバーのURL、intdashサーバー上のプロジェクトID、入手したOAuth2.0のクライアントIDを定数に設定します。ファイル: [./iOS/Common/Classes/Common.swift](./iOS/Common/Classes/Common.swift)

```swift
/// アクセスするサーバー。
let kTargetServer: String = "https://example.com"

/// 利用するプロジェクトのID。特定のIDを指定するか、必要に応じて変更できるようにカスタマイズしてください。
let kProjectId: String = "00000000-0000-0000-0000-000000000000"

/// OAuth2.0認証用のクライアントID。intdashサーバー管理者に問い合わせてください。
let kIntdashClientId: String = "abcdefg123456"
```
3\. アプリケーションのコールバックスキーム名を決め、intdashサーバーの管理者にスキーム名の登録を依頼してください。  
（例： `companyname.appname`）

4\. アプリケーションに含まれる `Info.plist` の `URL Types` で、以下のようにコールバックスキームを登録します。  
例)
    
    |Key                |Type       |Value                             |
    |-------------------|-----------|----------------------------------|
    |- URL types        |Array      |                                  |
    | - Item 0 (Viewer) |Dictionary |                                  |
    |  - Document Role  |String     |Viewer                            |
    |  - URL identifier |String     |$(PRODUCT_BUNDLE_IDENTIFIER)      |
    |  - URL Schemes    |Array      |                                  |
    |   - Item 0        |String     |スキーム名（例：companyname.appname）   |

5\. アプリケーションに含まれる `Classes/Config.swift` 内で定義されている `CALLBACK_URL_SCHEME` にもコールバックスキームを設定してください。
例)

```swift
class Config {
    /// アプリごとのOAuth2.0 Web認証用のコールバックスキーム。
    public static let CALLBACK_URL_SCHEME: String = "companyname.appname://oauth2/callback"
    ...
}
```

## Commands to Generate Code

本リポジトリ内の一部のコードは、ツールにより生成されたものです。

- intdash REST APIクライアント

  `./intdash` ディレクトリ内のintdash REST APIクライアントは、[OpenAPI Generator](https://github.com/OpenAPITools/openapi-generator) を使って生成されました。
  生成用のコマンドは以下のとおりです。

  ```
  rm -rf intdash
  openapi-generator-cli version-manager set 5.3.0
  openapi-generator-cli generate -i openapi_public.yaml -g swift5 -o intdash --additional-properties=hashableModels=false,projectName=intdash,removeMigrationProjectNameClass=true
  ```

- データポイントの再アップロード用クラス

  保存されたデータポイントの再アップロードに利用する、`./iOS/Common/Classes/Backends/Protobuf` ディレクトリ内のクラスは、 [Swift Protobuf](https://github.com/apple/swift-protobuf) を使って生成されました。
  生成用のコマンドは以下のとおりです。

  ```
  protoc --swift_out=./iOS/Common/Classes/Backends/Protobuf ./protocol.proto
  ```
