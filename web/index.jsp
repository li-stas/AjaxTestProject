<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.berest.entities.Student" %>
<%@ page import="com.berest.dao.OracleDAOConnection" %>
<%@ page import="com.berest.dao.DAOConnection" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: olbe0615
  Date: 22.03.2020
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajax Project</title>
</head>
<body>
<%
    String name = request.getParameter("val");
    DAOConnection daoConnection = OracleDAOConnection.getInstance();

    if (name == null || name.trim().equals("")) {
%>
<p>Please enter name!</p>
<%
    } else {
        try {
        // читаем
        List<Student> db;
        db = daoConnection.selectStartsWith(name);

        if (db.size() == 0) {
%>
<p>No Record Found!</p>
<%      } else { %>
<table border='1' cellpadding='2' width='100%'>
    <tr>
        <th>Id</th>        <th>Name</th>        <th>Email</th>        <th>Group</th>
    </tr>
    <%
        Student currentStudent = null;
        for (Student student : db) {
            if (student.getName().startsWith(name)) {
                currentStudent = student;
    %>
    <tr>
        <td><%=currentStudent.getId()%>        </td>
        <td><%=currentStudent.getName()%>        </td>
        <td><%=currentStudent.getEmail()%>        </td>
        <td><%=currentStudent.getGroup()%>        </td>
    </tr>
    <%
            }
        }
    %>


</table>
<% }
} catch (Exception e) { %>
<p>Some problems ...</p>
<% }
} %>
</body>
</html>
