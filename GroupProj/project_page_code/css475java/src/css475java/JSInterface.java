package css475java;

import java.sql.*;
import java.io.File;
import org.json.JSONObject;
import org.json.JSONException;


/**
 * This is the main class for interacting with the Access database. Each public method on
 * this class is meant to perform a database operation except for the special function
 * "loaded" that should not be changed or removed. This function is used in the JavaScript
 * code on each web page to deal with timing of the overall Java application interface
 * being ready for further calls.
 */
public class JSInterface {
	String connectionString = "jdbc:ucanaccess://./Point-of-Sale-Query.accdb";

	 public Boolean loaded() {
		 return true;
	 }
	 
	 public String getCustomerList() {
		 
		 /* Perform database operations */
		 try {
			 
			 /* Attempt to connect to database */
			 Connection conn = DriverManager.getConnection(connectionString);
			 
			 /* Prepare SQL for Execution */
			 String sql = "SELECT customerNumber,customerName FROM Customer ORDER BY CustomerName";
			 PreparedStatement stmt = conn.prepareStatement(sql);
			 
			 /* Perform Query Operation */
			 ResultSet rows = stmt.executeQuery();
			 
			 /* Convert Output into a JSON formatted string to return to caller */
			 StringBuilder results = new StringBuilder();
			 results.append("{ \"data\": [");
			 String connector = "";
			 while (rows.next() ) {
				 results.append(connector);
				 connector = ",";
				 results.append("{");
				 results.append("\"customerNumber\": ");
				 results.append(rows.getString("customerNumber"));
				 results.append(",\n\"customerName\": \"");
				 results.append(rows.getString("customerName"));
				 results.append("\"}");
			 }
			 results.append("]}");
			 
			 /* Conclude Connection */
			 conn.close();
			 
			 /* Return Results Back to Caller */
			 return results.toString();
		 }
		 catch (SQLException e) {
			 /* Return Error as JSON Formatted String */
			 return "{ error: \"" + e.getMessage() + "<br>" + connectionString + "\"}";
		 }
 	}

	 public String getCustomer(String id) {
		 try {
			 
			 /* Attempt to connect to database */
			 Connection conn = DriverManager.getConnection(connectionString);
			 
			 /* Prepare SQL for Execution - Note that each input parameter is marked with a question mark*/
			 String sql = "SELECT customerNumber,customerName,streetAddress,cityName,stateCode,postalCode FROM Customer C " +
				"INNER JOIN Address A ON C.defaultAddressID = A.addressID WHERE customerNumber = ?";
			 PreparedStatement stmt = conn.prepareStatement(sql);
			 
			 /* Provide a value for each input parameter */
			 stmt.setInt(1, Integer.parseInt(id));

			 /* Perform Query Operation */
			 ResultSet rows = stmt.executeQuery();
			 
			 /* Convert Output into a JSON formatted string to return to caller */
			 StringBuilder results = new StringBuilder();
			 results.append("{ \"data\": [");
			 String connector = "";
			 while (rows.next() ) {
				 results.append(connector);
				 connector = ",";
				 results.append("{");
				 results.append("\"customerNumber\": ");
				 results.append(rows.getString("customerNumber"));
				 results.append(",\n\"customerName\": \"");
				 results.append(rows.getString("customerName"));
				 results.append("\",\n\"streetAddress\": \"");
				 results.append(rows.getString("streetAddress"));
				 results.append("\",\n\"cityName\": \"");
				 results.append(rows.getString("cityName"));
				 results.append("\",\n\"stateCode\": \"");
				 results.append(rows.getString("stateCode"));
				 results.append("\",\n\"postalCode\": \"");
				 results.append(rows.getString("postalCode"));
				 results.append("\"}");
			 }
			 results.append("]}");
			 
			 /* Conclude Connection */
			 conn.close();
			 
			 /* Return Results Back to Caller */
			 return results.toString();
		 }
		 catch (SQLException e) {
			 /* Return Error as JSON Formatted String */
			 return "{ error: \"" + e.getMessage() + "<br>" + connectionString + "\"}";
		 }
 	}

	 public String updateCustomer(String source) throws JSONException {
		 try {

			 /* Parse JSON */
			 JSONObject json = new JSONObject(source);
			 JSONObject data = json.getJSONObject("data");
			 
			 /* Attempt to connect to database */
			 Connection conn = DriverManager.getConnection(connectionString);
			 
			 /* Prepare SQL for Execution - Note that each input parameter is marked with a question mark*/
			 String sql = "UPDATE Customer SET CustomerName = ? WHERE CustomerNumber = ?";
			 PreparedStatement stmt = conn.prepareStatement(sql);
			 
			 /* Provide a value for each input parameter */
			 stmt.setString(1, data.getString("customerName"));
			 stmt.setInt(2, data.getInt("customerNumber"));

			 /* Perform Query Operation */
			 int count = stmt.executeUpdate();
			 conn.commit();
			 
			 /* Conclude Connection */
			 conn.close();
			 
			 /* Return Results Back to Caller - how many rows updated*/
			 return "{\"count\":" + Integer.toString(count) + "}";
		 }
		 catch (SQLException e) {
			 /* Return Error as JSON Formatted String */
			 return "{ error: \"" + e.getMessage() + "<br>" + connectionString + "\"}";
		 }
 	}

}
