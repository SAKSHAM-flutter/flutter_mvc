import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'currency_dto.g.dart';

abstract class CurrencyDto implements Built<CurrencyDto, CurrencyDtoBuilder> {
  CurrencyDto._();

  String get code;

  String get symbol;

  String get rate;

  String get description;

  @BuiltValueField(wireName: "rate_float")
  double get rateFloat;

  static Serializer<CurrencyDto> get serializer => _$currencyDtoSerializer;
  factory CurrencyDto([void Function(CurrencyDtoBuilder)? updates]) =
      _$CurrencyDto;
}
