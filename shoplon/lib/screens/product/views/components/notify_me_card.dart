import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants.dart';

class NotifyMeCard extends StatelessWidget {
  final bool isNotify;
  final ValueChanged<bool> onChanged;

  const NotifyMeCard({
    super.key,
    this.isNotify = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: Container(
          decoration: BoxDecoration(
            color: isNotify ? primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(defaultBorderRadious),
            border: Border.all(
              color: isNotify
                  ? Colors.transparent
                  : Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.1) ?? Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: OutlinedButton(
                    onPressed: () {}, // Add functionality if needed
                    style: OutlinedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.zero,
                      side: const BorderSide(color: Colors.white10),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Notification.svg",
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  child: Text(
                    "Notify when product is back in stock.",
                    style: TextStyle(
                      color: isNotify
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CupertinoSwitch(
                  onChanged: onChanged,
                  value: isNotify,
                  activeColor: primaryMaterialColor.shade900,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
