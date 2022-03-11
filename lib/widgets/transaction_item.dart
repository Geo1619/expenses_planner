import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final void Function(String id) deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
            )),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width < 450
            ? IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              )
            : TextButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text(
                  'Delete',
                ),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).errorColor,
                ),
              ),
      ),
      // child: Row(
      //   children: [
      //     Container(
      //       margin: const EdgeInsets.symmetric(
      //         vertical: 10,
      //         horizontal: 10,
      //       ),
      //       decoration: BoxDecoration(
      //         color: Theme.of(context).colorScheme.secondary,
      //         border: Border.all(
      //           color: Theme.of(context).colorScheme.primary,
      //           width: 2,
      //         ),
      //       ),
      //       padding: const EdgeInsets.all(10),
      //       child: Text(
      //         '\$${transactions[index].amount.toStringAsFixed(2)}',
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //           color: Theme.of(context).colorScheme.primary,
      //         ),
      //       ),
      //     ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           transactions[index].title,
      //           style: Theme.of(context).textTheme.headline6,
      //         ),
      //         Text(
      //             DateFormat.yMMMd()
      //                 .format(transactions[index].date),
      //             style: const TextStyle(color: Colors.grey))
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
