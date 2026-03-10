import 'package:crave/features/auth/data/models/register_request.dart';
import 'package:crave/features/auth/domain/entities/user_entity.dart';
import 'package:crave/features/auth/domain/repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }

  Future<void> register({required RegisterRequest userInfo}) async {
    emit(AuthLoading());
    final result = await authRepo.register(userInfo: userInfo);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }
}
