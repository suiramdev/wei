import 'package:flutter/material.dart';
import 'package:wei/components/stockCard.dart';
import 'package:wei/objects/stock.dart';

import '../utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Stock> _stocks = [];
  Color _nextColor = randomMaterialColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Center(
                  child: Text('Stock',
                      style: Theme.of(context).textTheme.headline1))),
          for (final stock in _stocks) StockCard(stock: stock)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<Widget>(
            context: context,
            builder: (context) {
              final _form = GlobalKey<FormState>();
              final _name = TextEditingController();
              return Form(
                key: _form,
                child: AlertDialog(
                  title: const Text('Create a stock'),
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
                            _stocks.add(Stock(
                                id: _stocks.length,
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
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: _nextColor,
      ),
    );
  }
}
