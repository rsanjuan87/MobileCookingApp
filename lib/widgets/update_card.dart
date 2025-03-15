import 'package:flutter/material.dart';

class UpdateCard extends StatelessWidget {
  const UpdateCard({super.key});

  static const _titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const _subtitleStyle = TextStyle(
    fontSize: 20,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
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
        children: const [
          Text(
            'Check',
            style: _titleStyle,
          ),
          Row(
            children: [
              Text(
                'new updates',
                style: _subtitleStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}