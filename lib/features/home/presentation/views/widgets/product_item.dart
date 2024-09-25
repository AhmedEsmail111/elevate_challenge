import 'package:elevate_challenge/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/my_colors.dart';
import 'image_stack.dart';
import 'product_item_body.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: primaryColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageStack(image: productEntity.image, isWishlisted: false),
          const SizedBox(
            height: 7,
          ),
          ProductItemBody(
            productEntity: productEntity,
          )
        ],
      ),
    );
  }
}
