import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm_example/local_user.dart';
import 'package:realm_example/user_cubit/user_cubit.dart' as user;

import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<user.UserCubit, user.UserState>(
        listener: (context, state) {
          if (state is user.UserAdded) {
            const snackBar = SnackBar(
              content: Text('Yay! A SnackBar!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<user.UserCubit, user.UserState>(
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<user.UserCubit>().addUser(LocalUser(ObjectId(), 'Alperen', 'Ekin', 'Male'));
                      },
                      child: Text('Add patient')),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
