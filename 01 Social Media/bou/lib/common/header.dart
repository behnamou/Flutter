import 'package:auto_route/auto_route.dart';
import 'package:bou/router/app_router.gr.dart';
import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu_rounded,
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
                  {context.router.push(const MyNotificationsRoute())},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
