import 'package:bloc/bloc.dart';
import 'package:elevate_challenge/features/home/domain/use_cases/fetch_products_use_case.dart';

import 'fetch_products_state.dart';

class FetchProductsCubit extends Cubit<FetchProductsStates> {
  final FetchProductsUseCase _fetchProductsUseCase;
  FetchProductsCubit(this._fetchProductsUseCase)
      : super(FetchProductsInitial());

  Future<void> fetchProducts() async {
    final result = await _fetchProductsUseCase.execute();
    result.fold(
      (failure) {
        emit(FetchProductsFailure(errorMessage: failure.errorMessage));
      },
      (products) {
        emit(FetchProductsSuccess(products: products));
      },
    );
  }
}
