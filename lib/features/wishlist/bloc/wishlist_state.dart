part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

//Build state
class WishlistLoadedSuccessState extends WishlistState {}
