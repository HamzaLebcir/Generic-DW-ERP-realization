from configparser import ConfigParser
config = ConfigParser()

class dim_categorie:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Categorie = config.get('Dim_Categorie','ID_Categorie')
        self.Nom_Categorie = config.get('Dim_Categorie','Nom_Categorie')
        self.Table = config.get('Dim_Categorie','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID_Categorie==""):
            return("\n")  
        else:
            return(
                 "INSERT INTO Dim_Categorie (ID_Categorie,Nom_Categorie) \n"
                 +"SELECT ID_Categorie,Nom_Categorie \n"
                 +"FROM OPENQUERY ("+self.server+",\n'select "
                 +self.ID_Categorie+ " AS ID_Categorie, "
                 +self.Nom_Categorie+ " AS Nom_Categorie \n"
                 +"FROM " +self.Table+ "'); \n"
            )      