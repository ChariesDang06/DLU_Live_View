import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wander_animation/gen/assets.gen.dart';


import '../models/trip_data.dart';

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TripDetailsBody();
  }
}

class TripDetailsBody extends StatefulWidget {
  const TripDetailsBody({super.key});

  @override
  State<TripDetailsBody> createState() => _TripDetailsBodyState();
}

class _TripDetailsBodyState extends State<TripDetailsBody> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final PageController _pageController;
  double offset = 0;
  late final Animation<double> _sizeXAnimation;
  late final Animation<double> _sizeYAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });
    _pageController = PageController();
    _pageController.addListener(() {
      final screenHeight = MediaQuery.of(context).size.height;
      setState(() {
        offset = _pageController.offset / screenHeight;
      });
    });

    _sizeXAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(_animationController);

    _sizeYAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollNotification>(
      onNotification: (overscroll) {
        if (overscroll.overscroll < 0.5 &&
            overscroll.dragDetails != null &&
            overscroll.metrics.axisDirection == AxisDirection.down) {
          if (!_animationController.isAnimating) {
            _animationController.forward();
          }
        }
        return true;
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scaleX: _sizeXAnimation.value,
            scaleY: _sizeYAnimation.value,
            child: Scaffold(
              appBar: _buildAppBar(context),
              extendBodyBehindAppBar: true,
              body: Stack(
                children: [
                  _buildBackground(),
                  _buildHeader(),
                  PageView(
                    scrollDirection: Axis.vertical,
                    controller: _pageController,
                    
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        style: IconButton.styleFrom(
          backgroundColor: Color.lerp(Colors.white, Colors.black.withOpacity(0.25), 1 - offset) ?? Colors.transparent,
        ),
        icon: Icon(Icons.close, color: Color.lerp(Colors.white, Colors.black, offset)),
      ),
      actions: [
        Opacity(
          opacity: offset,
          child: IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage(Assets.images.ellipse36.path),
            ),
            onPressed: () {},
          ),
        )
      ],
      backgroundColor: Colors.transparent,
    );
  }

Widget _buildHeader() {
  return Align(
    alignment: FractionalOffset(0, 1 - (offset)),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const TitleSubtitle(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200, // Đổi kích thước tùy theo yêu cầu
                  width: double.infinity, // Width of the SizedBox, adjust as needed
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2), // Màu đen với độ mờ 0.2
                        borderRadius: BorderRadius.circular(8), // Tùy chỉnh viền cong nếu cần
                      ),
                      child: SingleChildScrollView( // Sử dụng SingleChildScrollView để cuộn nội dung
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Trường đại học Đà Lạt là một trong 3 trường đại học nổi tiếng tại Đà Lạt. Hiện nay ở Đà Lạt có 3 trường đại học lớn đó chính là trường ĐH Kiến Trúc Tp.HCM (cơ sở Đà Lạt), Trường ĐH Đà Lạt, Trường ĐH Yersin. Để tìm hiểu thêm về địa điểm du lịch Đà Lạt ',
                              textAlign: TextAlign.justify, // Căn đều chữ 2 bên
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Color.lerp(Colors.white, Colors.black, offset),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    ),
  );
}






  Positioned _buildBackground() {
    return Positioned.fill(
      child: Hero(
        tag: 'bg',
        child: Opacity(
          opacity: 1 - ((offset >= 0.0 && offset <= 1.0) ? offset : 0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.images.pexelsTraceHudson2724664.path,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
