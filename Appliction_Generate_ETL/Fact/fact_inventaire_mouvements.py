from configparser import ConfigParser
config = ConfigParser()

class fact_inventaire_mouvements :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID = config.get('FACT_INVENTAIRE_MOUVEMENTS','ID')
        self.Ref = config.get('FACT_INVENTAIRE_MOUVEMENTS','Ref')
        self.Key_Produit = config.get('FACT_INVENTAIRE_MOUVEMENTS','Key_Produit')
        self.Type_ID = config.get('FACT_INVENTAIRE_MOUVEMENTS','Type_ID')
        self.Source = config.get('FACT_INVENTAIRE_MOUVEMENTS','Source')
        self.Destination = config.get('FACT_INVENTAIRE_MOUVEMENTS','Destination')
        self.Quantite = config.get('FACT_INVENTAIRE_MOUVEMENTS','Quantite')
        self.Date = config.get('FACT_INVENTAIRE_MOUVEMENTS','Date')
        self.Type_mouvement = config.get('FACT_INVENTAIRE_MOUVEMENTS','Type_mouvement')
        self.Etat = config.get('FACT_INVENTAIRE_MOUVEMENTS','Etat')
        self.Table = config.get('FACT_INVENTAIRE_MOUVEMENTS','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID == ""):
            return "\n"
        else:
            return (
                "insert into FACT_INVENTAIRE_MOUVEMENTS ([ID],[Ref],[Key_Produit],[Type_ID],[Source],[Destination],[Quantite],[Date],[Type_mouvement],[Etat]) \n"
                +"select [ID],[Ref],[Key_Produit],[Type_ID],[Source],[Destination],[Quantite],[Date],[Type_mouvement],[Etat] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID + " as ID, "
                +self.Ref + " as Ref, "
                +self.Key_Produit +" as Key_Produit, "
                +self.Source +" as Source, "
                +self.Type_ID + " as Type_ID, "
                +self.Destination + " as Destination, "
                +self.Quantite + " as Quantite, "
                +self.Date + " as Date, "
                +self.Type_mouvement + " as Type_mouvement, "
                +self.Etat + " as Etat "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )