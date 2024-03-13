import 'package:built_collection/built_collection.dart';
import 'package:mvc_flutter/data/remote/endpoints.dart';
import 'package:mvc_flutter/data/remote/model/product_dto.dart';
import 'package:mvc_flutter/data/remote/model/response_dto.dart';
import 'package:mvc_flutter/data/remote/networking.dart';

class HomeRepo {
  static Future<ResponseDto<BuiltList<ProductDto>?>> getProducts() async {
    final response = await httpGetList<ProductDto>(Endpoints.getProduct, {});
    return response;
  }
}
