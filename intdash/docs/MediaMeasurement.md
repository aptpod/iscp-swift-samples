# MediaMeasurement

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | 計測のUUID | 
**name** | **String** | 計測の名前 | 
**description** | **String** | 計測の説明 | 
**basetime** | **String** | 計測の基準時刻（RFC3339形式） | 
**basetimeType** | [**MediaMeasurementBaseTimeType**](MediaMeasurementBaseTimeType.md) |  | 
**edgeUuid** | **String** | エッジのUUID | 
**duration** | **Int64** | 計測時間（ &#x60;max_elapsed_time&#x60; を使用してください） | 
**maxElapsedTime** | **Int64** | 計測時間（マイクロ秒） | [optional] 
**protected** | **Bool** | &#x60;true&#x60; の場合、計測は保護されています。保護されている計測は削除できません。 保護されている計測を削除したい場合は、まず保護を解除してください。 | 
**createdAt** | **Date** | 計測の作成日時 | 
**updatedAt** | **Date** | 計測の最終更新日時 | 
**processedRatio** | **Double** | 代わりに &#x60;sequences.received_sequence_numbers_ratio&#x60; を使用してください。処理済み率を表します。 | 
**ended** | **Bool** | 代わりに &#x60;sequences.status&#x60; を使用してください。エッジにおいてデータの取得が終了しているかどうかを示します。 | 
**status** | **String** | 代わりに &#x60;sequences.status&#x60; を使用してください。 計測のステータスを表します:   - measuring     - 計測中   - resending     - 再送中。計測（エッジにおけるデータの取得）は終了しましたが、エッジにデータが残っており、サーバーに再送中です。   - finished     - 完了。サーバーへのデータの回収が完了しています。 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


