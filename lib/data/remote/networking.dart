import 'dart:convert';
import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:mvc_flutter/data/remote/endpoints.dart';
import 'package:mvc_flutter/data/remote/logging_interceptor.dart';
import 'package:mvc_flutter/data/remote/model/response_dto.dart';
import 'package:mvc_flutter/data/utils/log_tags.dart';
import 'package:mvc_flutter/data/utils/response_parser.dart';

Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);

dynamic _callGetApi(
  final String path,
  final Map<String, dynamic> queryParams, [
  final String? baseUrl,
]) async {
  Map<String, String> headers = {'content-type': 'application/json'};
  //creating the REST Endpoint Url
  final uri = Uri(
    scheme: 'https',
    host: baseUrl ?? Endpoints.authority,
    path: path,
    // queryParameters: queryParams,
  );
  log(uri.toString(), name: LogTags.apiCall);
  //calling the REST API
  final http.Response res = await client.get(uri, headers: headers);

  return jsonDecode(res.body);
}

dynamic _callPostApi(
  final String path,
  final Map<String, String> body, {
  required Map<String, String>? queryParams,
  final String? baseUrl,
}) async {
  //creating the REST Endpoint Url
  Uri uri = Uri(
    scheme: 'https',
    host: baseUrl ?? Endpoints.authority,
    path: path,
    // queryParameters: queryParams,
  );

  http.MultipartRequest request = http.MultipartRequest("POST", uri);
  request.fields.addAll(body);
  //calling the REST API
  log('>>>----------->>>calling api ${request.url} \n ${request.fields}',
      name: LogTags.apiCall);
  StreamedResponse res = await client.send(request);

  String responseBody = await res.stream.bytesToString();
  log("Api Call Completed------> ${jsonDecode(responseBody)}",
      name: LogTags.apiCall);
  return jsonDecode(responseBody);
}

Future<ResponseDto<T?>> httpPost<T>(
  final String path,
  final Map<String, String> body, {
  final Map<String, String>? queryParams,
  final String? baseUrl,
}) async {
  final response = await _callPostApi(path, body,
      queryParams: queryParams ?? {}, baseUrl: baseUrl);
  return parseResponse<T>(response);
}

Future<ResponseDto<BuiltList<T>?>> httpGetList<T>(
  final String path,
  final Map<String, dynamic> queryParams, [
  final String? baseUrl,
]) async {
  final response = await _callGetApi(path, queryParams, baseUrl);
  log(queryParams.toString(), name: LogTags.apiCall);
  log(response.toString(), name: LogTags.apiCall);
  return parseResponseList<T>(response);
}

Future<ResponseDto<BuiltList<T>?>> httpPostList<T>(
  final String path,
  final Map<String, String> body, {
  final Map<String, String>? queryParams,
  final String? baseUrl,
}) async {
  final response = await _callPostApi(path, body,
      queryParams: queryParams, baseUrl: baseUrl);
  log(queryParams.toString(), name: LogTags.apiCall);
  log(response.toString(), name: LogTags.apiCall);
  return parseResponseList<T>(response);
}
