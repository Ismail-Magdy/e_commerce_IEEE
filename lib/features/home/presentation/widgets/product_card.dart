import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String description;
  final String image;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Expanded(
            child: Container(
              width: .infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade50, Colors.blue.shade100],
                  begin: .topLeft,
                  end: .bottomRight,
                ),
                borderRadius: const .vertical(top: .circular(20)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Expanded(
                      child: ClipRRect(
                        borderRadius: .circular(10),
                        child: Image.network(
                          image,

                          fit: .cover,
                          width: .infinity,

                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const CircularProgressIndicator();
                          },

                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.broken_image,
                              size: 40,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  PositionBag(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const .all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: .circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const .all(12.0),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: .bold, fontSize: 16),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: .bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      padding: const .all(4),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: .circular(8),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PositionBag extends StatelessWidget {
  final double? top;
  final double? right;
  final Widget child;
  const PositionBag({super.key, this.top, this.right, required this.child});

  @override
  Widget build(BuildContext context) {
    return Positioned(top: top, right: right, child: child);
  }
}
