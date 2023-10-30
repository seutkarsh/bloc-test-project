import 'package:bloc_test_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_test_project/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel product;
  final HomeBloc homebloc;
  const ProductTileWidget(
      {required this.homebloc, required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(product.imageLink))),
          ),
          SizedBox(height: 15),
          Text(product.name),
          Text(product.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + product.price.toString()),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeProductWishlistButtonClickedEvent(
                            product: product));
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeProductCartButtonClickedEvent(
                            product: product));
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
