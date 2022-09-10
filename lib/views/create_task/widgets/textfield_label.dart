import 'dart:math';

import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.label,
    this.icon,
    this.smallText = false,
    this.description = false,
    this.node,
    this.controller,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final TextEditingController? controller;
  final IconData? icon;
  final bool smallText;
  final bool description;
  final FocusNode? node;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyText1),
        TextFormField(
          onTap: () {
            onTap();
          },
          controller: controller,
          focusNode: node,
          maxLines: 1,
          scrollPadding: EdgeInsets.zero,
          textAlignVertical: TextAlignVertical.bottom,
          style: !smallText
              ? Theme.of(context).textTheme.headline5
              : Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.black,
                  fontWeight:
                      !description ? FontWeight.w500 : FontWeight.normal),
          decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(bottom: 5),
              suffixIconColor: Theme.of(context).primaryColor,
              suffixIcon: Transform.rotate(
                  angle: -pi / 2,
                  child: Icon(
                    icon,
                    size: 26,
                    color: Theme.of(context).primaryColor,
                  ))),
        ),
      ],
    );
  }
}
