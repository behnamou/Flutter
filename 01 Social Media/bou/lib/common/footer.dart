import 'package:auto_route/auto_route.dart';
import 'package:bou/router/app_router.gr.dart';
import 'package:flutter/material.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  context.router.navigate(const MyHomeRoute());
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () => {context.router.push(const Useless1Route())},
                icon: const Icon(
                  Icons.all_inclusive_rounded,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  context.router.push(const MySearchRoute());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
