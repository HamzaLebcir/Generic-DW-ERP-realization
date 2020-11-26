from configparser import ConfigParser
config = ConfigParser()

class fact_achat:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID = config.get('FACT_ACHAT','ID')
        self.Key_FOURNISSEUR = config.get('FACT_ACHAT','Key_FOURNISSEUR')
        self.Key_produit = config.get('FACT_ACHAT','Key_produit')
        self.ID_Dep = config.get('FACT_ACHAT','ID_Dep')
        self.key_facture = config.get('FACT_ACHAT','key_facture')
        self.Quantite_achete =config.get('FACT_ACHAT','Quantite_achete') 
        self.Date_achat = config.get('FACT_ACHAT','Date_achat')
        self.Prix_unitaire = config.get('FACT_ACHAT','Prix_unitaire')
        self.Prix_total_HT = config.get('FACT_ACHAT','Prix_total_HT')
        self.Prix_total = config.get('FACT_ACHAT','Prix_total')
        self.Table = config.get('FACT_ACHAT','Table')
        self.server = config.get('Linked_server','server')
        
    def ETL(self):
        if(self.ID==""):
            return("\n")
        else:    
            return(
                "INSERT INTO FACT_ACHAT (ID,Key_FOURNISSEUR,Key_produit,key_facture,Quantite_achete,Date_achat,Prix_unitaire,Prix_total_HT,Prix_total) \n"
                +"SELECT ID,Key_FOURNISSEUR,Key_produit,key_facture,Quantite_achete,Date_achat,Prix_unitaire,Prix_total_HT,Prix_total \n" 
                +"FROM OPENQUERY("+self.server+",\n'select "
                +self.ID+ " AS ID,"
                +self.Key_FOURNISSEUR+ " AS Key_FOURNISSEUR,"
                +self.Key_produit+ " AS Key_produit, "
                +self.key_facture+ " AS key_facture ,"
                +self.Quantite_achete+ " AS Quantite_achete, "
                +self.Date_achat+ " AS Date_achat, "
                +self.Prix_unitaire+ " AS Prix_unitaire, "
                +self.Prix_total_HT+ " AS Prix_total_HT, "
                +self.Prix_total+ " AS Prix_total \n"
                +"from " +self.Table+ "'); \n"
            )  
        