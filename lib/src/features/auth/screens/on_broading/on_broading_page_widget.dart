import 'package:flutter/material.dart';

import '../../models/model_on_broading.dart';

class OnBroadingPage extends StatelessWidget {
  const OnBroadingPage({
    super.key,
    required this.model,
  });

  final OnBroadingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: size.height * 0.04),
          Image(
            width: size.width * 0.9,
            height: size.height * 0.5,
            fit: BoxFit.cover,
            image: AssetImage(model.image),
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: size.height * 0.1,
          )
        ],
      ),
    );
  }
}
