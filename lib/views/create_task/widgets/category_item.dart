import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor:
              index == 0 ? Theme.of(context).primaryColor : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
              letterSpacing: 1,
              color:
                  index == 0 ? Colors.white : Theme.of(context).primaryColor),
        ));
  }
}
