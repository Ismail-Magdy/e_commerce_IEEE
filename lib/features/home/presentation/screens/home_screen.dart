import 'package:e_commerce_app/features/home/data/api/products_api.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/product_card.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  "Welcome,",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
                const Text(
                  "Our Shop",
                  style: TextStyle(
                    fontWeight: .bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: .circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.blue),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const .all(16.0),
              child: Container(
                padding: const .symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search products...",
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.blue),
                  ),
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: .horizontal,
              padding: const .symmetric(horizontal: 16),
              child: Row(
                children: ["All", "Shoes", "Shirts", "Tech", "Home"].map((cat) {
                  bool isAll = cat == "All";
                  return Container(
                    margin: const .only(right: 12),
                    padding: const .symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isAll ? Colors.blue : Colors.white,
                      borderRadius: .circular(12),
                      boxShadow: [
                        if (!isAll)
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 5,
                          ),
                      ],
                    ),
                    child: Text(
                      cat,
                      style: TextStyle(
                        color: isAll ? Colors.white : Colors.grey.shade700,
                        fontWeight: .bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            FutureBuilder<List<ProductModel>>(
              future: ProductsApi().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == .waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError || snapshot.data == null) {
                  return const Center(
                    child: Text(
                      "Error",
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                  );
                }
                List<ProductModel> products = snapshot.data!;
                return Padding(
                  padding: const .all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        title: product.title!,
                        price: product.price!,
                        description: product.description!,
                        image: product.images![0],
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
