import 'package:tech_trail/models/niche.dart';

const List<CareerField> mockFields = [
  CareerField(
    id: 'software',
    nameVi: 'Phát triển phần mềm',
    nameEn: 'Software Development',
    shortNameVi: 'Phần mềm',
    shortNameEn: 'Software',
  ),
  CareerField(
    id: 'data-ai',
    nameVi: 'Dữ liệu & Trí tuệ nhân tạo',
    nameEn: 'Dữ liệu & AI',
    shortNameVi: 'Dữ liệu & AI',
    shortNameEn: 'Data & AI',
  ),
  CareerField(
    id: 'quality-security',
    nameVi: 'Chất lượng & Bảo mật',
    nameEn: 'Quality & Cybersecurity',
    shortNameVi: 'Chất lượng & Bảo mật',
    shortNameEn: 'Quality & Security',
  ),
  CareerField(
    id: 'infra-ops',
    nameVi: 'Hạ tầng & Vận hành',
    nameEn: 'Infrastructure & Operations',
    shortNameVi: 'Hạ tầng',
    shortNameEn: 'Cloud & DevOps',
  ),
  CareerField(
    id: 'management',
    nameVi: 'Quản trị dự án & sản phẩm',
    nameEn: 'Project & Product Management',
    shortNameVi: 'Quản lý',
    shortNameEn: 'Management',
  ),
];

