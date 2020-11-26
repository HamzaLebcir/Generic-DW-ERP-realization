from configparser import ConfigParser
config = ConfigParser()

class dim_entrepot:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Entrepot =config.get('DIM_ENTREPOT','ID_Entrepot')
        self.Nom =config.get('DIM_ENTREPOT','Nom')
        self.Type_site =config.get('DIM_ENTREPOT','Type_site')
        self.Table = config.get('DIM_ENTREPOT','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID_Entrepot==""):
            return("\n")
        else:    
            return(
                "INSERT INTO DIM_ENTREPOT (ID_Entrepot,Nom,Type_site) \n"
                +"SELECT ID_Entrepot,Nom,Type_site \n"
                +"FROM OPENQUERY ("+self.server+",\n'select "
                +self.ID_Entrepot+ " AS ID_Entrepot, "
                +self.Nom+ " AS Nom, "
                +self.Type_site+ " AS Type_site \n"
                +"FROM " +self.Table+ "'); \n"
            )
    
