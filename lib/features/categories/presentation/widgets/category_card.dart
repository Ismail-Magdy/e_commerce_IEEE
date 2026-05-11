import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final int? id;
  final String? name;
  final String? imageUrl;

  const CategoryCard({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: .circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl ?? ""),
                fit: .cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name ?? "error",
            style: const TextStyle(fontWeight: .bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
