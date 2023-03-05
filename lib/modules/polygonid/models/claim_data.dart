import 'package:json_annotation/json_annotation.dart';

part 'claim_data.g.dart';

@JsonSerializable()
class ClaimData {
  final ClaimBody body;
  final String from;
  final String id;
  final String thid;
  final String to;
  final String typ;
  final String type;

  const ClaimData({
    required this.body,
    required this.from,
    required this.id,
    required this.thid,
    required this.to,
    required this.typ,
    required this.type,
  });

  factory ClaimData.fromJson(Map<String, dynamic> json) =>
      _$ClaimDataFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimDataToJson(this);
}

@JsonSerializable()
class ClaimBody {
  final List<ClaimCredential> credentials;
  final String uri;

  const ClaimBody({required this.credentials, required this.uri});

  factory ClaimBody.fromJson(Map<String, dynamic> json) =>
      _$ClaimBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimBodyToJson(this);
}

@JsonSerializable()
class ClaimCredential {
  final String description;
  final String id;

  const ClaimCredential({
    required this.description,
    required this.id,
  });

  factory ClaimCredential.fromJson(Map<String, dynamic> json) =>
      _$ClaimCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimCredentialToJson(this);
}
