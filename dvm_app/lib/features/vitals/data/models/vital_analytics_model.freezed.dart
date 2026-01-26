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

@JsonKey(name: 'rolling_average') RollingAverageModel get rollingAverage;@JsonKey(name: 'min_max') MinMaxStatsModel get minMax;@JsonKey(name: 'total_logs') int get totalLogs;@JsonKey(name: 'latest_timestamp') String? get latestTimestamp;@JsonKey(name: 'device_count') int get deviceCount;@JsonKey(name: 'time_range') TimeRangeModel get timeRange;
/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalAnalyticsModelCopyWith<VitalAnalyticsModel> get copyWith => _$VitalAnalyticsModelCopyWithImpl<VitalAnalyticsModel>(this as VitalAnalyticsModel, _$identity);

  /// Serializes this VitalAnalyticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalAnalyticsModel&&(identical(other.rollingAverage, rollingAverage) || other.rollingAverage == rollingAverage)&&(identical(other.minMax, minMax) || other.minMax == minMax)&&(identical(other.totalLogs, totalLogs) || other.totalLogs == totalLogs)&&(identical(other.latestTimestamp, latestTimestamp) || other.latestTimestamp == latestTimestamp)&&(identical(other.deviceCount, deviceCount) || other.deviceCount == deviceCount)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rollingAverage,minMax,totalLogs,latestTimestamp,deviceCount,timeRange);

@override
String toString() {
  return 'VitalAnalyticsModel(rollingAverage: $rollingAverage, minMax: $minMax, totalLogs: $totalLogs, latestTimestamp: $latestTimestamp, deviceCount: $deviceCount, timeRange: $timeRange)';
}


}

/// @nodoc
abstract mixin class $VitalAnalyticsModelCopyWith<$Res>  {
  factory $VitalAnalyticsModelCopyWith(VitalAnalyticsModel value, $Res Function(VitalAnalyticsModel) _then) = _$VitalAnalyticsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rolling_average') RollingAverageModel rollingAverage,@JsonKey(name: 'min_max') MinMaxStatsModel minMax,@JsonKey(name: 'total_logs') int totalLogs,@JsonKey(name: 'latest_timestamp') String? latestTimestamp,@JsonKey(name: 'device_count') int deviceCount,@JsonKey(name: 'time_range') TimeRangeModel timeRange
});


