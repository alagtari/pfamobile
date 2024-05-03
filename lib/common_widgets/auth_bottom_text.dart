import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

class AuthBottomText extends StatelessWidget {
  const AuthBottomText({
    super.key,
    this.login = true,
  });

  final bool login;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        login
            ? Text(
                "Don't have an account ?",
                style: TextStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              )
            : Text(
                "Do you have an account ?",
                style: TextStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
        const SizedBox(
          width: 5,
        ),
        login
            ? GestureDetector(
                onTap: () => context.router.replace(const LoginRoute()),
                child: Text(
                  "Sign In",
                  style: TextStyles.smallTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.greenDarkColor),
                ),
              )
            : GestureDetector(
                onTap: () => context.router.replace(const Signup()),
                child: Text(
                  "Sign Up",
                  style: TextStyles.smallTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.greenDarkColor,
                  ),
                ),
              ),
      ],
    );
  }
}
