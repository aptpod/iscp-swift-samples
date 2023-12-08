# User

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | ユーザーのUUID | 
**name** | **String** | ユーザーの名前 | 
**nickname** | **String** | ユーザーの表示名 | 
**disabled** | **Bool** | * &#x60;true&#x60;: このユーザーは無効化されています * &#x60;false&#x60; : このユーザーは有効です。 | 
**description** | **String** | ユーザーの説明 | 
**isSuper** | **Bool** | &#x60;true&#x60; の場合、このユーザーはスーパーユーザーです。 | 
**emails** | [UserEmail] |  | 
**lastSignInAt** | **Date** | 最後にログインした日時 | 
**roles** | **[String]** | 割り当てられたロールのUUID | 
**password** | [**UserPassword**](UserPassword.md) |  | 
**createdAt** | **Date** | 作成日時 | 
**updatedAt** | **Date** | 最終更新日時 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


