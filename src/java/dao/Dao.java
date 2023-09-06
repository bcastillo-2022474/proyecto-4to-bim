package dao;

import config.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Dao<M> implements Crud<M> {

    protected final Connection dbConnection = new DBConnection().getConnection();
    protected final EntityDaoHandler<M> entityDao;

    public Dao(EntityDaoHandler<M> entityDao) {
        this.entityDao = entityDao;
    }

    @Override
    public void save(M model) throws Exception {
        try {
            PreparedStatement preparedStatement = dbConnection.prepareStatement(entityDao.getAddQuery());
            entityDao.setSaveParameters(preparedStatement, model);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("no se ha podido guardar en la base de datos");
        }
    }

    @Override
    public void update(M model) throws Exception {
        try {
            PreparedStatement preparedStatement = dbConnection.prepareStatement(entityDao.getUpdateQuery());
            entityDao.setUpdateParameters(preparedStatement, model);
            System.out.println("UPDATE");
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new Exception("no se ha podido actualizar en la base de datos");
        }

    }

    @Override
    public void delete(int id) throws Exception {
        try {
            PreparedStatement preparedStatement = dbConnection.prepareStatement(entityDao.getDeleteQuery());
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new Exception("no se ha podido eliminar en la base de datos");
        }
    }

    @Override
    public M get(int id) throws Exception {
        try {
            PreparedStatement preparedStatement = dbConnection.prepareStatement(entityDao.getSearchQuery());
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return entityDao.resultSetToEntity(resultSet);
            }
        } catch (Exception e) {
            throw new Exception("no se ha podido encontrar el dato en la base de datos");
        }
        return null;
    }

    @Override
    public List<M> getAll() throws Exception {
        try {
            PreparedStatement preparedStatement = dbConnection.prepareStatement(entityDao.getListAllQuery());
            ResultSet resultSet = preparedStatement.executeQuery();
            final List<M> list = new ArrayList<M>();
            while (resultSet.next()) {
                final M model = entityDao.resultSetToEntity(resultSet);
                list.add(model);
            }
            return list;
        } catch (Exception e) {
            throw new Exception("no se ha podido obtener la lista de datos en la base de datos");
        }
    }
}
