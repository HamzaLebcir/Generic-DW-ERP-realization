from configparser import ConfigParser
config = ConfigParser()

class dim_employee:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Id_employee =config.get('DIM_EMPLOYEE','Id_employee')
        self.Id_departement =config.get('DIM_EMPLOYEE','Id_departement')
        self.Id_emploi =config.get('DIM_EMPLOYEE','Id_emploi')
        self.Nom =config.get('DIM_EMPLOYEE','Nom')
        self.Date_naissance =config.get('DIM_EMPLOYEE','Date_naissance')
        self.Genre =config.get('DIM_EMPLOYEE','Genre')
        self.Telephone =config.get('DIM_EMPLOYEE','Telephone')
        self.Email =config.get('DIM_EMPLOYEE','Email')
        self.Niveau_etude =config.get('DIM_EMPLOYEE','Niveau_etude')
        self.Adresse_domicile =config.get('DIM_EMPLOYEE','Adresse_domicile')
        self.Etat_civil =config.get('DIM_EMPLOYEE','Etat_civil')
        self.Table =config.get('DIM_EMPLOYEE','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.Id_employee==""):
            return("\n")
        else:    
            return(
                "INSERT INTO DIM_EMPLOYEE(Id_employee,Id_departement,Id_emploi,Nom,Date_naissance,Genre,Telephone,Email,Niveau_etude,Etat_civil,Adresse_domicile) \n"
                +"SELECT Id_employee,Id_departement,Id_emploi,Nom,Date_naissance,Genre,Telephone,Email,Niveau_etude,Etat_civil,Adresse_domicile \n"
                +"FROM OPENQUERY("+self.server+",\n'select "
                +self.Id_employee+ " AS Id_employee, "
                +self.Id_departement+ " AS Id_departement, "
                +self.Id_emploi+ " AS Id_emploi, "
                +self.Nom+ " AS Nom, "
                +self.Date_naissance+ " AS Date_naissance, "
                +self.Genre+ " AS Genre, "
                +self.Telephone+ " AS Telephone, "
                +self.Email+ " AS Email, "
                +self.Niveau_etude+ " AS Niveau_etude, "
                +self.Etat_civil+ " AS Etat_civil, "
                +self.Adresse_domicile+ " AS Adresse_domicile \n"
                +"FROM " +self.Table+ "'); \n"
            )    
