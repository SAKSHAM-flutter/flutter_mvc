import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http_interceptor/http_interceptor.dart';
import 'package:mvc_flutter/data/utils/log_tags.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // developer.log('>>>----------->>>calling api ${data.url}', name: LogTags.apiCall);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    developer.log('>>>----------->>>calling api ${data.url}',
        name: LogTags.apiCall);
    developer.log('Headers:- ');
    developer.log(data.request?.headers.toString() ?? '');
    developer.log('Request body:- ', name: LogTags.apiCall);
    developer.log(data.request?.body.toString() ?? '', name: LogTags.apiCall);

    final responseBody = data.body;

    if (responseBody == null) {
      developer.log('received null body', name: LogTags.apiCall);
      return data;
    }

    //not parsing data to json if response contains html
    if (responseBody.contains('<!doctype html>') && responseBody.length > 500) {
      //in order to avoid print large html documents
      //printing only the first 500 characters
      developer.log(responseBody.substring(0, 500), name: LogTags.apiCall);
    } else {
      try {
        //converting response to json for pretty printing
        const encoder = JsonEncoder.withIndent('  ');
        final pretty = encoder.convert(jsonDecode(responseBody));
        developer.log('Response Body:-');
        developer.log(pretty, name: LogTags.apiCall);
      } catch (th) {
        developer.log('could not parse response as json',
            name: LogTags.apiCall);
        developer.log(data.toString(), name: LogTags.apiCall);
      }
    }
    developer.log(
      '<<<------------<<<api call completed',
      name: LogTags.apiCall,
    );
    return data;
  }
}
