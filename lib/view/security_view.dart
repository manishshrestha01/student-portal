// security_view.dart — complete fixed file

import 'package:codeit_app/controller/storage_controller.dart';
import 'package:codeit_app/core/constants/colors.dart';
import 'package:codeit_app/utils/biometric_auth.dart';
import 'package:codeit_app/view/home_view.dart';
import 'package:codeit_app/widgets/custom_appbar.dart';
import 'package:codeit_app/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SecurityView extends StatefulWidget {
  const SecurityView({super.key});

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  late bool _isBiometricEnabled;
  final bool isIOS = GetPlatform.isIOS;
  final _storage = Get.find<StorageController>();
  final _biometricAuth = BiometricAuth();

  @override
  void initState() {
    super.initState();
    // FIX: load actual saved value from storage
    _isBiometricEnabled = _storage.getBiometricEnabled();
  }

  Future<void> _onBiometricToggle(bool newValue) async {
    if (newValue) {
      final bool canCheck = await _biometricAuth.canCheckBiometrics();
      if (!canCheck) return;

      final bool authenticated = await _biometricAuth.authenticateUser();
      if (authenticated) {
        await _storage.saveBiometricEnabled(true);
        setState(() => _isBiometricEnabled = true);
      } else {
        setState(() => _isBiometricEnabled = false);
      }
    } else {
      await _storage.saveBiometricEnabled(false);
      setState(() => _isBiometricEnabled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ... rest of build unchanged, just replace onChanged in both switches:
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final bool isSmall = screenWidth < 390;
          final bool isMedium = screenWidth >= 390 && screenWidth < 768;
          final double horizontalPadding = isSmall ? 16 : (isMedium ? 24 : 32);

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(isSmall ? 24 : 32),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildBreadcrumb(isSmall),
                  ),
                  Gap(isSmall ? 24 : 32),
                  Text(
                    'Security',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.textDark,
                        fontSize: isSmall ? 22 : 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Gap(isSmall ? 20 : 32),
                  Center(
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.fromLTRB(
                        isSmall ? 12 : 18,
                        14,
                        isSmall ? 12 : 18,
                        20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFFFFFFF)),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: SvgPicture.asset(
                          'assets/support/biometric.svg',
                          width: 40,
                          height: 40,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFf65506),
                            BlendMode.srcIn,
                          ),
                        ),
                        title: Text(
                          'Enable Biometric Login',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: isSmall ? 16 : 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // FIX: use _onBiometricToggle for both switches
                        trailing: isIOS
                            ? CupertinoSwitch(
                                value: _isBiometricEnabled,
                                activeTrackColor: const Color(0xFFf65506),
                                inactiveTrackColor:
                                    CupertinoColors.inactiveGray,
                                onChanged: _onBiometricToggle,
                              )
                            : Switch(
                                value: _isBiometricEnabled,
                                activeTrackColor: const Color(0xFFf65506),
                                inactiveTrackColor: Colors.white,
                                inactiveThumbColor: Colors.black,
                                activeThumbColor: Colors.white,
                                onChanged: _onBiometricToggle,
                              ),
                      ),
                    ),
                  ),
                  Gap(isSmall ? 28 : 36),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBreadcrumb(bool isSmall) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.offAll(() => HomeView()),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/support/home.svg',
                width: 19.17,
                height: 17.35,
                colorFilter: const ColorFilter.mode(
                  AppColors.textMuted,
                  BlendMode.srcIn,
                ),
              ),
              const Gap(8),
              Text(
                'Home',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: isSmall ? 13 : 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(7),
        Icon(
          Icons.chevron_right,
          color: AppColors.iconMuted,
          size: isSmall ? 18 : 20,
        ),
        const Gap(7),
        Text(
          'Security',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: AppColors.textSecondary,
              fontSize: isSmall ? 13 : 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
