// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vital_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VitalAnalyticsModel {

@JsonKey(name: 'rolling_average') RollingAverageModel get rollingAverage;@JsonKey(name: 'total_logs') int get totalLogs;@JsonKey(name: 'latest_timestamp') String? get latestTimestamp;@JsonKey(name: 'device_count') int get deviceCount;@JsonKey(name: 'time_range') TimeRangeModel get timeRange;
/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalAnalyticsModelCopyWith<VitalAnalyticsModel> get copyWith => _$VitalAnalyticsModelCopyWithImpl<VitalAnalyticsModel>(this as VitalAnalyticsModel, _$identity);

  /// Serializes this VitalAnalyticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalAnalyticsModel&&(identical(other.rollingAverage, rollingAverage) || other.rollingAverage == rollingAverage)&&(identical(other.totalLogs, totalLogs) || other.totalLogs == totalLogs)&&(identical(other.latestTimestamp, latestTimestamp) || other.latestTimestamp == latestTimestamp)&&(identical(other.deviceCount, deviceCount) || other.deviceCount == deviceCount)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rollingAverage,totalLogs,latestTimestamp,deviceCount,timeRange);

@override
String toString() {
  return 'VitalAnalyticsModel(rollingAverage: $rollingAverage, totalLogs: $totalLogs, latestTimestamp: $latestTimestamp, deviceCount: $deviceCount, timeRange: $timeRange)';
}


}

/// @nodoc
abstract mixin class $VitalAnalyticsModelCopyWith<$Res>  {
  factory $VitalAnalyticsModelCopyWith(VitalAnalyticsModel value, $Res Function(VitalAnalyticsModel) _then) = _$VitalAnalyticsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rolling_average') RollingAverageModel rollingAverage,@JsonKey(name: 'total_logs') int totalLogs,@JsonKey(name: 'latest_timestamp') String? latestTimestamp,@JsonKey(name: 'device_count') int deviceCount,@JsonKey(name: 'time_range') TimeRangeModel timeRange
});


