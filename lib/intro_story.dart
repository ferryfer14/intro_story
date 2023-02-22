import 'dart:io';

import 'package:flutter/material.dart';
import 'components/animated_bar_widget.dart';
import 'components/button.dart';
import 'components/walkthrough_body.dart';

class IntroPage extends StatefulWidget {
  const IntroPage(
      {Key? key,
      required this.imagesWidget,
      required this.labelButton,
      required this.listSubtitle,
      required this.listTitle,
      required this.totalStory,
      required this.buttonOntap,
      this.duration,
      this.barColor,
      this.borderBarColor,
      this.backgroundColor,
      this.buttonColor,
      this.titleStyle,
      this.subtitleStyle,
      this.labelButtonStyle})
      : super(key: key);
  final Color? barColor;
  final Color? borderBarColor;
  final Color? backgroundColor;
  final Color? buttonColor;
  final int totalStory;
  final int? duration;
  final TextStyle? labelButtonStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final List<Widget> imagesWidget;
  final String labelButton;
  final List<String> listTitle;
  final Function() buttonOntap;
  final List<String> listSubtitle;
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    _loadPage(animatedToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();

        setState(() {
          if (_currentIndex + 1 < widget.imagesWidget.length) {
            _currentIndex += 1;
            _loadPage();
          } else {
            _currentIndex = widget.imagesWidget.length;
            _loadPage();
            _animController.stop();
            _animController.reset();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: widget.backgroundColor ?? Colors.white,
          body: Stack(
            children: [
              GestureDetector(
                onTapDown: (details) =>
                    _onTapDown(details, widget.imagesWidget),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 150, top: 90),
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.totalStory,
                    itemBuilder: (context, index) {
                      return WalkthroughBody(
                        image: widget.imagesWidget[index],
                        label: widget.listTitle[index],
                        subtitle: widget.listSubtitle[index],
                        titleStyle: widget.titleStyle ??
                            const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                        subtitleStyle: widget.subtitleStyle ??
                            const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 57,
                left: 24,
                right: 24,
                child: Row(
                  children: List.generate(
                    widget.totalStory,
                    (index) => AnimatedBar(
                      animController: _animController,
                      position: index,
                      currentIndex: _currentIndex,
                      barColor: widget.barColor ?? Colors.grey,
                      borderBarColor: widget.borderBarColor ?? Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PrimaryButton(
                          onTap: widget.buttonOntap,
                          title: widget.labelButton,
                          color: widget.buttonColor ?? Colors.blueAccent,
                          titleStyle: widget.titleStyle ??
                              const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                    ),
                  )),
            ],
          ),
        ));
  }

  void _onTapDown(TapDownDetails details, List<Widget> pages) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadPage();
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < pages.length) {
          _currentIndex += 1;
          _loadPage();
        } else {
          _currentIndex = pages.length;
          _loadPage();
          _animController.stop();
          _animController.reset();
        }
      });
    }
  }

  void _loadPage({bool animatedToPage = true}) {
    _animController.stop();
    _animController.reset();

    _animController.duration = Duration(seconds: widget.duration ?? 7);
    _animController.forward();

    if (animatedToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
