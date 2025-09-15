import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/core/error/messages.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';
import 'package:r34_12/features/users/domain/usecase/adduser.dart';
import 'package:r34_12/features/users/domain/usecase/update_user.dart';
import 'package:r34_12/features/users/domain/usecase/delete_user.dart';

class UserConsoleService with FailureMessages {
  late final Adduser addUserUseCase;
  late final Updateuser updateUserUseCase;
  late final Deleteuser deleteUserUseCase;

  UserConsoleService({
    required this.addUserUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  });

  void addUser(String id) {
    final result = addUserUseCase(AdduserParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) =>
          print(success ? 'User added successfully' : 'User could not be added'),
    );
  }

  void updateUser(String id, String name, String email) {
    final user = User(
      id: id,
      name: name,
      email: email,
    );

    final result = updateUserUseCase(UpdateuserParams(user: user));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedUser) => print('User updated successfully: ${updatedUser.name}'),
    );
  }

  void deleteUser(String id) {
    final result = deleteUserUseCase(DeleteuserParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(
          success ? 'User deleted successfully' : 'User could not be deleted'),
    );
  }
}