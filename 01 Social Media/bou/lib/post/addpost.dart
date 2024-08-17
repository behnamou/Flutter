import 'package:auto_route/auto_route.dart';
import 'package:bou/common/separator_line.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Expanded(
        child: Column(
          children: [
            _AddPostHeader(),
            const SeparatorLineWidget(),
            _AddPostBody(),
          ],
        ),
      )),
    );
  }
}

// --------------------------------------------

class _AddPostBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SingleChildScrollView(
              child: TextField(
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    // labelText: "What\'s happening?",
                    hintText: 'What\'s happening?',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 178, 178, 178))),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.image,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------

class _AddPostHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => {AutoRouter.of(context).back()},
              child: const Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'vazir',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )),
          ElevatedButton(
            style: const ButtonStyle(
                overlayColor: WidgetStatePropertyAll(Colors.black),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                backgroundColor: WidgetStatePropertyAll(Color(0xFF1B95E0))),
            onPressed: () => {AutoRouter.of(context).back()},
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------
