import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String text;
  final String? imageUrl;

  const HerMessageBubble({super.key, required this.text, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
              textScaler: TextScaler.linear(1.1),
            ),
          ),
        ),
        const SizedBox(height: 5),
        if (imageUrl != null) _ImageBubble(imageUrl: imageUrl!),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: size.width * 0.7,
        height: 150,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            color: Colors.grey[200],
            child: const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
