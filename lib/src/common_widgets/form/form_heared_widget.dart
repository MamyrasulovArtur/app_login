import 'package:flutter/material.dart';

class FormHearedWidget extends StatelessWidget {
  const FormHearedWidget({
    super.key,
    required this.size,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: size.height * 0.2, image: AssetImage(image)),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        Text(subTitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
