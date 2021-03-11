// Copyright 2021 Matt Addams. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// A small convenience widget to display or hide child widgets automatically based on orientation.
library orientation_picker;

export 'src/orientation_picker.dart';

//
// import 'package:flutter/widgets.dart';
//
// /// Easily display (or hide) `Widget`s based on device orientation (or aspect
// /// ratio).
// ///
// /// If you only need to show or hide a single `Widget` based on orientation,
// /// use `OrientationPicker.portraitOnly()` or
// /// `OrientationPicker.landscapeOnly()`.
// ///
// /// If you need state/animation etc. support, you'd probably be better off using
// /// the `Visibility` widget instead.
// class OrientationPicker extends StatelessWidget {
//   /// An empty widget that should take up no space.
//   static const EMPTY = const SizedBox.shrink();
//
//   /// The `Widget` to display in portrait mode.
//   final Widget portrait;
//
//   /// The `Widget` to display in landscape mode.
//   final Widget landscape;
//
//   /// Pick a widget based on the orientation.
//   const OrientationPicker({@required this.portrait, @required this.landscape})
//       : assert(portrait != null),
//         assert(landscape != null);
//
//   /// Display a widget in portrait mode only.
//   const OrientationPicker.portraitOnly(this.portrait)
//       : assert(portrait != null),
//         landscape = EMPTY;
//
//   /// Display a widget in landscape mode only.
//   const OrientationPicker.landscapeOnly(this.landscape)
//       : assert(landscape != null),
//         portrait = EMPTY;
//
//   @override
//   Widget build(BuildContext context) {
//     return (MediaQuery.of(context).orientation == Orientation.portrait)
//         ? portrait
//         : landscape;
//   }
// }
