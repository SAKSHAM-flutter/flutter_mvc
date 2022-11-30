import 'package:built_value/built_value.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:interview_task/data/remote/model/time_dto.dart';

import 'bpi.dart';

part 'current_price.g.dart';

abstract class CurrentPrice
    implements Built<CurrentPrice, CurrentPriceBuilder> {
  TimeDto get time;

  String get disclaimer;

  String get chartName;

  Bpi get bpi;

  CurrentPrice._();

  static Serializer<CurrentPrice> get serializer => _$currentPriceSerializer;
  factory CurrentPrice([void Function(CurrentPriceBuilder)? updates]) =
      _$CurrentPrice;
}
