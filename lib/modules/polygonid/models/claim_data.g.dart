// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimData _$ClaimDataFromJson(Map<String, dynamic> json) => ClaimData(
      body: ClaimBody.fromJson(json['body'] as Map<String, dynamic>),
      from: json['from'] as String,
      id: json['id'] as String,
      thid: json['thid'] as String,
      to: json['to'] as String,
      typ: json['typ'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ClaimDataToJson(ClaimData instance) => <String, dynamic>{
      'body': instance.body,
      'from': instance.from,
      'id': instance.id,
      'thid': instance.thid,
      'to': instance.to,
      'typ': instance.typ,
      'type': instance.type,
    };

ClaimBody _$ClaimBodyFromJson(Map<String, dynamic> json) => ClaimBody(
      credentials: (json['credentials'] as List<dynamic>)
          .map((e) => ClaimCredential.fromJson(e as Map<String, dynamic>))
          .toList(),
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$ClaimBodyToJson(ClaimBody instance) => <String, dynamic>{
      'credentials': instance.credentials,
      'uri': instance.uri,
    };

ClaimCredential _$ClaimCredentialFromJson(Map<String, dynamic> json) =>
    ClaimCredential(
      description: json['description'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ClaimCredentialToJson(ClaimCredential instance) =>
    <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
    };
