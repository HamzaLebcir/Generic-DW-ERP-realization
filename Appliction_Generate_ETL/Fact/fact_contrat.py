from configparser import ConfigParser
config = ConfigParser()

class fact_contrat:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Id_contrat = config.get('FACT_CONTRAT','Id_contrat')
        self.Key_employee = config.get('FACT_CONTRAT','Key_employee')
        self.Date_debut =config.get('FACT_CONTRAT','Date_debut') 
        self.Date_fin = config.get('FACT_CONTRAT','Date_fin')
        self.Date_fin_essai = config.get('FACT_CONTRAT','Date_fin_essai')
        self.Salaire = config.get('FACT_CONTRAT','Salaire')
        self.Type = config.get('FACT_CONTRAT','Type')
        self.Etat =config.get('FACT_CONTRAT','Etat')
        self.Table =config.get('FACT_CONTRAT','Table')
        self.server = config.get('Linked_server','server')

    
        
    def ETL(self):
        if(self.Id_contrat==""):
            return("\n")
        else:    
            return(
            "INSERT INTO FACT_CONTRAT (Id_contrat,Key_employee,Date_debut,Date_fin,Date_fin_essai,Salaire,Type,Etat) \n"
            +"SELECT Id_contrat,Key_employee,Date_debut,Date_fin,Date_fin_essai,Salaire,Type,Etat \n" 
            +"FROM OPENQUERY("+self.server+",\n'select "
            +self.Id_contrat+ " AS Id_contrat,"
            +self.Key_employee+ " AS Key_employee,"
            +self.Date_debut+ " AS Date_debut,"
            +self.Date_fin+ " AS Date_fin,"
            +self.Date_fin_essai+ " AS Date_fin_essai,"
            +self.Salaire+ " AS Salaire,"
            +self.Type+ " AS Type,"
            +self.Etat+ " AS Etat \n"
            +"FROM " +self.Table+ "'); \n"
        )    