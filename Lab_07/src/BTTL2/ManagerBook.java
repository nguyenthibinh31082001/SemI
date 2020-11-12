/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BTTL2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author ADMIN
 */
public class ManagerBook {

    private Connection conn;
    ArrayList<Book> lstBook = new ArrayList<>();
    
    public ManagerBook() {
        conn = Connect.getConnection();
        if (conn != null) {
            System.err.println("Kết nối thành công!!!");
        } else {
            System.err.println(">>> Kiểm tra kết nối !!!");
        }
    }

    public static void main(String[] args) {
        ManagerBook book = new ManagerBook();
        Book b = new Book();
        
        while (true) {
            System.out.println("\t.: MENU :.");
            System.out.println("1. Nhập thông tin sách");
            System.out.println("2. Hiển thị thể loại, nhà xuất bản, sách");
            System.out.println("3. Sửa thông tin sách");
            System.out.println("4. Xóa sách");
            System.out.println("5. Thoát");

            System.out.printf("Mời chọn từ 1 -> 5: ");
            Scanner s = new Scanner(System.in);
            int n = s.nextInt();

            switch (n) {
                case 1:
                    b.input();
                    
                    book.NhapSach(b);
                    break;
                case 2:
                    System.out.println("Danh sách thể loại:");
                    book.HienThiTheLoai();
                    System.out.println("Danh sách nhà xuất bản:");
                    book.HienThiNXB();
                    System.out.println("Danh sách sách:");
                    book.HienThiSach();
                    break;
                case 3:
                    b.input();
                    book.updateSach(b);
                    break;
                case 4:
                    book.deleteMaS();
                    break;
                case 5:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Vui lòng nhập từ 1-5!!!");
            }
        }
    }

    public void NhapSach(Book book) {
        try {
            String sql = "INSERT INTO tblSach(TenS, TheLoai, NXB, SoTrang, GiaTien )VALUES\n"
                    + "(?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            Scanner s = new Scanner(System.in);
            ps.setString(1, book.getTenS());
            ps.setInt(2, book.getTheLoai());
            ps.setInt(3, book.getNXB());
            ps.setInt(4, book.getSoTrang());
            ps.setFloat(5, book.getGiaTien());
            
//            System.out.printf("\tNhập tên sách: ");
//            ps.setString(1, s.nextLine());
//            System.out.printf("\tNhập thể loại: ");
//            ps.setInt(2, s.nextInt());
//            System.out.printf("\tNhập nhà xuất bản: ");
//            ps.setInt(3, s.nextInt());
//            System.out.printf("\tNhập số trang: ");
//            ps.setInt(4, s.nextInt());
//            System.out.printf("\tNhập giá tiền: ");
//            ps.setFloat(5, s.nextFloat());
            int row = ps.executeUpdate();
            if (row > 0) {
                System.err.println("Thêm dữ liệu thành công!!!");
            } else {
                System.err.println("Lỗi, thêm thất bại!!!");
            }
        } catch (SQLException ex) {
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }
    public void HienThiTheLoai() {
        try {
            String sql = "SELECT * FROM tblTheLoai";
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery(sql);
            System.out.printf("%2s %7s        %20s\n",
                    "MaTL", "TenTL", "MoTa");
            while (rs.next()) {
                System.out.printf("%-5d %-28s %-18s\n",
                                rs.getInt("MaTL"),
                                rs.getString("TenTL"), 
                                rs.getString("MoTa")
                                );
            }
            System.out.println("------------------------------------------------");
        } catch (SQLException ex) {
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }
    
    public void HienThiNXB() {
        try {
            String sql = "SELECT * FROM tblNhaXuatBan";
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery(sql);
            System.out.printf("%2s %10s %13s %10s\n",
                    "MaNXB", "TenNXB", "DiaChi", "Sdt");
            while (rs.next()) {
                System.out.printf("%-5d %-15s %-13s %-10d\n",
                                rs.getInt("MaNXB"),
                                rs.getString("TenNXB"),  
                                rs.getString("DiaChi"),
                                rs.getInt("Sdt")
                                );
            }
            System.out.println("------------------------------------------------");
        } catch (SQLException ex) {
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }

    public void HienThiSach() {
        try {
            String sql = "SELECT * FROM tblSach";
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery(sql);
            System.out.printf("%2s %5s %15s %5s %8s %10s\n",
                    "MaS", "TenS", "TheLoai", "NXB", "SoTrang", "GiaTien");
            while (rs.next()) {
                System.out.printf("%2d %-15s %-10d %-5d %-5d %8.2f\n",
                                rs.getInt("MaS"),
                                rs.getString("TenS"), 
                                rs.getInt("TheLoai"), 
                                rs.getInt("NXB"),
                                rs.getInt("SoTrang"), 
                                rs.getFloat("GiaTien")
                                );
            }
            System.out.println("------------------------------------------------");
        } catch (SQLException ex) {
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }

    public void updateSach(Book book) {
        try {
            System.out.printf("Nhập mã sách cần sửa: ");
            Scanner s = new Scanner(System.in);
            int code = s.nextInt();
//            s.nextLine();
//            System.out.printf("\tNhập tên sách: ");
//            String name = s.nextLine();
//            System.out.printf("\tNhập thể loại: ");
//            int theloai = s.nextInt();
//            System.out.printf("\tNhập nhà xuất bản: ");
//            int nxb = s.nextInt();
//            System.out.printf("\tNhập số trang: ");
//            int sotrang = s.nextInt();
//            System.out.printf("\tNhập giá tiền: ");
//            Float gia = s.nextFloat();
            String sql = "UPDATE tblSach\n"
                    + "SET TenS = ?, \n"
                    + "TheLoai = ?, \n"
                    + "NXB = ?, \n"
                    + "SoTrang = ?, \n"
                    + "GiaTien = ? \n"
                    + "WHERE MaS = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book.getTenS());
            ps.setInt(2, book.getTheLoai());
            ps.setInt(3, book.getNXB());
            ps.setInt(4, book.getSoTrang());
            ps.setFloat(5, book.getGiaTien());
            ps.setInt(6, code);
            int row = ps.executeUpdate();
            if (row > 0) {
                System.err.println("Cập nhật hàng thành công!!!");
            } else {
                System.err.println("Lỗi, cập nhật không thành công!!!");
            }
        } catch (SQLException ex) {
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }
    public void deleteMaS() {
        try {
            String sql = "DELETE FROM tblSach WHERE MaS = ?";

            PreparedStatement pst = conn.prepareStatement(sql);
            Scanner sc = new Scanner(System.in);
            System.out.printf("Nhập mã sách cần xóa: ");
            pst.setInt(1, sc.nextInt());

            int result = pst.executeUpdate();
            if (result > 0) {
                System.err.println("Xóa dữ liệu thành công!!!");
            }
        } catch (SQLException e) {
            System.err.println("Lỗi: " + e.getMessage());
        }
    }    
}
