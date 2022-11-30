import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:interview_task/data/utils/time_parsing_helper.dart';

class DateTimeSerializer implements PrimitiveSerializer<DateTime> {
  @override
  final Iterable<Type> types = BuiltList<Type>([DateTime]);
  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(Serializers serializers, DateTime dateTime,
      {FullType specifiedType = FullType.unspecified}) {
    return TimeParsingHelper.toHHmmString(dateTime);
  }

  @override
  DateTime deserialize(Serializers serializers, Object? serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return TimeParsingHelper.parseDateHHmm(serialized as String);
  }
}
