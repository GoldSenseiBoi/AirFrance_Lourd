package vue;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;

import controleur.Controleur;
import controleur.Passager;
import controleur.Reservations;
import controleur.Tableau;
import controleur.Vols;

public class PanelReservations extends PanelPrincipal implements ActionListener {

    private JComboBox<String> txtIdPassager = new JComboBox<String>();
    private JComboBox<String> txtIdVol = new JComboBox<String>();
    private JTextField txtDateReservation = new JTextField();
    private JTextField txtSiegeAttribue = new JTextField();
    
    private JButton btEnregistrer = new JButton("Enregistrer");
    private JButton btAnnuler = new JButton("Annuler");
    
    private JTable tableReservations;
    private JScrollPane uneScroll;
    private Tableau unTableau;
    
    private JPanel panelForm  = new JPanel(); 
    private JLabel nbReservations = new JLabel("Nombre de réservations : 0");

    public PanelReservations() {
        super("Gestion des Réservations");
        
        // Construction du panel pour ajouter une réservation
        this.panelForm.setBackground(new Color(240, 248, 255));
        this.panelForm.setBounds(1140, 170, 330, 500);
        this.panelForm.setLayout(new GridLayout(6, 2));
        this.panelForm.add(new JLabel("ID Passager :"));
        this.panelForm.add(this.txtIdPassager);
        this.panelForm.add(new JLabel("ID Vol :"));
        this.panelForm.add(this.txtIdVol);
        this.panelForm.add(new JLabel("Date de réservation :"));
        this.panelForm.add(this.txtDateReservation);
        this.panelForm.add(new JLabel("Siège attribué :"));
        this.panelForm.add(this.txtSiegeAttribue);
        this.panelForm.add(this.btAnnuler);
        this.panelForm.add(this.btEnregistrer);
        this.panelForm.add(nbReservations);  // Ajout du label pour le nombre de réservations
        this.add(this.panelForm);
        
        // Construction de la table des réservations
        String[] entetes = {"ID Réservation", "ID Passager", "ID Vol", "Date de réservation", "Siège attribué"};
        this.unTableau = new Tableau(this.obtenirDonnees(""), entetes);
        this.tableReservations = new JTable(this.unTableau);
        this.uneScroll = new JScrollPane(this.tableReservations);
        this.uneScroll.setBounds(40, 170, 1000, 500);
        this.add(this.uneScroll);
        
        // Remplissage des JComboBox avec les données disponibles
        remplirCBXPassagers();
        remplirCBXVols();
        
        // Ajout des ActionListener aux boutons
        this.btEnregistrer.addActionListener(this);
        this.btAnnuler.addActionListener(this);
        
        // Ajout du MouseListener à la table des réservations
        this.tableReservations.addMouseListener(new MouseListener() {
            @Override
            public void mouseReleased(MouseEvent e) {}

            @Override
            public void mousePressed(MouseEvent e) {}

            @Override
            public void mouseExited(MouseEvent e) {}

            @Override
            public void mouseEntered(MouseEvent e) {}

            @Override
            public void mouseClicked(MouseEvent e) {
                int numLigne, idResa;
                if (e.getClickCount() >= 2) {
                    numLigne = tableReservations.getSelectedRow();
                    idResa = Integer.parseInt(unTableau.getValueAt(numLigne, 0).toString());
                    int reponse = JOptionPane.showConfirmDialog(null, "Voulez-vous supprimer la réservation ?", "Suppression de la réservation", JOptionPane.YES_NO_OPTION);
                    if (reponse == 0) {
                        // Suppression en BDD
                        Controleur.deleteReservation(idResa);
                        // Actualisation de l'affichage
                        unTableau.setDonnees(obtenirDonnees(""));
                        mettreAJourNbReservations();
                    }
                } else if (e.getClickCount() >= 1) {
                    numLigne = tableReservations.getSelectedRow();
                    txtIdPassager.setSelectedItem(unTableau.getValueAt(numLigne, 1).toString());
                    txtIdVol.setSelectedItem(unTableau.getValueAt(numLigne, 2).toString());
                    txtDateReservation.setText(unTableau.getValueAt(numLigne, 3).toString());
                    txtSiegeAttribue.setText(unTableau.getValueAt(numLigne, 4).toString());
                    btEnregistrer.setText("Modifier");
                }
            }
        });

        mettreAJourNbReservations(); // Initialisation du nombre de réservations
    }

