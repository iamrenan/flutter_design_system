[pt-BR](README.pt-BR.md)

# What is this

This **Design System** is a collection of ready-to-use components for Flutter, developed to simplify, unify, and standardize the user interface across multiple applications. The components are built from tokens and integrated with Flutter's theme system, ensuring visual consistency, ease of maintenance, and providing fallback to native styles when necessary.

# Purpose

In order to speed up Flutter application development, this Design System offers a collection of reusable widgets, predefined styles, and design guidelines that follows Flutter best practices.

# How to use

1. Follow the prerequisites:
    - Flutter 3.35.0 or higher
        - This is required due to Flutter framework updates that the design system relies on.
    - Dart SDK version 3.9.0 or higher
        - This is already bundled with Flutter 3.35.0

2. Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  renan_design_system: ^0.0.1
```

3. Use the components in your Flutter application. Do note that this design system may use the same name as Flutter native widgets, so it's recommended to import it with an alias of your choice (e.g. `ds`) to avoid naming conflicts:

```dart
import 'package:renan_design_system/renan_design_system.dart' as ds;

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('My App with Design System'),
        ),
        body: Center(
        child: ds.Button(
            onPressed: () {
            // Handle button press
            },
            label: 'Click Me',
        ),
        ),
    );
    }
}
```