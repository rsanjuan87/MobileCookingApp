import 'package:flutter/material.dart';

class CookTipCard extends StatelessWidget {
  const CookTipCard({super.key});

  static const _titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const _subtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );

  static const _descriptionStyle = TextStyle(
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
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
          const Text(
            'Cook',
            style: _titleStyle,
          ),
          const Text(
            'like pro',
            style: _subtitleStyle,
          ),
          const SizedBox(height: 18),
          const Text(
            'Thermomix® advanced tips and tricks ⟩',
            style: _descriptionStyle,
          ),
        ],
      ),
    );
  }
}