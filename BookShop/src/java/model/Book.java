package model;

import java.io.Serializable;
import java.text.DecimalFormat;

/**
 * Represents a book with basic information such as ISBN, title, author, and price.
 */
public class Book implements Serializable {

    private String isbn;
    private String title;
    private String author;
    private double price;

    /**
     * Constructs a new Book object with the given details.
     *
     * @param isbn   The ISBN (International Standard Book Number) of the book.
     * @param title  The title of the book.
     * @param author The author of the book.
     * @param price  The price of the book.
     */
    public Book(String isbn, String title, String author, double price) {
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.price = price;
    }

    /**
     * Retrieves the ISBN of the book.
     *
     * @return The ISBN of the book.
     */
    public String getIsbn() {
        return isbn;
    }

    /**
     * Retrieves the title of the book.
     *
     * @return The title of the book.
     */
    public String getTitle() {
        return title;
    }

    /**
     * Retrieves the author of the book.
     *
     * @return The author of the book.
     */
    public String getAuthor() {
        return author;
    }

    /**
     * Retrieves the price of the book.
     *
     * @return The price of the book.
     */
    public double getPrice() {
        return price;
    }

    /**
     * Returns a string representation of the book, including the title.
     *
     * @return A string representation of the book.
     */
    @Override
    public String toString() {
        return "Title: " + title;
    }

    /**
     * Retrieves the price of the book formatted as a dollar amount.
     *
     * @return The price of the book formatted as a dollar amount.
     */
    public String getDollarPrice() {
        DecimalFormat formatter = new DecimalFormat("0.00");
        return "$" + formatter.format(price);
    }
}
