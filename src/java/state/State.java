package state;

import config.Tuple;
import modelo.Employee;

import java.util.HashMap;

public class State {
    // current User logged in
    public static Employee currentUser;
    public static HashMap<Integer, Tuple<Integer, String>> selectedProducts = new HashMap<Integer, Tuple<Integer, String>>();
    public HashMap<String, Integer> carritosUser = new HashMap<String, Integer>();
}
