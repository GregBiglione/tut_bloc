import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:tut_bloc/constant/enum.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged
        .listen((connectivityResult) {
          if(connectivityResult == ConnectivityResult.wifi) {
            internetConnected(ConnectionType.wifi);
          }
          else if(connectivityResult == ConnectivityResult.mobile) {
            internetConnected(ConnectionType.mobile);
          }
          else if(connectivityResult == ConnectivityResult.none) {
            internetDisconnected();
          }
    });
  }

  void internetConnected(ConnectionType connectionType) => emit(
    InternetConnected(connectionType: connectionType)
  );

  void internetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
