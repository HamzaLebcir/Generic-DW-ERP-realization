from Dim.dim_account import dim_account
from Dim.dim_categorie import dim_categorie
from Dim.dim_client import dim_client
from Dim.dim_department import dim_department
from Dim.dim_detail_commande_achat import dim_detail_commande_achat
from Dim.dim_detail_commande_vente import dim_detail_commande_vente
from Dim.dim_detail_facture_achat import dim_detail_facture_achat
from Dim.dim_detail_facture_vente import Dim_Detail_Facture_Vente
from Dim.dim_emploi import dim_emploi
from Dim.dim_employee import dim_employee
from Dim.dim_entrepot import dim_entrepot
from Dim.dim_fournisseur import dim_fournisseur
from Dim.dim_machine import dim_machine
from Dim.dim_magasin import dim_magasin
from Dim.dim_operation import dim_operation
from Dim.dim_paiement_client import dim_paiement_client
from Dim.dim_paiement_fournisseur import dim_paiement_fournisseur
from Dim.dim_produit import dim_produit
from Dim.dim_region import dim_region
from Dim.dim_sous_categorie import dim_sous_categorie
from Dim.dim_transport import dim_transport
from Dim.dim_type_competence import dim_type_competence
from Dim.dim_type_expedition import dim_type_expedition
from Fact.fact_achat import fact_achat
from Fact.fact_commande_achat import fact_commande_achat
from Fact.fact_commande_vente import fact_commande_vente
from Fact.fact_competence import fact_competence
from Fact.fact_conge import fact_conge
from Fact.fact_contrat import fact_contrat
from Fact.fact_evaluation import fact_evaluation
from Fact.fact_facture_client import fact_facture_client
from Fact.fact_facture_fournisseur import fact_facture_fournisseur
from Fact.fact_finance import fact_finance
from Fact.fact_inventaire import fact_inventaire
from Fact.fact_inventaire_mouvements import fact_inventaire_mouvements
from Fact.fact_presence import fact_presence
from Fact.fact_production import fact_production
from Fact.fact_vente import fact_vente
from Fact.fct_scm import fact_scm
from Table_Map.map_detail_commande_achat import map_detail_commande_achat
from Table_Map.map_detail_commande_vente import map_detail_commande_vente
from Table_Map.map_detail_facture_achat import map_detail_facture_achat
from Table_Map.map_detail_facture_vente import map_detail_facture_vente
from Table_Map.map_fact_conge import map_fact_conge
from Table_Map.map_fact_contrat import map_fact_contrat
from Table_Map.map_fact_inventaire_mouvements import map_fact_inventaire_mouvements
from Table_Map.map_fact_production import map_fact_production

def generat_sql(fh,file_config):
    fh .write(map_detail_commande_achat(file_config).mapping())
    fh .write(map_detail_commande_vente(file_config).mapping())
    fh .write(map_detail_facture_achat(file_config).mapping())
    fh .write(map_detail_facture_vente(file_config).mapping())
    fh .write(map_fact_conge(file_config).mapping())
    fh .write(map_fact_contrat(file_config).mapping())
    fh .write(map_fact_inventaire_mouvements(file_config).mapping())
    fh .write(map_fact_production(file_config).mapping())
    fh .write(dim_magasin(file_config).ETL())
    fh .write(dim_account(file_config).ETL())
    fh .write(dim_categorie(file_config).ETL())
    fh .write(dim_client(file_config).ETL())
    fh .write(dim_detail_commande_achat(file_config).ETL())
    fh .write(dim_detail_commande_vente(file_config).ETL())
    fh .write(dim_detail_facture_achat(file_config).ETL())
    fh .write(Dim_Detail_Facture_Vente(file_config).ETL())
    fh .write(dim_department(file_config).ETL())
    fh .write(dim_emploi(file_config).ETL())
    fh .write(dim_employee(file_config).ETL())
    fh .write(dim_entrepot(file_config).ETL())
    fh .write(dim_fournisseur(file_config).ETL())
    fh .write(dim_machine(file_config).ETL())
    fh .write(dim_magasin(file_config).ETL())
    fh .write(dim_operation(file_config).ETL())
    fh .write(dim_sous_categorie(file_config).ETL())
    fh .write(dim_produit(file_config).ETL())
    fh .write(dim_transport(file_config).ETL())
    fh .write(dim_type_competence(file_config).ETL())
    fh .write(dim_type_expedition(file_config).ETL())

    fh .write(fact_achat(file_config).ETL())
    fh .write(fact_commande_achat(file_config).ETL())
    fh .write(fact_commande_vente(file_config).ETL())
    fh .write(fact_competence(file_config).ETL())
    fh .write(fact_conge(file_config).ETL())
    fh .write(fact_contrat(file_config).ETL())
    fh .write(fact_evaluation(file_config).ETL())

    fh .write(fact_facture_client(file_config).ETL())
    fh .write(fact_facture_fournisseur(file_config).ETL())
    fh .write(dim_paiement_client(file_config).ETL())
    fh .write(dim_paiement_fournisseur(file_config).ETL())

    fh .write(fact_finance(file_config).ETL())
    fh .write(fact_inventaire(file_config).ETL())
    fh .write(fact_inventaire_mouvements(file_config).ETL())
    fh .write(fact_presence(file_config).ETL())
    fh .write(fact_production(file_config).ETL())
    fh .write(fact_vente(file_config).ETL())
    fh .write(fact_scm(file_config).ETL())