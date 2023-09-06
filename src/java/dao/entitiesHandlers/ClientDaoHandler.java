package dao.entitiesHandlers;

import dao.EntityDaoHandler;
import modelo.Client;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClientDaoHandler implements EntityDaoHandler<Client> {

    @Override
    public String getAddQuery() {
        return "insert into Client(DPI, names, address) values (?, ?, ?)";
    }

    @Override
    public String getUpdateQuery() {
        return "update Client set DPI = ?, names = ?, address = ? where id = ?";
    }

    @Override
    public String getDeleteQuery() {
        return "delete from Client where id = ?";
    }

    @Override
    public String getSearchQuery() {
        return "select * from Client where id = ?";
    }

    @Override
    public String getListAllQuery() {
        return "select * from Client";
    }

    @Override
    public void setSaveParameters(PreparedStatement preparedStatement, Client model) throws SQLException {
        preparedStatement.setString(1, model.getDPI());
        preparedStatement.setString(2, model.getNames());
        preparedStatement.setString(3, model.getAddress());
    }

    @Override
    public void setUpdateParameters(PreparedStatement preparedStatement, Client model) throws SQLException {
        setSaveParameters(preparedStatement, model);
        preparedStatement.setInt(4, model.getId());
    }

    @Override
    public Client resultSetToEntity(ResultSet resultSet) throws SQLException {
        return new Client(
                resultSet.getInt("id"),
                resultSet.getString("DPI"),
                resultSet.getString("names"),
                resultSet.getString("address")
        );
    }
}
