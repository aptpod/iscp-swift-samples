# EdgeConnectionDownstream

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**streamId** | **Int** | ダウンストリームのストリームID | 
**srcEdgeUuid** | **String** | ダウンストリームの送信元エッジUUID | 
**dstEdgeUuid** | **String** | ダウンストリームの宛先エッジUUID | 
**lastReceivedAt** | **String** | ダウンストリームで最後にデータポイントが受信された日時。 実際の最後のデータポイントの受信よりも最大で10秒後の値となる場合があります。 | 
**receivedCloseRequest** | **Bool** | * &#x60;true&#x60; : このダウンストリームについてのclose requestを受信済みです。 * &#x60;false&#x60; : このダウンストリームについてのclose requestを受信していません。 | 
**createdAt** | **String** | ダウンストリームが作成された日時 | 
**updatedAt** | **String** | ダウンストリームの最終更新日時 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


