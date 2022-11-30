import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:interview_task/data/remote/model/currency_dto.dart';
import 'package:interview_task/data/remote/model/current_price.dart';
import 'package:interview_task/data/remote/model/response_dto.dart';
import 'package:interview_task/data/remote/model/time_dto.dart';

import 'bpi.dart';

part 'default_serializers.g.dart';

@SerializersFor([
  ResponseDto,
  CurrentPrice,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
