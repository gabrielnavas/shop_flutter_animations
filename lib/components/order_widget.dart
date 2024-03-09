import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_flutter_app/models/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget(this.order, {super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final double itemsHeight = (widget.order.cartItems.length * 32) + 5;
    Duration durationAnimated = const Duration(milliseconds: 280);

    Widget order = _renderOrder();
    Widget orderItems = renderOrderItems(durationAnimated, itemsHeight);

    return AnimatedContainer(
      duration: durationAnimated,
      height: _expanded ? itemsHeight + 95 : 95,
      child: Card(
        child: Column(
          children: [order, orderItems],
        ),
      ),
    );
  }

  Widget renderOrderItems(Duration durationAnimated, double itemsHeight) {
    Widget orderItems = AnimatedContainer(
      duration: durationAnimated,
      height: _expanded ? itemsHeight : 0,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: ListView(
          children: widget.order.cartItems
              .map(
                (product) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.productName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${product.quantity}x',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'R\$${product.productPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'R\$${(product.productPrice * product.quantity).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
              .toList()),
    );
    return orderItems;
  }

  Widget _renderOrder() {
    Widget order = ListTile(
      title: Text('R\$${widget.order.total.toStringAsFixed(2)}'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.expand_more),
        onPressed: () => setState(() {
          _expanded = !_expanded;
        }),
      ),
    );
    return order;
  }
}
