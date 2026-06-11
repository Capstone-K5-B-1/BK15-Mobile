import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';

class QrisScan extends StatefulWidget {
  final void Function() onNext;
  const QrisScan({super.key, required this.onNext});

  @override
  State<QrisScan> createState() => _QrisScanState();
}

class _QrisScanState extends State<QrisScan> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final BarcodeCapture? capture = await _controller.analyzeImage(image.path);
      if (capture != null && capture.barcodes.isNotEmpty) {
        print('Barcode found from image! ${capture.barcodes.first.rawValue}');
        widget.onNext();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No QR code found in the image')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. LAYER BOTTOM PANEL (Di belakang layer kamera)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 280, // Tinggi panel putih
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 32,
                top: 56, // top padding ekstra karena tertimpa layer kamera
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Text(
                    "Or generate your own QR code by choosing\nthis option below",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 24),

                  // Tombol Create QR Payment
                  InkWell(
                    onTap: () {},
                    child: const Column(
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: Color(0xFF910A19),
                          size: 32,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Create QR Payment",
                          style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Tombol View Active QR dengan CustomButton
                  CustomButton(
                    text: 'View Active QR',
                    backgroundColor: const Color(0xFF910A19),
                    textColor: Colors.white,
                    borderRadius: 25,
                    height: 50,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          // 2. LAYER KAMERA & OVERLAY (Menimpa panel putih dengan rounded bottom)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 240, // Menyisakan 240px dari bawah (menimpa 40px dari panel putih yang tingginya 280px)
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background Kamera
                  MobileScanner(
                    controller: _controller,
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        print('Barcode found! ${barcode.rawValue}');
                        widget.onNext();
                      }
                    },
                    errorBuilder: (context, error) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Camera error: ${error.errorCode}\n${error.errorDetails}',
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),

                  // Layer Overlay
                  Positioned(
                    top: 120, // Memberikan ruang agar tidak tertutup header dari main_qris
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Kotak Transparan untuk Target Scan QR
                        Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(0.1), // Efek transparan
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Barisan Tombol Flash, QRIS, dan Upload
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ValueListenableBuilder<MobileScannerState>(
                                valueListenable: _controller,
                                builder: (context, state, child) {
                                  final isFlashOn = state.torchState == TorchState.on;
                                  return _buildIconAction(
                                    isFlashOn ? Icons.flash_off : Icons.flash_on,
                                    isFlashOn ? "Flash Off" : "Flash On",
                                    () {
                                      _controller.toggleTorch();
                                    },
                                  );
                                },
                              ),
                              Image.asset(
                                'assets/features/home/icons/qris_logo.png',
                                color: Colors.white,
                                width: 80,
                                fit: BoxFit.contain,
                              ),
                              _buildIconAction(Icons.image, "Upload", _pickImage),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget untuk tombol Flash dan Upload
  Widget _buildIconAction(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.black, size: 20),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
