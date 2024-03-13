// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductResponseDto> _$productResponseDtoSerializer =
    new _$ProductResponseDtoSerializer();

class _$ProductResponseDtoSerializer
    implements StructuredSerializer<ProductResponseDto> {
  @override
  final Iterable<Type> types = const [ProductResponseDto, _$ProductResponseDto];
  @override
  final String wireName = 'ProductResponseDto';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ProductResponseDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'products',
      serializers.serialize(object.products,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ProductDto)])),
    ];

    return result;
  }

  @override
  ProductResponseDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductResponseDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'products':
          result.products.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductDto)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ProductResponseDto extends ProductResponseDto {
  @override
  final BuiltList<ProductDto> products;

  factory _$ProductResponseDto(
          [void Function(ProductResponseDtoBuilder)? updates]) =>
      (new ProductResponseDtoBuilder()..update(updates))._build();

  _$ProductResponseDto._({required this.products}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        products, r'ProductResponseDto', 'products');
  }

  @override
  ProductResponseDto rebuild(
          void Function(ProductResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductResponseDtoBuilder toBuilder() =>
      new ProductResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductResponseDto && products == other.products;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductResponseDto')
          ..add('products', products))
        .toString();
  }
}

class ProductResponseDtoBuilder
    implements Builder<ProductResponseDto, ProductResponseDtoBuilder> {
  _$ProductResponseDto? _$v;

  ListBuilder<ProductDto>? _products;
  ListBuilder<ProductDto> get products =>
      _$this._products ??= new ListBuilder<ProductDto>();
  set products(ListBuilder<ProductDto>? products) =>
      _$this._products = products;

  ProductResponseDtoBuilder();

  ProductResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _products = $v.products.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductResponseDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductResponseDto;
  }

  @override
  void update(void Function(ProductResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductResponseDto build() => _build();

  _$ProductResponseDto _build() {
    _$ProductResponseDto _$result;
    try {
      _$result = _$v ?? new _$ProductResponseDto._(products: products.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        products.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
