import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:mvc_flutter/data/remote/model/product_dto.dart';
import 'package:mvc_flutter/data/remote/model/product_response_dto.dart';
import 'package:mvc_flutter/data/remote/model/response_dto.dart';
import 'package:mvc_flutter/data/remote/model/unit_dto.dart';

part 'default_serializers.g.dart';

@SerializersFor([ProductResponseDto, ProductDto, ResponseDto, UnitDto])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
