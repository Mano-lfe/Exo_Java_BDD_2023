import java.util.Scanner;
import java.util.Random;
import java.util.ArrayList;

public class JeuPendu {
    private String motADeviner;
    private char[] motCache;
    private int essaisRestants;
    private ArrayList<Character> lettresProposees;

    // Constructeur
    public JeuPendu() {
        String[] listeMots = {"ordinateur", "programme", "java", "souris", "clavier", "ecran", "internet", "serveur", "reseau", "developpeur"};
        Random random = new Random();
        motADeviner = listeMots[random.nextInt(listeMots.length)];
        motCache = new char[motADeviner.length()];
        for (int i = 0; i < motCache.length; i++) {
            motCache[i] = '_';
        }
        essaisRestants = 6;
        lettresProposees = new ArrayList<>();
    }

    public void jouer() {
        Scanner scanner = new Scanner(System.in);

        while (essaisRestants > 0 && !motTrouve()) {
            afficherEtat();
            System.out.print("Proposez une lettre : ");
            char lettre = scanner.nextLine().toLowerCase().charAt(0);

            if (lettresProposees.contains(lettre)) {
                System.out.println("Vous avez déjà proposé cette lettre !");
            } else {
                lettresProposees.add(lettre);
                if (motADeviner.indexOf(lettre) >= 0) {
                    // Révéler les lettres dans motCache
                    for (int i = 0; i < motADeviner.length(); i++) {
                        if (motADeviner.charAt(i) == lettre) {
                            motCache[i] = lettre;
                        }
                    }
                    System.out.println("Bien joué !");
                } else {
                    essaisRestants--;
                    System.out.println("Raté !");
                }
            }
        }

        if (motTrouve()) {
            System.out.println("\nBravo ! Vous avez trouvé le mot : " + motADeviner);
        } else {
            System.out.println("\nDommage... Le mot était : " + motADeviner);
        }
    }

    private boolean motTrouve() {
        for (char c : motCache) {
            if (c == '_') {
                return false;
            }
        }
        return true;
    }

    private void afficherEtat() {
        System.out.print("\nMot à deviner : ");
        for (char c : motCache) {
            System.out.print(c + " ");
        }
        System.out.println("\nLettres proposées : " + lettresProposees);
        System.out.println("Essais restants : " + essaisRestants);
    }
}

