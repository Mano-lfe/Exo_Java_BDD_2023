%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Récupération du tableau depuis la session
    List<Integer> tableau = (List<Integer>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<>();
        session.setAttribute("tableau", tableau);
    }
String message = "";
    String action = request.getParameter("action");

    if ("ajouter".equals(action)) {
        String val = request.getParameter("valeur");
        try {
            int valeur = Integer.parseInt(val);
            if (tableau.size() < 10) {
                tableau.add(valeur);
                message = "Valeur ajoutée avec succès.";
            } else {
   message = "Erreur : le tableau est plein.";
            }
        } catch (Exception e) {
            message = "Erreur : valeur invalide.";
        }
    } else if ("supprimer".equals(action)) {
        if (!tableau.isEmpty()) {
            tableau.remove(tableau.size() - 1);
            message = "Dernière valeur supprimée.";
        } else {
            message = "Erreur : tableau vide, rien à supprimer.";
        }
 } else if ("vider".equals(action)) {
        tableau.clear();
        message = "Tableau vidé avec succès.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion de Tableau</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 40px;
        }
 .container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px #ccc;
            max-width: 500px;
            margin: auto;
        }
        input[type="number"] {
            width: 100px;
            padding: 8px;
        }
        button {
            padding: 10px 20px;
            margin: 5px;
        }
        .message {
            margin-top: 20px;
            padding: 10px;
            background-color: #e7f3fe;
            border: 1px solid #2196F3;
            color: #0b5394;
            border-radius: 5px;
        }



