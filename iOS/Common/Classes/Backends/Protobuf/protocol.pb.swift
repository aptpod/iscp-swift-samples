// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: protocol.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Pb_DataResponseProto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var time: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _time ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_time = newValue}
  }
  /// Returns true if `time` has been explicitly set.
  var hasTime: Bool {return self._time != nil}
  /// Clears the value of `time`. Subsequent reads from it will return its default value.
  mutating func clearTime() {self._time = nil}

  var dataType: String = String()

  var dataID: String = String()

  var dataPayload: Data = Data()

  var measurementUuid: String = String()

  var createdAt: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _createdAt ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_createdAt = newValue}
  }
  /// Returns true if `createdAt` has been explicitly set.
  var hasCreatedAt: Bool {return self._createdAt != nil}
  /// Clears the value of `createdAt`. Subsequent reads from it will return its default value.
  mutating func clearCreatedAt() {self._createdAt = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _time: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
  fileprivate var _createdAt: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

struct Pb_DomainEventProto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var measUuid: String = String()

  var occurredAt: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _occurredAt ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_occurredAt = newValue}
  }
  /// Returns true if `occurredAt` has been explicitly set.
  var hasOccurredAt: Bool {return self._occurredAt != nil}
  /// Clears the value of `occurredAt`. Subsequent reads from it will return its default value.
  mutating func clearOccurredAt() {self._occurredAt = nil}

  var eventContent: Pb_DomainEventProto.OneOf_EventContent? = nil

  var measurementUpdated: SwiftProtobuf.Google_Protobuf_Empty {
    get {
      if case .measurementUpdated(let v)? = eventContent {return v}
      return SwiftProtobuf.Google_Protobuf_Empty()
    }
    set {eventContent = .measurementUpdated(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_EventContent: Equatable {
    case measurementUpdated(SwiftProtobuf.Google_Protobuf_Empty)

  #if !swift(>=4.1)
    static func ==(lhs: Pb_DomainEventProto.OneOf_EventContent, rhs: Pb_DomainEventProto.OneOf_EventContent) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.measurementUpdated, .measurementUpdated): return {
        guard case .measurementUpdated(let l) = lhs, case .measurementUpdated(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      }
    }
  #endif
  }

  init() {}

  fileprivate var _occurredAt: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

struct Pb_StoreProto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var measUuid: String = String()

  /// 代わりに `sections` を使用して下さい。sectionsを使用された場合、この属性は無視します。
  var serialNumber: UInt32 = 0

  var measEnd: Bool = false

  /// 代わりに `sections` を使用して下さい。sectionsを使用された場合、この属性は無視します。
  var sectionEnd: Bool = false

  /// 代わりに `sections` を使用して下さい。sectionsを使用された場合、この属性は無視します。
  var sectionTotalCount: SwiftProtobuf.Google_Protobuf_UInt32Value {
    get {return _sectionTotalCount ?? SwiftProtobuf.Google_Protobuf_UInt32Value()}
    set {_sectionTotalCount = newValue}
  }
  /// Returns true if `sectionTotalCount` has been explicitly set.
  var hasSectionTotalCount: Bool {return self._sectionTotalCount != nil}
  /// Clears the value of `sectionTotalCount`. Subsequent reads from it will return its default value.
  mutating func clearSectionTotalCount() {self._sectionTotalCount = nil}

  /// 代わりに `sections` を使用して下さい。sectionsを使用された場合、この属性は無視します。
  var dataPoints: [Pb_DataPointProto] = []

  var sections: [Pb_SectionProto] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _sectionTotalCount: SwiftProtobuf.Google_Protobuf_UInt32Value? = nil
}

struct Pb_SectionProto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var serialNumber: UInt32 = 0

  var sectionEnd: Bool = false

  var sectionTotalCount: SwiftProtobuf.Google_Protobuf_UInt32Value {
    get {return _sectionTotalCount ?? SwiftProtobuf.Google_Protobuf_UInt32Value()}
    set {_sectionTotalCount = newValue}
  }
  /// Returns true if `sectionTotalCount` has been explicitly set.
  var hasSectionTotalCount: Bool {return self._sectionTotalCount != nil}
  /// Clears the value of `sectionTotalCount`. Subsequent reads from it will return its default value.
  mutating func clearSectionTotalCount() {self._sectionTotalCount = nil}

  var dataPoints: [Pb_DataPointProto] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _sectionTotalCount: SwiftProtobuf.Google_Protobuf_UInt32Value? = nil
}

