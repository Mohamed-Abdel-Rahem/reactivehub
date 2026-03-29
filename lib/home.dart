// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:reactivehub/controllers/cubit/product_cubit.dart';
// import 'package:reactivehub/models/product_model.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Store')),
//       body: BlocBuilder<ProductCubit, ProductState>(
//         builder: (context, state) {
//           return switch (state) {
//             ProductLoading() => const Center(
//               child: CircularProgressIndicator(),
//             ),

//             ProductLoaded(productList: var products) => GridView.builder(
//               padding: const EdgeInsets.all(10),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.75,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemCount: products.length,
//               itemBuilder: (context, index) =>
//                   _ProductCard(product: products[index]),
//             ),

//             ProductError(errorMessage: var msg) => Center(
//               child: Text(msg ?? "Error occurred"),
//             ),
//           };
//         },
//       ),
//     );
//   }
// }

// class _ProductCard extends StatelessWidget {
//   final ProductModel product;
//   const _ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => ProductDetailsPage(product: product)),
//       ),
//       child: Card(
//         child: Column(
//           children: [
//             Expanded(
//               child: Image.network(product.imageUrl, fit: BoxFit.contain),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 product.title,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Text(
//               "\$${product.price}",
//               style: const TextStyle(color: Colors.green),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProductDetailsPage extends StatelessWidget {
//   final ProductModel product;
//   const ProductDetailsPage({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product.title)),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.network(
//               product.imageUrl,
//               height: 300,
//               width: double.infinity,
//               fit: BoxFit.contain,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product.title,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     "\$${product.price}",
//                     style: const TextStyle(fontSize: 18, color: Colors.green),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(product.description),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
