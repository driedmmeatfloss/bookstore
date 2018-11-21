/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java.user;


public class Manager {
    private String username;
    private String passworld;
    private String tel;
    private String gader;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassworld() {
        return passworld;
    }

    public void setPassworld(String passworld) {
        this.passworld = passworld;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getGader() {
        return gader;
    }

    public void setGader(String gader) {
        this.gader = gader;
    }

    @Override
    public String toString() {
        return "Manager{" + "username=" + username + ", passworld=" + passworld + ", tel=" + tel + ", gader=" + gader + '}';
    }
    
}
