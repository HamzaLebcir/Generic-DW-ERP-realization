from configparser import ConfigParser
config = ConfigParser()

class fact_commande_achat:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID=config.get('FACT_COMMANDE_ACHAT','ID')
        self.Key_FOURNISSEUR = config.get('FACT_COMMANDE_ACHAT','Key_FOURNISSEUR')
        self.Key_produit = config.get('FACT_COMMANDE_ACHAT','Key_produit')
        self.Key_DC = config.get('FACT_COMMANDE_ACHAT','Key_DC')
        self.ID_Dep = config.get('FACT_COMMANDE_ACHAT','ID_Dep')
        self.Quantite_commande =config.get('FACT_COMMANDE_ACHAT','Quantite_commande') 
        self.Date_commande = config.get('FACT_COMMANDE_ACHAT','Date_commande')
        self.Date_confirmation = config.get('FACT_COMMANDE_ACHAT','Date_confirmation')
        self.Prix_unitaire = config.get('FACT_COMMANDE_ACHAT','Prix_unitaire')
        self.Prix_total_HT = config.get('FACT_COMMANDE_ACHAT','Prix_total_HT')
        self.Taxe = config.get('FACT_COMMANDE_ACHAT','Taxe')
        self.Prix_total = config.get('FACT_COMMANDE_ACHAT','Prix_total')
        self.Table = config.get('FACT_COMMANDE_ACHAT','Table')
        self.server = config.get('Linked_server','server')
        
    def ETL(self):
        if(self.ID==""):
            return("\n")
        else:    
            return(
                "INSERT INTO FACT_COMMANDE_ACHAT (ID,Key_FOURNISSEUR,Key_produit,Key_DC,ID_Dep,Quantite_commande,Date_commande,Date_confirmation,Prix_unitaire,Prix_total_HT,Taxe,Prix_total) \n"
                "SELECT ID,Key_FOURNISSEUR,Key_produit,Key_DC,ID_Dep,Quantite_commande,Date_commande,Date_confirmation,Prix_unitaire,Prix_total_HT,Taxe,Prix_total \n"
                "FROM OPENQUERY("+self.server+",\n'select "
                +self.ID+ " AS ID,"
                +self.Key_FOURNISSEUR+ " AS Key_FOURNISSEUR, "
                +self.Key_produit+ " AS Key_produit, "
                +self.Key_DC+ " AS Key_DC, "
                +self.ID_Dep+ " AS ID_Dep, "
                +self.Quantite_commande+  " AS Quantite_commande, "
                +self.Date_commande+ " AS Date_commande, "
                +self.Date_confirmation+ " AS Date_confirmation, "
                +self.Prix_unitaire+ " AS Prix_unitaire, "
                +self.Prix_total_HT+ " AS Prix_total_HT, "
                +self.Taxe+ " AS Taxe, "
                +self.Prix_total+ " AS Prix_total \n"
                "FROM " +self.Table+ "'); \n" 
            )    