package com.niit.bean;

public class Donate {
    private Integer id;
    private String name;
    private Integer caid;
    private String publish;
    private String author;
    private String picurl;
    private Integer uid;
    private Integer status;
    private String category;
    private String username;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCaid() {
        return caid;
    }

    public void setCaid(Integer caid) {
        this.caid = caid;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Donate{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", caid=" + caid +
                ", publish='" + publish + '\'' +
                ", author='" + author + '\'' +
                ", picurl='" + picurl + '\'' +
                ", uid=" + uid +
                ", status=" + status +
                '}';
    }
}