$RollingAverageModelCopyWith<$Res> get rollingAverage;$MinMaxStatsModelCopyWith<$Res> get minMax;$TimeRangeModelCopyWith<$Res> get timeRange;

}
/// @nodoc
class _$VitalAnalyticsModelCopyWithImpl<$Res>
    implements $VitalAnalyticsModelCopyWith<$Res> {
  _$VitalAnalyticsModelCopyWithImpl(this._self, this._then);

  final VitalAnalyticsModel _self;
  final $Res Function(VitalAnalyticsModel) _then;

/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rollingAverage = null,Object? minMax = null,Object? totalLogs = null,Object? latestTimestamp = freezed,Object? deviceCount = null,Object? timeRange = null,}) {
  return _then(_self.copyWith(
rollingAverage: null == rollingAverage ? _self.rollingAverage : rollingAverage // ignore: cast_nullable_to_non_nullable
as RollingAverageModel,minMax: null == minMax ? _self.minMax : minMax // ignore: cast_nullable_to_non_nullable
as MinMaxStatsModel,totalLogs: null == totalLogs ? _self.totalLogs : totalLogs // ignore: cast_nullable_to_non_nullable
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
$MinMaxStatsModelCopyWith<$Res> get minMax {
  
  return $MinMaxStatsModelCopyWith<$Res>(_self.minMax, (value) {
    return _then(_self.copyWith(minMax: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rolling_average')  RollingAverageModel rollingAverage, @JsonKey(name: 'min_max')  MinMaxStatsModel minMax, @JsonKey(name: 'total_logs')  int totalLogs, @JsonKey(name: 'latest_timestamp')  String? latestTimestamp, @JsonKey(name: 'device_count')  int deviceCount, @JsonKey(name: 'time_range')  TimeRangeModel timeRange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VitalAnalyticsModel() when $default != null:
return $default(_that.rollingAverage,_that.minMax,_that.totalLogs,_that.latestTimestamp,_that.deviceCount,_that.timeRange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rolling_average')  RollingAverageModel rollingAverage, @JsonKey(name: 'min_max')  MinMaxStatsModel minMax, @JsonKey(name: 'total_logs')  int totalLogs, @JsonKey(name: 'latest_timestamp')  String? latestTimestamp, @JsonKey(name: 'device_count')  int deviceCount, @JsonKey(name: 'time_range')  TimeRangeModel timeRange)  $default,) {final _that = this;
switch (_that) {
case _VitalAnalyticsModel():
return $default(_that.rollingAverage,_that.minMax,_that.totalLogs,_that.latestTimestamp,_that.deviceCount,_that.timeRange);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rolling_average')  RollingAverageModel rollingAverage, @JsonKey(name: 'min_max')  MinMaxStatsModel minMax, @JsonKey(name: 'total_logs')  int totalLogs, @JsonKey(name: 'latest_timestamp')  String? latestTimestamp, @JsonKey(name: 'device_count')  int deviceCount, @JsonKey(name: 'time_range')  TimeRangeModel timeRange)?  $default,) {final _that = this;
switch (_that) {
case _VitalAnalyticsModel() when $default != null:
return $default(_that.rollingAverage,_that.minMax,_that.totalLogs,_that.latestTimestamp,_that.deviceCount,_that.timeRange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VitalAnalyticsModel extends VitalAnalyticsModel {
  const _VitalAnalyticsModel({@JsonKey(name: 'rolling_average') required this.rollingAverage, @JsonKey(name: 'min_max') required this.minMax, @JsonKey(name: 'total_logs') required this.totalLogs, @JsonKey(name: 'latest_timestamp') this.latestTimestamp, @JsonKey(name: 'device_count') required this.deviceCount, @JsonKey(name: 'time_range') required this.timeRange}): super._();
  factory _VitalAnalyticsModel.fromJson(Map<String, dynamic> json) => _$VitalAnalyticsModelFromJson(json);

@override@JsonKey(name: 'rolling_average') final  RollingAverageModel rollingAverage;
@override@JsonKey(name: 'min_max') final  MinMaxStatsModel minMax;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VitalAnalyticsModel&&(identical(other.rollingAverage, rollingAverage) || other.rollingAverage == rollingAverage)&&(identical(other.minMax, minMax) || other.minMax == minMax)&&(identical(other.totalLogs, totalLogs) || other.totalLogs == totalLogs)&&(identical(other.latestTimestamp, latestTimestamp) || other.latestTimestamp == latestTimestamp)&&(identical(other.deviceCount, deviceCount) || other.deviceCount == deviceCount)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rollingAverage,minMax,totalLogs,latestTimestamp,deviceCount,timeRange);

@override
String toString() {
  return 'VitalAnalyticsModel(rollingAverage: $rollingAverage, minMax: $minMax, totalLogs: $totalLogs, latestTimestamp: $latestTimestamp, deviceCount: $deviceCount, timeRange: $timeRange)';
}


}

/// @nodoc
abstract mixin class _$VitalAnalyticsModelCopyWith<$Res> implements $VitalAnalyticsModelCopyWith<$Res> {
  factory _$VitalAnalyticsModelCopyWith(_VitalAnalyticsModel value, $Res Function(_VitalAnalyticsModel) _then) = __$VitalAnalyticsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rolling_average') RollingAverageModel rollingAverage,@JsonKey(name: 'min_max') MinMaxStatsModel minMax,@JsonKey(name: 'total_logs') int totalLogs,@JsonKey(name: 'latest_timestamp') String? latestTimestamp,@JsonKey(name: 'device_count') int deviceCount,@JsonKey(name: 'time_range') TimeRangeModel timeRange
});


@override $RollingAverageModelCopyWith<$Res> get rollingAverage;@override $MinMaxStatsModelCopyWith<$Res> get minMax;@override $TimeRangeModelCopyWith<$Res> get timeRange;

}
/// @nodoc
class __$VitalAnalyticsModelCopyWithImpl<$Res>
    implements _$VitalAnalyticsModelCopyWith<$Res> {
  __$VitalAnalyticsModelCopyWithImpl(this._self, this._then);

  final _VitalAnalyticsModel _self;
  final $Res Function(_VitalAnalyticsModel) _then;

/// Create a copy of VitalAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rollingAverage = null,Object? minMax = null,Object? totalLogs = null,Object? latestTimestamp = freezed,Object? deviceCount = null,Object? timeRange = null,}) {
  return _then(_VitalAnalyticsModel(
rollingAverage: null == rollingAverage ? _self.rollingAverage : rollingAverage // ignore: cast_nullable_to_non_nullable
as RollingAverageModel,minMax: null == minMax ? _self.minMax : minMax // ignore: cast_nullable_to_non_nullable
as MinMaxStatsModel,totalLogs: null == totalLogs ? _self.totalLogs : totalLogs // ignore: cast_nullable_to_non_nullable
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
$MinMaxStatsModelCopyWith<$Res> get minMax {
  
  return $MinMaxStatsModelCopyWith<$Res>(_self.minMax, (value) {
    return _then(_self.copyWith(minMax: value));
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
mixin _$MinMaxStatsModel {

@JsonKey(name: 'all_time') PeriodStatsModel get allTime;@JsonKey(name: 'last_hour') PeriodStatsModel get lastHour;@JsonKey(name: 'last_day') PeriodStatsModel get lastDay;@JsonKey(name: 'last_week') PeriodStatsModel get lastWeek;
/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MinMaxStatsModelCopyWith<MinMaxStatsModel> get copyWith => _$MinMaxStatsModelCopyWithImpl<MinMaxStatsModel>(this as MinMaxStatsModel, _$identity);

  /// Serializes this MinMaxStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinMaxStatsModel&&(identical(other.allTime, allTime) || other.allTime == allTime)&&(identical(other.lastHour, lastHour) || other.lastHour == lastHour)&&(identical(other.lastDay, lastDay) || other.lastDay == lastDay)&&(identical(other.lastWeek, lastWeek) || other.lastWeek == lastWeek));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allTime,lastHour,lastDay,lastWeek);

@override
String toString() {
  return 'MinMaxStatsModel(allTime: $allTime, lastHour: $lastHour, lastDay: $lastDay, lastWeek: $lastWeek)';
}


}

/// @nodoc
abstract mixin class $MinMaxStatsModelCopyWith<$Res>  {
  factory $MinMaxStatsModelCopyWith(MinMaxStatsModel value, $Res Function(MinMaxStatsModel) _then) = _$MinMaxStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'all_time') PeriodStatsModel allTime,@JsonKey(name: 'last_hour') PeriodStatsModel lastHour,@JsonKey(name: 'last_day') PeriodStatsModel lastDay,@JsonKey(name: 'last_week') PeriodStatsModel lastWeek
});


$PeriodStatsModelCopyWith<$Res> get allTime;$PeriodStatsModelCopyWith<$Res> get lastHour;$PeriodStatsModelCopyWith<$Res> get lastDay;$PeriodStatsModelCopyWith<$Res> get lastWeek;

}
/// @nodoc
class _$MinMaxStatsModelCopyWithImpl<$Res>
    implements $MinMaxStatsModelCopyWith<$Res> {
  _$MinMaxStatsModelCopyWithImpl(this._self, this._then);

  final MinMaxStatsModel _self;
  final $Res Function(MinMaxStatsModel) _then;

/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allTime = null,Object? lastHour = null,Object? lastDay = null,Object? lastWeek = null,}) {
  return _then(_self.copyWith(
allTime: null == allTime ? _self.allTime : allTime // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,lastHour: null == lastHour ? _self.lastHour : lastHour // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,lastDay: null == lastDay ? _self.lastDay : lastDay // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,lastWeek: null == lastWeek ? _self.lastWeek : lastWeek // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,
  ));
}
/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get allTime {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.allTime, (value) {
    return _then(_self.copyWith(allTime: value));
  });
}/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get lastHour {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.lastHour, (value) {
    return _then(_self.copyWith(lastHour: value));
  });
}/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get lastDay {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.lastDay, (value) {
    return _then(_self.copyWith(lastDay: value));
  });
}/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get lastWeek {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.lastWeek, (value) {
    return _then(_self.copyWith(lastWeek: value));
  });
}
}


/// Adds pattern-matching-related methods to [MinMaxStatsModel].
extension MinMaxStatsModelPatterns on MinMaxStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MinMaxStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MinMaxStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MinMaxStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _MinMaxStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MinMaxStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _MinMaxStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'all_time')  PeriodStatsModel allTime, @JsonKey(name: 'last_hour')  PeriodStatsModel lastHour, @JsonKey(name: 'last_day')  PeriodStatsModel lastDay, @JsonKey(name: 'last_week')  PeriodStatsModel lastWeek)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MinMaxStatsModel() when $default != null:
return $default(_that.allTime,_that.lastHour,_that.lastDay,_that.lastWeek);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'all_time')  PeriodStatsModel allTime, @JsonKey(name: 'last_hour')  PeriodStatsModel lastHour, @JsonKey(name: 'last_day')  PeriodStatsModel lastDay, @JsonKey(name: 'last_week')  PeriodStatsModel lastWeek)  $default,) {final _that = this;
switch (_that) {
case _MinMaxStatsModel():
return $default(_that.allTime,_that.lastHour,_that.lastDay,_that.lastWeek);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'all_time')  PeriodStatsModel allTime, @JsonKey(name: 'last_hour')  PeriodStatsModel lastHour, @JsonKey(name: 'last_day')  PeriodStatsModel lastDay, @JsonKey(name: 'last_week')  PeriodStatsModel lastWeek)?  $default,) {final _that = this;
switch (_that) {
case _MinMaxStatsModel() when $default != null:
return $default(_that.allTime,_that.lastHour,_that.lastDay,_that.lastWeek);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MinMaxStatsModel extends MinMaxStatsModel {
  const _MinMaxStatsModel({@JsonKey(name: 'all_time') required this.allTime, @JsonKey(name: 'last_hour') required this.lastHour, @JsonKey(name: 'last_day') required this.lastDay, @JsonKey(name: 'last_week') required this.lastWeek}): super._();
  factory _MinMaxStatsModel.fromJson(Map<String, dynamic> json) => _$MinMaxStatsModelFromJson(json);

@override@JsonKey(name: 'all_time') final  PeriodStatsModel allTime;
@override@JsonKey(name: 'last_hour') final  PeriodStatsModel lastHour;
@override@JsonKey(name: 'last_day') final  PeriodStatsModel lastDay;
@override@JsonKey(name: 'last_week') final  PeriodStatsModel lastWeek;

/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MinMaxStatsModelCopyWith<_MinMaxStatsModel> get copyWith => __$MinMaxStatsModelCopyWithImpl<_MinMaxStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MinMaxStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MinMaxStatsModel&&(identical(other.allTime, allTime) || other.allTime == allTime)&&(identical(other.lastHour, lastHour) || other.lastHour == lastHour)&&(identical(other.lastDay, lastDay) || other.lastDay == lastDay)&&(identical(other.lastWeek, lastWeek) || other.lastWeek == lastWeek));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allTime,lastHour,lastDay,lastWeek);

@override
String toString() {
  return 'MinMaxStatsModel(allTime: $allTime, lastHour: $lastHour, lastDay: $lastDay, lastWeek: $lastWeek)';
}


}

