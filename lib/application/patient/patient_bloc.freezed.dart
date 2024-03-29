// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PatientsDetailsDTO patient) addPatient,
    required TResult Function(PatientsDetailsDTO patient) addNewPatient,
    required TResult Function(PatientsDetailsDTO patient, File file,
            String name, String fileExtension)
        addLabFiles,
    required TResult Function(String patientId) getPatientsDetails,
    required TResult Function(String patientId) deletePatientDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PatientsDetailsDTO patient)? addPatient,
    TResult? Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult? Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult? Function(String patientId)? getPatientsDetails,
    TResult? Function(String patientId)? deletePatientDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PatientsDetailsDTO patient)? addPatient,
    TResult Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult Function(String patientId)? getPatientsDetails,
    TResult Function(String patientId)? deletePatientDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addPatient value) addPatient,
    required TResult Function(addNewPatient value) addNewPatient,
    required TResult Function(addLabFiles value) addLabFiles,
    required TResult Function(getPatientsDetails value) getPatientsDetails,
    required TResult Function(deletePatientDetail value) deletePatientDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addPatient value)? addPatient,
    TResult? Function(addNewPatient value)? addNewPatient,
    TResult? Function(addLabFiles value)? addLabFiles,
    TResult? Function(getPatientsDetails value)? getPatientsDetails,
    TResult? Function(deletePatientDetail value)? deletePatientDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addPatient value)? addPatient,
    TResult Function(addNewPatient value)? addNewPatient,
    TResult Function(addLabFiles value)? addLabFiles,
    TResult Function(getPatientsDetails value)? getPatientsDetails,
    TResult Function(deletePatientDetail value)? deletePatientDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientEventCopyWith<$Res> {
  factory $PatientEventCopyWith(
          PatientEvent value, $Res Function(PatientEvent) then) =
      _$PatientEventCopyWithImpl<$Res, PatientEvent>;
}

/// @nodoc
class _$PatientEventCopyWithImpl<$Res, $Val extends PatientEvent>
    implements $PatientEventCopyWith<$Res> {
  _$PatientEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$addPatientImplCopyWith<$Res> {
  factory _$$addPatientImplCopyWith(
          _$addPatientImpl value, $Res Function(_$addPatientImpl) then) =
      __$$addPatientImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PatientsDetailsDTO patient});
}

/// @nodoc
class __$$addPatientImplCopyWithImpl<$Res>
    extends _$PatientEventCopyWithImpl<$Res, _$addPatientImpl>
    implements _$$addPatientImplCopyWith<$Res> {
  __$$addPatientImplCopyWithImpl(
      _$addPatientImpl _value, $Res Function(_$addPatientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
  }) {
    return _then(_$addPatientImpl(
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientsDetailsDTO,
    ));
  }
}

/// @nodoc

class _$addPatientImpl implements addPatient {
  const _$addPatientImpl({required this.patient});

  @override
  final PatientsDetailsDTO patient;

  @override
  String toString() {
    return 'PatientEvent.addPatient(patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addPatientImpl &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addPatientImplCopyWith<_$addPatientImpl> get copyWith =>
      __$$addPatientImplCopyWithImpl<_$addPatientImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PatientsDetailsDTO patient) addPatient,
    required TResult Function(PatientsDetailsDTO patient) addNewPatient,
    required TResult Function(PatientsDetailsDTO patient, File file,
            String name, String fileExtension)
        addLabFiles,
    required TResult Function(String patientId) getPatientsDetails,
    required TResult Function(String patientId) deletePatientDetail,
  }) {
    return addPatient(patient);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PatientsDetailsDTO patient)? addPatient,
    TResult? Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult? Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult? Function(String patientId)? getPatientsDetails,
    TResult? Function(String patientId)? deletePatientDetail,
  }) {
    return addPatient?.call(patient);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PatientsDetailsDTO patient)? addPatient,
    TResult Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult Function(String patientId)? getPatientsDetails,
    TResult Function(String patientId)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (addPatient != null) {
      return addPatient(patient);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addPatient value) addPatient,
    required TResult Function(addNewPatient value) addNewPatient,
    required TResult Function(addLabFiles value) addLabFiles,
    required TResult Function(getPatientsDetails value) getPatientsDetails,
    required TResult Function(deletePatientDetail value) deletePatientDetail,
  }) {
    return addPatient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addPatient value)? addPatient,
    TResult? Function(addNewPatient value)? addNewPatient,
    TResult? Function(addLabFiles value)? addLabFiles,
    TResult? Function(getPatientsDetails value)? getPatientsDetails,
    TResult? Function(deletePatientDetail value)? deletePatientDetail,
  }) {
    return addPatient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addPatient value)? addPatient,
    TResult Function(addNewPatient value)? addNewPatient,
    TResult Function(addLabFiles value)? addLabFiles,
    TResult Function(getPatientsDetails value)? getPatientsDetails,
    TResult Function(deletePatientDetail value)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (addPatient != null) {
      return addPatient(this);
    }
    return orElse();
  }
}

