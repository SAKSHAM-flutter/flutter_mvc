import 'package:flutter/material.dart';
import 'package:mvc_flutter/data/remote/model/product_dto.dart';
import 'package:mvc_flutter/ui/themes/typography.dart';
import 'package:mvc_flutter/ui/utils/base_class/base_screen.dart';
import 'package:mvc_flutter/ui/utils/widgets/custom_image.dart';

class ItemView extends StatelessWidget {
  final ProductDto productDto;

  const ItemView({super.key, required this.productDto});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 240,
        width: context.width,
        child: Column(
          children: [
            CustomImage(source: productDto.thumbnail, height: 180),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  productDto.title,
                  style: Poppins.medium().s12,
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
