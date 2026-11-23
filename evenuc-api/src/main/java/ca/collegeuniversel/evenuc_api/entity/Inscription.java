package ca.collegeuniversel.evenuc_api.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(
        name = "inscription",
        uniqueConstraints = @UniqueConstraint(columnNames = {"etudiant_id", "evenement_id"})
)
public class Inscription {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "etudiant_id", nullable = false)
    private Utilisateur etudiant;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "evenement_id", nullable = false)
    private Evenement evenement;

    @Column(nullable = false, length = 20)
    private String statut = "EN_ATTENTE"; // EN_ATTENTE, CONFIRMEE, REFUSEE, ANNULEE, PRESENT, ABSENT

    @Column(name = "date_demande", nullable = false, updatable = false)
    private LocalDateTime dateDemande;

    @PrePersist
    protected void onCreate() {
        if (this.dateDemande == null) {
            this.dateDemande = LocalDateTime.now();
        }
    }

    public Inscription() {}

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Utilisateur getEtudiant() { return etudiant; }
    public void setEtudiant(Utilisateur etudiant) { this.etudiant = etudiant; }

    public Evenement getEvenement() { return evenement; }
    public void setEvenement(Evenement evenement) { this.evenement = evenement; }

    public String getStatut() { return statut; }
    public void setStatut(String statut) { this.statut = statut; }

    public LocalDateTime getDateDemande() { return dateDemande; }
    public void setDateDemande(LocalDateTime dateDemande) { this.dateDemande = dateDemande; }
}