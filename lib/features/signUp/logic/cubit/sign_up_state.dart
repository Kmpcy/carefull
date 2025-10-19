part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
   const factory SignUpState.loading() = Loading;
  const factory SignUpState.success(SignUpResponse signUpResponse) = Success;
  const factory SignUpState.failure(String errormessage) = Failed;
}
