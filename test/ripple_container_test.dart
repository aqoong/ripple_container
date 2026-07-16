/*
 * Copyright (c) 2025. AQoong(cooldnjsdn@gmail.com) All rights reserved.
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ripple_container/ripple_container.dart';

Widget _wrap(Widget child) => MaterialApp(
      home: Scaffold(
        body: Center(child: child),
      ),
    );

/// The [GestureDetector] created by RippleContainer itself (an ancestor of the
/// InkWell), as opposed to the one InkWell builds internally.
GestureDetector _outerGestureDetector(WidgetTester tester) {
  return tester.widget<GestureDetector>(
    find.ancestor(
      of: find.byType(InkWell),
      matching: find.byType(GestureDetector),
    ),
  );
}

void main() {
  group('sizing', () {
    testWidgets('wraps the child when no width/height is given',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          const RippleContainer(child: SizedBox(width: 40, height: 20)),
        ),
      );

      final size = tester.getSize(find.byType(RippleContainer));
      expect(
        size,
        const Size(40, 20),
        reason: 'RippleContainer should hug its child, not fill the parent.',
      );
    });

    testWidgets('uses the explicit width/height when provided',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          const RippleContainer(
            width: 200,
            height: 100,
            child: Text('Hi'),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(RippleContainer)),
        const Size(200, 100),
      );
    });

    testWidgets('centers the child by default when a size is given',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          const RippleContainer(
            width: 200,
            height: 100,
            child: Text('Hi'),
          ),
        ),
      );

      final boxCenter = tester.getCenter(find.byType(RippleContainer));
      final textCenter = tester.getCenter(find.text('Hi'));
      expect((boxCenter - textCenter).distance, lessThan(0.5));
    });

    testWidgets('honours an explicit alignment', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const RippleContainer(
            width: 200,
            height: 100,
            decoration: ContainerDecoration(alignment: Alignment.centerLeft),
            child: Text('Hi'),
          ),
        ),
      );

      final boxLeft = tester.getTopLeft(find.byType(RippleContainer)).dx;
      final textLeft = tester.getTopLeft(find.text('Hi')).dx;
      expect(
        textLeft - boxLeft,
        lessThan(5),
        reason: 'child should be pushed to the left edge.',
      );
    });
  });

  group('ripple', () {
    testWidgets('InkWell is enabled (ripple visible) with no callbacks',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          const RippleContainer(
            width: 100,
            height: 100,
            child: Text('Hi'),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(
        inkWell.onTap,
        isNotNull,
        reason: 'a fallback tap handler keeps the InkWell enabled so the '
            'ripple is painted even without user callbacks.',
      );

      // Tapping must not throw and a splash should be scheduled.
      await tester.tap(find.byType(RippleContainer));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
    });

    testWidgets(
        'no pan/long-press recognizer is attached for tap-only usage '
        '(keeps the ripple responsive)', (tester) async {
      await tester.pumpWidget(
        _wrap(
          RippleContainer(
            width: 100,
            height: 100,
            rippleCallbacks: RippleCallbacks(onTap: () {}),
            child: const Text('Hi'),
          ),
        ),
      );

      final gd = _outerGestureDetector(tester);
      expect(gd.onPanStart, isNull);
      expect(gd.onPanUpdate, isNull);
      expect(gd.onLongPress, isNull);
    });

    testWidgets('pan recognizer is attached when a drag callback is provided',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          RippleContainer(
            width: 100,
            height: 100,
            rippleCallbacks: RippleCallbacks(onDragEnd: (_) {}),
            child: const Text('Hi'),
          ),
        ),
      );

      final gd = _outerGestureDetector(tester);
      expect(gd.onPanStart, isNotNull);
      expect(gd.onPanUpdate, isNotNull);
    });

    testWidgets('user onTap callback still fires', (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        _wrap(
          RippleContainer(
            width: 100,
            height: 100,
            rippleCallbacks: RippleCallbacks(onTap: () => taps++),
            child: const Text('Hi'),
          ),
        ),
      );

      await tester.tap(find.byType(RippleContainer));
      await tester.pump();
      expect(taps, 1);
    });
  });

  group('enabled flag', () {
    testWidgets('disabled container ignores taps and disables the ripple',
        (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        _wrap(
          RippleContainer(
            width: 100,
            height: 100,
            enabled: false,
            rippleCallbacks: RippleCallbacks(onTap: () => taps++),
            child: const Text('Hi'),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(inkWell.onTap, isNull);

      await tester.tap(find.byType(RippleContainer));
      await tester.pump();
      expect(taps, 0);
    });
  });

  group('hover / cursor', () {
    testWidgets('mouseCursor from decoration is forwarded to the InkWell',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          const RippleContainer(
            width: 100,
            height: 100,
            decoration:
                ContainerDecoration(mouseCursor: SystemMouseCursors.forbidden),
            child: Text('Hi'),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(inkWell.mouseCursor, SystemMouseCursors.forbidden);
    });
  });

  group('drag', () {
    testWidgets('onDragEnd fires when the drag ends inside the content',
        (tester) async {
      var dragEnds = 0;
      await tester.pumpWidget(
        _wrap(
          RippleContainer(
            width: 200,
            height: 200,
            rippleCallbacks: RippleCallbacks(onDragEnd: (_) => dragEnds++),
            child: const Text('Hi'),
          ),
        ),
      );

      final center = tester.getCenter(find.byType(RippleContainer));
      // Start near the top-left so the drag stays inside the 200x200 box
      // while still exceeding the pan touch-slop.
      final gesture = await tester.startGesture(center - const Offset(40, 40));
      await tester.pump(const Duration(milliseconds: 20));
      await gesture.moveBy(const Offset(30, 30));
      await tester.pump(const Duration(milliseconds: 20));
      await gesture.moveBy(const Offset(20, 20));
      await tester.pump(const Duration(milliseconds: 20));
      await gesture.up();
      await tester.pumpAndSettle();

      expect(dragEnds, 1);
    });

    testWidgets('onDragEnd does not fire when the drag ends outside',
        (tester) async {
      var dragEnds = 0;
      await tester.pumpWidget(
        _wrap(
          RippleContainer(
            width: 100,
            height: 100,
            rippleCallbacks: RippleCallbacks(onDragEnd: (_) => dragEnds++),
            child: const Text('Hi'),
          ),
        ),
      );

      final center = tester.getCenter(find.byType(RippleContainer));
      final gesture = await tester.startGesture(center);
      await tester.pump(const Duration(milliseconds: 20));
      // Drag well past the 100x100 bounds before releasing.
      await gesture.moveBy(const Offset(400, 0));
      await tester.pump(const Duration(milliseconds: 20));
      await gesture.up();
      await tester.pumpAndSettle();

      expect(dragEnds, 0);
    });
  });

  group('long press cancel (regression for 1.2.1)', () {
    testWidgets('onLongPressCancel fires once when lifting after a long press',
        (tester) async {
      var longPresses = 0;
      var cancels = 0;
      await tester.pumpWidget(
        _wrap(
          RippleContainer(
            width: 100,
            height: 100,
            rippleCallbacks: RippleCallbacks(
              onLongPress: () => longPresses++,
              onLongPressCancel: () => cancels++,
            ),
            child: const Text('Hi'),
          ),
        ),
      );

      final gesture = await tester.startGesture(
        tester.getCenter(find.byType(RippleContainer)),
      );
      await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
      expect(longPresses, 1);

      await gesture.up();
      await tester.pumpAndSettle();

      expect(
        cancels,
        1,
        reason: 'cancel should fire exactly once after a long press ends.',
      );
    });
  });
}
