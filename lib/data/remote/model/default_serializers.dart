import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:mvc_flutter/data/remote/model/product_dto.dart';
import 'package:mvc_flutter/data/remote/model/response_dto.dart';

part 'default_serializers.g.dart';

@SerializersFor([
  ResponseDto,
  ProductDto,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
