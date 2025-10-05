import 'package:flutter/material.dart';
import 'package:weatherapp/core/models/info_card_model.dart';
import 'package:weatherapp/core/theme/app_colors.dart';
import 'package:weatherapp/core/widgets/info_card.dart';
import 'package:weatherapp/profilePage/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final gradientStartColor = isDarkMode
        ? AppColorsDark.gradientStart
        : AppColorsLight.gradientStart;
    final gradientEndColor = isDarkMode
        ? AppColorsDark.gradientEnd
        : AppColorsLight.gradientEnd;

    return Scaffold(
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
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(
                    255,
                    184,
                    181,
                    181,
                  ).withOpacity(0.05),
                  border: Border.all(color: Colors.blueGrey, width: 1),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textTheme.headlineMedium?.color,
                          ),
                        ),
                        Text(
                          "john.doe@email.com",
                          style: TextStyle(
                            color: textTheme.headlineSmall?.color,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              InfoCard(
                infoCardData: InfoCardModel(
                  icon: Icons.emergency,
                  title: "Emergency SOS",
                  message: "Quick access to emergency features",
                  color: Colors.redAccent,
                  onTap: () {},
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              InfoCard(
                infoCardData: InfoCardModel(
                  icon: Icons.person,
                  title: "Edit Profile",
                  message: "Update your account details",
                  color: Colors.green.shade300,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                ),
              ),
              InfoCard(
                infoCardData: InfoCardModel(
                  icon: Icons.notifications,
                  title: "Notifications",
                  message: "Manage alerts and sounds",
                  color: Colors.blue.shade300,
                  onTap: () {},
                ),
              ),
              InfoCard(
                infoCardData: InfoCardModel(
                  icon: Icons.thermostat,
                  title: "Temperature Units",
                  message: "°C",
                  color: Colors.red.shade400,
                  onTap: () {},
                ),
              ),
              InfoCard(
                infoCardData: InfoCardModel(
                  icon: Icons.language,
                  title: "Language",
                  message: "English",
                  color: Colors.teal.shade400,
                  onTap: () {},
                ),
              ),
              InfoCard(
                infoCardData: InfoCardModel(
                  icon: Icons.settings,
                  title: "General Settings",
                  message: "App preferences",
                  color: Colors.blueGrey,
                  onTap: () {},
                ),
              ),

              const SizedBox(height: 24),

              InfoCard(
                infoCardData: InfoCardModel(
                  icon: Icons.logout,
                  title: "Log Out",
                  message: "",
                  color: Colors.redAccent,
                  onTap: () {},
                  showArrow: false,
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: Text(
                  "Will It Rain On My Parade?\nVersion 1.0.0",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textTheme.bodyMedium?.color,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
