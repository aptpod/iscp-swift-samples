# Video

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **UUID** | 動画（video）のUUID | 
**measurementUuid** | **UUID** | 計測のUUID | 
**measurement** | [**MediaMeasurement**](MediaMeasurement.md) |  | [optional] 
**edgeUuid** | **UUID** | エッジのUUID | 
**channel** | **Int** | チャンネル | 
**codec** | [**VideoCodecs**](VideoCodecs.md) |  | 
**sourceDataType** | [**VideoSourceDataType**](VideoSourceDataType.md) |  | 
**offsetTime** | **Int** | 計測開始からのオフセット（マイクロ秒） | 
**duration** | **Int** | 長さ（マイクロ秒） | 
**fps** | **Double** | フレームレート（fps） | 
**width** | **Int** | 動画の幅 | 
**height** | **Int** | 動画の高さ | 
**status** | [**VideoStatus**](VideoStatus.md) |  | 
**hls** | [**Playlist**](Playlist.md) |  | [optional] 
**mp4s** | [MP4] | この動画を変換して作成されたMP4のリスト | 
**jpegs** | [Jpeg] | この動画を変換して作成されたJPEGのリスト | 
**createdAt** | **Date** | 作成された日時 | 
**updatedAt** | **Date** | 最終更新日時 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


