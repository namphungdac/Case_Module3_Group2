drop database englishWeb;
create database if not exists englishWeb;
use englishWeb;

create table User(
	userID int primary key auto_increment not null,
    userEmail varchar(50) not null,
    userPassword varchar(50) not null,
    role varchar(50) default 'admin'
);

create table Customer (
	customerID int primary key auto_increment not null,
    customerName varchar(50) not null,
    customerAddress varchar(50) not null,
    customerAge int
);

create table Course (
	courseID int primary key auto_increment not null,
    userID int,
    imageCourseLink varchar(100) not null,
    titleCourse nvarchar(10000) not null,
    contentCourse nvarchar (10000) not null,
    priceCourse float check (priceCourse >0) not null,
    foreign key (userID) references User (userID)
);

create table Orders (
	orderID int primary key auto_increment not null,
    orderDate date,
    customerID int not null,
    foreign key (customerID) references Customer(customerID)
);

create table OrderDetail (
	orderID int not null ,
    courseID int not null,
    primary key (orderID, courseID),
    foreign key (orderID) references Orders (OrderID),
    foreign key (courseID) references Course (courseID)
);

insert into user (userEmail, userPassword) values 
('hieu_admin@gmail.com','123'),
('ducanh_admin@gmail.com','123'), 
('nam_admin@gmail.com','123');

