import 'package:flutter/material.dart';

class SqureButton extends StatelessWidget {
  const SqureButton({
    Key? key,
    required this.label1,
    this.label2,
    required this.onTap,
    required this.index,
  }) : super(key: key);
  final String label1;
  final String? label2;
  final VoidCallback onTap;

  final int index;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onTap();
        },
        style: TextButton.styleFrom(
          fixedSize: label2 != null ? const Size(55, 65) : const Size(45, 45),
          backgroundColor:
              index == 0 ? Theme.of(context).primaryColor : Colors.transparent,
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label1,
              style: TextStyle(
                  color: index == 0 ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            if (label2 != null)
              Text(
                label2!,
                style: TextStyle(
                    color: index == 0
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
          ],
        ));
  }
}
