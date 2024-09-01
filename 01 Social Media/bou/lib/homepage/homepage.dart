import 'package:auto_route/auto_route.dart';
import 'package:bou/common/footer.dart';
import 'package:bou/common/header.dart';
import 'package:bou/main.dart';
import 'package:bou/post/posts.dart';
import 'package:bou/common/separator_line.dart';
import 'package:bou/router/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            // header
            MyHeader(),
            SeparatorLineWidget(),
            // posts
            MyPosts(),

            SeparatorLineWidget(),
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
                    onTap: () =>
                        {AutoRouter.of(context).push(const MyProfileRoute())},
                    child: ClipOval(
                      child: Image.asset(
                        "my_files/profile.jpg",
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => {
                      AuthProvider.authProvider.logout(),
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
                  AutoRouter.of(context).push(const MyProfileRoute());
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
                  AutoRouter.of(context).push(const EditProfileRoute());
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
                  AutoRouter.of(context).push(const MySearchRoute());
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
                  AutoRouter.of(context).push(const MyNotificationsRoute());
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




