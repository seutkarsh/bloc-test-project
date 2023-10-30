import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_project/data/cart_items.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    print(cartItems);
    emit(CartLoadedSuccessState());
  }
}
