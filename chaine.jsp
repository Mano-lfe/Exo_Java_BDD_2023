<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String bonjour = "salut la compagnie";
%>
    // Original string
    String bonjour = "salut la compagnie";

    // Convert to uppercase
    String bonjourMajuscules = bonjour.toUpperCase();

    // Capitalize only the first letter (manual logic)
    String bonjourCapitalise = "";
    if (bonjour != null && bonjour.length() > 0) {
        bonjourCapitalise = bonjour.substring(0, 1).toUpperCase() + bonjour.substring(1);
    }
%>
