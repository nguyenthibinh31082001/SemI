/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BTTL2;

import java.util.Scanner;

/**
 *
 * @author ADMIN
 */
public class Book {
    private int MaS; 
    private String TenS; 
    private int TheLoai;
    private int NXB;
    private int SoTrang;
    private float GiaTien;

    public Book() {
    }

    public Book(int MaS, String TenS, int TheLoai, int NXB, int SoTrang, float GiaTien) {
        this.MaS = MaS;
        this.TenS = TenS;
        this.TheLoai = TheLoai;
        this.NXB = NXB;
        this.SoTrang = SoTrang;
        this.GiaTien = GiaTien;
    }

    public int getMaS() {
        return MaS;
    }

    public void setMaS(int MaS) {
        this.MaS = MaS;
    }

    public String getTenS() {
        return TenS;
    }

    public void setTenS(String TenS) {
        this.TenS = TenS;
    }

    public int getTheLoai() {
        return TheLoai;
    }

    public void setTheLoai(int TheLoai) {
        this.TheLoai = TheLoai;
    }

    public int getNXB() {
        return NXB;
    }

    public void setNXB(int NXB) {
        this.NXB = NXB;
    }

    public int getSoTrang() {
        return SoTrang;
    }

    public void setSoTrang(int SoTrang) {
        this.SoTrang = SoTrang;
    }

    public float getGiaTien() {
        return GiaTien;
    }

    public void setGiaTien(float GiaTien) {
        this.GiaTien = GiaTien;
    }
    
    public void input() {
        Scanner s = new Scanner(System.in);
        System.out.printf("\tNhập tên sách: ");
        this.TenS = s.nextLine();
        while(true){
            if(this.TenS.length() > 0){
                  break;
              }else{
                  System.err.println("\tTên sách không được để trống!!!");  
                  System.out.printf("\tNhập tên sách: ");
                  TenS = s.nextLine();
              }
        }
        while (true) {
            try {
                System.out.printf("\tNhập thể loại: ");
                this.TheLoai = s.nextInt();
                while(TheLoai < 0 ){
                    System.err.println("\tThể loại phải lớn hơn 0!!!");  
                    System.out.printf("\tNhập lại thể loại: ");
                    TheLoai = s.nextInt();
                }
                break;
            } catch (Exception ex) {
                System.err.println("\tPhải nhập số!!!");
                  s.nextLine();
            }
        }
        while (true) {
            try {
                System.out.printf("\tNhập nhà xuất bản: ");
                this.NXB = s.nextInt();
                while(NXB < 0 ){
                    System.err.println("\tNhà xuất bản phải lớn hơn 0!!!");  
                    System.out.printf("\tNhập lại nhà xuất bản: ");
                    NXB = s.nextInt();
                }
                break;
            } catch (Exception ex) {
                System.err.println("\tPhải nhập số!!!");
                  s.nextLine();
            }
        }
        
        while (true) {
            try {
                System.out.printf("\tNhập số trang: ");
                this.SoTrang = s.nextInt();
                while(SoTrang < 0 ){
                    System.err.println("\tSố trang phải lớn hơn 0!!!");  
                    System.out.printf("\tNhập lại số trang: ");
                    SoTrang = s.nextInt();
                }
                break;
            } catch (Exception ex) {
                System.err.println("\tPhải nhập số!!!");
                  s.nextLine();
            }
        }
        while (true) {
            try {
                System.out.printf("\tNhập giá tiền: ");
                this.GiaTien = s.nextFloat();
                while(GiaTien < 0 ){
                    System.err.println("\tGiá tiền phải lớn hơn 0!!!");  
                    System.out.printf("\tNhập lại giá tiền: ");
                    GiaTien = s.nextFloat();
                }
                break;
            } catch (Exception ex) {
                System.err.println("\tPhải nhập số!!!");
                  s.nextLine();
            }
        }
    }
     public void output() {
        System.out.printf("%2d %-15s %-10d %-5d %-5d %8.2f\n",
        this.MaS, this.TenS, this.TheLoai, this.NXB, this.SoTrang, this.GiaTien);
    }
}
