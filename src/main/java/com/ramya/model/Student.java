
package com.ramya.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Student {

       @Id
    private Integer id;
    private String uname;
    private String age;
    private String city;
    private String gender;
    
    public int getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return uname;
    }

    public void setName(String uname) {
        this.uname = uname;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
      @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name=" + uname + ", age=" + age + ", city=" + city + ", gender=" + gender + '}';
    }

}
