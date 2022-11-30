import 'package:interview_task/data/remote/model/current_price.dart';
import 'package:interview_task/data/remote/model/response_dto.dart';
import 'package:interview_task/data/remote/repo/home_repo.dart';
import 'package:interview_task/ui/utils/base_class/view_model.dart';

class HomeViewModel extends ViewModel {
  void getPrices() {
    callApi(() async {
      ResponseDto<CurrentPrice?> responseDto = await HomeRepo.getCurrency();
    });
  }
}
