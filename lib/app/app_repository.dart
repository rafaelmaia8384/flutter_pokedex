import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'app_config.dart';
import 'models/model_response.dart';

class AppRepository {
  static Future<ServerResponse> getRequest(String? query) async {
    await Future.delayed(const Duration(seconds: 1));
    http.Response response;
    try {
      response = await http.get(
        Uri.parse('${AppConfig.baseUrl}$query'),
      );
    } catch (error) {
      return ServerResponse(
        statusCode: 0,
        message: 'Não foi possível conectar com o servidor.',
        details: error.toString(),
      );
    }
    return _handleResponse(response);
  }

  static ServerResponse _handleResponse(http.Response response) {
    if (response.statusCode < 400) {
      return ServerResponse(
        statusCode: response.statusCode,
        message: 'Ok',
        details: null,
        data: response.body,
      );
    } else if (response.statusCode < 500) {
      return ServerResponse(
        statusCode: response.statusCode,
        message: 'Não autorizado.',
        details: response.body.isEmpty ? 'Erro de solicitação.' : response.body,
        data: null,
      );
    } else {
      return ServerResponse(
        statusCode: response.statusCode,
        message: 'Erro no servidor.',
        details: response.body.isEmpty
            ? 'Ocorreu um erro no servidor.'
            : response.body,
        data: null,
      );
    }
  }
}
