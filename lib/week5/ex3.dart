import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum ProductType {
  dart('Dart', 'The best object language', 'assets/ex3/dart.png'),
  flutter('Flutter', 'The best mobile widget library', 'assets/ex3/flutter.png'),
  firebase('Firebase', 'The best cloud database', 'assets/ex3/firebase.png');

  final String title;
  final String description;
  final String imagePath;

  const ProductType(this.title, this.description, this.imagePath);
}

class ProductCard extends StatelessWidget {
  final ProductType product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: const Text('Products')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: const [
              ProductCard(product: ProductType.dart),
              ProductCard(product: ProductType.flutter),
              ProductCard(product: ProductType.firebase),
            ],
          ),
        ),
      ),
    );
  }
}
