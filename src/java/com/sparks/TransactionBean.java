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
public class TransactionBean {
   
        int transid; 
        String to_from, trans_amt ,dated, name ;

    public int getTransid() {
        return transid;
    }

    public String getTo_from() {
        return to_from;
    }

    public String getTrans_amt() {
        return trans_amt;
    }

    public String getDated() {
        return dated;
    }

    public String getName() {
        return name;
    }

    public TransactionBean(int transid, String to_from, String trans_amt, String dated, String name) {
        this.transid = transid;
        this.to_from = to_from;
        this.trans_amt = trans_amt;
        this.dated = dated;
        this.name = name;
    }

    public void setTransid(int transid) {
        this.transid = transid;
    }

    public void setTo_from(String to_from) {
        this.to_from = to_from;
    }

    public void setTrans_amt(String trans_amt) {
        this.trans_amt = trans_amt;
    }

    public void setDated(String dated) {
        this.dated = dated;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
