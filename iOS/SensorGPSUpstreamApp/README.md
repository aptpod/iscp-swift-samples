# Sensor & GPS Upstream App Sample
このサンプルアプリは、iOSデバイスのセンサーデータとGPSデータをintdashサーバーに送信する方法を示すサンプルです。
intdashへのログイン、送信エッジの選択、センサーデータの取得、データの送信、計測終了後の再送信までの一連の流れが実装されています。

※このアプリはiPhone、iPadの `実機のみ` で動作します。

## ■ このサンプルアプリが送信するデータ

- センサーデータ
  - データ名称: `acceleration`、 データ型: `vector_3d`
      - `./Classes/Config.swift/SENSOR_USER_ACCELERATION_DATA_ID` で定義されています。
  - データ名称: `gravity`、 データ型: `vector_3d`
      - `./Classes/Config.swift/SENSOR_GRAVITY_DATA_ID` で定義されています。
  - データ名称: `angular_velocity`、 データ型: `vector_3d`
      - `./Classes/Config.swift/SENSOR_ROTATION_RATE_DATA_ID` で定義されています。
  - データ名称: `orientation`、 データ型: `vector_3d`
      - `./Classes/Config.swift/SENSOR_ATTITUDE_DATA_ID` で定義されています。
- GPSデータ
  - データ名称: `geolocation_coordinates`、 データ型: `vector_2d`
      - `./Classes/Config.swift/GPS_COORDINATE_DATA_ID` で定義されています。
  - データ名称: `geolocation_heading`、 データ型: `float64`
      - `./Classes/Config.swift/GPS_TRUE_HEADING_DATA_ID` で定義されています。
