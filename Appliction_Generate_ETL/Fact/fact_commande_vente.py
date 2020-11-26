from configparser import ConfigParser
config = ConfigParser()

class fact_commande_vente:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID = config.get('Fact_Commande_Vente','ID')
        self.Key_Produit = config.get('Fact_Commande_Vente','Key_Produit')
        self.Key_Client = config.get('Fact_Commande_Vente','Key_Client')
        self.Key_DC = config.get('Fact_Commande_Vente','Key_DC')
        self.ID_Magasin =config.get('Fact_Commande_Vente','ID_Magasin') 
        self.Description = config.get('Fact_Commande_Vente','Description')
        self.Quantite = config.get('Fact_Commande_Vente','Quantite')
        self.Prix_unitaire = config.get('Fact_Commande_Vente','Prix_unitaire')
        self.Prix_HT = config.get('Fact_Commande_Vente','Prix_HT')
        self.Remise = config.get('Fact_Commande_Vente','Remise')
        self.Prix_Total = config.get('Fact_Commande_Vente','Prix_Total')
        self.Date_commande =config.get('Fact_Commande_Vente','Date_commande')
        self.Table = config.get('Fact_Commande_Vente','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID==""):
            return("\n")
        else: 
            return(   
                "INSERT INTO Fact_Commande_Vente(ID,Key_Produit,Key_Client,Key_DC,ID_Magasin,Description,Quantite,Prix_unitaire,Prix_HT,Remise,Prix_total,Date_Commande) \n"
                +"SELECT ID,Key_Produit,Key_Client,Key_DC,ID_Magasin,Description,Quantite,Prix_unitaire,Prix_HT,Remise,Prix_total,Date_Commande \n"
                +"FROM OPENQUERY ("+self.server+",\n'select "
                +self.ID +" as ID, "
                +self.Key_Produit+ " as Key_Produit, "
                +self.Key_Client+ " as Key_Client, "
                +self.Key_DC+ " as Key_DC, "
                +self.ID_Magasin+ " as ID_Magasin, "
                +self.Description+ " as Description, "
                +self.Quantite+ " as Quantite, "
                +self.Prix_unitaire+ " as Prix_unitaire, "
                +self.Prix_HT+ " as Prix_HT, "
                +self.Remise+ " as Remise, "
                +self.Prix_Total+ " as Prix_Total,"
                +self.Date_commande+ " as Date_Commande \n"
                +"FROM " +self.Table+ "'); \n"
            )
