import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SendsmsWidget extends StatefulWidget {
  final String docotrId;
  const SendsmsWidget({Key? key, required this.docotrId}) : super(key: key);
  @override
  State<SendsmsWidget> createState() => _SendsmsWidgetState();
}

class _SendsmsWidgetState extends State<SendsmsWidget> {
  late Future<List<Map<String, dynamic>>> _noteFuture;

  @override
  void initState() {
    super.initState();
    _noteFuture = fetchData();
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    var response = await Supabase.instance.client
        .from('doctors')
        .select('email, doctorsid')
        .ilike("doctorsid", "D1%D5")
        .eq('email', widget.docotrId);
    print(response);

    List<Map<String, dynamic>> data = List.castFrom(response as List<dynamic>);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Email'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _noteFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Map<String, dynamic>>? patientData = snapshot.data;
            if (patientData == null || patientData.isEmpty) {
              return Center(child: Text('No doctor data found.'));
            }

            // Ensure the first element has necessary data
            if (patientData[0]['email'] == null ||
                patientData[0]['doctorsid'] == null) {
              return Center(child: Text('Doctor data is incomplete.'));
            }

            // Extract email and patient ID
            String email = patientData[0]['email'];
            String patientID = patientData[0]['doctorsid'];

            // Construct email subject and body
            String subject = "Doctor ID";
            String body = "This is your doctor ID: $patientID";

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Doctor Email: $email',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Doctor ID: $patientID',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _sendEmail(email, subject, body);
                    },
                    child: Text('Send Email'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Function to send email using url_launcher package
  void _sendEmail(String email, String subject, String body) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=$subject&body=$body',
    );

    String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send email')),
      );
    }
  }
}
