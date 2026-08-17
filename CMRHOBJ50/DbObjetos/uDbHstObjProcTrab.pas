{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 21/10/2004                                 }
{                                                       }
{*******************************************************}

unit uDbHstObjProcTrab;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbHstObjProcTrab = class(TCmDbObject)
  private
    FIdHstObjProcTrab: TCmDbField;
    FDatainicio: TCmDbField;
    FDatafinal: TCmDbField;
    FDataaval: TCmDbField;
    FObservacao: TCmDbField;
    FPercorig: TCmDbField;
    FCodtipoobjeto: TCmDbField;
    FValorsentenca: TCmDbField;
    FNumproctrab: TCmDbField;
    FIndvalor: TCmDbField;
    FPercprob: TCmDbField;
    FValorrecl: TCmDbField;
    FJuros: TCmDbField;
    FCorrecao: TCmDbField;
    FIdTipoProc : TCmDbField;
    FTipCodigo : TCmDbField;
    FFLGCONTABVLPRINC : TCmDbField;
    FFLGTIPOLANCTO : TCmDbField;
    FFLGCONTABENCERRADO : TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdHstObjProcTrab: TCmDbField read FIdHstObjProcTrab write FIdHstObjProcTrab;
    property NumProcTrab: TCmDbField read FNumproctrab write FNumproctrab;
    property IndValor: TCmDbField read FIndvalor write FIndvalor;
    property DataInicio: TCmDbField read FDatainicio write FDatainicio;
    property DataFinal: TCmDbField read FDatafinal write FDatafinal;
    property DataAval: TCmDbField read FDataaval write FDataaval;
    property CodTipoObjeto: TCmDbField read FCodtipoobjeto write FCodtipoobjeto;
    property ValorSentenca: TCmDbField read FValorsentenca write FValorsentenca;
    property ValorRecl: TCmDbField read FValorrecl write FValorrecl;
    property PercProb: TCmDbField read FPercprob write FPercprob;
    property PercOrig: TCmDbField read FPercorig write FPercorig;
    property Observacao: TCmDbField read FObservacao write FObservacao;
    property Juros: TCmDbField read FJuros write FJuros;
    property Correcao: TCmDbField read FCorrecao write FCorrecao;
    property IdTipoProc : TCmDbField read FIdTipoProc write FIdTipoProc;
    property TipCodigo: TCmDbField read FTipCodigo write FTipCodigo;
    property FLGCONTABVLPRINC: TCmDbField read FFLGCONTABVLPRINC write FFLGCONTABVLPRINC;
    property FLGTIPOLANCTO: TCmDbField read FFLGTIPOLANCTO write FFLGTIPOLANCTO;
    property FLGCONTABENCERRADO: TCmDbField read FFLGCONTABENCERRADO write FFLGCONTABENCERRADO;
  end;

implementation

{ TDbHstObjProcTrab }

constructor TDbHstObjProcTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTOBJPROCTRAB';

  FIdHstObjProcTrab := CreateCmDbField('IDHSTOBJPROCTRAB',ftFloat,true,true,false,true,'');
  FNumProcTrab := CreateCmDbField('NUMPROCTRAB',ftFloat,false,false,false,true,'');
  FIndValor := CreateCmDbField('INDVALOR',ftFloat,false,false,false,false,'');
  FDataInicio := CreateCmDbField('DATAINICIO',ftDateTime,false,false,false,true,'');
  FDataFinal := CreateCmDbField('DATAFINAL',ftDateTime,false,false,false,true,'');
  FDataAval := CreateCmDbField('DATAAVAL',ftDateTime,false,false,false,true,'');
  FCodTipoObjeto := CreateCmDbField('CODTIPOOBJETO',ftFloat,false,false,false,true,'');
  FValorSentenca := CreateCmDbField('VALORSENTENCA',ftFloat,false,false,false,false,'');
  FValorRecl := CreateCmDbField('VALORRECL',ftFloat,false,false,false,false,'');
  FPercProb := CreateCmDbField('PERCPROB',ftFloat,false,false,false,false,'');
  FPercOrig := CreateCmDbField('PERCORIG',ftFloat,false,false,false,false,'');
  FJuros := CreateCmDbField('JUROS',ftFloat,false,false,false,false,'');
  FCorrecao := CreateCmDbField('CORRECAO',ftFloat,false,false,false,false,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftString,false,false,false,false,'');
  FIdTipoProc := CreateCmDbField('IDTIPOPROC',ftFloat,false,false,false,false,'');
  FTipCodigo := CreateCmDbField('TIPCODIGO',ftString,false,false,false,false,'');
  FFLGCONTABVLPRINC := CreateCmDbField('FLGCONTABVLPRINC',ftFloat,false,false,false,false,'');
  FFLGTIPOLANCTO := CreateCmDbField('FLGTIPOLANCTO',ftString,false,false,false,false,'');
  FFLGCONTABENCERRADO := CreateCmDbField('FLGCONTABENCERRADO',ftFloat,false,false,false,false,'');
end;

function TDbHstObjProcTrab.Insert: boolean;
begin
  FIdHstObjProcTrab.asFloat := GetSequence('HSTOBJPROCTRAB');
  Result := inherited Insert;
end;

end.


