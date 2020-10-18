package com.Bank;

/**
 * @author hongbin hu
 * @PackageName:com.Bank
 * @ClassName: UseAccount
 * @Description:
 * @date 2020/9/18 10:02
 */
public class UseAccount {
    public static void main(String[] args) {
        BankAccount ba = new BankAccount(88888, 0.01);
        System.out.println(ba.toString());
        ba.getMoney(100);
        System.out.println("取钱100后当前余额：" +ba.getBanlance());
        ba.saveMoney(1000);
        System.out.println("存钱1000后当前余额：" +ba.getBanlance());
        System.out.println("当前利率：" + ba.getRate());
        ba.setRate(0.02);
        System.out.println("设置修改后的利率利率：" + ba.getRate());
    }
}
