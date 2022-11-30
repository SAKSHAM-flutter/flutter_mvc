// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TimeDto> _$timeDtoSerializer = new _$TimeDtoSerializer();

class _$TimeDtoSerializer implements StructuredSerializer<TimeDto> {
  @override
  final Iterable<Type> types = const [TimeDto, _$TimeDto];
  @override
  final String wireName = 'TimeDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, TimeDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'updated',
      serializers.serialize(object.updated,
          specifiedType: const FullType(String)),
      'updatedISO',
      serializers.serialize(object.updatedISO,
          specifiedType: const FullType(String)),
      'updateduk',
      serializers.serialize(object.updatedUk,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TimeDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TimeDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'updated':
          result.updated = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'updatedISO':
          result.updatedISO = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'updateduk':
          result.updatedUk = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TimeDto extends TimeDto {
  @override
  final String updated;
  @override
  final String updatedISO;
  @override
  final String updatedUk;

  factory _$TimeDto([void Function(TimeDtoBuilder)? updates]) =>
      (new TimeDtoBuilder()..update(updates))._build();

  _$TimeDto._(
      {required this.updated,
      required this.updatedISO,
      required this.updatedUk})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(updated, r'TimeDto', 'updated');
    BuiltValueNullFieldError.checkNotNull(updatedISO, r'TimeDto', 'updatedISO');
    BuiltValueNullFieldError.checkNotNull(updatedUk, r'TimeDto', 'updatedUk');
  }

  @override
  TimeDto rebuild(void Function(TimeDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimeDtoBuilder toBuilder() => new TimeDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimeDto &&
        updated == other.updated &&
        updatedISO == other.updatedISO &&
        updatedUk == other.updatedUk;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, updated.hashCode), updatedISO.hashCode),
        updatedUk.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TimeDto')
          ..add('updated', updated)
          ..add('updatedISO', updatedISO)
          ..add('updatedUk', updatedUk))
        .toString();
  }
}

class TimeDtoBuilder implements Builder<TimeDto, TimeDtoBuilder> {
  _$TimeDto? _$v;

  String? _updated;
  String? get updated => _$this._updated;
  set updated(String? updated) => _$this._updated = updated;

  String? _updatedISO;
  String? get updatedISO => _$this._updatedISO;
  set updatedISO(String? updatedISO) => _$this._updatedISO = updatedISO;

  String? _updatedUk;
  String? get updatedUk => _$this._updatedUk;
  set updatedUk(String? updatedUk) => _$this._updatedUk = updatedUk;

  TimeDtoBuilder();

  TimeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _updated = $v.updated;
      _updatedISO = $v.updatedISO;
      _updatedUk = $v.updatedUk;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TimeDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TimeDto;
  }

  @override
  void update(void Function(TimeDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TimeDto build() => _build();

  _$TimeDto _build() {
    final _$result = _$v ??
        new _$TimeDto._(
            updated: BuiltValueNullFieldError.checkNotNull(
                updated, r'TimeDto', 'updated'),
            updatedISO: BuiltValueNullFieldError.checkNotNull(
                updatedISO, r'TimeDto', 'updatedISO'),
            updatedUk: BuiltValueNullFieldError.checkNotNull(
                updatedUk, r'TimeDto', 'updatedUk'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
