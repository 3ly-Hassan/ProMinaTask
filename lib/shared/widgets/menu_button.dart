import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 2,
          color: Colors.black,
        ),
        const SizedBox(height: 8),
        Container(
          width: 20,
          height: 2,
          color: Colors.black,
        )
      ],
    );
  }
}
