from configparser import ConfigParser
config = ConfigParser()

class dim_sous_categorie :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_sous_categorie = config.get('Dim_Sous-Categorie','ID_sous_categorie')
        self.sous_categorie = config.get('Dim_Sous-Categorie','sous_categorie')
        self.ID_Categorie = config.get('Dim_Sous-Categorie','ID_Categorie')
        self.Table = config.get('Dim_Sous-Categorie','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_sous_categorie == ""):
            return "\n"
        else:
            return (
                "insert into [Dim_Sous-Categorie] ([ID_sous_categorie],[sous_categorie],[ID_Categorie]) \n"
                +"select [ID_sous_categorie],[sous_categorie],[ID_Categorie] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_sous_categorie + " as ID_sous_categorie, "
                +self.sous_categorie +" as sous_categorie, "
                +self.ID_Categorie + " as ID_Categorie "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )

