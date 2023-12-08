# EdgeConnectionEdge

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | エッジのUUID | 
**name** | **String** | エッジの名前 | 
**nickname** | **String** | エッジの表示名 | 
**description** | **String** | エッジの説明 | 
**disabled** | **Bool** | * &#x60;true&#x60; : このエッジは無効化されています。 * &#x60;false&#x60; : このエッジは有効です。 | 
**_internal** | **Bool** | * &#x60;true&#x60; : このエッジは内部エッジ（システム内部で使用される特別なエッジ）です。   このエッジの変更や削除はできません。 * &#x60;false&#x60; : このエッジは内部エッジではありません。 | 
**protected** | **Bool** | * &#x60;true&#x60; : このエッジは保護されています。このエッジの変更や削除はできません。 * &#x60;false&#x60; : このエッジは保護されていません。 | 
**type** | **String** | エッジのタイプ | 
**lastLoginAt** | **String** | エッジが最後にログインした日時 | 
**lastLivedAt** | **String** | サーバーがこのエッジ接続を確認できた最後の日時。 エッジとサーバーがWebSocketで接続されている間、この値は数秒おきに最新の日時に更新されます。 WebSocketが切断されると、それ以上更新されなくなります。 更新は数秒おきであるため、WebSocketが切断された場合に その切断の時刻が正確に記録されるわけではありません。 | 
**createdAt** | **String** | エッジが作成された日時 | 
**updatedAt** | **String** | エッジの最終更新日時 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


