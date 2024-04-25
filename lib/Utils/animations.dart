import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Animations {
  static final textOnPageLoadAnimation1 = <Effect>[
    FadeEffect(
      curve: Curves.easeInOut,
      delay: 0.0.ms,
      duration: 600.0.ms,
      begin: 0,
      end: 1,
    ),
    ScaleEffect(
      curve: Curves.easeInOut,
      delay: 0.0.ms,
      duration: 600.0.ms,
      begin: const Offset(0.9, 0.9),
      end: const Offset(1, 1),
    ),
  ];

  static final imageOnPageLoadAnimation1 = <Effect>[
    ScaleEffect(
      curve: Curves.easeInOut,
      delay: 0.0.ms,
      duration: 600.0.ms,
      begin: const Offset(0.9, 0.9),
      end: const Offset(1, 1),
    ),
    FadeEffect(
      curve: Curves.easeInOut,
      delay: 0.0.ms,
      duration: 600.0.ms,
      begin: 0,
      end: 1,
    ),
  ];

  static final textOnPageLoadAnimation2 = <Effect>[
    ScaleEffect(
      curve: Curves.easeInOut,
      delay: 0.0.ms,
      duration: 600.0.ms,
      begin: const Offset(0.9, 0.9),
      end: const Offset(1, 1),
    ),
    FadeEffect(
      curve: Curves.easeInOut,
      delay: 0.0.ms,
      duration: 600.0.ms,
      begin: 0,
      end: 1,
    ),
  ];
}
