// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Bpi> _$bpiSerializer = new _$BpiSerializer();

class _$BpiSerializer implements StructuredSerializer<Bpi> {
  @override
  final Iterable<Type> types = const [Bpi, _$Bpi];
  @override
  final String wireName = 'Bpi';

  @override
  Iterable<Object?> serialize(Serializers serializers, Bpi object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'USD',
      serializers.serialize(object.usd,
          specifiedType: const FullType(CurrencyDto)),
      'GBP',
      serializers.serialize(object.gbp,
          specifiedType: const FullType(CurrencyDto)),
      'EUR',
      serializers.serialize(object.eur,
          specifiedType: const FullType(CurrencyDto)),
    ];

    return result;
  }

  @override
  Bpi deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BpiBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'USD':
          result.usd.replace(serializers.deserialize(value,
              specifiedType: const FullType(CurrencyDto))! as CurrencyDto);
          break;
        case 'GBP':
          result.gbp.replace(serializers.deserialize(value,
              specifiedType: const FullType(CurrencyDto))! as CurrencyDto);
          break;
        case 'EUR':
          result.eur.replace(serializers.deserialize(value,
              specifiedType: const FullType(CurrencyDto))! as CurrencyDto);
          break;
      }
    }

    return result.build();
  }
}

class _$Bpi extends Bpi {
  @override
  final CurrencyDto usd;
  @override
  final CurrencyDto gbp;
  @override
  final CurrencyDto eur;

  factory _$Bpi([void Function(BpiBuilder)? updates]) =>
      (new BpiBuilder()..update(updates))._build();

  _$Bpi._({required this.usd, required this.gbp, required this.eur})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(usd, r'Bpi', 'usd');
    BuiltValueNullFieldError.checkNotNull(gbp, r'Bpi', 'gbp');
    BuiltValueNullFieldError.checkNotNull(eur, r'Bpi', 'eur');
  }

  @override
  Bpi rebuild(void Function(BpiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BpiBuilder toBuilder() => new BpiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bpi &&
        usd == other.usd &&
        gbp == other.gbp &&
        eur == other.eur;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, usd.hashCode), gbp.hashCode), eur.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Bpi')
          ..add('usd', usd)
          ..add('gbp', gbp)
          ..add('eur', eur))
        .toString();
  }
}

class BpiBuilder implements Builder<Bpi, BpiBuilder> {
  _$Bpi? _$v;

  CurrencyDtoBuilder? _usd;
  CurrencyDtoBuilder get usd => _$this._usd ??= new CurrencyDtoBuilder();
  set usd(CurrencyDtoBuilder? usd) => _$this._usd = usd;

  CurrencyDtoBuilder? _gbp;
  CurrencyDtoBuilder get gbp => _$this._gbp ??= new CurrencyDtoBuilder();
  set gbp(CurrencyDtoBuilder? gbp) => _$this._gbp = gbp;

  CurrencyDtoBuilder? _eur;
  CurrencyDtoBuilder get eur => _$this._eur ??= new CurrencyDtoBuilder();
  set eur(CurrencyDtoBuilder? eur) => _$this._eur = eur;

  BpiBuilder();

  BpiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _usd = $v.usd.toBuilder();
      _gbp = $v.gbp.toBuilder();
      _eur = $v.eur.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Bpi other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Bpi;
  }

  @override
  void update(void Function(BpiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Bpi build() => _build();

  _$Bpi _build() {
    _$Bpi _$result;
    try {
      _$result = _$v ??
          new _$Bpi._(usd: usd.build(), gbp: gbp.build(), eur: eur.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usd';
        usd.build();
        _$failedField = 'gbp';
        gbp.build();
        _$failedField = 'eur';
        eur.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Bpi', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
