
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.ramya.service.StudentService"%>
<%@page import="com.ramya.model.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            body{
                background-image: url("");
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .main {
                background-color: rgba(147, 140, 140, 0.474);
                padding: 20px;
                box-shadow: 7px 7px 10px grey;
                border-radius: 20px;
            }

            .btn {
                border-radius: 5px;
                font-size: 1.2rem;
                box-shadow: 3px 3px 5px grey;
            }

            .h1 {
                text-shadow: 2px 2px 5px rgb(100, 97, 97);

            }
            .table{
                background-color: rgba(122, 118, 118, 0.72);
                color: white;
                border-radius: 10px;

            }
            tr{
                font-size: 1.3rem;
            }
            .scrollable-table-container{
                height: 330px;
                overflow: auto;
            }
            .main1{
                padding: 10px;
                  background-color: rgba(147, 140, 140, 0.474);
                box-shadow: 7px 7px 10px grey;
                border-radius: 10px;
                width: 550px;
                margin: 0 auto;
                margin-bottom: 20px;             
            }
        </style>
    </head>
    <body>

        <div class="container  px-2">
            <h1 class="text-primary my-5 text-center text-uppercase h1 ">Future Tech Management</h1>
            <form action="Add" method="post">
                <div class="row">
                    <div class="col-md-6 main">
                                        <h3 class="text-center text-uppercase">Register Form</h3>

                        <div class="row">
                            <div class="col">
                                <label class="form-label">ID</label>        
                                <%  Integer id = Integer.parseInt(request.getAttribute("id").toString());%>
                                <input class="form-control" type="text" name="id" id="id" required value="<%=id%>">
                            </div>
                            <div class="col">
                                <label class="form-label">NAME</label>
                                <input class="form-control"  type="text" name="name" required>
                            </div>
                        </div><br>
                        <div class="row">
                            <div class="col">
                                <label class="form-label">AGE</label>
                                <input class="form-control"  type="text" name="age" required>
                            </div>
                            <div class="col">
                                <label class="form-label">CITY</label>
                                <input class="form-control"  type="text" name="city" required>
                            </div>
                        </div><br>
                        <div class="row ">
                            <label>Gender</label><br>
                            <div class="d-flex">
                                <div class="form-check form-check-inline ">
                                    <input type="radio" name="gender" value="Male" class="form-check-input" checked>
                                    <label class="form-check-label">Male</label>
                                </div>
                                <div class="form-check form-check-inline ">
                                    <input type="radio" name="gender" value="Female" class="form-check-input">
                                    <label class="form-check-label">Female</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" name="gender" value="others" class="form-check-input">
                                    <label class="form-check-label">Others</label>
                                </div>
                            </div>
                        </div><br>
                        <div class="row  text-center pb-3" style="margin-left:140px;">
                            <button class="btn btn-success col-md-3 mx-2" type="submit" name="btn" value="Add">Add</button>
                            <button class="btn btn-warning col-md-3 mx-2" id="clear" type="button" >Clear</button>
                        </div>
                        </form>
                    </div>
                    <div class="col-md-6 p-2">
                         <h3 class=" text-center text-uppercase main1">All user data</h3>
                        <div class="table-responsive scrollable-table-container">
                            <table class="table table-bordered table-striped text-center ">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Age</th>
                                        <th>City</th>
                                        <th>Gender</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%List<Student> li = (List<Student>) request.getAttribute("data");
                                        for (Student s : li) {%>
                                    <tr>

                                        <td><%out.println(s.getId());%></td>
                                        <td><%out.println(s.getName());%></td>
                                        <td><%out.println(s.getAge());%></td>
                                        <td><%out.println(s.getCity());%></td>
                                        <td><%out.println(s.getGender());%></td>

                                        <td>
                                            <form action="Dlt" method="post" style="display:inline">  
                                                <button class="btn btn-danger btn-sm" type="submit" style="width:80px;" name="dlt" value="<%=s.getId()%>">Delete</button>
                                            </form>
                                            <button class="btn btn-primary btn-sm" style="width:80px;" onclick="EditFun(<%=s.getId()%>, '<%=s.getName()%>',<%=s.getAge()%>, '<%=s.getCity()%>')" type="button">Edit</button>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </div>
                                    </div>
                                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                                        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                                crossorigin="anonymous"></script>
                                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                                        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
                                crossorigin="anonymous"></script>
                                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                                        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
                                crossorigin="anonymous"></script>
                                <script>
                                                let clear = document.getElementById("clear");
                                                clear.addEventListener("click", () => {
                                                    let inputs = document.getElementsByTagName("input");
                                                    for (let input of inputs) {
                                                        if (input.id !== "id") {
                                                            input.value = "";
                                                        }
                                                    }
                                                });
                                                function EditFun(id, name, age, city, gender) {
                                                    document.getElementById("id").value = id;
                                                    document.querySelector("input[name='name']").value = name;
                                                    document.querySelector("input[name='age']").value = age;
                                                    document.querySelector("input[name='city']").value = city;
                                                    document.querySelector("input[name='gender']").value = gender;

                                                }
                                </script>
                                </body>
                                </html>
