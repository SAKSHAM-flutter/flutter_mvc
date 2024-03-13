import 'package:flutter/material.dart';
import 'package:mvc_flutter/data/remote/model/product_dto.dart';
import 'package:mvc_flutter/ui/screens/home/home_viewmodel.dart';
import 'package:mvc_flutter/ui/screens/home/widgets/item_view.dart';
import 'package:mvc_flutter/ui/utils/base_class/base_screen.dart';
import 'package:mvc_flutter/ui/utils/widgets/common_button.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, Tuple2<List<ProductDto>, bool>>(
      selector: (ctx, provider) =>
          Tuple2(provider.products, provider.isLoading),
      builder: (ctx, items, child) {
        if (items.item2) return const SizedBox.shrink();
        if (items.item1.isEmpty) {
          return CommonButton(
            onTap: () => context.model<HomeViewModel>().getProducts(),
            title: "Get Product",
          );
        }
        return ListView.builder(
          itemBuilder: (ctx, position) => ItemView(
            productDto: items.item1[position],
          ),
        );
      },
    );
  }
}