abstract class addPatient implements PatientEvent {
  const factory addPatient({required final PatientsDetailsDTO patient}) =
      _$addPatientImpl;

  PatientsDetailsDTO get patient;
  @JsonKey(ignore: true)
  _$$addPatientImplCopyWith<_$addPatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$addNewPatientImplCopyWith<$Res> {
  factory _$$addNewPatientImplCopyWith(
          _$addNewPatientImpl value, $Res Function(_$addNewPatientImpl) then) =
      __$$addNewPatientImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PatientsDetailsDTO patient});
}

/// @nodoc
class __$$addNewPatientImplCopyWithImpl<$Res>
    extends _$PatientEventCopyWithImpl<$Res, _$addNewPatientImpl>
    implements _$$addNewPatientImplCopyWith<$Res> {
  __$$addNewPatientImplCopyWithImpl(
      _$addNewPatientImpl _value, $Res Function(_$addNewPatientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
  }) {
    return _then(_$addNewPatientImpl(
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientsDetailsDTO,
    ));
  }
}

/// @nodoc

class _$addNewPatientImpl implements addNewPatient {
  const _$addNewPatientImpl({required this.patient});

  @override
  final PatientsDetailsDTO patient;

  @override
  String toString() {
    return 'PatientEvent.addNewPatient(patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addNewPatientImpl &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addNewPatientImplCopyWith<_$addNewPatientImpl> get copyWith =>
      __$$addNewPatientImplCopyWithImpl<_$addNewPatientImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PatientsDetailsDTO patient) addPatient,
    required TResult Function(PatientsDetailsDTO patient) addNewPatient,
    required TResult Function(PatientsDetailsDTO patient, File file,
            String name, String fileExtension)
        addLabFiles,
    required TResult Function(String patientId) getPatientsDetails,
    required TResult Function(String patientId) deletePatientDetail,
  }) {
    return addNewPatient(patient);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PatientsDetailsDTO patient)? addPatient,
    TResult? Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult? Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult? Function(String patientId)? getPatientsDetails,
    TResult? Function(String patientId)? deletePatientDetail,
  }) {
    return addNewPatient?.call(patient);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PatientsDetailsDTO patient)? addPatient,
    TResult Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult Function(String patientId)? getPatientsDetails,
    TResult Function(String patientId)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (addNewPatient != null) {
      return addNewPatient(patient);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addPatient value) addPatient,
    required TResult Function(addNewPatient value) addNewPatient,
    required TResult Function(addLabFiles value) addLabFiles,
    required TResult Function(getPatientsDetails value) getPatientsDetails,
    required TResult Function(deletePatientDetail value) deletePatientDetail,
  }) {
    return addNewPatient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addPatient value)? addPatient,
    TResult? Function(addNewPatient value)? addNewPatient,
    TResult? Function(addLabFiles value)? addLabFiles,
    TResult? Function(getPatientsDetails value)? getPatientsDetails,
    TResult? Function(deletePatientDetail value)? deletePatientDetail,
  }) {
    return addNewPatient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addPatient value)? addPatient,
    TResult Function(addNewPatient value)? addNewPatient,
    TResult Function(addLabFiles value)? addLabFiles,
    TResult Function(getPatientsDetails value)? getPatientsDetails,
    TResult Function(deletePatientDetail value)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (addNewPatient != null) {
      return addNewPatient(this);
    }
    return orElse();
  }
}

abstract class addNewPatient implements PatientEvent {
  const factory addNewPatient({required final PatientsDetailsDTO patient}) =
      _$addNewPatientImpl;

  PatientsDetailsDTO get patient;
  @JsonKey(ignore: true)
  _$$addNewPatientImplCopyWith<_$addNewPatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$addLabFilesImplCopyWith<$Res> {
  factory _$$addLabFilesImplCopyWith(
          _$addLabFilesImpl value, $Res Function(_$addLabFilesImpl) then) =
      __$$addLabFilesImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PatientsDetailsDTO patient,
      File file,
      String name,
      String fileExtension});
}

/// @nodoc
class __$$addLabFilesImplCopyWithImpl<$Res>
    extends _$PatientEventCopyWithImpl<$Res, _$addLabFilesImpl>
    implements _$$addLabFilesImplCopyWith<$Res> {
  __$$addLabFilesImplCopyWithImpl(
      _$addLabFilesImpl _value, $Res Function(_$addLabFilesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
    Object? file = null,
    Object? name = null,
    Object? fileExtension = null,
  }) {
    return _then(_$addLabFilesImpl(
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientsDetailsDTO,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fileExtension: null == fileExtension
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$addLabFilesImpl implements addLabFiles {
  const _$addLabFilesImpl(
      {required this.patient,
      required this.file,
      required this.name,
      required this.fileExtension});

  @override
  final PatientsDetailsDTO patient;
  @override
  final File file;
  @override
  final String name;
  @override
  final String fileExtension;

  @override
  String toString() {
    return 'PatientEvent.addLabFiles(patient: $patient, file: $file, name: $name, fileExtension: $fileExtension)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addLabFilesImpl &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fileExtension, fileExtension) ||
                other.fileExtension == fileExtension));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, patient, file, name, fileExtension);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addLabFilesImplCopyWith<_$addLabFilesImpl> get copyWith =>
      __$$addLabFilesImplCopyWithImpl<_$addLabFilesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PatientsDetailsDTO patient) addPatient,
    required TResult Function(PatientsDetailsDTO patient) addNewPatient,
    required TResult Function(PatientsDetailsDTO patient, File file,
            String name, String fileExtension)
        addLabFiles,
    required TResult Function(String patientId) getPatientsDetails,
    required TResult Function(String patientId) deletePatientDetail,
  }) {
    return addLabFiles(patient, file, name, fileExtension);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PatientsDetailsDTO patient)? addPatient,
    TResult? Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult? Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult? Function(String patientId)? getPatientsDetails,
    TResult? Function(String patientId)? deletePatientDetail,
  }) {
    return addLabFiles?.call(patient, file, name, fileExtension);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PatientsDetailsDTO patient)? addPatient,
    TResult Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult Function(String patientId)? getPatientsDetails,
    TResult Function(String patientId)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (addLabFiles != null) {
      return addLabFiles(patient, file, name, fileExtension);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addPatient value) addPatient,
    required TResult Function(addNewPatient value) addNewPatient,
    required TResult Function(addLabFiles value) addLabFiles,
    required TResult Function(getPatientsDetails value) getPatientsDetails,
    required TResult Function(deletePatientDetail value) deletePatientDetail,
  }) {
    return addLabFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addPatient value)? addPatient,
    TResult? Function(addNewPatient value)? addNewPatient,
    TResult? Function(addLabFiles value)? addLabFiles,
    TResult? Function(getPatientsDetails value)? getPatientsDetails,
    TResult? Function(deletePatientDetail value)? deletePatientDetail,
  }) {
    return addLabFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addPatient value)? addPatient,
    TResult Function(addNewPatient value)? addNewPatient,
    TResult Function(addLabFiles value)? addLabFiles,
    TResult Function(getPatientsDetails value)? getPatientsDetails,
    TResult Function(deletePatientDetail value)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (addLabFiles != null) {
      return addLabFiles(this);
    }
    return orElse();
  }
}

abstract class addLabFiles implements PatientEvent {
  const factory addLabFiles(
      {required final PatientsDetailsDTO patient,
      required final File file,
      required final String name,
      required final String fileExtension}) = _$addLabFilesImpl;

  PatientsDetailsDTO get patient;
  File get file;
  String get name;
  String get fileExtension;
  @JsonKey(ignore: true)
  _$$addLabFilesImplCopyWith<_$addLabFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$getPatientsDetailsImplCopyWith<$Res> {
  factory _$$getPatientsDetailsImplCopyWith(_$getPatientsDetailsImpl value,
          $Res Function(_$getPatientsDetailsImpl) then) =
      __$$getPatientsDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String patientId});
}

/// @nodoc
class __$$getPatientsDetailsImplCopyWithImpl<$Res>
    extends _$PatientEventCopyWithImpl<$Res, _$getPatientsDetailsImpl>
    implements _$$getPatientsDetailsImplCopyWith<$Res> {
  __$$getPatientsDetailsImplCopyWithImpl(_$getPatientsDetailsImpl _value,
      $Res Function(_$getPatientsDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
  }) {
    return _then(_$getPatientsDetailsImpl(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$getPatientsDetailsImpl implements getPatientsDetails {
  const _$getPatientsDetailsImpl({required this.patientId});

  @override
  final String patientId;

  @override
  String toString() {
    return 'PatientEvent.getPatientsDetails(patientId: $patientId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getPatientsDetailsImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getPatientsDetailsImplCopyWith<_$getPatientsDetailsImpl> get copyWith =>
      __$$getPatientsDetailsImplCopyWithImpl<_$getPatientsDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PatientsDetailsDTO patient) addPatient,
    required TResult Function(PatientsDetailsDTO patient) addNewPatient,
    required TResult Function(PatientsDetailsDTO patient, File file,
            String name, String fileExtension)
        addLabFiles,
    required TResult Function(String patientId) getPatientsDetails,
    required TResult Function(String patientId) deletePatientDetail,
  }) {
    return getPatientsDetails(patientId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PatientsDetailsDTO patient)? addPatient,
    TResult? Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult? Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult? Function(String patientId)? getPatientsDetails,
    TResult? Function(String patientId)? deletePatientDetail,
  }) {
    return getPatientsDetails?.call(patientId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PatientsDetailsDTO patient)? addPatient,
    TResult Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult Function(String patientId)? getPatientsDetails,
    TResult Function(String patientId)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (getPatientsDetails != null) {
      return getPatientsDetails(patientId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addPatient value) addPatient,
    required TResult Function(addNewPatient value) addNewPatient,
    required TResult Function(addLabFiles value) addLabFiles,
    required TResult Function(getPatientsDetails value) getPatientsDetails,
    required TResult Function(deletePatientDetail value) deletePatientDetail,
  }) {
    return getPatientsDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addPatient value)? addPatient,
    TResult? Function(addNewPatient value)? addNewPatient,
    TResult? Function(addLabFiles value)? addLabFiles,
    TResult? Function(getPatientsDetails value)? getPatientsDetails,
    TResult? Function(deletePatientDetail value)? deletePatientDetail,
  }) {
    return getPatientsDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addPatient value)? addPatient,
    TResult Function(addNewPatient value)? addNewPatient,
    TResult Function(addLabFiles value)? addLabFiles,
    TResult Function(getPatientsDetails value)? getPatientsDetails,
    TResult Function(deletePatientDetail value)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (getPatientsDetails != null) {
      return getPatientsDetails(this);
    }
    return orElse();
  }
}

abstract class getPatientsDetails implements PatientEvent {
  const factory getPatientsDetails({required final String patientId}) =
      _$getPatientsDetailsImpl;

  String get patientId;
  @JsonKey(ignore: true)
  _$$getPatientsDetailsImplCopyWith<_$getPatientsDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$deletePatientDetailImplCopyWith<$Res> {
  factory _$$deletePatientDetailImplCopyWith(_$deletePatientDetailImpl value,
          $Res Function(_$deletePatientDetailImpl) then) =
      __$$deletePatientDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String patientId});
}

