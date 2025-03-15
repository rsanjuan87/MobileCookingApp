import 'package:flutter/material.dart';

class RecipeOfDaySection extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final String recipeName;
  final int duration;
  final int servings;
  final String imagePath;

  const RecipeOfDaySection({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    required this.recipeName,
    required this.duration,
    required this.servings,
    required this.imagePath,
  });

  static const _defaultTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const _defaultSubtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 26),
      width: MediaQuery.of(context).size.width * 0.6,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle ?? _defaultTitleStyle,
          ),
          Text(
            subtitle,
            style: subtitleStyle ?? _defaultSubtitleStyle,
          ),
          const SizedBox(height: 12),
          Text(
            recipeName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.timer_outlined, size: 16),
              const SizedBox(width: 4),
              Text('$duration min'),
              const SizedBox(width: 16),
              const Icon(Icons.person_outline, size: 16),
              const SizedBox(width: 4),
              Text('$servings ppl'),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
