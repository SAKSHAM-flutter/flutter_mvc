// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitDto> _$unitDtoSerializer = new _$UnitDtoSerializer();

class _$UnitDtoSerializer implements StructuredSerializer<UnitDto> {
  @override
  final Iterable<Type> types = const [UnitDto, _$UnitDto];
  @override
  final String wireName = 'UnitDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitDto object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  UnitDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new UnitDtoBuilder().build();
  }
}

class _$UnitDto extends UnitDto {
  factory _$UnitDto([void Function(UnitDtoBuilder)? updates]) =>
      (new UnitDtoBuilder()..update(updates))._build();

  _$UnitDto._() : super._();

  @override
  UnitDto rebuild(void Function(UnitDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitDtoBuilder toBuilder() => new UnitDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitDto;
  }

  @override
  int get hashCode {
    return 954691340;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'UnitDto').toString();
  }
}

class UnitDtoBuilder implements Builder<UnitDto, UnitDtoBuilder> {
  _$UnitDto? _$v;

  UnitDtoBuilder();

  @override
  void replace(UnitDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitDto;
  }

  @override
  void update(void Function(UnitDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitDto build() => _build();

  _$UnitDto _build() {
    final _$result = _$v ?? new _$UnitDto._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
