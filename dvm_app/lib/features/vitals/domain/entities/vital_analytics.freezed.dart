// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vital_analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VitalAnalytics {

 RollingAverage get rollingAverage; int get totalLogs; String? get latestTimestamp; int get deviceCount; TimeRange get timeRange;
/// Create a copy of VitalAnalytics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalAnalyticsCopyWith<VitalAnalytics> get copyWith => _$VitalAnalyticsCopyWithImpl<VitalAnalytics>(this as VitalAnalytics, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalAnalytics&&(identical(other.rollingAverage, rollingAverage) || other.rollingAverage == rollingAverage)&&(identical(other.totalLogs, totalLogs) || other.totalLogs == totalLogs)&&(identical(other.latestTimestamp, latestTimestamp) || other.latestTimestamp == latestTimestamp)&&(identical(other.deviceCount, deviceCount) || other.deviceCount == deviceCount)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange));
}


@override
int get hashCode => Object.hash(runtimeType,rollingAverage,totalLogs,latestTimestamp,deviceCount,timeRange);

@override
String toString() {
  return 'VitalAnalytics(rollingAverage: $rollingAverage, totalLogs: $totalLogs, latestTimestamp: $latestTimestamp, deviceCount: $deviceCount, timeRange: $timeRange)';
}


}

/// @nodoc
abstract mixin class $VitalAnalyticsCopyWith<$Res>  {
  factory $VitalAnalyticsCopyWith(VitalAnalytics value, $Res Function(VitalAnalytics) _then) = _$VitalAnalyticsCopyWithImpl;
@useResult
$Res call({
 RollingAverage rollingAverage, int totalLogs, String? latestTimestamp, int deviceCount, TimeRange timeRange
});


$RollingAverageCopyWith<$Res> get rollingAverage;$TimeRangeCopyWith<$Res> get timeRange;

}
/// @nodoc
class _$VitalAnalyticsCopyWithImpl<$Res>
    implements $VitalAnalyticsCopyWith<$Res> {
  _$VitalAnalyticsCopyWithImpl(this._self, this._then);

  final VitalAnalytics _self;
  final $Res Function(VitalAnalytics) _then;

/// Create a copy of VitalAnalytics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rollingAverage = null,Object? totalLogs = null,Object? latestTimestamp = freezed,Object? deviceCount = null,Object? timeRange = null,}) {
  return _then(_self.copyWith(
rollingAverage: null == rollingAverage ? _self.rollingAverage : rollingAverage // ignore: cast_nullable_to_non_nullable
as RollingAverage,totalLogs: null == totalLogs ? _self.totalLogs : totalLogs // ignore: cast_nullable_to_non_nullable
as int,latestTimestamp: freezed == latestTimestamp ? _self.latestTimestamp : latestTimestamp // ignore: cast_nullable_to_non_nullable
as String?,deviceCount: null == deviceCount ? _self.deviceCount : deviceCount // ignore: cast_nullable_to_non_nullable
as int,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as TimeRange,
  ));
}
/// Create a copy of VitalAnalytics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RollingAverageCopyWith<$Res> get rollingAverage {
  
  return $RollingAverageCopyWith<$Res>(_self.rollingAverage, (value) {
    return _then(_self.copyWith(rollingAverage: value));
  });
}/// Create a copy of VitalAnalytics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeRangeCopyWith<$Res> get timeRange {
  
  return $TimeRangeCopyWith<$Res>(_self.timeRange, (value) {
    return _then(_self.copyWith(timeRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [VitalAnalytics].
extension VitalAnalyticsPatterns on VitalAnalytics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VitalAnalytics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VitalAnalytics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VitalAnalytics value)  $default,){
final _that = this;
switch (_that) {
case _VitalAnalytics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VitalAnalytics value)?  $default,){
final _that = this;
switch (_that) {
case _VitalAnalytics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RollingAverage rollingAverage,  int totalLogs,  String? latestTimestamp,  int deviceCount,  TimeRange timeRange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VitalAnalytics() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RollingAverage rollingAverage,  int totalLogs,  String? latestTimestamp,  int deviceCount,  TimeRange timeRange)  $default,) {final _that = this;
switch (_that) {
case _VitalAnalytics():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RollingAverage rollingAverage,  int totalLogs,  String? latestTimestamp,  int deviceCount,  TimeRange timeRange)?  $default,) {final _that = this;
switch (_that) {
case _VitalAnalytics() when $default != null:
return $default(_that.rollingAverage,_that.totalLogs,_that.latestTimestamp,_that.deviceCount,_that.timeRange);case _:
  return null;

}
}

}

/// @nodoc


class _VitalAnalytics implements VitalAnalytics {
  const _VitalAnalytics({required this.rollingAverage, required this.totalLogs, this.latestTimestamp, required this.deviceCount, required this.timeRange});
  

@override final  RollingAverage rollingAverage;
@override final  int totalLogs;
@override final  String? latestTimestamp;
@override final  int deviceCount;
@override final  TimeRange timeRange;

/// Create a copy of VitalAnalytics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VitalAnalyticsCopyWith<_VitalAnalytics> get copyWith => __$VitalAnalyticsCopyWithImpl<_VitalAnalytics>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VitalAnalytics&&(identical(other.rollingAverage, rollingAverage) || other.rollingAverage == rollingAverage)&&(identical(other.totalLogs, totalLogs) || other.totalLogs == totalLogs)&&(identical(other.latestTimestamp, latestTimestamp) || other.latestTimestamp == latestTimestamp)&&(identical(other.deviceCount, deviceCount) || other.deviceCount == deviceCount)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange));
}


@override
int get hashCode => Object.hash(runtimeType,rollingAverage,totalLogs,latestTimestamp,deviceCount,timeRange);

@override
String toString() {
  return 'VitalAnalytics(rollingAverage: $rollingAverage, totalLogs: $totalLogs, latestTimestamp: $latestTimestamp, deviceCount: $deviceCount, timeRange: $timeRange)';
}


}

