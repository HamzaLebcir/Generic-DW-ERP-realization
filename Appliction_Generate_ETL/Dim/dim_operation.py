from configparser import ConfigParser
config = ConfigParser()

class dim_operation :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Operation = config.get('Dim_Operation','ID_Operation')
        self.Type = config.get('Dim_Operation','Type')
        self.Code = config.get('Dim_Operation','Code')
        self.Table = config.get('Dim_Operation','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Operation == ""):
            return "\n"
        else:
            return (
                "insert into Dim_Operation ([ID_Operation],[Type],[Code]) \n"
                +"select [ID_Operation],[Type],[Code] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Operation + " as ID_Operation, "
                +self.Type +" as Type, "
                +self.Code + " as Code"
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )