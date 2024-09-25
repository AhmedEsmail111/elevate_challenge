import 'package:elevate_challenge/features/home/domain/use_cases/fetch_products_use_case.dart';
import 'package:elevate_challenge/features/home/presentation/manager/cubit/fetch_products_cubit.dart';
import 'package:elevate_challenge/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locator/locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => FetchProductsCubit(
          const Locator().get<FetchProductsUseCase>(),
        )..fetchProducts(),
        child: const SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
