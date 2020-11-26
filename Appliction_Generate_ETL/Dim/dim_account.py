from configparser import ConfigParser
config = ConfigParser()

class dim_account:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Id_account=config.get('DIM_ACCOUNT','Id_account')
        self.Description=config.get('DIM_ACCOUNT','Description')
        self.Type=config.get('DIM_ACCOUNT','Type')
        self.Table=config.get('DIM_ACCOUNT','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.Id_account == ""):
            return("\n")
        else:    
            return(
                "INSERT INTO DIM_ACCOUNT([Id_account],[Description],[Type])\n"
                +"SELECT [Id_account], [Description], [Type] \n"
                +"FROM OPENQUERY ("+self.server+", \n'select "
                +self.Id_account+ " AS Id_account, "
                +self.Description+ " AS Description, "
                +self.Type+ " AS Type "
                +"\n"
                +"FROM " +self.Table+ "'); \n"
            )    