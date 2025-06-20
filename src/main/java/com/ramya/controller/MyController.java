package com.ramya.controller;

import com.ramya.model.Student;
import com.ramya.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {

    @Autowired
    public StudentService service;

    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("id", service.getlastId());
        mv.addObject("data", service.stdGet());
        return mv;
    }
    @PostMapping("Add")
    public String Add(Student s1) {
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("data", service.stdGet());
        mv.addObject("id", service.getlastId());
        service.stdAdd(s1);
        return "redirect:/";
    }
    @PostMapping("Dlt")
    public String Dlt(@RequestParam(value="dlt") Integer id) {
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("data", service.stdGet());
        mv.addObject("id", service.getlastId());
        service.StdDlt(id);
        return "redirect:/";
    }
}