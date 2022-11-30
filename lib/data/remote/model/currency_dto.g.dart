// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CurrencyDto> _$currencyDtoSerializer = new _$CurrencyDtoSerializer();

class _$CurrencyDtoSerializer implements StructuredSerializer<CurrencyDto> {
  @override
  final Iterable<Type> types = const [CurrencyDto, _$CurrencyDto];
  @override
  final String wireName = 'CurrencyDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, CurrencyDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
      'symbol',
      serializers.serialize(object.symbol,
          specifiedType: const FullType(String)),
      'rate',
      serializers.serialize(object.rate, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'rate_float',
      serializers.serialize(object.rateFloat,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  CurrencyDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CurrencyDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'symbol':
          result.symbol = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'rate_float':
          result.rateFloat = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$CurrencyDto extends CurrencyDto {
  @override
  final String code;
  @override
  final String symbol;
  @override
  final String rate;
  @override
  final String description;
  @override
  final double rateFloat;

  factory _$CurrencyDto([void Function(CurrencyDtoBuilder)? updates]) =>
      (new CurrencyDtoBuilder()..update(updates))._build();

  _$CurrencyDto._(
      {required this.code,
      required this.symbol,
      required this.rate,
      required this.description,
      required this.rateFloat})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'CurrencyDto', 'code');
    BuiltValueNullFieldError.checkNotNull(symbol, r'CurrencyDto', 'symbol');
    BuiltValueNullFieldError.checkNotNull(rate, r'CurrencyDto', 'rate');
    BuiltValueNullFieldError.checkNotNull(
        description, r'CurrencyDto', 'description');
    BuiltValueNullFieldError.checkNotNull(
        rateFloat, r'CurrencyDto', 'rateFloat');
  }

  @override
  CurrencyDto rebuild(void Function(CurrencyDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrencyDtoBuilder toBuilder() => new CurrencyDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CurrencyDto &&
        code == other.code &&
        symbol == other.symbol &&
        rate == other.rate &&
        description == other.description &&
        rateFloat == other.rateFloat;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, code.hashCode), symbol.hashCode), rate.hashCode),
            description.hashCode),
        rateFloat.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CurrencyDto')
          ..add('code', code)
          ..add('symbol', symbol)
          ..add('rate', rate)
          ..add('description', description)
          ..add('rateFloat', rateFloat))
        .toString();
  }
}

class CurrencyDtoBuilder implements Builder<CurrencyDto, CurrencyDtoBuilder> {
  _$CurrencyDto? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _symbol;
  String? get symbol => _$this._symbol;
  set symbol(String? symbol) => _$this._symbol = symbol;

  String? _rate;
  String? get rate => _$this._rate;
  set rate(String? rate) => _$this._rate = rate;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _rateFloat;
  double? get rateFloat => _$this._rateFloat;
  set rateFloat(double? rateFloat) => _$this._rateFloat = rateFloat;

  CurrencyDtoBuilder();

  CurrencyDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _symbol = $v.symbol;
      _rate = $v.rate;
      _description = $v.description;
      _rateFloat = $v.rateFloat;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CurrencyDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CurrencyDto;
  }

  @override
  void update(void Function(CurrencyDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CurrencyDto build() => _build();

  _$CurrencyDto _build() {
    final _$result = _$v ??
        new _$CurrencyDto._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'CurrencyDto', 'code'),
            symbol: BuiltValueNullFieldError.checkNotNull(
                symbol, r'CurrencyDto', 'symbol'),
            rate: BuiltValueNullFieldError.checkNotNull(
                rate, r'CurrencyDto', 'rate'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'CurrencyDto', 'description'),
            rateFloat: BuiltValueNullFieldError.checkNotNull(
                rateFloat, r'CurrencyDto', 'rateFloat'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
