package dao;

import java.sql.SQLException;
import java.util.List;

public interface Crud<M> {
    public void save(M model) throws Exception;

    public void update(M model) throws Exception;

    public void delete(int id) throws Exception;

    public M get(int id) throws Exception;

    public List<M> getAll() throws Exception;
}
