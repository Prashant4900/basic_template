import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final emptyWidget = RSizedBox.fromSize();
const emptyWidgetWide = RSizedBox(width: double.infinity);
const emptySliver = SliverToBoxAdapter();
const spacer = Spacer();

// Margins
final horizontalMargin2 = RSizedBox(width: 2.w);
final horizontalMargin4 = RSizedBox(width: 4.w);
final horizontalMargin8 = RSizedBox(width: 8.w);
final horizontalMargin12 = RSizedBox(width: 12.w);
final horizontalMargin16 = RSizedBox(width: 16.w);
final horizontalMargin20 = RSizedBox(width: 20.w);
final horizontalMargin24 = RSizedBox(width: 24.w);
final horizontalMargin32 = RSizedBox(width: 32.w);
final horizontalMargin48 = RSizedBox(width: 48.w);

final verticalMargin2 = RSizedBox(height: 4.h);
final verticalMargin4 = RSizedBox(height: 4.h);
final verticalMargin8 = RSizedBox(height: 8.h);
final verticalMargin12 = RSizedBox(height: 12.h);
final verticalMargin16 = RSizedBox(height: 16.h);
final verticalMargin20 = RSizedBox(height: 20.h);
final verticalMargin24 = RSizedBox(height: 24.h);
final verticalMargin32 = RSizedBox(height: 32.h);
final verticalMargin48 = RSizedBox(height: 48.h);

// Paddings
const emptyPadding = EdgeInsets.zero;

final horizontalPadding2 = REdgeInsets.symmetric(horizontal: 2.w);
final horizontalPadding4 = REdgeInsets.symmetric(horizontal: 4.w);
final horizontalPadding8 = REdgeInsets.symmetric(horizontal: 8.w);
final horizontalPadding12 = REdgeInsets.symmetric(horizontal: 12.w);
final horizontalPadding16 = REdgeInsets.symmetric(horizontal: 16.w);
final horizontalPadding24 = REdgeInsets.symmetric(horizontal: 24.w);
final horizontalPadding32 = REdgeInsets.symmetric(horizontal: 32.w);
final horizontalPadding48 = REdgeInsets.symmetric(horizontal: 48.w);

final verticalPadding2 = REdgeInsets.symmetric(vertical: 2.h);
final verticalPadding4 = REdgeInsets.symmetric(vertical: 4.h);
final verticalPadding8 = REdgeInsets.symmetric(vertical: 8.h);
final verticalPadding12 = REdgeInsets.symmetric(vertical: 12.h);
final verticalPadding16 = REdgeInsets.symmetric(vertical: 16.h);
final verticalPadding24 = REdgeInsets.symmetric(vertical: 24.h);
final verticalPadding32 = REdgeInsets.symmetric(vertical: 32.h);
final verticalPadding48 = REdgeInsets.symmetric(vertical: 48.h);

final allPadding2 = REdgeInsets.all(2);
final allPadding4 = REdgeInsets.all(4);
final allPadding8 = REdgeInsets.all(8);
final allPadding12 = REdgeInsets.all(12);
final allPadding16 = REdgeInsets.all(16);
final allPadding24 = REdgeInsets.all(24);
final allPadding32 = REdgeInsets.all(32);
final allPadding48 = REdgeInsets.all(48);

final topPadding2 = REdgeInsets.only(top: 2.h);
final topPadding4 = REdgeInsets.only(top: 4.h);
final topPadding8 = REdgeInsets.only(top: 8.h);
final topPadding12 = REdgeInsets.only(top: 12.h);
final topPadding16 = REdgeInsets.only(top: 16.h);
final topPadding24 = REdgeInsets.only(top: 24.h);
final topPadding32 = REdgeInsets.only(top: 32.h);
final topPadding48 = REdgeInsets.only(top: 48.h);

final leftPadding2 = REdgeInsets.only(left: 2.w);
final leftPadding4 = REdgeInsets.only(left: 4.w);
final leftPadding8 = REdgeInsets.only(left: 8.w);
final leftPadding12 = REdgeInsets.only(left: 12.w);
final leftPadding16 = REdgeInsets.only(left: 16.w);
final leftPadding24 = REdgeInsets.only(left: 24.w);
final leftPadding32 = REdgeInsets.only(left: 32.w);
final leftPadding48 = REdgeInsets.only(left: 48.w);

final rightPadding2 = REdgeInsets.only(right: 2.w);
final rightPadding4 = REdgeInsets.only(right: 4.w);
final rightPadding8 = REdgeInsets.only(right: 8.w);
final rightPadding12 = REdgeInsets.only(right: 12.w);
final rightPadding16 = REdgeInsets.only(right: 16.w);
final rightPadding24 = REdgeInsets.only(right: 24.w);
final rightPadding32 = REdgeInsets.only(right: 32.w);
final rightPadding48 = REdgeInsets.only(right: 48.w);

final bottomPadding2 = REdgeInsets.only(bottom: 2.h);
final bottomPadding4 = REdgeInsets.only(bottom: 4.h);
final bottomPadding8 = REdgeInsets.only(bottom: 8.h);
final bottomPadding12 = REdgeInsets.only(bottom: 12.h);
final bottomPadding16 = REdgeInsets.only(bottom: 16.h);
final bottomPadding24 = REdgeInsets.only(bottom: 24.h);
final bottomPadding32 = REdgeInsets.only(bottom: 32.h);
final bottomPadding48 = REdgeInsets.only(bottom: 48.h);

final startPadding2 = REdgeInsetsDirectional.only(start: 2.w);
final startPadding4 = REdgeInsetsDirectional.only(start: 4.w);
final startPadding8 = REdgeInsetsDirectional.only(start: 8.w);
final startPadding12 = REdgeInsetsDirectional.only(start: 12.w);
final startPadding16 = REdgeInsetsDirectional.only(start: 16.w);
final startPadding24 = REdgeInsetsDirectional.only(start: 24.w);
final startPadding32 = REdgeInsetsDirectional.only(start: 32.w);
final startPadding48 = REdgeInsetsDirectional.only(start: 48.w);

final endPadding2 = REdgeInsetsDirectional.only(end: 2.w);
final endPadding4 = REdgeInsetsDirectional.only(end: 4.w);
final endPadding8 = REdgeInsetsDirectional.only(end: 8.w);
final endPadding12 = REdgeInsetsDirectional.only(end: 12.w);
final endPadding16 = REdgeInsetsDirectional.only(end: 16.w);
final endPadding24 = REdgeInsetsDirectional.only(end: 24.w);
final endPadding32 = REdgeInsetsDirectional.only(end: 32.w);
final endPadding48 = REdgeInsetsDirectional.only(end: 48.w);

extension MergeMargins on RSizedBox {
  /// Returns the sum of two [RSizedBox].
  RSizedBox operator +(RSizedBox other) {
    return RSizedBox(
      width: (width ?? 0.0) + (other.width ?? 0.0),
      height: (height ?? 0.0) + (other.height ?? 0.0),
      child: other.child,
    );
  }

  /// Returns the difference between two [RSizedBox].
  RSizedBox operator -(RSizedBox other) {
    return RSizedBox(
      width: (width ?? 0.0) - (other.width ?? 0.0),
      height: (height ?? 0.0) - (other.height ?? 0.0),
      child: other.child,
    );
  }
}
