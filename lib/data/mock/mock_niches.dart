import 'package:tech_trail/models/niche.dart';

const List<CareerField> mockFields = [
  CareerField(
    id: 'software',
    name: 'Phát triển phần mềm',
    shortName: 'Software',
  ),
  CareerField(
    id: 'data-ai',
    name: 'Dữ liệu & Trí tuệ nhân tạo',
    shortName: 'Data & AI',
  ),
  CareerField(
    id: 'quality-security',
    name: 'Chất lượng & Bảo mật',
    shortName: 'Cybersecurity',
  ),
  CareerField(
    id: 'infra-ops',
    name: 'Hạ tầng & Vận hành',
    shortName: 'Cloud & DevOps',
  ),
  CareerField(
    id: 'management',
    name: 'Quản trị dự án & sản phẩm',
    shortName: 'Management',
  ),
];

const List<Niche> mockNiches = [
  // ---- Phát triển phần mềm ----
  Niche(
    id: 'web',
    fieldId: 'software',
    name: 'Lập trình viên Web',
    shortDescription:
        'Xây dựng giao diện và tính năng cho website, ứng dụng web.',
    isPriority: true,
    jobDescription:
        'Xây dựng giao diện và các tính năng của website/ứng dụng web: dựng giao diện bằng '
        'HTML/CSS/JavaScript và các framework hiện đại (React, Vue...), kết nối với API '
        'backend để lấy/hiển thị dữ liệu, tối ưu hiệu năng tải trang và khả năng hiển thị '
        'trên nhiều thiết bị (responsive), phối hợp với người thiết kế (designer) và lập '
        'trình viên backend trong suốt quá trình phát triển sản phẩm.',
    roadmap: [
      'Nhập môn lập trình; Cấu trúc dữ liệu và giải thuật — nền tảng tư duy lập trình',
      'Lập trình hướng đối tượng — chuẩn bị cho việc học các framework JavaScript hiện đại',
      'Thiết kế web/Lập trình Web — HTML, CSS, JavaScript cơ bản, làm việc với DOM',
      'Cơ sở dữ liệu — thiết kế CSDL quan hệ, viết truy vấn SQL cơ bản',
      'Mạng máy tính — hiểu giao thức HTTP, cách hoạt động của REST API',
      'Phát triển ứng dụng Web nâng cao/Framework JavaScript (React, Vue) và Node.js',
      'Đồ án chuyên ngành liên quan đến phát triển web',
    ],
  ),
  Niche(
    id: 'mobile',
    fieldId: 'software',
    name: 'Lập trình viên Mobile',
    shortDescription:
        'Phát triển ứng dụng cho điện thoại Android, iOS hoặc đa nền tảng.',
  ),
  Niche(
    id: 'backend',
    fieldId: 'software',
    name: 'Lập trình viên Backend',
    shortDescription:
        'Xây dựng máy chủ, API và xử lý dữ liệu phía sau ứng dụng.',
  ),
  Niche(
    id: 'desktop-game',
    fieldId: 'software',
    name: 'Lập trình Desktop/Game',
    shortDescription: 'Phát triển phần mềm máy tính và trò chơi.',
  ),

  // ---- Dữ liệu & AI ----
  Niche(
    id: 'data-analyst',
    fieldId: 'data-ai',
    name: 'Data Analyst',
    shortDescription:
        'Thu thập, làm sạch và phân tích dữ liệu để hỗ trợ ra quyết định.',
  ),
  Niche(
    id: 'data-engineer',
    fieldId: 'data-ai',
    name: 'Data Engineer',
    shortDescription:
        'Xây dựng hệ thống thu thập, lưu trữ và xử lý dữ liệu quy mô lớn.',
  ),
  Niche(
    id: 'ai-ml',
    fieldId: 'data-ai',
    name: 'Kỹ sư AI/Machine Learning',
    shortDescription:
        'Xây dựng và triển khai các mô hình học máy cho bài toán thực tế.',
    isPriority: true,
    jobDescription:
        'Nghiên cứu và xây dựng các mô hình học máy để giải quyết bài toán thực tế (phân '
        'loại, dự đoán, nhận diện hình ảnh, xử lý ngôn ngữ...): thu thập và tiền xử lý dữ '
        'liệu, lựa chọn và huấn luyện mô hình, đánh giá độ chính xác, sau đó triển khai mô '
        'hình vào ứng dụng hoặc dịch vụ thực tế.',
    roadmap: [
      'Toán cao cấp; Xác suất thống kê — nền tảng toán học cho học máy',
      'Cấu trúc dữ liệu và giải thuật; Lập trình Python',
      'Cơ sở dữ liệu — xử lý và truy vấn dữ liệu phục vụ huấn luyện mô hình',
      'Nhập môn Trí tuệ nhân tạo',
      'Học máy',
      'Học sâu và các ứng dụng thị giác máy tính/xử lý ngôn ngữ tự nhiên',
      'Đồ án chuyên ngành về AI/Machine Learning',
    ],
  ),

  // ---- Chất lượng & Bảo mật ----
  Niche(
    id: 'qa-tester',
    fieldId: 'quality-security',
    name: 'QA/Tester',
    shortDescription:
        'Kiểm tra chất lượng phần mềm, tìm lỗi trước khi đến tay người dùng.',
  ),
  Niche(
    id: 'security',
    fieldId: 'quality-security',
    name: 'Chuyên viên An toàn thông tin',
    shortDescription:
        'Phát hiện lỗ hổng, kiểm thử xâm nhập và ứng phó sự cố an ninh mạng.',
    isPriority: true,
    jobDescription:
        'Đánh giá và phát hiện lỗ hổng bảo mật của hệ thống/ứng dụng, thực hiện kiểm thử '
        'xâm nhập cơ bản trong môi trường được cho phép, giám sát và hỗ trợ ứng '
        'phó khi có sự cố an ninh mạng, tham gia xây dựng và duy trì các chính sách/quy '
        'trình bảo mật cho tổ chức.',
    roadmap: [
      'Mạng máy tính; Hệ điều hành — hiểu nguyên lý hoạt động của hệ thống cần bảo vệ',
      'Cơ sở dữ liệu — hiểu các lỗ hổng liên quan đến dữ liệu (ví dụ SQL Injection)',
      'Nhập môn An toàn thông tin',
      'Mật mã học',
      'An ninh mạng',
      'Kiểm thử xâm nhập trong môi trường lab/CTF hợp lệ',
      'Đồ án chuyên ngành về An toàn thông tin',
    ],
  ),

  // ---- Hạ tầng & Vận hành ----
  Niche(
    id: 'sys-net-admin',
    fieldId: 'infra-ops',
    name: 'Quản trị hệ thống & mạng',
    shortDescription: 'Vận hành, giám sát máy chủ và hạ tầng mạng của tổ chức.',
  ),
  Niche(
    id: 'cloud-devops',
    fieldId: 'infra-ops',
    name: 'Kỹ sư Cloud/DevOps',
    shortDescription:
        'Triển khai, tự động hoá và vận hành ứng dụng trên nền tảng đám mây.',
    isPriority: true,
    jobDescription:
        'Triển khai và vận hành hạ tầng ứng dụng trên nền tảng điện toán đám mây (AWS, '
        'GCP, Azure...), xây dựng và duy trì pipeline tích hợp/triển khai liên tục (CI/CD), '
        'đóng gói ứng dụng bằng container (Docker) và điều phối (Kubernetes) khi cần, giám '
        'sát tình trạng hoạt động của hệ thống.',
    roadmap: [
      'Mạng máy tính; Hệ điều hành — nền tảng hạ tầng hệ thống',
      'Lập trình (Python/Shell script) — tự động hoá các tác vụ vận hành',
      'Cơ sở dữ liệu — vận hành và sao lưu dữ liệu trên môi trường cloud',
      'Nhập môn Điện toán đám mây',
      'DevOps & CI/CD — Docker, pipeline triển khai tự động',
      'Đồ án chuyên ngành về triển khai/vận hành hệ thống',
    ],
  ),

  // ---- Quản trị dự án & sản phẩm ----
  Niche(
    id: 'ba',
    fieldId: 'management',
    name: 'Business Analyst',
    shortDescription:
        'Cầu nối giữa nhu cầu kinh doanh và đội ngũ phát triển phần mềm.',
  ),
  Niche(
    id: 'pm',
    fieldId: 'management',
    name: 'Project Manager',
    shortDescription:
        'Lập kế hoạch, điều phối nguồn lực và theo dõi tiến độ dự án.',
  ),
  Niche(
    id: 'po',
    fieldId: 'management',
    name: 'Product Owner',
    shortDescription:
        'Định hướng sản phẩm và ưu tiên tính năng theo giá trị người dùng.',
  ),
];
