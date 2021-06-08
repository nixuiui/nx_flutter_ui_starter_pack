import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'nx_text.dart';

class NxTextFieldBox extends StatelessWidget {
  const NxTextFieldBox({
    Key? key,
    this.icon,
    this.suffixIcon,
    this.isObsecure = false,
    this.textHint,
    this.validatorText = "",
    this.inputType = TextInputType.text,
    this.controller,
    this.validator,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.textColor,
    this.inputFormatters,
    this.fontSize = 16,
    this.inputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.enable = true,
    this.onChanged,
    this.suffixIconClicked,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? textHint, validatorText;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool isObsecure;
  final bool enable;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final double fontSize;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? inputAction;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? suffixIconClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? Colors.grey[300]!),
              color: backgroundColor ?? Colors.grey[100],
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              icon != null
                  ? Icon(icon, color: iconColor ?? Colors.black12)
                  : Text(''),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  textInputAction: inputAction,
                  onFieldSubmitted: onFieldSubmitted,
                  inputFormatters: inputFormatters,
                  cursorColor: textColor ?? Colors.black87,
                  enabled: enable,
                  onChanged: onChanged,
                  style: TextStyle(
                      color: enable ? (textColor ?? Colors.black87) : Colors.grey,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600),
                  obscureText: isObsecure,
                  keyboardType: inputType,
                  validator: validator,
                  decoration: InputDecoration.collapsed(
                      hintText: textHint,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: textColor != null
                              ? textColor?.withOpacity(0.5)
                              : Colors.black38,
                          fontSize: fontSize)),
                ),
              ),
              suffixIcon != null
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: suffixIconClicked,
                      child: Icon(suffixIcon, color: Colors.black54))
                  : Container()
            ],
          ),
        ),
        validatorText != null && validatorText != ""
            ? Container(
                padding: EdgeInsets.only(top: 4, left: 4, right: 4),
                child: NxText.error(validatorText!),
              )
            : Container()
      ],
    );
  }
}

class NxTextFieldBorderBottom extends StatelessWidget {
  const NxTextFieldBorderBottom({
    Key? key,
    this.icon,
    this.suffixIcon,
    this.maxLength = 100,
    this.isObsecure = false,
    this.textHint,
    this.label,
    this.textError = "",
    this.validatorText = "",
    this.inputType = TextInputType.text,
    this.controller,
    this.validator,
    this.inputAction,
    this.fontWeight = FontWeight.w400,
    this.onFieldSubmitted,
    this.enable = true,
    this.readOnly = false,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.inputFormatters,
    this.suffixIconClicked
  }) : super(key: key);

  final TextEditingController? controller;
  final String? textHint, validatorText, label, textError;
  final IconData? icon;
  final IconData? suffixIcon;
  final int maxLength;
  final bool isObsecure;
  final bool enable;
  final bool readOnly;
  final bool autofocus;
  final FontWeight fontWeight;
  final FocusNode? focusNode;
  final TextInputType inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? suffixIconClicked;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formaters = [];
    formaters.add(LengthLimitingTextInputFormatter(maxLength));
    if (inputFormatters != null) {
      formaters.addAll(inputFormatters!);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        label != null ? NxText.formLabel(label ?? '') : Container(),
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Icon(icon, color: Colors.black87, size: 18),
                    )
                  : Container(),
              Expanded(
                child: TextFormField(
                  inputFormatters: formaters,
                  controller: controller,
                  focusNode: focusNode,
                  textInputAction: inputAction,
                  onFieldSubmitted: onFieldSubmitted,
                  onChanged: onChanged,
                  keyboardType: inputType,
                  cursorColor: Colors.black54,
                  enabled: enable,
                  readOnly: readOnly,
                  autofocus: autofocus,
                  style: TextStyle(
                    color: enable ? Colors.black87 : Colors.grey,
                    fontWeight: fontWeight,
                  ),
                  obscureText: isObsecure,
                  validator: validator,
                  decoration: InputDecoration.collapsed(
                    hintText: textHint,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
              ),
              suffixIcon != null
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: suffixIconClicked,
                      child: Icon(suffixIcon, color: Colors.black54))
                  : Container()
            ],
          ),
        ),
        validatorText != null && validatorText != ""
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[100],
                child: NxText.error(validatorText!))
            : Container(),
        Divider(),
        textError != "" && textError != null
            ? NxText.error(textError!)
            : Container()
      ],
    );
  }
}

class TextAreaBorderBottom extends StatelessWidget {
  const TextAreaBorderBottom({
    Key? key,
    this.icon,
    this.suffixIcon,
    this.maxLength = 100,
    this.maxLines = 10,
    this.minLines = 1,
    this.isObsecure = false,
    this.label,
    this.textHint,
    this.textError,
    this.validatorText = "",
    this.inputType = TextInputType.text,
    this.controller,
    this.validator,
    this.inputAction,
    this.fontWeight,
    this.onFieldSubmitted,
    this.enable = true,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.inputFormatters
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label, textHint, validatorText, textError;
  final IconData? icon;
  final IconData? suffixIcon;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final bool isObsecure;
  final bool enable;
  final bool autofocus;
  final FontWeight? fontWeight;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formaters = [];
    formaters.add(LengthLimitingTextInputFormatter(maxLength));
    if (inputFormatters != null) {
      formaters.addAll(inputFormatters!);
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label != null ? NxText.formLabel(label!) : Container(),
          Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  icon != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(icon, color: Colors.black87, size: 18),
                        )
                      : Container(),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                      inputFormatters: formaters,
                      controller: controller,
                      focusNode: focusNode,
                      textInputAction: inputAction,
                      onFieldSubmitted: onFieldSubmitted,
                      onChanged: onChanged,
                      onTap: onTap,
                      enabled: enable,
                      autofocus: autofocus,
                      maxLines: maxLines,
                      minLines: minLines,
                      obscureText: isObsecure,
                      validator: validator,
                      decoration: InputDecoration.collapsed(
                        hintText: textHint,
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.black38, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              )),
          Divider(),
          textError != "" && textError != null
              ? NxText.error(textError!)
              : Container()
        ]);
  }
}

class SelectionBorderBottom extends StatelessWidget {
  const SelectionBorderBottom({
    Key? key,
    this.icon,
    this.text,
    this.isLoading = false,
    this.label,
    this.textError,
    this.isSelected = false,
    this.suffixIcon,
    this.onTap
  }) : super(key: key);

  final String? label;
  final String? textError;
  final Widget? icon;
  final bool isLoading;
  final String? text;
  final bool isSelected;
  final VoidCallback? onTap;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            label != null ? NxText.formLabel(label!) : Container()
          else
            Container(),
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (icon != null)
                  Padding(
                      padding: const EdgeInsets.only(right: 16), child: icon)
                else
                  Container(),
                Expanded(
                    child: Text(
                  isLoading ? 'Loading' : (text ?? ''),
                  style: TextStyle(
                      color: isLoading || !isSelected
                          ? Colors.grey
                          : Colors.black87,
                      fontWeight: FontWeight.w600),
                )),
                Icon(suffixIcon ?? Icons.arrow_drop_down)
              ],
            ),
          ),
          textError != "" && textError != null
              ? NxText.error(textError!)
              : Container()
        ],
      ),
    );
  }
}
