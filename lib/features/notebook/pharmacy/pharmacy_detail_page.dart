import 'package:flutter/material.dart';
import 'package:fitjourney/features/notebook/pharmacy/pharmacy_model.dart';

class PharmacyDetailPage extends StatelessWidget {
  final Pharmacy pharmacy;
  const PharmacyDetailPage({required this.pharmacy, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pharmacy.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (pharmacy.imageUrl != null)
                Center(
                  child: pharmacy.imageUrl!.startsWith('assets/')
                      ? Image.asset(
                    pharmacy.imageUrl!,
                    height: 200,
                    fit: BoxFit.contain,
                  )
                      : Image.network(
                    pharmacy.imageUrl!,
                    height: 200,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.broken_image, size: 100),
                  ),
                ),
              const SizedBox(height: 16),
              const Text(
                "🧴 Thông tin thuốc",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("• Loại: ${pharmacy.type}"),
              Text("• Số lượng: ${pharmacy.quantity}"),
              Text("• Giá: ${pharmacy.price}đ"),
              if (pharmacy.brand != null) Text("• Thương hiệu: ${pharmacy.brand}"),
              if (pharmacy.origin != null) Text("• Xuất xứ: ${pharmacy.origin}"),
              if (pharmacy.expiryDate != null) Text("• Hạn sử dụng: ${pharmacy.expiryDate}"),
              if (pharmacy.ingredient != null) Text("• Thành phần: ${pharmacy.ingredient}"),
              if (pharmacy.effect != null) Text("• Công dụng: ${pharmacy.effect}"),
              if (pharmacy.sideEffects != null) Text("• Tác dụng phụ: ${pharmacy.sideEffects}"),
              if (pharmacy.storage != null) Text("• Bảo quản: ${pharmacy.storage}"),
              const SizedBox(height: 12),
              if (pharmacy.usage.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cách dùng:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(pharmacy.usage),
                  ],
                ),
              const SizedBox(height: 12),
              if (pharmacy.note.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ghi chú:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(pharmacy.note),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
