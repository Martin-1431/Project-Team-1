import java.sql.*;
import java.util.Scanner;

public class AutoDBApp {

    static final String DB_URL = "jdbc:mysql://localhost:3306/autodb";
    static final String USER = "root";
    static final String PASS = "Samartin_1431"; // change this

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL driver not found!");
            e.printStackTrace();
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)) {
            System.out.println("Connected to database!");

            while (true) {
                System.out.println("\n===== MENU =====");
                System.out.println("1. Search Inventory");
                System.out.println("2. Sales Report");
                System.out.println("3. Top Brands");
                System.out.println("4. Exit");
                System.out.print("Choose: ");

                int choice = scanner.nextInt();
                scanner.nextLine();

                switch (choice) {
                    case 1:
                        searchInventory(conn, scanner);
                        break;
                    case 2:
                        salesReport(conn);
                        break;
                    case 3:
                        topBrands(conn);
                        break;
                    case 4:
                        System.out.println("Goodbye!");
                        return;
                    default:
                        System.out.println("Invalid option.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    static void searchInventory(Connection conn, Scanner scanner) throws SQLException {
        System.out.print("Enter brand: ");
        String brand = scanner.nextLine();

        System.out.print("Enter color: ");
        String color = scanner.nextLine();

        String query = """
            SELECT b.name, m.name, v.color, d.name
            FROM Inventory i
            JOIN Vehicle v ON i.vin = v.vin
            JOIN Model m ON v.model_id = m.model_id
            JOIN Brand b ON m.brand_id = b.brand_id
            JOIN Dealer d ON i.dealer_id = d.dealer_id
            WHERE b.name = ? AND v.color = ? AND i.sold = FALSE
        """;

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, brand);
        stmt.setString(2, color);

        ResultSet rs = stmt.executeQuery();

        System.out.println("\nAvailable Vehicles:");
        while (rs.next()) {
            System.out.println(
                rs.getString(1) + " " +
                rs.getString(2) + " (" +
                rs.getString(3) + ") at " +
                rs.getString(4)
            );
        }
    }

    static void salesReport(Connection conn) throws SQLException {
        String query = """
            SELECT YEAR(sale_date), COUNT(*)
            FROM Sales
            GROUP BY YEAR(sale_date)
        """;

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        System.out.println("\nSales by Year:");
        while (rs.next()) {
            System.out.println("Year: " + rs.getInt(1) + " Sales: " + rs.getInt(2));
        }
    }

    static void topBrands(Connection conn) throws SQLException {
        String query = """
            SELECT b.name, COUNT(*) as total
            FROM Sales s
            JOIN Vehicle v ON s.vin = v.vin
            JOIN Model m ON v.model_id = m.model_id
            JOIN Brand b ON m.brand_id = b.brand_id
            GROUP BY b.name
            ORDER BY total DESC
            LIMIT 2
        """;

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        System.out.println("\nTop Brands:");
        while (rs.next()) {
            System.out.println(rs.getString(1) + " - " + rs.getInt(2) + " sales");
        }
    }
}