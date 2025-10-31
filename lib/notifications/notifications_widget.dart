import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  static String routeName = 'Notifications';
  static String routePath = '/notifications';

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget>
    with SingleTickerProviderStateMixin {
  late NotificationsModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _controller;

  final List<Map<String, String>> notifications = [
    {
      'image': 'assets/images/Ellipse_61.png',
      'title': 'David Silbia',
      'message': 'Scanned your pass and entered through the main gate.',
      'time': 'Just now',
    },
    {
      'image': 'assets/images/Ellipse_64.png',
      'title': 'Rachel Kinch',
      'message': 'Will attend the Snow Cleaning Event on October 22, 2024.',
      'time': '1h ago',
    },
    {
      'image': 'assets/images/Ellipse_65.png',
      'title': 'System Update',
      'message': 'The main gate will be under maintenance for 4 hours.',
      'time': '9h ago',
    },
    {
      'image': 'assets/images/Ellipse_61.png',
      'title': 'David Silbia',
      'message': 'Accessed again using your authorized pass successfully.',
      'time': '1 day ago',
    },
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800))
          ..forward();
  }

  @override
  void dispose() {
    _model.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget _buildNotificationCard({
    required String image,
    required String title,
    required String message,
    required String time,
    required int index,
  }) {
    final animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(index * 0.15, 1, curve: Curves.easeOutCubic),
      ),
    );

    return FadeTransition(
      opacity: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                image,
                width: 52.0,
                height: 52.0,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E1E1E),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                message,
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  color: const Color(0xFF3A3A3C),
                  height: 1.5,
                ),
              ),
            ),
            trailing: Text(
              time,
              style: GoogleFonts.poppins(
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF9E9E9E),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF8F8F8),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              // Elegant Header
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => context.safePop(),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black87,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Notifications',
                          style: GoogleFonts.poppins(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 36), // Symmetry spacing
                  ],
                ),
              ),

              // Notification list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final n = notifications[index];
                    return _buildNotificationCard(
                      image: n['image']!,
                      title: n['title']!,
                      message: n['message']!,
                      time: n['time']!,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}