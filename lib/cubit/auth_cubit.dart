import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_plane/models/users.dart';
import 'package:my_plane/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp(String email, String password, String name, String hobby) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signUp(email, password, name, hobby);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signIn(email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().getCurrentUser(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