/// @nodoc
abstract mixin class _$VitalAnalyticsCopyWith<$Res> implements $VitalAnalyticsCopyWith<$Res> {
  factory _$VitalAnalyticsCopyWith(_VitalAnalytics value, $Res Function(_VitalAnalytics) _then) = __$VitalAnalyticsCopyWithImpl;
@override @useResult
$Res call({
 RollingAverage rollingAverage, int totalLogs, String? latestTimestamp, int deviceCount, TimeRange timeRange
});


@override $RollingAverageCopyWith<$Res> get rollingAverage;@override $TimeRangeCopyWith<$Res> get timeRange;

}
/// @nodoc
class __$VitalAnalyticsCopyWithImpl<$Res>
    implements _$VitalAnalyticsCopyWith<$Res> {
  __$VitalAnalyticsCopyWithImpl(this._self, this._then);

  final _VitalAnalytics _self;
  final $Res Function(_VitalAnalytics) _then;

/// Create a copy of VitalAnalytics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rollingAverage = null,Object? totalLogs = null,Object? latestTimestamp = freezed,Object? deviceCount = null,Object? timeRange = null,}) {
  return _then(_VitalAnalytics(
rollingAverage: null == rollingAverage ? _self.rollingAverage : rollingAverage // ignore: cast_nullable_to_non_nullable
as RollingAverage,totalLogs: null == totalLogs ? _self.totalLogs : totalLogs // ignore: cast_nullable_to_non_nullable
as int,latestTimestamp: freezed == latestTimestamp ? _self.latestTimestamp : latestTimestamp // ignore: cast_nullable_to_non_nullable
as String?,deviceCount: null == deviceCount ? _self.deviceCount : deviceCount // ignore: cast_nullable_to_non_nullable
as int,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as TimeRange,
  ));
}

