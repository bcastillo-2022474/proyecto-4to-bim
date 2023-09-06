package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface EntityDaoHandler<M> {
    String getAddQuery();

    String getUpdateQuery();

    String getDeleteQuery();

    String getSearchQuery();

    String getListAllQuery();

    void setSaveParameters(PreparedStatement preparedStatement, M model) throws SQLException;

    void setUpdateParameters(PreparedStatement preparedStatement, M model) throws SQLException;

    M resultSetToEntity(ResultSet resultSet) throws SQLException;
}
