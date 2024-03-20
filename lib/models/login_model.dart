import '../pages/patient_details.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '../pages/login.dart' show DoctorSigninWidget;
import '../pages/doc_options.dart' show DocPatientOptionWidget;
// import '../pages/hospitall_add.dart' show HospitalAddingWidget;
import '../pages/splashscreen.dart' show SplashscreenWidget;
import '../pages/splashscreen_02.dart' show Spalshscreen2Widget;
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import 'package:flutter/material.dart';

class DoctorSigninModel extends FlutterFlowModel<DoctorSigninWidget> {
  ///  State fields for stateful widgets

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}

// 2nd file
class DocPatientOptionModel extends FlutterFlowModel<DocPatientOptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  get patientData => null;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }
}

//3rd file
class PatientDetailModel extends FlutterFlowModel<PatientDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

//4thfile

class HospitalAddingModel extends DoctorSigninModel {}

//5th file////

class SplashscreenModel extends FlutterFlowModel<SplashscreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

//6th file///////
class Spalshscreen2Model extends FlutterFlowModel<Spalshscreen2Widget> {
  // State fields for stateful widgets in this page.
  final unfocusNode = FocusNode();
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;

  // Reference to the MotionTabBarController
  MotionTabBarController? _motionTabBarController;

  // Getter for accessing the MotionTabBarController from outside
  MotionTabBarController? get motionTabBarController => _motionTabBarController;

  // Initialization and disposal methods.
  @override
  void initState(BuildContext context) {
    // Initialize _motionTabBarController here or pass it from the parent widget.
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();
    _motionTabBarController?.dispose(); // Dispose of MotionTabBarController
  }
}
