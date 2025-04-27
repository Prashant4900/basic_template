import 'package:appwrite_app/core/dimensions.dart';
import 'package:appwrite_app/l10n/l10n.dart';
import 'package:appwrite_app/router/router.dart';
import 'package:appwrite_app/views/components/buttons.dart';
import 'package:appwrite_app/views/screens/settings/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyOnboardingScreen extends StatelessWidget {
  const MyOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocConsumer<SettingCubit, SettingState>(
      listener: (context, state) {
        if (state.status == SettingStatus.success) {
          context.push(Routes.login);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'assets/images/language-onboarding.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: horizontalPadding32,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        Text(
                          l10n.selectLanguage,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const Spacer(flex: 3),
                        CustomElevatedButton(
                          label: 'English',
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          onPressed:
                              () => context.read<SettingCubit>().changeLanguage(
                                'en',
                              ),
                        ),
                        verticalMargin8,
                        CustomElevatedButton(
                          label: 'Español',
                          onPressed:
                              () => context.read<SettingCubit>().changeLanguage(
                                'es',
                              ),
                        ),
                        const Spacer(flex: 3),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
