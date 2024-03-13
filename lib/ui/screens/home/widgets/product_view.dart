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
    return Selector<HomeViewModel, Tuple2<List<ProductDto>?, bool>>(
      selector: (ctx, provider) =>
          Tuple2(provider.products, provider.isLoading),
      builder: (ctx, items, child) {
        if (items.item2) return const SizedBox.shrink();
        if (items.item1 == null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonButton(
                onTap: () => context.model<HomeViewModel>().getProducts(),
                title: "Get Product",
              ),
              const SizedBox(height: 10),
              CommonButton(
                onTap: () => context.model<HomeViewModel>().noProduct(),
                title: "When Product Empty",
              ),
            ],
          );
        }
        if (items.item1!.isEmpty) {
          return Column(
            children: [
              const Center(
                child: Text("No Product Found!"),
              ),
              const SizedBox(height: 10),
              CommonButton(
                onTap: () => context.model<HomeViewModel>().getProducts(),
                title: "Get Product",
              ),
            ],
          );
        }
        return Expanded(
          child: ListView.separated(
            itemCount: items.item1!.length,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            separatorBuilder: (ctx, index) => const SizedBox(height: 10),
            itemBuilder: (ctx, position) => ItemView(
              productDto: items.item1![position],
            ),
          ),
        );
      },
    );
  }
}
