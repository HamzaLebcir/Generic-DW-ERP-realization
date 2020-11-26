from configparser import ConfigParser
config = ConfigParser()

class fact_conge:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID = config.get('FACT_CONGE','ID')
        self.Key_employee = config.get('FACT_CONGE','Key_employee')
        self.Description = config.get('FACT_CONGE','Description')
        self.Type_conge = config.get('FACT_CONGE','Type_conge')
        self.Date_debut = config.get('FACT_CONGE','Date_debut')
        self.Date_fin = config.get('FACT_CONGE','Date_fin')
        self.Nombre_jour = config.get('FACT_CONGE','Nombre_jour')
        self.Etat = config.get('FACT_CONGE','Etat')
        self.Table = config.get('FACT_CONGE','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID==""):
            return("\n")
        else:    
            return(
            "INSERT INTO FACT_CONGE (ID,Key_employee,Description,Type_conge,Date_debut,Date_fin,Nombre_jour,Etat) \n"
            +"SELECT ID,Key_employee,Description,Type_conge,Date_debut,Date_fin,Nombre_jour,etat \n"
            +"FROM OPENQUERY("+self.server+",\n'select "
            +self.ID+ " AS ID ,"
            +self.Key_employee+ " AS Key_employee,"
            +self.Description+ " AS Description ,"
            +self.Type_conge+ " AS Type_conge,"
            +self.Date_debut+ " AS Date_debut,"
            +self.Date_fin+ " AS Date_fin,"
            +self.Nombre_jour+ " AS Nombre_jour,"
            +self.Etat+  " AS Etat \n"
            +"from " +self.Table+ "'); \n" 
            )
    