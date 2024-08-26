import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/bloc/home_product/product_dashboard_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<ProductDashboardBloc, ProductDashboardState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.cart.length,
                        itemBuilder: (context, index) {
                          final product = state.cart[index];
                          return ListTile(
                            leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                            title: Text(product.name),
                            subtitle: Text('\$${product.price.toString()}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    BlocProvider.of<ProductDashboardBloc>(context).add(DecrementProduct(product));
                                  },
                                ),
                                Text('${product.quantity}'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    BlocProvider.of<ProductDashboardBloc>(context).add(IncrementProduct(product));
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // A placeholder for the bottom sheet button, we'll use this in case the bottom sheet is not shown
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _showCheckoutBottomSheet(context, state);
                        },
                        child: Text('Checkout'),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (state is CheckoutSuccess) {
            return Center(
              child: Text('Total Cost: \$${state.totalCost.toStringAsFixed(2)}'),
            );
          }
          return Center(child: Text('Cart is empty.'));
        },
      ),
    );
  }

  void _showCheckoutBottomSheet(BuildContext context, ProductLoaded state) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final totalCost = state.cart.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Total Cost: \$${totalCost.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ProductDashboardBloc>(context).add(CheckoutCart());
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        );
      },
    );
  }
}