/// Create a copy of VitalAnalytics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RollingAverageCopyWith<$Res> get rollingAverage {
  
  return $RollingAverageCopyWith<$Res>(_self.rollingAverage, (value) {
    return _then(_self.copyWith(rollingAverage: value));
  });
}/// Create a copy of VitalAnalytics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeRangeCopyWith<$Res> get timeRange {
  
  return $TimeRangeCopyWith<$Res>(_self.timeRange, (value) {
    return _then(_self.copyWith(timeRange: value));
  });
}
}

/// @nodoc
mixin _$RollingAverage {

 double get thermal; double get battery; double get memory;
/// Create a copy of RollingAverage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RollingAverageCopyWith<RollingAverage> get copyWith => _$RollingAverageCopyWithImpl<RollingAverage>(this as RollingAverage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RollingAverage&&(identical(other.thermal, thermal) || other.thermal == thermal)&&(identical(other.battery, battery) || other.battery == battery)&&(identical(other.memory, memory) || other.memory == memory));
}


@override
int get hashCode => Object.hash(runtimeType,thermal,battery,memory);

@override
String toString() {
  return 'RollingAverage(thermal: $thermal, battery: $battery, memory: $memory)';
}


}

/// @nodoc
abstract mixin class $RollingAverageCopyWith<$Res>  {
  factory $RollingAverageCopyWith(RollingAverage value, $Res Function(RollingAverage) _then) = _$RollingAverageCopyWithImpl;
@useResult
$Res call({
 double thermal, double battery, double memory
});




}
/// @nodoc
class _$RollingAverageCopyWithImpl<$Res>
    implements $RollingAverageCopyWith<$Res> {
  _$RollingAverageCopyWithImpl(this._self, this._then);

  final RollingAverage _self;
  final $Res Function(RollingAverage) _then;

/// Create a copy of RollingAverage
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


/// Adds pattern-matching-related methods to [RollingAverage].
extension RollingAveragePatterns on RollingAverage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RollingAverage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RollingAverage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RollingAverage value)  $default,){
final _that = this;
switch (_that) {
case _RollingAverage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RollingAverage value)?  $default,){
final _that = this;
switch (_that) {
case _RollingAverage() when $default != null:
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
case _RollingAverage() when $default != null:
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
case _RollingAverage():
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
case _RollingAverage() when $default != null:
return $default(_that.thermal,_that.battery,_that.memory);case _:
  return null;

}
}

}

/// @nodoc


class _RollingAverage implements RollingAverage {
  const _RollingAverage({required this.thermal, required this.battery, required this.memory});
  

@override final  double thermal;
@override final  double battery;
@override final  double memory;

/// Create a copy of RollingAverage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RollingAverageCopyWith<_RollingAverage> get copyWith => __$RollingAverageCopyWithImpl<_RollingAverage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RollingAverage&&(identical(other.thermal, thermal) || other.thermal == thermal)&&(identical(other.battery, battery) || other.battery == battery)&&(identical(other.memory, memory) || other.memory == memory));
}


@override
int get hashCode => Object.hash(runtimeType,thermal,battery,memory);

@override
String toString() {
  return 'RollingAverage(thermal: $thermal, battery: $battery, memory: $memory)';
}


}

