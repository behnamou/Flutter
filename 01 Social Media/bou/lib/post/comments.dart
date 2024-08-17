import 'package:auto_route/auto_route.dart';
import 'package:bou/post/posts.dart';
import 'package:bou/common/separator_line.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

@RoutePage()
class MyCommentsPage extends StatelessWidget {
  MyCommentsPage({super.key});

  final Post _post = Post(
      authorName: 'Behnam',
      text: 'Test for comments.',
      image: "my_files/3.JPG");

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: (Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Cancel'),
                      ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFF1C9AEF)),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        child: Text('Post'),
                      ),
                    ],
                  ),
                  const SeparatorLineWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          PostWidgetInComment(post: _post),
                          const SeparatorLineWidget(),
                          // padding: const EdgeInsets.only(
                          // left: 20, right: 20, bottom: 10),

                          TextField(
                            style: const TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.newline,
                            minLines: 1,
                            maxLines: null,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                labelText: "Replying to @${_post.authorName}",
                                hintText: 'Post your reply',
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 178, 178, 178))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}

// -------------------------------- Write a post

class WritePost extends StatelessWidget {
  const WritePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Cancel'),
                ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF1C9AEF)),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    child: Text('Post')),
              ],
            ),
            SeparatorLineWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      // labelText: "What\'s happening?",
                      hintText: 'What\'s happening?',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 178, 178, 178))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



// ----------------------------------------------

// class MyComments extends StatelessWidget {
//   MyComments({super.key});

//   final TextEditingController _controller = TextEditingController();
//   void _clearText() {
//     _controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           PostWidgetInComment(post: Post(text: 'متن برای تست کامنت 🙃')),
//           Container(
//             padding: const EdgeInsets.all(5),
//             child: TextField(
//               controller: _controller,
//               minLines: 1,
//               maxLines: 10,
//               textInputAction: TextInputAction.newline,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Replying :',
//                   hintText: 'Post Your reply',
//                   hintStyle:
//                       TextStyle(color: Color.fromARGB(255, 178, 178, 178))),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             padding: const EdgeInsets.all(5),
//             child: ElevatedButton(
//               onPressed: _clearText,
//               style: const ButtonStyle(
//                 padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
//                 enableFeedback: true,
//                 backgroundColor: MaterialStatePropertyAll(Color(0xFF1C9AEF)),
//                 foregroundColor: MaterialStatePropertyAll(Colors.white),
//               ),
//               child: const Text('Clear'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
