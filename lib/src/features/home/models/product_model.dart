import 'package:flutter/material.dart';

class ProductSize {
  final String name;
  final double price;
  final IconData icon;
  const ProductSize({
    required this.name,
    required this.price,
    required this.icon,
  });
}

class ProductAddon {
  final String name;
  final double price;
  const ProductAddon({required this.name, this.price = 0.99});
}

class Productmodel {
  final String id;
  final String category;
  final String image;
  final String title;
  final String description;
  final double rating;
  final List<ProductSize> sizes;
  final List<ProductAddon> addon;

  const Productmodel({
    required this.id,
    required this.image,
    required this.title,
    this.category = "",
    this.description = "",
    this.rating = 4.8,
    this.sizes = const [
      ProductSize(name: "Holy", price: 5.99, icon: Icons.coffee),
      ProductSize(name: "Divine", price: 6.99, icon: Icons.local_cafe),
    ],
    this.addon = const [
      ProductAddon(name: "Holy Shot"),
      ProductAddon(name: "Cold Foam"),
      ProductAddon(name: "Angel Milk"),
      ProductAddon(name: "Flaver Blessing"),
    ],
  });
}

String productHeroTag(String id) => "product_image_$id";
