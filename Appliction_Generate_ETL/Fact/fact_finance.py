from configparser import ConfigParser
config = ConfigParser()

class fact_finance:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID = config.get('FACT_FINANCE','ID')
        self.Id_account =config.get('FACT_FINANCE','Id_account') 
        self.ID_Dep =config.get('FACT_FINANCE','ID_Dep') 
        self.Date = config.get('FACT_FINANCE','Date')
        self.Montant = config.get('FACT_FINANCE','Montant')
        self.Table = config.get('FACT_FINANCE','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID==""):
            return("\n")
        else:    
            return(
                "INSERT INTO FACT_FINANCE (ID,Id_account,ID_Dep,Date,Montant) \n"
                +"SELECT ID,Id_account,ID_Dep,Date,montant \n"
                +"FROM OPENQUERY("+self.server+",\n'select "
                +self.ID+ " AS ID,"
                +self.Id_account+ " as Id_account,"
                +self.ID_Dep+ " AS ID_Dep ,"
                +self.Date+ " as Date, "
                +self.Montant+ " as Montant \n"
                +"FROM " +self.Table+ "'); \n"

            )    