import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sos_model.dart';
export 'sos_model.dart';

class SosWidget extends StatefulWidget {
  const SosWidget({super.key});

  static String routeName = 'SOS';
  static String routePath = '/sos';

  @override
  State<SosWidget> createState() => _SosWidgetState();
}

class _SosWidgetState extends State<SosWidget> {
  late SosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SosModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildEmergencyItem({
    required Color color,
    required IconData icon,
    required String title,
    required String contact,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          title: Text(
            title,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.karla(fontWeight: FontWeight.bold),
                  fontSize: 17,
                  color: Colors.white,
                ),
          ),
          subtitle: Text(
            'Contact: $contact',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.karla(),
                  color: Colors.white70,
                ),
          ),
          trailing: Icon(Icons.call_rounded, color: color, size: 26),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              buttonSize: 60.0,
              icon: const Icon(Icons.arrow_back_rounded,
                  color: Colors.white, size: 30),
              onPressed: () => context.pop(),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Emergency Contacts',
            style: GoogleFonts.karla(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0F2027),
                Color(0xFF203A43),
                Color(0xFF2C5364),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            top: true,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Encabezado visual
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                            width: 85,
                            height: 85,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'In Case of Emergency',
                          style: GoogleFonts.karla(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Quick access to essential contacts',
                          style: GoogleFonts.karla(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Lista mejorada
                  _buildEmergencyItem(
                    color: const Color(0xFF007BFF),
                    icon: Icons.local_police,
                    title: 'Police',
                    contact: '123',
                  ),
                  _buildEmergencyItem(
                    color: const Color(0xFFFF3B30),
                    icon: Icons.local_fire_department,
                    title: 'Fire Department',
                    contact: '123',
                  ),
                  _buildEmergencyItem(
                    color: const Color(0xFF28A745),
                    icon: Icons.medical_services_rounded,
                    title: 'Ambulance / Medical Emergency',
                    contact: '123',
                  ),
                  _buildEmergencyItem(
                    color: Colors.orange,
                    icon: Icons.safety_divider_rounded,
                    title: 'Civil Defense / Rescue',
                    contact: '911',
                  ),
                  _buildEmergencyItem(
                    color: FlutterFlowTheme.of(context).success,
                    icon: Icons.health_and_safety_rounded,
                    title: 'Red Cross',
                    contact: '911',
                  ),

                  const SizedBox(height: 40),
                  // Pie visual
                  Text(
                    'Stay calm and call the right service 🚨',
                    style: GoogleFonts.karla(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}