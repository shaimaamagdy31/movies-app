import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AppValidations.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/StringsManager.dart';

import '../../../core/reusable_components/customBtn.dart';
import '../../../core/reusable_components/customTextFormField.dart';
import '../../../core/utils/dialog_utils.dart';

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
        body: Form(
          key: formKey,
          child: Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              spacing: 24.h,
              children: [
                Image.asset(AssetsManager.forgetPassImage),
                CustomTextFormField(
                  hintText: StringsManager.emailHint,
                  controller: emailController,
                  validator: AppValidations.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  prefixIconData: AssetsManager.emailIcon,
                ),
                CustomBtn(text: StringsManager.verifyEmail, onPressed: () async {
                  if(formKey.currentState?.validate() ?? false){
                    try{
                      DialogUtils.showLoadingDialog(context);
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailController.text);
                      Navigator.pop(context);
                      DialogUtils.toastMassagingDialog(
                          " check your email");
                    }catch(e){
                      Navigator.pop(context);
                      DialogUtils.showMassagingDialog(context,"This account not found ");

                    }

                  }
                },
                  colorContainer:Theme.of(context).colorScheme.primary,
                  colorText: Theme.of(context).colorScheme.onPrimary,
                  borderContainer:Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
