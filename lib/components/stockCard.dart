import 'package:flutter/material.dart';
import 'package:wei/objects/stock.dart';
import 'package:wei/pages/stockPage.dart';

class StockCard extends StatefulWidget {
  final Stock stock;

  const StockCard({Key? key, required this.stock}) : super(key: key);

  @override
  _StockCardState createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: TextButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("#${widget.stock.id} ${widget.stock.name}",
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StockPage(stock: widget.stock)));
                  },
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Icon(Icons.delete, color: Colors.black38))
            ],
          ),
        ),
        shape: Border(left: BorderSide(color: widget.stock.color, width: 5)),
        elevation: 2,
        color: Theme.of(context).cardColor);
  }
}
