import 'package:flutter/material.dart';

class FormHearedWidget extends StatelessWidget {
  const FormHearedWidget({
    super.key,
    required this.size,
    required this.image,
    required this.title,
    required this.subTitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.heightBetween,
    this.textAlign
  });
  final String image, title, subTitle;
  final Size size;
  final CrossAxisAlignment crossAxisAlignment;
  final double? heightBetween;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(height: size.height * 0.2, image: AssetImage(image)),
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        Text(subTitle,
            textAlign: textAlign,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
