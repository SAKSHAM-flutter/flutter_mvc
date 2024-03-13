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
      elevation: 5,
      child: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CustomImage(
                source: productDto.thumbnail,
                height: 180,
                width: context.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name:- ${productDto.title}",
                    style: Poppins.semiBold().s14,
                    maxLines: 1,
                  ),
                  Text(
                    productDto.description,
                    textAlign: TextAlign.center,
                    style: Poppins.semiBold().s14,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
