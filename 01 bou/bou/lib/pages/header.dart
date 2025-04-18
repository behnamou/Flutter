import 'package:auto_route/auto_route.dart';
import 'package:bou/pages/separator_line.dart';
import 'package:bou/services/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // final tabsRouter = AutoTabsRouter.of(context);
    return Expanded(
      flex: 0,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          // Icons.menu_rounded,
                          CupertinoIcons.bars,
                          color: Colors.black,
                        )),
                    TextButton(
                      onPressed: () {
                        AutoRouter.of(context).push(const HamsterRoute());
                      },
                      child: const Text(
                        'b',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          {AutoRouter.of(context).push(MyNotificationsRoute())},
                      icon: const Icon(
                        CupertinoIcons.bell_fill,
                        // Icons.notifications,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SeparatorLineWidget(),
        ],
      ),
    );
  }
}
