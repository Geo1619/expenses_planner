import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  const AdaptiveTextButton(
      {Key? key, required this.text, required this.handler})
      : super(key: key);

  final String text;
  final Function handler;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(text),
            onPressed: () => handler(),
          )
        : TextButton(
            onPressed: () => handler(),
            child: Text(text),
          );
  }
}
