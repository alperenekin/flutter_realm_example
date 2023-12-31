import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm_example/user_cubit/user_cubit.dart' as user;

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/local_user.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<user.UserCubit, user.UserState>(
        listener: (context, state) {
          if (state is user.UserAdded) {
            const snackBar = SnackBar(content: Text('User successfully added'), backgroundColor: Colors.green);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is user.UserError) {
            final snackBar =
                SnackBar(content: Text('Error while adding patient ${state.message}'), backgroundColor: Colors.red);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<user.UserCubit, user.UserState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                state is user.UserLoaded
                    ? SizedBox(
                        height: 450,
                        child: ListView.builder(
                          itemCount: state.users.length,
                          itemBuilder: ((context, index) {
                            final user = state.users[index];
                            return Center(child: Text('${user.firstName} ${user.lastName}'));
                          }),
                        ),
                      )
                    : const CircularProgressIndicator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await context.read<user.UserCubit>().addUser(LocalUser(ObjectId(), 'Alperen', 'Ekin', 'Male'));
                      },
                      child: const Text('Add User'),
                    ),
                    ElevatedButton(
                      onPressed: state is! user.UserLoaded
                          ? null
                          : () async {
                              await context.read<user.UserCubit>().deleteUser(state.users.firstOrNull);
                            },
                      child: const Text('Delete first user'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await context.read<user.UserCubit>().addMultipleUser();
                      },
                      child: const Text('Add Multiple User'),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
