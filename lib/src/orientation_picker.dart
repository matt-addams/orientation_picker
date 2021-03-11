// Copyright 2021 Matt Addams. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// A simple convenience widget for Flutter to conditionally display (or hide) other widgets based on device orientation
/// (or aspect ratio).
library orientation_picker;

import 'package:flutter/widgets.dart';

/// Easily display (or hide) `Widget`s based on device orientation (or aspect
/// ratio).
///
/// If you only need to show or hide a single `Widget` based on orientation,
/// use `OrientationPicker.portraitOnly()` or
/// `OrientationPicker.landscapeOnly()`.
///
/// If you need state/animation etc. support, you'd probably be better off using
/// the `Visibility` widget instead.
class OrientationPicker extends StatelessWidget {
  /// An empty widget that should take up no space.
  static const EMPTY = const SizedBox.shrink();

  /// The `Widget` to display in portrait mode.
  final Widget portrait;

  /// The `Widget` to display in landscape mode.
  final Widget landscape;

  /// Pick a widget based on the orientation.
  const OrientationPicker({required this.portrait, required this.landscape});

  /// Display a widget in portrait mode only.
  const OrientationPicker.portraitOnly(this.portrait) : landscape = EMPTY;

  /// Display a widget in landscape mode only.
  const OrientationPicker.landscapeOnly(this.landscape) : portrait = EMPTY;

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? portrait
        : landscape;
  }
}
