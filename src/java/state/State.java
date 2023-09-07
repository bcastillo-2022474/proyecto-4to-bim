package state;

import modelo.Employee;

import java.util.HashMap;

public class State {
    // current User logged in
    public static Employee currentUser;
    public HashMap<String, Integer> carritosUser = new HashMap<String, Integer>();
}
