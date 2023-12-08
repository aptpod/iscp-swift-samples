# CreateJpegRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**trim** | **Bool** | 時間範囲を指定してその部分のJPEGを作成する場合は &#x60;true&#x60; にします。 | [optional] 
**startOffset** | **Int** | 計測開始からのオフセット（マイクロ秒）。trimがtrueの場合は必須です。 | [optional] 
**duration** | **Int** | 長さ（マイクロ秒）。trimがtrueの場合は必須です。 | [optional] 
**fps** | **Float** | フレームレート。値が省略された場合は、元のデータと同じフレームレートが使用されます。 | [optional] 
**quality** | [**JpegQuality**](JpegQuality.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


