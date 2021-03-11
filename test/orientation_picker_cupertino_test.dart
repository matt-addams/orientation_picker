import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:orientation_picker/orientation_picker.dart';

const double PORTRAIT_WIDTH = 400.0;
const double PORTRAIT_HEIGHT = 800.0;
const double LANDSCAPE_WIDTH = PORTRAIT_HEIGHT;
const double LANDSCAPE_HEIGHT = PORTRAIT_WIDTH;
const double SQUARE_WIDTH = PORTRAIT_WIDTH;
const double SQUARE_HEIGHT = PORTRAIT_WIDTH;

final TestWidgetsFlutterBinding binding =
    TestWidgetsFlutterBinding.ensureInitialized() as TestWidgetsFlutterBinding;

void main() {
  const portraitPlaceholder = Placeholder(key: Key('P'));
  const landscapePlaceholder = Placeholder(key: Key('L'));

  const PORTRAIT_SIZE = Size(PORTRAIT_WIDTH, PORTRAIT_HEIGHT);
  const LANDSCAPE_SIZE = Size(LANDSCAPE_WIDTH, LANDSCAPE_HEIGHT);
  const SQUARE_SIZE = Size(SQUARE_WIDTH, SQUARE_HEIGHT);

  const appPicker = CupertinoApp(
    home: CupertinoPageScaffold(
      child: OrientationPicker(
        portrait: portraitPlaceholder,
        landscape: landscapePlaceholder,
      ),
    ),
  );

  const appPortraitOnly = CupertinoApp(
    home: CupertinoPageScaffold(
      child: OrientationPicker.portraitOnly(portraitPlaceholder),
    ),
  );

  const appLandscapeOnly = CupertinoApp(
    home: CupertinoPageScaffold(
      child: OrientationPicker.landscapeOnly(landscapePlaceholder),
    ),
  );

  testWidgets('Portrait (H>W)', (
    WidgetTester tester,
  ) async {
    tester.binding.window.physicalSizeTestValue = PORTRAIT_SIZE;
    await tester.pumpWidget(appPicker);
    final portrait = find.byKey(Key('P'));
    final landscape = find.byKey(Key('L'));
    expect(portrait, findsOneWidget);
    expect(landscape, findsNothing);
  });

  testWidgets('Landscape (H<W)', (
    WidgetTester tester,
  ) async {
    tester.binding.window.physicalSizeTestValue = LANDSCAPE_SIZE;
    await tester.pumpWidget(appPicker);
    final portrait = find.byKey(Key('P'));
    final landscape = find.byKey(Key('L'));
    expect(portrait, findsNothing);
    expect(landscape, findsOneWidget);
  });

  testWidgets('Square  (H==W, default to Portrait)', (
    WidgetTester tester,
  ) async {
    tester.binding.window.physicalSizeTestValue = SQUARE_SIZE;
    await tester.pumpWidget(appPicker);
    final portrait = find.byKey(Key('P'));
    final landscape = find.byKey(Key('L'));
    expect(portrait, findsOneWidget);
    expect(landscape, findsNothing);
  });

  testWidgets('Show portrait-only in portrait', (
    WidgetTester tester,
  ) async {
    tester.binding.window.physicalSizeTestValue = PORTRAIT_SIZE;
    await tester.pumpWidget(appPortraitOnly);
    final portrait = find.byKey(Key('P'));
    expect(portrait, findsOneWidget);
  });

  testWidgets('Hide portrait-only in landscape', (
    WidgetTester tester,
  ) async {
    tester.binding.window.physicalSizeTestValue = LANDSCAPE_SIZE;
    await tester.pumpWidget(appPortraitOnly);
    final portrait = find.byKey(Key('P'));
    expect(portrait, findsNothing);
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('Show landscape-only in landscape', (
    WidgetTester tester,
  ) async {
    tester.binding.window.physicalSizeTestValue = LANDSCAPE_SIZE;
    await tester.pumpWidget(appLandscapeOnly);
    final landscape = find.byKey(Key('L'));
    expect(landscape, findsOneWidget);
  });

  testWidgets('Hide landscape-only in portrait', (
    WidgetTester tester,
  ) async {
    tester.binding.window.physicalSizeTestValue = PORTRAIT_SIZE;
    await tester.pumpWidget(appLandscapeOnly);
    final landscape = find.byKey(Key('L'));
    expect(landscape, findsNothing);
    expect(find.byType(SizedBox), findsOneWidget);
  });
}
