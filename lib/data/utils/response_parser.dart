import 'package:built_value/serializer.dart';

import '../remote/model/default_serializers.dart';

///Parses a jsonEncoded string to an object of type ResponseDto<T>.
///T can be any built_value class with serializer defined with [Serializers]
T parseResponse<T>(dynamic jsonString) {
  final specifiedType = FullType(T);
  // final serializersWithBuilder = (serializers.toBuilder()
  //       ..addBuilderFactory(specifiedType, ResponseDtoBuilder<T>.new))
  //     .build();
  final result = serializers.deserialize(
    jsonString,
    specifiedType: specifiedType,
  );
  return result as T;
}
