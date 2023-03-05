// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'did_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DidData _$DidDataFromJson(Map<String, dynamic> json) => DidData(
      identifier: json['identifier'] as String,
      state: DidState.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DidDataToJson(DidData instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'state': instance.state,
    };

DidState _$DidStateFromJson(Map<String, dynamic> json) => DidState(
      claimsTreeRoot: json['claimsTreeRoot'] as String,
      createdAt: json['createdAt'] as String,
      modifiedAt: json['modifiedAt'] as String,
      state: json['state'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$DidStateToJson(DidState instance) => <String, dynamic>{
      'claimsTreeRoot': instance.claimsTreeRoot,
      'createdAt': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
      'state': instance.state,
      'status': instance.status,
    };
