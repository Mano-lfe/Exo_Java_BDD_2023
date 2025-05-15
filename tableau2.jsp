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



