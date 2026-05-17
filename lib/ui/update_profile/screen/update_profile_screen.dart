import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/StringsManager.dart';
import 'package:movies_app/ui/update_profile/wedgets/bottom_sheet_widget.dart';

import '../../../core/reusable_components/customBtn.dart';
import '../../../core/reusable_components/customTextFormField.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String routeName="update-Profile Screen";
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController phoneController;


  @override
  void initState() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringsManager.pickAvatar,),),
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap:(){
                  openBottomSheet(context);
                }, child: Center(child: Image.asset(AssetsManager.gamer7,height:150.h,width: 150.w,fit:BoxFit.fill,))),
              SizedBox(height: 35.h,),
              CustomTextFormField(
                hintText: StringsManager.nameHint,
                controller: nameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                prefixIconData:AssetsManager.userIcon ,
              ),
              SizedBox(height: 19.h,),
              CustomTextFormField(
                hintText: StringsManager.phoneHint,
                controller: phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                prefixIconData: AssetsManager.phoneIcon,
              ),
              SizedBox(height: 19.h,),
              Text(StringsManager.resetPassword),
              Spacer(),
              CustomBtn(text: StringsManager.updateData, onPressed: (){},
                colorContainer:Theme.of(context).colorScheme.primary,
                colorText: Theme.of(context).colorScheme.onPrimary,
                borderContainer:Colors.transparent,
              ),
              SizedBox(height: 19.h,),
              CustomBtn(text: StringsManager.deleteAccount, onPressed: (){},
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
   openBottomSheet(BuildContext context){
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context,
        builder: (context){
      return BottomSheetWidget();
    });
  }
}