/// @nodoc
class __$$deletePatientDetailImplCopyWithImpl<$Res>
    extends _$PatientEventCopyWithImpl<$Res, _$deletePatientDetailImpl>
    implements _$$deletePatientDetailImplCopyWith<$Res> {
  __$$deletePatientDetailImplCopyWithImpl(_$deletePatientDetailImpl _value,
      $Res Function(_$deletePatientDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
  }) {
    return _then(_$deletePatientDetailImpl(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$deletePatientDetailImpl implements deletePatientDetail {
  const _$deletePatientDetailImpl({required this.patientId});

  @override
  final String patientId;

  @override
  String toString() {
    return 'PatientEvent.deletePatientDetail(patientId: $patientId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deletePatientDetailImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deletePatientDetailImplCopyWith<_$deletePatientDetailImpl> get copyWith =>
      __$$deletePatientDetailImplCopyWithImpl<_$deletePatientDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PatientsDetailsDTO patient) addPatient,
    required TResult Function(PatientsDetailsDTO patient) addNewPatient,
    required TResult Function(PatientsDetailsDTO patient, File file,
            String name, String fileExtension)
        addLabFiles,
    required TResult Function(String patientId) getPatientsDetails,
    required TResult Function(String patientId) deletePatientDetail,
  }) {
    return deletePatientDetail(patientId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PatientsDetailsDTO patient)? addPatient,
    TResult? Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult? Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult? Function(String patientId)? getPatientsDetails,
    TResult? Function(String patientId)? deletePatientDetail,
  }) {
    return deletePatientDetail?.call(patientId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PatientsDetailsDTO patient)? addPatient,
    TResult Function(PatientsDetailsDTO patient)? addNewPatient,
    TResult Function(PatientsDetailsDTO patient, File file, String name,
            String fileExtension)?
        addLabFiles,
    TResult Function(String patientId)? getPatientsDetails,
    TResult Function(String patientId)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (deletePatientDetail != null) {
      return deletePatientDetail(patientId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(addPatient value) addPatient,
    required TResult Function(addNewPatient value) addNewPatient,
    required TResult Function(addLabFiles value) addLabFiles,
    required TResult Function(getPatientsDetails value) getPatientsDetails,
    required TResult Function(deletePatientDetail value) deletePatientDetail,
  }) {
    return deletePatientDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(addPatient value)? addPatient,
    TResult? Function(addNewPatient value)? addNewPatient,
    TResult? Function(addLabFiles value)? addLabFiles,
    TResult? Function(getPatientsDetails value)? getPatientsDetails,
    TResult? Function(deletePatientDetail value)? deletePatientDetail,
  }) {
    return deletePatientDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(addPatient value)? addPatient,
    TResult Function(addNewPatient value)? addNewPatient,
    TResult Function(addLabFiles value)? addLabFiles,
    TResult Function(getPatientsDetails value)? getPatientsDetails,
    TResult Function(deletePatientDetail value)? deletePatientDetail,
    required TResult orElse(),
  }) {
    if (deletePatientDetail != null) {
      return deletePatientDetail(this);
    }
    return orElse();
  }
}

abstract class deletePatientDetail implements PatientEvent {
  const factory deletePatientDetail({required final String patientId}) =
      _$deletePatientDetailImpl;

