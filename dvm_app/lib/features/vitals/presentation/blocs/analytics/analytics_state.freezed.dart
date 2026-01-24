// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalyticsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsState()';
}


}

/// @nodoc
class $AnalyticsStateCopyWith<$Res>  {
$AnalyticsStateCopyWith(AnalyticsState _, $Res Function(AnalyticsState) __);
}


/// Adds pattern-matching-related methods to [AnalyticsState].
extension AnalyticsStatePatterns on AnalyticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AnalyticsInitial value)?  initial,TResult Function( AnalyticsLoading value)?  loading,TResult Function( AnalyticsSuccess value)?  success,TResult Function( AnalyticsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AnalyticsInitial() when initial != null:
return initial(_that);case AnalyticsLoading() when loading != null:
return loading(_that);case AnalyticsSuccess() when success != null:
return success(_that);case AnalyticsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AnalyticsInitial value)  initial,required TResult Function( AnalyticsLoading value)  loading,required TResult Function( AnalyticsSuccess value)  success,required TResult Function( AnalyticsFailure value)  failure,}){
final _that = this;
switch (_that) {
case AnalyticsInitial():
return initial(_that);case AnalyticsLoading():
return loading(_that);case AnalyticsSuccess():
return success(_that);case AnalyticsFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AnalyticsInitial value)?  initial,TResult? Function( AnalyticsLoading value)?  loading,TResult? Function( AnalyticsSuccess value)?  success,TResult? Function( AnalyticsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case AnalyticsInitial() when initial != null:
return initial(_that);case AnalyticsLoading() when loading != null:
return loading(_that);case AnalyticsSuccess() when success != null:
return success(_that);case AnalyticsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( VitalAnalytics analytics)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AnalyticsInitial() when initial != null:
return initial();case AnalyticsLoading() when loading != null:
return loading();case AnalyticsSuccess() when success != null:
return success(_that.analytics);case AnalyticsFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( VitalAnalytics analytics)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case AnalyticsInitial():
return initial();case AnalyticsLoading():
return loading();case AnalyticsSuccess():
return success(_that.analytics);case AnalyticsFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( VitalAnalytics analytics)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case AnalyticsInitial() when initial != null:
return initial();case AnalyticsLoading() when loading != null:
return loading();case AnalyticsSuccess() when success != null:
return success(_that.analytics);case AnalyticsFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class AnalyticsInitial implements AnalyticsState {
  const AnalyticsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsState.initial()';
}


}




/// @nodoc


class AnalyticsLoading implements AnalyticsState {
  const AnalyticsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsState.loading()';
}


}




/// @nodoc


class AnalyticsSuccess implements AnalyticsState {
  const AnalyticsSuccess(this.analytics);
  

 final  VitalAnalytics analytics;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsSuccessCopyWith<AnalyticsSuccess> get copyWith => _$AnalyticsSuccessCopyWithImpl<AnalyticsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsSuccess&&(identical(other.analytics, analytics) || other.analytics == analytics));
}


@override
int get hashCode => Object.hash(runtimeType,analytics);

@override
String toString() {
  return 'AnalyticsState.success(analytics: $analytics)';
}


}

/// @nodoc
abstract mixin class $AnalyticsSuccessCopyWith<$Res> implements $AnalyticsStateCopyWith<$Res> {
  factory $AnalyticsSuccessCopyWith(AnalyticsSuccess value, $Res Function(AnalyticsSuccess) _then) = _$AnalyticsSuccessCopyWithImpl;
@useResult
$Res call({
 VitalAnalytics analytics
});


$VitalAnalyticsCopyWith<$Res> get analytics;

}
/// @nodoc
class _$AnalyticsSuccessCopyWithImpl<$Res>
    implements $AnalyticsSuccessCopyWith<$Res> {
  _$AnalyticsSuccessCopyWithImpl(this._self, this._then);

  final AnalyticsSuccess _self;
  final $Res Function(AnalyticsSuccess) _then;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? analytics = null,}) {
  return _then(AnalyticsSuccess(
null == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as VitalAnalytics,
  ));
}

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VitalAnalyticsCopyWith<$Res> get analytics {
  
  return $VitalAnalyticsCopyWith<$Res>(_self.analytics, (value) {
    return _then(_self.copyWith(analytics: value));
  });
}
}

/// @nodoc


class AnalyticsFailure implements AnalyticsState {
  const AnalyticsFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsFailureCopyWith<AnalyticsFailure> get copyWith => _$AnalyticsFailureCopyWithImpl<AnalyticsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AnalyticsState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AnalyticsFailureCopyWith<$Res> implements $AnalyticsStateCopyWith<$Res> {
  factory $AnalyticsFailureCopyWith(AnalyticsFailure value, $Res Function(AnalyticsFailure) _then) = _$AnalyticsFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$AnalyticsFailureCopyWithImpl<$Res>
    implements $AnalyticsFailureCopyWith<$Res> {
  _$AnalyticsFailureCopyWithImpl(this._self, this._then);

  final AnalyticsFailure _self;
  final $Res Function(AnalyticsFailure) _then;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(AnalyticsFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
