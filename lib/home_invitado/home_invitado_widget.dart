import '/components/nav_bar_invitado_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_invitado_model.dart';
export 'home_invitado_model.dart';

class HomeInvitadoWidget extends StatefulWidget {
  const HomeInvitadoWidget({super.key});

  static String routeName = 'HomeInvitado';
  static String routePath = '/homeInvitado';

  @override
  State<HomeInvitadoWidget> createState() => _HomeInvitadoWidgetState();
}

class _HomeInvitadoWidgetState extends State<HomeInvitadoWidget>
    with TickerProviderStateMixin {
  late HomeInvitadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeInvitadoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Widget reutilizable para items de lista
  Widget _buildListItem({
    required String imageUrl,
    required String title,
    required String price,
    required String distance,
    required String rating,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 230.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.karla(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                            ),
                            letterSpacing: 0.0,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      price,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.karla(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                            ),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      distance,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.karla(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                            ),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 4.0, 0.0),
                    child: Text(
                      rating,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.karla(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                            ),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Lista de datos para cada categoría
  final List<Map<String, String>> _homesData = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxjb21pZGF8ZW58MHx8fHwxNzU5NDYzMzczfDA&ixlib=rb-4.1.0&q=80&w=1080',
      'title': 'Maidstone, San Antonio, Tx.',
      'price': '\$210/night',
      'distance': '32 miles away',
      'rating': '4.25',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1564956142890-3b3746211005?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687',
      'title': 'Maidstone, San Antonio, Tx.',
      'price': '\$210/night',
      'distance': '32 miles away',
      'rating': '4.25',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1702827496398-b906ab2dd926?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxjb21pZGElMjBjYXJpYmV8ZW58MHx8fHwxNzU5NDYzNDA4fDA&ixlib=rb-4.1.0&q=80&w=1080',
      'title': 'Maidstone, San Antonio, Tx.',
      'price': '\$210/night',
      'distance': '32 miles away',
      'rating': '4.25',
    },
  ];

  final List<Map<String, String>> _beachfrontData = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1509233725247-49e657c54213?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwbGF5YXxlbnwwfHx8fDE3NTk0NjM0MzF8MA&ixlib=rb-4.1.0&q=80&w=1080',
      'title': 'Maidstone, San Antonio, Tx.',
      'price': '\$210/night',
      'distance': '32 miles away',
      'rating': '4.25',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1531969179221-3946e6b5a5e7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHx0ZWF8ZW58MHx8fHwxNzU5MzUyNzcxfDA&ixlib=rb-4.1.0&q=80&w=1080',
      'title': 'Maidstone, San Antonio, Tx.',
      'price': '\$210/night',
      'distance': '32 miles away',
      'rating': '4.25',
    },
  ];

  final List<Map<String, String>> _natureData = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1472396961693-142e6e269027?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxuYXR1cmFsZXphfGVufDB8fHx8MTc1OTQ2MzQ3MHww&ixlib=rb-4.1.0&q=80&w=1080',
      'title': 'Maidstone, San Antonio, Tx.',
      'price': '\$210/night',
      'distance': '32 miles away',
      'rating': '4.25',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1505142468610-359e7d316be0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxuYXR1cmF8ZW58MHx8fHwxNzU5NDYzNDg5fDA&ixlib=rb-4.1.0&q=80&w=1080',
      'title': 'Maidstone, San Antonio, Tx.',
      'price': '\$210/night',
      'distance': '32 miles away',
      'rating': '4.25',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 200.0,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Search listings...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.karla(
                                              fontWeight: FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.karla(
                                              fontWeight: FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.karla(
                                            fontWeight: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .fontWeight,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context).primary,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).alternate,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.tune_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // Tab Bar and Content
                  Expanded(
                    child: Column(
                      children: [
                        // Tab Bar
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.karla(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: TextStyle(),
                            indicatorColor: FlutterFlowTheme.of(context).primary,
                            padding: EdgeInsets.all(4.0),
                            tabs: [
                              Tab(
                                text: 'Homes',
                                icon: Icon(Icons.home_filled),
                              ),
                              Tab(
                                text: 'Beachfront',
                                icon: Icon(Icons.beach_access_rounded),
                              ),
                              Tab(
                                text: 'Nature',
                                icon: Icon(Icons.nature_people),
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        
                        // Tab Bar View - CORREGIDO: Usando Expanded con ListView.builder
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              // TAB 1: Homes
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: _homesData.length,
                                itemBuilder: (context, index) {
                                  final item = _homesData[index];
                                  return _buildListItem(
                                    imageUrl: item['imageUrl']!,
                                    title: item['title']!,
                                    price: item['price']!,
                                    distance: item['distance']!,
                                    rating: item['rating']!,
                                  );
                                },
                              ),
                              
                              // TAB 2: Beachfront
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: _beachfrontData.length,
                                itemBuilder: (context, index) {
                                  final item = _beachfrontData[index];
                                  return _buildListItem(
                                    imageUrl: item['imageUrl']!,
                                    title: item['title']!,
                                    price: item['price']!,
                                    distance: item['distance']!,
                                    rating: item['rating']!,
                                  );
                                },
                              ),
                              
                              // TAB 3: Nature
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: _natureData.length,
                                itemBuilder: (context, index) {
                                  final item = _natureData[index];
                                  return _buildListItem(
                                    imageUrl: item['imageUrl']!,
                                    title: item['title']!,
                                    price: item['price']!,
                                    distance: item['distance']!,
                                    rating: item['rating']!,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              // Nav Bar
              wrapWithModel(
                model: _model.navBarInvitadoModel,
                updateCallback: () => safeSetState(() {}),
                child: NavBarInvitadoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}