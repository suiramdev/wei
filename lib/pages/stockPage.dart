import 'package:flutter/material.dart';
import 'package:wei/components/productCard.dart';
import 'package:wei/objects/product.dart';
import 'package:wei/objects/stock.dart';
import 'package:wei/utils/color.dart';

class StockPage extends StatefulWidget {
  final Stock stock;

  const StockPage({Key? key, required this.stock}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  final List<Product> _products = [];
  Color _nextColor = randomMaterialColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children:
              _products.map<Widget>((e) => ProductCard(product: e)).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<Widget>(
          context: context,
          builder: (context) {
            final _form = GlobalKey<FormState>();
            final _name = TextEditingController();
            return Form(
              key: _form,
              child: AlertDialog(
                title: const Text('Create a product'),
                content: TextFormField(
                    controller: _name,
                    validator: (value) => value == null || value.isEmpty
                        ? 'This field is required'
                        : null,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: Theme.of(context).textTheme.bodyText1),
                    style: Theme.of(context).textTheme.bodyText1),
                actions: [
                  TextButton(
                      onPressed: () {
                        if (!_form.currentState!.validate()) return;

                        setState(() {
                          _products.add(Product(
                              name: _name.text,
                              color: _nextColor));
                          _nextColor = randomMaterialColor();
                        });

                        Navigator.pop(context);
                      },
                      child: const Text('Create'))
                ],
              ),
            );
          },
        ),
        child: const Icon(Icons.add),
        backgroundColor: _nextColor,
      ),
    );
  }
}
