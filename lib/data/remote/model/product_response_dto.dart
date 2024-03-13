import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mvc_flutter/data/remote/model/product_dto.dart';

part 'product_response_dto.g.dart';

abstract class ProductResponseDto
    implements Built<ProductResponseDto, ProductResponseDtoBuilder> {
  @BuiltValueField(wireName: 'products')
  BuiltList<ProductDto> get products;

  ProductResponseDto._();

  static Serializer<ProductResponseDto> get serializer =>
      _$productResponseDtoSerializer;

  factory ProductResponseDto(
          [void Function(ProductResponseDtoBuilder)? updates]) =
      _$ProductResponseDto;
}
