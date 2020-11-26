from configparser import ConfigParser
config = ConfigParser()

class dim_emploi:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Id_emploi =config.get('DIM_EMPLOI','Id_emploi') 
        self.Nom = config.get('DIM_EMPLOI','Nom')
        self.Table = config.get('DIM_EMPLOI','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.Id_emploi==""):
            return("\n")
        else:    
            return(
            "INSERT INTO DIM_EMPLOI(Id_emploi,Nom) \n "
            +"SELECT Id_emploi,Nom \n"
            +"FROM OPENQUERY("+self.server+",\n'select "
            +self.Id_emploi+ " AS Id_emploi, "
            +self.Nom+ " AS Nom \n"
            +"from " +self.Table+ "'); \n"
            )
