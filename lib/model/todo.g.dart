// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      id: json['id'] as int,
      user_id: json['user_id'] as int,
      title: json['title'] as String,
      due_on: json['due_on'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'title': instance.title,
      'due_on': instance.due_on,
      'status': instance.status,
    };
