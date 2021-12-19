package entity;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Admin
 */
@Getter
@Setter
public class Mentee {
    private int id;
    private String name;
    private String accountName;
    private int totalHours;
    private int totalSkill;
    private String avatar;
}
