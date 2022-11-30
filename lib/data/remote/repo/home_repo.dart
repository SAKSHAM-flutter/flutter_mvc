import 'package:interview_task/data/remote/endpoints.dart';
import 'package:interview_task/data/remote/model/current_price.dart';
import 'package:interview_task/data/remote/model/response_dto.dart';
import 'package:interview_task/data/remote/networking.dart';

class HomeRepo {
  static Future<ResponseDto<CurrentPrice>> getCurrency() async {
    ResponseDto<CurrentPrice> responseDto =
        await httpGet<CurrentPrice>(Endpoints.getCurrency, {});
    return responseDto;
  }
}
