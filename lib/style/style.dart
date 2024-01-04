import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle titleHeader = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );
  static TextStyle titleFieldHeader = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );
}

class AppColors {
  // absolute colors
  static Color primaryColor = Color(0xFF1B3D9E);
  static Color secondaryColor = Color(0xFF9EAFF1);
  static Color textColor = Colors.black;
  static Color bgFieldColor = Color(0xFFF1F6FE);
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.title,
    required this.controller, 
    this.isForNumber = false,
  });

  final TextEditingController controller;
  final String title;
  final bool isForNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.titleFieldHeader.copyWith(fontWeight: FontWeight.bold, color: AppColors.primaryColor.withOpacity(0.6)),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.bgFieldColor, border: Border.all(color: AppColors.primaryColor.withOpacity(0.3))),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: controller,
              keyboardType: isForNumber ? TextInputType.number : TextInputType.text,
              inputFormatters: isForNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
              decoration: InputDecoration(border: InputBorder.none),
              style: AppTextStyles.titleFieldHeader.copyWith(color: AppColors.primaryColor.withOpacity(0.8)),
            ),
          ),
        ],
      ),
    );
  }
}

enum AlertType { error, success, warning }

class AppAlert {
  final String message;
  final AlertType alertType;
  AppAlert({
    required this.message,
    required this.alertType,
  }) {
    Get.snackbar(
      isDismissible: true,
      alertType == AlertType.error ? 'Error' : alertType == AlertType.success ? 'Success' : 'Warning',
      message,
      colorText: Colors.black,
      backgroundColor: alertType == AlertType.error ? Colors.red : alertType == AlertType.success ? Colors.green : Colors.yellow,
      icon: Icon(alertType == AlertType.error ? Icons.error : alertType == AlertType.success ? Icons.check : Icons.warning, color: Colors.black,),
    );
  }
}
