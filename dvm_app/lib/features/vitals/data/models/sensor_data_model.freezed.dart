// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SensorDataModel {

@JsonKey(name: 'thermal_value') double get thermalValue;@JsonKey(name: 'battery_level') double get batteryLevel;@JsonKey(name: 'memory_usage') double get memoryUsage; DateTime get timestamp;
/// Create a copy of SensorDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorDataModelCopyWith<SensorDataModel> get copyWith => _$SensorDataModelCopyWithImpl<SensorDataModel>(this as SensorDataModel, _$identity);

  /// Serializes this SensorDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorDataModel&&(identical(other.thermalValue, thermalValue) || other.thermalValue == thermalValue)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.memoryUsage, memoryUsage) || other.memoryUsage == memoryUsage)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thermalValue,batteryLevel,memoryUsage,timestamp);

@override
String toString() {
  return 'SensorDataModel(thermalValue: $thermalValue, batteryLevel: $batteryLevel, memoryUsage: $memoryUsage, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $SensorDataModelCopyWith<$Res>  {
  factory $SensorDataModelCopyWith(SensorDataModel value, $Res Function(SensorDataModel) _then) = _$SensorDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'thermal_value') double thermalValue,@JsonKey(name: 'battery_level') double batteryLevel,@JsonKey(name: 'memory_usage') double memoryUsage, DateTime timestamp
});




}
/// @nodoc
class _$SensorDataModelCopyWithImpl<$Res>
    implements $SensorDataModelCopyWith<$Res> {
  _$SensorDataModelCopyWithImpl(this._self, this._then);

  final SensorDataModel _self;
  final $Res Function(SensorDataModel) _then;

/// Create a copy of SensorDataModel
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


/// Adds pattern-matching-related methods to [SensorDataModel].
extension SensorDataModelPatterns on SensorDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorDataModel value)  $default,){
final _that = this;
switch (_that) {
case _SensorDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _SensorDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'thermal_value')  double thermalValue, @JsonKey(name: 'battery_level')  double batteryLevel, @JsonKey(name: 'memory_usage')  double memoryUsage,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorDataModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'thermal_value')  double thermalValue, @JsonKey(name: 'battery_level')  double batteryLevel, @JsonKey(name: 'memory_usage')  double memoryUsage,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _SensorDataModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'thermal_value')  double thermalValue, @JsonKey(name: 'battery_level')  double batteryLevel, @JsonKey(name: 'memory_usage')  double memoryUsage,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _SensorDataModel() when $default != null:
return $default(_that.thermalValue,_that.batteryLevel,_that.memoryUsage,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SensorDataModel extends SensorDataModel {
  const _SensorDataModel({@JsonKey(name: 'thermal_value') required this.thermalValue, @JsonKey(name: 'battery_level') required this.batteryLevel, @JsonKey(name: 'memory_usage') required this.memoryUsage, required this.timestamp}): super._();
  factory _SensorDataModel.fromJson(Map<String, dynamic> json) => _$SensorDataModelFromJson(json);

@override@JsonKey(name: 'thermal_value') final  double thermalValue;
@override@JsonKey(name: 'battery_level') final  double batteryLevel;
@override@JsonKey(name: 'memory_usage') final  double memoryUsage;
@override final  DateTime timestamp;

/// Create a copy of SensorDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorDataModelCopyWith<_SensorDataModel> get copyWith => __$SensorDataModelCopyWithImpl<_SensorDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorDataModel&&(identical(other.thermalValue, thermalValue) || other.thermalValue == thermalValue)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.memoryUsage, memoryUsage) || other.memoryUsage == memoryUsage)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thermalValue,batteryLevel,memoryUsage,timestamp);

@override
String toString() {
  return 'SensorDataModel(thermalValue: $thermalValue, batteryLevel: $batteryLevel, memoryUsage: $memoryUsage, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$SensorDataModelCopyWith<$Res> implements $SensorDataModelCopyWith<$Res> {
  factory _$SensorDataModelCopyWith(_SensorDataModel value, $Res Function(_SensorDataModel) _then) = __$SensorDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'thermal_value') double thermalValue,@JsonKey(name: 'battery_level') double batteryLevel,@JsonKey(name: 'memory_usage') double memoryUsage, DateTime timestamp
});




}
/// @nodoc
class __$SensorDataModelCopyWithImpl<$Res>
    implements _$SensorDataModelCopyWith<$Res> {
  __$SensorDataModelCopyWithImpl(this._self, this._then);

  final _SensorDataModel _self;
  final $Res Function(_SensorDataModel) _then;

/// Create a copy of SensorDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thermalValue = null,Object? batteryLevel = null,Object? memoryUsage = null,Object? timestamp = null,}) {
  return _then(_SensorDataModel(
thermalValue: null == thermalValue ? _self.thermalValue : thermalValue // ignore: cast_nullable_to_non_nullable
as double,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,memoryUsage: null == memoryUsage ? _self.memoryUsage : memoryUsage // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
