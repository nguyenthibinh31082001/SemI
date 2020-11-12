/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BTTH;

import java.util.Scanner;

/**
 *
 * @author Admin
 */
public class SinhVien_BTTH1 {
    private int id;
    private String rollNumber;
    private String name;
    private String address;
    private String phoneNumber;
    private int gender;

    public SinhVien_BTTH1() {
    }

    public SinhVien_BTTH1(int id, String rollNumber, String name, String address, String phoneNumber, int gender) {
        this.id = id;
        this.rollNumber = rollNumber;
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }
    
    public void nhapThongTin() {
        System.out.println("Nhập thông tin sinh viên:");
        Scanner nhap = new Scanner(System.in);
        System.out.printf("\tMã sinh viên: ");
        this.rollNumber = nhap.nextLine();
        System.out.printf("\tHọ và Tên: ");
        this.name = nhap.nextLine();
        System.out.printf("\tĐịa chỉ: ");
        this.address = nhap.nextLine();
        System.out.printf("\tSĐT: ");
        this.phoneNumber = nhap.nextLine();
        System.out.printf("\tGiới tính(Nam = 1 | Nữ = 0): ");
        this.gender = nhap.nextInt();
    }
}