  String get patientId;
  @JsonKey(ignore: true)
  _$$deletePatientDetailImplCopyWith<_$deletePatientDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PatientState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() patientInitial,
    required TResult Function(PatientsDetailsDTO patient, bool isLoading)
        displayPatient,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? patientInitial,
    TResult? Function(PatientsDetailsDTO patient, bool isLoading)?
        displayPatient,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? patientInitial,
    TResult Function(PatientsDetailsDTO patient, bool isLoading)?
        displayPatient,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(patientInitial value) patientInitial,
    required TResult Function(displayPatient value) displayPatient,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(patientInitial value)? patientInitial,
    TResult? Function(displayPatient value)? displayPatient,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(patientInitial value)? patientInitial,
    TResult Function(displayPatient value)? displayPatient,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientStateCopyWith<$Res> {
  factory $PatientStateCopyWith(
          PatientState value, $Res Function(PatientState) then) =
      _$PatientStateCopyWithImpl<$Res, PatientState>;
}

/// @nodoc
class _$PatientStateCopyWithImpl<$Res, $Val extends PatientState>
    implements $PatientStateCopyWith<$Res> {
  _$PatientStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$patientInitialImplCopyWith<$Res> {
  factory _$$patientInitialImplCopyWith(_$patientInitialImpl value,
          $Res Function(_$patientInitialImpl) then) =
      __$$patientInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$patientInitialImplCopyWithImpl<$Res>
    extends _$PatientStateCopyWithImpl<$Res, _$patientInitialImpl>
    implements _$$patientInitialImplCopyWith<$Res> {
  __$$patientInitialImplCopyWithImpl(
      _$patientInitialImpl _value, $Res Function(_$patientInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$patientInitialImpl implements patientInitial {
  const _$patientInitialImpl();

  @override
  String toString() {
    return 'PatientState.patientInitial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$patientInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() patientInitial,
    required TResult Function(PatientsDetailsDTO patient, bool isLoading)
        displayPatient,
  }) {
    return patientInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? patientInitial,
    TResult? Function(PatientsDetailsDTO patient, bool isLoading)?
        displayPatient,
  }) {
    return patientInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? patientInitial,
    TResult Function(PatientsDetailsDTO patient, bool isLoading)?
        displayPatient,
    required TResult orElse(),
  }) {
    if (patientInitial != null) {
      return patientInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(patientInitial value) patientInitial,
    required TResult Function(displayPatient value) displayPatient,
  }) {
    return patientInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(patientInitial value)? patientInitial,
    TResult? Function(displayPatient value)? displayPatient,
  }) {
    return patientInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(patientInitial value)? patientInitial,
    TResult Function(displayPatient value)? displayPatient,
    required TResult orElse(),
  }) {
    if (patientInitial != null) {
      return patientInitial(this);
    }
    return orElse();
  }
}

abstract class patientInitial implements PatientState {
  const factory patientInitial() = _$patientInitialImpl;
}

/// @nodoc
abstract class _$$displayPatientImplCopyWith<$Res> {
  factory _$$displayPatientImplCopyWith(_$displayPatientImpl value,
          $Res Function(_$displayPatientImpl) then) =
      __$$displayPatientImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PatientsDetailsDTO patient, bool isLoading});
}

/// @nodoc
class __$$displayPatientImplCopyWithImpl<$Res>
    extends _$PatientStateCopyWithImpl<$Res, _$displayPatientImpl>
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
              as PatientsDetailsDTO,
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
  final PatientsDetailsDTO patient;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PatientState.displayPatient(patient: $patient, isLoading: $isLoading)';
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
    required TResult Function() patientInitial,
    required TResult Function(PatientsDetailsDTO patient, bool isLoading)
        displayPatient,
  }) {
    return displayPatient(patient, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? patientInitial,
    TResult? Function(PatientsDetailsDTO patient, bool isLoading)?
        displayPatient,
  }) {
    return displayPatient?.call(patient, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? patientInitial,
    TResult Function(PatientsDetailsDTO patient, bool isLoading)?
        displayPatient,
    required TResult orElse(),
  }) {
    if (displayPatient != null) {
      return displayPatient(patient, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(patientInitial value) patientInitial,
    required TResult Function(displayPatient value) displayPatient,
  }) {
    return displayPatient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(patientInitial value)? patientInitial,
    TResult? Function(displayPatient value)? displayPatient,
  }) {
    return displayPatient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(patientInitial value)? patientInitial,
    TResult Function(displayPatient value)? displayPatient,
    required TResult orElse(),
  }) {
    if (displayPatient != null) {
      return displayPatient(this);
    }
    return orElse();
  }
}

abstract class displayPatient implements PatientState {
  const factory displayPatient(
      {required final PatientsDetailsDTO patient,
      required final bool isLoading}) = _$displayPatientImpl;

  PatientsDetailsDTO get patient;
  bool get isLoading;
  @JsonKey(ignore: true)
  _$$displayPatientImplCopyWith<_$displayPatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
