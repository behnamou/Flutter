import 'package:auto_route/auto_route.dart';
import 'package:bou/pages/footer.dart';
import 'package:bou/pages/header.dart';
import 'package:bou/main.dart';
import 'package:bou/pages/posts.dart';
import 'package:bou/pages/useless2.dart';
import 'package:bou/services/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../services/auth_provider.dart';

@RoutePage()
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabsRouter = context.tabsRouter;
    return Scaffold(
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            // header
            MyHeader(),
            // SeparatorLineWidget(),
            // posts
            MyPosts(),

            // SeparatorLineWidget(),
            // footer
            MyFooter(),
          ],
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.8,
        backgroundColor: Colors.white,
        elevation: 10,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {
                      tabsRouter.setActiveIndex(1),
                      // AutoRouter.of(context).push(const MyProfileRoute()),
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
                  IconButton(
                    onPressed: () async {
                      final authProvider =
                          Provider.of<AuthProvider>(context, listen: false);
                      // AuthProvider.authProvider.logout(),
                      bool? logoutConfirmed = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.white,
                            title: const Text('Confirm Loging out!'),
                            titleTextStyle: const TextStyle(
                              fontFamily: 'sfpro',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            content: const Text(
                                'Are you sure about logging out of your account?'),
                            contentTextStyle: const TextStyle(
                              fontFamily: 'sfpro',
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            actionsAlignment: MainAxisAlignment.spaceAround,
                            actionsPadding: const EdgeInsets.all(10),
                            actions: <Widget>[
                              TextButton(
                                style: const ButtonStyle(
                                  overlayColor:
                                      WidgetStatePropertyAll(Color(0xffEEF2F3)),
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                      fontFamily: 'sfpro', color: Colors.black),
                                ),
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                  overlayColor:
                                      WidgetStatePropertyAll(Color(0xffEEF2F3)),
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                      fontFamily: 'sfpro', color: Colors.black),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      if (logoutConfirmed == true) {
                        authProvider.logout();
                        // AuthProvider.authProvider.logout();
                      }
                    },
                    // icon: const Icon(Icons.exit_to_app_rounded),
                    icon: const Icon(
                      CupertinoIcons.square_arrow_right,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  tabsRouter.setActiveIndex(1);
                  // AutoRouter.of(context).push(const MyProfileRoute());
                },
                style: ButtonStyle(
                    overlayColor:
                        WidgetStatePropertyAll(Colors.black.withOpacity(0.1))),
                child: const Text(
                  'Your Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'sfpro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // AutoRouter.of(context).push(const EditProfileRoute());
                  context.router.push(EditProfileRoute());
                },
                style: ButtonStyle(
                    overlayColor:
                        WidgetStatePropertyAll(Colors.black.withOpacity(0.1))),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'sfpro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // AutoRouter.of(context).push(const MySearchRoute());
                  tabsRouter.setActiveIndex(2);
                },
                style: ButtonStyle(
                    overlayColor:
                        WidgetStatePropertyAll(Colors.black.withOpacity(0.1))),
                child: const Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'sfpro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // AutoRouter.of(context).push(const MyNotificationsRoute());
                  context.router.push(MyNotificationsRoute());
                },
                style: ButtonStyle(
                    overlayColor:
                        WidgetStatePropertyAll(Colors.black.withOpacity(0.1))),
                child: const Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'sfpro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    overlayColor:
                        WidgetStatePropertyAll(Colors.black.withOpacity(0.1))),
                onPressed: () {
                  // AutoRouter.of(context).push(const ApiTestRoute());
                  context.router.push(ApiTestRoute());
                },
                child: Text(
                  'Restful http request',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'sfpro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    // AutoRouter.of(context).push(Useless1Route());
                    context.router.push(Useless1Route());
                  },
                  child: Text(
                    'Useless 1',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'sfpro',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              TextButton(
                style: ButtonStyle(
                    overlayColor:
                        WidgetStatePropertyAll(Colors.black.withOpacity(0.1))),
                onPressed: () {
                  // AutoRouter.of(context).push(const Useless2Route());
                  context.router.push(Useless2Route());
                },
                child: Text(
                  'Useless 2',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'sfpro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

// localizationsDelegates: const [
//   GlobalMaterialLocalizations.delegate,
//   GlobalCupertinoLocalizations.delegate,
//   GlobalWidgetsLocalizations.delegate,
// ],
// supportedLocales: const [
//   Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
// ],
// locale: const Locale("fa", "IR"),      // this code is for work with persian language

//
