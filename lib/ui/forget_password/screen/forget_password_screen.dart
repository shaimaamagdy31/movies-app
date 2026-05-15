import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/StringsManager.dart';

import '../../../core/reusable_components/customBtn.dart';
import '../../../core/reusable_components/customTextFormField.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName="Forget-Password Screen";

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text(StringsManager.forgetPassword),),
        body: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            spacing: 24.h,
            children: [
              Image.asset(AssetsManager.forgetPassImage),
              CustomTextFormField(
                hintText: StringsManager.emailHint,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                prefixIconData: AssetsManager.emailIcon,
              ),
              CustomBtn(text: StringsManager.verifyEmail, onPressed: (){},
                colorContainer:Theme.of(context).colorScheme.primary,
                colorText: Theme.of(context).colorScheme.onPrimary,
                borderContainer:Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
