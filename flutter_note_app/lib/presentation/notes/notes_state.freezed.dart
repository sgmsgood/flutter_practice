// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotesState _$NotesStateFromJson(Map<String, dynamic> json) {
  return _NotesState.fromJson(json);
}

/// @nodoc
mixin _$NotesState {
  List<Note> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotesStateCopyWith<NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res, NotesState>;
  @useResult
  $Res call({List<Note> notes});
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res, $Val extends NotesState>
    implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotesStateImplCopyWith<$Res>
    implements $NotesStateCopyWith<$Res> {
  factory _$$NotesStateImplCopyWith(
          _$NotesStateImpl value, $Res Function(_$NotesStateImpl) then) =
      __$$NotesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Note> notes});
}

/// @nodoc
class __$$NotesStateImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$NotesStateImpl>
    implements _$$NotesStateImplCopyWith<$Res> {
  __$$NotesStateImplCopyWithImpl(
      _$NotesStateImpl _value, $Res Function(_$NotesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$NotesStateImpl(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotesStateImpl implements _NotesState {
  _$NotesStateImpl({final List<Note> notes = const []}) : _notes = notes;

  factory _$NotesStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotesStateImplFromJson(json);

  final List<Note> _notes;
  @override
  @JsonKey()
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'NotesState(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotesStateImpl &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotesStateImplCopyWith<_$NotesStateImpl> get copyWith =>
      __$$NotesStateImplCopyWithImpl<_$NotesStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotesStateImplToJson(
      this,
    );
  }
}

abstract class _NotesState implements NotesState {
  factory _NotesState({final List<Note> notes}) = _$NotesStateImpl;

  factory _NotesState.fromJson(Map<String, dynamic> json) =
      _$NotesStateImpl.fromJson;

  @override
  List<Note> get notes;
  @override
  @JsonKey(ignore: true)
  _$$NotesStateImplCopyWith<_$NotesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
