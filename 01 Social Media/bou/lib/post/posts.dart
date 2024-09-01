// import 'dart:ffi';

// import 'dart:html';

import 'package:auto_route/auto_route.dart';
import 'package:bou/router/app_router.gr.dart';
import 'package:bou/common/separator_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          _MyPosts(),
          Container(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () =>
                  {AutoRouter.of(context).push(const AddPostRoute())},
              backgroundColor: const Color(0xFF1B95E0),
              shape: const CircleBorder(
                  side: BorderSide(width: 0, color: Color(0xFF1B95E0))),
              child: const Icon(
                CupertinoIcons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// --------------------------------

class _MyPosts extends StatelessWidget {
  final List<Post> posts = [
    Post(
        text: 'This is first Post.',
        image: "my_files/3.JPG",
        authorName: 'Behnam'),
    Post(text: 'این هم پست دوم است.', authorName: 'Esmaeil'),
    Post(
        text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        image: "my_files/1.JPG",
        authorName: 'Ali'),
    Post(
        text:
            "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.",
        image: "my_files/2.JPG",
        authorName: 'Reza'),
    Post(
        text: 'Hi, 5th Post :)', image: "my_files/3.JPG", authorName: 'Behnam'),
    Post(
        text: "تست در حد یک خط", image: "my_files/4.JPG", authorName: 'Farzam'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          cacheExtent: MediaQuery.of(context).size.height * 4,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostWidget(post: posts[index]);
          }),
    );
  }
}

// -------------------------------- Posts

class Post {
  final String? authorProfile;
  final String authorName;
  final String text;
  final String? image;

  Post(
      {required this.authorName,
      required this.text,
      this.image,
      this.authorProfile});
}

// -------------------------------- Accounts

class Account {
  final String? authorProfile;
  final String authorName;

  Account({
    required this.authorName,
    this.authorProfile,
  });
}

// -------------------------------- Accounts

class ShowAccountsInSearch extends StatelessWidget {
  final Account account;

  const ShowAccountsInSearch({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
        // height: 100,
        margin: const EdgeInsets.only(left: 26, right: 26),
        padding: const EdgeInsets.only(
          top: 16,
        ),
        child: Column(
          children: [
            GestureDetector(
                onTap: () => {
                      context.router.push(const OtherAccountsRoute()),
                    },
                child: Container(
                  color: Colors.white,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "${account.authorProfile}",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        account.authorName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'vazir',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            const SeparatorLineWidget(),
          ],
        ));
  }
}

// --------------------------------

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  bool isRTL(String text) {
    final RegExp rtlExp = RegExp(r'[\u0600-\u06FF]');
    return rtlExp.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    bool rtl = isRTL(post.text);
    return Container(
      color: Colors.white,
      // surfaceTintColor: Colors.white,
      margin: const EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 0, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: GestureDetector(
                      onTap: () => {
                        context.router.navigate(const OtherAccountsRoute()),
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
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10, top: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '@${post.authorName}',
                      style: const TextStyle(
                        fontFamily: 'vazir',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: rtl ? Alignment.centerRight : Alignment.centerLeft,
              child: Text(
                post.text,
                style: const TextStyle(
                    fontFamily: 'vazir', fontSize: 14.0, height: 1.7),
                textAlign: TextAlign.justify,
                textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
              ),
            ),
            if (post.image != null)
              const SizedBox(
                height: 10.0,
              ),
            if (post.image != null)
              GestureDetector(
                onTap: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: const EdgeInsets.all(10),
                          child: Container(
                              constraints: BoxConstraints(
                                maxHeight: height * 0.6,
                                // maxWidth: width * 0.8,
                              ),
                              child: InteractiveViewer(
                                  boundaryMargin: const EdgeInsets.all(10),
                                  minScale: 0.1,
                                  maxScale: 4.0,
                                  child: Image.asset(post.image!))),
                        );
                      })
                },
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: height * 0.6,
                    // maxWidth: width * 0.8,
                  ),
                  child: Image.asset(post.image!),
                ),
              ),
            Container(
              padding: const EdgeInsets.only(
                  bottom: 5, left: 10, right: 20, top: 15),
              child: const Row(
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    // Icons.favorite_border,
                    color: Color(0xFF536471),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    CupertinoIcons.bubble_left,
                    // Icons.messenger_outline_sharp,
                    color: Color(0xFF536471),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SeparatorLineWidget(),
          ],
        ),
      ),
    );
  }
}

// --------------------------------  To use a post in writing a comment

class PostWidgetInComment extends StatelessWidget {
  final Post post;

  const PostWidgetInComment({super.key, required this.post});

  bool isRTL(String text) {
    final RegExp rtlExp = RegExp(r'[\u0600-\u06FF]');
    return rtlExp.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    bool rtl = isRTL(post.text);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10, top: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              '@${post.authorName}',
              style: const TextStyle(
                fontFamily: 'vazir',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: rtl ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(
              post.text,
              style: const TextStyle(
                  fontFamily: 'vazir', fontSize: 16.0, height: 1.7),
              textAlign: TextAlign.justify,
              textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
            ),
          ),
          if (post.image != null)
            const SizedBox(
              height: 10.0,
            ),
          if (post.image != null) Image.asset(post.image!),
        ],
      ),
    );
  }
}