/// @nodoc
abstract mixin class _$MinMaxStatsModelCopyWith<$Res> implements $MinMaxStatsModelCopyWith<$Res> {
  factory _$MinMaxStatsModelCopyWith(_MinMaxStatsModel value, $Res Function(_MinMaxStatsModel) _then) = __$MinMaxStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'all_time') PeriodStatsModel allTime,@JsonKey(name: 'last_hour') PeriodStatsModel lastHour,@JsonKey(name: 'last_day') PeriodStatsModel lastDay,@JsonKey(name: 'last_week') PeriodStatsModel lastWeek
});


@override $PeriodStatsModelCopyWith<$Res> get allTime;@override $PeriodStatsModelCopyWith<$Res> get lastHour;@override $PeriodStatsModelCopyWith<$Res> get lastDay;@override $PeriodStatsModelCopyWith<$Res> get lastWeek;

}
/// @nodoc
class __$MinMaxStatsModelCopyWithImpl<$Res>
    implements _$MinMaxStatsModelCopyWith<$Res> {
  __$MinMaxStatsModelCopyWithImpl(this._self, this._then);

  final _MinMaxStatsModel _self;
  final $Res Function(_MinMaxStatsModel) _then;

/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allTime = null,Object? lastHour = null,Object? lastDay = null,Object? lastWeek = null,}) {
  return _then(_MinMaxStatsModel(
allTime: null == allTime ? _self.allTime : allTime // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,lastHour: null == lastHour ? _self.lastHour : lastHour // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,lastDay: null == lastDay ? _self.lastDay : lastDay // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,lastWeek: null == lastWeek ? _self.lastWeek : lastWeek // ignore: cast_nullable_to_non_nullable
as PeriodStatsModel,
  ));
}

