import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app_s/blocs/auth_bloc.dart';
import 'package:pizza_app_s/blocs/bloc_provider.dart';
import 'package:pizza_app_s/extensions/auth_exception_extension.dart';
import 'package:pizza_app_s/widgets/custom_builder.dart';

class AuthExceptionInfo extends StatelessWidget {
  const AuthExceptionInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder<FirebaseAuthException?>(
      stream: BlocProvider.of<AuthBloc>(context).onExceptionChange,
      dataBuilder: (context, data) => Text(
        data!.messageException,

        /// TODO - Faire le thème
        // style: CustomTheme.subtitle1Error(context),
      ),
    );
  }
}
