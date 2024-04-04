// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingsDTO patient) addBookingsPatient,
    required TResult Function(BookingsDTO patient) addNewBookingsPatient,
    required TResult Function(String patientId) getBookingsPatientsDetails,
    required TResult Function(String patientId) deleteBookingsPatientDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingsDTO patient)? addBookingsPatient,
    TResult? Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult? Function(String patientId)? getBookingsPatientsDetails,
    TResult? Function(String patientId)? deleteBookingsPatientDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingsDTO patient)? addBookingsPatient,
    TResult Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult Function(String patientId)? getBookingsPatientsDetails,
    TResult Function(String patientId)? deleteBookingsPatientDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addBookingsPatient value) addBookingsPatient,
    required TResult Function(addNewBookingsPatient value)
        addNewBookingsPatient,
    required TResult Function(getBookingsPatientsDetails value)
        getBookingsPatientsDetails,
    required TResult Function(deleteBookingsPatientDetail value)
        deleteBookingsPatientDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addBookingsPatient value)? addBookingsPatient,
    TResult? Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult? Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult? Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addBookingsPatient value)? addBookingsPatient,
    TResult Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingsEventCopyWith<$Res> {
  factory $BookingsEventCopyWith(
          BookingsEvent value, $Res Function(BookingsEvent) then) =
      _$BookingsEventCopyWithImpl<$Res, BookingsEvent>;
}

/// @nodoc
class _$BookingsEventCopyWithImpl<$Res, $Val extends BookingsEvent>
    implements $BookingsEventCopyWith<$Res> {
  _$BookingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$addBookingsPatientImplCopyWith<$Res> {
  factory _$$addBookingsPatientImplCopyWith(_$addBookingsPatientImpl value,
          $Res Function(_$addBookingsPatientImpl) then) =
      __$$addBookingsPatientImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BookingsDTO patient});
}

/// @nodoc
class __$$addBookingsPatientImplCopyWithImpl<$Res>
    extends _$BookingsEventCopyWithImpl<$Res, _$addBookingsPatientImpl>
    implements _$$addBookingsPatientImplCopyWith<$Res> {
  __$$addBookingsPatientImplCopyWithImpl(_$addBookingsPatientImpl _value,
      $Res Function(_$addBookingsPatientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
  }) {
    return _then(_$addBookingsPatientImpl(
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as BookingsDTO,
    ));
  }
}

/// @nodoc

class _$addBookingsPatientImpl implements addBookingsPatient {
  const _$addBookingsPatientImpl({required this.patient});

  @override
  final BookingsDTO patient;

  @override
  String toString() {
    return 'BookingsEvent.addBookingsPatient(patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addBookingsPatientImpl &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addBookingsPatientImplCopyWith<_$addBookingsPatientImpl> get copyWith =>
      __$$addBookingsPatientImplCopyWithImpl<_$addBookingsPatientImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingsDTO patient) addBookingsPatient,
    required TResult Function(BookingsDTO patient) addNewBookingsPatient,
    required TResult Function(String patientId) getBookingsPatientsDetails,
    required TResult Function(String patientId) deleteBookingsPatientDetail,
  }) {
    return addBookingsPatient(patient);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingsDTO patient)? addBookingsPatient,
    TResult? Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult? Function(String patientId)? getBookingsPatientsDetails,
    TResult? Function(String patientId)? deleteBookingsPatientDetail,
  }) {
    return addBookingsPatient?.call(patient);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingsDTO patient)? addBookingsPatient,
    TResult Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult Function(String patientId)? getBookingsPatientsDetails,
    TResult Function(String patientId)? deleteBookingsPatientDetail,
    required TResult orElse(),
  }) {
    if (addBookingsPatient != null) {
      return addBookingsPatient(patient);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addBookingsPatient value) addBookingsPatient,
    required TResult Function(addNewBookingsPatient value)
        addNewBookingsPatient,
    required TResult Function(getBookingsPatientsDetails value)
        getBookingsPatientsDetails,
    required TResult Function(deleteBookingsPatientDetail value)
        deleteBookingsPatientDetail,
  }) {
    return addBookingsPatient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addBookingsPatient value)? addBookingsPatient,
    TResult? Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult? Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult? Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
  }) {
    return addBookingsPatient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addBookingsPatient value)? addBookingsPatient,
    TResult Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
    required TResult orElse(),
  }) {
    if (addBookingsPatient != null) {
      return addBookingsPatient(this);
    }
    return orElse();
  }
}

