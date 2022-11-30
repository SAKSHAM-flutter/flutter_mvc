// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_price.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CurrentPrice> _$currentPriceSerializer =
    new _$CurrentPriceSerializer();

class _$CurrentPriceSerializer implements StructuredSerializer<CurrentPrice> {
  @override
  final Iterable<Type> types = const [CurrentPrice, _$CurrentPrice];
  @override
  final String wireName = 'CurrentPrice';

  @override
  Iterable<Object?> serialize(Serializers serializers, CurrentPrice object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(TimeDto)),
      'disclaimer',
      serializers.serialize(object.disclaimer,
          specifiedType: const FullType(String)),
      'chartName',
      serializers.serialize(object.chartName,
          specifiedType: const FullType(String)),
      'bpi',
      serializers.serialize(object.bpi, specifiedType: const FullType(Bpi)),
    ];

    return result;
  }

  @override
  CurrentPrice deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CurrentPriceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'time':
          result.time.replace(serializers.deserialize(value,
              specifiedType: const FullType(TimeDto))! as TimeDto);
          break;
        case 'disclaimer':
          result.disclaimer = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'chartName':
          result.chartName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'bpi':
          result.bpi.replace(serializers.deserialize(value,
              specifiedType: const FullType(Bpi))! as Bpi);
          break;
      }
    }

    return result.build();
  }
}

class _$CurrentPrice extends CurrentPrice {
  @override
  final TimeDto time;
  @override
  final String disclaimer;
  @override
  final String chartName;
  @override
  final Bpi bpi;

  factory _$CurrentPrice([void Function(CurrentPriceBuilder)? updates]) =>
      (new CurrentPriceBuilder()..update(updates))._build();

  _$CurrentPrice._(
      {required this.time,
      required this.disclaimer,
      required this.chartName,
      required this.bpi})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(time, r'CurrentPrice', 'time');
    BuiltValueNullFieldError.checkNotNull(
        disclaimer, r'CurrentPrice', 'disclaimer');
    BuiltValueNullFieldError.checkNotNull(
        chartName, r'CurrentPrice', 'chartName');
    BuiltValueNullFieldError.checkNotNull(bpi, r'CurrentPrice', 'bpi');
  }

  @override
  CurrentPrice rebuild(void Function(CurrentPriceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrentPriceBuilder toBuilder() => new CurrentPriceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CurrentPrice &&
        time == other.time &&
        disclaimer == other.disclaimer &&
        chartName == other.chartName &&
        bpi == other.bpi;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, time.hashCode), disclaimer.hashCode),
            chartName.hashCode),
        bpi.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CurrentPrice')
          ..add('time', time)
          ..add('disclaimer', disclaimer)
          ..add('chartName', chartName)
          ..add('bpi', bpi))
        .toString();
  }
}

class CurrentPriceBuilder
    implements Builder<CurrentPrice, CurrentPriceBuilder> {
  _$CurrentPrice? _$v;

  TimeDtoBuilder? _time;
  TimeDtoBuilder get time => _$this._time ??= new TimeDtoBuilder();
  set time(TimeDtoBuilder? time) => _$this._time = time;

  String? _disclaimer;
  String? get disclaimer => _$this._disclaimer;
  set disclaimer(String? disclaimer) => _$this._disclaimer = disclaimer;

  String? _chartName;
  String? get chartName => _$this._chartName;
  set chartName(String? chartName) => _$this._chartName = chartName;

  BpiBuilder? _bpi;
  BpiBuilder get bpi => _$this._bpi ??= new BpiBuilder();
  set bpi(BpiBuilder? bpi) => _$this._bpi = bpi;

  CurrentPriceBuilder();

  CurrentPriceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time.toBuilder();
      _disclaimer = $v.disclaimer;
      _chartName = $v.chartName;
      _bpi = $v.bpi.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CurrentPrice other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CurrentPrice;
  }

  @override
  void update(void Function(CurrentPriceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CurrentPrice build() => _build();

  _$CurrentPrice _build() {
    _$CurrentPrice _$result;
    try {
      _$result = _$v ??
          new _$CurrentPrice._(
              time: time.build(),
              disclaimer: BuiltValueNullFieldError.checkNotNull(
                  disclaimer, r'CurrentPrice', 'disclaimer'),
              chartName: BuiltValueNullFieldError.checkNotNull(
                  chartName, r'CurrentPrice', 'chartName'),
              bpi: bpi.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'time';
        time.build();

        _$failedField = 'bpi';
        bpi.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CurrentPrice', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