/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get allTime {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.allTime, (value) {
    return _then(_self.copyWith(allTime: value));
  });
}/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get lastHour {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.lastHour, (value) {
    return _then(_self.copyWith(lastHour: value));
  });
}/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get lastDay {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.lastDay, (value) {
    return _then(_self.copyWith(lastDay: value));
  });
}/// Create a copy of MinMaxStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<$Res> get lastWeek {
  
  return $PeriodStatsModelCopyWith<$Res>(_self.lastWeek, (value) {
    return _then(_self.copyWith(lastWeek: value));
  });
}
}


/// @nodoc
mixin _$PeriodStatsModel {

 MinMaxValuesModel get thermal; MinMaxValuesModel get battery; MinMaxValuesModel get memory;
/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodStatsModelCopyWith<PeriodStatsModel> get copyWith => _$PeriodStatsModelCopyWithImpl<PeriodStatsModel>(this as PeriodStatsModel, _$identity);

  /// Serializes this PeriodStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeriodStatsModel&&(identical(other.thermal, thermal) || other.thermal == thermal)&&(identical(other.battery, battery) || other.battery == battery)&&(identical(other.memory, memory) || other.memory == memory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thermal,battery,memory);

@override
String toString() {
  return 'PeriodStatsModel(thermal: $thermal, battery: $battery, memory: $memory)';
}


}

