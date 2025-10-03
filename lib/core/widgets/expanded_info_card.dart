import 'package:flutter/material.dart';
import 'glass_card.dart';

class ExpandedInfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String details;
  final String? affects; // 👈 جديدة
  final Color color;

  const ExpandedInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.details,
    this.affects,
    required this.color,
  });

  @override
  State<ExpandedInfoCard> createState() => _ExpandedInfoCardState();
}

class _ExpandedInfoCardState extends State<ExpandedInfoCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: GlassmorphismCard(
        width: double.infinity,
        borderColor: widget.color.withAlpha(150),
        child: Column(
          children: [
            // Header
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(widget.icon, color: widget.color, size: 28),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            widget.subtitle,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface.withAlpha(204),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
            ),

            // Details
            if (_isExpanded) ...[
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.details,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withAlpha(220),
                      ),
                    ),
                    if (widget.affects != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.warning_amber_rounded,
                            size: 18,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              "Affects: ${widget.affects!}",
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface.withAlpha(220),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
