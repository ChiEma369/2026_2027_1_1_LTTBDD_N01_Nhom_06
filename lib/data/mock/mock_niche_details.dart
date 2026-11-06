import 'package:tech_trail/models/niche_detail.dart';

const Map<String, NicheDetail> mockNicheDetails = {
  'web': NicheDetail(
    nicheId: 'web',
    displayName: 'Software Developer',
    tagline: 'Phát triển ứng dụng Web & nền tảng web',
    subtitle: 'KỸ SƯ PHÁT TRIỂN PHẦN MỀM',
    skills: ['React', 'Node.js', 'Golang', 'Git', 'SQL'],
    rating: 4.8,
    learnerCount: 3420,
    salaryRange: r'$650 - $1.800',
    demand: 'Rất cao (Top 1)',
    workMode: 'Hybrid / Remote',
    dailyTasks: [
      DailyTask(
        title: 'Phát triển ứng dụng đa nền tảng',
        description: 'Xây dựng ứng dụng Web, Mobile và dịch vụ phần mềm theo yêu cầu người dùng.',
      ),
      DailyTask(
        title: 'Viết và kiểm thử mã nguồn',
        description: 'Thực hiện Unit Test, refactor code, đảm bảo tiêu chuẩn mã nguồn hiệu suất.',
      ),
      DailyTask(
        title: 'Làm việc với Git & Hệ thống CI/CD',
        description: 'Quản lý branch, review Pull Request và triển khai mã nguồn lên môi trường test/live.',
      ),
      DailyTask(
        title: 'Phối hợp nhóm & Agile / Scrum',
        description: 'Tham gia Daily standup, meeting, thảo luận cùng Product Owner & Designer.',
      ),
    ],
    stages: [
      RoadmapStage(
        order: 1,
        title: 'Lập trình cơ bản',
        description: 'C/C++, Python căn bản, tư duy logic giải thuật & cấu trúc điều khiển.',
        tag: StageTag.foundation,
        duration: '~6 tuần',
        outcome: '4 bài tập lớn',
      ),
      RoadmapStage(
        order: 2,
        title: 'Cấu trúc dữ liệu & Giải thuật',
        description: 'Arrays, Linked List, Tree, Graph, thuật toán tìm kiếm và sắp xếp tối ưu (Big O).',
        tag: StageTag.core,
        duration: '~8 tuần',
        outcome: 'LeetCode Easy/Med',
      ),
      RoadmapStage(
        order: 3,
        title: 'Lập trình Web & Xây dựng API',
        description: 'HTML/CSS/JS hiện đại, Frontend React/Vue, Backend Node.js/Java & RESTful APIs.',
        tag: StageTag.applied,
        duration: '~10 tuần',
        outcome: '2 Full-stack Web',
      ),
      RoadmapStage(
        order: 4,
        title: 'Đồ án thực chiến & Triển khai',
        description: 'Đóng gói Docker, tự động hóa Git Workflow, kết nối Cloud (AWS/Vercel) chuẩn DevOps.',
        tag: StageTag.advanced,
        duration: '~12 tuần',
        outcome: 'Capstone Project',
      ),
    ],
  ),
  'ai-ml': NicheDetail(
    nicheId: 'ai-ml',
    displayName: 'Data & Trí tuệ nhân tạo',
    tagline: 'Machine Learning, LLM & Big Data',
    subtitle: 'KỸ SƯ AI / MACHINE LEARNING',
    skills: ['Python', 'PyTorch', 'SQL', 'GenAI'],
    rating: 4.9,
    learnerCount: 2780,
    salaryRange: r'$800 - $2.500',
    demand: 'Rất cao',
    workMode: 'Hybrid / Remote',
    dailyTasks: [
      DailyTask(
        title: 'Thu thập và tiền xử lý dữ liệu',
        description: 'Làm sạch, gán nhãn và chuẩn hoá dữ liệu phục vụ huấn luyện mô hình.',
      ),
      DailyTask(
        title: 'Huấn luyện và đánh giá mô hình',
        description:
            'Thử nghiệm thuật toán, tinh chỉnh tham số và đo độ chính xác.',
      ),
      DailyTask(
        title: 'Triển khai mô hình vào sản phẩm',
        description: 'Đóng gói mô hình thành API/dịch vụ để ứng dụng gọi dùng.',
      ),
    ],
    stages: [
      RoadmapStage(
        order: 1,
        title: 'Toán & Lập trình Python',
        description:
            'Xác suất thống kê, đại số tuyến tính, Python và giải thuật.',
        tag: StageTag.foundation,
        duration: '~8 tuần',
        outcome: '4 bài tập lớn',
      ),
      RoadmapStage(
        order: 2,
        title: 'Dữ liệu & Học máy cơ bản',
        description: 'SQL, Pandas, các thuật toán Machine Learning kinh điển.',
        tag: StageTag.core,
        duration: '~8 tuần',
        outcome: '3 bài Kaggle',
      ),
      RoadmapStage(
        order: 3,
        title: 'Deep Learning & Ứng dụng',
        description: 'Mạng nơ-ron, thị giác máy tính, xử lý ngôn ngữ tự nhiên.',
        tag: StageTag.applied,
        duration: '~10 tuần',
        outcome: '2 mô hình hoàn chỉnh',
      ),
      RoadmapStage(
        order: 4,
        title: 'Đồ án AI & Triển khai',
        description:
            'Xây dựng, đóng gói và triển khai một sản phẩm ứng dụng AI.',
        tag: StageTag.advanced,
        duration: '~12 tuần',
        outcome: 'Capstone Project',
      ),
    ],
  ),
  'security': NicheDetail(
    nicheId: 'security',
    displayName: 'Cybersecurity',
    tagline: 'Bảo mật hệ thống & An ninh mạng',
    subtitle: 'CHUYÊN VIÊN AN TOÀN THÔNG TIN',
    skills: ['SOC', 'Penetration Test', 'Network'],
    rating: 4.7,
    learnerCount: 1560,
    salaryRange: r'$600 - $2.000',
    demand: 'Cao',
    workMode: 'Onsite / Hybrid',
    dailyTasks: [
      DailyTask(
        title: 'Đánh giá lỗ hổng bảo mật',
        description: 'Quét và phân tích điểm yếu của hệ thống, ứng dụng.',
      ),
      DailyTask(
        title: 'Kiểm thử xâm nhập (Pentest)',
        description:
            'Mô phỏng tấn công trong môi trường được cho phép để tìm rủi ro.',
      ),
      DailyTask(
        title: 'Giám sát & ứng phó sự cố',
        description: 'Theo dõi cảnh báo, điều tra và xử lý sự cố an ninh mạng.',
      ),
    ],
    stages: [
      RoadmapStage(
        order: 1,
        title: 'Mạng & Hệ điều hành',
        description: 'Giao thức mạng, Linux, nguyên lý hoạt động của hệ thống.',
        tag: StageTag.foundation,
        duration: '~6 tuần',
        outcome: '3 bài lab',
      ),
      RoadmapStage(
        order: 2,
        title: 'Nhập môn An toàn thông tin',
        description:
            'Mật mã học, các nhóm lỗ hổng phổ biến, quy trình bảo mật.',
        tag: StageTag.core,
        duration: '~8 tuần',
        outcome: '4 bài tập lớn',
      ),
      RoadmapStage(
        order: 3,
        title: 'An ninh mạng & Pentest',
        description: 'Network Security, kiểm thử xâm nhập trong môi trường lab/CTF hợp lệ.',
        tag: StageTag.applied,
        duration: '~10 tuần',
        outcome: 'CTF nhập môn',
      ),
      RoadmapStage(
        order: 4,
        title: 'Đồ án An toàn thông tin',
        description:
            'Đánh giá bảo mật một hệ thống mẫu và lập báo cáo khuyến nghị.',
        tag: StageTag.advanced,
        duration: '~12 tuần',
        outcome: 'Capstone Project',
      ),
    ],
  ),
  'cloud-devops': NicheDetail(
    nicheId: 'cloud-devops',
    displayName: 'Cloud & DevOps',
    tagline: 'Hạ tầng đám mây & CI/CD',
    subtitle: 'KỸ SƯ CLOUD / DEVOPS',
    skills: ['AWS', 'Docker', 'Kubernetes'],
    rating: 4.8,
    learnerCount: 1890,
    salaryRange: r'$700 - $2.200',
    demand: 'Rất cao',
    workMode: 'Hybrid / Remote',
    dailyTasks: [
      DailyTask(
        title: 'Triển khai hạ tầng trên Cloud',
        description:
            'Dựng và vận hành máy chủ, mạng, lưu trữ trên AWS/GCP/Azure.',
      ),
      DailyTask(
        title: 'Xây dựng pipeline CI/CD',
        description: 'Tự động hoá build, test và triển khai ứng dụng.',
      ),
      DailyTask(
        title: 'Giám sát hệ thống',
        description: 'Theo dõi log, hiệu năng và xử lý sự cố vận hành.',
      ),
    ],
    stages: [
      RoadmapStage(
        order: 1,
        title: 'Mạng & Hệ điều hành',
        description: 'Linux, mạng máy tính và nền tảng hạ tầng hệ thống.',
        tag: StageTag.foundation,
        duration: '~6 tuần',
        outcome: '3 bài lab',
      ),
      RoadmapStage(
        order: 2,
        title: 'Lập trình & Tự động hoá',
        description: 'Python/Shell script, Git, tự động hoá tác vụ vận hành.',
        tag: StageTag.core,
        duration: '~6 tuần',
        outcome: '4 script thực tế',
      ),
      RoadmapStage(
        order: 3,
        title: 'Cloud & Container',
        description: 'Điện toán đám mây, Docker, pipeline CI/CD cơ bản.',
        tag: StageTag.applied,
        duration: '~10 tuần',
        outcome: '2 pipeline hoàn chỉnh',
      ),
      RoadmapStage(
        order: 4,
        title: 'Đồ án triển khai hệ thống',
        description: 'Triển khai một ứng dụng đầy đủ lên cloud, có giám sát.',
        tag: StageTag.advanced,
        duration: '~12 tuần',
        outcome: 'Capstone Project',
      ),
    ],
  ),
};
