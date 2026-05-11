import 'package:e_commerce_app/features/categories/data/api/category_api.dart';
import 'package:e_commerce_app/features/categories/data/models/category_model.dart';
import 'package:e_commerce_app/features/categories/presentation/widgets/category_card.dart';
import 'package:e_commerce_app/features/home/presentation/screens/category_product_screen.dart';

import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: .bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<List<CategoryModel>>(
        future: CategoryApi().getAllCategories(),
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
          List<CategoryModel>? categories = snapshot.data;
          return GridView.builder(
            padding: const .all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: categories!.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CategoryProducts(id: category.id ?? 1),
                    ),
                  );
                },
                child: CategoryCard(
                  id: category.id,
                  name: category.name,
                  imageUrl: category.image,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
