// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductDto> _$productDtoSerializer = new _$ProductDtoSerializer();

class _$ProductDtoSerializer implements StructuredSerializer<ProductDto> {
  @override
  final Iterable<Type> types = const [ProductDto, _$ProductDto];
  @override
  final String wireName = 'ProductDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  ProductDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ProductDto extends ProductDto {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String thumbnail;
  @override
  final BuiltList<String> images;

  factory _$ProductDto([void Function(ProductDtoBuilder)? updates]) =>
      (new ProductDtoBuilder()..update(updates))._build();

  _$ProductDto._(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnail,
      required this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ProductDto', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'ProductDto', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ProductDto', 'description');
    BuiltValueNullFieldError.checkNotNull(
        thumbnail, r'ProductDto', 'thumbnail');
    BuiltValueNullFieldError.checkNotNull(images, r'ProductDto', 'images');
  }

  @override
  ProductDto rebuild(void Function(ProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductDtoBuilder toBuilder() => new ProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductDto &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        thumbnail == other.thumbnail &&
        images == other.images;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, thumbnail.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductDto')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('thumbnail', thumbnail)
          ..add('images', images))
        .toString();
  }
}

class ProductDtoBuilder implements Builder<ProductDto, ProductDtoBuilder> {
  _$ProductDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _thumbnail;
  String? get thumbnail => _$this._thumbnail;
  set thumbnail(String? thumbnail) => _$this._thumbnail = thumbnail;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  ProductDtoBuilder();

  ProductDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _thumbnail = $v.thumbnail;
      _images = $v.images.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductDto;
  }

  @override
  void update(void Function(ProductDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductDto build() => _build();

  _$ProductDto _build() {
    _$ProductDto _$result;
    try {
      _$result = _$v ??
          new _$ProductDto._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'ProductDto', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'ProductDto', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'ProductDto', 'description'),
              thumbnail: BuiltValueNullFieldError.checkNotNull(
                  thumbnail, r'ProductDto', 'thumbnail'),
              images: images.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
