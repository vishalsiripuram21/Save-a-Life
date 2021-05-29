/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author vishal
 */
public class Districts {
    private String name;
    public Districts(String district)
    {
        this.name = district;
    }
    public void setName(String dsit)
    {
        this.name = dsit;
    }
    public String getName()
    {
        return this.name;
    }
}
