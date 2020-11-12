/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BTTL1;

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
public class ProductManager_Bai1 {
    private Connection conn;
    
    ArrayList<Product_Bai1> lstProduct = new ArrayList<>();
    
    public ProductManager_Bai1() {
        conn = Connect.getConnection();
        if (conn != null) {
            System.err.println("Kết nối tới CSDL thành công!!!");
        } else {
            System.err.println(">>> Kiểm tra kết nối !!!");
        }
    }
    public static void main(String[] args) {
        ProductManager_Bai1 pm = new ProductManager_Bai1();
        Product_Bai1 p = new Product_Bai1();
        
        Scanner sc = new Scanner(System.in);

        do{
            System.out.println("\t.: MENU :.");
            System.out.println("1. Nhập hàng");
            System.out.println("2. Xuất hàng");
            System.out.println("3. Kho");
            System.out.println("4. Cập nhật");
            System.out.println("5. Xóa");
            System.out.println("6. Thoát");
            
            System.out.printf("Chọn chức năng 1-6: ");
            int choice = sc.nextInt();
            
            switch(choice){
                case 1:
                    p.input();
                    
                    pm.nhap(p);
                    break;
                case 2:
                    pm.export();
                    break;
                case 3:
                    pm.readAll();
                    break;
                case 4:
                    p.input();
                    pm.update(p);
                    break;
                case 5:
                    pm.deleteMaHH();
                    break;
                case 6:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Vui lòng nhập từ 1-6!!!");
            }
        }while(true);
        
    }
    
    public void nhap(Product_Bai1 prod) {
        try {
            String sql = "INSERT INTO tblProduct(tenhh, nhasx, soluong, giagoc, vat) VALUES\n"
        + "(?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, prod.getTenhh());
            ps.setString(2, prod.getNhasx());
            ps.setInt(3, prod.getSoluong());
            ps.setFloat(4, prod.getGiagoc());
            ps.setInt(5, prod.getVat());
            
            int row = ps.executeUpdate(); // Trả về số dòng dữ liệu được thêm
            if (row > 0) {
            System.err.println("Thêm dữ liệu thành công!!!");
            } else {
            System.err.println("Lỗi, thêm thất bại!!!");
            }
        } catch (SQLException ex) {
//            ex.printStackTrace();
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }
    public void export() {
        try {
            System.out.printf("Nhập mã hàng hóa xuất: ");
            Scanner s = new Scanner(System.in);
            int code = s.nextInt();
            System.out.printf("Số lượng xuất: ");
            int number = s.nextInt();
            String sql = "UPDATE tblProduct\n"
            + "SET soluong -= ? \n"
            + "WHERE mahh = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, number);
            ps.setInt(2, code);
            int row = ps.executeUpdate(); // Trả về số dòng dữ liệu được thêm
            if (row > 0) {
                System.err.println("Xuất hàng thành công!!!");
            } else {
                System.err.println("Hàng không đủ, vui lòng kiểm tra kho!!!");
            }
        } catch (SQLException ex) {
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }
    public void readAll() {
        try {
            String sql = "SELECT * FROM tblProduct";
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery(sql);
            System.out.printf("%2s %-15s %-15s %3s %8s %2s\n",
            "Ma", "TenHH", "NhaSX", "SL", "Gia", "VT");
            while (rs.next()) {
            Product_Bai1 p = new Product_Bai1(rs.getInt("mahh"),
            rs.getString("tenhh"), rs.getString("nhasx"), rs.getInt("soluong"),
            rs.getFloat("giagoc"), rs.getInt("vat"));
            p.output();
            }
            System.out.println("------------------------------------------------");
        } catch (SQLException ex) { 
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }
    public void update(Product_Bai1 prod) {
        try {
            System.out.printf("\tNhập mã hàng hóa cập nhật: ");
            Scanner s = new Scanner(System.in);
            int code = s.nextInt();
////            System.out.printf("Số lượng trong kho: ");
////            int number = s.nextInt();
//            s.nextLine(); // clear
//            System.out.printf("\tTên hàng hóa: ");
//            String name = s.nextLine();
//            System.out.printf("\tNhập nhà sản xuất: ");
//            String nhasx = s.nextLine();
//            // s.nextLine(); // clear
//            System.out.printf("\tNhập số lượng: ");
//            int sl = s.nextInt();
//            System.out.printf("\tNhập giá gốc: ");
//            float gia = s.nextFloat();
//            System.out.printf("\tNhập VAT: ");
//            int vat = s.nextInt();
            
            String sql = "UPDATE tblProduct\n"
                        + "SET tenhh = ?, \n"
                        + "nhasx = ?, \n"
                        + "soluong = ?, \n"
                        + "giagoc = ?, \n"
                        + "vat = ? \n"
                        + "WHERE mahh = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, prod.getTenhh());
            ps.setString(2, prod.getNhasx());
            ps.setInt(3, prod.getSoluong());
            ps.setFloat(4, prod.getGiagoc());
            ps.setInt(5, prod.getVat());
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
    public void deleteMaHH() {
        try {
            String sql = "DELETE FROM tblProduct WHERE mahh = ?";

            PreparedStatement pst = conn.prepareStatement(sql);
            Scanner sc = new Scanner(System.in);
            System.out.printf("Nhập mã hàng hóa cần xóa: ");
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