/// @nodoc
abstract mixin class $PeriodStatsModelCopyWith<$Res>  {
  factory $PeriodStatsModelCopyWith(PeriodStatsModel value, $Res Function(PeriodStatsModel) _then) = _$PeriodStatsModelCopyWithImpl;
@useResult
$Res call({
 MinMaxValuesModel thermal, MinMaxValuesModel battery, MinMaxValuesModel memory
});


$MinMaxValuesModelCopyWith<$Res> get thermal;$MinMaxValuesModelCopyWith<$Res> get battery;$MinMaxValuesModelCopyWith<$Res> get memory;

}
/// @nodoc
class _$PeriodStatsModelCopyWithImpl<$Res>
    implements $PeriodStatsModelCopyWith<$Res> {
  _$PeriodStatsModelCopyWithImpl(this._self, this._then);

  final PeriodStatsModel _self;
  final $Res Function(PeriodStatsModel) _then;

/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thermal = null,Object? battery = null,Object? memory = null,}) {
  return _then(_self.copyWith(
thermal: null == thermal ? _self.thermal : thermal // ignore: cast_nullable_to_non_nullable
as MinMaxValuesModel,battery: null == battery ? _self.battery : battery // ignore: cast_nullable_to_non_nullable
as MinMaxValuesModel,memory: null == memory ? _self.memory : memory // ignore: cast_nullable_to_non_nullable
as MinMaxValuesModel,
  ));
}
/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinMaxValuesModelCopyWith<$Res> get thermal {
  
  return $MinMaxValuesModelCopyWith<$Res>(_self.thermal, (value) {
    return _then(_self.copyWith(thermal: value));
  });
}/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinMaxValuesModelCopyWith<$Res> get battery {
  
  return $MinMaxValuesModelCopyWith<$Res>(_self.battery, (value) {
    return _then(_self.copyWith(battery: value));
  });
}/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinMaxValuesModelCopyWith<$Res> get memory {
  
  return $MinMaxValuesModelCopyWith<$Res>(_self.memory, (value) {
    return _then(_self.copyWith(memory: value));
  });
}
}


