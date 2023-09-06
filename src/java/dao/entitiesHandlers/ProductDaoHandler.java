package dao.entitiesHandlers;

import dao.EntityDaoHandler;
import modelo.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDaoHandler implements EntityDaoHandler<Product> {

    @Override
    public String getAddQuery() {
        return "insert into Product(product_name, price, stock) values(?,?,?)";
    }

    @Override
    public String getUpdateQuery() {
        return "update Product set product_name = ?, price = ?, stock = ? where id = ?";
    }

    @Override
    public String getDeleteQuery() {
        return "delete from Product where id = ?";
    }

    @Override
    public String getSearchQuery() {
        return "select * from Product where id = ?";
    }

    @Override
    public String getListAllQuery() {
        return "select * from Product";
    }

    @Override
    public void setSaveParameters(PreparedStatement preparedStatement, Product product) throws SQLException {
        preparedStatement.setString(1, product.getProductName());
        preparedStatement.setDouble(2, product.getPrice());
        preparedStatement.setInt(3, product.getStock());
    }

    @Override
    public void setUpdateParameters(PreparedStatement preparedStatement, Product model) throws SQLException {
        setSaveParameters(preparedStatement, model);
        System.out.println(model.getId());
        System.out.println(model.getProductName());
        preparedStatement.setInt(4, model.getId());
    }

    @Override
    public Product resultSetToEntity(ResultSet resultSet) throws SQLException {
        return new Product(
                resultSet.getInt("id"),
                resultSet.getString("product_name"),
                resultSet.getDouble("price"),
                resultSet.getInt("stock")
        );
    }
}
