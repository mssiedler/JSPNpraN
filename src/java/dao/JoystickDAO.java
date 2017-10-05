/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Joystick;

/**
 *
 * @author valen
 */
public class JoystickDAO extends GenericDAO<Joystick, Integer>{
    
    public JoystickDAO(){
        super(Joystick.class);
    }
    
}