/// Adds pattern-matching-related methods to [PeriodStatsModel].
extension PeriodStatsModelPatterns on PeriodStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeriodStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeriodStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeriodStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _PeriodStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeriodStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PeriodStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MinMaxValuesModel thermal,  MinMaxValuesModel battery,  MinMaxValuesModel memory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeriodStatsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MinMaxValuesModel thermal,  MinMaxValuesModel battery,  MinMaxValuesModel memory)  $default,) {final _that = this;
switch (_that) {
case _PeriodStatsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MinMaxValuesModel thermal,  MinMaxValuesModel battery,  MinMaxValuesModel memory)?  $default,) {final _that = this;
switch (_that) {
case _PeriodStatsModel() when $default != null:
return $default(_that.thermal,_that.battery,_that.memory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PeriodStatsModel extends PeriodStatsModel {
  const _PeriodStatsModel({required this.thermal, required this.battery, required this.memory}): super._();
  factory _PeriodStatsModel.fromJson(Map<String, dynamic> json) => _$PeriodStatsModelFromJson(json);

@override final  MinMaxValuesModel thermal;
@override final  MinMaxValuesModel battery;
@override final  MinMaxValuesModel memory;

/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodStatsModelCopyWith<_PeriodStatsModel> get copyWith => __$PeriodStatsModelCopyWithImpl<_PeriodStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PeriodStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeriodStatsModel&&(identical(other.thermal, thermal) || other.thermal == thermal)&&(identical(other.battery, battery) || other.battery == battery)&&(identical(other.memory, memory) || other.memory == memory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thermal,battery,memory);

@override
String toString() {
  return 'PeriodStatsModel(thermal: $thermal, battery: $battery, memory: $memory)';
}


}

/// @nodoc
abstract mixin class _$PeriodStatsModelCopyWith<$Res> implements $PeriodStatsModelCopyWith<$Res> {
  factory _$PeriodStatsModelCopyWith(_PeriodStatsModel value, $Res Function(_PeriodStatsModel) _then) = __$PeriodStatsModelCopyWithImpl;
@override @useResult
$Res call({
 MinMaxValuesModel thermal, MinMaxValuesModel battery, MinMaxValuesModel memory
});


@override $MinMaxValuesModelCopyWith<$Res> get thermal;@override $MinMaxValuesModelCopyWith<$Res> get battery;@override $MinMaxValuesModelCopyWith<$Res> get memory;

}
/// @nodoc
class __$PeriodStatsModelCopyWithImpl<$Res>
    implements _$PeriodStatsModelCopyWith<$Res> {
  __$PeriodStatsModelCopyWithImpl(this._self, this._then);

  final _PeriodStatsModel _self;
  final $Res Function(_PeriodStatsModel) _then;

/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thermal = null,Object? battery = null,Object? memory = null,}) {
  return _then(_PeriodStatsModel(
thermal: null == thermal ? _self.thermal : thermal // ignore: cast_nullable_to_non_nullable
as MinMaxValuesModel,battery: null == battery ? _self.battery : battery // ignore: cast_nullable_to_non_nullable
as MinMaxValuesModel,memory: null == memory ? _self.memory : memory // ignore: cast_nullable_to_non_nullable
as MinMaxValuesModel,
  ));
}

/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinMaxValuesModelCopyWith<$Res> get thermal {
  
  return $MinMaxValuesModelCopyWith<$Res>(_self.thermal, (value) {
    return _then(_self.copyWith(thermal: value));
  });
}/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinMaxValuesModelCopyWith<$Res> get battery {
  
  return $MinMaxValuesModelCopyWith<$Res>(_self.battery, (value) {
    return _then(_self.copyWith(battery: value));
  });
}/// Create a copy of PeriodStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MinMaxValuesModelCopyWith<$Res> get memory {
  
  return $MinMaxValuesModelCopyWith<$Res>(_self.memory, (value) {
    return _then(_self.copyWith(memory: value));
  });
}
}


