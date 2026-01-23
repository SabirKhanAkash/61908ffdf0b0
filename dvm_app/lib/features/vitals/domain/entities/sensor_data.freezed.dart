// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SensorData {

 double get thermalValue;// 0-3
 double get batteryLevel;// 0-100
 double get memoryUsage;// 0-100
 DateTime get timestamp;
/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorDataCopyWith<SensorData> get copyWith => _$SensorDataCopyWithImpl<SensorData>(this as SensorData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorData&&(identical(other.thermalValue, thermalValue) || other.thermalValue == thermalValue)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.memoryUsage, memoryUsage) || other.memoryUsage == memoryUsage)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,thermalValue,batteryLevel,memoryUsage,timestamp);

@override
String toString() {
  return 'SensorData(thermalValue: $thermalValue, batteryLevel: $batteryLevel, memoryUsage: $memoryUsage, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $SensorDataCopyWith<$Res>  {
  factory $SensorDataCopyWith(SensorData value, $Res Function(SensorData) _then) = _$SensorDataCopyWithImpl;
@useResult
$Res call({
 double thermalValue, double batteryLevel, double memoryUsage, DateTime timestamp
});




}
/// @nodoc
class _$SensorDataCopyWithImpl<$Res>
    implements $SensorDataCopyWith<$Res> {
  _$SensorDataCopyWithImpl(this._self, this._then);

  final SensorData _self;
  final $Res Function(SensorData) _then;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thermalValue = null,Object? batteryLevel = null,Object? memoryUsage = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
thermalValue: null == thermalValue ? _self.thermalValue : thermalValue // ignore: cast_nullable_to_non_nullable
as double,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,memoryUsage: null == memoryUsage ? _self.memoryUsage : memoryUsage // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SensorData].
extension SensorDataPatterns on SensorData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorData value)  $default,){
final _that = this;
switch (_that) {
case _SensorData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorData value)?  $default,){
final _that = this;
switch (_that) {
case _SensorData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double thermalValue,  double batteryLevel,  double memoryUsage,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorData() when $default != null:
return $default(_that.thermalValue,_that.batteryLevel,_that.memoryUsage,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double thermalValue,  double batteryLevel,  double memoryUsage,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _SensorData():
return $default(_that.thermalValue,_that.batteryLevel,_that.memoryUsage,_that.timestamp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double thermalValue,  double batteryLevel,  double memoryUsage,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _SensorData() when $default != null:
return $default(_that.thermalValue,_that.batteryLevel,_that.memoryUsage,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _SensorData implements SensorData {
  const _SensorData({required this.thermalValue, required this.batteryLevel, required this.memoryUsage, required this.timestamp});
  

@override final  double thermalValue;
// 0-3
@override final  double batteryLevel;
// 0-100
@override final  double memoryUsage;
// 0-100
@override final  DateTime timestamp;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorDataCopyWith<_SensorData> get copyWith => __$SensorDataCopyWithImpl<_SensorData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorData&&(identical(other.thermalValue, thermalValue) || other.thermalValue == thermalValue)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.memoryUsage, memoryUsage) || other.memoryUsage == memoryUsage)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,thermalValue,batteryLevel,memoryUsage,timestamp);

@override
String toString() {
  return 'SensorData(thermalValue: $thermalValue, batteryLevel: $batteryLevel, memoryUsage: $memoryUsage, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$SensorDataCopyWith<$Res> implements $SensorDataCopyWith<$Res> {
  factory _$SensorDataCopyWith(_SensorData value, $Res Function(_SensorData) _then) = __$SensorDataCopyWithImpl;
@override @useResult
$Res call({
 double thermalValue, double batteryLevel, double memoryUsage, DateTime timestamp
});




}
/// @nodoc
class __$SensorDataCopyWithImpl<$Res>
    implements _$SensorDataCopyWith<$Res> {
  __$SensorDataCopyWithImpl(this._self, this._then);

  final _SensorData _self;
  final $Res Function(_SensorData) _then;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thermalValue = null,Object? batteryLevel = null,Object? memoryUsage = null,Object? timestamp = null,}) {
  return _then(_SensorData(
thermalValue: null == thermalValue ? _self.thermalValue : thermalValue // ignore: cast_nullable_to_non_nullable
as double,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,memoryUsage: null == memoryUsage ? _self.memoryUsage : memoryUsage // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
