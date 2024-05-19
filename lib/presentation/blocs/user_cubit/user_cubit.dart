// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_ready/domain/entities/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(
          UserState(
            UserModel(
              uid: "1",
              displayName: "default",
            ),
          ),
        );

  void setUserModel(UserModel userModel) {
    emit(
      UserState(
        userModel,
      ),
    );
  }
}