const List<Niche> mockNiches = [
  // ---- Phát triển phần mềm ----
  Niche(
    id: 'web',
    fieldId: 'software',
    nameVi: 'Lập trình viên Web (Front-end/Full-stack)',
    nameEn: 'Web Developer (Front-end/Full-stack)',
    shortDescriptionVi:
        'Xây dựng giao diện và tính năng cho website, ứng dụng web.',
    shortDescriptionEn:
        'Build user interfaces and features for websites and web applications.',
    isPriority: true,
    jobDescriptionVi:
        'Xây dựng giao diện và các tính năng của website/ứng dụng web: dựng giao diện bằng '
        'HTML/CSS/JavaScript và các framework hiện đại (React, Vue...), kết nối với API '
        'backend để lấy/hiển thị dữ liệu, tối ưu hiệu năng tải trang và khả năng hiển thị '
        'trên nhiều thiết bị (responsive), phối hợp với người thiết kế (designer) và lập '
        'trình viên backend trong suốt quá trình phát triển sản phẩm.',
    jobDescriptionEn:
        'Build user interfaces and features for websites and web applications using '
        'HTML, CSS, JavaScript, and modern frameworks such as React and Vue. Integrate '
        'with backend APIs to retrieve and display data, optimize page loading performance '
        'and responsiveness across devices, and collaborate with designers and backend '
        'developers throughout product development.',
    roadmapVi: [
      'Nhập môn lập trình; Cấu trúc dữ liệu và giải thuật — nền tảng tư duy lập trình',
      'Lập trình hướng đối tượng — chuẩn bị cho việc học các framework JavaScript hiện đại',
      'Thiết kế web/Lập trình Web — HTML, CSS, JavaScript cơ bản, làm việc với DOM',
      'Cơ sở dữ liệu — thiết kế CSDL quan hệ, viết truy vấn SQL cơ bản',
      'Mạng máy tính — hiểu giao thức HTTP, cách hoạt động của REST API',
      'Phát triển ứng dụng Web nâng cao/Framework JavaScript (React, Vue) và Node.js',
      'Đồ án chuyên ngành liên quan đến phát triển web',
    ],
    roadmapEn: [
      'Introduction to Programming; Data Structures and Algorithms — foundations of programming logic',
      'Object-Oriented Programming — preparation for learning modern JavaScript frameworks',
      'Web Design/Web Programming — HTML, CSS, JavaScript fundamentals, and DOM manipulation',
      'Database Systems — relational database design and basic SQL queries',
      'Computer Networks — understanding HTTP protocols and how REST APIs work',
      'Advanced Web Development/JavaScript Frameworks (React, Vue), and Node.js',
      'A specialized project related to web development',
    ],
  ),

  Niche(
    id: 'mobile',
    fieldId: 'software',
    nameVi: 'Lập trình viên Mobile',
    nameEn: 'Mobile Developer',
    shortDescriptionVi:
        'Phát triển ứng dụng cho điện thoại Android, iOS hoặc đa nền tảng.',
    shortDescriptionEn: 'Develop applications for Android, iOS, or cross-platform mobile devices.',
  ),
  Niche(
    id: 'backend',
    fieldId: 'software',
    nameVi: 'Lập trình viên Backend',
    nameEn: 'Backend Developer',
    shortDescriptionVi:
        'Xây dựng máy chủ, API và xử lý dữ liệu phía sau ứng dụng.',
    shortDescriptionEn: 'Build servers, APIs, and the data-processing logic behind applications.',
  ),
  Niche(
    id: 'desktop-game',
    fieldId: 'software',
    nameVi: 'Lập trình Desktop/Game',
    nameEn: 'Desktop/Game Developer',
    shortDescriptionVi: 'Phát triển phần mềm máy tính và trò chơi.',
    shortDescriptionEn: 'Develop desktop software and video games.',
  ),

  // ---- Dữ liệu & AI ----
  Niche(
    id: 'data-analyst',
    fieldId: 'data-ai',
    nameVi: 'Chuyên viên Phân tích dữ liệu',
    nameEn: 'Data Analyst',
    shortDescriptionVi:
        'Thu thập, làm sạch và phân tích dữ liệu để hỗ trợ ra quyết định.',
    shortDescriptionEn:
        'Collect, clean, and analyze data to support decision-making.',
  ),
  Niche(
    id: 'data-engineer',
    fieldId: 'data-ai',
    nameVi: 'Kỹ sư Dữ liệu',
    nameEn: 'Data Engineer',
    shortDescriptionVi:
        'Xây dựng hệ thống thu thập, lưu trữ và xử lý dữ liệu quy mô lớn.',
    shortDescriptionEn: 'Build systems for collecting, storing, and processing large-scale data.',
  ),
  Niche(
    id: 'ai-ml',
    fieldId: 'data-ai',
    nameVi: 'Kỹ sư AI/Machine Learning',
    nameEn: 'AI/Machine Learning Engineer',
    shortDescriptionVi:
        'Xây dựng và triển khai các mô hình học máy cho bài toán thực tế.',
    shortDescriptionEn: 'Build and deploy machine learning models to solve real-world problems.',
    isPriority: true,
    jobDescriptionVi:
        'Nghiên cứu và xây dựng các mô hình học máy để giải quyết bài toán thực tế (phân '
        'loại, dự đoán, nhận diện hình ảnh, xử lý ngôn ngữ...): thu thập và tiền xử lý dữ '
        'liệu, lựa chọn và huấn luyện mô hình, đánh giá độ chính xác, sau đó triển khai mô '
        'hình vào ứng dụng hoặc dịch vụ thực tế.',
    jobDescriptionEn:
        'Research and build machine learning models to solve real-world problems such as '
        'classification, prediction, image recognition, and natural language processing. '
        'Collect and preprocess data, select and train models, evaluate their performance, '
        'and deploy them into practical applications or services.',
    roadmapVi: [
      'Toán cao cấp; Xác suất thống kê — nền tảng toán học cho học máy',
      'Cấu trúc dữ liệu và giải thuật; Lập trình Python',
      'Cơ sở dữ liệu — xử lý và truy vấn dữ liệu phục vụ huấn luyện mô hình',
      'Nhập môn Trí tuệ nhân tạo',
      'Học máy',
      'Học sâu và các ứng dụng thị giác máy tính/xử lý ngôn ngữ tự nhiên',
      'Đồ án chuyên ngành về AI/Machine Learning',
    ],
    roadmapEn: [
      'Advanced Mathematics; Probability and Statistics — mathematical foundations for machine learning',
      'Data Structures and Algorithms; Python Programming',
      'Database Systems — processing and querying data for model training',
      'Introduction to Artificial Intelligence',
      'Machine Learning',
      'Deep Learning and applications in Computer Vision/Natural Language Processing',
      'A specialized project in AI/Machine Learning',
    ],
  ),

  // ---- Chất lượng & Bảo mật ----
  Niche(
    id: 'qa-tester',
    fieldId: 'quality-security',
    nameVi: 'Chuyên viên QA/Tester',
    nameEn: 'QA Engineer/Software Tester',
    shortDescriptionVi:
        'Kiểm tra chất lượng phần mềm, tìm lỗi trước khi đến tay người dùng.',
    shortDescriptionEn: 'Test software quality and identify defects before products reach users.',
  ),
  Niche(
    id: 'security',
    fieldId: 'quality-security',
    nameVi: 'Chuyên viên An toàn thông tin',
    nameEn: 'Cybersecurity Specialist',
    shortDescriptionVi:
        'Phát hiện lỗ hổng, kiểm thử xâm nhập và ứng phó sự cố an ninh mạng.',
    shortDescriptionEn: 'Identify vulnerabilities, conduct penetration testing, and respond to cybersecurity incidents.',
    isPriority: true,
    jobDescriptionVi:
        'Đánh giá và phát hiện lỗ hổng bảo mật của hệ thống/ứng dụng, thực hiện kiểm thử '
        'xâm nhập cơ bản trong môi trường được cho phép, giám sát và hỗ trợ ứng '
        'phó khi có sự cố an ninh mạng, tham gia xây dựng và duy trì các chính sách/quy '
        'trình bảo mật cho tổ chức.',
    jobDescriptionEn:
        'Assess systems and applications for security vulnerabilities, conduct basic '
        'penetration testing in authorized environments, monitor and help respond to '
        'cybersecurity incidents, and contribute to developing and maintaining an '
        'organization’s security policies and procedures.',
    roadmapVi: [
      'Mạng máy tính; Hệ điều hành — hiểu nguyên lý hoạt động của hệ thống cần bảo vệ',
      'Cơ sở dữ liệu — hiểu các lỗ hổng liên quan đến dữ liệu (ví dụ SQL Injection)',
      'Nhập môn An toàn thông tin',
      'Mật mã học',
      'An ninh mạng',
      'Kiểm thử xâm nhập trong môi trường lab/CTF hợp lệ',
      'Đồ án chuyên ngành về An toàn thông tin',
    ],
    roadmapEn: [
      'Computer Networks; Operating Systems — understand how the systems being protected work',
      'Database Systems — understand data-related vulnerabilities such as SQL Injection',
      'Introduction to Information Security',
      'Cryptography',
      'Network Security',
      'Penetration testing in authorized lab/CTF environments',
      'A specialized project in Information Security',
    ],
  ),

  // ---- Hạ tầng & Vận hành ----
  Niche(
    id: 'sys-net-admin',
    fieldId: 'infra-ops',
    nameVi: 'Quản trị hệ thống & mạng',
    nameEn: 'System and Network Administrator',
    shortDescriptionVi:
        'Vận hành, giám sát máy chủ và hạ tầng mạng của tổ chức.',
    shortDescriptionEn: 'Operate and monitor an organization’s servers and network infrastructure.',
  ),
  Niche(
    id: 'cloud-devops',
    fieldId: 'infra-ops',
    nameVi: 'Kỹ sư Cloud/DevOps',
    nameEn: 'Cloud/DevOps Engineer',
    shortDescriptionVi:
        'Triển khai, tự động hoá và vận hành ứng dụng trên nền tảng đám mây.',
    shortDescriptionEn:
        'Deploy, automate, and operate applications on cloud platforms.',
    isPriority: true,
    jobDescriptionVi:
        'Triển khai và vận hành hạ tầng ứng dụng trên nền tảng điện toán đám mây (AWS, '
        'GCP, Azure...), xây dựng và duy trì pipeline tích hợp/triển khai liên tục (CI/CD), '
        'đóng gói ứng dụng bằng container (Docker) và điều phối (Kubernetes) khi cần, giám '
        'sát tình trạng hoạt động của hệ thống.',
    jobDescriptionEn:
        'Deploy and operate application infrastructure on cloud platforms such as AWS, '
        'GCP, and Azure. Build and maintain continuous integration and delivery (CI/CD) '
        'pipelines, package applications using containers such as Docker, orchestrate '
        'them with Kubernetes when needed, and monitor system health.',
    roadmapVi: [
      'Mạng máy tính; Hệ điều hành — nền tảng hạ tầng hệ thống',
      'Lập trình (Python/Shell script) — tự động hoá các tác vụ vận hành',
      'Cơ sở dữ liệu — vận hành và sao lưu dữ liệu trên môi trường cloud',
      'Nhập môn Điện toán đám mây',
      'DevOps & CI/CD — Docker, pipeline triển khai tự động',
      'Đồ án chuyên ngành về triển khai/vận hành hệ thống',
    ],
    roadmapEn: [
      'Computer Networks; Operating Systems — foundations of system infrastructure',
      'Programming (Python/Shell scripting) — automate operational tasks',
      'Database Systems — operate and back up data in cloud environments',
      'Introduction to Cloud Computing',
      'DevOps & CI/CD — Docker and automated deployment pipelines',
      'A specialized project in system deployment and operations',
    ],
  ),

  // ---- Quản trị dự án & sản phẩm ----
  Niche(
    id: 'ba',
    fieldId: 'management',
    nameVi: 'Chuyên viên Phân tích nghiệp vụ',
    nameEn: 'Business Analyst',
    shortDescriptionVi:
        'Cầu nối giữa nhu cầu kinh doanh và đội ngũ phát triển phần mềm.',
    shortDescriptionEn: 'Bridge business needs and software development teams.',
  ),
  Niche(
    id: 'pm',
    fieldId: 'management',
    nameVi: 'Quản lý dự án',
    nameEn: 'Project Manager',
    shortDescriptionVi:
        'Lập kế hoạch, điều phối nguồn lực và theo dõi tiến độ dự án.',
    shortDescriptionEn:
        'Plan projects, coordinate resources, and track project progress.',
  ),
  Niche(
    id: 'po',
    fieldId: 'management',
    nameVi: 'Quản lý sản phẩm',
    nameEn: 'Product Owner',
    shortDescriptionVi:
        'Định hướng sản phẩm và ưu tiên tính năng theo giá trị người dùng.',
    shortDescriptionEn:
        'Define product direction and prioritize features based on user value.',
  ),
];
