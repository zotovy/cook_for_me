import 'package:flutter/material.dart';
import 'package:food_app/localization.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // Services
  PageController pageController = PageController();
  int currentPage = 0;

  PageViewModel _buildFirstPage() {
    return PageViewModel(
      titleWidget: Text(
        AppLocalizations.of(context).translate('intro_first_title'),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Color(0xFF3A3A3A),
        ),
      ),
      bodyWidget: Center(
        child: Text(
          AppLocalizations.of(context).translate('intro_first_description'),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF636363),
          ),
        ),
      ),
      image: Center(
        child: Image.asset('assets/images/intro_1.png', height: 300),
      ),
    );
  }

  PageViewModel _buildSecondPage() {
    return PageViewModel(
      titleWidget: Text(
        AppLocalizations.of(context).translate('intro_second_title'),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Color(0xFF3A3A3A),
        ),
      ),
      bodyWidget: Center(
        child: Text(
          AppLocalizations.of(context).translate('intro_second_description'),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF636363),
          ),
        ),
      ),
      image: Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Center(
          child: Image.asset('assets/images/intro_2.png', height: 300),
        ),
      ),
    );
  }

  PageViewModel _buildThirdPage() {
    return PageViewModel(
      titleWidget: Text(
        AppLocalizations.of(context).translate('intro_third_title'),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Color(0xFF3A3A3A),
        ),
      ),
      bodyWidget: Center(
        child: Text(
          AppLocalizations.of(context).translate('intro_third_description'),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF636363),
          ),
        ),
      ),
      image: Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Center(
          child: Image.asset('assets/images/intro_3.png', height: 300),
        ),
      ),
    );
  }

  PageViewModel _buildFourthPage() {
    return PageViewModel(
      titleWidget: Text(
        AppLocalizations.of(context).translate('intro_fourth_title'),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Color(0xFF3A3A3A),
        ),
      ),
      bodyWidget: Center(
        child: Text(
          AppLocalizations.of(context).translate('intro_fourth_description'),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF636363),
          ),
        ),
      ),
      image: Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Center(
          child: Image.asset('assets/images/intro_4.png', height: 300),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        done: Text(
          AppLocalizations.of(context).translate('intro_get_started_button'),
        ),
        onDone: () {},
        showSkipButton: true,
        skip: Text(
          AppLocalizations.of(context).translate('intro_skip_button'),
        ),
        pages: <PageViewModel>[
          _buildFirstPage(),
          _buildSecondPage(),
          _buildThirdPage(),
          _buildFourthPage(),
        ],
      ),
    );
  }
}
