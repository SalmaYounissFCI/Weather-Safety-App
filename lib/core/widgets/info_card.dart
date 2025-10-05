import 'package:flutter/material.dart';
import '../models/info_card_model.dart';
import 'glass_card.dart';

class InfoCard extends StatelessWidget {
  final InfoCardModel infoCardData;

  const InfoCard({super.key, required this.infoCardData});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30),
            blurRadius: 20.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: infoCardData.onTap,
        child: GlassmorphismCard(
          width: double.infinity,
          borderColor: infoCardData.color.withAlpha(150),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(infoCardData.icon, color: infoCardData.color, size: 28),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        infoCardData.title,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        infoCardData.message,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withAlpha(204),
                        ),
                      ),
                    ],
                  ),
                ),
                if (infoCardData.showArrow)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: colorScheme.onSurface.withAlpha(180),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
