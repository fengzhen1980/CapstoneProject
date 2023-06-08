package com.CapstoneProject.reggie.dto;

import com.CapstoneProject.reggie.entity.Setmeal;
import com.CapstoneProject.reggie.entity.SetmealDish;
import lombok.Data;
import java.util.List;

@Data
public class SetmealDto extends Setmeal {

    private List<SetmealDish> setmealDishes;

    private String categoryName;
}
