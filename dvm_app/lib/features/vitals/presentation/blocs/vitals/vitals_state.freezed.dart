// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vitals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VitalsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VitalsState()';
}


}

/// @nodoc
class $VitalsStateCopyWith<$Res>  {
$VitalsStateCopyWith(VitalsState _, $Res Function(VitalsState) __);
}


/// Adds pattern-matching-related methods to [VitalsState].
extension VitalsStatePatterns on VitalsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VitalsInitial value)?  initial,TResult Function( VitalsPosting value)?  posting,TResult Function( VitalsPosted value)?  posted,TResult Function( VitalsLoadingHistory value)?  loadingHistory,TResult Function( VitalsHistoryLoaded value)?  historyLoaded,TResult Function( VitalsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VitalsInitial() when initial != null:
return initial(_that);case VitalsPosting() when posting != null:
return posting(_that);case VitalsPosted() when posted != null:
return posted(_that);case VitalsLoadingHistory() when loadingHistory != null:
return loadingHistory(_that);case VitalsHistoryLoaded() when historyLoaded != null:
return historyLoaded(_that);case VitalsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VitalsInitial value)  initial,required TResult Function( VitalsPosting value)  posting,required TResult Function( VitalsPosted value)  posted,required TResult Function( VitalsLoadingHistory value)  loadingHistory,required TResult Function( VitalsHistoryLoaded value)  historyLoaded,required TResult Function( VitalsError value)  error,}){
final _that = this;
switch (_that) {
case VitalsInitial():
return initial(_that);case VitalsPosting():
return posting(_that);case VitalsPosted():
return posted(_that);case VitalsLoadingHistory():
return loadingHistory(_that);case VitalsHistoryLoaded():
return historyLoaded(_that);case VitalsError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VitalsInitial value)?  initial,TResult? Function( VitalsPosting value)?  posting,TResult? Function( VitalsPosted value)?  posted,TResult? Function( VitalsLoadingHistory value)?  loadingHistory,TResult? Function( VitalsHistoryLoaded value)?  historyLoaded,TResult? Function( VitalsError value)?  error,}){
final _that = this;
switch (_that) {
case VitalsInitial() when initial != null:
return initial(_that);case VitalsPosting() when posting != null:
return posting(_that);case VitalsPosted() when posted != null:
return posted(_that);case VitalsLoadingHistory() when loadingHistory != null:
return loadingHistory(_that);case VitalsHistoryLoaded() when historyLoaded != null:
return historyLoaded(_that);case VitalsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  posting,TResult Function()?  posted,TResult Function()?  loadingHistory,TResult Function( List<VitalLog> logs)?  historyLoaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VitalsInitial() when initial != null:
return initial();case VitalsPosting() when posting != null:
return posting();case VitalsPosted() when posted != null:
return posted();case VitalsLoadingHistory() when loadingHistory != null:
return loadingHistory();case VitalsHistoryLoaded() when historyLoaded != null:
return historyLoaded(_that.logs);case VitalsError() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  posting,required TResult Function()  posted,required TResult Function()  loadingHistory,required TResult Function( List<VitalLog> logs)  historyLoaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case VitalsInitial():
return initial();case VitalsPosting():
return posting();case VitalsPosted():
return posted();case VitalsLoadingHistory():
return loadingHistory();case VitalsHistoryLoaded():
return historyLoaded(_that.logs);case VitalsError():
return error(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  posting,TResult? Function()?  posted,TResult? Function()?  loadingHistory,TResult? Function( List<VitalLog> logs)?  historyLoaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case VitalsInitial() when initial != null:
return initial();case VitalsPosting() when posting != null:
return posting();case VitalsPosted() when posted != null:
return posted();case VitalsLoadingHistory() when loadingHistory != null:
return loadingHistory();case VitalsHistoryLoaded() when historyLoaded != null:
return historyLoaded(_that.logs);case VitalsError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class VitalsInitial implements VitalsState {
  const VitalsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VitalsState.initial()';
}


}




/// @nodoc


class VitalsPosting implements VitalsState {
  const VitalsPosting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalsPosting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VitalsState.posting()';
}


}




/// @nodoc


class VitalsPosted implements VitalsState {
  const VitalsPosted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalsPosted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VitalsState.posted()';
}


}




/// @nodoc


class VitalsLoadingHistory implements VitalsState {
  const VitalsLoadingHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalsLoadingHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VitalsState.loadingHistory()';
}


}




/// @nodoc


class VitalsHistoryLoaded implements VitalsState {
  const VitalsHistoryLoaded(final  List<VitalLog> logs): _logs = logs;
  

 final  List<VitalLog> _logs;
 List<VitalLog> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}


/// Create a copy of VitalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalsHistoryLoadedCopyWith<VitalsHistoryLoaded> get copyWith => _$VitalsHistoryLoadedCopyWithImpl<VitalsHistoryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalsHistoryLoaded&&const DeepCollectionEquality().equals(other._logs, _logs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs));

@override
String toString() {
  return 'VitalsState.historyLoaded(logs: $logs)';
}


}

/// @nodoc
abstract mixin class $VitalsHistoryLoadedCopyWith<$Res> implements $VitalsStateCopyWith<$Res> {
  factory $VitalsHistoryLoadedCopyWith(VitalsHistoryLoaded value, $Res Function(VitalsHistoryLoaded) _then) = _$VitalsHistoryLoadedCopyWithImpl;
@useResult
$Res call({
 List<VitalLog> logs
});




}
/// @nodoc
class _$VitalsHistoryLoadedCopyWithImpl<$Res>
    implements $VitalsHistoryLoadedCopyWith<$Res> {
  _$VitalsHistoryLoadedCopyWithImpl(this._self, this._then);

  final VitalsHistoryLoaded _self;
  final $Res Function(VitalsHistoryLoaded) _then;

/// Create a copy of VitalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? logs = null,}) {
  return _then(VitalsHistoryLoaded(
null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<VitalLog>,
  ));
}


}

/// @nodoc


class VitalsError implements VitalsState {
  const VitalsError(this.failure);
  

 final  Failure failure;

/// Create a copy of VitalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VitalsErrorCopyWith<VitalsError> get copyWith => _$VitalsErrorCopyWithImpl<VitalsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VitalsError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'VitalsState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $VitalsErrorCopyWith<$Res> implements $VitalsStateCopyWith<$Res> {
  factory $VitalsErrorCopyWith(VitalsError value, $Res Function(VitalsError) _then) = _$VitalsErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$VitalsErrorCopyWithImpl<$Res>
    implements $VitalsErrorCopyWith<$Res> {
  _$VitalsErrorCopyWithImpl(this._self, this._then);

  final VitalsError _self;
  final $Res Function(VitalsError) _then;

/// Create a copy of VitalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(VitalsError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of VitalsState
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
