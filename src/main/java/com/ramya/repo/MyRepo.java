package com.ramya.repo;
import org.springframework.data.repository.CrudRepository;
import com.ramya.model.Student;
import org.springframework.data.jpa.repository.Query;

public interface MyRepo extends CrudRepository<Student, Integer> {
       @Query(value="Select * from student order by id desc limit 1", nativeQuery=true)
       public Student getLastStudent();
}