/// @nodoc
mixin _$MinMaxValuesModel {

 double get min; double get max;
/// Create a copy of MinMaxValuesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MinMaxValuesModelCopyWith<MinMaxValuesModel> get copyWith => _$MinMaxValuesModelCopyWithImpl<MinMaxValuesModel>(this as MinMaxValuesModel, _$identity);

  /// Serializes this MinMaxValuesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinMaxValuesModel&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min,max);

@override
String toString() {
  return 'MinMaxValuesModel(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class $MinMaxValuesModelCopyWith<$Res>  {
  factory $MinMaxValuesModelCopyWith(MinMaxValuesModel value, $Res Function(MinMaxValuesModel) _then) = _$MinMaxValuesModelCopyWithImpl;
@useResult
$Res call({
 double min, double max
});




}
/// @nodoc
class _$MinMaxValuesModelCopyWithImpl<$Res>
    implements $MinMaxValuesModelCopyWith<$Res> {
  _$MinMaxValuesModelCopyWithImpl(this._self, this._then);

  final MinMaxValuesModel _self;
  final $Res Function(MinMaxValuesModel) _then;

/// Create a copy of MinMaxValuesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,}) {
  return _then(_self.copyWith(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MinMaxValuesModel].
extension MinMaxValuesModelPatterns on MinMaxValuesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MinMaxValuesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MinMaxValuesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MinMaxValuesModel value)  $default,){
final _that = this;
switch (_that) {
case _MinMaxValuesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MinMaxValuesModel value)?  $default,){
final _that = this;
switch (_that) {
case _MinMaxValuesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double min,  double max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MinMaxValuesModel() when $default != null:
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double min,  double max)  $default,) {final _that = this;
switch (_that) {
case _MinMaxValuesModel():
return $default(_that.min,_that.max);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double min,  double max)?  $default,) {final _that = this;
switch (_that) {
case _MinMaxValuesModel() when $default != null:
return $default(_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MinMaxValuesModel extends MinMaxValuesModel {
  const _MinMaxValuesModel({required this.min, required this.max}): super._();
  factory _MinMaxValuesModel.fromJson(Map<String, dynamic> json) => _$MinMaxValuesModelFromJson(json);

@override final  double min;
@override final  double max;

/// Create a copy of MinMaxValuesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MinMaxValuesModelCopyWith<_MinMaxValuesModel> get copyWith => __$MinMaxValuesModelCopyWithImpl<_MinMaxValuesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MinMaxValuesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MinMaxValuesModel&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min,max);

@override
String toString() {
  return 'MinMaxValuesModel(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$MinMaxValuesModelCopyWith<$Res> implements $MinMaxValuesModelCopyWith<$Res> {
  factory _$MinMaxValuesModelCopyWith(_MinMaxValuesModel value, $Res Function(_MinMaxValuesModel) _then) = __$MinMaxValuesModelCopyWithImpl;
@override @useResult
$Res call({
 double min, double max
});




}
/// @nodoc
class __$MinMaxValuesModelCopyWithImpl<$Res>
    implements _$MinMaxValuesModelCopyWith<$Res> {
  __$MinMaxValuesModelCopyWithImpl(this._self, this._then);

  final _MinMaxValuesModel _self;
  final $Res Function(_MinMaxValuesModel) _then;

/// Create a copy of MinMaxValuesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,}) {
  return _then(_MinMaxValuesModel(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,
  ));
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
