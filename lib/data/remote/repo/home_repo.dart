import 'package:interview_task/data/remote/endpoints.dart';
import 'package:interview_task/data/remote/model/current_price.dart';
import 'package:interview_task/data/remote/networking.dart';

class HomeRepo {
  static Future<CurrentPrice> getCurrency() async {
    CurrentPrice responseDto =
        await httpGet<CurrentPrice>(Endpoints.getCurrency, {});
    return responseDto;
  }
}
