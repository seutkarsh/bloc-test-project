part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel product;

  HomeProductWishlistButtonClickedEvent({required this.product});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel product;

  HomeProductCartButtonClickedEvent({required this.product});
}

class HomeWishlistNavigateButtonClickedEvent extends HomeEvent {}

class HomeCartNavigateButtonClickedEvent extends HomeEvent {}
