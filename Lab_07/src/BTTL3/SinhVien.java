/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BTTL3;

import java.util.Scanner;

/**
 *
 * @author Admin
 */
public class SinhVien {
    private int id;
    private String rollNo;
    private String sv_name;
    private String sv_address;
    private String sv_phone;
    private String sv_email;

    public SinhVien() {
    }

    public SinhVien(int id, String rollNo, String sv_name, String sv_address, String sv_phone, String sv_email) {
        this.id = id;
        this.rollNo = rollNo;
        this.sv_name = sv_name;
        this.sv_address = sv_address;
        this.sv_phone = sv_phone;
        this.sv_email = sv_email;
    }

    public String getRollNo() {
        return rollNo;
    }

    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    public String getSv_name() {
        return sv_name;
    }

    public void setSv_name(String sv_name) {
        this.sv_name = sv_name;
    }

    public String getSv_address() {
        return sv_address;
    }

    public void setSv_address(String sv_address) {
        this.sv_address = sv_address;
    }

    public String getSv_phone() {
        return sv_phone;
    }

    public void setSv_phone(String sv_phone) {
        this.sv_phone = sv_phone;
    }

    public String getSv_email() {
        return sv_email;
    }

    public void setSv_email(String sv_email) {
        this.sv_email = sv_email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public void input() {
        Scanner s = new Scanner(System.in);
            
        System.out.printf("\tNhập mã sinh viên: ");
        this.rollNo = s.nextLine();
        while(true){
            if(this.rollNo.length() <= 8 && rollNo.length() > 0){
                  break;
            }else{
                  System.err.println("\tMã sinh viên phải từ 1-8 ký tự!!!");  
                  System.out.printf("\tNhập lại mã sinh viên: ");
                  rollNo = s.nextLine();
            }
        }
        System.out.printf("\tNhập tên sinh viên: ");
        this.sv_name = s.nextLine();
        while(true){
            if(this.sv_name.length() <= 256 && sv_name.length() > 0){
                  break;
            }else{
                  System.err.println("\tTên sinh viên phải từ 1-256 ký tự!!!");  
                  System.out.printf("\tNhập lại tên sinh viên: ");
                  sv_name = s.nextLine();
            }
        }
        System.out.printf("\tNhập địa chỉ: ");
        this.sv_address = s.nextLine();
        while(true){
            if(this.sv_address.length() <= 521 && sv_address.length() > 0){
                  break;
            }else{
                  System.err.println("\tĐịa chỉ phải từ 1-521 ký tự!!!");  
                  System.out.printf("\tNhập lại địa chỉ: ");
                  sv_address = s.nextLine();
            }
        }
        System.out.printf("\tNhập sđt: ");
        this.sv_phone = s.nextLine();
        while(true){
            if(this.sv_phone.length() == 11 && sv_phone.length() > 0){
                  break;
            }else{
                  System.err.println("\tSố điện thoại phải 11 ký tự!!!");  
                  System.out.printf("\tNhập lại sđt: ");
                  sv_phone = s.nextLine();
            }
        }
        System.out.printf("\tNhập email: ");
        this.sv_email = s.nextLine();
        while(true){
            if(this.sv_email.length() <= 64 && sv_email.length() > 0){
                  break;
            }else{
                  System.err.println("\tEmail phải từ 1-11 ký tự!!!");  
                  System.out.printf("\tNhập lại email: ");
                  sv_email = s.nextLine();
            }
        }
    }
    public void output() {
        System.out.printf("%-6d %-6d %-9s %-18s %-15s %-13s %-15s\n",
        this.id,this.rollNo, this.sv_name, this.sv_address, this.sv_phone, this.sv_email);
    }
}
