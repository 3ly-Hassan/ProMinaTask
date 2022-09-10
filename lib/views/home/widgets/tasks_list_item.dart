import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TasksListItem extends StatelessWidget {
  const TasksListItem({
    Key? key,
    required this.taskName,
    required this.taskTime,
    required this.img,
    required this.taskDesc,
  }) : super(key: key);
  final String taskName;
  final String taskTime;
  final String taskDesc;
  final String img;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: width * .2 < 160 ? 160 : width * .2,
        width: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6, bottom: 16),
              child: Container(
                padding: EdgeInsets.all(width * .04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: SvgPicture.asset(
                        img,
                      ),
                    ),
                    SizedBox(width: width * .05),
                    Flexible(
                        flex: 7,
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                taskName,
                                style: Theme.of(context).textTheme.headline5,
                                textAlign: TextAlign.end,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                taskDesc,
                                textAlign: TextAlign.end,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Material(
                  color: Colors.black,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .01),
                    child: Text(
                      taskTime,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
