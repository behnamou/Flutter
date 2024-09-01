import 'package:auto_route/auto_route.dart';
import 'package:bou/router/app_router.gr.dart';
import 'package:bou/common/footer.dart';
import 'package:bou/post/posts.dart';
import 'package:bou/common/separator_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MySearchPage extends StatelessWidget {
  const MySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // comment
            _SearchBar(),
            // footer
            SeparatorLineWidget(),
            MyFooter(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar();
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AnimatedCrossFade(
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            crossFadeState: _isSearching
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.navigate(const MyProfileRoute());
                    },
                    child: ClipOval(
                      child: Image.asset(
                        "my_files/profile.jpg",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSearching = true;
                        });
                      },
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xffEEF2F3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              // Icons.search,
                              CupertinoIcons.search,
                              color: Color(0xff536471),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Search ...',
                              style: TextStyle(
                                color: Color(0xff536471),
                                fontFamily: 'vazir',
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () =>
                          context.router.push(const EditProfileRoute()),
                      // icon: const Icon(Icons.settings_outlined,
                      icon: const Icon(CupertinoIcons.settings,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            secondChild: Container(
              height: 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffEEF2F3)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        filled: true,
                        fillColor: const Color(0xffEEF2F3),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gapPadding: 4,
                          borderSide:
                              BorderSide(width: 0, color: Color(0xffEEF2F3)),
                        ),
                        hintText: "Search ...",
                        // prefixIcon: const Icon(Icons.search),
                        prefixIcon: const Icon(CupertinoIcons.search),
                        prefixIconColor: const Color(0xff536471),
                        hintStyle: const TextStyle(
                            fontFamily: 'vazir',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff536471)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    autofocus: true,
                    style: const ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        _isSearching = false;
                      });
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SeparatorLineWidget(),
          const Expanded(
            child: MyAccounts(),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------ Accounts

class MyAccounts extends StatelessWidget {
  const MyAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: _MyAccounts());
  }
}

class _MyAccounts extends StatelessWidget {
  final List<Account> accounts = [
    Account(authorName: 'Behnam', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Farzam', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Yaisn', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Yazdan', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Esmaeil', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Mohammad', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Vahid', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Akbar', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Mobin', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Matin', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Arsham', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Sobhan', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Mostafa', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Mehran', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Hossein', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Soheil', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Ali', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Reza', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Kazem', authorProfile: "my_files/profile.jpg"),
    Account(authorName: 'Behnam', authorProfile: "my_files/profile.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          cacheExtent: MediaQuery.of(context).size.height * 4,
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            return ShowAccountsInSearch(
              account: accounts[index],
            );
          }),
    );
  }
}
