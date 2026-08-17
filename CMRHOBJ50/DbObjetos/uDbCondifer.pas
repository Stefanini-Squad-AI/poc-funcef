unit uDbCondifer;

// Alterações:
{ --------------------------------------------------------------------------------------------------
 Autor......: Felipe A. Santos
 Data.......: 08/01/2015
 Sol........: 229873.16665
 Kintana....: 570016
 Descrição..: Criação da Db.
--------------------------------------------------------------------------------------------------}

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbCondifer = class(TCmDbObject)
  private
    FFlgProgAmb: TCmDbField;
    FFlgHigi: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdTipCondicao: TCmDbField;
    FIdCodifer: TCmDbField;
    FFlgCondEPI: TCmDbField;
    FDtFimCondif: TCmDbField;
    FFlgPrazo: TCmDbField;
    FDtInicioCondif: TCmDbField;
    FFlgMotivImplemEPI: TCmDbField;
  public
    constructor Create(AOwner : TCmCustomCdbObject); override;

    property IdCodifer : TCmDbField read FIdCodifer write FIdCodifer;
    property IdPessoa : TCmDbField read FIdPessoa write FIdPessoa;
    property IdTipCondicao : TCmDbField read FIdTipCondicao write FIdTipCondicao;
    property DtInicioCondif : TCmDbField read FDtInicioCondif write FDtInicioCondif;
    property DtFimCondif : TCmDbField read FDtFimCondif write FDtFimCondif;
    property FlgMotivImplemEPI : TCmDbField read FFlgMotivImplemEPI write FFlgMotivImplemEPI;
    property FlgCondEPI : TCmDbField read FFlgCondEPI write FFlgCondEPI;
    property FlgPrazo : TCmDbField read FFlgPrazo write FFlgPrazo;
    property FlgProgAmb : TCmDbField read FFlgProgAmb write FFlgProgAmb;
    property FlgHigi : TCmDbField read FFlgHigi write FFlgHigi;
  end;

implementation

{ TDbCondifer }

constructor TDbCondifer.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'CONDIFER';

  FIdCodifer := CreateCmDbField('IDCONDIFER',ftFloat,true,true,false,False,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,false,false,False,'');
  FIdTipCondicao := CreateCmDbField('IDTIPCONDICAO',ftFloat,true,false,false,False,'');
  FDtInicioCondif := CreateCmDbField('DTINICIOCONDIF',ftDateTime,false,false,false,True,'');
  FDtFimCondif := CreateCmDbField('DTFIMCONDIF',ftDateTime,false,false,false,True,'');
  FFlgMotivImplemEPI := CreateCmDbField('FLGMOTIVIMPLEMEPI',ftString,false,false,false,False,'');
  FFlgCondEPI := CreateCmDbField('FLGCONDEPI',ftString,false,false,false,False,'');
  FFlgPrazo := CreateCmDbField('FLGPRAZO',ftString,false,false,false,False,'');
  FFlgProgAmb := CreateCmDbField('FLGPROGAMB',ftString,false,false,false,False,'');
  FFlgHigi := CreateCmDbField('FLGHIGI',ftString,false,false,false,False,'');

end;

end.
