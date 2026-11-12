import 'package:flutter/material.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/utils/app_theme.dart';

class ActivityDetailScreen extends StatelessWidget {
  final Activity activity;

  const ActivityDetailScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4F4F8),
      body: SingleChildScrollView(
        child: Column(children: [_buildHeroHeader(context)]),
      ),
    );
  }

  Widget _buildHeroHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 283,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      decoration: const BoxDecoration(color: Color(0xFF0C3846)),
      child: Column(
        children: [
          // Thanh điều hướng
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withValues(
                      alpha: 0.1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                    ),
                  ),
                ),
              ),

              // Tiêu đề nằm giữa
              Expanded(
                child: Center(
                  child: Text(
                    'Chi tiết hoạt động',
                    style: AppText.s(
                      16,
                      w: FontWeight.w600,
                      color: const Color(0xFFE4F4F8),
                    ),
                  ),
                ),
              ),

              // Giữ khoảng trống để tiêu đề thực sự nằm giữa
              const SizedBox(width: 40),
            ],
          ),

          const SizedBox(height: 16),
          _buildCodePreview(),
        ],
      ),
    );
  }

  Widget _buildCodePreview() {
    return Container(
      width: 280,
      height: 176,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2A7387), Color(0xFF0C3846)],
        ),
        border: Border.all(
          color: const Color(0xFF5EB0C8).withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Thanh tiêu đề của cửa sổ code
          Row(
            children: [
              _buildWindowDot(const Color(0xFFFB7185)),
              const SizedBox(width: 6),
              _buildWindowDot(const Color(0xFFFBBF24)),
              const SizedBox(width: 6),
              _buildWindowDot(const Color(0xFF34D399)),
              const Spacer(),
              const Text(
                'api.controller.ts',
                style: TextStyle(
                  color: Color(0xFF5EB0C8),
                  fontSize: 11,
                  fontFamily: 'monospace',
                ),
              ),
              const Spacer(),
              const Text(
                'REST v1',
                style: TextStyle(
                  color: Color(0xFF9FD3E3),
                  fontSize: 10,
                ),
              ),
            ],
          ),

          const Divider(color: Colors.white12, height: 1),

          // Đoạn code minh họa
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "@Get('/activities')\n"
              "  async findAll(@Query() query) {\n"
              "    return await this.service.get();\n"
              "  }",
              style: TextStyle(
                color: Color(0xFF9FD3E3),
                fontSize: 10,
                height: 1.7,
                fontFamily: 'monospace',
              ),
            ),
          ),

          // Trạng thái API
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Color(0xFF34D399),
                    size: 9,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'HTTP 200 OK',
                    style: TextStyle(
                      color: Color(0xFF9FD3E3),
                      fontSize: 10,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF5EB0C8)
                      .withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'JSON Response',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWindowDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
