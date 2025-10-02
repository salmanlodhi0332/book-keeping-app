import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpfieldWidget extends StatelessWidget {
  const OtpfieldWidget({
    Key? key,
    required this.otpController,
    this.validation,
  }) : super(key: key);

  final TextEditingController otpController;
  final Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: otpController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      animationType: AnimationType.fade,
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontFamily: "Manrope",
        fontSize: 24,
      ),
      pastedTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontFamily: "Manrope",
        fontSize: 24,
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        fieldHeight: 69,
        fieldWidth: 69,
        borderWidth: 1.5,
        inactiveColor: Colors.blue.shade200,
        inactiveFillColor: const Color(0xFFF5F8FF),
        selectedColor: Colors.blue.shade400,
        selectedFillColor: const Color(0xFFDCEBFF),
        activeColor: Colors.blue.shade300,
        activeFillColor: const Color(0xFFE3EFFE),
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 4,
        ),
      ],
      errorTextSpace: 23,
      errorTextMargin: const EdgeInsets.only(top: 10),
      onCompleted: (v) => debugPrint("OTP Completed: $v"),
      onChanged: (value) {},
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        return true;
      },
    );
  }
}
