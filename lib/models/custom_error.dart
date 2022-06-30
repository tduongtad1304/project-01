import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String errMsg;
  const CustomError({this.errMsg = ''});

  @override
  List<Object?> get props => [errMsg];

  @override
  bool get stringify => true;

  toMap() {
    return {'errMsg': errMsg};
  }

  static fromMap(x) {
    return CustomError(errMsg: x['errMsg']);
  }
}
