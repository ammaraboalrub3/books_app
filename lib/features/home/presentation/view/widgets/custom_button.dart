import 'package:bookly/constants.dart';
import 'package:bookly/core/helper/is_arabic.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_container.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorezinatalPadding),
      child: Row(
        children: [
          CustomContainer(
            onTap: () {},
            backColor: Colors.white,
            borderRadius: isEnglish()
                ? BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
            textColor: Colors.black,
            text: S.of(context).price,
          ),

          CustomContainer(
            onTap: () {},
            text: S.of(context).view_online,
            backColor: Color(0xffEF8262),
            borderRadius: isEnglish()
                ? BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
          ),
        ],
      ),
    );
  }
}
