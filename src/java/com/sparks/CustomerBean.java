/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sparks;

/**
 *
 * @author lenovo
 */
public class CustomerBean {
    
    String name,emailid;
    float currentbal;

    public CustomerBean(String name, String emailid, float currentbal) {
        this.name = name;
        this.emailid = emailid;
        this.currentbal = currentbal;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public void setCurrentBal(float currentbal) {
        this.currentbal = currentbal;
    }

    public String getName() {
        return name;
    }

    public String getEmailid() {
        return emailid;
    }

    public float getCurrentbal() {
        return currentbal;
    }
    
    
}