abstract class addBookingsPatient implements BookingsEvent {
  const factory addBookingsPatient({required final BookingsDTO patient}) =
      _$addBookingsPatientImpl;

  BookingsDTO get patient;
  @JsonKey(ignore: true)
  _$$addBookingsPatientImplCopyWith<_$addBookingsPatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$addNewBookingsPatientImplCopyWith<$Res> {
  factory _$$addNewBookingsPatientImplCopyWith(
          _$addNewBookingsPatientImpl value,
          $Res Function(_$addNewBookingsPatientImpl) then) =
      __$$addNewBookingsPatientImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BookingsDTO patient});
}

/// @nodoc
class __$$addNewBookingsPatientImplCopyWithImpl<$Res>
    extends _$BookingsEventCopyWithImpl<$Res, _$addNewBookingsPatientImpl>
    implements _$$addNewBookingsPatientImplCopyWith<$Res> {
  __$$addNewBookingsPatientImplCopyWithImpl(_$addNewBookingsPatientImpl _value,
      $Res Function(_$addNewBookingsPatientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
  }) {
    return _then(_$addNewBookingsPatientImpl(
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as BookingsDTO,
    ));
  }
}

/// @nodoc

class _$addNewBookingsPatientImpl implements addNewBookingsPatient {
  const _$addNewBookingsPatientImpl({required this.patient});

  @override
  final BookingsDTO patient;

  @override
  String toString() {
    return 'BookingsEvent.addNewBookingsPatient(patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addNewBookingsPatientImpl &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addNewBookingsPatientImplCopyWith<_$addNewBookingsPatientImpl>
      get copyWith => __$$addNewBookingsPatientImplCopyWithImpl<
          _$addNewBookingsPatientImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingsDTO patient) addBookingsPatient,
    required TResult Function(BookingsDTO patient) addNewBookingsPatient,
    required TResult Function(String patientId) getBookingsPatientsDetails,
    required TResult Function(String patientId) deleteBookingsPatientDetail,
  }) {
    return addNewBookingsPatient(patient);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingsDTO patient)? addBookingsPatient,
    TResult? Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult? Function(String patientId)? getBookingsPatientsDetails,
    TResult? Function(String patientId)? deleteBookingsPatientDetail,
  }) {
    return addNewBookingsPatient?.call(patient);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingsDTO patient)? addBookingsPatient,
    TResult Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult Function(String patientId)? getBookingsPatientsDetails,
    TResult Function(String patientId)? deleteBookingsPatientDetail,
    required TResult orElse(),
  }) {
    if (addNewBookingsPatient != null) {
      return addNewBookingsPatient(patient);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addBookingsPatient value) addBookingsPatient,
    required TResult Function(addNewBookingsPatient value)
        addNewBookingsPatient,
    required TResult Function(getBookingsPatientsDetails value)
        getBookingsPatientsDetails,
    required TResult Function(deleteBookingsPatientDetail value)
        deleteBookingsPatientDetail,
  }) {
    return addNewBookingsPatient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addBookingsPatient value)? addBookingsPatient,
    TResult? Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult? Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult? Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
  }) {
    return addNewBookingsPatient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addBookingsPatient value)? addBookingsPatient,
    TResult Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
    required TResult orElse(),
  }) {
    if (addNewBookingsPatient != null) {
      return addNewBookingsPatient(this);
    }
    return orElse();
  }
}

abstract class addNewBookingsPatient implements BookingsEvent {
  const factory addNewBookingsPatient({required final BookingsDTO patient}) =
      _$addNewBookingsPatientImpl;

  BookingsDTO get patient;
  @JsonKey(ignore: true)
  _$$addNewBookingsPatientImplCopyWith<_$addNewBookingsPatientImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$getBookingsPatientsDetailsImplCopyWith<$Res> {
  factory _$$getBookingsPatientsDetailsImplCopyWith(
          _$getBookingsPatientsDetailsImpl value,
          $Res Function(_$getBookingsPatientsDetailsImpl) then) =
      __$$getBookingsPatientsDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String patientId});
}

