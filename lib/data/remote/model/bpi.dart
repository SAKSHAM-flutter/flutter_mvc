import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:interview_task/data/remote/model/currency_dto.dart';

part 'bpi.g.dart';

abstract class Bpi implements Built<Bpi, BpiBuilder> {
  Bpi._();

  @BuiltValueField(wireName: 'USD')
  CurrencyDto get usd;

  @BuiltValueField(wireName: 'GBP')
  CurrencyDto get gbp;

  @BuiltValueField(wireName: 'EUR')
  CurrencyDto get eur;

  static Serializer<Bpi> get serializer => _$bpiSerializer;
  factory Bpi([void Function(BpiBuilder)? updates]) = _$Bpi;
}
