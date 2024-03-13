// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseDto<Object?>> _$responseDtoSerializer =
    new _$ResponseDtoSerializer();

class _$ResponseDtoSerializer
    implements StructuredSerializer<ResponseDto<Object?>> {
  @override
  final Iterable<Type> types = const [ResponseDto, _$ResponseDto];
  @override
  final String wireName = 'ResponseDto';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ResponseDto<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterDATA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'success',
      serializers.serialize(object.isSuccessful,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('responseBody')
        ..add(serializers.serialize(value, specifiedType: parameterDATA));
    }
    return result;
  }

  @override
  ResponseDto<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterDATA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new ResponseDtoBuilder<Object?>()
        : serializers.newBuilder(specifiedType) as ResponseDtoBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'success':
          result.isSuccessful = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'responseBody':
          result.data =
              serializers.deserialize(value, specifiedType: parameterDATA);
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseDto<DATA> extends ResponseDto<DATA> {
  @override
  final int status;
  @override
  final String message;
  @override
  final bool isSuccessful;
  @override
  final DATA? data;

  factory _$ResponseDto([void Function(ResponseDtoBuilder<DATA>)? updates]) =>
      (new ResponseDtoBuilder<DATA>()..update(updates))._build();

  _$ResponseDto._(
      {required this.status,
      required this.message,
      required this.isSuccessful,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'ResponseDto', 'status');
    BuiltValueNullFieldError.checkNotNull(message, r'ResponseDto', 'message');
    BuiltValueNullFieldError.checkNotNull(
        isSuccessful, r'ResponseDto', 'isSuccessful');
    if (DATA == dynamic) {
      throw new BuiltValueMissingGenericsError(r'ResponseDto', 'DATA');
    }
  }

  @override
  ResponseDto<DATA> rebuild(void Function(ResponseDtoBuilder<DATA>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseDtoBuilder<DATA> toBuilder() =>
      new ResponseDtoBuilder<DATA>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseDto &&
        status == other.status &&
        message == other.message &&
        isSuccessful == other.isSuccessful &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, isSuccessful.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseDto')
          ..add('status', status)
          ..add('message', message)
          ..add('isSuccessful', isSuccessful)
          ..add('data', data))
        .toString();
  }
}

class ResponseDtoBuilder<DATA>
    implements Builder<ResponseDto<DATA>, ResponseDtoBuilder<DATA>> {
  _$ResponseDto<DATA>? _$v;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _isSuccessful;
  bool? get isSuccessful => _$this._isSuccessful;
  set isSuccessful(bool? isSuccessful) => _$this._isSuccessful = isSuccessful;

  DATA? _data;
  DATA? get data => _$this._data;
  set data(DATA? data) => _$this._data = data;

  ResponseDtoBuilder();

  ResponseDtoBuilder<DATA> get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _isSuccessful = $v.isSuccessful;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseDto<DATA> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseDto<DATA>;
  }

  @override
  void update(void Function(ResponseDtoBuilder<DATA>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseDto<DATA> build() => _build();

  _$ResponseDto<DATA> _build() {
    final _$result = _$v ??
        new _$ResponseDto<DATA>._(
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ResponseDto', 'status'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ResponseDto', 'message'),
            isSuccessful: BuiltValueNullFieldError.checkNotNull(
                isSuccessful, r'ResponseDto', 'isSuccessful'),
            data: data);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
