import 'dart:convert';

import 'package:as_wallet/modules/polygonid/models/did_data.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PolygonIdService {
  final Dio _dio;
  final String baseUrl = "https://cf4e-67-173-226-117.ngrok.io";
  SharedPreferences? _preferences;

  PolygonIdService() : _dio = Dio();

  Future<DidData> createIdentity() async {
    final requestBody = {
      "didMetadata": {
        "method": "polygonid",
        "blockchain": "polygon",
        "network": "mumbai"
      }
    };

    final response = await _dio.post(
      '$baseUrl/v1/identities',
      data: requestBody,
      options: Options(
        headers: <String, String>{
          'authorization': _getAuth(),
        },
      ),
    );
    if (response.statusCode == 200) {
      final didData = DidData.fromJson(response.data);
      (await preferences).setString('did_data', jsonEncode(didData.toJson()));
      return didData;
    } else {
      throw Exception('Failed to create identity');
    }
  }

  Future<DidData?> getIdentity() async {
    final didData = (await preferences).getString('did_data');
    return didData != null ? DidData.fromJson(jsonDecode(didData)) : null;
  }

  Future<SharedPreferences> get preferences async =>
      _preferences ??= await SharedPreferences.getInstance();

  String _getAuth() {
    const username = "user";
    const password = "password";
    return 'Basic ' + base64.encode(utf8.encode('$username:$password'));
  }
}
