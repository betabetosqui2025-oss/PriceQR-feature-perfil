import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sos_model.dart';
export 'sos_model.dart';
import 'package:url_launcher/url_launcher.dart';

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

  // Función para hacer llamadas
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        _showWebNotSupportedModal(context);
      }
    } catch (e) {
      print('Error launching phone call: $e');
      _showWebNotSupportedModal(context);
    }
  }

  // Modal para navegadores web
  void _showWebNotSupportedModal(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icono de teléfono
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6B6B).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.phone_disabled_rounded,
                      size: 40,
                      color: Color(0xFFFF6B6B),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Título
                  Text(
                    'Función no disponible 📞',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.karla(
                        fontWeight: FontWeight.bold,
                      ),
                      color: Color(0xFF1E1E2D),
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 15),
                  
                  // Descripción
                  Text(
                    'Las llamadas telefónicas solo están disponibles en dispositivos móviles.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.karla(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16,
                      lineHeight: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 10),
                  
                  // Información adicional
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF2F2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '📱 Para usar esta función:',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.karla(
                              fontWeight: FontWeight.w600,
                            ),
                            color: Color(0xFFD32F2F),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildInfoItem('Abre la aplicación en tu teléfono móvil'),
                        _buildInfoItem('Las llamadas se realizan a través del marcador nativo'),
                        _buildInfoItem('Podrás ver el número antes de confirmar'),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Números de emergencia para referencia
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '🚨 Números de Emergencia:',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.karla(
                              fontWeight: FontWeight.w600,
                            ),
                            color: Color(0xFF1976D2),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildEmergencyNumber('Policía', '123'),
                        _buildEmergencyNumber('Bomberos', '123'),
                        _buildEmergencyNumber('Ambulancia', '123'),
                        _buildEmergencyNumber('Defensa Civil', '911'),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 25),
                  
                  // Botón de aceptar
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF6B6B),
                      foregroundColor: Colors.white,
                      elevation: 2,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Entendido',
                      style: GoogleFonts.karla(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget auxiliar para items de información
  Widget _buildInfoItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded, size: 16, color: Color(0xFFFF6B6B)),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                font: GoogleFonts.karla(),
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para números de emergencia
  Widget _buildEmergencyNumber(String service, String number) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            service,
            style: FlutterFlowTheme.of(context).bodySmall.override(
              font: GoogleFonts.karla(),
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 13,
            ),
          ),
          Text(
            number,
            style: FlutterFlowTheme.of(context).bodySmall.override(
              font: GoogleFonts.karla(
                fontWeight: FontWeight.bold,
              ),
              color: Color(0xFF1976D2),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // Widget responsive para items de emergencia
  Widget _buildEmergencyItem({
    required Color color,
    required IconData icon,
    required String title,
    required String contact,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: _getHorizontalPadding(context),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(_getBorderRadius(context)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: _getContentPadding(context),
            vertical: 12,
          ),
          leading: Container(
            width: _getIconSize(context),
            height: _getIconSize(context),
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
            child: Icon(icon, color: Colors.white, size: _getIconInnerSize(context)),
          ),
          title: Text(
            title,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.karla(fontWeight: FontWeight.bold),
                  fontSize: _getTitleFontSize(context),
                  color: Colors.white,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            'Contact: $contact',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.karla(),
                  color: Colors.white70,
                  fontSize: _getSubtitleFontSize(context),
                ),
          ),
          trailing: Container(
            width: _getTrailingSize(context),
            height: _getTrailingSize(context),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.call_rounded, color: color, size: _getCallIconSize(context)),
              onPressed: () => _makePhoneCall(contact),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }

  // ========== FUNCIONES RESPONSIVE ==========

  // Obtener padding horizontal basado en el tamaño de pantalla
  double _getHorizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 4;  // Muy pequeño
    if (width < 400) return 6;  // Pequeño
    if (width < 600) return 8;  // Tableta pequeña
    return 12; // Tableta grande o desktop
  }

  // Obtener tamaño del borde redondeado
  double _getBorderRadius(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 12; // Muy pequeño
    return 14; // Normal
  }

  // Obtener padding del contenido
  double _getContentPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 12; // Muy pequeño
    if (width < 400) return 16; // Pequeño
    return 20; // Normal y grande
  }

  // Obtener tamaño del icono
  double _getIconSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 40; // Muy pequeño
    if (width < 400) return 45; // Pequeño
    return 50; // Normal
  }

  // Obtener tamaño interno del icono
  double _getIconInnerSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 20; // Muy pequeño
    if (width < 400) return 22; // Pequeño
    return 26; // Normal
  }

  // Obtener tamaño del título
  double _getTitleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 14; // Muy pequeño
    if (width < 400) return 15; // Pequeño
    return 17; // Normal
  }

  // Obtener tamaño del subtítulo
  double _getSubtitleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 12; // Muy pequeño
    if (width < 400) return 13; // Pequeño
    return 14; // Normal
  }

  // Obtener tamaño del trailing
  double _getTrailingSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 36; // Muy pequeño
    if (width < 400) return 40; // Pequeño
    return 44; // Normal
  }

  // Obtener tamaño del icono de llamada
  double _getCallIconSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 18; // Muy pequeño
    if (width < 400) return 20; // Pequeño
    return 22; // Normal
  }

  // Obtener tamaño del header icon
  double _getHeaderIconSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 70; // Muy pequeño
    if (width < 400) return 75; // Pequeño
    return 85; // Normal
  }

  // Obtener tamaño de fuente del header
  double _getHeaderTitleSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 350) return 18; // Muy pequeño
    if (width < 400) return 20; // Pequeño
    return 22; // Normal
  }

  // Obtener padding vertical
  EdgeInsets _getMainPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontal = width < 350 ? 12.0 : width < 600 ? 18.0 : 24.0;
    final vertical = width < 350 ? 16.0 : 20.0;
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final isVerySmallScreen = screenWidth < 350;

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
            padding: EdgeInsets.only(left: isVerySmallScreen ? 4.0 : 8.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              buttonSize: isVerySmallScreen ? 50.0 : 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: isVerySmallScreen ? 24 : 30,
              ),
              onPressed: () => context.pop(),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Emergency Contacts',
            style: GoogleFonts.karla(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: isVerySmallScreen ? 16 : isSmallScreen ? 18 : 20,
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
              padding: _getMainPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Encabezado visual responsive
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(isVerySmallScreen ? 16 : 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(isVerySmallScreen ? 16 : 20),
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
                        Container(
                          width: _getHeaderIconSize(context),
                          height: _getHeaderIconSize(context),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFF6B6B),
                                Color(0xFFFF8E53),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.3),
                                blurRadius: 15,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.emergency_rounded,
                            color: Colors.white,
                            size: isVerySmallScreen ? 32 : isSmallScreen ? 36 : 40,
                          ),
                        ),
                        SizedBox(height: isVerySmallScreen ? 10 : 14),
                        Text(
                          'In Case of Emergency',
                          style: GoogleFonts.karla(
                            fontSize: _getHeaderTitleSize(context),
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: isVerySmallScreen ? 6 : 8),
                        Text(
                          'Toca para llamar - Se abrirá el marcador nativo',
                          style: GoogleFonts.karla(
                            fontSize: isVerySmallScreen ? 12 : isSmallScreen ? 13 : 14,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: isVerySmallScreen ? 20 : 30),

                  // Lista de contactos de emergencia
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
                    color: Color(0xFFDC3545),
                    icon: Icons.health_and_safety_rounded,
                    title: 'Red Cross',
                    contact: '911',
                  ),

                  SizedBox(height: isVerySmallScreen ? 25 : 40),
                  
                  // Información adicional responsive
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(isVerySmallScreen ? 12 : 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(isVerySmallScreen ? 10 : 12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.phone_android_rounded, 
                          color: Colors.white70, 
                          size: isVerySmallScreen ? 20 : 24
                        ),
                        SizedBox(height: isVerySmallScreen ? 6 : 8),
                        Text(
                          'La llamada se realizará a través de tu aplicación de teléfono',
                          style: GoogleFonts.karla(
                            color: Colors.white70,
                            fontSize: isVerySmallScreen ? 11 : 13,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: isVerySmallScreen ? 15 : 20),
                  
                  // Pie visual
                  Text(
                    'Stay calm and call the right service 🚨',
                    style: GoogleFonts.karla(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                      fontSize: isVerySmallScreen ? 12 : 14,
                    ),
                    textAlign: TextAlign.center,
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