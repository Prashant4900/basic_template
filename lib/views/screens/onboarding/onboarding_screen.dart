import 'package:basic_template/common/dimensions.dart';
import 'package:basic_template/gen/assets.gen.dart';
import 'package:basic_template/l10n/l10n.dart';
import 'package:basic_template/routes/routers.dart';
import 'package:basic_template/views/components/indicators.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyOnboardingScreen extends StatefulWidget {
  const MyOnboardingScreen({super.key});

  @override
  State<MyOnboardingScreen> createState() => _MyOnboardingScreenState();
}

class _MyOnboardingScreenState extends State<MyOnboardingScreen> {
  int currentPage = 0;

  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingPageData = <Map<String, String>>[
      {
        'image': Assets.images.onboardingImageOne.path,
        'title': context.lang.welcomeMessage,
        'subtitle': 'Freedom talk any person of your \nmother language.',
      },
      {
        'image': Assets.images.onboardingImageOne.path,
        'title': context.lang.welcomeMessage,
        'subtitle': 'Freedom talk any person of your \nmother language.',
      },
      {
        'image': Assets.images.onboardingImageOne.path,
        'title': context.lang.welcomeMessage,
        'subtitle': 'Freedom talk any person of your \nmother language.',
      }
    ];

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: controller,
          itemCount: onboardingPageData.length,
          onPageChanged: (value) {
            setState(() => currentPage = value);
          },
          itemBuilder: (context, index) => OnboardingPage(
            image: onboardingPageData[index]['image']!,
            title: onboardingPageData[index]['title']!,
            subtitle: onboardingPageData[index]['subtitle']!,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                if (currentPage == 0) {
                  context.pushReplacement(MyRoutes.registration);
                } else {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOut,
                  );
                }
              },
              child: Text(
                currentPage == 0 ? context.lang.skip : context.lang.previous,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPageData.length,
                (index) => DotIndicator(isActive: index == currentPage),
              ),
            ),
            TextButton(
              onPressed: () {
                if (currentPage != onboardingPageData.length - 1) {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn,
                  );
                } else {
                  context.pushReplacement(MyRoutes.registration);
                }
              },
              child: Text(
                currentPage != onboardingPageData.length - 1
                    ? context.lang.next
                    : context.lang.submit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          const Spacer(flex: 2),
          Image.asset(image),
          const Spacer(flex: 3),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          verticalMargin12,
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.64),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
