import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'time_dto.g.dart';

abstract class TimeDto implements Built<TimeDto, TimeDtoBuilder> {
  TimeDto._();

  String get updated;

  String get updatedISO;

  @BuiltValueField(wireName: "updateduk")
  String get updatedUk;

  static Serializer<TimeDto> get serializer => _$timeDtoSerializer;
  factory TimeDto([void Function(TimeDtoBuilder)? updates]) = _$TimeDto;
}
