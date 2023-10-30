import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_project/data/cart_items.dart';
import 'package:bloc_test_project/data/products.dart';
import 'package:bloc_test_project/data/wishlist_items.dart';
import 'package:bloc_test_project/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistNavigateButtonClickedEvent>(
        homeWishlistNavigateButtonClickedEvent);

    on<HomeCartNavigateButtonClickedEvent>(homeCartNavigateButtonClickedEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeWishlistNavigateButtonClickedEvent(
      HomeWishlistNavigateButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Navigate to Wishlist Clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartNavigateButtonClickedEvent(
      HomeCartNavigateButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Navigate to Cart Clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.product);
    emit(HomeProductWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.product);
    emit(HomeProductCartedActionState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(HomeLoadedSuccessState(
        products: ProductData.foodProducts
            .map((e) => ProductDataModel(
                id: e["id"],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageLink: e['imageLink']))
            .toList()));
  }
}
