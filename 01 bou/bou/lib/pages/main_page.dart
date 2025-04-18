import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/app_router.gr.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const MyHomeRoute(), // 0
        const MyProfileRoute(), // 1
        const MySearchRoute(), // 2
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;

            if (tabsRouter.activeIndex == 0) {
              final shouldExit = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.white,
                  title: const Text("Exit Program"),
                  titleTextStyle: const TextStyle(
                    fontFamily: 'sfpro',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  content: const Text("Are you sure you want to exit program?"),
                  contentTextStyle: const TextStyle(
                    fontFamily: 'sfpro',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  actionsAlignment: MainAxisAlignment.spaceAround,
                  actionsPadding: const EdgeInsets.all(10),
                  actions: [
                    TextButton(
                      style: const ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(Color(0xffEEF2F3)),
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text(
                        "No",
                        style:
                            TextStyle(fontFamily: 'sfpro', color: Colors.black),
                      ),
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(Color(0xffEEF2F3)),
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text(
                        "Yes",
                        style:
                            TextStyle(fontFamily: 'sfpro', color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
              if (shouldExit ?? false) {
                return SystemNavigator.pop();
              }
            } else {
              tabsRouter.setActiveIndex(0);
            }
          },
          child: Scaffold(
            body: child,
          ),
        );
      },
    );
  }
}

// if (tabsRouter.activeIndex > 0) {
//   tabsRouter.setActiveIndex(tabsRouter.activeIndex - 1);
// } else {
//   context.router.back(); // اگه روی تب اول هستی، از کل صفحه خارج شو
// }

// final tabsRouter = AutoTabsRouter.of(context);
