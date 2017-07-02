/**
 * 
 */
package org.antunesleo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.antunesleo.jdbc.ConnectionFactory;
import org.antunesleo.model.Product;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author antunesleo
 *
 */
public class JdbcProductDao {
	private Connection connection = null;
	
	@Autowired
	public JdbcProductDao() {
		if (this.connection == null) {
			this.connection = new ConnectionFactory().getConnection(); 
		}
	}
	
	public List<Product> getList() {
		try {
			List<Product> products = new ArrayList<Product>();
			String sql = "SELECT * FROM product ORDER BY name";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("id"));
				product.setDescription(rs.getString("description"));
				product.setName(rs.getString("name"));
				product.setActive(rs.getBoolean("active"));
				product.setPrice(rs.getDouble("price"));
				products.add(product);
			}
			rs.close();
			stmt.close();
			return products;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void add(Product product) {
		try {
			String sql = "INSERT INTO product (description, name, active, price) "
					+ "VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, product.getDescription());
			stmt.setString(2, product.getName());
			stmt.setBoolean(3, product.isActive());
			stmt.setDouble(8, product.getPrice());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void update(Product product) {
		try {
			if (product.getId() != null) {
				String sql = "UPDATE product SET description = ?, name = ?, active = ?, price = ? "
						+ "WHERE id = ?";
				PreparedStatement stmt = this.connection.prepareStatement(sql);
				stmt.setString(1, product.getDescription());
				stmt.setString(2, product.getName());
				stmt.setBoolean(3, product.isActive());
				stmt.setDouble(8, product.getPrice());

				stmt.setLong(10, product.getId());
				stmt.execute();
				stmt.close();
			}
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void remove(Product product) {
		try {
			String sql = "DELETE FROM product WHERE id = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setLong(1, product.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Product findById(Long id) {
		try {
			if (id != null) {
				String sql = "SELECT * FROM product WHERE id = ?";
				PreparedStatement stmt = this.connection.prepareStatement(sql);
				stmt.setLong(1, id);
				ResultSet rs = stmt.executeQuery();
				Product product = new Product();
				while (rs.next()) {
					product.setId(rs.getLong("id"));
					product.setName(rs.getString("name"));
					product.setDescription(rs.getString("description"));
					product.setActive(rs.getBoolean("active"));
					product.setPrice(rs.getDouble("price"));
				}
				return product;
			}
			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public int getNumberOfRecords() {
		try {
			String sql = "SELECT COUNT(*) as numberRecords FROM product";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			int numberRecords = 0;
			while (rs.next()) {
				numberRecords = rs.getInt("numberRecords");
			}
			return numberRecords;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
