package model;

import java.io.Serializable;
import java.text.DecimalFormat;

/**
 * Represents an item in a shopping cart, including the book and its quantity.
 */
public class CartItem implements Serializable {

    private Tbooks book;
    private int quantity = 0;
    private double costOfItem = 0.00;

    /**
     * Constructs a CartItem object with the specified Tbooks.
     *
     * @param book The Tbooks to be included in the cart item.
     */
    public CartItem(Tbooks book) {
        this.book = book;
        calculateOrderCost();
    }

    public CartItem(Book book) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * Adds the specified quantity to the current quantity and updates the total cost of the item.
     *
     * @param aQuantity The quantity to add.
     */
    public void setQuantity(int aQuantity) {
        quantity += aQuantity;
        calculateOrderCost();
    }

    /**
     * Updates the quantity of the book and recalculates the total cost of the item.
     *
     * @param newQuantity The new quantity of the book.
     */
    public void updateQuantity(int newQuantity) {
        quantity = newQuantity;
        calculateOrderCost();
    }

    /**
     * Calculates the total cost of the item based on the quantity and price of the book.
     */
    private void calculateOrderCost() {
        costOfItem = quantity * book.getPrice();
    }

    /**
     * Retrieves the total cost of the item in dollars.
     *
     * @return The total cost of the item in dollars.
     */
    public double getDollarOrderCost() {
        return costOfItem;
    }

    /**
     * Retrieves the formatted total cost of the item in dollars.
     *
     * @return The formatted total cost of the item in dollars.
     */
    public String getFormattedDollarOrderCost() {
        DecimalFormat cost = new DecimalFormat("0.0");
        return "$" + cost.format(costOfItem);
    }

    /**
     * Returns a string representation of the cart item, including the book details and quantity.
     *
     * @return A string representation of the cart item.
     */
    @Override
    public String toString() {
        return book + "          " + "quantity: " + quantity;
    }

    /**
     * Retrieves the Tbooks associated with this cart item.
     *
     * @return The Tbooks associated with this cart item.
     */
    public Tbooks getBook() {
        return book;
    }

    /**
     * Retrieves the total cost of the item.
     *
     * @return The total cost of the item.
     */
    public double getOrderCost() {
        return costOfItem;
    }

    /**
     * Retrieves the quantity of the book in this cart item.
     *
     * @return The quantity of the book.
     */
    public int getQuantity() {
        return quantity;
    }
}
