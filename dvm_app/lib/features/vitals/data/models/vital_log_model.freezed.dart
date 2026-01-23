// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vital_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VitalLogModel {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'timestamp') DateTime get timestamp;@JsonKey(name: 'thermal_value') double get thermalValue;@JsonKey(name: 'battery_level') double get batteryLevel;@JsonKey(name: 'memory_usage') double get memoryUsage;
/// Create a copy of VitalLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalLogModelCopyWith<VitalLogModel> get copyWith => _$VitalLogModelCopyWithImpl<VitalLogModel>(this as VitalLogModel, _$identity);

  /// Serializes this VitalLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.thermalValue, thermalValue) || other.thermalValue == thermalValue)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.memoryUsage, memoryUsage) || other.memoryUsage == memoryUsage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceId,timestamp,thermalValue,batteryLevel,memoryUsage);

@override
String toString() {
  return 'VitalLogModel(id: $id, deviceId: $deviceId, timestamp: $timestamp, thermalValue: $thermalValue, batteryLevel: $batteryLevel, memoryUsage: $memoryUsage)';
}


}

/// @nodoc
abstract mixin class $VitalLogModelCopyWith<$Res>  {
  factory $VitalLogModelCopyWith(VitalLogModel value, $Res Function(VitalLogModel) _then) = _$VitalLogModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'timestamp') DateTime timestamp,@JsonKey(name: 'thermal_value') double thermalValue,@JsonKey(name: 'battery_level') double batteryLevel,@JsonKey(name: 'memory_usage') double memoryUsage
});




}
/// @nodoc
class _$VitalLogModelCopyWithImpl<$Res>
    implements $VitalLogModelCopyWith<$Res> {
  _$VitalLogModelCopyWithImpl(this._self, this._then);

  final VitalLogModel _self;
  final $Res Function(VitalLogModel) _then;

/// Create a copy of VitalLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deviceId = null,Object? timestamp = null,Object? thermalValue = null,Object? batteryLevel = null,Object? memoryUsage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,thermalValue: null == thermalValue ? _self.thermalValue : thermalValue // ignore: cast_nullable_to_non_nullable
as double,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,memoryUsage: null == memoryUsage ? _self.memoryUsage : memoryUsage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [VitalLogModel].
extension VitalLogModelPatterns on VitalLogModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VitalLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VitalLogModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VitalLogModel value)  $default,){
final _that = this;
switch (_that) {
case _VitalLogModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VitalLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _VitalLogModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'timestamp')  DateTime timestamp, @JsonKey(name: 'thermal_value')  double thermalValue, @JsonKey(name: 'battery_level')  double batteryLevel, @JsonKey(name: 'memory_usage')  double memoryUsage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VitalLogModel() when $default != null:
return $default(_that.id,_that.deviceId,_that.timestamp,_that.thermalValue,_that.batteryLevel,_that.memoryUsage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'timestamp')  DateTime timestamp, @JsonKey(name: 'thermal_value')  double thermalValue, @JsonKey(name: 'battery_level')  double batteryLevel, @JsonKey(name: 'memory_usage')  double memoryUsage)  $default,) {final _that = this;
switch (_that) {
case _VitalLogModel():
return $default(_that.id,_that.deviceId,_that.timestamp,_that.thermalValue,_that.batteryLevel,_that.memoryUsage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'timestamp')  DateTime timestamp, @JsonKey(name: 'thermal_value')  double thermalValue, @JsonKey(name: 'battery_level')  double batteryLevel, @JsonKey(name: 'memory_usage')  double memoryUsage)?  $default,) {final _that = this;
switch (_that) {
case _VitalLogModel() when $default != null:
return $default(_that.id,_that.deviceId,_that.timestamp,_that.thermalValue,_that.batteryLevel,_that.memoryUsage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VitalLogModel extends VitalLogModel {
  const _VitalLogModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'timestamp') required this.timestamp, @JsonKey(name: 'thermal_value') required this.thermalValue, @JsonKey(name: 'battery_level') required this.batteryLevel, @JsonKey(name: 'memory_usage') required this.memoryUsage}): super._();
  factory _VitalLogModel.fromJson(Map<String, dynamic> json) => _$VitalLogModelFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'timestamp') final  DateTime timestamp;
@override@JsonKey(name: 'thermal_value') final  double thermalValue;
@override@JsonKey(name: 'battery_level') final  double batteryLevel;
@override@JsonKey(name: 'memory_usage') final  double memoryUsage;

/// Create a copy of VitalLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VitalLogModelCopyWith<_VitalLogModel> get copyWith => __$VitalLogModelCopyWithImpl<_VitalLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VitalLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VitalLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.thermalValue, thermalValue) || other.thermalValue == thermalValue)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.memoryUsage, memoryUsage) || other.memoryUsage == memoryUsage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceId,timestamp,thermalValue,batteryLevel,memoryUsage);

@override
String toString() {
  return 'VitalLogModel(id: $id, deviceId: $deviceId, timestamp: $timestamp, thermalValue: $thermalValue, batteryLevel: $batteryLevel, memoryUsage: $memoryUsage)';
}


}

/// @nodoc
abstract mixin class _$VitalLogModelCopyWith<$Res> implements $VitalLogModelCopyWith<$Res> {
  factory _$VitalLogModelCopyWith(_VitalLogModel value, $Res Function(_VitalLogModel) _then) = __$VitalLogModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'timestamp') DateTime timestamp,@JsonKey(name: 'thermal_value') double thermalValue,@JsonKey(name: 'battery_level') double batteryLevel,@JsonKey(name: 'memory_usage') double memoryUsage
});




}
/// @nodoc
class __$VitalLogModelCopyWithImpl<$Res>
    implements _$VitalLogModelCopyWith<$Res> {
  __$VitalLogModelCopyWithImpl(this._self, this._then);

  final _VitalLogModel _self;
  final $Res Function(_VitalLogModel) _then;

/// Create a copy of VitalLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deviceId = null,Object? timestamp = null,Object? thermalValue = null,Object? batteryLevel = null,Object? memoryUsage = null,}) {
  return _then(_VitalLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,thermalValue: null == thermalValue ? _self.thermalValue : thermalValue // ignore: cast_nullable_to_non_nullable
as double,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,memoryUsage: null == memoryUsage ? _self.memoryUsage : memoryUsage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
