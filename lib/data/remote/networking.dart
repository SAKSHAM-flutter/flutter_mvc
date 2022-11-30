import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:interview_task/data/remote/endpoints.dart';
import 'package:interview_task/data/remote/logging_interceptor.dart';
import 'package:interview_task/data/utils/response_parser.dart';

Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);

dynamic _callGetApi(
  final String path,
  final Map<String, String> queryParams, [
  final String? baseUrl,
]) async {
  //common headers
  final Map<String, String> header = {'Content-Type': 'application/json'};

  //creating the REST Endpoint Url
  final uri = Uri(
    scheme: 'https',
    host: baseUrl ?? Endpoints.authority,
    path: '${Endpoints.path}/$path',
    queryParameters: queryParams,
  );

  print('uri');
  print(uri.toString());

  //calling the REST API
  final http.Response res = await client.get(
    uri,
    headers: header,
  );

  return jsonDecode(res.body);
}

Future<T> httpGet<T>(
  final String path,
  final Map<String, String> queryParams, [
  final String? baseUrl,
]) async {
  final response = await _callGetApi(path, queryParams, baseUrl);
  return parseResponse<T>(response);
}
