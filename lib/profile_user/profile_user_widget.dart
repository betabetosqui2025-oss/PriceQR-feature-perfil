import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_user_model.dart';
export 'profile_user_model.dart';

class ProfileUserWidget extends StatefulWidget {
  const ProfileUserWidget({super.key});

  static String routeName = 'ProfileUser';
  static String routePath = '/profileUser';

  @override
  State<ProfileUserWidget> createState() => _ProfileUserWidgetState();
}

class _ProfileUserWidgetState extends State<ProfileUserWidget> {
  late ProfileUserModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileUserModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      context.goNamed(LoginWidget.routeName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cerrar sesión: $e')),
      );
    }
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
            children: [
              // Encabezado mejorado
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1E1E2D),
                      Color(0xFF2D2D44),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Avatar mejorado
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.amber.shade400, Colors.orange.shade700],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                              fit: BoxFit.cover,
                              width: 84,
                              height: 84,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('usuarios')
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              );
                            }
                            if (!snapshot.hasData ||
                                !snapshot.data!.exists) {
                              return Text(
                                'Usuario no encontrado',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              );
                            }

                            final userData = snapshot.data!.data()
                                as Map<String, dynamic>;
                            final nombre = userData['nombre'] ?? 'Usuario';
                            final correo = userData['correo'] ??
                                FirebaseAuth.instance.currentUser?.email ??
                                '';

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nombre,
                                  style: GoogleFonts.karla(
                                    color: Color(0xFFFFC107),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6),
                                Text(
                                  correo,
                                  style: GoogleFonts.plusJakartaSans(
                                    color: Color(0xFFB0BEC5),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'Usuario Premium',
                                    style: GoogleFonts.karla(
                                      color: Colors.amber.shade200,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Opciones de menú con modales específicos
              _buildMenuCard(
                title: 'Edit Profile',
                icon: Icons.edit_rounded,
                iconColor: Color(0xFF6366F1),
                onTap: () => context.pushNamed(EditarPerfilUsuarioWidget.routeName),
              ),
              _buildMenuCard(
                title: 'Notification Settings',
                icon: Icons.notifications_active_rounded,
                iconColor: Color(0xFFFFA726),
                onTap: () => _showNotificationsModal(context),
              ),
              _buildMenuCard(
                title: 'About the App',
                icon: Icons.info_outline_rounded,
                iconColor: Color(0xFF2196F3),
                onTap: () => _showAboutAppModal(context),
              ),
              _buildMenuCard(
                title: 'Contact Support',
                icon: Icons.support_agent_rounded,
                iconColor: Color(0xFF4CAF50),
                onTap: () => _showContactSupportModal(context),
              ),

              SizedBox(height: 30),

              // Botón de salir mejorado
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: FFButtonWidget(
                  onPressed: _signOut,
                  text: 'Log Out',
                  icon: Icon(Icons.logout_rounded, size: 20),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52,
                    color: Color(0xFF1E1E2D),
                    textStyle: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    borderRadius: BorderRadius.circular(14),
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ),

          // Barra inferior
          wrapWithModel(
            model: _model.navBarModel,
            updateCallback: () => safeSetState(() {}),
            child: const NavBarWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          splashColor: iconColor.withOpacity(0.1),
          child: Container(
            height: 68,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.karla(
                      fontSize: 16,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}