struct Pb_DataPointProto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var elapsedTime: Int64 = 0

  var channel: UInt32 = 0

  var dataType: UInt32 = 0

  var dataPayload: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Pb_StoreDataChunks {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var measUuid: String = String()

  var sequenceUuid: String = String()

  var chunks: [Pb_StoreDataChunk] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Pb_StoreDataChunk {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sequenceNumber: UInt32 = 0

  var dataPointGroups: [Pb_StoreDataPointGroup] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Pb_StoreDataPointGroup {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// データID
  var dataID: Pb_StoreDataID {
    get {return _dataID ?? Pb_StoreDataID()}
    set {_dataID = newValue}
  }
  /// Returns true if `dataID` has been explicitly set.
  var hasDataID: Bool {return self._dataID != nil}
  /// Clears the value of `dataID`. Subsequent reads from it will return its default value.
  mutating func clearDataID() {self._dataID = nil}

  /// データポイント
  var dataPoints: [Pb_StoreDataPoint] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _dataID: Pb_StoreDataID? = nil
}

struct Pb_StoreDataPoint {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// 経過時間
  var elapsedTime: Int64 = 0

  /// ペイロード
  var payload: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Pb_StoreDataID {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// 名称
  var name: String = String()

  /// 型
  var type: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Pb_MeasSequenceChunks {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// シーケンスチャンク
  var chunks: [Pb_MeasSequenceChunk] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Pb_MeasSequenceChunk {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// シーケンス番号
  var sequenceNumber: UInt32 = 0

  /// データポイントグループ
  var dataPointGroups: [Pb_StoreDataPointGroup] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Pb_DataResponseProto: @unchecked Sendable {}
extension Pb_DomainEventProto: @unchecked Sendable {}
extension Pb_DomainEventProto.OneOf_EventContent: @unchecked Sendable {}
extension Pb_StoreProto: @unchecked Sendable {}
extension Pb_SectionProto: @unchecked Sendable {}
extension Pb_DataPointProto: @unchecked Sendable {}
extension Pb_StoreDataChunks: @unchecked Sendable {}
extension Pb_StoreDataChunk: @unchecked Sendable {}
extension Pb_StoreDataPointGroup: @unchecked Sendable {}
extension Pb_StoreDataPoint: @unchecked Sendable {}
extension Pb_StoreDataID: @unchecked Sendable {}
extension Pb_MeasSequenceChunks: @unchecked Sendable {}
extension Pb_MeasSequenceChunk: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "pb"

extension Pb_DataResponseProto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DataResponseProto"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "time"),
    2: .standard(proto: "data_type"),
    3: .standard(proto: "data_id"),
    4: .standard(proto: "data_payload"),
    5: .standard(proto: "measurement_uuid"),
    6: .standard(proto: "created_at"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._time) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.dataType) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.dataID) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.dataPayload) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.measurementUuid) }()
      case 6: try { try decoder.decodeSingularMessageField(value: &self._createdAt) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._time {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.dataType.isEmpty {
      try visitor.visitSingularStringField(value: self.dataType, fieldNumber: 2)
    }
    if !self.dataID.isEmpty {
      try visitor.visitSingularStringField(value: self.dataID, fieldNumber: 3)
    }
    if !self.dataPayload.isEmpty {
      try visitor.visitSingularBytesField(value: self.dataPayload, fieldNumber: 4)
    }
    if !self.measurementUuid.isEmpty {
      try visitor.visitSingularStringField(value: self.measurementUuid, fieldNumber: 5)
    }
    try { if let v = self._createdAt {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_DataResponseProto, rhs: Pb_DataResponseProto) -> Bool {
    if lhs._time != rhs._time {return false}
    if lhs.dataType != rhs.dataType {return false}
    if lhs.dataID != rhs.dataID {return false}
    if lhs.dataPayload != rhs.dataPayload {return false}
    if lhs.measurementUuid != rhs.measurementUuid {return false}
    if lhs._createdAt != rhs._createdAt {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_DomainEventProto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DomainEventProto"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "meas_uuid"),
    2: .standard(proto: "occurred_at"),
    3: .standard(proto: "measurement_updated"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.measUuid) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._occurredAt) }()
      case 3: try {
        var v: SwiftProtobuf.Google_Protobuf_Empty?
        var hadOneofValue = false
        if let current = self.eventContent {
          hadOneofValue = true
          if case .measurementUpdated(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.eventContent = .measurementUpdated(v)
        }
      }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.measUuid.isEmpty {
      try visitor.visitSingularStringField(value: self.measUuid, fieldNumber: 1)
    }
    try { if let v = self._occurredAt {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if case .measurementUpdated(let v)? = self.eventContent {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_DomainEventProto, rhs: Pb_DomainEventProto) -> Bool {
    if lhs.measUuid != rhs.measUuid {return false}
    if lhs._occurredAt != rhs._occurredAt {return false}
    if lhs.eventContent != rhs.eventContent {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_StoreProto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".StoreProto"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "meas_uuid"),
    2: .standard(proto: "serial_number"),
    3: .standard(proto: "meas_end"),
    4: .standard(proto: "section_end"),
    5: .standard(proto: "section_total_count"),
    6: .standard(proto: "data_points"),
    7: .same(proto: "sections"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.measUuid) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.serialNumber) }()
      case 3: try { try decoder.decodeSingularBoolField(value: &self.measEnd) }()
      case 4: try { try decoder.decodeSingularBoolField(value: &self.sectionEnd) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._sectionTotalCount) }()
      case 6: try { try decoder.decodeRepeatedMessageField(value: &self.dataPoints) }()
      case 7: try { try decoder.decodeRepeatedMessageField(value: &self.sections) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.measUuid.isEmpty {
      try visitor.visitSingularStringField(value: self.measUuid, fieldNumber: 1)
    }
    if self.serialNumber != 0 {
      try visitor.visitSingularUInt32Field(value: self.serialNumber, fieldNumber: 2)
    }
    if self.measEnd != false {
      try visitor.visitSingularBoolField(value: self.measEnd, fieldNumber: 3)
    }
    if self.sectionEnd != false {
      try visitor.visitSingularBoolField(value: self.sectionEnd, fieldNumber: 4)
    }
    try { if let v = self._sectionTotalCount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    if !self.dataPoints.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.dataPoints, fieldNumber: 6)
    }
    if !self.sections.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.sections, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_StoreProto, rhs: Pb_StoreProto) -> Bool {
    if lhs.measUuid != rhs.measUuid {return false}
    if lhs.serialNumber != rhs.serialNumber {return false}
    if lhs.measEnd != rhs.measEnd {return false}
    if lhs.sectionEnd != rhs.sectionEnd {return false}
    if lhs._sectionTotalCount != rhs._sectionTotalCount {return false}
    if lhs.dataPoints != rhs.dataPoints {return false}
    if lhs.sections != rhs.sections {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_SectionProto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SectionProto"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "serial_number"),
    2: .standard(proto: "section_end"),
    3: .standard(proto: "section_total_count"),
    4: .standard(proto: "data_points"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.serialNumber) }()
      case 2: try { try decoder.decodeSingularBoolField(value: &self.sectionEnd) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._sectionTotalCount) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.dataPoints) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.serialNumber != 0 {
      try visitor.visitSingularUInt32Field(value: self.serialNumber, fieldNumber: 1)
    }
    if self.sectionEnd != false {
      try visitor.visitSingularBoolField(value: self.sectionEnd, fieldNumber: 2)
    }
    try { if let v = self._sectionTotalCount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    if !self.dataPoints.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.dataPoints, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_SectionProto, rhs: Pb_SectionProto) -> Bool {
    if lhs.serialNumber != rhs.serialNumber {return false}
    if lhs.sectionEnd != rhs.sectionEnd {return false}
    if lhs._sectionTotalCount != rhs._sectionTotalCount {return false}
    if lhs.dataPoints != rhs.dataPoints {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_DataPointProto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DataPointProto"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "elapsed_time"),
    2: .same(proto: "channel"),
    3: .standard(proto: "data_type"),
    4: .standard(proto: "data_payload"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.elapsedTime) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.channel) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.dataType) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.dataPayload) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.elapsedTime != 0 {
      try visitor.visitSingularInt64Field(value: self.elapsedTime, fieldNumber: 1)
    }
    if self.channel != 0 {
      try visitor.visitSingularUInt32Field(value: self.channel, fieldNumber: 2)
    }
    if self.dataType != 0 {
      try visitor.visitSingularUInt32Field(value: self.dataType, fieldNumber: 3)
    }
    if !self.dataPayload.isEmpty {
      try visitor.visitSingularBytesField(value: self.dataPayload, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_DataPointProto, rhs: Pb_DataPointProto) -> Bool {
    if lhs.elapsedTime != rhs.elapsedTime {return false}
    if lhs.channel != rhs.channel {return false}
    if lhs.dataType != rhs.dataType {return false}
    if lhs.dataPayload != rhs.dataPayload {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_StoreDataChunks: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".StoreDataChunks"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "meas_uuid"),
    2: .standard(proto: "sequence_uuid"),
    3: .same(proto: "chunks"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.measUuid) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.sequenceUuid) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.chunks) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.measUuid.isEmpty {
      try visitor.visitSingularStringField(value: self.measUuid, fieldNumber: 1)
    }
    if !self.sequenceUuid.isEmpty {
      try visitor.visitSingularStringField(value: self.sequenceUuid, fieldNumber: 2)
    }
    if !self.chunks.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.chunks, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_StoreDataChunks, rhs: Pb_StoreDataChunks) -> Bool {
    if lhs.measUuid != rhs.measUuid {return false}
    if lhs.sequenceUuid != rhs.sequenceUuid {return false}
    if lhs.chunks != rhs.chunks {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_StoreDataChunk: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".StoreDataChunk"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "sequence_number"),
    2: .standard(proto: "data_point_groups"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.sequenceNumber) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.dataPointGroups) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.sequenceNumber != 0 {
      try visitor.visitSingularUInt32Field(value: self.sequenceNumber, fieldNumber: 1)
    }
    if !self.dataPointGroups.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.dataPointGroups, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_StoreDataChunk, rhs: Pb_StoreDataChunk) -> Bool {
    if lhs.sequenceNumber != rhs.sequenceNumber {return false}
    if lhs.dataPointGroups != rhs.dataPointGroups {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_StoreDataPointGroup: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".StoreDataPointGroup"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "data_id"),
    2: .standard(proto: "data_points"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._dataID) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.dataPoints) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._dataID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.dataPoints.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.dataPoints, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_StoreDataPointGroup, rhs: Pb_StoreDataPointGroup) -> Bool {
    if lhs._dataID != rhs._dataID {return false}
    if lhs.dataPoints != rhs.dataPoints {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_StoreDataPoint: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".StoreDataPoint"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "elapsed_time"),
    2: .same(proto: "payload"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularSInt64Field(value: &self.elapsedTime) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.payload) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.elapsedTime != 0 {
      try visitor.visitSingularSInt64Field(value: self.elapsedTime, fieldNumber: 1)
    }
    if !self.payload.isEmpty {
      try visitor.visitSingularBytesField(value: self.payload, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_StoreDataPoint, rhs: Pb_StoreDataPoint) -> Bool {
    if lhs.elapsedTime != rhs.elapsedTime {return false}
    if lhs.payload != rhs.payload {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_StoreDataID: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".StoreDataID"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "type"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.type) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.type.isEmpty {
      try visitor.visitSingularStringField(value: self.type, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_StoreDataID, rhs: Pb_StoreDataID) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.type != rhs.type {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_MeasSequenceChunks: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MeasSequenceChunks"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "chunks"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.chunks) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.chunks.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.chunks, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_MeasSequenceChunks, rhs: Pb_MeasSequenceChunks) -> Bool {
    if lhs.chunks != rhs.chunks {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pb_MeasSequenceChunk: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MeasSequenceChunk"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "sequence_number"),
    2: .standard(proto: "data_point_groups"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.sequenceNumber) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.dataPointGroups) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.sequenceNumber != 0 {
      try visitor.visitSingularUInt32Field(value: self.sequenceNumber, fieldNumber: 1)
    }
    if !self.dataPointGroups.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.dataPointGroups, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pb_MeasSequenceChunk, rhs: Pb_MeasSequenceChunk) -> Bool {
    if lhs.sequenceNumber != rhs.sequenceNumber {return false}
    if lhs.dataPointGroups != rhs.dataPointGroups {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
