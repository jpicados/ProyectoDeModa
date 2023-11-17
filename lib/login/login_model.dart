import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txUser widget.
  FocusNode? txUserFocusNode;
  TextEditingController? txUserController;
  String? Function(BuildContext, String?)? txUserControllerValidator;
  // State field(s) for txPass widget.
  FocusNode? txPassFocusNode;
  TextEditingController? txPassController;
  late bool txPassVisibility;
  String? Function(BuildContext, String?)? txPassControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txPassVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    txUserFocusNode?.dispose();
    txUserController?.dispose();

    txPassFocusNode?.dispose();
    txPassController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
