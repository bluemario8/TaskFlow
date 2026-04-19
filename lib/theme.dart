/* THEME FOR PROJECT
*
* For setting a color, you can use something like:
* color: Theme.of(context).colorScheme.onPrimary,
* this link contains possible values for the colorScheme
* https://cdn.hashnode.com/res/hashnode/image/upload/v1764133256254/35adcbf9-f5e8-4471-8c1d-04e5cdb49981.png
*
*
* there are 15 different text styles
* | Display   | Large, Medium, Small   |
* | Headline  | Large, Medium, Small   |
* | Title     | Large, Medium, Small   |
* | Label     | Large, Medium, Small   |
* | Body      | Large, Medium, Small   |
* This is what they look like:
* https://miro.medium.com/v2/resize:fit:640/format:webp/1*5nNzgnxDVHm4ctVNQY4VqA.png
* In the textTheme below, there are overrides for these
*
* For setting a text style, you an use something like:
* Text("Take dog out for walk",
*      style: Theme.of(context).textTheme.bodyMedium,
* ),
* */

import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xFF00BCD4),
);

final textTheme = TextTheme(
  // example
  bodySmall: const TextStyle(
    fontSize: 16,
  ),
  bodyMedium: const TextStyle(
    fontSize: 20,
  ),
  bodyLarge: const TextStyle(
    fontSize: 24,
  ),
);
final theme = ThemeData(
  colorScheme: colorScheme,
  textTheme: textTheme,
);

