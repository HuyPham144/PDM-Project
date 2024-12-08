USE CVs;

CREATE TABLE CVs (
    id INT PRIMARY KEY IDENTITY(1,1), -- ID tự tăng để làm khóa chính
    firstname NVARCHAR(50) NOT NULL,
    surname NVARCHAR(50) NOT NULL,
    add1 NVARCHAR(100) NOT NULL, -- Địa chỉ 1
    add2 NVARCHAR(100), -- Địa chỉ 2 (có thể NULL)
    postcode NVARCHAR(20) NOT NULL,
    nationality NVARCHAR(50),
    dob DATE NOT NULL, -- Ngày sinh
    image VARBINARY(MAX), -- Lưu trữ ảnh
    telephone NVARCHAR(15) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE, -- Email duy nhất
    skill1 NVARCHAR(100), -- Kỹ năng 1
    skill2 NVARCHAR(100), -- Kỹ năng 2
    skill3 NVARCHAR(100), -- Kỹ năng 3
    skill4 NVARCHAR(100), -- Kỹ năng 4
    company1 NVARCHAR(100), -- Công ty 1
    company2 NVARCHAR(100), -- Công ty 2
    company3 NVARCHAR(100), -- Công ty 3
    wdone1 NVARCHAR(200), -- Công việc đã hoàn thành ở công ty 1
    wdone2 NVARCHAR(200), -- Công việc đã hoàn thành ở công ty 2
    wdone3 NVARCHAR(200), -- Công việc đã hoàn thành ở công ty 3
    university NVARCHAR(100), -- Trường đại học
    qual1 NVARCHAR(100), -- Bằng cấp 1
    qual2 NVARCHAR(100)  -- Bằng cấp 2
);
