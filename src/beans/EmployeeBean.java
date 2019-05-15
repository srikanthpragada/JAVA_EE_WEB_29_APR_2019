package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class EmployeeBean {
	private int id, salary;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int update() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // load driver 
		} catch (Exception ex) {
            System.out.println(ex.getMessage());
            return -1;
		}

		try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr")) {
			PreparedStatement ps = con.prepareStatement("update employees set salary = ? where employee_id = ?");
			ps.setInt(1, salary);
			ps.setInt(2, id);
			return ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return -1;
		}
	}
}
