     <button type="submit" name="action" value="afficher">Afficher le tableau</button>
        <button type="submit" name="action" value="vider">Vider le tableau</button>
    </form>

    <% if (!message.isEmpty()) { %>
        <div class="message"><%= message %></div>
    <% } %>

    <% if ("afficher".equals(action)) { %>
        <div class="output">
            <strong>Contenu du tableau :</strong><br>
            <% if (tableau.isEmpty()) { %>
                Le tableau est vide.
            <% } else { %>
                <%= tableau.toString() %>
            <% } %>
        </div>
    <% } %>
</div>

</body>
</html>
