/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BTTL3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author Admin
 */
public class ManagerSinhVien {
    private Connection conn;

    public ManagerSinhVien() {
        conn = Connect.getConnection();
        if (conn != null) {
            System.err.println("Kết nối thành công!!!");
        } else {
            System.err.println(">>> Kiểm tra kết nối !!!");
        }
    }

    public static void main(String[] args) {
        ManagerSinhVien sinhVien = new ManagerSinhVien();
        SinhVien sv = new SinhVien();
        
        while (true) {
            System.out.println("========= MENU ==========");
            System.out.println("1. Nhập dữ liệu sinh viên.");
            System.out.println("2. Hiển thị danh sách sinh viên");
            System.out.println("3. Tìm kiếm sinh viên theo email");
            System.out.println("4. Tìm kiếm sinh viên theo tên");
            System.out.println("5. Sửa thông tin sinh viên theo mã Roll No.");
            System.out.println("6. Xóa thông tin sinh viên theo mã Roll No.");
            System.out.println("7. Thoát chương trình.");

            System.out.printf("Mời chọn từ 1 -> 7: ");
            Scanner s = new Scanner(System.in);
            int choose = s.nextInt();

            switch (choose) {
                case 1:
                    sv.input();
                    sinhVien.NhapSV(sv);
                    break;
                case 2:
                    System.out.println("Danh sách sinh viên: ");
                    sinhVien.HienThiSV();
                    break;
                case 3:
                    sinhVien.SearchEmail();
                    break;
                case 4:
                    sinhVien.SearchName();
                    break;
                case 5:
                    sv.input();
                    sinhVien.updateSV(sv);
                    break;
                case 6:
                    sinhVien.deleteMaSV();
                    break;
                case 7:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Vui lòng nhập từ 1-7!!!");
            }
        }
    }

    public void NhapSV(SinhVien sv) {
        try {
            String sql = "INSERT INTO tblSinh_Vien(rollNo, sv_name, sv_address, sv_phone, sv_email )VALUES\n"
                    + "(?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            Scanner s = new Scanner(System.in);
            ps.setString(1, sv.getRollNo());
            ps.setNString(2, sv.getSv_name());
            ps.setNString(3, sv.getSv_address());
            ps.setString(4, sv.getSv_phone());
            ps.setString(5, sv.getSv_email());
//            System.out.printf("\tNhập mã sinh viên: ");
//            ps.setString(1, s.nextLine());
//            System.out.printf("\tNhập tên sinh viên: ");
//            ps.setString(2, s.nextLine());
//            System.out.printf("\tNhập địa chỉ: ");
//            ps.setNString(3, s.nextLine());
//            System.out.printf("\tNhập sđt: ");
//            ps.setNString(4, s.nextLine());
//            System.out.printf("\tNhập email: ");
//            ps.setNString(5, s.nextLine());
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
    public void HienThiSV() {
        try {
            String sql = "SELECT * FROM tblSinh_Vien";
            PreparedStatement stt = conn.prepareStatement(sql);
            ResultSet rs = stt.executeQuery();
            System.out.printf("%s %10s %10s %20s %15s %10s\n",
                    "id", "rollNo", "sv_name", "sv_address", "sv_phone", "email");
            while (rs.next()) {
                System.out.printf("%-6d %-9s %-18s %-15s %-13s %-15s\n",
                                rs.getInt("id"),
                                rs.getString("rollNo"),
                                rs.getString("sv_name"),
                                rs.getString("sv_address"),
                                rs.getString("sv_phone"),
                                rs.getString("sv_email")
                                );
            }
            System.out.println("------------------------------------------------");
        } catch (SQLException ex) {
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }

    public void updateSV(SinhVien sv) {
        try {
            System.out.printf("Nhập id sinh viên cần sửa: ");
            Scanner s = new Scanner(System.in);
            int code = s.nextInt();
//            System.out.printf("\tNhập tên sinh viên: ");
//            String name = s.nextLine();
//            System.out.printf("\tNhập địa chỉ: ");
//            String diachi = s.nextLine();
//            System.out.printf("\tNhập sđt: ");
//            String sdt = s.nextLine();
//            System.out.printf("\tNhập email: ");
//            String email = s.nextLine();
            String sql = "UPDATE tblSinh_Vien\n"
                    + "SET rollNo = ?, \n"
                    + "sv_name = ?, \n"
                    + "sv_address = ?, \n"
                    + "sv_phone = ?, \n"
                    + "sv_email = ? \n"
                    + "WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sv.getRollNo());
            ps.setNString(2, sv.getSv_name());
            ps.setNString(3, sv.getSv_address());
            ps.setString(4, sv.getSv_phone());
            ps.setString(5, sv.getSv_email());
            ps.setInt(6, code);
            int row = ps.executeUpdate();
            if (row > 0) {
                System.err.println("Cập nhật sinh viên thành công!!!");
            } else {
                System.err.println("Lỗi, cập nhật không thành công!!!");
            }
        } catch (SQLException ex) {
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }
    public void deleteMaSV() {
        try {
            String sql = "DELETE FROM tblSinh_Vien WHERE rollNo = ?";

            PreparedStatement pst = conn.prepareStatement(sql);
            Scanner sc = new Scanner(System.in);
            System.out.printf("Nhập mã sinh viên cần xóa: ");
            pst.setString(1, sc.nextLine());

            int result = pst.executeUpdate();
            if (result > 0) {
                System.err.println("Xóa dữ liệu thành công!!!");
            }
        } catch (SQLException e) {
            System.err.println("Lỗi: " + e.getMessage());
        }
    } 
    public void SearchEmail(){
        try {
            String sql = "SELECT * FROM tblSinh_Vien WHERE sv_email LIKE ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            
            Scanner sc  = new Scanner(System.in);
            System.out.printf("Nhập email cần tìm: ");
            String Email = sc.nextLine();
            
            pst.setNString(1, "%"+ Email+ "%");
            
            ResultSet rs = pst.executeQuery();
            System.out.printf("%s %10s %10s %20s %15s %10s\n",
                    "id", "rollNo", "sv_name", "sv_address", "sv_phone", "email");
            while (rs.next()) {
                System.out.printf("%-6d %-9s %-18s %-15s %-13s %-15s\n",
                                rs.getInt("id"),
                                rs.getString("rollNo"),
                                rs.getString("sv_name"),
                                rs.getString("sv_address"),
                                rs.getString("sv_phone"),
                                rs.getString("sv_email")
                                );
            }
            System.out.println("------------------------------------------------");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    System.out.println("Lỗi kết nối CSDL");
                }
            }
        }
    }
    public void SearchName(){
        try {
            String sql = "SELECT * FROM tblSinh_Vien WHERE sv_name LIKE ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            
            Scanner sc  = new Scanner(System.in);
            System.out.printf("Nhập tên sinh viên cần tìm: ");
            String Name = sc.nextLine();
            
            pst.setNString(1, "%"+ Name+ "%");
            
            ResultSet rs = pst.executeQuery();
            System.out.printf("%s %10s %10s %20s %15s %10s\n",
                    "id", "rollNo", "sv_name", "sv_address", "sv_phone", "email");
            while (rs.next()) {
                System.out.printf("%-6d %-9s %-18s %-15s %-13s %-15s\n",
                                rs.getInt("id"),
                                rs.getString("rollNo"),
                                rs.getString("sv_name"),
                                rs.getString("sv_address"),
                                rs.getString("sv_phone"),
                                rs.getString("sv_email")
                                );
            }
            System.out.println("------------------------------------------------");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    System.out.println("Lỗi kết nối CSDL");
                }
            }
        }
    }
}
