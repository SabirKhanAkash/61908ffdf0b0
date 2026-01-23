// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vital_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VitalLog {

 int get id; String get deviceId; DateTime get timestamp; double get thermalValue; double get batteryLevel; double get memoryUsage;
/// Create a copy of VitalLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalLogCopyWith<VitalLog> get copyWith => _$VitalLogCopyWithImpl<VitalLog>(this as VitalLog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalLog&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.thermalValue, thermalValue) || other.thermalValue == thermalValue)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.memoryUsage, memoryUsage) || other.memoryUsage == memoryUsage));
}


@override
int get hashCode => Object.hash(runtimeType,id,deviceId,timestamp,thermalValue,batteryLevel,memoryUsage);

@override
String toString() {
  return 'VitalLog(id: $id, deviceId: $deviceId, timestamp: $timestamp, thermalValue: $thermalValue, batteryLevel: $batteryLevel, memoryUsage: $memoryUsage)';
}


}

/// @nodoc
abstract mixin class $VitalLogCopyWith<$Res>  {
  factory $VitalLogCopyWith(VitalLog value, $Res Function(VitalLog) _then) = _$VitalLogCopyWithImpl;
@useResult
$Res call({
 int id, String deviceId, DateTime timestamp, double thermalValue, double batteryLevel, double memoryUsage
});




}
/// @nodoc
class _$VitalLogCopyWithImpl<$Res>
    implements $VitalLogCopyWith<$Res> {
  _$VitalLogCopyWithImpl(this._self, this._then);

  final VitalLog _self;
  final $Res Function(VitalLog) _then;

/// Create a copy of VitalLog
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


/// Adds pattern-matching-related methods to [VitalLog].
extension VitalLogPatterns on VitalLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VitalLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VitalLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VitalLog value)  $default,){
final _that = this;
switch (_that) {
case _VitalLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VitalLog value)?  $default,){
final _that = this;
switch (_that) {
case _VitalLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String deviceId,  DateTime timestamp,  double thermalValue,  double batteryLevel,  double memoryUsage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VitalLog() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String deviceId,  DateTime timestamp,  double thermalValue,  double batteryLevel,  double memoryUsage)  $default,) {final _that = this;
switch (_that) {
case _VitalLog():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String deviceId,  DateTime timestamp,  double thermalValue,  double batteryLevel,  double memoryUsage)?  $default,) {final _that = this;
switch (_that) {
case _VitalLog() when $default != null:
return $default(_that.id,_that.deviceId,_that.timestamp,_that.thermalValue,_that.batteryLevel,_that.memoryUsage);case _:
  return null;

}
}

}

/// @nodoc


class _VitalLog implements VitalLog {
  const _VitalLog({this.id = 0, this.deviceId = '', required this.timestamp, this.thermalValue = 0.0, this.batteryLevel = 0.0, this.memoryUsage = 0.0});
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String deviceId;
@override final  DateTime timestamp;
@override@JsonKey() final  double thermalValue;
@override@JsonKey() final  double batteryLevel;
@override@JsonKey() final  double memoryUsage;

/// Create a copy of VitalLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VitalLogCopyWith<_VitalLog> get copyWith => __$VitalLogCopyWithImpl<_VitalLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VitalLog&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.thermalValue, thermalValue) || other.thermalValue == thermalValue)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.memoryUsage, memoryUsage) || other.memoryUsage == memoryUsage));
}


@override
int get hashCode => Object.hash(runtimeType,id,deviceId,timestamp,thermalValue,batteryLevel,memoryUsage);

@override
String toString() {
  return 'VitalLog(id: $id, deviceId: $deviceId, timestamp: $timestamp, thermalValue: $thermalValue, batteryLevel: $batteryLevel, memoryUsage: $memoryUsage)';
}


}

/// @nodoc
abstract mixin class _$VitalLogCopyWith<$Res> implements $VitalLogCopyWith<$Res> {
  factory _$VitalLogCopyWith(_VitalLog value, $Res Function(_VitalLog) _then) = __$VitalLogCopyWithImpl;
@override @useResult
$Res call({
 int id, String deviceId, DateTime timestamp, double thermalValue, double batteryLevel, double memoryUsage
});




}
/// @nodoc
class __$VitalLogCopyWithImpl<$Res>
    implements _$VitalLogCopyWith<$Res> {
  __$VitalLogCopyWithImpl(this._self, this._then);

  final _VitalLog _self;
  final $Res Function(_VitalLog) _then;

/// Create a copy of VitalLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deviceId = null,Object? timestamp = null,Object? thermalValue = null,Object? batteryLevel = null,Object? memoryUsage = null,}) {
  return _then(_VitalLog(
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
