import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String? text;
  final AssetImage? image;

  const CardContent({Key? key, this.text, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Image(image: image!),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ],
    );
  }
}
