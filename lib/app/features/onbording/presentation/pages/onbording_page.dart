import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rukn_store/app/features/onbording/presentation/widgets/onbording_widget.dart';
import 'package:rukn_store/app/features/onbording/presentation/widgets/welcome_button.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingPage extends StatefulWidget {
  OnbordingPage({super.key});
  final pageController = PageController(viewportFraction: 0.8);
  final List<String> titles = [
    'Discover something new',
    'Update trendy outfit',
    'Explorer your truth style'
  ];
  final List<String> subTitle = [
    'Special new arrivals just for you',
    'Favorite brands and hostest trends',
    'Relax and letus bring the style to you'
  ];
  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  int currenrIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //background
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/intro_bg.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            //title
            _buildTitle(
                widget.titles[currenrIndex], widget.subTitle[currenrIndex]),
            const SizedBox(
              height: 20,
            ),
            // page view
            _buildPageViewSection(),
            const SizedBox(
              height: 60,
            ),

            _buildIndicator(),
            const SizedBox(
              height: 40,
            ),
            WelcomeButton(
              onTap: () {
                context.go('/Login');
              },
              text: 'Shopping now',
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildPageViewSection() {
    return SizedBox(
      height: 368,
      child: PageView(
          onPageChanged: (value) => setState(() {
                currenrIndex = value;
              }),
          controller: widget.pageController,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          //   scrollBehavior: ,
          allowImplicitScrolling: true,
          children: const [
            OnbordingWidget(path: "assets/images/onbording_image (0).png"),
            OnbordingWidget(path: "assets/images/onbording_image (1).png"),
            OnbordingWidget(path: "assets/images/onbording_image (2).png"),
          ]),
    );
  }

  SmoothPageIndicator _buildIndicator() {
    return SmoothPageIndicator(
      controller: widget.pageController,

      count: 3,
      effect: const SlideEffect(
          spacing: 8.0,
          dotWidth: 5.0,
          dotHeight: 5.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: Colors.white,
          activeDotColor: Colors.white), // your preferred effect
    );
  }

  Column _buildTitle(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(subtitle),
      ],
    );
  }
}
