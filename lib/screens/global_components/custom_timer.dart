import 'dart:async';
import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:animate_icons/animate_icons.dart';

class CustomTimer extends StatefulWidget {
  CustomTimer({
    super.key,
    required this.startTime,
    required this.start,
  });

  final int startTime;
  int start;
  @override
  State<CustomTimer> createState() => _CustomTimerState();
}
class _CustomTimerState extends State<CustomTimer> {
  late AnimateIconController _animateIconController;
  Timer? _timer;
  //late int _start;
  bool? _isTimerOn;

  @override
  void initState() {
    widget.start = widget.startTime;
    _animateIconController = AnimateIconController();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (widget.start == 0) {
          setState(() {
            widget.start = widget.startTime;
            timer.cancel();
          });
          if (_animateIconController.isStart()) {
            _animateIconController.animateToEnd();
          } else if (_animateIconController.isEnd()) {
            _animateIconController.animateToStart();
          }
        } else {
          setState(() {
            widget.start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          shape: const CircleBorder(),
          elevation: 0,
          splashColor: kPrimaryColor,
          backgroundColor: kSecondaryColor,
          onPressed: () {
            widget.start = widget.startTime;
            setState((){
              _timer?.cancel();
              if (_animateIconController.isEnd()) {
                _animateIconController.animateToStart();
              }
            });
          },
          child: SvgPicture.asset(kResetIcon),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.39,
          height: MediaQuery.of(context).size.width * 0.39,
          child: SleekCircularSlider(
            appearance: CircularSliderAppearance(
              customColors: CustomSliderColors(
                trackColor: kSecondaryColor,
                progressBarColor: kPrimaryColor,
                dotColor: kPrimaryColor,
                shadowColor: kSecondaryColor,
              ),
              startAngle: 270,
              angleRange: 360,
              customWidths: CustomSliderWidths(
                trackWidth: 8,
                progressBarWidth: 8,
                handlerSize: 0,
              ),
            ),
            min: 0,
            max: widget.startTime.toDouble(),
            initialValue: widget.start.toDouble(),
            // onChange: (double value) {
            //   setState(() {
            //     widget.start = value.round();
            //   });
            // },
            innerWidget: (percentage) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (widget.start % 60).toString().padLeft(2, "0"),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        ':00',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        Container(
          height: 56,
          width: 56,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor,
          ),
          child: Center(
            child: AnimateIcons(
              duration: const Duration(milliseconds: 300),
              startIcon: CustomIcons.playIcon,
              startIconColor: kWhiteColor,
              endIconColor: kWhiteColor,
              endIcon: pauseIcon,
              size: 24,
              onStartIconPress: () {
                if (_animateIconController.isStart()) {
                  _animateIconController.animateToEnd();
                } else if (_animateIconController.isEnd()) {
                  _animateIconController.animateToStart();
                }
                _isTimerOn = true;
                startTimer();
                return true;
              },
              onEndIconPress: () {
                if (_animateIconController.isStart()) {
                  _animateIconController.animateToEnd();
                } else if (_animateIconController.isEnd()) {
                  _animateIconController.animateToStart();
                }
                _timer?.cancel();
                setState(() {
                  _isTimerOn = false;
                });
                return true;
              },
              controller: _animateIconController,
            ),
          ),
        ),
      ],
    );
  }
}
