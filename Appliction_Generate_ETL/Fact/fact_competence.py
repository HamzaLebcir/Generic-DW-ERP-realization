from configparser import ConfigParser
config = ConfigParser()

class fact_competence:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID = config.get('FACT_COMPETENCE','ID')
        self.Key_employee = config.get('FACT_COMPETENCE','Key_employee')
        self.Id_type_competence =config.get('FACT_COMPETENCE','Id_type_competence') 
        self.Nom = config.get('FACT_COMPETENCE','Nom')
        self.Niveau =config.get('FACT_COMPETENCE','Niveau')
        self.Table = config.get('FACT_COMPETENCE','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID==""):
            return("\n")
        else:    
            return(
                "INSERT INTO FACT_COMPETENCE (ID,Key_employee,Id_type_competence,Nom,Niveau) \n"
                +"SELECT ID,Key_employee,Id_type_competence,Nom,Niveau \n"
                +"FROM OPENQUERY("+self.server+",\n'select "
                +self.ID+  " AS ID, "
                +self.Key_employee+ " AS Key_employee, "
                +self.Id_type_competence+ " AS Id_type_competence, "
                +self.Nom+ " AS Nom, "
                +self.Niveau+ " AS Niveau \n"
                "FROM " +self.Table+ "'); \n"
            )