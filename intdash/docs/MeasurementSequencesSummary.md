# MeasurementSequencesSummary

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**receivedChunksRatio** | **Double** | 計測シーケンス回収率。計測内に含まれる計測シーケンスのうち、 サーバーへの保存が完了した計測シーケンスの割合です。 | [optional] 
**receivedDataPoints** | **Int** | サーバーが受信したデータポイントの数 | [optional] 
**expectedDataPoints** | **Int** | サーバーが受信することが想定されるデータポイントの総数（既に受信済みのデータポイントを含む） | [optional] 
**status** | **String** | 計測のステータス:   - ready     - 計測準備中   - measuring     - 計測中   - resending     - 再送中。計測（エッジにおけるデータの取得）は終了しましたが、エッジにデータが残っており、サーバーに再送中です。   - finished（非推奨。段階的にcompletedへ移行）     - 完了。サーバーへのデータの回収が完了しています。   - completed     - 完了。サーバーへのデータの回収が完了しています。 | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


