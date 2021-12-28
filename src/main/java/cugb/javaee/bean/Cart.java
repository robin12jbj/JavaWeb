package cugb.javaee.bean;

import java.util.HashMap;
import java.util.Hashtable;

public class Cart {
 HashMap<Integer,CartItem> menus;

    public HashMap getMenus() {
        return menus;
    }

    public Cart() {
        menus=new HashMap<Integer,CartItem>();//初始化
        menus.clear();//清除hashmap中所有数据

    }

    public void addMenu(CartItem cartItem){
        menus.put(cartItem.getDish().getDishid(),cartItem);//将cartitem添加到hashmap中，key保存dishid，value保存cartitem项


    }

    public void deleteMenu(CartItem cartItem){
        menus.remove(cartItem.getDish().getDishid());//删除menus中的项
    }
}
