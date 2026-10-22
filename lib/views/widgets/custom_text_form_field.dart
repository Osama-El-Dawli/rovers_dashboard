import 'package:flutter/material.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.isPassword = false,
    this.showPasswordIcon = false,
    this.suffixIcon,
    this.prefixIcon,
  });

  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool isPassword;
  final bool showPasswordIcon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  void didUpdateWidget(covariant CustomTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPassword != widget.isPassword) {
      _obscureText = widget.isPassword;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _obscureText : false,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      style: const TextStyle(fontSize: 16, color: AppColors.foreground),
      cursorColor: AppColors.foreground,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.showPasswordIcon
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.mutedForeground,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColors.mutedForeground,
          fontSize: 14,
        ),
        fillColor: AppColors.muted,
        filled: true,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: AppColors.primary, width: 2),
      ),
    );
  }

  OutlineInputBorder _buildBorder({Color? color, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color ?? AppColors.accent.withValues(alpha: 0.3),
        width: width ?? 1,
      ),
    );
  }
}
