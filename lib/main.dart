import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xFF00BCD4),
);
final textTheme = TextTheme(
  // this isn't working for some reason
  // this is where we would modify the text styles
  // headlineSmall: const TextStyle(fontSize: 60),
  // bodyMedium: GoogleFonts.inter(fontSize: 16, height: 1.5),
);
final theme = ThemeData(
  colorScheme: colorScheme,
  textTheme: textTheme,
);

void main() {
  runApp(
    MaterialApp(
      theme: theme,
      home: TaskFlow(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TaskFlow",
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "TaskFlow",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          backgroundColor: colorScheme.primary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 100,
              ),
              Text(
                "No tasks yet",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Tap + to add your first task",
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}