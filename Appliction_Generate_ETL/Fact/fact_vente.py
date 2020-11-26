from configparser import ConfigParser
config = ConfigParser()

class fact_vente :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Vente = config.get('FACT_VENTE','ID_Vente')
        self.Key_Client = config.get('FACT_VENTE','Key_Client')
        self.Key_Produit = config.get('FACT_VENTE','Key_Produit')
        self.ID_Magasin = config.get('FACT_VENTE','ID_MAgasin')
        self.key_Facture = config.get('FACT_VENTE','key_Facture')
        self.Quantite = config.get('FACT_VENTE','Quantite')
        self.Prix_Unitaire = config.get('FACT_VENTE','Prix_Unitaire')
        self.Prix_HT = config.get('FACT_VENTE','Prix_HT')
        self.Remise = config.get('FACT_VENTE','Remise')
        self.Prix_Total = config.get('FACT_VENTE','Prix_Total')
        self.Date_Vente = config.get('FACT_VENTE','Date_Vente')
        self.Table = config.get('FACT_VENTE','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Vente == ""):
            return "\n"
        else:
            return (
                "insert into FACT_VENTE ([ID_Vente],[Key_Client],[Key_Produit],[ID_Magasin],[key_Facture],[Quantite],[Prix_Unitaire],[Prix_HT],[Remise],[Prix_Total],[Date_Vente]) \n"
                +"select [ID_Vente],[Key_Client],[Key_Produit],[ID_Magasin],[key_Facture],[Quantite],[Prix_Unitaire],[Prix_HT],[Remise],[Prix_Total],[Date_Vente] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Vente + " as ID_Vente, "
                +self.Key_Client + " as Key_Client, "
                +self.Key_Produit +" as Key_Produit, "
                +self.ID_Magasin +" as ID_Magasin, "
                +self.key_Facture + " as key_Facture, "
                +self.Quantite + " as Quantite, "
                +self.Prix_Unitaire + " as Prix_Unitaire, "
                +self.Prix_HT + " as Prix_HT, "
                +self.Remise + " as Remise, "
                +self.Prix_Total + " as Prix_Total, "
                +self.Date_Vente + " as Date_Vente "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )

