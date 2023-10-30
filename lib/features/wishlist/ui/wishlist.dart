import 'package:bloc_test_project/data/wishlist_items.dart';
import 'package:bloc_test_project/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    // TODO: implement initState
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is WishlistLoadedSuccessState) {
          return Scaffold(
              body: wishlistItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: wishlistItems.length,
                      itemBuilder: (context, index) {
                        return Text(wishlistItems[index].name);
                      })
                  : Center(
                      child: Text("Empty List"),
                    ));
        } else {
          return Text("Else Part");
        }
      },
    );
  }
}
