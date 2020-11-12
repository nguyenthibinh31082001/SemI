/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BTTL1;

import java.util.Scanner;

/**
 *
 * @author Admin
 */
public class Product_Bai1 {
    private int mahh; // Mã hàng hóa
    private String tenhh; // Tên hàng
    private String nhasx; // Nhà sản xuất
    private int soluong; // Số lượng (trong kho)
    private float giagoc; // Giá gốc (VNĐ)
    private int vat; // Thuế VAT
    
    public Product_Bai1() {
        
    }
    public Product_Bai1(int mahh, String tenhh, String nhasx, int soluong, float giagoc,int vat) {
        this.mahh = mahh;
        this.tenhh = tenhh;
        this.nhasx = nhasx;
        this.soluong = soluong;
        this.giagoc = giagoc;
        this.vat = vat;
    }
    public int getMahh() {
            return mahh;
    }
    public void setMahh(int mahh) {
        this.mahh = mahh;
    }
    public String getTenhh() {
        return tenhh;
    }
    public void setTenhh(String tenhh) {
        this.tenhh = tenhh;
    }
    public String getNhasx() {
        return nhasx;
    }
    public void setNhasx(String nhasx) {
        this.nhasx = nhasx;
    }
    public int getSoluong() {
        return soluong;
    }
    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
    public float getGiagoc() {
        return giagoc;
    }
    public void setGiagoc(float giagoc) {
        this.giagoc = giagoc;
    }
    public int getVat() {
        return vat;
    }
    public void setVat(int vat) {
        this.vat = vat;
    }
    public void input() {
        Scanner s = new Scanner(System.in);
//         System.out.printf("Nhập mã sản phẩm: ");
//         this.mahh = s.nextInt();
//         s.nextLine();
        System.out.printf("\tNhập tên sản phẩm: ");
        this.tenhh = s.nextLine();
        while(true){
            if(this.tenhh.length() > 0){
                  break;
              }else{
                  System.err.println("\tTên sản phẩm không được để trống!!!");  
                  System.out.printf("\tNhập tên sản phẩm: ");
                  tenhh = s.nextLine();
              }
        }
        System.out.printf("\tNhập nhà sản xuất: ");
        this.nhasx = s.nextLine();
        while(true){
            if(nhasx.length() > 0){
                  break;
              }else{
                  System.err.println("\tNhà sản xuất không được để trống!!!");  
                  System.out.printf("\tNhập nhà sản xuất: ");
                  nhasx = s.nextLine();
              }
        }
        // s.nextLine(); // clear
        while (true) {
            try {
               System.out.printf("\tNhập số lượng: ");
                this.soluong = s.nextInt();
                while(soluong < 0 ){
                    System.err.println("\tSố lương phải lớn hơn 0!!!");  
                    System.out.printf("\tNhập lại số lượng: ");
                    soluong = s.nextInt();
                }
                break;
            } catch (Exception ex) {
                System.err.println("\tPhải nhập số!!!");
                  s.nextLine();
            }
        }
        while (true) {
            try {
                System.out.printf("\tNhập giá gốc: ");
                this.giagoc = s.nextFloat();
                while(giagoc < 0 ){
                    System.err.println("\tGiá gốc phải lớn hơn 0!!!");  
                    System.out.printf("\tNhập lại giá gốc: ");
                    giagoc = s.nextFloat();
                }
                break;
            } catch (Exception ex) {
                System.err.println("\tPhải nhập số!!!");
                  s.nextLine();
            }
        }
        while (true) {
            try {
                System.out.printf("\tNhập VAT: ");
                this.vat = s.nextInt();
                while(vat < 0){
                    System.err.println("\tVAT phải lớn hơn 0!!!");  
                    System.out.printf("\tNhập lại VAT: ");
                    vat = s.nextInt();
                }
                break;
            } catch (Exception ex) {
                System.err.println("\tPhải nhập số!!!");
                  s.nextLine();
            }
        }
        
    }
    public void output() {
        System.out.printf("%2d %-15s %-15s %3d %8.2f %2d\n",
        this.mahh, this.tenhh, this.nhasx, this.soluong, this.giagoc, this.vat);
    }
}