/// @nodoc
class __$$getBookingsPatientsDetailsImplCopyWithImpl<$Res>
    extends _$BookingsEventCopyWithImpl<$Res, _$getBookingsPatientsDetailsImpl>
    implements _$$getBookingsPatientsDetailsImplCopyWith<$Res> {
  __$$getBookingsPatientsDetailsImplCopyWithImpl(
      _$getBookingsPatientsDetailsImpl _value,
      $Res Function(_$getBookingsPatientsDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
  }) {
    return _then(_$getBookingsPatientsDetailsImpl(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$getBookingsPatientsDetailsImpl implements getBookingsPatientsDetails {
  const _$getBookingsPatientsDetailsImpl({required this.patientId});

  @override
  final String patientId;

  @override
  String toString() {
    return 'BookingsEvent.getBookingsPatientsDetails(patientId: $patientId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getBookingsPatientsDetailsImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getBookingsPatientsDetailsImplCopyWith<_$getBookingsPatientsDetailsImpl>
      get copyWith => __$$getBookingsPatientsDetailsImplCopyWithImpl<
          _$getBookingsPatientsDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingsDTO patient) addBookingsPatient,
    required TResult Function(BookingsDTO patient) addNewBookingsPatient,
    required TResult Function(String patientId) getBookingsPatientsDetails,
    required TResult Function(String patientId) deleteBookingsPatientDetail,
  }) {
    return getBookingsPatientsDetails(patientId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingsDTO patient)? addBookingsPatient,
    TResult? Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult? Function(String patientId)? getBookingsPatientsDetails,
    TResult? Function(String patientId)? deleteBookingsPatientDetail,
  }) {
    return getBookingsPatientsDetails?.call(patientId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingsDTO patient)? addBookingsPatient,
    TResult Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult Function(String patientId)? getBookingsPatientsDetails,
    TResult Function(String patientId)? deleteBookingsPatientDetail,
    required TResult orElse(),
  }) {
    if (getBookingsPatientsDetails != null) {
      return getBookingsPatientsDetails(patientId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addBookingsPatient value) addBookingsPatient,
    required TResult Function(addNewBookingsPatient value)
        addNewBookingsPatient,
    required TResult Function(getBookingsPatientsDetails value)
        getBookingsPatientsDetails,
    required TResult Function(deleteBookingsPatientDetail value)
        deleteBookingsPatientDetail,
  }) {
    return getBookingsPatientsDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addBookingsPatient value)? addBookingsPatient,
    TResult? Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult? Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult? Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
  }) {
    return getBookingsPatientsDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addBookingsPatient value)? addBookingsPatient,
    TResult Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
    required TResult orElse(),
  }) {
    if (getBookingsPatientsDetails != null) {
      return getBookingsPatientsDetails(this);
    }
    return orElse();
  }
}

abstract class getBookingsPatientsDetails implements BookingsEvent {
  const factory getBookingsPatientsDetails({required final String patientId}) =
      _$getBookingsPatientsDetailsImpl;

  String get patientId;
  @JsonKey(ignore: true)
  _$$getBookingsPatientsDetailsImplCopyWith<_$getBookingsPatientsDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$deleteBookingsPatientDetailImplCopyWith<$Res> {
  factory _$$deleteBookingsPatientDetailImplCopyWith(
          _$deleteBookingsPatientDetailImpl value,
          $Res Function(_$deleteBookingsPatientDetailImpl) then) =
      __$$deleteBookingsPatientDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String patientId});
}

/// @nodoc
class __$$deleteBookingsPatientDetailImplCopyWithImpl<$Res>
    extends _$BookingsEventCopyWithImpl<$Res, _$deleteBookingsPatientDetailImpl>
    implements _$$deleteBookingsPatientDetailImplCopyWith<$Res> {
  __$$deleteBookingsPatientDetailImplCopyWithImpl(
      _$deleteBookingsPatientDetailImpl _value,
      $Res Function(_$deleteBookingsPatientDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
  }) {
    return _then(_$deleteBookingsPatientDetailImpl(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$deleteBookingsPatientDetailImpl implements deleteBookingsPatientDetail {
  const _$deleteBookingsPatientDetailImpl({required this.patientId});

  @override
  final String patientId;

  @override
  String toString() {
    return 'BookingsEvent.deleteBookingsPatientDetail(patientId: $patientId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteBookingsPatientDetailImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deleteBookingsPatientDetailImplCopyWith<_$deleteBookingsPatientDetailImpl>
      get copyWith => __$$deleteBookingsPatientDetailImplCopyWithImpl<
          _$deleteBookingsPatientDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingsDTO patient) addBookingsPatient,
    required TResult Function(BookingsDTO patient) addNewBookingsPatient,
    required TResult Function(String patientId) getBookingsPatientsDetails,
    required TResult Function(String patientId) deleteBookingsPatientDetail,
  }) {
    return deleteBookingsPatientDetail(patientId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingsDTO patient)? addBookingsPatient,
    TResult? Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult? Function(String patientId)? getBookingsPatientsDetails,
    TResult? Function(String patientId)? deleteBookingsPatientDetail,
  }) {
    return deleteBookingsPatientDetail?.call(patientId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingsDTO patient)? addBookingsPatient,
    TResult Function(BookingsDTO patient)? addNewBookingsPatient,
    TResult Function(String patientId)? getBookingsPatientsDetails,
    TResult Function(String patientId)? deleteBookingsPatientDetail,
    required TResult orElse(),
  }) {
    if (deleteBookingsPatientDetail != null) {
      return deleteBookingsPatientDetail(patientId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addBookingsPatient value) addBookingsPatient,
    required TResult Function(addNewBookingsPatient value)
        addNewBookingsPatient,
    required TResult Function(getBookingsPatientsDetails value)
        getBookingsPatientsDetails,
    required TResult Function(deleteBookingsPatientDetail value)
        deleteBookingsPatientDetail,
  }) {
    return deleteBookingsPatientDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addBookingsPatient value)? addBookingsPatient,
    TResult? Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult? Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult? Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
  }) {
    return deleteBookingsPatientDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addBookingsPatient value)? addBookingsPatient,
    TResult Function(addNewBookingsPatient value)? addNewBookingsPatient,
    TResult Function(getBookingsPatientsDetails value)?
        getBookingsPatientsDetails,
    TResult Function(deleteBookingsPatientDetail value)?
        deleteBookingsPatientDetail,
    required TResult orElse(),
  }) {
    if (deleteBookingsPatientDetail != null) {
      return deleteBookingsPatientDetail(this);
    }
    return orElse();
  }
}

abstract class deleteBookingsPatientDetail implements BookingsEvent {
  const factory deleteBookingsPatientDetail({required final String patientId}) =
      _$deleteBookingsPatientDetailImpl;

