import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactivehub/controllers/bloc/product_details/product_details_bloc.dart';

class ProductDetails extends StatelessWidget {
  final int productId;
  const ProductDetails({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsBloc()..add(GetProductDetailsEvent(productId)),
      child: Scaffold(
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            switch (state) {
              case ProductDetailsLoading():
                return const Center(child: CircularProgressIndicator());
              case ProductDetailsLoaded():
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(
                        state.product.imageUrl,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             state.product.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "\$${state.product.price}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(state.product.description),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              case ProductDetailsError():
                return Container();
            }
          },
        ),
      ),
    );
  }
}
