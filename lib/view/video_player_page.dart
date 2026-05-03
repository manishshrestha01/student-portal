import 'package:codeit_app/model/course_video_model.dart';
import 'package:codeit_app/view/course_view.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  final Video video;
  final List<Video> allVideos;
  const VideoPlayerPage({
    super.key,
    required this.video,
    this.allVideos = const [],
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _youtubeController;
  bool isAscending = true;
  late Video currentVideo;

  @override
  void initState() {
    super.initState();
    currentVideo = widget.video;
    _initializeYoutubePlayer();
  }

  void _initializeYoutubePlayer() {
    _youtubeController = YoutubePlayerController(
      initialVideoId: widget.video.videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        disableDragSeek: false,
        forceHD: true,
        hideControls: false,
        hideThumbnail: false,
        mute: false,
      ),
    );
  }

  void _playVideo(Video video) {
    print('Playing video: ${video.title} (ID: ${video.videoId})');
    try {
      // Just load the new video ID without disposing
      _youtubeController.cue(video.videoId ?? '');
      setState(() {
        currentVideo = video;
      });
    } catch (e) {
      print('Error loading video: $e');
    }
  }

  void toggleSort() {
    setState(() {
      isAscending = !isAscending;
    });
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _youtubeController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.white,
        progressColors: const ProgressBarColors(
          playedColor: Colors.white,
          handleColor: Colors.white,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          appBar: CustomAppBar(),
          drawer: CustomDrawer(),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final double screenWidth = constraints.maxWidth;
              final bool isSmall = screenWidth < 390;
              final bool isMedium = screenWidth >= 390 && screenWidth < 768;

              // Responsive values
              final double horizontalPadding = isSmall
                  ? 16
                  : (isMedium ? 24 : 32);
              final double verticalGap = isSmall ? 24 : (isMedium ? 28 : 32);
              final double breadcrumbFontSize = isSmall
                  ? 12
                  : (isMedium ? 13 : 15);

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Gap(verticalGap),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _buildBreadcrumb(breadcrumbFontSize),
                      ),
                      Gap(verticalGap),
                      // YouTube Video Player
                      player,
                      Gap(verticalGap),
                      // Video Title and Details
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.1),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentVideo.title ?? 'Video',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            Gap(12),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/support/date.svg',
                                  width: 20,
                                  height: 20,
                                  colorFilter: const ColorFilter.mode(
                                    Color.fromRGBO(0, 0, 0, 0.6),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Gap(10),
                                Text(
                                  "Posted ${currentVideo.posted}",
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(verticalGap),
                      Container(
                        width: 393,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/support/Video.svg',
                                  width: 30.6,
                                  height: 21.6,
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xFFFF6900),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Gap(13),
                                Text(
                                  "More Class Videos",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      height: 1.0,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: toggleSort,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      isAscending ? "asc" : "desc",
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(15),
                            Divider(
                              height: 1,
                              thickness: 0.5,
                              color: Colors.black,
                            ),
                            _buildVideosList(),
                          ],
                        ),
                      ),
                      Gap(verticalGap),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBreadcrumb(double fontSize) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.offAll(() => HomeView()),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/support/home.svg',
                width: 19.17,
                height: 17.35,
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.7),
                  BlendMode.srcIn,
                ),
              ),
              const Gap(8),
              Text(
                'Home',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(7),
        GestureDetector(
          onTap: () => Get.offAll(() => CourseView()),
          child: Row(
            children: [
              const Icon(
                Icons.chevron_right,
                color: Color.fromRGBO(0, 0, 0, 0.9),
                size: 20,
              ),
              const Gap(7),
              Text(
                'My Courses',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: const Color(0xFF000000),
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.chevron_right,
          color: Color.fromRGBO(0, 0, 0, 0.9),
          size: 20,
        ),
        const Gap(7),
        GestureDetector(
          onTap: () => Get.back(),
          child: Text(
            'Class Videos',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: const Color(0xFF000000),
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideosList() {
    var videos = widget.allVideos;

    if (videos.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(child: Text("No videos available.")),
      );
    }

    // Sort videos
    if (!isAscending) {
      videos = videos.reversed.toList();
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _buildVideoItem(videos[index]);
      },
      separatorBuilder: (context, index) =>
          const Divider(height: 1, color: Colors.black, thickness: 0.5),
      itemCount: videos.length,
    );
  }

  Widget _buildVideoItem(Video video) {
    final isSelected = currentVideo.id == video.id;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () => _playVideo(video),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFD3D3D3) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 82,
                height: 72,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  'assets/support/play.svg',
                  width: 24.75,
                  height: 24.75,
                  colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.7),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Gap(25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${video.title}",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Gap(0),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/support/date.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            Color(0xB3000000),
                            BlendMode.srcIn,
                          ),
                        ),
                        Gap(9),
                        Text(
                          "Posted ${video.posted}",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Color.fromRGBO(0, 0, 0, 0.7),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
