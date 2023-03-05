import 'package:json_annotation/json_annotation.dart';

part 'did_data.g.dart';

@JsonSerializable()
class DidData {
  final String identifier;
  final DidState state;

  DidData({
    required this.identifier,
    required this.state,
  });

  factory DidData.fromJson(Map<String, dynamic> json) =>
      _$DidDataFromJson(json);

  Map<String, dynamic> toJson() => _$DidDataToJson(this);
}

@JsonSerializable()
class DidState {
  final String claimsTreeRoot;
  final String createdAt;
  final String modifiedAt;
  final String state;
  final String status;

  DidState({
    required this.claimsTreeRoot,
    required this.createdAt,
    required this.modifiedAt,
    required this.state,
    required this.status,
  });

  factory DidState.fromJson(Map<String, dynamic> json) =>
      _$DidStateFromJson(json);

  Map<String, dynamic> toJson() => _$DidStateToJson(this);
}
