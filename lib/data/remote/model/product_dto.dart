import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product_dto.g.dart';

abstract class ProductDto implements Built<ProductDto, ProductDtoBuilder> {
  ProductDto._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'thumbnail')
  String get thumbnail;

  @BuiltValueField(wireName: 'images')
  BuiltList<String> get images;

  static Serializer<ProductDto> get serializer => _$productDtoSerializer;

  factory ProductDto([void Function(ProductDtoBuilder)? updates]) =
      _$ProductDto;
}
