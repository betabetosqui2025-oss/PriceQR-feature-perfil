import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'catalogo_publico_model.dart';
export 'catalogo_publico_model.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'dart:typed_data';

class CatalogoPublicoWidget extends StatefulWidget {
  const CatalogoPublicoWidget({
    super.key,
    required this.userIdVendedor,
  });

  static String routeName = 'PublicCatalog';
  static String routePath = '/catalog/:userId';

  final String userIdVendedor;

  @override
  State<CatalogoPublicoWidget> createState() => _CatalogoPublicoWidgetState();
}

class _CatalogoPublicoWidgetState extends State<CatalogoPublicoWidget>
    with SingleTickerProviderStateMixin {
  // 🔹 Si no usas FlutterFlow directamente, puedes comentar esto:
  late CatalogoPublicoModel _model;

  List<QueryDocumentSnapshot> products = [];
  bool loading = true;
  String sellerName = '';
  String? errorMessage;

  late AnimationController _animController;

  @override
  void initState() {
    super.initState();

    // 🔹 Si usas FlutterFlow, deja esto:
    _model = createModel(context, () => CatalogoPublicoModel());

    // 🔹 Si NO usas FlutterFlow, comenta la línea anterior y usa:
    // _model = CatalogoPublicoModel();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _loadSellerCatalog();
  }

  Future<void> _loadSellerCatalog() async {
    setState(() {
      loading = true;
      errorMessage = null;
    });

    try {
      final sellerDoc = await FirebaseFirestore.instance
          .collection('vendedores')
          .doc(widget.userIdVendedor)
          .get();

      if (!sellerDoc.exists) {
        setState(() {
          loading = false;
          errorMessage = 'Seller not found';
        });
        return;
      }

      final productsSnapshot = await FirebaseFirestore.instance
          .collection('catalogo')
          .where('userId', isEqualTo: widget.userIdVendedor)
          .orderBy('fecha_creacion', descending: true)
          .get();

      setState(() {
        sellerName = sellerDoc.data()?['nombre'] ?? 'Seller';
        products = productsSnapshot.docs;
        loading = false;
      });

      _animController.forward(from: 0.0);
    } catch (e) {
      debugPrint('❌ Error loading catalog: $e');
      setState(() {
        loading = false;
        errorMessage = 'Error loading catalog: $e';
      });
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    // Evita error si el modelo no tiene dispose
    try {
      _model.dispose();
    } catch (_) {}
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await _loadSellerCatalog();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        title: Text(
          "$sellerName's Catalog",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black87),
        actions: [
          IconButton(
            onPressed: _onRefresh,
            icon: Icon(Icons.refresh,
                color: isDark ? Colors.white70 : Colors.black54),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: Colors.teal,
        child: _buildBody(isDark),
      ),
    );
  }

  Widget _buildBody(bool isDark) {
    if (loading) return _buildLoadingGrid(isDark);

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            errorMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    if (products.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 120),
          Icon(Icons.storefront_outlined,
              size: 72, color: isDark ? Colors.white24 : Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'This seller has no products yet.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDark ? Colors.white60 : Colors.grey[700],
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final data = products[index].data() as Map<String, dynamic>;
        final animation = CurvedAnimation(
          parent: _animController,
          curve: Interval((index * 0.06).clamp(0.0, 0.8), 1.0,
              curve: Curves.easeOutCubic),
        );

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: _buildProductCard(data, isDark),
          ),
        );
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> data, bool isDark) {
    final name = (data['nombre'] ?? 'Unnamed').toString();
    final price = data['precio']?.toString() ?? '0';
    final currency = data['moneda'] ?? 'COP';
    final category = data['categoria'] ?? 'Uncategorized';
    final stockVal = data['stock'];
    final stock = stockVal == null ? 0 : int.tryParse(stockVal.toString()) ?? 0;
    final maxPrice = data['precio_maximo_oficial'] ?? 0;
    final priceNum = double.tryParse(price) ?? 0;
    final maxPriceNum = double.tryParse(maxPrice.toString()) ?? 0;
    final isValid = maxPriceNum == 0 || priceNum <= maxPriceNum;
    final accentColor = isValid ? Colors.green : Colors.orange;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF141414) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: _buildProductImage(data['imagenes_base64']),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${_formatPrice(priceNum)} $currency',
                  style: TextStyle(
                    color: Colors.teal.shade700,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                _stockChip(stock),
                const SizedBox(height: 6),
                _statusChip(isValid, accentColor),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(double p) =>
      (p % 1 == 0) ? p.toInt().toString() : p.toStringAsFixed(2);

  Widget _stockChip(int stock) {
    final available = stock > 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: available
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        available ? 'In stock ($stock)' : 'Out of stock',
        style: TextStyle(
          fontSize: 12,
          color: available ? Colors.green[800] : Colors.redAccent,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _statusChip(bool isValid, Color accent) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: accent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isValid
                  ? Icons.check_circle_outline
                  : Icons.warning_amber_rounded,
              size: 14,
              color: accent,
            ),
            const SizedBox(width: 6),
            Text(
              isValid ? 'Valid price' : 'Price alert',
              style: TextStyle(
                color: accent,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );

  Widget _buildProductImage(dynamic imagenesBase64) {
    if (imagenesBase64 == null ||
        (imagenesBase64 is List && imagenesBase64.isEmpty)) {
      return _buildPlaceholderImage(Icons.image_outlined);
    }

    try {
      String base64Str = (imagenesBase64 is List && imagenesBase64.isNotEmpty)
          ? imagenesBase64.first
          : (imagenesBase64 is String)
              ? imagenesBase64
              : '';

      if (base64Str.contains(',')) {
        base64Str = base64Str.split(',').last;
      }

      final remainder = base64Str.length % 4;
      if (remainder != 0) base64Str += '=' * (4 - remainder);

      final Uint8List bytes = base64.decode(base64Str);
      if (bytes.isEmpty) return _buildPlaceholderImage(Icons.broken_image);

      return Image.memory(bytes, fit: BoxFit.cover);
    } catch (e) {
      debugPrint('❌ Image decode error: $e');
      return _buildPlaceholderImage(Icons.broken_image);
    }
  }

  Widget _buildPlaceholderImage(IconData icon) => Container(
        color: Colors.grey.shade100,
        child: Center(
          child: Icon(icon, color: Colors.grey.shade400, size: 36),
        ),
      );

  Widget _buildLoadingGrid(bool isDark) => GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (_, __) => Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[850] : Colors.grey[200],
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      );
}