    public void remplirCBXPassagers() {
        this.txtIdPassager.removeAllItems();
        ArrayList<Passager> lesPassagers = Controleur.selectAllPassagers(""); 
        for (Passager unPassager : lesPassagers) {
            this.txtIdPassager.addItem(unPassager.getIdPassager() + "-" + unPassager.getNom() + " " + unPassager.getPrenom());
        }
    }

    public void remplirCBXVols() {
        this.txtIdVol.removeAllItems(); 
        ArrayList<Vols> lesVols = Controleur.selectAllVols(""); 
        for (Vols unVol : lesVols) {
            this.txtIdVol.addItem(unVol.getIdVol() + "-" + unVol.getNumVol());
        }
    }

    public Object[][] obtenirDonnees(String filtre) {
        ArrayList<Reservations> lesReservations = Controleur.selectAllReservations(filtre);
        Object[][] matrice = new Object[lesReservations.size()][5];
        int i = 0;
        for (Reservations uneReservation : lesReservations) {
            matrice[i][0] = uneReservation.getIdReservation();
            matrice[i][1] = uneReservation.getIdPassager();
            matrice[i][2] = uneReservation.getIdVol();
            matrice[i][3] = uneReservation.getDateReservation();
            matrice[i][4] = uneReservation.getSiegeAttribue();
            i++;
        }
        return matrice;
    }

    private void mettreAJourNbReservations() {
        this.nbReservations.setText("Nombre de réservations : " + this.unTableau.getRowCount());
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == this.btEnregistrer && this.btEnregistrer.getText().equals("Enregistrer")) {
            String idPassagerString = this.txtIdPassager.getSelectedItem().toString();
            int idPassager = Integer.parseInt(idPassagerString.split("-")[0]);
            String idVolString = this.txtIdVol.getSelectedItem().toString();
            int idVol = Integer.parseInt(idVolString.split("-")[0]);
            String dateReservationText = this.txtDateReservation.getText();
            LocalDate dateReservation = LocalDate.parse(dateReservationText);
            String siegeAttribue = this.txtSiegeAttribue.getText();
            
            Reservations nouvelleReservation = new Reservations(0, idPassager, idVol, dateReservation, siegeAttribue);
            Controleur.insertReservation(nouvelleReservation);
            
            this.unTableau.setDonnees(this.obtenirDonnees(""));
            mettreAJourNbReservations();  // Mise à jour du nombre de réservations
            JOptionPane.showMessageDialog(this, "Réservation enregistrée avec succès !");
            
        } else if (e.getSource() == this.btEnregistrer && this.btEnregistrer.getText().equals("Modifier")) {
            String idPassagerString = this.txtIdPassager.getSelectedItem().toString();
            int idPassager = Integer.parseInt(idPassagerString.split("-")[0]);
            String idVolString = this.txtIdVol.getSelectedItem().toString();
            int idVol = Integer.parseInt(idVolString.split("-")[0]);
            String dateReservationText = this.txtDateReservation.getText();
            LocalDate dateReservation = LocalDate.parse(dateReservationText);
            String siegeAttribue = this.txtSiegeAttribue.getText();
            
            int numLigne = this.tableReservations.getSelectedRow();
            int idReservation = Integer.parseInt(this.unTableau.getValueAt(numLigne, 0).toString());
            
            Reservations nouvelleReservation = new Reservations(idReservation, idPassager, idVol, dateReservation, siegeAttribue);
            Controleur.updateReservation(nouvelleReservation);

            this.unTableau.setDonnees(this.obtenirDonnees(""));
            mettreAJourNbReservations();  // Mise à jour du nombre de réservations

            this.txtDateReservation.setText("");
            this.txtSiegeAttribue.setText("");
            this.btEnregistrer.setText("Enregistrer");
            JOptionPane.showMessageDialog(this, "Modification de la réservation effectuée avec succès.");
            
        } else if (e.getSource() == this.btAnnuler) {
            this.txtDateReservation.setText("");
            this.txtSiegeAttribue.setText("");
            this.btEnregistrer.setText("Enregistrer");
        }
    }
}

