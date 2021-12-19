/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Dao Van Do
 */
public class Point {
    int rate;
    int rateCount;

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getRateCount() {
        return rateCount;
    }

    public void setRateCount(int rateCount) {
        this.rateCount = rateCount;
    }

    public Point(int rate, int rateCount) {
        this.rate = rate;
        this.rateCount = rateCount;
    }

    public Point() {
    }
    
    
}
