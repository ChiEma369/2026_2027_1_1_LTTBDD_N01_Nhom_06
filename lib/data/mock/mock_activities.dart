import 'package:tech_trail/models/activity.dart';

const List<Activity> mockActivities = [
  Activity(
    id: 'a1',
    title: 'Xây dựng trang portfolio cá nhân bằng HTML/CSS/JS',
    type: ActivityType.miniProject,
    nicheId: 'web',
    description: 'Thực hành dựng một trang web tĩnh đơn giản, làm quen bố cục và responsive cơ bản.',
  ),
  Activity(
    id: 'a2',
    title: 'Workshop xây dựng API danh sách sản phẩm với Node.js',
    type: ActivityType.workshop,
    nicheId: 'web',
    description: 'Thực hành viết một API REST đơn giản, kết nối với giao diện đã dựng ở hoạt động 1.',
  ),
  Activity(
    id: 'a3',
    title: 'Huấn luyện mô hình phân loại ảnh cơ bản với Python',
    type: ActivityType.miniProject,
    nicheId: 'ai-ml',
    description: 'Dùng bộ dữ liệu ảnh có sẵn để huấn luyện và đánh giá một mô hình phân loại đơn giản.',
  ),
  Activity(
    id: 'a4',
    title: 'Seminar tổng quan về Machine Learning trong thực tế',
    type: ActivityType.seminar,
    nicheId: 'ai-ml',
    description: 'Giới thiệu các ứng dụng ML phổ biến và lộ trình học tập cho người mới bắt đầu.',
  ),
  Activity(
    id: 'a5',
    title: 'Thực hành nhận diện lỗ hổng bảo mật cơ bản (lab CTF nhập môn)',
    type: ActivityType.workshop,
    nicheId: 'security',
    description: 'Thực hành phát hiện một số lỗ hổng phổ biến trên ứng dụng mẫu trong môi trường lab an toàn.',
  ),
  Activity(
    id: 'a6',
    title: 'Seminar tổng quan nghề An toàn thông tin',
    type: ActivityType.seminar,
    nicheId: 'security',
    description: 'Giới thiệu công việc hằng ngày, các hướng chuyên sâu (pentest, giám sát, SOC...).',
  ),
  Activity(
    id: 'a7',
    title: 'Triển khai ứng dụng lên Cloud với Docker',
    type: ActivityType.miniProject,
    nicheId: 'cloud-devops',
    description: 'Đóng gói một ứng dụng nhỏ bằng Docker và triển khai thử trên nền tảng cloud miễn phí.',
  ),
  Activity(
    id: 'a8',
    title: 'Workshop kỹ năng thuyết trình dự án nhóm',
    type: ActivityType.softSkill,
    nicheId: null,
    description: 'Thực hành thuyết trình ngắn về một dự án/ý tưởng, nhận phản hồi từ người tham gia.',
  ),
];