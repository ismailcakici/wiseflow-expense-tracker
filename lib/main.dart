import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiseflow/core/constants/app/app_constants.dart';
import 'package:wiseflow/core/theme/app_theme/app_theme.dart';
import 'package:wiseflow/feature/add_transaction/cubit/transaction_cubit.dart';
import 'package:wiseflow/product/init/localization/localizaton_manager.dart';
import 'package:wiseflow/product/init/product_init.dart';

import 'feature/tab_controller/viewmodel/tab_controller_viewmodel.dart';

Future<void> main() async {
  await ProductInit.getInstance.initProduct();
  runApp(
    EasyLocalization(
      path: AppConstants.getInstance.localizationPath,
      supportedLocales: LocalizationManager.getInstance.supportedLocales,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        title: AppConstants.getInstance.appTitle,
        key: UniqueKey(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.getInstance.appTheme,
        home: const TabControllerView(),
      ),
    );
  }
}
