part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguageEvent extends AccountEvent {
  final String langCode;

  const ChangeLanguageEvent({required this.langCode});
}