/// @nodoc
abstract mixin class _$RollingAverageCopyWith<$Res> implements $RollingAverageCopyWith<$Res> {
  factory _$RollingAverageCopyWith(_RollingAverage value, $Res Function(_RollingAverage) _then) = __$RollingAverageCopyWithImpl;
@override @useResult
$Res call({
 double thermal, double battery, double memory
});




}
/// @nodoc
class __$RollingAverageCopyWithImpl<$Res>
    implements _$RollingAverageCopyWith<$Res> {
  __$RollingAverageCopyWithImpl(this._self, this._then);

  final _RollingAverage _self;
  final $Res Function(_RollingAverage) _then;

/// Create a copy of RollingAverage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thermal = null,Object? battery = null,Object? memory = null,}) {
  return _then(_RollingAverage(
thermal: null == thermal ? _self.thermal : thermal // ignore: cast_nullable_to_non_nullable
as double,battery: null == battery ? _self.battery : battery // ignore: cast_nullable_to_non_nullable
as double,memory: null == memory ? _self.memory : memory // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$TimeRange {

 String? get earliest; String? get latest;
/// Create a copy of TimeRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeRangeCopyWith<TimeRange> get copyWith => _$TimeRangeCopyWithImpl<TimeRange>(this as TimeRange, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeRange&&(identical(other.earliest, earliest) || other.earliest == earliest)&&(identical(other.latest, latest) || other.latest == latest));
}


@override
int get hashCode => Object.hash(runtimeType,earliest,latest);

@override
String toString() {
  return 'TimeRange(earliest: $earliest, latest: $latest)';
}


}

/// @nodoc
abstract mixin class $TimeRangeCopyWith<$Res>  {
  factory $TimeRangeCopyWith(TimeRange value, $Res Function(TimeRange) _then) = _$TimeRangeCopyWithImpl;
@useResult
$Res call({
 String? earliest, String? latest
});




}
/// @nodoc
class _$TimeRangeCopyWithImpl<$Res>
    implements $TimeRangeCopyWith<$Res> {
  _$TimeRangeCopyWithImpl(this._self, this._then);

  final TimeRange _self;
  final $Res Function(TimeRange) _then;

/// Create a copy of TimeRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? earliest = freezed,Object? latest = freezed,}) {
  return _then(_self.copyWith(
earliest: freezed == earliest ? _self.earliest : earliest // ignore: cast_nullable_to_non_nullable
as String?,latest: freezed == latest ? _self.latest : latest // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeRange].
extension TimeRangePatterns on TimeRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeRange value)  $default,){
final _that = this;
switch (_that) {
case _TimeRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeRange value)?  $default,){
final _that = this;
switch (_that) {
case _TimeRange() when $default != null:
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
case _TimeRange() when $default != null:
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
case _TimeRange():
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
case _TimeRange() when $default != null:
return $default(_that.earliest,_that.latest);case _:
  return null;

}
}

}

/// @nodoc


class _TimeRange implements TimeRange {
  const _TimeRange({this.earliest, this.latest});
  

@override final  String? earliest;
@override final  String? latest;

/// Create a copy of TimeRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeRangeCopyWith<_TimeRange> get copyWith => __$TimeRangeCopyWithImpl<_TimeRange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeRange&&(identical(other.earliest, earliest) || other.earliest == earliest)&&(identical(other.latest, latest) || other.latest == latest));
}


@override
int get hashCode => Object.hash(runtimeType,earliest,latest);

@override
String toString() {
  return 'TimeRange(earliest: $earliest, latest: $latest)';
}


}

/// @nodoc
abstract mixin class _$TimeRangeCopyWith<$Res> implements $TimeRangeCopyWith<$Res> {
  factory _$TimeRangeCopyWith(_TimeRange value, $Res Function(_TimeRange) _then) = __$TimeRangeCopyWithImpl;
@override @useResult
$Res call({
 String? earliest, String? latest
});




}
/// @nodoc
class __$TimeRangeCopyWithImpl<$Res>
    implements _$TimeRangeCopyWith<$Res> {
  __$TimeRangeCopyWithImpl(this._self, this._then);

  final _TimeRange _self;
  final $Res Function(_TimeRange) _then;

/// Create a copy of TimeRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? earliest = freezed,Object? latest = freezed,}) {
  return _then(_TimeRange(
earliest: freezed == earliest ? _self.earliest : earliest // ignore: cast_nullable_to_non_nullable
as String?,latest: freezed == latest ? _self.latest : latest // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
