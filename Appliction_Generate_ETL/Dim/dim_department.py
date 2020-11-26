from configparser import ConfigParser
config = ConfigParser()

class dim_department:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Dep=config.get('DIM_DEPARTEMENT','ID_Dep')
        self.Nom=config.get('DIM_DEPARTEMENT','Nom')
        self.Table=config.get('DIM_DEPARTEMENT','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID_Dep==""):
            return("\n")
        else:    
            return(
            "INSERT INTO DIM_DEPARTEMENT(ID_Dep,Nom) \n"
            +"SELECT ID_Dep,Nom \n"
            +"FROM OPENQUERY ("+self.server+",'select "
            +self.ID_Dep+ " AS ID_Dep, "
            +self.Nom+ " AS Nom " 
            +"\n"
            +"from " +self.Table+ "'); \n"
            )    
