# DataPointNormal

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**time** | [**DataPointTime**](DataPointTime.md) |  | 
**measurementUuid** | **String** | このデータポイントが含まれる計測のUUID | 
**createdAt** | **String** | このデータポイントが作成された日時 | 
**dataType** | **String** | データタイプ | 
**dataId** | **String** | データID | 
**data** | [**AnyCodable**](.md) | データのペイロード。ペイロードのJSON表現はデータタイプによって異なります。 [詳説iSCP 1.0](https://docs.intdash.jp/manual/iscp1-essentials/latest/ja/iscp1-essentials-ja.pdf) の「付録: データタイプとペイロードの定義」を参照してください。 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


