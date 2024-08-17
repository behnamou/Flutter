import 'package:auto_route/auto_route.dart';
import 'package:bou/router/app_router.gr.dart';
import 'package:bou/common/footer.dart';
import 'package:bou/post/posts.dart';
import 'package:bou/common/separator_line.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // profile
            _MyProfile(),
            //footer
            SeparatorLineWidget(),
            MyFooter(),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------ edit profile page

// ------------------------------------------ other accounts page

// ------------------------------------------

class _MyProfile extends StatelessWidget {
  const _MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          CustomScrollView(
            cacheExtent: MediaQuery.of(context).size.height * 4,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                expandedHeight: 350,
                pinned: true,
                leading: IconButton(
                  onPressed: () => {
                    context.router.back(),
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  style: const ButtonStyle(
                      iconColor: MaterialStatePropertyAll(Color(0xFF536471))),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: const EdgeInsets.only(left: 80, bottom: 14),
                  collapseMode: CollapseMode.parallax,
                  title: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      // Check if the SliverAppBar is collapsed
                      bool isCollapsed = constraints.maxHeight < 60;
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 100),
                        opacity: isCollapsed ? 1.0 : 0.0,
                        child: const Text(
                          'Behnam',
                          style: TextStyle(
                            fontFamily: 'vazir',
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                  ),
                  background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage('my_files/profile_header.jpg'),
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
                                onPressed: () => {
                                  AutoRouter.of(context)
                                      .push(const EditProfileRoute())
                                },
                                style: const ButtonStyle(
                                    overlayColor:
                                        WidgetStatePropertyAll(Colors.white),
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.white),
                                    side: WidgetStatePropertyAll(
                                        BorderSide(color: Color(0xFFCFD9DE))),
                                    foregroundColor:
                                        WidgetStatePropertyAll(Colors.black)),
                                child: const Text('Edit profile'),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 24, top: 5),
                          child: Text(
                            'Behnam',
                            style: TextStyle(
                                fontFamily: 'vazir',
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            '@behnamou',
                            style: TextStyle(
                              fontFamily: 'vazir',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF536471),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 24, top: 20),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 18,
                                color: Color(0xFF536471),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Shiraz',
                                style: TextStyle(
                                  fontFamily: 'vazir',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF536471),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '82',
                                style: TextStyle(
                                    fontFamily: 'vazir',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                    fontFamily: 'vazir',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF536471)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '32',
                                style: TextStyle(
                                    fontFamily: 'vazir',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(
                                    fontFamily: 'vazir',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF536471)),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: SeparatorLineWidget(),
                    ),
                    PostWidget(
                        post: Post(
                            authorName: 'Behnam',
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            authorProfile: "my_files/profile.jpg")),
                    PostWidget(
                        post: Post(
                            authorName: 'Esmaeil',
                            text: "سلام. متن تستی برای صفحه پروفایل",
                            authorProfile: 'my_files/profile.jpg')),
                    PostWidget(
                        post: Post(
                            authorName: 'Hamid',
                            text:
                                "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.",
                            authorProfile: 'my_files/profile.jpg',
                            image: 'my_files/4.JPG'))
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: FloatingActionButton(
              onPressed: () =>
                  {AutoRouter.of(context).push(const AddPostRoute())},
              backgroundColor: const Color(0xFF1B95E0),
              shape: const CircleBorder(side: BorderSide(width: 0)),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ------------------------------------------