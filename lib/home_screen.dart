import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactivehub/controllers/bloc/product_list/view_data_bloc.dart';
import 'package:reactivehub/models/product_model.dart';
import 'package:reactivehub/product_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewDataBloc()..add(GetDataEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Store')),
        body: BlocBuilder<ViewDataBloc, ViewDataState>(
          builder: (context, state) {
            switch (state) {
              case LoadingData():
                return const Center(child: CircularProgressIndicator());
              case LoadedData():
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          context.read<ViewDataBloc>().add(
                            SearchedEvent(value),
                          );
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search products...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                    ),
                    Expanded(
                      child: state.products.isEmpty
                          ? const Center(child: Text('No products found.'))
                          : GridView.builder(
                              itemCount: state.products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                              itemBuilder: (BuildContext context, int index) {
                                final product = state.products[index];

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ProductDetails(
                                          productId: product.id,
                                        ),
                                      ),
                                    );
                                  },
                                  child: ProductCard(productModel: product),
                                );
                              },
                            ),
                    ),
                  ],
                );
              case ErorrData():
                return Center(child: Text(state.errorMessage));
            }
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(productModel.imageUrl, fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productModel.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "\$${productModel.price}",
            style: const TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
