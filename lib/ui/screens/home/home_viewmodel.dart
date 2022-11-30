import 'package:flutter/material.dart';
import 'package:interview_task/data/local/shared_pref_helper.dart';
import 'package:interview_task/data/remote/model/current_price.dart';
import 'package:interview_task/data/remote/repo/home_repo.dart';
import 'package:interview_task/ui/utils/base_class/view_model.dart';

class HomeViewModel extends ViewModel {
  void getPrices() {
    callApi(() async {
      CurrentPrice responseDto = await HomeRepo.getCurrency();
      Prefs.localData.set(responseDto.toJson());
      getFromLocal();
    });
  }

  void getFromLocal() {
    String json = Prefs.localData.get();
    CurrentPrice? responseDto = CurrentPrice.fromJson(json);
    debugPrint("Get Local");
    debugPrint(responseDto.toString());
  }
}
