// ---------------------------------------------------------------------------
// Colour palette — one stable colour per course code, derived from its hash.
// Avoids the "everything is blue" problem without needing backend support.
// ---------------------------------------------------------------------------

import 'dart:ui';

const _courseColours = [
  Color(0xFF1D9E75), // teal
  Color(0xFF378ADD), // blue
  Color(0xFFBA7517), // amber
  Color(0xFF9F77DD), // purple
  Color(0xFFD85A30), // coral
  Color(0xFF3B6D11), // green
];

Color colourForCode(String code) {
  return _courseColours[code.hashCode.abs() % _courseColours.length];
}