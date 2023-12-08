# EdgeConnectionUpstream

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**streamId** | **Int** | アップストリームのストリームID | 
**measurementUuid** | **String** | アップストリームの計測UUID | 
**srcEdgeUuid** | **String** | アップストリームの送信元エッジUUID | 
**resend** | **Bool** | * &#x60;true&#x60; : このアップストリームは再送です。 * &#x60;false&#x60; : このアップストリームは再送ではありません。 | 
**store** | **Bool** | * &#x60;true&#x60; : このアップストリームで送信されたデータポイントはサーバーに保存されます。 * &#x60;false&#x60; : このアップストリームで送信されたデータポイントはサーバーに保存されません。 | 
**lastReceivedAt** | **String** | アップストリームで最後にデータポイントが送信された日時。 実際の最後のデータポイント送信よりも最大で10秒後の値となる場合があります。 | 
**receivedCloseRequest** | **Bool** | * &#x60;true&#x60; : このアップストリームについてのclose requestを受信済みです。 * &#x60;false&#x60; : このアップストリームについてのclose requestは受信していません。 | 
**createdAt** | **String** | アップストリームが作成された日時 | 
**updatedAt** | **String** | アップストリームの最終更新日時 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


