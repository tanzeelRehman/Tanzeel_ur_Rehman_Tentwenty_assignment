import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function()? ontap;
  final bool? enableField;
  final Function(String value)? onChange;
  final TextEditingController con;
  final Function(String?)? onSaved;
  final Icon? textFieldIcon;
  final bool? autoValidate;
  final String? onSave;
  final String hinttext;
  final TextInputAction? textInputAction;
  final Function()? focusnode;
  final FocusNode? focusNode;
  final int? maxLine;
  final TextAlign textAlign;
  final TextInputType? textInputType;

  const CustomTextfield({
    Key? key,
    required this.hinttext,
    this.textAlign = TextAlign.end,
    this.maxLine,
    this.onSaved,
    this.textInputAction,
    this.textInputType,
    this.onSave,
    this.focusNode,
    this.textFieldIcon,
    this.focusnode,
    required this.validator,
    this.autoValidate,
    required this.con,
    this.ontap,
    this.onChange,
    this.enableField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          textFieldIcon != null
              ? SizedBox(
                  width: 20,
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        textFieldIcon!.icon,
                        color: Colors.black45,
                      )),
                )
              : Container(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                right: 0,
              ),
              child: TextFormField(
                focusNode: focusNode,
                enabled: enableField ?? true,
                maxLines: maxLine ?? 1,
                onTap: ontap,
                onChanged: onChange ?? (val) {},
                controller: con,
                textAlign: textAlign,
                onSaved: onSaved,
                onEditingComplete: focusnode,
                textInputAction: textInputAction,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: textInputType ?? TextInputType.text,
                autovalidateMode: autoValidate == true
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: validator,
                toolbarOptions: const ToolbarOptions(paste: true),
                enableSuggestions: true,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.cancel),
                  suffixIconColor: Colors.grey,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                  hintText: hinttext,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  isDense: true,
                  errorMaxLines: 1,
                  errorStyle: const TextStyle(
                      color: Colors.red, fontSize: 15, height: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
