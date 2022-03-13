import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spacers on num {
  Widget _verticalSpacer(int px) {
    return SizedBox(
      height: px.h,
    );
  }

  Widget _horizontalSpacer(int px) {
    return SizedBox(
      width: px.w,
    );
  }

  double _size(int px) {
    return (1.w.round() + 1.h.round()) * px.toDouble();
  }

  double get size => _size(this.toInt());

  Widget get verticalSpace => _verticalSpacer(this.toInt());
  Widget get horizontalSpace => _horizontalSpacer(this.toInt());
}