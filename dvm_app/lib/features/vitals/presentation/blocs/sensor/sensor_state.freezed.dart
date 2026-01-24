// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SensorState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SensorState()';
}


}

/// @nodoc
class $SensorStateCopyWith<$Res>  {
$SensorStateCopyWith(SensorState _, $Res Function(SensorState) __);
}


/// Adds pattern-matching-related methods to [SensorState].
extension SensorStatePatterns on SensorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SensorInitial value)?  initial,TResult Function( SensorLoading value)?  loading,TResult Function( SensorSuccess value)?  success,TResult Function( SensorFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SensorInitial() when initial != null:
return initial(_that);case SensorLoading() when loading != null:
return loading(_that);case SensorSuccess() when success != null:
return success(_that);case SensorFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SensorInitial value)  initial,required TResult Function( SensorLoading value)  loading,required TResult Function( SensorSuccess value)  success,required TResult Function( SensorFailure value)  failure,}){
final _that = this;
switch (_that) {
case SensorInitial():
return initial(_that);case SensorLoading():
return loading(_that);case SensorSuccess():
return success(_that);case SensorFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SensorInitial value)?  initial,TResult? Function( SensorLoading value)?  loading,TResult? Function( SensorSuccess value)?  success,TResult? Function( SensorFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SensorInitial() when initial != null:
return initial(_that);case SensorLoading() when loading != null:
return loading(_that);case SensorSuccess() when success != null:
return success(_that);case SensorFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SensorData data)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SensorInitial() when initial != null:
return initial();case SensorLoading() when loading != null:
return loading();case SensorSuccess() when success != null:
return success(_that.data);case SensorFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SensorData data)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case SensorInitial():
return initial();case SensorLoading():
return loading();case SensorSuccess():
return success(_that.data);case SensorFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SensorData data)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case SensorInitial() when initial != null:
return initial();case SensorLoading() when loading != null:
return loading();case SensorSuccess() when success != null:
return success(_that.data);case SensorFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class SensorInitial implements SensorState {
  const SensorInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SensorState.initial()';
}


}




/// @nodoc


class SensorLoading implements SensorState {
  const SensorLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SensorState.loading()';
}


}




/// @nodoc


class SensorSuccess implements SensorState {
  const SensorSuccess(this.data);
  

 final  SensorData data;

/// Create a copy of SensorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorSuccessCopyWith<SensorSuccess> get copyWith => _$SensorSuccessCopyWithImpl<SensorSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'SensorState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $SensorSuccessCopyWith<$Res> implements $SensorStateCopyWith<$Res> {
  factory $SensorSuccessCopyWith(SensorSuccess value, $Res Function(SensorSuccess) _then) = _$SensorSuccessCopyWithImpl;
@useResult
$Res call({
 SensorData data
});


$SensorDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SensorSuccessCopyWithImpl<$Res>
    implements $SensorSuccessCopyWith<$Res> {
  _$SensorSuccessCopyWithImpl(this._self, this._then);

  final SensorSuccess _self;
  final $Res Function(SensorSuccess) _then;

/// Create a copy of SensorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(SensorSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SensorData,
  ));
}

/// Create a copy of SensorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SensorDataCopyWith<$Res> get data {
  
  return $SensorDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class SensorFailure implements SensorState {
  const SensorFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of SensorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorFailureCopyWith<SensorFailure> get copyWith => _$SensorFailureCopyWithImpl<SensorFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'SensorState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SensorFailureCopyWith<$Res> implements $SensorStateCopyWith<$Res> {
  factory $SensorFailureCopyWith(SensorFailure value, $Res Function(SensorFailure) _then) = _$SensorFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$SensorFailureCopyWithImpl<$Res>
    implements $SensorFailureCopyWith<$Res> {
  _$SensorFailureCopyWithImpl(this._self, this._then);

  final SensorFailure _self;
  final $Res Function(SensorFailure) _then;

/// Create a copy of SensorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(SensorFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of SensorState
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
