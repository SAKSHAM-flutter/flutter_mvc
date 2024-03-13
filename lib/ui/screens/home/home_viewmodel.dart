import 'package:mvc_flutter/data/remote/model/product_dto.dart';
import 'package:mvc_flutter/data/remote/repo/home_repo.dart';
import 'package:mvc_flutter/ui/utils/base_class/view_model.dart';

class HomeViewModel extends ViewModel {
  bool _apiView = false;
  List<ProductDto> _products = [];
  int _counter = 0;

  int get counter => _counter;

  bool get apiView => _apiView;

  List<ProductDto> get products => _products;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  set apiView(bool value) {
    if (value != apiView) {
      counter = 0;
      products = [];
    }
    _apiView = value;
    notifyListeners();
  }

  set products(List<ProductDto> value) {
    _products = value;
    notifyListeners();
  }

  void increment() {
    counter = counter + 1;
  }

  void decrement() {
    if (counter != 0) {
      counter = counter - 1;
    } else {
      onError?.call("Counter Can't be less then zero");
    }
  }

  void getProducts() {
    if (isLoading) return;
    callApi(() async {
      final response = await HomeRepo.getProducts();
      if (response.isSuccessful) {
        products = response.data?.toList() ?? [];
      } else {
        onError?.call(response.message);
      }
    });
  }
}
