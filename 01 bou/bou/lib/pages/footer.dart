import 'package:auto_route/auto_route.dart';
import 'package:bou/pages/separator_line.dart';
import 'package:bou/services/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return Expanded(
      flex: 0,
      child: Column(
        children: [
          SeparatorLineWidget(),
          Container(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    // context.router.navigate(const MyHomeRoute());
                    // AutoRouter.of(context).navigate(MyHomeRoute());
                    tabsRouter.setActiveIndex(0);
                  },
                  icon: const Icon(
                    CupertinoIcons.home,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // context.router.push(const MySearchRoute());
                    // AutoRouter.of(context).push(MySearchRoute());
                    tabsRouter.setActiveIndex(2);
                  },
                  icon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    tabsRouter.setActiveIndex(1);
                  },
                  child: ClipOval(
                    child: Image.asset(
                      "assets/my_files/profile.jpg",
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
