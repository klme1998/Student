package com.Bank;
/**
 * @author hongbin hu
 * @PackageName:com.Bank
 * @ClassName: BankAccount
 * @Description:
 * @date 2020/9/18 9:51
 */
public class BankAccount {

    private double banlance;
    private  double rate;

    public BankAccount(double banlance, double rate) {
        this.banlance = banlance;
        this.rate = rate;
    }
   //查询当前余额
    public double getBanlance() {
        return banlance;
    }

    public void setBanlance(double banlance) {
        this.banlance = banlance;
    }
    //查询当前利率
    public double getRate() {
        return rate;
    }
    //设置当前利率
    public void setRate(double rate) {
        this.rate = rate;
    }
/*
*
 * @Author 胡洪彬
 * @Description //存款
 * @Date 10:20 2020/9/18
 * @Param 
 * @return void
 **/
    public void saveMoney(double money){
      this.banlance +=money;
    }
    /*
    *
     * @Author 胡洪彬
     * @Description //取款操作
     * @Date 10:20 2020/9/18
     * @Param
     * @return void
     **/
    public void getMoney(double money){
        if(money<=this.banlance)
            this.banlance -=money;
        else
            System.out.println("对不起，您的帐户余额不足！");
    }

    @Override
    public String toString() {
        return "当前账户" +
                "当前余额" + banlance +
                "当前利率" + rate;
    }
}
