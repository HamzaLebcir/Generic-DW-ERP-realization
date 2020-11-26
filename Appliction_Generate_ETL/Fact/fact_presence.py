from configparser import ConfigParser
config = ConfigParser()

class fact_presence :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Id_presence = config.get('FACT_PRESENCE','Id_presence')
        self.Key_employee = config.get('FACT_PRESENCE','Key_employee')
        self.Arrive_date = config.get('FACT_PRESENCE','Arrive_date')
        self.Sortie_date = config.get('FACT_PRESENCE','Sortie_date')
        self.Heures_de_travail = config.get('FACT_PRESENCE','Heures_de_travail')
        self.Periode = config.get('FACT_PRESENCE','Periode')
        self.Table = config.get('FACT_PRESENCE','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.Id_presence == ""):
            return "\n"
        else:
            return (
                "insert into FACT_PRESENCE ([Id_presence],[Key_employee],[Arrive_date],[Sortie_date],Arrive_temps,Sortie_temps,[Heures_de_travail],[Periode]) \n"
                +"select Id_presence,Key_employee,Arrive_date,Sortie_date, cast(CONVERT(VARCHAR(5),Arrive_date,108) as time(0)) as Arrive_temps,cast(CONVERT(VARCHAR(5),Sortie_date,108) as time(0)) as Sortie_temps,Heures_de_travail,Periode \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.Id_presence + " as Id_presence, "
                +self.Key_employee + " as Key_employee, "
                +self.Arrive_date +" as Arrive_date, "
                +self.Sortie_date +" as Sortie_date, "
                +self.Heures_de_travail + " as Heures_de_travail, "
                +self.Periode + " as Periode "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )