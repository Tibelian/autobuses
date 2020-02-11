<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    if(session.getAttribute("pagina") != null){
        response.sendRedirect((String)session.getAttribute("pagina"));
    }else{
        response.sendRedirect("./inicio.jsp");
    }
    
%>