import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front_end/apis/ai_api.dart';
import 'package:front_end/apis/recommend_api.dart';
import 'package:front_end/models/detected_model.dart';
import 'package:front_end/models/recommend_model.dart';
import 'package:front_end/utils/app_color.dart';
import 'package:front_end/utils/app_string.dart';
import 'package:front_end/utils/mock.dart';

class RecommendScreen extends StatefulWidget {
  final Detected detected;
  final File image;
  const RecommendScreen(
      {super.key, required this.detected, required this.image});

  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  // Recommendation data
  RecommendList? recommends;
  Recommend? currentRecommend;
  int currentDetectIndex = 0;
  List<String> aiMessages = [];
  final fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Auto select first detected as recommendation
    widget.detected.predicts.isNotEmpty
        ? fetchInitRecommend(widget.detected.predicts[0].name)
        : null;
  }

  void fetchInitRecommend(String name) async {
    final recommend = await RecommendApis.recommend(name);

    setState(() {
      recommends = recommend;
      currentRecommend =
          recommends!.recommends.isEmpty ? null : recommends!.recommends[0];
    });
  }

  List<double> calculatePosition(
      BuildContext context, DetectedInstance detectedInstance) {
    // Calculate X scale ratio
    double width = MediaQuery.of(context).size.width;
    double scaleRatio = width / widget.detected.originalSize[1];
    double xPos = detectedInstance.pos[1] * scaleRatio;
    double yPos = detectedInstance.pos[0].toDouble() * scaleRatio;
    // Return
    return [xPos, yPos];
  }

  void onDetectTap(int index) {
    fetchInitRecommend(widget.detected.predicts[index].name);
    setState(() {
      currentDetectIndex = index;
      aiMessages = [];
    });
  }

  void onAIAsk(String message) async {
    // Enhance message
    final recyclingTarget = widget.detected.predicts[currentDetectIndex].name;
    String enhancedMessage = '$message. For the recycling of $recyclingTarget';
    // Send message to server
    final answer = await AIMessageApis.ask(enhancedMessage);
    setState(() {
      aiMessages.add(answer.message);
    });
    // Clear text field
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          // Main contain
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.file(widget.image),
                    // Map detected buttons
                    ...widget.detected.predicts.asMap().entries.map((predict) {
                      // Get index
                      int index = predict.key;
                      return Positioned(
                        top:
                            calculatePosition(context, predict.value).last - 10,
                        left: calculatePosition(context, predict.value).first -
                            10,
                        child: GestureDetector(
                          onTap: () => onDetectTap(index),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: currentDetectIndex == index
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    currentRecommend != null
                        ? currentRecommend!.title
                        : widget.detected.predicts.isNotEmpty
                            ? widget.detected.predicts[currentDetectIndex].name
                            : AppStrings.noData,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextBox(
                    text: currentRecommend != null
                        ? currentRecommend!.content
                        : AppStrings.noData),
                const SizedBox(height: 20),
                ImagesBox(
                    paths: currentRecommend != null
                        ? currentRecommend!.paths
                        : []),
                // Safe area
                const SizedBox(height: 20),
                // AI messages
                ...aiMessages
                    .map((e) => Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: TextBox(
                            text: e,
                          ),
                        ))
                    .toList(),
                // Ask AI
                currentRecommend != null
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: fieldText,
                          decoration: InputDecoration(
                            hintText: AppStrings.askAI,
                            contentPadding: const EdgeInsets.all(10.0),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                          ),
                          onSubmitted: (value) => onAIAsk(value),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          // Back button
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ]),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final String? text;
  const TextBox({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        text ?? AppStrings.noData,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class ImagesBox extends StatelessWidget {
  final List<String> paths;
  const ImagesBox({super.key, required this.paths});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: CarouselSlider(
          carouselController: CarouselController(),
          options: CarouselOptions(),
          items: paths
              .map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(e),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
        ));
  }
}
