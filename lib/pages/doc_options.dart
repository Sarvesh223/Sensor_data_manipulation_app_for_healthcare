import 'package:supabase_flutter/supabase_flutter.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'patient_details.dart';
import '../models/login_model.dart';
export '../models/login_model.dart';

class DocPatientOptionWidget extends StatefulWidget {
  final String doctorid;
  const DocPatientOptionWidget({Key? key, required this.doctorid})
      : super(key: key);

  @override
  State<DocPatientOptionWidget> createState() => _DocPatientOptionWidgetState();
}

class _DocPatientOptionWidgetState extends State<DocPatientOptionWidget> {
  late DocPatientOptionModel _model;
  late Future<List<Map<String, dynamic>>> _noteFuture;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final User? user = supabase.auth.currentUser;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocPatientOptionModel());
    _noteFuture = fetchData();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    var response = await Supabase.instance.client
        .from('patients')
        .select('name, paitentdisease')
        .eq('doctorsid', widget.doctorid);

    var data = response.withoutNulls as List<dynamic>?;

    return data?.map((row) => row as Map<String, dynamic>).toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                  AppBar(
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/splash.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            user?.email ?? '',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF1C274C),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                        //   child: Text(
                        //     'Neuro Surgeon',
                        //     style: FlutterFlowTheme.of(context)
                        //         .bodyMedium
                        //         .override(
                        //           fontFamily: 'Inter',
                        //           color: Color(0xFF818BA0),
                        //         ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: _noteFuture,
                      builder: (context, snapshot) {
                        print(
                            'Builder: ConnectionState: ${snapshot.connectionState}');
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          print('Builder: Waiting for data...');
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          print('Builder: Error: ${snapshot.error}');
                          return Text(
                            'Error: ${snapshot.error}',
                            style: TextStyle(color: Colors.red),
                          );
                        } else {
                          print('Builder: Snapshot data: ${snapshot.data}');

                          final List<Map<String, dynamic>>? patientData =
                              snapshot.data;
                          if (patientData == null || patientData.isEmpty) {
                            print('Builder: No patient data found.');
                            return Text(
                              'No patient data found.',
                              style: TextStyle(color: Colors.black),
                            );
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: patientData.length,
                            itemBuilder: (context, index) {
                              // Print statement to debug the length of patientData
                              print(
                                  'Length of patientData: ${patientData.length}');

                              // Check if the index is odd (for inserting dividers)
                              final patientName = patientData[index]['name'];
                              final patientDisease =
                                  patientData[index]['paitentdisease'];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PatientDetailWidget(
                                        patientName: patientName,
                                        patientSpecialty: patientDisease,
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16),
                                  leading: Icon(
                                    Icons.health_and_safety,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                  title: Text(
                                    patientName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF242E49),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  subtitle: Text(
                                    patientDisease,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF818BA0),
                                        ),
                                  ),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ])))));
  }
}
