import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/constants/assets.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/routes/route_name.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';
import 'package:task_management/common/utils/country_botom_sheet.dart';
import 'package:task_management/common/utils/providers.dart';
import 'package:task_management/common/widgets/custom_filled_button.dart';
import 'package:task_management/common/widgets/custom_text_form_field.dart';
import 'package:task_management/common/widgets/height.spacer.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //* Identify country
    final country = ref.watch(countryProvider);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: BoxSize.padding30FW).copyWith(
            top: BoxSize.padding20FH,
          ),
          child: Column(
            children: [
              //* Image
              Image.asset(Assets.todoImage),
              HeightSpacer.from20(),

              //* Text Content
              Text(
                'Please enter your phone number',
                style: FontStyles.poppinsMedium(
                  size: 17,
                  color: Colors.white,
                ),
              ),
              HeightSpacer.from20(),

              //* Text input phone number
              CustomTextFormField(
                controller: textController,
                keyboardType: TextInputType.phone,
                hintText: 'Enter phone number',
                prefixIcon: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: BoxSize.padding16FH,
                    horizontal: BoxSize.padding10FW,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showCountryBottmSheet(
                        context,
                        onSelect: (country) {
                          ref.read(countryProvider.notifier).update(
                                (state) => country,
                              );
                        },
                      );
                    },
                    child: Text(
                      '${country.flagEmoji} +${country.phoneCode}',
                      textAlign: TextAlign.center,
                      style: FontStyles.poppinsBold(
                        size: 18,
                        color: AppColors.bkDark,
                      ),
                    ),
                  ),
                ),
              ),

              HeightSpacer.from30(),

              //* Botton send Code
              CustomFilledButton(
                text: 'Send Code',
                onPressed: () => Navigator.pushNamed(context, RouteName.otp),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
