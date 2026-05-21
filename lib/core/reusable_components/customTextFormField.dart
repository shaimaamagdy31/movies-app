import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String prefixIconData;
  final VoidCallback? onClickPrefix;
  final VoidCallback? onClickSuffix;

  final int maxLines;
  final bool isPassword;
  final bool isSearch;


  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.controller,
    this.validator,
    this.onClickPrefix,
    this.onClickSuffix,
    required this.prefixIconData,
    this.isPassword = false,
    this.isSearch=false,
    this.maxLines=1
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      maxLines: widget.maxLines,
      cursorColor: Theme.of(context).colorScheme.primary,
      cursorRadius: Radius.circular(16),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isShowPassword,
      // obscuringCharacter: '*',
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: Theme.of(context).textTheme.labelSmall,
      decoration: InputDecoration(
        contentPadding: REdgeInsets.symmetric(
          vertical: 11,
          horizontal: 19,
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSecondaryContainer,
        prefixIcon:Padding(
          padding: REdgeInsets.only(top: 12, bottom: 12, left: 16),
          child: InkWell(
            onTap:widget.onClickPrefix,
            child: SvgPicture.asset(
              widget.prefixIconData,
              width: 30.w,
              height: 25.h,

            ),
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              isShowPassword = !isShowPassword;
            });
          },
          icon: Icon(
            isShowPassword ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).colorScheme.outline,
          ),
        )
            : widget.isSearch
            ?IconButton(
              onPressed:widget.onClickSuffix,
              icon: Icon(
                 Icons.clear,
                size: 30.sp,
                color: ColorsManager.white,
              ),
             ):null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.w,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
      ),
    );
  }
}
