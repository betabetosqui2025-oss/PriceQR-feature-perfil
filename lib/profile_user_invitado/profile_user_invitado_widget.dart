import '/components/nav_bar_invitado_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
// import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_user_invitado_model.dart';
export 'profile_user_invitado_model.dart';

class ProfileUserInvitadoWidget extends StatefulWidget {
  const ProfileUserInvitadoWidget({super.key});

  static String routeName = 'ProfileUserInvitado';
  static String routePath = '/profileUserInvitado';

  @override
  State<ProfileUserInvitadoWidget> createState() =>
      _ProfileUserInvitadoWidgetState();
}

class _ProfileUserInvitadoWidgetState extends State<ProfileUserInvitadoWidget> {
  late ProfileUserInvitadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileUserInvitadoModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Modal para Notification Settings
  void _showNotificationsModal(BuildContext context) {
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
                  // Icono de notificaciones
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFA726).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_active_outlined,
                      size: 40,
                      color: Color(0xFFFFA726),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Título
                  Text(
                    'Configuración de Notificaciones 🔔',
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
                    'Este apartado estará disponible en la próxima actualización.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.karla(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16,
                      lineHeight: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 10),
                  
                  // Funcionalidades
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '📱 Lo que podrás hacer:',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.karla(
                              fontWeight: FontWeight.w600,
                            ),
                            color: Color(0xFF1E1E2D),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildFeatureItem('Personalizar notificaciones push'),
                        _buildFeatureItem('Gestionar preferencias de alertas'),
                        _buildFeatureItem('Silenciar notificaciones temporales'),
                        _buildFeatureItem('Recibir novedades de productos'),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Mensaje final
                  Text(
                    'Mantente informado sobre las nuevas funcionalidades del sistema.',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.karla(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 25),
                  
                  // Botón de aceptar
                  FFButtonWidget(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: '¡Entendido!',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFFFFA726),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.karla(
                          fontWeight: FontWeight.w600,
                        ),
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
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

  // Modal para About the App
  void _showAboutAppModal(BuildContext context) {
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
                  // Icono de información
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF2196F3).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.info_outline,
                      size: 40,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Título
                  Text(
                    'Acerca de PriceQR ℹ️',
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
                    'Esta sección estará disponible en la próxima versión.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.karla(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16,
                      lineHeight: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 10),
                  
                  // Información de la app
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
                          '🚀 Sobre PriceQR:',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.karla(
                              fontWeight: FontWeight.w600,
                            ),
                            color: Color(0xFF1565C0),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildInfoItem('Versión: 1.0 Beta'),
                        _buildInfoItem('Plataforma: Multiplataforma'),
                        _buildInfoItem('Tecnología: Flutter & Firebase'),
                        _buildInfoItem('Estado: En desarrollo activo'),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 15),
                  
                  // Características
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF3E5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '✨ Próximamente:',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.karla(
                              fontWeight: FontWeight.w600,
                            ),
                            color: Color(0xFF7B1FA2),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildFeatureItem('Historial de versiones'),
                        _buildFeatureItem('Términos y condiciones'),
                        _buildFeatureItem('Política de privacidad'),
                        _buildFeatureItem('Créditos del desarrollo'),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 25),
                  
                  // Botón de aceptar
                  FFButtonWidget(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Continuar',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF2196F3),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.karla(
                          fontWeight: FontWeight.w600,
                        ),
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
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

  // Modal para Contact Support
  void _showContactSupportModal(BuildContext context) {
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
                  // Icono de soporte
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF4CAF50).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.support_agent_outlined,
                      size: 40,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Título
                  Text(
                    'Soporte al Cliente 📞',
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
                    'El sistema de soporte estará disponible próximamente.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.karla(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16,
                      lineHeight: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 10),
                  
                  // Canales de soporte
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F5E8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '📞 Canales de Ayuda:',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.karla(
                              fontWeight: FontWeight.w600,
                            ),
                            color: Color(0xFF2E7D32),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildSupportItem('Chat en tiempo real'),
                        _buildSupportItem('Soporte por email'),
                        _buildSupportItem('Centro de ayuda en línea'),
                        _buildSupportItem('FAQ interactiva'),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 15),
                  
                  // Tipos de asistencia
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF8E1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '🔧 Asistencia Disponible:',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.karla(
                              fontWeight: FontWeight.w600,
                            ),
                            color: Color(0xFFF57C00),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildSupportItem('Problemas técnicos'),
                        _buildSupportItem('Consultas de funcionalidad'),
                        _buildSupportItem('Reporte de errores'),
                        _buildSupportItem('Sugerencias de mejora'),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Mensaje de disponibilidad
                  Text(
                    'Muy pronto tendrás múltiples formas de contactarnos.',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.karla(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 25),
                  
                  // Botón de aceptar
                  FFButtonWidget(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: 'De Acuerdo',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF4CAF50),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.karla(
                          fontWeight: FontWeight.w600,
                        ),
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
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

  // Widget auxiliar para items de características
  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 16, color: Color(0xFF4CAF50)),
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

  // Widget auxiliar para items de información
  Widget _buildInfoItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Color(0xFF2196F3)),
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

  // Widget auxiliar para items de soporte
  Widget _buildSupportItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.arrow_forward_ios, size: 12, color: Color(0xFF4CAF50)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 160.0,
                decoration: BoxDecoration(
                  color: Color(0xFF21242D),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).alternate,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'assets/images/wmremove-transformed.jpeg',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Guest User',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.karla(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Text(
                                'You are browsing in guest mode.',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.karla(
                                        fontWeight: FontWeight.w200,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Notification Settings - CON MODAL
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 0.0,
                      ),
                    ),
                    child: InkWell(
                      onTap: () => _showNotificationsModal(context),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 4.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Notification Settings',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.karla(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                            Icon(
                              Icons.notifications,
                              color: Color(0xFFDD932C),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // About the App - CON MODAL
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 0.0,
                      ),
                    ),
                    child: InkWell(
                      onTap: () => _showAboutAppModal(context),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 4.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'About the App',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.karla(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                            Icon(
                              Icons.info,
                              color: Color(0xFF1F84D0),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Contact Support - CON MODAL
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 0.0,
                      ),
                    ),
                    child: InkWell(
                      onTap: () => _showContactSupportModal(context),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 4.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Contact Support',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.karla(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                            Icon(
                              Icons.support_agent,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Create Account Button
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 104.0, 0.0, 40.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('OpcionDeRegistro');
                    },
                    text: 'Create Account',
                    options: FFButtonOptions(
                      width: 123.59,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF00B894),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                font: GoogleFonts.karla(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          wrapWithModel(
            model: _model.navBarInvitadoModel,
            updateCallback: () => safeSetState(() {}),
            child: NavBarInvitadoWidget(),
          ),
        ],
      ),
    );
  }
}