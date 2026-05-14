import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/customBtn.dart';
import 'package:movies_app/core/reusable_components/customChoiceBtn.dart';
import 'package:movies_app/core/reusable_components/customTextFormField.dart';
import 'package:movies_app/core/utils/AppConstants.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';
import 'package:movies_app/core/utils/StringsManager.dart';

import '../wedgets/avatarImageView.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName="Sign-up Screen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;

  late TextEditingController phoneController;

  late TextEditingController passwordController;

  late TextEditingController emailController;

  late TextEditingController confirmPasswordController;

  late PageController pageController;

  int currentIndex=0;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController=TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    pageController=PageController(viewportFraction: 0.4);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(StringsManager.register),),
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 161.h,
                  child: PageView.builder(
                    onPageChanged:(value){
                      setState(() {
                        currentIndex=value;
                      });
                    } ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>AvatarImageView(index: index,isSelected: index == currentIndex),
                    itemCount: AppConstants.avatarList.length,
                    controller: pageController,
                  ),
                ),
                Text(StringsManager.avatar,style: Theme.of(context).textTheme.labelSmall,),
                CustomTextFormField(
                    hintText: StringsManager.nameHint,
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    prefixIconData: AssetsManager.nameIcon,
                ),
                CustomTextFormField(
                  hintText: StringsManager.emailHint,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  prefixIconData: AssetsManager.emailIcon,
                ),
                CustomTextFormField(
                  hintText: StringsManager.passwordHint,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  prefixIconData: AssetsManager.passwordIcon,
                ),
                CustomTextFormField(
                  hintText: StringsManager.confirmPasswordHint,
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  prefixIconData: AssetsManager.passwordIcon,
                ),
                CustomTextFormField(
                  hintText: StringsManager.phoneHint,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  prefixIconData: AssetsManager.phoneIcon,
                ),
                CustomBtn(text: StringsManager.createAccount, onPressed: (){},
                  colorContainer:Theme.of(context).colorScheme.primary,
                  colorText: Theme.of(context).colorScheme.onPrimary,
                  borderContainer:Colors.transparent,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringsManager.haveAccount,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 14.sp
                      ),
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child: Text(
                        StringsManager.login,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 14.sp,
                          color: ColorsManager.yellow
            
                        ),
                      ),
                    ),
            
                  ],
                ),
                Customchoicebtn()
              ],
            
            ),
          ),
        ),
      ),

    );
  }
}
