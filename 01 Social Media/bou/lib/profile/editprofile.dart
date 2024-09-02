import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => {AutoRouter.of(context).back()},
                      style: const ButtonStyle(
                          overlayColor:
                              WidgetStatePropertyAll(Color(0xffEEF2F3))),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'vazir',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      )),
                  const Text(
                    'Edit profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'vazir',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      style: const ButtonStyle(
                          overlayColor:
                              WidgetStatePropertyAll(Color(0xffEEF2F3))),
                      onPressed: () => {},
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'vazir',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ))
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('my_files/profile_header.jpg'),
                    fit: BoxFit.cover,
                  )),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 210,
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 78,
                    height: 78,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipOval(
                        child: Image.asset(
                          "my_files/profile.jpg",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 210,
                  padding: const EdgeInsets.only(right: 10),
                  alignment: Alignment.bottomRight,
                  child: OutlinedButton(
                    onPressed: () {
                      AutoRouter.of(context).pop();
                      AutoRouter.of(context).back();
                      // AuthProvider.authProvider.logout(),
                      // AutoRouter.of(context).replace(LoginRoute())
                    },
                    style: const ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(Colors.white),
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        side: WidgetStatePropertyAll(
                            BorderSide(color: Color(0xFFCFD9DE))),
                        foregroundColor: WidgetStatePropertyAll(Colors.black)),
                    child: const Text('Logout'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 70,
                        child: Text(
                          'Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'vazir',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 70,
                        child: Text(
                          'ID',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'vazir',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 70,
                        child: Text(
                          'Location',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'vazir',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.topLeft,
                        child: const TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter your name',
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xFF536471))),
                          autocorrect: false,
                          maxLength: 30,
                          maxLines: 1,
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      //   child: Text('Behnam'),
                      // ),
                      Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.topLeft,
                        child: const TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter an ID',
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xFF536471))),
                          autocorrect: false,
                          maxLength: 30,
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.topLeft,
                        child: const TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter your location',
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xFF536471))),
                          autocorrect: false,
                          maxLength: 30,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

0xFF1B95E0

Expanded(
              // height: 150,
              // width: _width * 0.8,
              child: Container(
                width: _width * 0.8,
                child: GridView.count(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  crossAxisCount: 2,
                  cacheExtent: MediaQuery.of(context).size.height,
                  controller: ScrollController(),
                  children: const [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Text(
                            'Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'vazir',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Text(
                            'ID',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'vazir',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Text(
                            'Location',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'vazir',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(),
                            )),
                        SizedBox(
                          height: 50,
                          child: Text('@behnamou'),
                        ),
                        SizedBox(
                          height: 50,
                          child: Text('Shiraz'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

*/

// Container(
//   alignment: Alignment.centerLeft,
//   padding: const EdgeInsets.only(left: 24),
//   child: const Text(
//     '@behnamou',
//     style: TextStyle(
//       fontFamily: 'vazir',
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: Color(0xFF536471),
//     ),
//   ),
// ),
