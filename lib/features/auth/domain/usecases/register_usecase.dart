import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

Future<User?> call(
  String firtName,
  String lastName,
  String email, 
  String password
)
{
  return repository.register(firtName, lastName, email, password);
}
}