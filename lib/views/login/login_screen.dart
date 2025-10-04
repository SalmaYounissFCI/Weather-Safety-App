import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/app_colors.dart';
import 'package:weatherapp/core/widgets/custom_button.dart';
import 'package:weatherapp/core/widgets/custom_text_field.dart';
import 'package:weatherapp/views/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isDarkMode = theme.brightness == Brightness.dark;
    final gradientStartColor = isDarkMode
        ? AppColorsDark.gradientStart
        : AppColorsLight.gradientStart;
    final gradientEndColor = isDarkMode
        ? AppColorsDark.gradientEnd
        : AppColorsLight.gradientEnd;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientStartColor, gradientEndColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.cloud_outlined,
                      color: colors.primary,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 👋 Welcome Text
                  Text(
                    "Welcome Back",
                    style: textTheme.displayMedium?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sign in to continue",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // 📩 Email Field
                  CustomTextField(
                    lable: "Email",
                    textTheme: textTheme,
                    colors: colors,
                  ),
                  const SizedBox(height: 20),

                  // 🔑 Password Field
                  CustomTextField(
                    lable: "Password",
                    textTheme: textTheme,
                    colors: colors,
                  ),
                  const SizedBox(height: 30),

                  CustomButton(
                    label: "Login",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    overlayColor: colors.onPrimary,
                    backgroundColor: colors.primary,
                    textColor: colors.onPrimary,
                    withShadow: true,
                  ),
                  const SizedBox(height: 25),

                  // 📍 OR Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: colors.onSurface.withOpacity(0.4),
                          thickness: 0.7,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "or",
                          style: textTheme.bodySmall?.copyWith(
                            color: colors.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: colors.onSurface.withOpacity(0.4),
                          thickness: 0.7,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  CustomButton(
                    label: "Sign in with Google",
                    onPressed: () {},
                    backgroundColor: isDarkMode
                        ? AppColorsDark.buttonColor
                        : AppColorsLight.buttonColor,
                    textColor: isDarkMode
                        ? AppColorsDark.primary
                        : AppColorsLight.primaryForeground,
                    borderRadius: 14,
                    height: 50,
                    icon: Image.asset(
                      "assets/images/google.png",
                      height: 24,
                      width: 24,
                    ),
                    withShadow: true,
                    shadowColor: Colors.blueGrey,
                  ),
                  const SizedBox(height: 20),

                  // 👤 Continue as Guest
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Continue as Guest",
                      style: textTheme.bodyLarge?.copyWith(
                        color: colors.onSurface.withOpacity(0.7),
                        decoration: TextDecoration.underline,
                        decorationColor: colors.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
