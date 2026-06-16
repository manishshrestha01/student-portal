import 'package:codeit_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart' as intl_phone_field;
import 'package:google_fonts/google_fonts.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? countryCodeController;
  final String labelText;
  final bool isRequired;
  final String initialCountryCode;
  final String? Function(intl_phone_field.PhoneNumber?)? validator;
  final String? requiredMessage;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.countryCodeController,
    this.labelText = "Phone Number",
    this.isRequired = true,
    this.initialCountryCode = 'NP',
    this.validator,
    this.requiredMessage,
  });

  String _resolveInitialCountryCode(String value) {
    final normalizedValue = value.trim();
    if (normalizedValue.isEmpty) {
      return 'NP';
    }

    if (normalizedValue.length == 2 &&
        normalizedValue == normalizedValue.toUpperCase()) {
      return normalizedValue;
    }

    final dialCode = normalizedValue.startsWith('+')
        ? normalizedValue.substring(1)
        : normalizedValue;

    final matchedCountry = countries.firstWhere(
      (country) => country.dialCode == dialCode,
      orElse: () => countries.firstWhere((country) => country.code == 'NP'),
    );

    return matchedCountry.code;
  }

  @override
  Widget build(BuildContext context) {
    final initialCountry = _resolveInitialCountryCode(
      countryCodeController?.text ?? initialCountryCode,
    );
    final labelStyle = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        color: AppColors.textDark,
      ),
    );
    final requiredStyle = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 18,
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
    );
    final hintStyle = GoogleFonts.inter(
      textStyle: const TextStyle(
        color: AppColors.textLight,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(labelText, style: labelStyle),
            if (isRequired) ...[Gap(2), Text("*", style: requiredStyle)],
          ],
        ),
        Gap(10),

        IntlPhoneField(
          controller: controller,
          initialCountryCode: initialCountry,
          showCountryFlag: true,
          showDropdownIcon: true,
          disableLengthCheck: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          invalidNumberMessage: null,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
              color: AppColors.textDark,
            ),
          ),
          dropdownTextStyle: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
              color: AppColors.textDark,
            ),
          ),
          flagsButtonPadding: EdgeInsets.symmetric(horizontal: 8),
          dropdownIconPosition: IconPosition.trailing,
          dropdownIcon: Icon(
            Icons.arrow_drop_down,
            size: 18,
            color: AppColors.textLight,
          ),
          decoration: InputDecoration(
            hintText: 'Enter your WhatsApp number',
            hintStyle: hintStyle,
            counterText: "",
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textLight),
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
            String code = phone.countryCode;
            if (!code.startsWith('+')) {
              code = '+$code';
            }
            countryCodeController?.text = code;
          },
          onCountryChanged: (country) {
            String code = country.dialCode;
            if (!code.startsWith('+')) {
              code = '+$code';
            }
            countryCodeController?.text = code;
          },
          validator:
              validator ??
              (phone) {
                if (controller.text.trim().isEmpty) {
                  return requiredMessage ?? 'WhatsApp Number is required';
                }
                if (phone == null) {
                  return requiredMessage ?? 'WhatsApp Number is required';
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
