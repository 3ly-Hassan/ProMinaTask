import 'package:flutter/material.dart';
import 'package:promina_task/utility/constants.dart';

import '../../shared/widgets/menu_button.dart';
import '../create_task/create_task.dart';
import 'widgets/square_button.dart';
import 'widgets/tasks_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final horizontaPadding = size.width * .1;
    final verticalPadding = size.height * .05;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: MainHomeContainerClip(),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.only()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: horizontaPadding,
                            right: horizontaPadding,
                            top: verticalPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.width * .02),
                                  child: const MenuButton(),
                                ),
                                const SizedBox(width: 8),
                                Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.notifications_none,
                                        size: verticalPadding,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 6,
                                      left: 16,
                                      child: Material(
                                        color: Colors.amber,
                                        type: MaterialType.circle,
                                        child:
                                            Padding(padding: EdgeInsets.all(5)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: verticalPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'My Task',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SqureButton(
                                  label1: '+',
                                  index: 0,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CreateTask(),
                                        ));
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: verticalPadding * .2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Today',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontSize: horizontaPadding * .5,
                                          fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Monday, 1 June',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            SizedBox(height: verticalPadding * .7),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: horizontaPadding,
                            bottom: verticalPadding * 2 < 80
                                ? 80
                                : verticalPadding * 2),
                        child: SizedBox(
                          height: verticalPadding * 1.3 < 65
                              ? 65
                              : verticalPadding * 1.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: horizontaPadding * .5),
                                child: SqureButton(
                                  onTap: () {},
                                  label1: '0${index + 1}',
                                  index: index,
                                  label2: letters[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ClipPath(
                  clipper: HomeContainerClipper(),
                  child: Container(
                      padding: EdgeInsets.only(
                          top: verticalPadding * .9, right: horizontaPadding),
                      alignment: Alignment.topRight,
                      width: size.width * .5,
                      height: size.height * .17,
                      color: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: size.width * .06 > 32 ? 25 : size.width * .06,
                        backgroundImage: const AssetImage('assets/woman.jpg'),
                      )),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
                child: Padding(
                    padding: EdgeInsets.only(left: verticalPadding * .9),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        scrollbarTheme: ScrollbarThemeData(
                          interactive: true,
                          thumbVisibility: MaterialStateProperty.all(true),
                          thumbColor: MaterialStateProperty.all(Colors.black),
                          trackVisibility: MaterialStateProperty.all(true),
                          trackColor: MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Scrollbar(
                          scrollbarOrientation: ScrollbarOrientation.left,
                          thickness: 3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: horizontaPadding * .8),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: tasks.length,
                              itemBuilder: (context, index) {
                                return TasksListItem(
                                  taskName: tasks[index].name,
                                  taskTime: tasks[index].time,
                                  img: tasks[index].img,
                                  taskDesc: tasks[index].taskDesc,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}

class MainHomeContainerClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * .75);
    path.quadraticBezierTo(
        0, size.height * .88, size.width * .15, size.height * .88);
    path.lineTo(size.width * .85, size.height * .88);
    path.quadraticBezierTo(
        size.width, size.height * .88, size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HomeContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    path.quadraticBezierTo(
        size.width, size.height * .7, size.width * .7, size.height * .7);
    path.lineTo(size.width * .6, size.height * .7);
    path.quadraticBezierTo(
        size.width * .3, size.height * .7, size.width * .3, size.height * .3);
    path.quadraticBezierTo(size.width * .3, 0, 0, 0);

    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
