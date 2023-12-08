//
// BrokerStreamAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class BrokerStreamAPI {

    /**
     Get Project Realtime Streaming Data
     
     - parameter projectUuid: (path) プロジェクトのUUID 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func projectStream(projectUuid: String, apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        projectStreamWithRequestBuilder(projectUuid: projectUuid).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Project Realtime Streaming Data
     - GET /v1/projects/{project_uuid}/stream
     - WebSocketを使ってリアルタイムデータを取得します。  同じくWebSocketを使ってリアルタイムデータを扱う `/v1/ws/measurements` では、 iSCP (intdash Stream Control Protocol)を使用しますが、 本エンドポイントではJSONとしてデータポイントを取得することができます。 ## クエリパラメータ  | パラメータ名     | 型                         | 必須       | デフォルト | 説明  | | ---------------- | -------------------------- | ---------- | ---------- | ----- | | flush_interval   | string                     | true       | -          | メッセージがフラッシュされる間隔を指定します。 単位は\"ns\"、\"us\" (または\"µs\")、\"ms\"、\"s\"、\"m\"、\"h\"のいずれかを使用してください （参考: [Goのtimeパッケージ](https://golang.org/pkg/time/#ParseDuration)）。 指定がない場合は、メッセージごとにフラッシュされます。 |  ## メッセージのフォーマット ###  JSON Lines リクエストメッセージおよびレスポンスメッセージには [JSON lines](http://jsonlines.org/) 形式を使用します。 1つのメッセージが1行です。  例: ``` { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} . .  ``` 注意: メッセージに改行を含むことはできません。 改行が入ったメッセージの例（悪い例）: ``` {   \"type\" : \"message_type\",   \"contents\" : { depends on message_type } } ```  メッセージには、 `type` 属性および `contents` 属性が必要です。 `contents` のスキーマは、 `type` により決定されます。 ## ダウンストリーム開始リクエスト ### ダウンストリーム開始リクエストメッセージのスキーマ | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ------- | | id               | number                   | false      | -                 | idに指定した値は、レスポンスの `ack` 属性として返ります。 | | type             | string                   | true       | `\"open_downstream\"` | 固定値  | | contents         | object（次の表を参照）   | true       | -                 |         |  ### ダウンストリーム開始リクエスト内 `contents` のスキーマ | 属性名           | 型                       | 必須       | デフォルト         | 説明   | | ---------------- | ------------------------ | ---------- | ------------------ | ------ | | edge             | string                   | true       | -                  | データの送信元エッジを、エッジのUUIDまたはエッジの名前で指定します。 最初に、一致するエッジUUIDが検索され、一致するエッジUUIDがなければ一致する名前が検索されます。 | | filter           | string array             | false      | `[]`               | 「フィルター」を参照してください。 |  ### フィルター データコードとデータ名を指定することにより、指定にマッチしたデータポイントだけを受信することができます。 ただし、メタデータのデータポイントは、フィルターの設定に関係なくすべて受信されます。  フィルターは以下のフォーマットで設定します: `<型コード>:<データ名>` データコードについては、後述の 時系列データのペイロードフォーマット を参照してください。 フィルター設定文字列の各セグメントにはワイルドカード( `**` )を使用することができます。  例: - 型コードが `can_data_field` のデータポイント（CAN）を受信する -> `can_data_field:**` - 型コードが `string/` で始まるデータポイントを受信する（`string/json` 、 `string/csv` など） -> `string/_**:**` - 文字列のデータポイントのうち、データ名が `my-string` のものを受信する -> `string:my-string`  `filter` として空の配列が指定された場合は、すべてのデータポイントを受信します。  ### ダウンストリーム開始リクエストの例 リクエスト: ``` { \"type\" : \"open_downstream\", \"contents\" : { \"edge\" : \"edge_name_or_uuid\", \"filter\" : [\"string:a/b\"] } } ``` レスポンス（レスポンスの詳細については、「レスポンス」を参照してください）:  ``` { \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: open downstream\" } } ```  ## ダウンストリーム更新リクエスト ### ダウンストリーム更新リクエストメッセージのスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ------- | | id               | number                   | false      | -                 | idに指定した値は、レスポンスの `ack` 属性として返ります。 | | type             | string                   | true       | `\"update_downstream\"`  | 固定値  | | contents         | object（次の表を参照）   | true       | -                 |         |  ### ダウンストリーム更新リクエスト内 `contents` のスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ------- | | filter           | string array             | true       | -                 |「フィルター」を参照してください。 |  ### ダウンストリーム更新リクエストの例 フィルターを指定する場合のリクエスト: ``` { \"type\" : \"update_downstream\", \"contents\" : { \"filter\" : [\"string:a/b\"] } } ```  フィルターを指定せずすべてのデータポイントを受信する場合のリクエスト: ``` { \"type\" : \"update_downstream\", \"contents\" : { \"filter\" : [] } } ```  レスポンス（レスポンスの詳細については、「レスポンス」を参照してください）:  ``` { \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: update downstream\" } } ```  ## ダウンストリーム終了リクエスト ### ダウンストリーム終了リクエストメッセージのスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ------- | | id               | number                   | false      | -                 | idに指定した値は、レスポンスの `ack` 属性として返ります。  | | type             | string                   | true       | `\"close_downstream\"` | 固定値|  ### ダウンストリーム終了リクエストの例 リクエスト: ``` { \"type\" : \"close_downstream\"} ``` レスポンス（レスポンスの詳細については、「レスポンス」を参照してください）: ``` { \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: close downstream\" } } ```  ## レスポンスメッセージ リクエストの処理結果が返却されます。 ### レスポンスメッセージのスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ----- | | type             | string                   | true       | `\"response\"`      | 固定値| | ack              | number                   | false      | -                 | リクエストで `id` が指定されていた場合、その値 | | contents         | object（次の表を参照）   | true       | -                 |       |  ### レスポンス内 `contents` のスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ----- | | code             | number                   | true       | -                 | 10000 < code < 20000 の場合、成功。 20000 < code < 30000 の場合、不正なリクエスト。50000 < code の場合、予期しないエラー | | message          | string                   | true       | -                 | リクエストで `id` が指定されていた場合、その値 |  ### レスポンスの例 ``` { \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: open downstream\" } } ```  リクエストで `id` が指定されている場合のレスポンス例（ `id` の値が `ack` として返ります）:  ``` { \"ack\": 1, \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: open downstream\" } } ``` # 時系列データのペイロードフォーマット 時系列データポイントが格納するペイロードのフォーマットです。各データ型に対する `contents`のフォーマットは [このページ](https://git.aptpod.co.jp/intdash-protocol/dataformat/-/tree/master/data) を参照してください。 ## データ型 各データバイナリには、ペイロードのフォーマットを示すデータ型が付与されます。各データ型には、型を識別するためのコード名が割り当てられます。 ## 標準データ型 単一のデータを格納するデータ型です。  |          名称           |  コード   | バイト長 |             説明             | | :---------------------- | :-------- | :------: | :--------------------------- | | Bytes     | `bytes`   |   可変   | フォーマットなしバイト列     | | String    | `string`  |   可変   | フォーマットなし文字列       | | Float64   | `float64` |    8     | IEEE754 64ビット浮動小数点数 | | Int64     | `int64`   |    8     | 符号付き 64ビット整数        | | Bool      | `bool`    |    1     | 真偽値                       |  ## メディアデータ型 メディア（動画/音声）関連のデータを格納するデータ型です。  |          名称           |    コード    | バイト長 |            説明            | | :---------------------- | :----------- | :------: | :------------------------- | | JPEG | `video/jpeg` |   可変   | JPEG 形式の画像データ      | | H264 | `video/h264` |   可変   | H264 形式の映像データ      |  ### 拡張バイナリ型 フォーマット付きのバイナリデータを格納するデータ型です。  |                       名称                        |      コード       | バイト長 |                   説明                    | | :------------------------------------------------ | :---------------- | :------: | :---------------------------------------- | | BSON                                 | `bson`            |   可変   | BSON フォーマット                         | | CAN Frame                            | `can_frame`       |   可変   | CAN フレーム フォーマット                 | | CAN Data Field                       | `can_data_field`  |   可変   | CAN データフィールド フォーマット         | | MAVLink1 Packet                      | `mavlink1_packet` |   可変   | MAVLink パケット フォーマット             | | Generic (非推奨)                     | `generic`         |   可変   | iSCPv1互換 汎用フォーマット               | | Controlpad (非推奨)                  | `control_pad`     |   可変   | iSCPv1互換 コントロールパッドフォーマット | | GeneralSensor (非推奨)               | `general_sensor`  |   可変   | iSCPv1互換 汎用センサーフォーマット       |  ### 拡張文字列型 フォーマット付きの文字列データを格納するデータ型です。  |           名称           |    コード     | バイト長 |       説明        | | :----------------------- | :------------ | :------: | :---------------- | | JSON | `string/json`     |   可変   | JSON フォーマット | | CSV   | `string/csv`     |   可変   | CSV フォーマット  | | NMEA | `string/nmea`     |   可変   | NMEA フォーマット |
     - parameter projectUuid: (path) プロジェクトのUUID 
     - returns: RequestBuilder<Void> 
     */
    open class func projectStreamWithRequestBuilder(projectUuid: String) -> RequestBuilder<Void> {
        var localVariablePath = "/v1/projects/{project_uuid}/stream"
        let projectUuidPreEscape = "\(APIHelper.mapValueToPathItem(projectUuid))"
        let projectUuidPostEscape = projectUuidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{project_uuid}", with: projectUuidPostEscape, options: .literal, range: nil)
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = intdashAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get Realtime Streaming Data
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func stream(apiResponseQueue: DispatchQueue = intdashAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        streamWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Realtime Streaming Data
     - GET /v1/stream
     - WebSocketを使ってリアルタイムデータを取得します。  同じくWebSocketを使ってリアルタイムデータを扱う `/v1/ws/measurements` では、 iSCP (intdash Stream Control Protocol)を使用しますが、 本エンドポイントではJSONとしてデータポイントを取得することができます。 ## クエリパラメータ  | パラメータ名     | 型                         | 必須       | デフォルト | 説明  | | ---------------- | -------------------------- | ---------- | ---------- | ----- | | flush_interval   | string                     | true       | -          | メッセージがフラッシュされる間隔を指定します。 単位は\"ns\"、\"us\" (または\"µs\")、\"ms\"、\"s\"、\"m\"、\"h\"のいずれかを使用してください （参考: [Goのtimeパッケージ](https://golang.org/pkg/time/#ParseDuration)）。 指定がない場合は、メッセージごとにフラッシュされます。 |  ## メッセージのフォーマット ###  JSON Lines リクエストメッセージおよびレスポンスメッセージには [JSON lines](http://jsonlines.org/) 形式を使用します。 1つのメッセージが1行です。  例: ``` { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} { \"type\" : \"message_type\", \"contents\" : { depends on message_type }} . .  ``` 注意: メッセージに改行を含むことはできません。 改行が入ったメッセージの例（悪い例）: ``` {   \"type\" : \"message_type\",   \"contents\" : { depends on message_type } } ```  メッセージには、 `type` 属性および `contents` 属性が必要です。 `contents` のスキーマは、 `type` により決定されます。 ## ダウンストリーム開始リクエスト ### ダウンストリーム開始リクエストメッセージのスキーマ | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ------- | | id               | number                   | false      | -                 | idに指定した値は、レスポンスの `ack` 属性として返ります。 | | type             | string                   | true       | `\"open_downstream\"` | 固定値  | | contents         | object（次の表を参照）   | true       | -                 |         |  ### ダウンストリーム開始リクエスト内 `contents` のスキーマ | 属性名           | 型                       | 必須       | デフォルト         | 説明   | | ---------------- | ------------------------ | ---------- | ------------------ | ------ | | edge             | string                   | true       | -                  | データの送信元エッジを、エッジのUUIDまたはエッジの名前で指定します。 最初に、一致するエッジUUIDが検索され、一致するエッジUUIDがなければ一致する名前が検索されます。 | | filter           | string array             | false      | `[]`               | 「フィルター」を参照してください。 |  ### フィルター データコードとデータ名を指定することにより、指定にマッチしたデータポイントだけを受信することができます。 ただし、メタデータのデータポイントは、フィルターの設定に関係なくすべて受信されます。  フィルターは以下のフォーマットで設定します: `<型コード>:<データ名>` データコードについては、後述の 時系列データのペイロードフォーマット を参照してください。 フィルター設定文字列の各セグメントにはワイルドカード( `**` )を使用することができます。  例: - 型コードが `can_data_field` のデータポイント（CAN）を受信する -> `can_data_field:**` - 型コードが `string/` で始まるデータポイントを受信する（`string/json` 、 `string/csv` など） -> `string/_**:**` - 文字列のデータポイントのうち、データ名が `my-string` のものを受信する -> `string:my-string`  `filter` として空の配列が指定された場合は、すべてのデータポイントを受信します。  ### ダウンストリーム開始リクエストの例 リクエスト: ``` { \"type\" : \"open_downstream\", \"contents\" : { \"edge\" : \"edge_name_or_uuid\", \"filter\" : [\"string:a/b\"] } } ``` レスポンス（レスポンスの詳細については、「レスポンス」を参照してください）:  ``` { \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: open downstream\" } } ```  ## ダウンストリーム更新リクエスト ### ダウンストリーム更新リクエストメッセージのスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ------- | | id               | number                   | false      | -                 | idに指定した値は、レスポンスの `ack` 属性として返ります。 | | type             | string                   | true       | `\"update_downstream\"`  | 固定値  | | contents         | object（次の表を参照）   | true       | -                 |         |  ### ダウンストリーム更新リクエスト内 `contents` のスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ------- | | filter           | string array             | true       | -                 |「フィルター」を参照してください。 |  ### ダウンストリーム更新リクエストの例 フィルターを指定する場合のリクエスト: ``` { \"type\" : \"update_downstream\", \"contents\" : { \"filter\" : [\"string:a/b\"] } } ```  フィルターを指定せずすべてのデータポイントを受信する場合のリクエスト: ``` { \"type\" : \"update_downstream\", \"contents\" : { \"filter\" : [] } } ```  レスポンス（レスポンスの詳細については、「レスポンス」を参照してください）:  ``` { \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: update downstream\" } } ```  ## ダウンストリーム終了リクエスト ### ダウンストリーム終了リクエストメッセージのスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ------- | | id               | number                   | false      | -                 | idに指定した値は、レスポンスの `ack` 属性として返ります。  | | type             | string                   | true       | `\"close_downstream\"` | 固定値|  ### ダウンストリーム終了リクエストの例 リクエスト: ``` { \"type\" : \"close_downstream\"} ``` レスポンス（レスポンスの詳細については、「レスポンス」を参照してください）: ``` { \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: close downstream\" } } ```  ## レスポンスメッセージ リクエストの処理結果が返却されます。 ### レスポンスメッセージのスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ----- | | type             | string                   | true       | `\"response\"`      | 固定値| | ack              | number                   | false      | -                 | リクエストで `id` が指定されていた場合、その値 | | contents         | object（次の表を参照）   | true       | -                 |       |  ### レスポンス内 `contents` のスキーマ  | 属性名           | 型                       | 必須       | デフォルト        | 説明    | | ---------------- | ------------------------ | ---------- | ----------------- | ----- | | code             | number                   | true       | -                 | 10000 < code < 20000 の場合、成功。 20000 < code < 30000 の場合、不正なリクエスト。50000 < code の場合、予期しないエラー | | message          | string                   | true       | -                 | リクエストで `id` が指定されていた場合、その値 |  ### レスポンスの例 ``` { \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: open downstream\" } } ```  リクエストで `id` が指定されている場合のレスポンス例（ `id` の値が `ack` として返ります）:  ``` { \"ack\": 1, \"type\" : \"response\", \"contents\": { \"code\" : 10000, \"message\": \"succeed: open downstream\" } } ``` # 時系列データのペイロードフォーマット 時系列データポイントが格納するペイロードのフォーマットです。各データ型に対する `contents`のフォーマットは [このページ](https://git.aptpod.co.jp/intdash-protocol/dataformat/-/tree/master/data) を参照してください。 ## データ型 各データバイナリには、ペイロードのフォーマットを示すデータ型が付与されます。各データ型には、型を識別するためのコード名が割り当てられます。 ## 標準データ型 単一のデータを格納するデータ型です。  |          名称           |  コード   | バイト長 |             説明             | | :---------------------- | :-------- | :------: | :--------------------------- | | Bytes     | `bytes`   |   可変   | フォーマットなしバイト列     | | String    | `string`  |   可変   | フォーマットなし文字列       | | Float64   | `float64` |    8     | IEEE754 64ビット浮動小数点数 | | Int64     | `int64`   |    8     | 符号付き 64ビット整数        | | Bool      | `bool`    |    1     | 真偽値                       |  ## メディアデータ型 メディア（動画/音声）関連のデータを格納するデータ型です。  |          名称           |    コード    | バイト長 |            説明            | | :---------------------- | :----------- | :------: | :------------------------- | | JPEG | `video/jpeg` |   可変   | JPEG 形式の画像データ      | | H264 | `video/h264` |   可変   | H264 形式の映像データ      |  ### 拡張バイナリ型 フォーマット付きのバイナリデータを格納するデータ型です。  |                       名称                        |      コード       | バイト長 |                   説明                    | | :------------------------------------------------ | :---------------- | :------: | :---------------------------------------- | | BSON                                 | `bson`            |   可変   | BSON フォーマット                         | | CAN Frame                            | `can_frame`       |   可変   | CAN フレーム フォーマット                 | | CAN Data Field                       | `can_data_field`  |   可変   | CAN データフィールド フォーマット         | | MAVLink1 Packet                      | `mavlink1_packet` |   可変   | MAVLink パケット フォーマット             | | Generic (非推奨)                     | `generic`         |   可変   | iSCPv1互換 汎用フォーマット               | | Controlpad (非推奨)                  | `control_pad`     |   可変   | iSCPv1互換 コントロールパッドフォーマット | | GeneralSensor (非推奨)               | `general_sensor`  |   可変   | iSCPv1互換 汎用センサーフォーマット       |  ### 拡張文字列型 フォーマット付きの文字列データを格納するデータ型です。  |           名称           |    コード     | バイト長 |       説明        | | :----------------------- | :------------ | :------: | :---------------- | | JSON | `string/json`     |   可変   | JSON フォーマット | | CSV   | `string/csv`     |   可変   | CSV フォーマット  | | NMEA | `string/nmea`     |   可変   | NMEA フォーマット |
     - returns: RequestBuilder<Void> 
     */
    open class func streamWithRequestBuilder() -> RequestBuilder<Void> {
        let localVariablePath = "/v1/stream"
        let localVariableURLString = intdashAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = intdashAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}