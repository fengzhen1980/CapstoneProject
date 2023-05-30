package com.CapstoneProject.reggie.common;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLIntegrityConstraintViolationException;

@ControllerAdvice(annotations = {RestController.class, Controller.class})
@ResponseBody
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    public R<String> exceptionHandler(SQLIntegrityConstraintViolationException ex) {
        log.error("*----> " + ex.getMessage());

        if(ex.getMessage().contains("Duplicate entry")) {
//            String[] split = ex.getMessage().split(" ");
//            String msg = split[2] + " is existed";
            int index1 = ex.getMessage().indexOf('\'');
            int index2 = ex.getMessage().indexOf('\'',index1 + 1);
            String msg = ex.getMessage().substring(index1, index2 + 1) + " is existed";
            return R.error(msg);
        }

        return R.error("Unknown error!");
    }

    @ExceptionHandler(CustomException.class)
    public R<String> exceptionHandler(CustomException ex) {
        log.error("*----> " + ex.getMessage());

        return R.error(ex.getMessage());
    }
}