insert into Course(priceCourse,imageCourseLink,titleCourse,contentCourse)
values('3000000','/public/img/KH1.jpg','Khóa học Tiếng Anh Trung học Cơ sở',
'Khóa học Tiếng Anh Trung học Cơ sở: Dành cho các em học sinh lớp 6,7,8,9
Giáo Viên: Các thầy cô là thạc sĩ, tiến sĩ của Đại học Ngoại Ngữ, ĐHQG Hà Nội.
Tổng quan: Chương trình được thiết kế dành riêng cho độ tuổi của học sinh Trung học Cơ sở (lớp 6,7,8,9).
Tham gia khóa học này, học sinh sẽ:
• có được kiến thức ngữ pháp vững chắc để học tốt ở trường và thi vào các trường phổ thông trung học, đặc biệt là các trường chuyên. 
• song song phát triển bốn kỹ năng nghe, nói, đọc, viết để có thể thực sự sử dụng được ngôn ngữ này trong giao tiếp.
• có cơ hội tiếp cận với hệ thống bài tập, tài liệu đa dạng (sách, video, bài hát,trò chơi, sách kỹ thuật số), cũng như các hoạt động luyện tập ngữ pháp và giao tiếp đa dạng trên lớp. 
• phát triển tình yêu ngôn ngữ này trong một môi trường học tập hiện đại, năng động, vui vẻ, và mang tính thúc đẩy. 
• phát triểnsự tự tin và các kỹ năng mềm như làm việc nhóm, thương thuyết, thông qua các việc tham gia các hoạt động theo cặp hoặc nhóm. 
• có thể dễ dàng chuyển sang học tốt các chương trình thi quốc tế như IELTS, TOEFL ibt sau khi hoàn thành khóa học vì các em đã có được nền tảng vững chắc về ngữ pháp và từ vựng cũng như bốn kỹ năng.'),
('4500000','/public/img/KH2.jpg','Khóa học Nâng cấp 1',
'Khóa học Cơ Bản: Dành cho người mới học tiếng Anh hoặc sau một thời gian dài không sử dụng muốn bổ sung kiến thức từ đầu.
Giáo Viên: cô Thanh Nhã, thạc sĩ chuyên ngành giảng dạy tiếng Anh (TESOL) của đại học Queensland (Úc), và các thầy cô là thạc sĩ, tiến sĩ của Đại học Ngoại Ngữ, ĐHQG Hà Nội.
Khóa học gồm 62,5 giờ trong 25 buổi, mỗi tuần 2 buổi, mỗi buổi 2,5 tiếng thời gian học từ 18h đến 20h30.
Tổng quan: Khóa học chú trọng xây dựng và phát triển vốn ngữ pháp, từ vựng theo hướng giao tiếp để giúp người học không chỉ hiểu mà còn sử dụng được những kiến thức này trong nói và viết. Đồng thời phát triển bốn kỹ năng Nghe-Nói-Đọc-Viết để các em có nền tảng vững chắc trước khi học tiếp lên Nâng Cấp 2, PRE – IELTS và sau đó là IELTS.'),
('6000000','/public/img/KH3.jpg','Khóa học Nâng Cấp 2',
'Khóa học Nâng Cấp 2: Dành cho các em có vốn từ vựng và ngữ pháp cơ bản, gồm 62,5 giờ trong 25 buổi, mỗi tuần 2 buổi, mỗi buổi 2,5 tiếng thời gian học từ 18h đến 20h30.
Giáo viên: cô Thanh Nhã, thạc sĩ chuyên ngành giảng dạy tiếng Anh (TESOL) của đại học Queensland (Úc), và các thầy cô là thạc sĩ, tiến sĩ của Đại học Ngoại Ngữ, ĐHQG Hà Nội.
Tổng quan: Là lớp học nền tảng nhằm tăng cường 4 kỹ năng nghe nói đọc viết. Đặc biệt khóa học chú trọng phát triển vốn từ vựng và tăng cường kiến thức ngữ pháp theo hướng giao tiếp để giúp người học không chỉ hiểu mà còn sử dụng được những kiến thức này trong nói và viết. Khóa học nhằm tạo nền tảng vững chắc cho các em trước khi học tiếp lên PRE - IELTS và sau đó là IELTS cũng như kỹ năng giao tiếp cơ bản để phục vụ cho công việc.'),
('7500000','/public/img/KH4.jpg','Khóa học Pre-IELTS',
'Khóa học Pre-IELTS gồm 62,5 giờ trong 25 buổi, mỗi tuần 2 buổi, mỗi buổi 2,5 tiếng thời gian học từ 18h đến 20h30.
Trình độ đầu vào: Pre-Intermediate and Intermediate.
Giáo viên: cô Thanh Nhã, thạc sĩ chuyên ngành giảng dạy tiếng Anh (TESOL) của đại học Queensland (Úc), và các thầy cô là thạc sĩ, tiến sĩ của Đại học Ngoại Ngữ, ĐHQG Hà Nội.
Tổng quan: Là lớp học nhằm hoàn thiện dần 4 kỹ năng. PRE IELTS cung cấp kiến thức tiếng Anh trong cả bốn kỹ năng nhằm giúp các em có nền tảng kiến thức vững vàng để tiếp nhận thành công kiến thức trong khóa học IETLS hay cho những mục đích giao tiếp phục vụ cho công việc.

- Khóa học tiếp tục chú trọng phát triển vốn từ vựng và tăng cường kiến thức ngữ pháp theo hướng giao tiếp để giúp người học không chỉ hiểu mà còn sử dụng được những kiến thức này trong nói và viết.'),
('9000000','/public/img/KH5.jpg','Khóa học IELTS INTERMEDIATE',
'Khóa học kéo dài 27 buổi, 67.5 giờ học (bao gồm 2 buổi thi giữa kỳ và cuối kỳ). Mỗi tuần học 2 buổi, mỗi buổi 2,5 tiếng. Thời gian học thường từ 18h đến 20h30.
Điều kiện xếp lớp: điểm thi đầu vào trung bình ba môn nghe, đọc, viết đạt 6.0-6.4 (theo thang điểm 10), và điểm viết không dưới 6.0.  Bài thi xếp lớp sử dụng tiếng Anh tổng quát (general English), không phải bài thi IELTS.
Giáo viên: là giảng viên tiếng Anh của Đại học Ngoại ngữ, Đại học Quốc gia, Đại học Ngoại thương và các tổ chức giáo dục uy tín tại Hà Nội. Các thầy cô đều đã có kinh nghiệm thi và giảng dạy IELTS và hiện đang giảng dạy tại Trung tâm tiếng Anh Nhã Trần.
Khoá học nhằm giúp trang bị cho các em:

- Các chiến thuật làm bài thi ở cả bốn kỹ năng

- Từ vựng ở cấp độ cao cho phần Speaking (ví dụ idioms, phrasal verbs, collocations) cũng như cách thức trả lời các câu hỏi để các em có thể thể hiện tốt khả năng ngôn ngữ của mình trong phần thi nói cũng như cho mục đích giao tiếp xã hội và công việc sau này.

- Từ vựng cho một loạt các chủ đề và chiến thuật làm bài cũng như các template cho Writing Task 1 & Task 2. Các em cũng sẽ được tiếp cận các bài văn mẫu hay cho các chủ đề đa dạng.

- Kỹ năng làm bài hiệu quả dưới sức ép thời gian thông qua việc luyện tập chuyên sâu trên lớp dưới hướng dẫn của giáo viên và việc bắt buộc phải hoàn thành bài tập về nhà.

- Trên lớp giáo viên sẽ dành phần lớn thời gian cho nói và viết, hai kỹ năng đòi hỏi rất nhiều nỗ lực và một phương pháp dạy hiệu quả để giúp học sinh nâng band điểm. Phần đọc và nghe là phần mà giáo viên sẽ hướng dẫn học sinh cách học và giao bài tập sau mỗi buổi học để em có cơ hội luyện tập liên tục trong các buổi của khóa học.'),
('10500000','/public/img/KH6.jpg','Khóa học IELTS ADVANCED',
'Khóa học kéo dài 35 buổi với 87.5 giờ học (bao gồm 2 buổi thi giữa kỳ và cuối kỳ).
Điều kiện xếp lớp: điểm thi đầu vào trung bình ba môn nghe, đọc, viết trên 6.5 (theo thang điểm 10), và điểm viết không dưới 6.5.  Bài thi xếp lớp sử dụng tiếng Anh tổng quát (general English), không phải bài thi IELTS.
Giáo viên: Khóa học sẽ do Cô Nhã trực tiếp giảng dạy.
 Khoá học nhằm giúp trang bị cho các em:

- Các chiến thuật làm bài thi ở cả bốn kỹ năng

- Từ vựng ở cấp độ cao cho phần Speaking (ví dụ idioms, phrasal verbs, collocations) cũng như cách thức trả lời các câu hỏi để các em có thể thể hiện tốt khả năng ngôn ngữ của mình trong phần thi nói cũng như cho mục đích giao tiếp xã hội và công việc sau này.

- Từ vựng cho một loạt các chủ đề và chiến thuật làm bài cũng như các template cho Writing Task 1 & Task 2. Các em cũng sẽ được tiếp cận các bài văn mẫu hay cho các chủ đề đa dạng.

- Kỹ năng làm bài hiệu quả dưới sức ép thời gian thông qua việc luyện tập chuyên sâu trên lớp dưới hướng dẫn của giáo viên và việc bắt buộc phải hoàn thành bài tập về nhà.

- Trên lớp giáo viên sẽ dành phần lớn thời gian cho nói và viết, hai kỹ năng đòi hỏi rất nhiều nỗ lực và một phương pháp dạy hiệu quả để giúp học sinh nâng band điểm. Phần đọc và nghe là phần mà giáo viên sẽ hướng dẫn học sinh cách học và giao bài tập sau mỗi buổi học để em có cơ hội luyện tập liên tục trong các buổi của khóa học.');

 


 
 

 
 
 
 
 

 










