from configparser import ConfigParser
config = ConfigParser()

class fact_production :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Production = config.get('FACT_PRODUCTION','ID_Production')
        self.Key_Produit = config.get('FACT_PRODUCTION','Key_Produit')
        self.ID_Operation = config.get('FACT_PRODUCTION','ID_Operation')
        self.ID_Machine = config.get('FACT_PRODUCTION','ID_Machine')
        self.Reference = config.get('FACT_PRODUCTION','Reference')
        self.Quantite = config.get('FACT_PRODUCTION','Quantite')
        self.Etat = config.get('FACT_PRODUCTION','Etat')
        self.Date_debut_planifiee = config.get('FACT_PRODUCTION','Date_debut_planifiee')
        self.Date_fin_planifiee = config.get('FACT_PRODUCTION','Date_fin_planifiee')
        self.Date_debut_Fabrication = config.get('FACT_PRODUCTION','Date_debut_Fabrication')
        self.Date_fin_Fabrication = config.get('FACT_PRODUCTION','Date_fin_Fabrication')
        self.Table = config.get('FACT_PRODUCTION','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Production == ""):
            return "\n"
        else:
            return (
                "insert into FACT_PRODUCTION ([ID_Production],[Key_Produit],[ID_Operation],[ID_Machine],[Reference],[Quantite],[Etat],[Date_debut_planifiee],[Date_fin_planifiee],[Date_debut_Fabrication],[Date_fin_Fabrication]) \n"
                +"select [ID_Production],[Key_Produit],[ID_Operation],[ID_Machine],[Reference],[Quantite],[Etat],[Date_debut_planifiee],[Date_fin_planifiee],[Date_debut_Fabrication],[Date_fin_Fabrication] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Production + " as ID_Production, "
                +self.Key_Produit + " as Key_Produit, "
                +self.ID_Operation + " as ID_Operation, "
                +self.ID_Machine +" as ID_Machine, "
                +self.Reference +" as Reference, "
                +self.Quantite + " as Quantite, "
                +self.Etat + " as Etat, "
                +self.Date_debut_planifiee + " as Date_debut_planifiee, "
                +self.Date_fin_planifiee + " as Date_fin_planifiee, "
                +self.Date_debut_Fabrication + " as Date_debut_Fabrication, "
                +self.Date_fin_Fabrication + " as Date_fin_Fabrication "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )