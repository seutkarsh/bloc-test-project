import 'package:bloc_test_project/features/cart/ui/cart.dart';
import 'package:bloc_test_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_test_project/features/home/ui/product_block.dart';
import 'package:bloc_test_project/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishlistPage()));
        } else if (state is HomeProductWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Product Added to Wishlist")));
        } else if (state is HomeProductCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Product Added to Cart")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Bloc Test App"),
                  backgroundColor: Colors.teal,
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc
                              .add(HomeWishlistNavigateButtonClickedEvent());
                        },
                        icon: const Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartNavigateButtonClickedEvent());
                        },
                        icon: const Icon(Icons.shopping_bag_outlined)),
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                          homebloc: homeBloc,
                          product: successState.products[index]);
                    }));

          case HomeErrorState:
            return const Scaffold(
              body: Center(child: Text("Error State")),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
