//***************************************************************************************
//Nº SOL: 250391.17474    
//Nº PPM: 959204                            
//Data da Alteração: 08/04/2016            
//Alteração Form: Mudança no leiaute e novos campos          
//Responsável: Michelle Suellyn Mota
//Descrição: Alterações de leiaute e novos campos para atender o eSocial.
//	     Criação desta DB para manipular os registros da tabela hstasmedxmonitobio.
//**************************************************************************************
unit uDbHstAsMedXMonitoBio;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbHstAsMedXMonitoBio = class(TCmDbObject)
  private                                                                 
  
  {idhstasmedxmonitobio NUMBER not null,
  idhstasmed           NUMBER not null,
  dtinicio             DATE,
  dtfim                DATE,
  codagtquimico        CHAR(2),
  codmaterialbio       CHAR(1),
  codanalise           CHAR(4),
  interpretexame       CHAR(1),
  ordemexame           CHAR(1),
  indicaresultado      CHAR(1),
  idresponsavel 	   NUMBER}
  
    Fidhstasmedxmonitobio: TCmDbField;
    Fidhstasmed          : TCmDbField;
    Fdtinicio            : TCmDbField;
    Fdtfim : TCmDbField;
    Fcodagtquimico : TCmDbField;
    Fcodmaterialbio       : TCmDbField;
    Fcodanalise  : TCmDbField;
    Finterpretexame      : TCmDbField;
    Fordemexame     : TCmDbField;
    Findicaresultado  : TCmDbField;
    Fidresponsavel 	  : TCmDbField;

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property idhstasmedxmonitobio: TCmDbField read Fidhstasmedxmonitobio write Fidhstasmedxmonitobio;
    property idhstasmed: TCmDbField read Fidhstasmed write Fidhstasmed;
    property dtinicio: TCmDbField read Fdtinicio write Fdtinicio;
    property dtfim: TCmDbField read Fdtfim write Fdtfim;
    property codagtquimico: TCmDbField read Fcodagtquimico write Fcodagtquimico;
    property codmaterialbio: TCmDbField read Fcodmaterialbio write Fcodmaterialbio;
    property codanalise: TCmDbField read Fcodanalise write Fcodanalise;
    property interpretexame: TCmDbField read Finterpretexame write Finterpretexame;
    property ordemexame: TCmDbField read Fordemexame write Fordemexame;
    property indicaresultado: TCmDbField read Findicaresultado write Findicaresultado;
    property idresponsavel: TCmDbField read Fidresponsavel write Fidresponsavel;

  end;

implementation

{ TDbHstAsMedXMonitoBio }

constructor TDbHstAsMedXMonitoBio.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HstAsMedXMonitoBio';

  Fidhstasmedxmonitobio:= CreateCmDbField('IDHSTASMEDXMONITOBIO',ftFloat,true,true,false,true,'');
  Fidhstasmed          := CreateCmDbField('IDHSTASMED',ftFloat,true,true,false,true,'');
  Fdtinicio            := CreateCmDbField('DTINICIO',ftDateTime,false,false,false,true,'');
  Fdtfim               := CreateCmDbField('DTFIM',ftDateTime,false,false,false,true,'');
  Fcodagtquimico       := CreateCmDbField('CODAGTQUIMICO',ftString,false,false,false,true,'');
  Fcodmaterialbio      := CreateCmDbField('CODMATERIALBIO',ftString,false,false,false,true,'');
  Fcodanalise          := CreateCmDbField('CODANALISE',ftString,false,false,false,true,'');
  Finterpretexame      := CreateCmDbField('INTERPRETEXAME',ftString,false,false,false,true,'');
  Fordemexame          := CreateCmDbField('ORDEMEXAME',ftString,false,false,false,true,'');
  Findicaresultado     := CreateCmDbField('INDICARESULTADO',ftString,false,false,false,true,'');
  Fidresponsavel       := CreateCmDbField('IDRESPONSAVEL',ftFloat,false,false,false,true,'');
end;

end.
