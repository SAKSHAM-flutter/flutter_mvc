import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'unit_dto.g.dart';

abstract class UnitDto implements Built<UnitDto, UnitDtoBuilder> {
  UnitDto._();

  static Serializer<UnitDto> get serializer => _$unitDtoSerializer;

  factory UnitDto([void Function(UnitDtoBuilder)? updates]) = _$UnitDto;
}
