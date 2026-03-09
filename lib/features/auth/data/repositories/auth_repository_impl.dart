import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_datasource.dart';
import '../data_sources/auth_local_datasource.dart';
// import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<User?> login(String email, String password) async {
    final userModel = await remoteDataSource.login(email, password);
    if (userModel != null) {
      await localDataSource.saveToken('fake-token'); // Simpan token
    }
    return userModel;
  }

  @override
  Future<User?> register(String email, String password, String firstName, String lastName) async {
    final userModel = await remoteDataSource.register(email, password, firstName, lastName);
    if (userModel != null) {
      await localDataSource.saveToken('fake-token');
    }
    return userModel;
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
    await localDataSource.removeToken();
  }
}
