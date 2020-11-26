from configparser import ConfigParser
config = ConfigParser()

class dim_region :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Region = config.get('Dim_Region','ID_Region')
        self.Region = config.get('Dim_Region','Region')
        self.Table = config.get('Dim_Region','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Region == ""):
            return "\n"
        else:
            return (
                "insert into [Dim_Region] ([ID_Region],[Region]) \n"
                +"select [ID_Region],[Region] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Region + " as ID_Region, "
                +self.Region +" as Region "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )