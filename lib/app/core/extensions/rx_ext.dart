import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef StatusChangedCallback = void Function(dynamic v);

class RxxList<T> extends RxList<T> {
  RxxList._(List<T> initial, [RxStatus? initStatus])
      : status = initStatus ?? RxStatus.empty(),
        super(initial);

  RxStatus status;

  void change(List<T>? newValue, [RxStatus? newStatus]) {
    if (newValue != null) {
      value = newValue;
    }
    if (newStatus != null) {
      status = newStatus;
    }
  }

  Widget watch(
    Widget Function() builder, {
    Widget? onLoading,
    Widget? onError,
  }) {
    if (onLoading != null) {
      return onLoading;
    }
    if (onError != null) {
      return onError;
    }
    return builder();
  }

  bool get isLoading => status.isLoading;
  void loading() => status = RxStatus.loading();

  bool get isError => status.isError;
  void error([String? message]) => status = RxStatus.error(message);

  bool get isSuccess => status.isSuccess;
  void success() => status = RxStatus.success();
}

extension RxExt<T> on RxList<T> {
  RxxList withStatus([List<T>? initValue, RxStatus? initStatus]) {
    return RxxList<T>._(initValue ?? [], initStatus);
  }
}

// extension ControllerExt on GetxController {
//   Widget watch(
//     RxxList value,
//     Widget Function(RxxList value) builder, {
//     Widget? onLoading,
//     Widget? onError,
//     Widget? onEmpty,
//   }) {
//     Obx(() {
//       if (onLoading != null) {
//         return const Text('Loading...');
//       }
//       if (onError != null) {
//         return const Text('Opoos!');
//       }
//       return builder();
//     });
//     return builder();
//   }
// }
