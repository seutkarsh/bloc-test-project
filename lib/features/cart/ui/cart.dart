import 'package:bloc_test_project/data/cart_items.dart';
import 'package:bloc_test_project/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartbloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    cartbloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
        bloc: cartbloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartLoadedSuccessState) {
            return Scaffold(
                body: cartItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return Text(cartItems[index].name);
                        })
                    : Center(child: Text("Empty List")));
          } else {
            return Text("Else part");
          }
        });
  }
}
