from configparser import ConfigParser
config = ConfigParser()

class fact_evaluation:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Id_evaluation = config.get('FACT_EVALUATION','Id_evaluation')
        self.Note = config.get('FACT_EVALUATION','Note')
        self.Date = config.get('FACT_EVALUATION','Date')
        self.Key_employee = config.get('FACT_EVALUATION','Key_employee')
        self.Table=config.get('FACT_EVALUATION','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.Id_evaluation==""):
            return("\n")
        else:
            return(
                "INSERT INTO FACT_EVALUATION (Id_evaluation,Note,Date,Key_employee) \n"
                +"SELECT Id_evaluation,Note,Date,Key_employee \n"
                +"FROM OPENQUERY("+self.server+",\n'select "
                +self.Id_evaluation+ " AS Id_evaluation,"
                +self.Note+ " AS Note,"
                +self.Date+ " AS Date,"
                +self.Key_employee+ " AS Key_employee \n"
                +"FROM " +self.Table+ "'); \n"
            )    
            