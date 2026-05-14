import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';

import '../../../core/reusable_components/customBtn.dart';
import '../../../core/reusable_components/customChoiceBtn.dart';
import '../../../core/reusable_components/customTextFormField.dart';
import '../../../core/utils/StringsManager.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "Sign-in Screen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController passwordController;

  late TextEditingController emailController;

  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 67),
        child: Column(
          children: [
            Image.asset(AssetsManager.logo),
            SizedBox(height: 69.h),
            CustomTextFormField(
              hintText: StringsManager.emailHint,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              prefixIconData: AssetsManager.emailIcon,
            ),
            SizedBox(height: 22.h),
            CustomTextFormField(
              hintText: StringsManager.passwordHint,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              prefixIconData: AssetsManager.passwordIcon,
            ),
            SizedBox(height: 17.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                StringsManager.forgetPass,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SizedBox(height: 33.h),
            CustomBtn(
              text: StringsManager.login,
              onPressed: () {},
              colorContainer: Theme.of(context).colorScheme.primary,
              colorText: Theme.of(context).colorScheme.onPrimary,
              borderContainer: Colors.transparent,
            ),
            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsManager.donotHaveAccount,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Text(
                  StringsManager.createOne,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900
                  ),
                ),
              ],
            ),
            SizedBox(height: 27.h),
            Row(children: [
              Expanded(child: Divider(color:ColorsManager.yellow,indent:90.w,)),
              Text(
              StringsManager.or,
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w500),
            ),
              Expanded(child: Divider(color:ColorsManager.yellow,endIndent:90.w,))
            ],),
            SizedBox(height: 28.h),
            CustomBtn(
              text: StringsManager.logInWithGoogle,
              onPressed: () {},
              iconImage:AssetsManager.google,
              colorContainer: Theme.of(context).colorScheme.primary,
              colorText: Theme.of(context).colorScheme.onPrimary,
              borderContainer: Colors.transparent,
            ),
            SizedBox(height: 33.h),
            Customchoicebtn(),
          ],
        ),
      ),
    );
  }
}
