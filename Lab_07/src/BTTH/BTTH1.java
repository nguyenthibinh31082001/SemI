/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BTTH;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.CallableStatement;
/**
 *
 * @author Admin
 */
public class BTTH1 {

    Connection conn = null;
    SinhVien_BTTH1 sv;
    
    public void connect() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn =DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=lab_06","sa", "123456789");
            System.err.println("Kết nối tới CSDL thành công");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BTTH1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private int run() {
        do{
            Scanner sc = new Scanner(System.in);
            System.out.println("===== MENU =====");
            System.out.println("1. Nhập thông tin sinh viên");
            System.out.println("2. Danh sách sinh viên");
            System.out.println("3. Sửa sinh viên");
            System.out.println("4. Xóa sinh viên");
            System.out.println("5. Thêm nhóm sinh viên");
            System.out.println("6. Tìm sinh viên");
            System.out.println("7. Thoát");
            
            System.out.printf("Chọn chức năng 1-7: ");
            int choice = sc.nextInt();
            
            switch(choice){
                case 1:
                    try {
                        nhapThongTin();
                    } catch (SQLException ex) {
                        Logger.getLogger(BTTH1.class.getName()).log(Level.SEVERE,null, ex);
                    }
                    break;
                case 2:
                    try {
                        hienthi();
                    } catch (SQLException ex) {
                        Logger.getLogger(BTTH1.class.getName()).log(Level.SEVERE,null, ex);
                    }
                    break;
                case 3:
                    try {
                        update();
                    } catch (SQLException ex) {
                        Logger.getLogger(BTTH1.class.getName()).log(Level.SEVERE,null, ex);
                    }
                    break;
                case 4:
                    try {
                        delete();
                    } catch (SQLException ex) {
                        Logger.getLogger(BTTH1.class.getName()).log(Level.SEVERE,null, ex);
                    }
                    break;
                case 5:
                    try {
                        nhapThongTin();
                    } catch (SQLException ex) {
                        Logger.getLogger(BTTH1.class.getName()).log(Level.SEVERE,null, ex);
                    }
                    break;
                case 6:
                    try {
                        getStudentByID();
                    } catch (SQLException ex) {
                        Logger.getLogger(BTTH1.class.getName()).log(Level.SEVERE,null, ex);
                    }
                    break;
                case 7:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Vui lòng nhập từ 1-7!!!");
            }
        }while(true);
    }
    public void nhapThongTin() throws SQLException {
        conn.setAutoCommit(false);
        boolean isStop = false;
        String sql = "INSERT INTO tblsinhvien("
            + "rollnumber, name, address, phone, gender) "
            + "VALUES (?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        do {
            SinhVien_BTTH1 objS = new SinhVien_BTTH1();
            objS.nhapThongTin();
            ps.setString(1, objS.getRollNumber());
            ps.setString(2, objS.getName());
            ps.setString(3, objS.getAddress());
            ps.setString(4, objS.getPhoneNumber());
            ps.setInt(5, objS.getGender());
            ps.addBatch();
            System.out.printf("Bạn muốn nhập tiếp không (1: Có | 2: Không): ");
            Scanner nhap = new Scanner(System.in);
            if (nhap.nextInt() != 1) {
                isStop = true;
            }
        } while (!isStop);
       
        int updateCount[] = ps.executeBatch();
        conn.commit(); 
    }
    public void hienthi() throws SQLException {
        String sql = "SELECT * FROM tblsinhvien";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();
        while (result.next()) {
            String id = result.getString("id");
            String rollnumber = result.getString("rollnumber");
            String name = result.getString("name");
            String address = result.getString("address");
            String phone = result.getString("phone");
            String gender = "Nam";
            if (result.getInt("gender") == 0) {
                gender = "Nữ";
            }
            System.out.println(id + "| " + rollnumber + "| " + name + " - " + address +
            " - " + phone + " - " + gender);
        }
        System.out.println("-------------------------------------------------");
    }
    private void suaThongTin() {
        System.out.println("Nhập thông tin sửa:");
        Scanner nhap = new Scanner(System.in);
        sv = new SinhVien_BTTH1();
        System.out.printf("\tNhập Rollnumber sinh viên cần sửa: ");
        sv.setRollNumber(nhap.nextLine());
        System.out.printf("\tHọ và Tên: ");
        sv.setName(nhap.nextLine());
        System.out.printf("\tĐịa chỉ: ");
        sv.setAddress(nhap.nextLine());
        System.out.printf("\tSĐT: ");
        sv.setPhoneNumber(nhap.nextLine());
        System.out.printf("\tGiới tính(Nam = 1 | Nữ = 0): ");
        sv.setGender(nhap.nextInt());
    }
    public void update() throws SQLException {
        System.out.println("Cập nhật thông tin sinh viên");
        suaThongTin();
        String sql = "update tblsinhvien set name=?, address=?, phone=?, gender=? where rollnumber=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, sv.getName());
        pstmt.setString(2, sv.getAddress());
        pstmt.setString(3, sv.getPhoneNumber());
        pstmt.setBoolean(4, (sv.getGender() == 1));
        pstmt.setString(5, sv.getRollNumber());
        int i = pstmt.executeUpdate();
        if (i > 0) {
            System.err.println("Sửa thành công!!!");
        } else {
            System.err.println("Thất bại, vui lòng kiểm tra lại dữ liệu!!!");
        }
    }
    public void delete() throws SQLException {
        System.out.printf("Nhập mã sinh viên muốn xóa: ");
        Scanner nhap = new Scanner(System.in);
        String rollNumber = nhap.nextLine();
        String sql = "DELETE FROM tblsinhvien WHERE "
        + "rollnumber = '" + rollNumber + "'";
        Statement st = conn.createStatement();
        int row = st.executeUpdate(sql);
        if (row > 0) {
            System.err.println("Xóa thành công!!!");
        } else {
            System.err.println("Thất bại, vui lòng kiểm tra lại dữ liệu!!!");
        }
    }
    public void getStudentByID() throws SQLException {
        try {
            System.out.printf("Nhập Rollnumber sinh viên muốn hiển thị: ");
            Scanner nhap = new Scanner(System.in);
            String roll = nhap.nextLine();
            String sql = "{CALL sp_getstudent(?)}";
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, roll);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
                System.out.println("Tìm thấy sinh viên có roll:"+roll);
                System.out.println("Rollnumber:"+rs.getString(2));
                System.out.println("Name:"+rs.getString(3));
                System.out.println("Address:"+rs.getString(4));
                System.out.println("Phone:"+rs.getString(5));
                System.out.println("Gender:"+(rs.getBoolean(6) ? "Nam":"Nữ"));
            }else{
                System.err.println("Không tìm thấy sinh viên nào có roll:"+roll);
            }
        } catch (SQLException ex) {
            System.err.println("Lỗi: " + ex.getMessage());
        }
    }
    public static void main(String[] args) {
        BTTH1 main = new BTTH1();
        main.connect();
        main.run();
    }
}