$RollingAverageModelCopyWith<$Res> get rollingAverage;$TimeRangeModelCopyWith<$Res> get timeRange;

}
/// @nodoc
class _$VitalAnalyticsModelCopyWithImpl<$Res>
    implements $VitalAnalyticsModelCopyWith<$Res> {
  _$VitalAnalyticsModelCopyWithImpl(this._self, this._then);

  final VitalAnalyticsModel _self;
  final $Res Function(VitalAnalyticsModel) _then;

/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rollingAverage = null,Object? totalLogs = null,Object? latestTimestamp = freezed,Object? deviceCount = null,Object? timeRange = null,}) {
  return _then(_self.copyWith(
rollingAverage: null == rollingAverage ? _self.rollingAverage : rollingAverage // ignore: cast_nullable_to_non_nullable
as RollingAverageModel,totalLogs: null == totalLogs ? _self.totalLogs : totalLogs // ignore: cast_nullable_to_non_nullable
as int,latestTimestamp: freezed == latestTimestamp ? _self.latestTimestamp : latestTimestamp // ignore: cast_nullable_to_non_nullable
as String?,deviceCount: null == deviceCount ? _self.deviceCount : deviceCount // ignore: cast_nullable_to_non_nullable
as int,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as TimeRangeModel,
  ));
}
/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RollingAverageModelCopyWith<$Res> get rollingAverage {
  
  return $RollingAverageModelCopyWith<$Res>(_self.rollingAverage, (value) {
    return _then(_self.copyWith(rollingAverage: value));
  });
}/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeRangeModelCopyWith<$Res> get timeRange {
  
  return $TimeRangeModelCopyWith<$Res>(_self.timeRange, (value) {
    return _then(_self.copyWith(timeRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [VitalAnalyticsModel].
extension VitalAnalyticsModelPatterns on VitalAnalyticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VitalAnalyticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VitalAnalyticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VitalAnalyticsModel value)  $default,){
final _that = this;
switch (_that) {
case _VitalAnalyticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VitalAnalyticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _VitalAnalyticsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rolling_average')  RollingAverageModel rollingAverage, @JsonKey(name: 'total_logs')  int totalLogs, @JsonKey(name: 'latest_timestamp')  String? latestTimestamp, @JsonKey(name: 'device_count')  int deviceCount, @JsonKey(name: 'time_range')  TimeRangeModel timeRange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VitalAnalyticsModel() when $default != null:
return $default(_that.rollingAverage,_that.totalLogs,_that.latestTimestamp,_that.deviceCount,_that.timeRange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rolling_average')  RollingAverageModel rollingAverage, @JsonKey(name: 'total_logs')  int totalLogs, @JsonKey(name: 'latest_timestamp')  String? latestTimestamp, @JsonKey(name: 'device_count')  int deviceCount, @JsonKey(name: 'time_range')  TimeRangeModel timeRange)  $default,) {final _that = this;
switch (_that) {
case _VitalAnalyticsModel():
return $default(_that.rollingAverage,_that.totalLogs,_that.latestTimestamp,_that.deviceCount,_that.timeRange);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rolling_average')  RollingAverageModel rollingAverage, @JsonKey(name: 'total_logs')  int totalLogs, @JsonKey(name: 'latest_timestamp')  String? latestTimestamp, @JsonKey(name: 'device_count')  int deviceCount, @JsonKey(name: 'time_range')  TimeRangeModel timeRange)?  $default,) {final _that = this;
switch (_that) {
case _VitalAnalyticsModel() when $default != null:
return $default(_that.rollingAverage,_that.totalLogs,_that.latestTimestamp,_that.deviceCount,_that.timeRange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VitalAnalyticsModel extends VitalAnalyticsModel {
  const _VitalAnalyticsModel({@JsonKey(name: 'rolling_average') required this.rollingAverage, @JsonKey(name: 'total_logs') required this.totalLogs, @JsonKey(name: 'latest_timestamp') this.latestTimestamp, @JsonKey(name: 'device_count') required this.deviceCount, @JsonKey(name: 'time_range') required this.timeRange}): super._();
  factory _VitalAnalyticsModel.fromJson(Map<String, dynamic> json) => _$VitalAnalyticsModelFromJson(json);

@override@JsonKey(name: 'rolling_average') final  RollingAverageModel rollingAverage;
@override@JsonKey(name: 'total_logs') final  int totalLogs;
@override@JsonKey(name: 'latest_timestamp') final  String? latestTimestamp;
@override@JsonKey(name: 'device_count') final  int deviceCount;
@override@JsonKey(name: 'time_range') final  TimeRangeModel timeRange;

/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VitalAnalyticsModelCopyWith<_VitalAnalyticsModel> get copyWith => __$VitalAnalyticsModelCopyWithImpl<_VitalAnalyticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VitalAnalyticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VitalAnalyticsModel&&(identical(other.rollingAverage, rollingAverage) || other.rollingAverage == rollingAverage)&&(identical(other.totalLogs, totalLogs) || other.totalLogs == totalLogs)&&(identical(other.latestTimestamp, latestTimestamp) || other.latestTimestamp == latestTimestamp)&&(identical(other.deviceCount, deviceCount) || other.deviceCount == deviceCount)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rollingAverage,totalLogs,latestTimestamp,deviceCount,timeRange);

@override
String toString() {
  return 'VitalAnalyticsModel(rollingAverage: $rollingAverage, totalLogs: $totalLogs, latestTimestamp: $latestTimestamp, deviceCount: $deviceCount, timeRange: $timeRange)';
}


}

/// @nodoc
abstract mixin class _$VitalAnalyticsModelCopyWith<$Res> implements $VitalAnalyticsModelCopyWith<$Res> {
  factory _$VitalAnalyticsModelCopyWith(_VitalAnalyticsModel value, $Res Function(_VitalAnalyticsModel) _then) = __$VitalAnalyticsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rolling_average') RollingAverageModel rollingAverage,@JsonKey(name: 'total_logs') int totalLogs,@JsonKey(name: 'latest_timestamp') String? latestTimestamp,@JsonKey(name: 'device_count') int deviceCount,@JsonKey(name: 'time_range') TimeRangeModel timeRange
});


@override $RollingAverageModelCopyWith<$Res> get rollingAverage;@override $TimeRangeModelCopyWith<$Res> get timeRange;

}
/// @nodoc
class __$VitalAnalyticsModelCopyWithImpl<$Res>
    implements _$VitalAnalyticsModelCopyWith<$Res> {
  __$VitalAnalyticsModelCopyWithImpl(this._self, this._then);

  final _VitalAnalyticsModel _self;
  final $Res Function(_VitalAnalyticsModel) _then;

/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rollingAverage = null,Object? totalLogs = null,Object? latestTimestamp = freezed,Object? deviceCount = null,Object? timeRange = null,}) {
  return _then(_VitalAnalyticsModel(
rollingAverage: null == rollingAverage ? _self.rollingAverage : rollingAverage // ignore: cast_nullable_to_non_nullable
as RollingAverageModel,totalLogs: null == totalLogs ? _self.totalLogs : totalLogs // ignore: cast_nullable_to_non_nullable
as int,latestTimestamp: freezed == latestTimestamp ? _self.latestTimestamp : latestTimestamp // ignore: cast_nullable_to_non_nullable
as String?,deviceCount: null == deviceCount ? _self.deviceCount : deviceCount // ignore: cast_nullable_to_non_nullable
as int,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as TimeRangeModel,
  ));
}

/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RollingAverageModelCopyWith<$Res> get rollingAverage {
  
  return $RollingAverageModelCopyWith<$Res>(_self.rollingAverage, (value) {
    return _then(_self.copyWith(rollingAverage: value));
  });
}/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeRangeModelCopyWith<$Res> get timeRange {
  
  return $TimeRangeModelCopyWith<$Res>(_self.timeRange, (value) {
    return _then(_self.copyWith(timeRange: value));
  });
}
}


/// @nodoc
mixin _$RollingAverageModel {

 double get thermal; double get battery; double get memory;
/// Create a copy of RollingAverageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RollingAverageModelCopyWith<RollingAverageModel> get copyWith => _$RollingAverageModelCopyWithImpl<RollingAverageModel>(this as RollingAverageModel, _$identity);

  /// Serializes this RollingAverageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RollingAverageModel&&(identical(other.thermal, thermal) || other.thermal == thermal)&&(identical(other.battery, battery) || other.battery == battery)&&(identical(other.memory, memory) || other.memory == memory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thermal,battery,memory);

@override
String toString() {
  return 'RollingAverageModel(thermal: $thermal, battery: $battery, memory: $memory)';
}


}

/// @nodoc
abstract mixin class $RollingAverageModelCopyWith<$Res>  {
  factory $RollingAverageModelCopyWith(RollingAverageModel value, $Res Function(RollingAverageModel) _then) = _$RollingAverageModelCopyWithImpl;
@useResult
$Res call({
 double thermal, double battery, double memory
});




}
/// @nodoc
class _$RollingAverageModelCopyWithImpl<$Res>
    implements $RollingAverageModelCopyWith<$Res> {
  _$RollingAverageModelCopyWithImpl(this._self, this._then);

  final RollingAverageModel _self;
  final $Res Function(RollingAverageModel) _then;

/// Create a copy of RollingAverageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thermal = null,Object? battery = null,Object? memory = null,}) {
  return _then(_self.copyWith(
thermal: null == thermal ? _self.thermal : thermal // ignore: cast_nullable_to_non_nullable
as double,battery: null == battery ? _self.battery : battery // ignore: cast_nullable_to_non_nullable
as double,memory: null == memory ? _self.memory : memory // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RollingAverageModel].
extension RollingAverageModelPatterns on RollingAverageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RollingAverageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RollingAverageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RollingAverageModel value)  $default,){
final _that = this;
switch (_that) {
case _RollingAverageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RollingAverageModel value)?  $default,){
final _that = this;
switch (_that) {
case _RollingAverageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double thermal,  double battery,  double memory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RollingAverageModel() when $default != null:
return $default(_that.thermal,_that.battery,_that.memory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double thermal,  double battery,  double memory)  $default,) {final _that = this;
switch (_that) {
case _RollingAverageModel():
return $default(_that.thermal,_that.battery,_that.memory);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double thermal,  double battery,  double memory)?  $default,) {final _that = this;
switch (_that) {
case _RollingAverageModel() when $default != null:
return $default(_that.thermal,_that.battery,_that.memory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RollingAverageModel extends RollingAverageModel {
  const _RollingAverageModel({required this.thermal, required this.battery, required this.memory}): super._();
  factory _RollingAverageModel.fromJson(Map<String, dynamic> json) => _$RollingAverageModelFromJson(json);

@override final  double thermal;
@override final  double battery;
@override final  double memory;

/// Create a copy of RollingAverageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RollingAverageModelCopyWith<_RollingAverageModel> get copyWith => __$RollingAverageModelCopyWithImpl<_RollingAverageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RollingAverageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RollingAverageModel&&(identical(other.thermal, thermal) || other.thermal == thermal)&&(identical(other.battery, battery) || other.battery == battery)&&(identical(other.memory, memory) || other.memory == memory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thermal,battery,memory);

@override
String toString() {
  return 'RollingAverageModel(thermal: $thermal, battery: $battery, memory: $memory)';
}


}

/// @nodoc
abstract mixin class _$RollingAverageModelCopyWith<$Res> implements $RollingAverageModelCopyWith<$Res> {
  factory _$RollingAverageModelCopyWith(_RollingAverageModel value, $Res Function(_RollingAverageModel) _then) = __$RollingAverageModelCopyWithImpl;
@override @useResult
$Res call({
 double thermal, double battery, double memory
});




}
/// @nodoc
class __$RollingAverageModelCopyWithImpl<$Res>
    implements _$RollingAverageModelCopyWith<$Res> {
  __$RollingAverageModelCopyWithImpl(this._self, this._then);

  final _RollingAverageModel _self;
  final $Res Function(_RollingAverageModel) _then;

/// Create a copy of RollingAverageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thermal = null,Object? battery = null,Object? memory = null,}) {
  return _then(_RollingAverageModel(
thermal: null == thermal ? _self.thermal : thermal // ignore: cast_nullable_to_non_nullable
as double,battery: null == battery ? _self.battery : battery // ignore: cast_nullable_to_non_nullable
as double,memory: null == memory ? _self.memory : memory // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$TimeRangeModel {

 String? get earliest; String? get latest;
/// Create a copy of TimeRangeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeRangeModelCopyWith<TimeRangeModel> get copyWith => _$TimeRangeModelCopyWithImpl<TimeRangeModel>(this as TimeRangeModel, _$identity);

  /// Serializes this TimeRangeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeRangeModel&&(identical(other.earliest, earliest) || other.earliest == earliest)&&(identical(other.latest, latest) || other.latest == latest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,earliest,latest);

@override
String toString() {
  return 'TimeRangeModel(earliest: $earliest, latest: $latest)';
}


}

/// @nodoc
abstract mixin class $TimeRangeModelCopyWith<$Res>  {
  factory $TimeRangeModelCopyWith(TimeRangeModel value, $Res Function(TimeRangeModel) _then) = _$TimeRangeModelCopyWithImpl;
@useResult
$Res call({
 String? earliest, String? latest
});




}
/// @nodoc
class _$TimeRangeModelCopyWithImpl<$Res>
    implements $TimeRangeModelCopyWith<$Res> {
  _$TimeRangeModelCopyWithImpl(this._self, this._then);

  final TimeRangeModel _self;
  final $Res Function(TimeRangeModel) _then;

/// Create a copy of TimeRangeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? earliest = freezed,Object? latest = freezed,}) {
  return _then(_self.copyWith(
earliest: freezed == earliest ? _self.earliest : earliest // ignore: cast_nullable_to_non_nullable
as String?,latest: freezed == latest ? _self.latest : latest // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeRangeModel].
extension TimeRangeModelPatterns on TimeRangeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeRangeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeRangeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeRangeModel value)  $default,){
final _that = this;
switch (_that) {
case _TimeRangeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeRangeModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimeRangeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? earliest,  String? latest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeRangeModel() when $default != null:
return $default(_that.earliest,_that.latest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? earliest,  String? latest)  $default,) {final _that = this;
switch (_that) {
case _TimeRangeModel():
return $default(_that.earliest,_that.latest);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? earliest,  String? latest)?  $default,) {final _that = this;
switch (_that) {
case _TimeRangeModel() when $default != null:
return $default(_that.earliest,_that.latest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeRangeModel extends TimeRangeModel {
  const _TimeRangeModel({this.earliest, this.latest}): super._();
  factory _TimeRangeModel.fromJson(Map<String, dynamic> json) => _$TimeRangeModelFromJson(json);

@override final  String? earliest;
@override final  String? latest;

/// Create a copy of TimeRangeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeRangeModelCopyWith<_TimeRangeModel> get copyWith => __$TimeRangeModelCopyWithImpl<_TimeRangeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeRangeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeRangeModel&&(identical(other.earliest, earliest) || other.earliest == earliest)&&(identical(other.latest, latest) || other.latest == latest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,earliest,latest);

@override
String toString() {
  return 'TimeRangeModel(earliest: $earliest, latest: $latest)';
}


}

/// @nodoc
abstract mixin class _$TimeRangeModelCopyWith<$Res> implements $TimeRangeModelCopyWith<$Res> {
  factory _$TimeRangeModelCopyWith(_TimeRangeModel value, $Res Function(_TimeRangeModel) _then) = __$TimeRangeModelCopyWithImpl;
@override @useResult
$Res call({
 String? earliest, String? latest
});




}
/// @nodoc
class __$TimeRangeModelCopyWithImpl<$Res>
    implements _$TimeRangeModelCopyWith<$Res> {
  __$TimeRangeModelCopyWithImpl(this._self, this._then);

  final _TimeRangeModel _self;
  final $Res Function(_TimeRangeModel) _then;

/// Create a copy of TimeRangeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? earliest = freezed,Object? latest = freezed,}) {
  return _then(_TimeRangeModel(
earliest: freezed == earliest ? _self.earliest : earliest // ignore: cast_nullable_to_non_nullable
as String?,latest: freezed == latest ? _self.latest : latest // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
