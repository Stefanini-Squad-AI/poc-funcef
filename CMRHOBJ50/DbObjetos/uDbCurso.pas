{--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: insert
{--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 116914
Nº KINTANA..: 558952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Inserir campo IDSIGLACURSO
--------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbCurso;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbCurso = class(TCmDbObject)
  private
    FIdCurso: TCmDbField;
    FAbrev: TCmDbField;
    FAvaliacao: TCmDbField;
    FTemaval: TCmDbField;
    FDescricao: TCmDbField;
    FTemavpr: TCmDbField;
    FIdPacote: TCmDbField;
    FValor: TCmDbField;
    FAvalPrat: TCmDbField;
    FCodGrpTrein: TCmDbField;
    FIdTipoCurso: TCmDbField;
    FObservacao: TCmDbField;
    FObservacao2: TCmDbField;
    FIdentiDinstr: TCmDbField;
    FDur_Teor: TCmDbField;
    FDur_Prat: TCmDbField;
    FUnidNegoc: TCmDbField;
    FIdSiglaCurso: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;
    function GetCodigo : integer;           // Edilaine - SOL 137268-7062 / KTN 1497173

    property IdCurso: TCmDbField read FIdCurso write FIdCurso;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property Abrev: TCmDbField read FAbrev write FAbrev;
    property Dur_Teor: TCmDbField read FDur_Teor write FDur_Teor;
    property Dur_Prat: TCmDbField read FDur_Prat write FDur_Prat;
    property CodGrpTrein: TCmDbField read FCodGrpTrein write FCodGrpTrein;
    property AvalPrat: TCmDbField read FAvalPrat write FAvalPrat;
    property Avaliacao: TCmDbField read FAvaliacao write FAvaliacao;
    property Valor: TCmDbField read FValor write FValor;
    property Observacao: TCmDbField read FObservacao write FObservacao;
    property Observacao2: TCmDbField read FObservacao2 write FObservacao2;
    property Temavpr: TCmDbField read FTemavpr write FTemavpr;
    property Temaval: TCmDbField read FTemaval write FTemaval;
    property IdTipoCurso: TCmDbField read FIdTipoCurso write FIdTipoCurso;
    property IdPacote: TCmDbField read FIdPacote write FIdPacote;
    property IdentiDinstr: TCmDbField read FIdentiDinstr write FIdentiDinstr;
    property UnidNegoc : TCmDbField read FUnidNegoc write FUnidNegoc;
    property IdSiglaCurso : TCmDbField read FIdSiglaCurso write FIdSiglaCurso;
  end;

implementation

{ TDbCurso }

constructor TDbCurso.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CURSO';

  FIdCurso := CreateCmDbField('IDCURSO',ftFloat,true,true,false,true,'');
  FValor := CreateCmDbField('VALOR',ftFloat,false,false,false,true,'');
  FTemavpr := CreateCmDbField('TEMAVPR',ftFloat,false,false,false,false,'');
  FTemaval := CreateCmDbField('TEMAVAL',ftFloat,false,false,false,false,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftBlob,false,false,false,true,'');
  FObservacao := CreateCmDbField('OBSERVACAO2',ftString,false,false,false,true,'');
  FIdtipocurso := CreateCmDbField('IDTIPOCURSO',ftFloat,false,false,false,true,'');
  FIdpacote := CreateCmDbField('IDPACOTE',ftFloat,false,false,false,true,'');
  FIdentidinstr := CreateCmDbField('IDENTIDINSTR',ftFloat,false,false,false,true,'');
  FDur_teor := CreateCmDbField('DUR_TEOR',ftFloat,false,false,false,false,'');
  FDur_prat := CreateCmDbField('DUR_PRAT',ftFloat,false,false,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,true,'');
  FCodgrptrein := CreateCmDbField('CODGRPTREIN',ftString,false,false,false,true,'');
  FAvalprat := CreateCmDbField('AVALPRAT',ftFloat,false,false,false,true,'');
  FAvaliacao := CreateCmDbField('AVALIACAO',ftFloat,false,false,false,true,'');
  FAbrev := CreateCmDbField('ABREV',ftString,false,false,false,true,'');
  //Thaise - SOL 116914: Inserir novo campo na tabela.
  FIdSiglaCurso := CreateCmDbField('IDSIGLACURSO',ftFloat,false,false,false,true,'');
  //Cássio - SOL 116916 KINTANA 558985 - Início
  //Inclusão do campo UNIDNEGOC
  FUnidNegoc := CreateCmDbField('UNIDNEGOC', ftFloat, true, false, false, false,'');
  //Cássio - SOL 116916 KINTANA 558985 - Fim
end;

function TDbCurso.GetCodigo: integer;
begin
  result := GetSequence('CURSO');
end;

function TDbCurso.Insert: boolean;
begin
  // Edilaine - SOL 137268-7062 / KTN 1497173
  if FIdCurso.asFloat <= 0 then
     FIdCurso.asFloat := GetSequence('CURSO');
  Result := inherited Insert;
end;
end.
