import 'package:flutter/material.dart';
import 'package:wei/objects/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(widget.product.name),
        ),
        shape: Border(top: BorderSide(color: widget.product.color, width: 5)),
        color: Theme.of(context).cardColor);
  }
}
