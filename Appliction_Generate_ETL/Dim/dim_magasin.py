from configparser import ConfigParser
config = ConfigParser()

class dim_magasin :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Magasin = config.get('Dim_Magasin', 'ID_Magasin')
        self.ID_Region = config.get('Dim_Magasin', 'ID_Region')
        self.Nom = config.get('Dim_Magasin', 'Nom')
        self.Adresse = config.get('Dim_Magasin', 'Adresse')
        self.Ville = config.get('Dim_Magasin', 'Ville')
        self.Code_postal = config.get('Dim_Magasin', 'Code_postal')
        self.Pays = config.get('Dim_Magasin', 'Pays')
        self.Table = config.get('Dim_Magasin', 'Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Magasin == ""):
            return "\n"
        else:
            return (
                "insert into Dim_Magasin ([ID_Magasin],[ID_Region],[Nom],[Adresse],[Ville],[Code_postal],[Pays]) \n"
                +"select [ID_Magasin],[ID_Region],[Nom],[Adresse],[Ville],[Code_postal],[Pays] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Magasin + " as ID_Machine, "
                +self.ID_Region +" as ID_Region, "
                +self.Nom + " as Nom,"
                +self.Adresse + " as Adresse,"
                +self.Ville + " as Ville, "
                +self.Code_postal + " as Code_postal, "
                +self.Pays + " as Pays "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )