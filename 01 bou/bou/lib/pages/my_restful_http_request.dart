import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String _myIP = '172.20.10.2:3000';

@RoutePage()
class ApiTestPage extends StatelessWidget {
  const ApiTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyRestfulApi(),
    );
  }
}

class MyRestfulApi extends StatefulWidget {
  const MyRestfulApi({super.key});

  @override
  State<StatefulWidget> createState() => _MyRestfulApiState();
}

class _MyRestfulApiState extends State<MyRestfulApi> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  String? _infoToShow;

  // FETCH
  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('http://${_myIP}/users'));

    if (response.statusCode == 200) {
      List users = jsonDecode(response.body);
      // print(users);
      setState(() {
        _infoToShow = users.toString();
      });
    } else {
      // print('Failed to load users: ${response.statusCode}');
      setState(() {
        _infoToShow = 'Failed to load users: ${response.statusCode}';
      });
    }
  }

// POST
  Future<void> createUser() async {
    if (_nameController.text.isEmpty) {
      setState(() {
        _infoToShow = 'Please fill Name!';
      });
      return;
    }

    final response = await http.post(
      Uri.parse('http://${_myIP}/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _nameController.text,
      }),
    );

    if (response.statusCode == 201) {
      // print('User created: ${response.body}');
      setState(() {
        _infoToShow = 'User created: ${response.body}';
      });
    } else {
      // print('Failed to create user: ${response.statusCode}');
      setState(() {
        _infoToShow = 'Failed to create user: ${response.statusCode}';
      });
    }
  }

// PUT
  Future<void> updateUser() async {
    if (_idController.text.isEmpty || _nameController.text.isEmpty) {
      setState(() {
        _infoToShow = 'Please fill id and name!';
      });
      return;
    }

    int id = int.parse(_idController.text);

    final response = await http.put(
      Uri.parse('http://${_myIP}/users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _nameController.text,
      }),
    );

    if (response.statusCode == 200) {
      // print('User updated: ${response.body}');
      setState(() {
        _infoToShow = 'User updated: ${response.body}';
      });
    } else {
      // print('Failed to update user: ${response.statusCode}');
      setState(() {
        _infoToShow = 'Failed to update user: ${response.statusCode}';
      });
    }
  }

// DELETE
  Future<void> deleteUser() async {
    if (_idController.text.isEmpty) {
      setState(() {
        _infoToShow = 'Please fill id!';
      });
      return;
    }

    int id = int.parse(_idController.text);

    final response = await http.delete(
      Uri.parse('http://${_myIP}/users/$id'),
    );

    if (response.statusCode == 200) {
      // print('User deleted');
      setState(() {
        _infoToShow = 'User deleted';
      });
    } else {
      // print('Failed to delete user: ${response.statusCode}');
      setState(() {
        _infoToShow = 'Failed to delete user: ${response.statusCode}';
      });
    }
  }

// PATCH
  Future<void> patchUser() async {
    if (_idController.text.isEmpty || _nameController.text.isEmpty) {
      setState(() {
        _infoToShow = 'Please fill id and name!';
      });
      return;
    }

    int id = int.parse(_idController.text);

    final response = await http.patch(
      Uri.parse('http://${_myIP}/users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _nameController.text,
      }),
    );

    if (response.statusCode == 200) {
      // print('User patched: ${response.body}');
      setState(() {
        _infoToShow = 'User patched: ${response.body}';
      });
    } else {
      // print('Failed to patch user: ${response.statusCode}');
      setState(() {
        _infoToShow = 'Failed to patch user: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var myButtonStyle = const ButtonStyle(
      elevation: WidgetStatePropertyAll(10),
      shadowColor: WidgetStatePropertyAll(Colors.black),
      overlayColor: WidgetStatePropertyAll(Color(0xffEEF2F3)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          side: BorderSide(color: Color(0xff536471)),
          borderRadius: BorderRadius.all(Radius.circular(10)))),
      foregroundColor: WidgetStatePropertyAll(Color(0xff536471)),
      backgroundColor: WidgetStatePropertyAll(
        Colors.white,
      ),
    );

    var myTextStyle = const TextStyle(
        fontFamily: 'sfpro',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xff536471));

    return SafeArea(
      child: Stack(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autocorrect: false,
                  cursorColor: const Color(0xff536471),
                  controller: _idController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffEEF2F3),
                    hintText: 'ID',
                    hintStyle: const TextStyle(
                        color: Color(0xff536471),
                        fontFamily: 'vazir',
                        fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffEEF2F3)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gapPadding: 4,
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffEEF2F3)),
                    ),
                    counterText: '',
                    label: const Text(
                      'ID',
                      style: TextStyle(color: Color(0xff536471)),
                    ),
                    labelStyle: const TextStyle(
                        color: Color(0xff536471),
                        fontFamily: 'vazir',
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //
                TextFormField(
                  autocorrect: false,
                  cursorColor: const Color(0xff536471),
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffEEF2F3),
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                        color: Color(0xff536471),
                        fontFamily: 'vazir',
                        fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffEEF2F3)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gapPadding: 4,
                      borderSide:
                          BorderSide(width: 0, color: Color(0xffEEF2F3)),
                    ),
                    counterText: '',
                    label: const Text(
                      'Name',
                      style: TextStyle(color: Color(0xff536471)),
                    ),
                    labelStyle: const TextStyle(
                        color: Color(0xff536471),
                        fontFamily: 'vazir',
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //
                if (_infoToShow != null)
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        _infoToShow!,
                        style: myTextStyle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [
                  ElevatedButton(
                    onPressed: fetchUsers,
                    style: myButtonStyle,
                    child: Text(
                      'Fetch Users(FETCH)',
                      style: myTextStyle,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: createUser,
                    style: myButtonStyle,
                    child: Text(
                      'Create User(POST)',
                      style: myTextStyle,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: updateUser,
                    style: myButtonStyle,
                    child: Text(
                      'Update User(PUT)',
                      style: myTextStyle,
                    ),
                  ),
                  // ],
                  // ),
                  // Row(
                  // children: [
                  ElevatedButton(
                    onPressed: deleteUser,
                    style: myButtonStyle,
                    child: Text(
                      'Delete User(DELETE)',
                      style: myTextStyle,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: patchUser,
                    style: myButtonStyle,
                    child: Text(
                      'Patch User(PATCH)',
                      style: myTextStyle,
                    ),
                  ),
                  // ],
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
