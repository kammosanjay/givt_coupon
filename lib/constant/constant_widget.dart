import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:givt_mobile_app/constant/appColor.dart';

class CustomWidgets {
  ///TextFeild Widget

  static Widget customTextFeild({
    required BuildContext context, // Pass BuildContext as a parameter
    String? name,
    String? hint,
    double? elevation,
    TextEditingController? controller,
    FocusNode? focusNode,
    Widget? icon,
    double? width,
    AutovalidateMode? autovalidateMode,
    int? maxLines,
    int? maxLength,
    Color? headingcolor,
    Color? hintColor,
    Color? fillcolor,
    double? height,
    TextInputType? keyboardtype,
    Function? onTap,
    Function? onChanges,
    double? borderRad,
    var validate,
    bool isObstructed = false,
    Color? iconColor,
    Widget? suffIcons,
    TextInputAction? action,
    bool isReadyOnly = false,
    String label = "",
    var fontSize,
    FontWeight? fontwgt,
    double? hintfontSize,
    String? fontfamily,

    FontWeight? hintfontWeight,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isEmpty
            ? const SizedBox.shrink() // returns nothing
            : Text(
                label,
                style: TextStyle(
                  color: headingcolor ?? Colors.white,
                  fontSize: fontSize ?? 16,
                  fontWeight: fontwgt ?? FontWeight.w600,
                ),
              ),
        SizedBox(height: label.isEmpty ? 0 : 10),
        TextFormField(
          buildCounter:
              (
                context, {
                required currentLength,
                required isFocused,
                required maxLength,
              }) {
                return null;
              },

          focusNode: focusNode,
          readOnly: isReadyOnly,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardtype,
          validator: validate,
         
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          controller: controller ?? TextEditingController(),
          textAlignVertical: TextAlignVertical.center,
          textInputAction: action,

          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          onChanged: (value) {
            if (onChanges != null) {
              onChanges(value); // Call the function with the text value
            }
          },
          obscureText: isObstructed,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: height ?? 19,

              horizontal: width ?? 12,
            ),
            suffixIcon: suffIcons,
            fillColor: isReadyOnly
                ? Colors.grey.shade400
                : fillcolor ?? Colors.white,
            filled: true,

            prefixIcon: icon,
            prefixIconColor: iconColor,

            hintText: hint,
            hintStyle: TextStyle(
              color: hintColor ?? Colors.white,
              fontSize: hintfontSize ?? 16,
              fontWeight: hintfontWeight ?? FontWeight.w600,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.red.shade100, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(borderRad ?? 10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.red.shade300, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(borderRad ?? 10)),
            ),
            // errorBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red, width: 1),
            //   borderRadius: BorderRadius.all(Radius.circular(borderRad ?? 10)),
            // ),
          ),
          errorBuilder: (context, errorText) => Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
      ],
    );
  }

  // custom dropdown widget
  static Widget customDropdownField<T>({
    required BuildContext context,
    required List<T> items,
    required T? selectedItem,
    required ValueChanged<T?> onChanged,

    String? hint,
    Color? color,
    Widget? icon,
    Color? iconColor,
    Widget? suffixIcon,
    double? width,
    FocusNode? focusNode,
    AutovalidateMode? autovalidateMode,
    bool readOnly = false,
    var validate,
    String label = "",
    double fontSize = 14,
    var fontwgt,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Card(
          color: readOnly ? Colors.grey.shade400 : Colors.white,
          margin: EdgeInsets.zero,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          elevation: 0,

          child: DropdownButtonFormField<T>(
            dropdownColor: Colors.white,
            style: TextStyle(color: Colors.black),
            value: selectedItem,
            isExpanded: true,
            focusNode: focusNode,
            hint: Text(
              hint!,
              style: TextStyle(color: Colors.grey, fontSize: fontSize),
            ),
            selectedItemBuilder: (BuildContext context) {
              return items.map<Widget>((T item) {
                return Text("$item", style: TextStyle(color: Colors.black));
              }).toList();
            },
            validator: validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            icon: suffixIcon,

            decoration: InputDecoration(
              prefixIcon: icon,
              prefixIconColor: iconColor,
              isDense: true,
              constraints: BoxConstraints(
                maxHeight: 50,

                maxWidth: width ?? MediaQuery.of(context).size.width,
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            items: items.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: readOnly ? null : onChanged,
          ),
        ),
      ],
    );
  }

  ///Button Widget

  static Widget customButton({
    required BuildContext context, // Pass BuildContext as a parameter
    dynamic buttonName,
    Function? onPressed,
    double? width,
    double? height,
    Color? btnColor,
    Color? fontColor,
    double? radius,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50,
        ), // Width: 200, Height: 50
        backgroundColor:
            btnColor ?? Colors.blue, // Default color if btnColor is null
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 10,
          ), // Set border radius
        ), // Button color
      ),
      child: FittedBox(
        child: Text(
          buttonName ?? 'Button',
          style: GoogleFonts.poppins(
            fontSize: fontSize ?? 12,
            fontWeight: fontWeight ?? FontWeight.w600,
            color: fontColor, // Text color
          ),
        ),
      ),
    );
  }

  ///
  ///
}
