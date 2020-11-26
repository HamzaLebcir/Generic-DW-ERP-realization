from configparser import ConfigParser
config = ConfigParser()

class fact_scm :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID = config.get('FACT_SCM','ID')
        self.Key_Produit = config.get('FACT_SCM','Key_Produit')
        self.ID_Transport = config.get('FACT_SCM','ID_Transport')
        self.ID_Magasin = config.get('FACT_SCM','ID_Magasin')
        self.Key_Client = config.get('FACT_SCM','Key_Client')
        self.Qnt_Lvr = config.get('FACT_SCM','Qnt_Lvr')
        self.Date_Prevue = config.get('FACT_SCM','Date_Prevue')
        self.Date_effective = config.get('FACT_SCM','Date_effective')
        self.Ref_Commande = config.get('FACT_SCM','Ref_Commande')
        self.Date_commande = config.get('FACT_SCM','Date_commande')
        self.Table = config.get('FACT_SCM','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID == ""):
            return "\n"
        else:
            return (
                "insert into FACT_SCM ([ID],[Key_Produit],[Key_Produit],[ID_Transport],[ID_Magasin],[Key_Client],[Qnt_Lvr],[Date_Prevue],[Date_effective],[Ref_Commande],[Date_commande]) \n"
                +"select [ID],[Key_Produit],[Key_Produit],[ID_Transport],[ID_Magasin],[Key_Client],[Qnt_Lvr],[Date_Prevue],[Date_effective],[Ref_Commande],[Date_commande] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID + " as ID, "
                +self.Key_Produit + " as Key_Produit, "
                +self.ID_Transport +" as ID_Transport, "
                +self.ID_Magasin +" as ID_Magasin, "
                +self.Qnt_Lvr + " as Qnt_Lvr, "
                +self.Key_Client + " as Key_Client, "
                +self.Date_Prevue + " as Date_Prevue, "
                +self.Date_effective + " as Date_effective, "
                +self.Ref_Commande + " as Ref_Commande, "
                +self.Date_commande + " as Date_commande "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )
    