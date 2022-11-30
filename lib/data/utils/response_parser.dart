import 'package:built_value/serializer.dart';
import 'package:interview_task/data/remote/model/response_dto.dart';

import '../remote/model/default_serializers.dart';

///Parses a jsonEncoded string to an object of type ResponseDto<T>.
///T can be any built_value class with serializer defined with [Serializers]
ResponseDto<T> parseResponseDto<T>(dynamic jsonString) {
  final specifiedType = FullType(ResponseDto, [FullType(T)]);
  final serializersWithBuilder = (serializers.toBuilder()
        ..addBuilderFactory(specifiedType, ResponseDtoBuilder<T>.new))
      .build();
  final result = serializersWithBuilder.deserialize(
    jsonString,
    specifiedType: specifiedType,
  );
  return result as ResponseDto<T>;
}
