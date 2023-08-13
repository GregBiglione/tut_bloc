part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final bool appNotification;
  final bool emailNotification;

  const SettingState({required this.appNotification,
    required this.emailNotification});

  SettingState copyWith({required bool appNotification,
    required bool emailNotification}) {
    return SettingState(
        appNotification: appNotification,
        emailNotification: emailNotification,
    );
  }

  @override
  List<Object?> get props => [
    appNotification,
    emailNotification,
  ];

  @override
  String toString() {
    return 'SettingState{appNotification: $appNotification, emailNotification: $emailNotification}';
  }
}
