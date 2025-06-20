package com.ramya.service;

import com.ramya.model.Student;
import com.ramya.repo.MyRepo;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {

    @Autowired
    public MyRepo rep;

    public void stdAdd(Student s) {
        rep.save(s);
    }

    public List<Student> stdGet() {
        List<Student> alldata = new ArrayList();
        rep.findAll().forEach((s) -> {
            alldata.add(s);
        });
        return alldata;

    }

    public Integer getlastId() {
        Integer id = null;
        try {
            id = rep.getLastStudent().getId() + 1;
        }
        catch(Exception ex){
            System.out.println(ex);
        }
            return (id != null) ? id : 1;

    }
    public void StdDlt(Integer id){
          rep.deleteById(id);
    }
}
