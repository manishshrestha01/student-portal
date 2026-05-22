import 'package:local_auth/local_auth.dart';

class BiometricAuth {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  Future<bool> authenticateUser() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Authenticate to login',
      );
      return authenticated;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
