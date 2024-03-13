import 'package:mvc_flutter/data/remote/endpoints.dart';
import 'package:mvc_flutter/data/remote/model/product_response_dto.dart';
import 'package:mvc_flutter/data/remote/model/response_dto.dart';
import 'package:mvc_flutter/data/remote/model/unit_dto.dart';
import 'package:mvc_flutter/data/remote/networking.dart';

class HomeRepo {
  static Future<ResponseDto<ProductResponseDto?>> getProducts() async {
    final response =
        await httpGet<ProductResponseDto>(Endpoints.getProduct, {});
    return response;
  }

  static Future<ResponseDto<UnitDto?>> noProduct() async {
    final response = await httpGet<UnitDto>(Endpoints.noProduct, {});
    return response;
  }
}
