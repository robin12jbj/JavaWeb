package cugb.javaee.bean;

public class CartItem {
    private  Dish dish;//当前菜品
    private  int quantity;//菜品数量

    @Override
    public String toString() {
        return "CartItem{" +
                "dish=" + dish +
                ", quantity=" + quantity +
                '}';
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public CartItem(Dish dish, int quantity) {
        this.dish = dish;
        this.quantity = quantity;
    }


}