  String get patientId;
  @JsonKey(ignore: true)
  _$$deleteBookingsPatientDetailImplCopyWith<_$deleteBookingsPatientDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() bookingInitial,
    required TResult Function(BookingsDTO patient, bool isLoading)
        displayBookedPatient,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? bookingInitial,
    TResult? Function(BookingsDTO patient, bool isLoading)?
        displayBookedPatient,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? bookingInitial,
    TResult Function(BookingsDTO patient, bool isLoading)? displayBookedPatient,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(bookingInitial value) bookingInitial,
    required TResult Function(displayPatient value) displayBookedPatient,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(bookingInitial value)? bookingInitial,
    TResult? Function(displayPatient value)? displayBookedPatient,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(bookingInitial value)? bookingInitial,
    TResult Function(displayPatient value)? displayBookedPatient,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingsStateCopyWith<$Res> {
  factory $BookingsStateCopyWith(
          BookingsState value, $Res Function(BookingsState) then) =
      _$BookingsStateCopyWithImpl<$Res, BookingsState>;
}

/// @nodoc
class _$BookingsStateCopyWithImpl<$Res, $Val extends BookingsState>
    implements $BookingsStateCopyWith<$Res> {
  _$BookingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$bookingInitialImplCopyWith<$Res> {
  factory _$$bookingInitialImplCopyWith(_$bookingInitialImpl value,
          $Res Function(_$bookingInitialImpl) then) =
      __$$bookingInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$bookingInitialImplCopyWithImpl<$Res>
    extends _$BookingsStateCopyWithImpl<$Res, _$bookingInitialImpl>
    implements _$$bookingInitialImplCopyWith<$Res> {
  __$$bookingInitialImplCopyWithImpl(
      _$bookingInitialImpl _value, $Res Function(_$bookingInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$bookingInitialImpl implements bookingInitial {
  const _$bookingInitialImpl();

  @override
  String toString() {
    return 'BookingsState.bookingInitial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$bookingInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() bookingInitial,
    required TResult Function(BookingsDTO patient, bool isLoading)
        displayBookedPatient,
  }) {
    return bookingInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? bookingInitial,
    TResult? Function(BookingsDTO patient, bool isLoading)?
        displayBookedPatient,
  }) {
    return bookingInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? bookingInitial,
    TResult Function(BookingsDTO patient, bool isLoading)? displayBookedPatient,
    required TResult orElse(),
  }) {
    if (bookingInitial != null) {
      return bookingInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(bookingInitial value) bookingInitial,
    required TResult Function(displayPatient value) displayBookedPatient,
  }) {
    return bookingInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(bookingInitial value)? bookingInitial,
    TResult? Function(displayPatient value)? displayBookedPatient,
  }) {
    return bookingInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(bookingInitial value)? bookingInitial,
    TResult Function(displayPatient value)? displayBookedPatient,
    required TResult orElse(),
  }) {
    if (bookingInitial != null) {
      return bookingInitial(this);
    }
    return orElse();
  }
}

abstract class bookingInitial implements BookingsState {
  const factory bookingInitial() = _$bookingInitialImpl;
}

/// @nodoc
abstract class _$$displayPatientImplCopyWith<$Res> {
  factory _$$displayPatientImplCopyWith(_$displayPatientImpl value,
          $Res Function(_$displayPatientImpl) then) =
      __$$displayPatientImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BookingsDTO patient, bool isLoading});
}

/// @nodoc
class __$$displayPatientImplCopyWithImpl<$Res>
    extends _$BookingsStateCopyWithImpl<$Res, _$displayPatientImpl>
    implements _$$displayPatientImplCopyWith<$Res> {
  __$$displayPatientImplCopyWithImpl(
      _$displayPatientImpl _value, $Res Function(_$displayPatientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
    Object? isLoading = null,
  }) {
    return _then(_$displayPatientImpl(
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as BookingsDTO,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$displayPatientImpl implements displayPatient {
  const _$displayPatientImpl({required this.patient, required this.isLoading});

  @override
  final BookingsDTO patient;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'BookingsState.displayBookedPatient(patient: $patient, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$displayPatientImpl &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patient, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$displayPatientImplCopyWith<_$displayPatientImpl> get copyWith =>
      __$$displayPatientImplCopyWithImpl<_$displayPatientImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() bookingInitial,
    required TResult Function(BookingsDTO patient, bool isLoading)
        displayBookedPatient,
  }) {
    return displayBookedPatient(patient, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? bookingInitial,
    TResult? Function(BookingsDTO patient, bool isLoading)?
        displayBookedPatient,
  }) {
    return displayBookedPatient?.call(patient, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? bookingInitial,
    TResult Function(BookingsDTO patient, bool isLoading)? displayBookedPatient,
    required TResult orElse(),
  }) {
    if (displayBookedPatient != null) {
      return displayBookedPatient(patient, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(bookingInitial value) bookingInitial,
    required TResult Function(displayPatient value) displayBookedPatient,
  }) {
    return displayBookedPatient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(bookingInitial value)? bookingInitial,
    TResult? Function(displayPatient value)? displayBookedPatient,
  }) {
    return displayBookedPatient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(bookingInitial value)? bookingInitial,
    TResult Function(displayPatient value)? displayBookedPatient,
    required TResult orElse(),
  }) {
    if (displayBookedPatient != null) {
      return displayBookedPatient(this);
    }
    return orElse();
  }
}

abstract class displayPatient implements BookingsState {
  const factory displayPatient(
      {required final BookingsDTO patient,
      required final bool isLoading}) = _$displayPatientImpl;

  BookingsDTO get patient;
  bool get isLoading;
  @JsonKey(ignore: true)
  _$$displayPatientImplCopyWith<_$displayPatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
