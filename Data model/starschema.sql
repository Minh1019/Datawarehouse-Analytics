CREATE TABLE Dim_ChiNhanh (
    MaCN VARCHAR (50) PRIMARY KEY,
    TenCN VARCHAR (100),
    ThanhPho VARCHAR (100)
);
CREATE TABLE Dim_KhachHang (
    MaKH VARCHAR (50) PRIMARY KEY,
    TenKH VARCHAR (100),
    SDT VARCHAR (20),
    Email VARCHAR (100),
    NhomKH VARCHAR (50)
);
-- Create Dimension Table: Dim_NhanVien
CREATE TABLE Dim_NhanVien (
    MaNV VARCHAR (50) PRIMARY KEY,
    TenNV VARCHAR (100)
);
CREATE TABLE Dim_SanPham (
    MaSP VARCHAR (50) PRIMARY KEY,
    TenSP VARCHAR (100),
    NhomSP VARCHAR (50),
);
CREATE TABLE Dim_ThoiGian (
    MaTG INT PRIMARY KEY,
    Ngay INT,
    Thang INT,
    Nam INT,
    Quy INT,
    ThoiGian DATE
);
CREATE TABLE Fact_BanHang (
    MaTG INT,
    TenDH VARCHAR (100), 
    MaCN VARCHAR (50),
    MaNV VARCHAR (50),
    MaSP VARCHAR (50),
    MaKH VARCHAR (50),
    SoLuong INT,
    DoanhThu BIGINT,
    LoiNhuan BIGINT,
    CONSTRAINT FK_Fact_BanHang_Dim_Time FOREIGN KEY (MaTG) REFERENCES Dim_ThoiGian (MaTG),
    CONSTRAINT FK_Fact_BanHang_Dim_ChiNhanh FOREIGN KEY (MaCN) REFERENCES Dim_ChiNhanh (MaCN),
    CONSTRAINT FK_Fact_BanHang_Dim_NhanVien FOREIGN KEY (MaNV) REFERENCES Dim_NhanVien (MaNV),
    CONSTRAINT FK_Fact_BanHang_Dim_Product FOREIGN KEY (MaSP) REFERENCES Dim_SanPham (MaSP),
    CONSTRAINT FK_Fact_BanHang_Dim_KhachHang FOREIGN KEY (MaKH) REFERENCES Dim_KhachHang (MaKH)
);
