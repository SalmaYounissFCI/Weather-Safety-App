import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/app_colors.dart';
import 'package:weatherapp/core/widgets/expanded_info_card.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final gradientStartColor = isDarkMode
        ? AppColorsDark.gradientStart
        : AppColorsLight.gradientStart;
    final gradientEndColor = isDarkMode
        ? AppColorsDark.gradientEnd
        : AppColorsLight.gradientEnd;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 20),
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weather Alerts",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Stay informed about severe weather conditions",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                // الكروت
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ExpandedInfoCard(
                    icon: Icons.water_drop,
                    title: "Heavy Rain Warning",
                    subtitle: "2 hours from now",
                    details:
                        "Heavy rainfall expected with accumulations of 2-4 inches. Possible flash flooding in low-lying areas. Avoid unnecessary travel.",
                    color: Colors.redAccent,
                    affects: "San Francisco Bay Area",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ExpandedInfoCard(
                    icon: Icons.air,
                    title: "High Wind Advisory",
                    subtitle: "6 hours from now",
                    details:
                        "Strong winds up to 60 mph expected. Secure outdoor objects and use caution while driving.",
                    color: Colors.amberAccent,
                    affects: "Coastal Regions",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ExpandedInfoCard(
                    icon: Icons.ac_unit,
                    title: "Cold Weather Notice",
                    subtitle: "Tomorrow",
                    details:
                        "Temperatures expected to drop below freezing. Dress warmly and take precautions for pets and plants.",
                    color: Colors.green,
                    affects: "North Bay",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ExpandedInfoCard(
                    icon: Icons.info_outline,
                    title: "Stay informed",
                    subtitle: "Weather alerts updated",
                    details:
                        "Stay informed about weather conditions. Alerts are updated in real-time based on your location.",
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
