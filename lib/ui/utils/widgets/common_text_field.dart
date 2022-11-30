import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_task/ui/themes/colors.dart';
import 'package:interview_task/ui/themes/typography.dart';

class CommonField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textFormatters;
  final String? hintText, labelText;
  final FormFieldValidator? validator;

  const CommonField(
      {Key? key,
      required this.controller,
      this.validator,
      this.textInputType,
      this.textFormatters,
      this.labelText,
      this.textInputAction,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1.5,
        color: AppColors.labelColor.withOpacity(0.6),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: Poppins.medium().s16,
          ),
        TextFormField(
          controller: controller,
          inputFormatters: textFormatters,
          style: Poppins.medium().s14,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Poppins.medium(
              AppColors.labelColor.withOpacity(0.5),
            ).s14,
            contentPadding: const EdgeInsets.only(left: 15, right: 15),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            focusedErrorBorder: outlineInputBorder,
            errorBorder: outlineInputBorder.copyWith(
              borderSide: const BorderSide(color: AppColors.redError),
            ),
          ),
        ),
      ],
    );
  }
}
