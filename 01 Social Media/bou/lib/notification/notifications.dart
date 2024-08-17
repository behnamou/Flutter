import "package:auto_route/auto_route.dart";
import "package:bou/router/app_router.gr.dart";
import "package:bou/common/footer.dart";
import "package:bou/post/posts.dart";
import "package:bou/common/separator_line.dart";
import "package:flutter/material.dart";

@RoutePage()
class MyNotificationsPage extends StatelessWidget {
  const MyNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _NotificationHeader(),
            const SeparatorLineWidget(),
            _NotificationBody(),
            const SeparatorLineWidget(),
            const MyFooter(),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------ body

class _NotificationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _MyPosts(),
    );
  }
}

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

// ------------------------------------------ Header

class _NotificationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                context.router.push(const MyProfileRoute());
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('my_files/profile.jpg'),
              ),
            ),
            const Text(
              'Notifications',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'vazir',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            IconButton(
              onPressed: () => {context.router.push(const EditProfileRoute())},
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------