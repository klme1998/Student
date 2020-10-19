package com.excellent.model;

public class Admin {
    private int admId;
    private String admName;
    private String admPass;
    public Admin() {
    }

    public Admin(int admId, String admName) {
        this.admId = admId;
        this.admName = admName;
    }

    public String getAdmPass() {
        return admPass;
    }

    public void setAdmPass(String admPass) {
        this.admPass = admPass;
    }

    public int getAdmId() {
        return admId;
    }

    public void setAdmId(int admId) {
        this.admId = admId;
    }

    public String getAdmName() {
        return admName;
    }

    public void setAdmName(String admName) {
        this.admName = admName;
    }
}
