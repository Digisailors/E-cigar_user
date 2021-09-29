import 'package:e_cigar_user/Themes/colors.dart';
import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? image;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final InputBorder? border;
  final Widget? suffixIcon;
  final Function? onTap;
  final TextCapitalization? textCapitalization;
  final Color? imageColor;

  const EntryField(
      {Key? key, this.controller,
      this.label,
      this.image,
      this.initialValue,
      this.readOnly,
      this.keyboardType,
      this.maxLength,
      this.hint,
      this.border,
      this.maxLines,
      this.suffixIcon,
      this.onTap,
      this.textCapitalization,
      this.imageColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Column(
        children: [
          TextFormField(
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            cursorColor: kMainColor,
            onTap: onTap as void Function()?,
            autofocus: false,
            controller: controller,
            initialValue: initialValue,
            style: Theme.of(context).textTheme.caption,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            minLines: 1,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              labelText: label,
              hintText: hint,
              hintStyle:
                  theme.textTheme.caption!.copyWith(color: theme.hintColor),
              border: border,
              counter: const Offstage(),
              icon: (image != null)
                  ? ImageIcon(
                      AssetImage(image!),
                      color: imageColor ?? theme.primaryColor,
                      size: 20.0,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
