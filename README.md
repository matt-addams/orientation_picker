# orientation_picker

A small convenience widget to display or hide child widgets automatically based on orientation.

## Usage

### `OrientationPicker({@required Widget portrait, @required Widget landscape})`

Supply two widgets, one for portrait layout and the other for landscape layout.  The widget will pick the appropriate one based on the current orientation.

```dart
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      body: OrientationPicker(
        landscape: Text('Now in landscape-mode!'),
        portrait: Text('Now in portrait-mode!'),
      ),
    ),
  );
}
```

### `OrientationPicker.portraitOnly(Widget widget)`

Supply a widget, which will only be displayed when the orientation is portrait.

```dart
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      body: OrientationPicker.portraitOnly(
        Text('Only visible in portrait-mode!'),
      ),
    ),
  );
}
```

### `OrientationPicker.landscapeOnly(Widget widget)`

Supply a widget, which will only be displayed when the orientation is landscape.

```dart
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      body: OrientationPicker.landscapeOnly(
        Text('Only visible in landscape-mode!'),
      ),
    ),
  );
}
```

## Documentation

To generate the documentation with `dartdoc`:

```bash
$ dartdoc
```

## Tests

To run the tests:

```bash
$ flutter test
```