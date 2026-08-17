{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
                      Alterado o nome da Db de uDbHstAsMedXMonitoBio para
                      uDbExame.
                      Alterada a tabela CM.HSTASMEDXMONITOBIO para
                      CM.HSTASMEDXEXAME
--------------------------------------------------------------------------------
 Nº SOL           : 250391.17474
 Nº PPM           : 959204
 Data da Alteração: 08/04/2016
 Alteração Form   : Mudança no leiaute e novos campos
 Responsável      : Michelle Suellyn Mota
 Descrição        : Alterações de leiaute e novos campos para atender o eSocial.
  	                Criação desta DB para manipular os registros da tabela
                    hstasmedxmonitobio.
--------------------------------------------------------------------------------}

unit uDbExame;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbExame = class(TCmDbObject)
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

    //Everson Cunha - SIG38475 - Ini
    {Fidhstasmedxmonitobio: TCmDbField;
    Fidhstasmed          : TCmDbField;
    Fdtinicio            : TCmDbField;
    Fdtfim : TCmDbField;
    Fcodagtquimico : TCmDbField;
    Fcodmaterialbio       : TCmDbField;
    Fcodanalise  : TCmDbField;
    Finterpretexame      : TCmDbField;
    Fordemexame     : TCmDbField;
    Findicaresultado  : TCmDbField;
    Fidresponsavel 	  : TCmDbField; }

    {IDHSTASMEDXEXAME NUMBER NOT NULL,
    IDHSTASMED NUMBER NOT NULL,
    DTEXAME DATE,
    ID_PROC_REALIZADO VARCHAR2(4),
    OBS_PROCEDIMENTO VARCHAR2(999),
    ORDEMEXAME CHAR(1),
    INDICARESULTADO CHAR(1)}

    Fidhstasmedxexame         : TCmDbField;
    Fidhstasmed               : TCmDbField;
    Fdtexame                  : TCmDbField;
    Fidprocedimento_realizado : TCmDbField;
    Fobs_procedimento         : TCmDbField;
    Fordemexame               : TCmDbField;
    Findicaresultado          : TCmDbField;
    //Everson Cunha - SIG38475 - Fim

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    //Everson Cunha - SIG38475 - Ini
    {property idhstasmedxmonitobio: TCmDbField read Fidhstasmedxmonitobio write Fidhstasmedxmonitobio;
    property idhstasmed: TCmDbField read Fidhstasmed write Fidhstasmed;
    property dtinicio: TCmDbField read Fdtinicio write Fdtinicio;
    property dtfim: TCmDbField read Fdtfim write Fdtfim;
    property codagtquimico: TCmDbField read Fcodagtquimico write Fcodagtquimico;
    property codmaterialbio: TCmDbField read Fcodmaterialbio write Fcodmaterialbio;
    property codanalise: TCmDbField read Fcodanalise write Fcodanalise;
    property interpretexame: TCmDbField read Finterpretexame write Finterpretexame;
    property ordemexame: TCmDbField read Fordemexame write Fordemexame;
    property indicaresultado: TCmDbField read Findicaresultado write Findicaresultado;
    property idresponsavel: TCmDbField read Fidresponsavel write Fidresponsavel;}

    property idhstasmedxexame: TCmDbField read Fidhstasmedxexame write Fidhstasmedxexame;
    property idhstasmed: TCmDbField read Fidhstasmed write Fidhstasmed;
    property dtexame: TCmDbField read Fdtexame write Fdtexame;
    property idprocedimento_realizado: TCmDbField read Fidprocedimento_realizado write Fidprocedimento_realizado;
    property obs_procedimento: TCmDbField read Fobs_procedimento write Fobs_procedimento;
    property ordemexame: TCmDbField read Fordemexame write Fordemexame;
    property indicaresultado: TCmDbField read Findicaresultado write Findicaresultado;
    //Everson Cunha - SIG38475 - Fim

  end;

implementation

{ TDbHstAsMedXMonitoBio }

constructor TDbExame.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  //Everson Cunha - SIG38475 - Ini
  //TableName := 'HstAsMedXMonitoBio';
  TableName := 'HSTASMEDXEXAME';

  {Fidhstasmedxmonitobio:= CreateCmDbField('IDHSTASMEDXMONITOBIO',ftFloat,true,true,false,true,'');
  Fidhstasmed          := CreateCmDbField('IDHSTASMED',ftFloat,true,true,false,true,'');
  Fdtinicio            := CreateCmDbField('DTINICIO',ftDateTime,false,false,false,true,'');
  Fdtfim               := CreateCmDbField('DTFIM',ftDateTime,false,false,false,true,'');
  Fcodagtquimico       := CreateCmDbField('CODAGTQUIMICO',ftString,false,false,false,true,'');
  Fcodmaterialbio      := CreateCmDbField('CODMATERIALBIO',ftString,false,false,false,true,'');
  Fcodanalise          := CreateCmDbField('CODANALISE',ftString,false,false,false,true,'');
  Finterpretexame      := CreateCmDbField('INTERPRETEXAME',ftString,false,false,false,true,'');
  Fordemexame          := CreateCmDbField('ORDEMEXAME',ftString,false,false,false,true,'');
  Findicaresultado     := CreateCmDbField('INDICARESULTADO',ftString,false,false,false,true,'');
  Fidresponsavel       := CreateCmDbField('IDRESPONSAVEL',ftFloat,false,false,false,true,'');}

  Fidhstasmedxexame         := CreateCmDbField('IDHSTASMEDXEXAME',ftFloat,true,true,false,true,'');
  Fidhstasmed               := CreateCmDbField('IDHSTASMED',ftFloat,true,true,false,true,'');
  Fdtexame                  := CreateCmDbField('DTEXAME',ftDateTime,false,false,false,true,'');
  Fidprocedimento_realizado := CreateCmDbField('ID_PROC_REALIZADO',ftString,false,false,false,true,'');
  Fobs_procedimento         := CreateCmDbField('OBS_PROCEDIMENTO',ftString,false,false,false,true,'');
  Fordemexame               := CreateCmDbField('ORDEMEXAME',ftString,false,false,false,true,'');
  Findicaresultado          := CreateCmDbField('INDICARESULTADO',ftString,false,false,false,true,'');
  //Everson Cunha - SIG38475 - Fim
end;

end.
