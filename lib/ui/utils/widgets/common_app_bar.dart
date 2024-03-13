import 'package:flutter/material.dart';
import 'package:mvc_flutter/ui/themes/typography.dart';

mixin AppBarMixin on Widget {
  PreferredSizeWidget appBar(BuildContext context,
      {String? title, VoidCallback? onBack, List<Widget>? actions}) {
    return AppBar(
      leading: onBack == null && !Navigator.canPop(context)
          ? null
          : const Icon(Icons.arrow_back),
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: title != null
          ? Text(
              title,
              style: Poppins.semiBold().s16,
            )
          : null,
      actions: actions,
    );
  }
}
