import 'package:flutter/material.dart';
import 'package:wei/objects/product.dart';

class Stock {
  final int id;
  final String name;
  final Color color;
  // Unused yet. TODO Would be used to save products
  List<Product> products = [];

  Stock({required this.id, required this.name, required this.color});
}