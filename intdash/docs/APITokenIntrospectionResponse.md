# APITokenIntrospectionResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**active** | **Bool** | &#x60;true&#x60; の場合、このAPIトークンは有効です。 | 
**tenantId** | **Int64** | テナントID。デフォルトテナント以外を対象とする場合にのみ返されます。 | [optional] 
**userUuid** | **String** | ユーザーのUUID | [optional] 
**scopes** | [Scope] | APIトークンが認可されているスコープ | [optional] 
**expiredAt** | **Date** | APIトークンの有効期限 | [optional] 
**createdAt** | **Date** | APIトークンの作成日時 | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


