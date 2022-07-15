// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
mixin _$Todo {
  int get id => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get due_on => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call({int id, int user_id, String title, String due_on, String status});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = freezed,
    Object? title = freezed,
    Object? due_on = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      due_on: due_on == freezed
          ? _value.due_on
          : due_on // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodoCopyWith(_$_Todo value, $Res Function(_$_Todo) then) =
      __$$_TodoCopyWithImpl<$Res>;
  @override
  $Res call({int id, int user_id, String title, String due_on, String status});
}

/// @nodoc
class __$$_TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$$_TodoCopyWith<$Res> {
  __$$_TodoCopyWithImpl(_$_Todo _value, $Res Function(_$_Todo) _then)
      : super(_value, (v) => _then(v as _$_Todo));

  @override
  _$_Todo get _value => super._value as _$_Todo;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = freezed,
    Object? title = freezed,
    Object? due_on = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Todo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      due_on: due_on == freezed
          ? _value.due_on
          : due_on // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Todo with DiagnosticableTreeMixin implements _Todo {
  const _$_Todo(
      {required this.id,
      required this.user_id,
      required this.title,
      required this.due_on,
      required this.status});

  factory _$_Todo.fromJson(Map<String, dynamic> json) => _$$_TodoFromJson(json);

  @override
  final int id;
  @override
  final int user_id;
  @override
  final String title;
  @override
  final String due_on;
  @override
  final String status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(id: $id, user_id: $user_id, title: $title, due_on: $due_on, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('user_id', user_id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('due_on', due_on))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.due_on, due_on) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(due_on),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_TodoCopyWith<_$_Todo> get copyWith =>
      __$$_TodoCopyWithImpl<_$_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoToJson(this);
  }
}

abstract class _Todo implements Todo {
  const factory _Todo(
      {required final int id,
      required final int user_id,
      required final String title,
      required final String due_on,
      required final String status}) = _$_Todo;

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  int get id;
  @override
  int get user_id;
  @override
  String get title;
  @override
  String get due_on;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_TodoCopyWith<_$_Todo> get copyWith => throw _privateConstructorUsedError;
}
