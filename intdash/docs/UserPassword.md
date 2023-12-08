# UserPassword

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**attemptCount** | **Int64** | ログイン失敗回数。ログインに成功すると0にリセットされます。 | 
**isTemporary** | **Bool** | &#x60;true&#x60; の場合、このユーザーのパスワードは一時パスワードです。 | 
**temporaryPassword** | **String** | 一時パスワード | [optional] 
**lastAttemptAt** | **Date** | 最終ログイン試行日時 | 
**expiredAt** | **Date** | パスワードの有効期限 | [optional] 
**createdAt** | **Date** | 作成日時 | 
**updatedAt** | **Date** | 最終更新日時 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


