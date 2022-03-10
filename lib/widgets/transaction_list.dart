import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String id) deleteTx;
  const TransactionList(
      {Key? key, required this.transactions, required this.deleteTx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions available yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
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
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                        )),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[index].id),
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
              },
            ),
    );
  }
}
