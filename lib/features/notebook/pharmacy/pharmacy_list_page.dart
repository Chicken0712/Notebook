import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/pharmacy/pharmacy_model.dart';
import 'package:fitjourney/features/notebook/pharmacy/pharmacy_data.dart';
import 'pharmacy_detail_page.dart';

class PharmacyListPage extends StatelessWidget {
  final String? type;

  const PharmacyListPage({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    final List<Pharmacy> filtered = (type == null || type!.trim().isEmpty)
        ? pharmacySamples
        : pharmacySamples
        .where((p) => p.type.toLowerCase() == type!.toLowerCase())
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách Thuốc' + (type != null ? ' – $type' : '')),
      ),
      body: ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final p = filtered[index];
          Widget leading;

          if (p.imageUrl != null) {
            if (p.imageUrl!.startsWith('assets/')) {
              leading = Image.asset(
                p.imageUrl!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              );
            } else {
              leading = Image.network(
                p.imageUrl!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
              );
            }
          } else {
            leading = const Icon(Icons.medication_outlined);
          }

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: leading,
              title: Text(
                p.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${p.price.toStringAsFixed(0)}đ • ${p.brand ?? "—"}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PharmacyDetailPage(pharmacy: p),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
