import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:push/endpoint/constants.dart';
import 'package:push/utils/Spacing.dart';



class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign Up".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: Spacing.defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/signup.svg"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height:Spacing.defaultPadding),
      ],
    );
  }
}