import 'dart:developer';

import 'package:elevate_challenge/features/home/presentation/manager/cubit/fetch_products_cubit.dart';
import 'package:elevate_challenge/features/home/presentation/manager/cubit/fetch_products_state.dart';
import 'package:elevate_challenge/features/home/presentation/views/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_entity.dart';
import 'product_item.dart';

class ProductsGridViewBlocConsumer extends StatefulWidget {
  const ProductsGridViewBlocConsumer({super.key});

  @override
  State<ProductsGridViewBlocConsumer> createState() =>
      _ProductsGridViewBlocConsumerState();
}

class _ProductsGridViewBlocConsumerState
    extends State<ProductsGridViewBlocConsumer> {
  final List<ProductEntity> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchProductsCubit, FetchProductsStates>(
      listener: (context, state) {
        if (state is FetchProductsSuccess) {
          products.clear();
          products.addAll(state.products);
          log(products.length.toString());
        }
      },
      builder: (context, state) {
        return products.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 18,
                ),
                itemBuilder: (context, index) => ProductItem(
                  productEntity: products[index],
                ),
              )
            : const LoadingProgress();
      },
    );
  }
}
