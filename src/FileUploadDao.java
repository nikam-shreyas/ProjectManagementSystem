
import DBPackage.DatabaseConnection;import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class FileUploadDao {

    private static final String url = "jdbc:mysql://localhost:3306/wtl?useSSL=false";
    private static final String user = "root";
    private static final String password = "Password_1234";
    java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
    private static final String sql = "insert into PublicNoticeTable (notice, filename, fileup) values (?,?, ?, ?)";

    public int uploadFile(String notice, String filename, InputStream file) {
        int row = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        try (Connection connection = DriverManager
            .getConnection(url, user, password);
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement(sql)) {
        	preparedStatement.setDate(1, date);
            preparedStatement.setString(2, notice);
            preparedStatement.setString(3, filename);
            if (file != null) {
                // fetches input stream of the upload file for the blob column
                preparedStatement.setBlob(4, file);
            }

            // sends the statement to the database server
            row = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return row;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
