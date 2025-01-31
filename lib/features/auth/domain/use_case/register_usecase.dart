import 'package:hamroBooking/app/usecase/usecase.dart';
import 'package:hamroBooking/core/error/failure.dart';
import 'package:hamroBooking/features/auth/domain/entity/auth_entity.dart';
import 'package:hamroBooking/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RegisterUserParams extends Equatable {
  final String fname;
  final String lname;
  final String phone;
  final String email;
  final String password;
  final String? image;

  const RegisterUserParams({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.password,
    this.image,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [fname, lname, phone, email, password];
}

class RegisterUseCase implements UseCaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      fName: params.fname,
      lName: params.lname,
      email: params.email,
      password: params.password,
      phone: params.phone,
      image: params.image,
    );
    return repository.registerCustomer(authEntity);
  }
}
