part of 'user_cubit.dart';

class UserState extends Equatable {
  final UserModel userModel;
  const UserState(this.userModel);

  @override
  List<Object> get props => [userModel];
}
