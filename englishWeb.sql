
drop database englishWeb;
create database if not exists englishWeb;
use englishWeb;

create table User(
	userID int primary key auto_increment not null,
    userEmail varchar(50) unique not null,
    userPassword varchar(50) not null,
    role varchar(50) default 'admin'
);

create table Customer (
	customerID int primary key auto_increment not null,
    customerName varchar(50) not null,
    customerAddress varchar(50) not null,
    customerAge int,
    userID int,
    foreign key (userID) references User(userID)
);

-- insert into Customer (customerName, customerAddress, customerAge, userID) value 
-- ('aaa', 'bbb', 20, (select max(userID) from User));

create table Course (
	courseID int primary key auto_increment not null,
    imageCourseLink varchar(100) not null,
    titleCourse nvarchar(100) not null,
    contentCourse nvarchar (1000) not null,
    describeCourse nvarchar(10000),
    priceCourse float check (priceCourse >0) not null
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


insert into Course(priceCourse,imageCourseLink,titleCourse,contentCourse,describeCourse)
values('3000000','/public/img/courses-1.jpg','Khóa học Tiếng Anh Trung học Cơ sở',
'Dành cho các em học sinh lớp 6,7,8,9 để củng cố kiến thức ngữ pháp vững chắc để học tốt ở trường và thi vào các trường PTTH.',
'
<section class="container">
    <div class="row">
        <!-- main content -->
        <section class="col-sm-12 maincontent" style="width:100%;">
            <h3 class="title-orangered">Kh&#243;a học Tiếng Anh Trung học Cơ sở</h3>
            <p>
                <img class="float-right ml-4" width="360" src="/public/img/courses-1.jpg" alt="KH1">

            <div class="col-sm-12 text-justify">
                <p><strong>Kh&oacute;a học Tiếng Anh Trung học Cơ sở</strong>: D&agrave;nh cho c&aacute;c em học sinh
                    lớp <strong>6,7,8,9</strong></p>

                <p><strong>Gi&aacute;o Vi&ecirc;n</strong>:&nbsp;C&aacute;c thầy c&ocirc; l&agrave; thạc sĩ, tiến sĩ của
                    <strong>Đại học Ngoại Ngữ, ĐHQG H&agrave; Nội.</strong><br/>
                    <strong>Tổng quan</strong>:&nbsp;Chương tr&igrave;nh được thiết kế d&agrave;nh ri&ecirc;ng cho độ
                    tuổi của học sinh <strong>Trung học Cơ sở (lớp 6,7,8,9).</strong><br/>
                    Tham gia kh&oacute;a học n&agrave;y, học sinh sẽ:<br/>
                    &bull; C&oacute; được kiến thức ngữ ph&aacute;p vững chắc để học tốt ở trường v&agrave; thi v&agrave;o
                    c&aacute;c trường phổ th&ocirc;ng trung học, đặc biệt l&agrave; c&aacute;c trường chuy&ecirc;n.&nbsp;<br/>
                    &bull; Song song ph&aacute;t triển bốn kỹ năng nghe, n&oacute;i, đọc, viết để c&oacute; thể thực sự
                    sử dụng được ng&ocirc;n ngữ n&agrave;y trong giao tiếp.<br/>
                    &bull; C&oacute; cơ hội tiếp cận với hệ thống b&agrave;i tập, t&agrave;i liệu đa dạng (s&aacute;ch,
                    video, b&agrave;i h&aacute;t,tr&ograve; chơi, s&aacute;ch kỹ thuật số), cũng như c&aacute;c hoạt
                    động luyện tập ngữ ph&aacute;p v&agrave; giao tiếp đa dạng tr&ecirc;n lớp.&nbsp;<br/>
                    &bull; Ph&aacute;t triển t&igrave;nh y&ecirc;u ng&ocirc;n ngữ n&agrave;y trong một m&ocirc;i trường
                    học tập hiện đại, năng động, vui vẻ, v&agrave; mang t&iacute;nh th&uacute;c đẩy.&nbsp;<br/>
                    &bull; Ph&aacute;t triểnsự tự tin v&agrave; c&aacute;c kỹ năng mềm như l&agrave;m việc nh&oacute;m,
                    thương thuyết, th&ocirc;ng qua c&aacute;c việc tham gia c&aacute;c hoạt động theo cặp hoặc nh&oacute;m.&nbsp;<br/>
                    &bull; C&oacute; thể dễ d&agrave;ng chuyển sang học tốt c&aacute;c chương tr&igrave;nh thi quốc tế
                    như <strong>IELTS, TOEFL ibt</strong> sau khi ho&agrave;n th&agrave;nh kh&oacute;a học v&igrave; c&aacute;c
                    em đ&atilde; c&oacute; được nền tảng vững chắc về ngữ ph&aacute;p v&agrave; từ vựng cũng như bốn kỹ
                    năng.<br/>
                    Khi n&agrave;o c&aacute;c em c&oacute; thể tham gia kh&oacute;a học n&agrave;y:&nbsp;<br/>
                    -Bất cứ thời gian n&agrave;o trong năm.Phụ huynh hoặc học sinh c&oacute; thể li&ecirc;n hệ với c&ocirc;
                    <strong>V&acirc;n Anh</strong> (điện thoại: <strong>0917511052</strong>) để thảo luận thời gian đến
                    l&agrave;m b&agrave;i thi đ&aacute;nh gi&aacute; tr&igrave;nh độ. B&agrave;i thi bao gồm phần b&agrave;i
                    ngữ ph&aacute;p, nghe, đọc, viết, v&agrave;/hoặc xem video. Kết quả b&agrave;i thi sẽ c&oacute; chậm
                    nhất một tuần sau khi thi. Sau đ&oacute; học sinh sẽ được xếp v&agrave;o lớp ph&ugrave; hợp.</p>

            </div>
        </section>
    </div>
</section>
'),
('4500000','/public/img/courses-2.jpg','Khóa học Nâng cấp 1',
'Khóa học Cơ Bản: Dành cho người mới học tiếng Anh hoặc sau một thời gian dài không sử dụng muốn bổ sung kiến thức từ đầu.',
'
<section class="container">
    <div class="row">
        <!-- main content -->
        <section class="col-sm-12 maincontent" style="width:100%;">
            <h3 class="title-orangered">Kh&#243;a học N&#226;ng cấp 1</h3>
            <p>
                <img class="float-right ml-4" width="360" src="/public/img/courses-2.jpg" alt="KH2">

            <div class="col-sm-12 text-justify">
                <blockquote>
                    <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif"><strong>Kh&oacute;a học Cơ Bản:</strong>&nbsp;D&agrave;nh cho người mới học tiếng Anh hoặc sau một thời gian d&agrave;i kh&ocirc;ng sử dụng muốn bổ sung kiến thức từ đầu.<br/>
Gi&aacute;o Vi&ecirc;n:&nbsp;c&ocirc; <strong>Thanh Nh&atilde;</strong>, thạc sĩ chuy&ecirc;n ng&agrave;nh giảng dạy tiếng Anh (<strong>TESOL</strong>) của đại học <strong>Queensland</strong> (&Uacute;c), v&agrave; c&aacute;c thầy c&ocirc; l&agrave; thạc sĩ, tiến sĩ của <strong>Đại học Ngoại Ngữ, ĐHQG H&agrave; Nội</strong>.<br/>
Kh&oacute;a học gồm 62,5 giờ trong 25&nbsp;buổi, mỗi tuần 2 buổi, mỗi buổi 2,5 tiếng thời gian học từ 18h đến 20h30.</span></span>
                    </p>
                </blockquote>

                <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif">Điểm thi đầu v&agrave;o trung b&igrave;nh ba m&ocirc;n nghe, đọc, viết dưới&nbsp;3.5&nbsp;</span></span>
                </p>

                <p><span style="font-size:16px"><span
                        style="font-family:Times New Roman,Times,serif"><strong>Tổng quan</strong>:&nbsp;Kh&oacute;a học ch&uacute; trọng x&acirc;y dựng v&agrave; ph&aacute;t triển vốn ngữ ph&aacute;p, từ vựng theo hướng giao tiếp để gi&uacute;p người học kh&ocirc;ng chỉ hiểu m&agrave; c&ograve;n sử dụng được những kiến thức n&agrave;y trong n&oacute;i v&agrave; viết. Đồng thời ph&aacute;t triển bốn kỹ năng <strong>Nghe-N&oacute;i-Đọc-Viết</strong> để c&aacute;c em c&oacute; nền tảng vững chắc trước khi học tiếp l&ecirc;n <strong>N&acirc;ng Cấp 2, PRE &ndash; IELTS</strong> v&agrave; sau đ&oacute; l&agrave; <strong>IELTS</strong>.&nbsp;<br/>
Gi&aacute;o tr&igrave;nh:&nbsp;Chương tr&igrave;nh học do c&ocirc; <strong>Thanh Nh&atilde;</strong> v&agrave; nh&oacute;m gi&aacute;o vi&ecirc;n của <strong>Đại học Ngoại ngữ, Đại học Quốc gia</strong> thiết kế, được tổng hợp v&agrave; x&acirc;y dựng hệ thống theo chủ đề từ nhiều s&aacute;ch về nghe, đọc, viết, từ vựng, ngữ ph&aacute;p, ph&aacute;t &acirc;m của nh&agrave; xuất bản s&aacute;ch Cambridge, Macmillan, Pearson Longman.</span></span>
                </p>

                <p><strong>LỚP NC1-23B&nbsp;: Khai giảng 6/7/2023, Lịch học : 18h ng&agrave;y thứ hai&nbsp;v&agrave; thứ
                    năm.</strong></p>
            </div>
        </section>
    </div>
</section>
'),
('6000000','/public/img/courses-3.jpg','Khóa học Nâng Cấp 2',
'Lớp học nền tảng nhằm tăng cường 4 kỹ năng nghe nói đọc viết dành cho người có vốn từ vựng và ngữ pháp cơ bản',
'
<section class="container">
    <div class="row">
        <!-- main content -->
        <section class="col-sm-12 maincontent" style="width:100%;">
            <h3 class="title-orangered">Kh&#243;a học N&#226;ng Cấp 2</h3>
            <p>
                <img class="float-right ml-4" width="360" src="/public/img/courses-3.jpg" alt="KH3">
            <div class="col-sm-8 text-justify">
            <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif"><strong>Kh&oacute;a học N&acirc;ng Cấp 2:</strong>&nbsp;D&agrave;nh cho c&aacute;c em c&oacute; vốn từ vựng v&agrave; ngữ ph&aacute;p cơ bản, gồm 62,5 giờ trong 25&nbsp;buổi, mỗi tuần 2 buổi, mỗi buổi 2,5 tiếng thời gian học từ 18h đến 20h30.</span></span></p>

            <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif">Điểm thi đầu v&agrave;o trung b&igrave;nh ba m&ocirc;n nghe, đọc, viết từ 3.5&nbsp;đến 4.9</span></span></p>

            <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif"><strong>Tr&igrave;nh độ đầu v&agrave;o:</strong>&nbsp;High Elementary and near Pre Intermediate.<br />
<strong>Tổng quan</strong>: L&agrave; lớp học nền tảng nhằm tăng cường 4 kỹ năng nghe n&oacute;i đọc viết. Đặc biệt kh&oacute;a học ch&uacute; trọng ph&aacute;t triển vốn từ vựng v&agrave; tăng cường kiến thức ngữ ph&aacute;p theo hướng giao tiếp để gi&uacute;p người học kh&ocirc;ng chỉ hiểu m&agrave; c&ograve;n sử dụng được những kiến thức n&agrave;y trong n&oacute;i v&agrave; viết. Kh&oacute;a học nhằm tạo nền tảng vững chắc cho c&aacute;c em trước khi học tiếp l&ecirc;n PRE - IELTS v&agrave; sau đ&oacute; l&agrave; IELTS cũng như kỹ năng giao tiếp cơ bản để phục vụ cho c&ocirc;ng việc.<br />
<strong>Gi&aacute;o vi&ecirc;n:</strong>&nbsp;c&ocirc; Thanh Nh&atilde;, thạc sĩ chuy&ecirc;n ng&agrave;nh giảng dạy tiếng Anh (TESOL) của đại học Queensland (&Uacute;c), v&agrave; c&aacute;c thầy c&ocirc; l&agrave; thạc sĩ, tiến sĩ của Đại học Ngoại Ngữ, ĐHQG H&agrave; Nội.<br />
<strong>Gi&aacute;o tr&igrave;nh:</strong>&nbsp;Chương tr&igrave;nh học do c&ocirc; Thanh Nh&atilde;, v&agrave; nh&oacute;m gi&aacute;o vi&ecirc;n của Đại học Ngoại ngữ, Đại học Quốc gia thiết kế, được tổng hợp v&agrave; x&acirc;y dựng hệ thống theo chủ đề từ nhiều s&aacute;ch về nghe, đọc, viết, từ vựng, ngữ ph&aacute;p, ph&aacute;t &acirc;m của nh&agrave; xuất bản s&aacute;ch Cambridge, Macmillan, Pearson Longman...</span></span></p>

            <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif"><strong>LỚP NC2-23N&nbsp;: Khai giảng 11/6/2023, Lịch học : 18h ng&agrave;y thứ năm&nbsp;v&agrave; 14h Chủ Nhật.</strong></span></span></p>

            <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif"><strong>LỚP NC2-23P&nbsp;: Khai giảng 22/6/2023, Lịch học : 18h ng&agrave;y thứ hai&nbsp;v&agrave; thứ năm.</strong></span></span></p>

        </div>
        </section>
    </div>
</section>
'),
('7500000','/public/img/courses-4.jpg','Khóa học Pre-IELTS',
'Cung cấp kiến thức trong cả bốn kỹ năng nhằm giúp các em có nền tảng vững vàng để tiếp nhận kiến thức trong khóa học IETLS.',
'
<section class="container">
    <div class="row">
        <!-- main content -->
        <section class="col-sm-12 maincontent" style="width:100%;">
            <h3 class="title-orangered">Kh&#243;a học Pre-IELTS</h3>
            <p>
                <img class="float-right ml-4" width="360" src="/public/img/courses-4.jpg" alt="KH4">
            <div class="col-sm-12 text-justify">
                <p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:16px"><strong>Kh&oacute;a học Pre-IELTS</strong> gồm 62,5 giờ trong 25&nbsp;buổi, mỗi tuần 2 buổi, mỗi buổi 2,5 tiếng thời gian học từ 18h đến 20h30</span></span>
                </p>

                <p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:16px">Điểm thi đầu v&agrave;o trung b&igrave;nh ba m&ocirc;n nghe, đọc, viết từ 5 đến 5.9</span></span>
                </p>

                <p><span style="font-family:Times New Roman,Times,serif"><span
                        style="font-size:16px"><strong>Tổng quan</strong>:&nbsp;L&agrave; lớp học nhằm ho&agrave;n thiện dần 4 kỹ năng.&nbsp;<strong>PRE IELTS</strong>&nbsp;cung cấp kiến thức tiếng Anh trong cả bốn kỹ năng nhằm gi&uacute;p c&aacute;c em c&oacute; nền tảng kiến thức vững v&agrave;ng để tiếp nhận th&agrave;nh c&ocirc;ng kiến thức trong kh&oacute;a học&nbsp;<strong>IETLS</strong>&nbsp;hay cho những mục đ&iacute;ch giao tiếp phục vụ cho c&ocirc;ng việc.</span></span>
                </p>

                <p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:16px">- Kh&oacute;a học tiếp tục ch&uacute; trọng ph&aacute;t triển vốn từ vựng v&agrave; tăng cường kiến thức ngữ ph&aacute;p theo hướng giao tiếp để gi&uacute;p người học kh&ocirc;ng chỉ hiểu m&agrave; c&ograve;n sử dụng được những kiến thức n&agrave;y trong n&oacute;i v&agrave; viết.</span></span>
                </p>

                <p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:16px">- Tr&igrave;nh độ đầu v&agrave;o:&nbsp;<strong>Pre-Intermediate and Intermediate</strong></span></span>
                </p>

                <p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:16px">- Gi&aacute;o vi&ecirc;n:&nbsp;c&ocirc; <strong>Thanh Nh&atilde;</strong>, thạc sĩ chuy&ecirc;n ng&agrave;nh giảng dạy tiếng Anh (<strong>TESOL</strong>) của đại học <strong>Queensland </strong>(&Uacute;c), v&agrave; c&aacute;c thầy c&ocirc; l&agrave; thạc sĩ, tiến sĩ của <strong>Đại học Ngoại Ngữ, ĐHQG H&agrave; Nội</strong>.<br/>
- Gi&aacute;o tr&igrave;nh:&nbsp;Chương tr&igrave;nh học do c&ocirc; <strong>Thanh Nh&atilde;</strong> v&agrave; nh&oacute;m gi&aacute;o vi&ecirc;n của<strong> Đại học Ngoại ngữ, Đại học Quốc gia&nbsp;</strong>thiết kế, được tổng hợp v&agrave; x&acirc;y dựng hệ thống theo chủ đề từ nhiều s&aacute;ch về nghe, đọc, viết, từ vựng, ngữ ph&aacute;p, ph&aacute;t &acirc;m của nh&agrave; xuất bản s&aacute;ch Cambridge, Macmillan, Pearson Longman...</span></span>
                </p>

                <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif"><strong>LỚP PRE-IELTS 23P&nbsp;: Khai giảng 6/6/2023, Lịch học : 18h ng&agrave;y thứ ba&nbsp;v&agrave; thứ s&aacute;u.</strong></span></span>
                </p>
            </div>
        </section>
    </div>
</section>
'),
('9000000','/public/img/courses-5.jpg','Khóa học IELTS INTERMEDIATE',
'Lớp học này giúp học sinh đạt mức điểm tối thiểu 6.0. Khoảng điểm phổ biến sau khóa học là 6.5-7. ',
'<section class="col-sm-12 maincontent" style="width:100%;">
            <h3 class="title-orangered">Kh&#243;a học IELTS INTERMEDIATE</h3>
            <p>
                <img class="float-right ml-4"  width="300" src="/public/img/courses-5.jpg" alt="KH5">
            <div class="col-sm-12 text-justify">
                <p><span style="background-color:white"><span
                        style="font-family:Times New Roman,serif"><strong><span style="background-color:white">- Mục ti&ecirc;u:</span></strong><span
                        style="background-color:white">&nbsp;gi&uacute;p học sinh đạt mức điểm tối thiểu 6.0. Khoảng điểm phổ biến của c&aacute;c em sau kh&oacute;a học l&agrave; 6.5-7. V&agrave; lu&ocirc;n c&oacute; một nh&oacute;m sẽ đạt tr&ecirc;n mức điểm n&agrave;y.</span></span></span></span>
                </p>

                <p><span
                        style="font-family:Times New Roman,Times,serif"><span style="font-size:16px">Đối với c&aacute;c kho&aacute; học IELTS, nếu học sinh&nbsp;thi đạt dưới mức điểm tối thiểu do kho&aacute; học đề ra, &nbsp;sẽ được bố tr&iacute; học lại một phần của kh&oacute;a học để n&acirc;ng điểm. Nhưng c&oacute; một điều kiện nhỏ l&agrave; học sinh&nbsp;phải tu&acirc;n thủ những nguy&ecirc;n tắc học tập m&agrave; c&ocirc; đề ra v&agrave; b&agrave;i tập trong kh&oacute;a học em phải ho&agrave;n th&agrave;nh .</span></span>
                </p>

                <p><span style="font-size:16px"><span
                        style="background-color:white"><span style="font-family:Times New Roman,serif"><span
                        style="background-color:white">-Số lượng học sinh mỗi lớp: 20-24 bạn.</span></span></span></span>
                </p>

                <p><span style="font-size:16px"><span
                        style="background-color:white"><span style="font-family:Times New Roman,serif"><span
                        style="background-color:white">-Kh&oacute;a học&nbsp;k&eacute;o d&agrave;i 27 buổi,&nbsp;67.5 giờ học<strong>&nbsp;</strong>(bao gồm 2 buổi thi giữa kỳ v&agrave; cuối kỳ).&nbsp;Mỗi tuần học 2 buổi, mỗi buổi 2,5 tiếng. Thời gian học thường từ 18h đến 20h30.</span></span></span></span>
                </p>

                <p><span style="font-size:16px"><span
                        style="font-family:Times New Roman,Times,serif">-<strong>Điều kiện xếp lớp:</strong></span></span><span
                        style="font-family:Times New Roman,serif; font-size:16px">&nbsp;điểm thi đầu v&agrave;o trung b&igrave;nh ba m&ocirc;n nghe, đọc, viết đạt 6.0-6.4 (theo thang điểm 10),&nbsp;v&agrave; điểm viết kh&ocirc;ng&nbsp;dưới 6.0.&nbsp;&nbsp;B&agrave;i thi xếp lớp sử dụng tiếng Anh&nbsp;tổng qu&aacute;t (general English), kh&ocirc;ng phải b&agrave;i thi IELTS.</span>
                </p>

                <p>-&nbsp;<span style="font-size:12pt"><span
                        style="background-color:white"><span style="font-family:Times New Roman,serif"><strong>Kho&aacute; học nhằm gi&uacute;p trang bị cho c&aacute;c em</strong>:</span></span></span>
                </p>

                <p style="margin-left:0; margin-right:0"><span style="font-size:12pt"><span
                        style="background-color:white"><span style="font-family:Times New Roman,serif">- C&aacute;c chiến thuật l&agrave;m b&agrave;i thi ở cả bốn kỹ năng</span></span></span>
                </p>

                <p style="margin-left:0; margin-right:0"><span style="font-size:12pt"><span
                        style="background-color:white"><span style="font-family:Times New Roman,serif">- Từ vựng ở cấp độ cao cho phần&nbsp;<strong>Speaking&nbsp;</strong>(v&iacute; dụ idioms, phrasal verbs, collocations) cũng như c&aacute;ch thức trả lời c&aacute;c c&acirc;u hỏi để c&aacute;c em c&oacute; thể thể hiện tốt khả năng ng&ocirc;n ngữ của m&igrave;nh trong phần thi n&oacute;i cũng như cho mục đ&iacute;ch giao tiếp x&atilde; hội v&agrave; c&ocirc;ng việc sau n&agrave;y.</span></span></span>
                </p>

                <p style="margin-left:0; margin-right:0"><span style="font-size:12pt"><span
                        style="background-color:white"><span style="font-family:Times New Roman,serif">- Từ vựng cho một loạt c&aacute;c chủ đề v&agrave; chiến thuật l&agrave;m b&agrave;i cũng như c&aacute;c template cho Writing Task 1 &amp; Task 2. C&aacute;c em cũng sẽ được tiếp cận c&aacute;c b&agrave;i văn mẫu hay cho c&aacute;c chủ đề đa dạng.</span></span></span>
                </p>

                <p style="margin-left:0; margin-right:0"><span style="font-size:12pt"><span
                        style="background-color:white"><span style="font-family:Times New Roman,serif">- Kỹ năng l&agrave;m b&agrave;i hiệu quả dưới sức &eacute;p thời gian th&ocirc;ng qua việc luyện tập chuy&ecirc;n s&acirc;u tr&ecirc;n lớp dưới hướng dẫn của gi&aacute;o vi&ecirc;n v&agrave; việc bắt buộc phải ho&agrave;n th&agrave;nh b&agrave;i tập về nh&agrave;.</span></span></span>
                </p>

                <p><span style="font-family:Times New Roman,Times,serif"><span
                        style="font-size:16px"><span style="background-color:white">-&nbsp;</span>Tr&ecirc;n lớp gi&aacute;o vi&ecirc;n sẽ&nbsp;d&agrave;nh phần lớn thời gian cho n&oacute;i v&agrave; viết, hai kỹ năng đ&ograve;i hỏi rất nhiều nỗ lực v&agrave; một phương ph&aacute;p dạy hiệu quả để gi&uacute;p học sinh&nbsp;n&acirc;ng band điểm. Phần&nbsp;đọc v&agrave; nghe l&agrave; phần m&agrave; gi&aacute;o vi&ecirc;n&nbsp;sẽ hướng dẫn học sinh&nbsp;c&aacute;ch học v&agrave; giao b&agrave;i tập sau mỗi buổi học để em c&oacute; cơ hội luyện tập li&ecirc;n tục trong c&aacute;c&nbsp;buổi của kh&oacute;a học. </span></span>
                </p>

                <p><span style="font-size:16px"><span
                        style="font-family:Times New Roman,Times,serif"><strong>-Gi&aacute;o vi&ecirc;n:</strong></span></span><span
                        style="font-family:Times New Roman,serif; font-size:16px">&nbsp;l&agrave; giảng vi&ecirc;n tiếng Anh của Đại học Ngoại ngữ, Đại học Quốc gia, Đại học Ngoại thương&nbsp;v&agrave; c&aacute;c tổ chức gi&aacute;o dục uy t&iacute;n tại H&agrave; Nội.<strong>&nbsp;</strong>C&aacute;c thầy c&ocirc; đều đ&atilde; c&oacute; kinh nghiệm thi v&agrave; giảng dạy IELTS&nbsp;v&agrave; hiện đang giảng dạy tại Trung t&acirc;m tiếng Anh Nh&atilde; Trần.</span>
                </p>

                <p><span
                        style="font-family:Times New Roman ,serif; font-size:16px">LƯU &Yacute;: SAU KHO&Aacute; IELTS INTERMEDIATE C&Aacute;C EM C&Oacute; THỂ THI B&Agrave;I THI IELTS THỰC TẾ (TẠI BC HOĂC IDP) HOẶC C&Oacute; THỂ LỰA CHỌN HỌC TIẾP L&Ecirc;N MỘT TRONG HAI LỚP: IELTS ADVANCED HOẶC IELTS INTENSIVE TẠI TRUNG T&Acirc;M TIẾNG ANH NH&Atilde; TRẦN</span>
                </p>

                <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif"><strong>LỚP IELTS&nbsp;INTERMEDIATE 23N&nbsp;: Khai giảng 18/6/2023, Lịch học : 18h ng&agrave;y thứ tư&nbsp;v&agrave; s&aacute;ng chủ nhật</strong></span></span>
                </p>

                <p>&nbsp;</p>
            </div>

        </section>
    </div>
</section>
'),
('10500000','/public/img/courses-6.jpg','Khóa học IELTS ADVANCED',
'Lớp học này giúp học sinh đạt mức điểm tối thiểu 6.5. Khoảng điểm phổ biến sau khóa học là 7.5-8.0',
'<section class="container">
    <div class="row">
        <!-- main content -->
        <section class="col-sm-12 maincontent" style="width:100%;">
            <h3 class="title-orangered">Kh&#243;a học IELTS ADVANCED</h3>
            <p>
                <img class="float-right ml-4" width="300" src="/public/img/courses-6.jpg" alt="KH6">
            <div class="col-sm-12 text-justify">
                <p style="margin-left:0; margin-right:0; text-align:left"><span style="font-size:16px"><span
                        style="font-family:Times New Roman,Times,serif"><span style="background-color:white"><strong>- Mục ti&ecirc;u:</strong>&nbsp;gi&uacute;p học sinh đạt mức điểm tối thiểu 6.5. Điểm phổ biến của c&aacute;c em sau kh&oacute;a học l&agrave; 7.5 - 8.0. V&agrave; lu&ocirc;n c&oacute; một nh&oacute;m đạt tr&ecirc;n&nbsp;8.0.</span></span></span>
                </p>

                <p style="margin-left:0; margin-right:0; text-align:left"><span
                        style="font-family:Times New Roman,Times,serif"><span style="font-size:16px">Đối với c&aacute;c kho&aacute; học IELTS, nếu học sinh&nbsp;thi đạt dưới mức điểm tối thiểu do kho&aacute; học đề ra, &nbsp;sẽ được bố tr&iacute; học lại một phần của kh&oacute;a học để n&acirc;ng điểm. Nhưng c&oacute; một điều kiện nhỏ l&agrave; học sinh&nbsp;phải tu&acirc;n thủ những nguy&ecirc;n tắc học tập m&agrave; c&ocirc; đề ra v&agrave; b&agrave;i tập trong kh&oacute;a học em phải ho&agrave;n th&agrave;nh .</span></span>
                </p>

                <p style="margin-left:0; margin-right:0; text-align:left"><span style="font-size:16px"><span
                        style="font-family:Times New Roman,Times,serif"><span style="background-color:white">-<strong>Kh&oacute;a học&nbsp;</strong>k&eacute;o d&agrave;i 35&nbsp;buổi với 87.5 giờ học<strong>&nbsp;</strong>(bao gồm 2 buổi thi giữa kỳ v&agrave; cuối kỳ). </span></span></span>
                </p>

                <p style="margin-left:0; margin-right:0; text-align:justify"><span style="font-size:16px"><span
                        style="font-family:Times New Roman,Times,serif"><strong><span style="background-color:white">-Điều kiện xếp lớp:</span></strong><span
                        style="background-color:white">&nbsp;điểm thi đầu v&agrave;o trung b&igrave;nh ba m&ocirc;n nghe, đọc, viết tr&ecirc;n 6.5 (theo thang điểm 10), v&agrave; điểm viết kh&ocirc;ng&nbsp;dưới 6.5. &nbsp;B&agrave;i thi xếp lớp sử dụng tiếng Anh tổng qu&aacute;t (<em>general English), kh&ocirc;ng phải b&agrave;i thi IELTS.</em></span></span></span>
                </p>

                <p style="margin-left:0; margin-right:0; text-align:justify"><span style="font-size:16px"><span
                        style="font-family:Times New Roman,Times,serif">-&nbsp;<strong>Kho&aacute; học nhằm gi&uacute;p trang bị cho c&aacute;c em</strong>:</span></span>
                </p>

                <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif">- C&aacute;c chiến thuật l&agrave;m b&agrave;i thi ở cả bốn kỹ năng</span></span>
                </p>

                <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif">- Từ vựng ở cấp độ cao cho phần&nbsp;<strong>Speaking&nbsp;</strong>(v&iacute; dụ idioms, phrasal verbs, collocations) cũng như c&aacute;ch thức trả lời c&aacute;c c&acirc;u hỏi để c&aacute;c em c&oacute; thể thể hiện tốt khả năng ng&ocirc;n ngữ của m&igrave;nh trong phần thi n&oacute;i cũng như cho mục đ&iacute;ch giao tiếp x&atilde; hội v&agrave; c&ocirc;ng việc sau n&agrave;y.</span></span>
                </p>

                <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif">- Từ vựng cho một loạt c&aacute;c chủ đề v&agrave; chiến thuật l&agrave;m b&agrave;i cũng như c&aacute;c template cho Writing Task 1 &amp; Task 2. C&aacute;c em cũng sẽ được tiếp cận c&aacute;c b&agrave;i văn mẫu hay cho c&aacute;c chủ đề đa dạng.</span></span>
                </p>

                <p><span style="font-size:16px"><span style="font-family:Times New Roman,Times,serif">- Kỹ năng l&agrave;m b&agrave;i hiệu quả dưới sức &eacute;p thời gian th&ocirc;ng qua việc luyện tập chuy&ecirc;n s&acirc;u tr&ecirc;n lớp dưới hướng dẫn của gi&aacute;o vi&ecirc;n v&agrave; việc bắt buộc phải ho&agrave;n th&agrave;nh b&agrave;i tập về nh&agrave;.</span></span>
                </p>

                <p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:16px">-&nbsp;Tr&ecirc;n lớp gi&aacute;o vi&ecirc;n sẽ&nbsp;d&agrave;nh phần lớn thời gian cho n&oacute;i v&agrave; viết, hai kỹ năng đ&ograve;i hỏi rất nhiều nỗ lực v&agrave; một phương ph&aacute;p dạy hiệu quả để gi&uacute;p học sinh&nbsp;n&acirc;ng band điểm. Phần&nbsp;đọc v&agrave; nghe l&agrave; phần m&agrave; gi&aacute;o vi&ecirc;n&nbsp;sẽ hướng dẫn học sinh&nbsp;c&aacute;ch học v&agrave; giao b&agrave;i tập sau mỗi buổi học để em c&oacute; cơ hội luyện tập li&ecirc;n tục trong c&aacute;c&nbsp;buổi của kh&oacute;a học.</span></span>
                </p>

                <p style="margin-left:0; margin-right:0; text-align:justify"><span style="font-size:16px"><span
                        style="font-family:Times New Roman,Times,serif"><span style="background-color:white"><strong>-Gi&aacute;o vi&ecirc;n:</strong>&nbsp;Kh&oacute;a học sẽ do <strong>C&ocirc; Nh&atilde;</strong> trực tiếp giảng dạy.</span></span></span>
                </p>

                <p style="margin-left:0; margin-right:0; text-align:justify"><span
                        style="font-family:Times New Roman,Times,serif; font-size:16px">LƯU &Yacute;: SAU KHO&Aacute; IELTS </span><span
                        style="font-family:Times New Roman,Times,serif"><span
                        style="font-size:16px"><strong>ADVANCED</strong></span></span><span
                        style="font-family:Times New Roman,Times,serif; font-size:16px"> C&Aacute;C EM HO&Agrave;N TO&Agrave;N C&Oacute; THỂ TỰ TIN ĐẠT KẾT QUẢ TỐT TRONG B&Agrave;I THI IELTS THỰC TẾ (TẠI BC HOĂC IDP)&nbsp;&nbsp;</span>
                </p>

                <p style="margin-left:0; margin-right:0; text-align:justify">&nbsp;</p>

                <p><strong>- LỚP IELTS IELTS ADVANCED 23D&nbsp;: Khai giảng 1/8/2023, Lịch học : 18h ng&agrave;y thứ ba&nbsp;v&agrave;
                    thứ s&aacute;u.</strong></p>

            </div>
        </section>
    </div>
</section>
');

 


 
 

 
 
 
 
 

 










