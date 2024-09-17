import 'dart:io';

import 'package:dio/dio.dart';
import 'package:varosa_currency_exchange/core/api/api_constants.dart';
import 'package:varosa_currency_exchange/core/utils/custom_log.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper? _instance;

  factory ApiHelper() => _instance ??= ApiHelper._();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Api.baseUrl,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.accessControlAllowHeadersHeader: "*",
      },
    ),
  );

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );

      _logApiRequest(
        url: url,
        method: "GET",
        headers: _dio.options.headers,
        response: response.data,
        queryParams: queryParameters,
      );

      return response.data;
    } on DioException catch (e, stack) {
      _logApiRequest(
        url: url,
        method: "GET",
        headers: _dio.options.headers,
        error: e,
        queryParams: queryParameters,
      );
      CustomLog.error("The error stack is $stack");
    } catch (e) {
      rethrow;
    }
  }

  void _logApiRequest({
    String? url,
    String? method,
    dynamic body,
    dynamic response,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    dynamic error,
  }) {
    CustomLog.action("API REQUEST=====================================>");
    CustomLog.error("Request method : $method");
    CustomLog.warning("Api Url : $url");
    if (queryParams != null) {
      CustomLog.warning("Request query params : $queryParams");
    }
    CustomLog.action("Api headers : $headers");

    if (body != null) {
      CustomLog.warning("Request body : $body");
    }
    if (response != null) {
      CustomLog.success("Response : $response");
    }
    if (error != null) {
      CustomLog.error("Api Request Error: $error");
    }
    CustomLog.action("API REQUEST=====================================>");
  }
}
