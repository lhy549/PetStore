package com.lanhuayan.petstore.entity;

public class Pet {

    private Integer id;

    private Integer categoryid;

    private String name;

    private String photourls;

    private String tagid;

    private String petstatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhotourls() {
        return photourls;
    }

    public void setPhotourls(String photourls) {
        this.photourls = photourls == null ? null : photourls.trim();
    }

    public String getTagid() {
        return tagid;
    }

    public void setTagid(String tagid) {
        this.tagid = tagid == null ? null : tagid.trim();
    }

    public String getPetstatus() {
        return petstatus;
    }

    public void setPetstatus(String petstatus) {
        this.petstatus = petstatus == null ? null : petstatus.trim();
    }
}