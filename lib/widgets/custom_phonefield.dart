import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart' as intl_phone_field;

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? countryCodeController;
  final String labelText;
  final bool isRequired;
  final String initialCountryCode;
  final String? Function(intl_phone_field.PhoneNumber?)? validator;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.countryCodeController,
    this.labelText = "Phone Number",
    this.isRequired = true,
    this.initialCountryCode = 'NP',
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(
              labelText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            if (isRequired) ...[
              Gap(2),
              Text(
                "*",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
        Gap(10),

        IntlPhoneField(
          controller: controller, 
          initialCountryCode: initialCountryCode,
          showCountryFlag: true,
          showDropdownIcon: true,
          disableLengthCheck: true,
          invalidNumberMessage:
              null, 
          style: TextStyle(fontSize: 16),
          flagsButtonPadding: EdgeInsets.symmetric(horizontal: 8),
          dropdownIconPosition: IconPosition.trailing,
          dropdownIcon: Icon(
            Icons.arrow_drop_down,
            size: 18,
            color: Colors.black54,
          ),
          decoration: InputDecoration(
            hintText: 'Enter number',
            hintStyle: TextStyle(
              color: AppColors.textLight,
              fontWeight: FontWeight.w400,
            ),
            counterText: "", 
            isDense: true, 
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
          onChanged: (phone) {
            countryCodeController?.text = '+${phone.countryCode}';
          },
          validator:
              validator ??
              (phone) {
                if (phone == null || phone.number.isEmpty) {
                  return '$labelText is required';
                }
                if (!phone.isValidNumber()) {
                  return 'Please enter a valid $labelText';
                }
                return null;
              },
        ),
      ],
    );
  }
}
