{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 29/11/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstTrn;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbHstTrn = class(TCmDbObject)
  private
    FAvalCurso: TCmDbField;
    FDatReFim: TCmDbField;
    FAvalTeor: TCmDbField;
    FIdEntidInstr: TCmDbField;
    FFlgAvalCurs: TCmDbField;
    FLocalCurso: TCmDbField;
    FDatPlFim: TCmDbField;
    FFlgAvalPrat: TCmDbField;
    FIdCurso: TCmDbField;
    FNumSeq: TCmDbField;
    FDesp_Estad: TCmDbField;
    FDur_Teor: TCmDbField;
    FAvalPrat: TCmDbField;
    FDesp_Outr: TCmDbField;
    FIdPessoa: TCmDbField;
    FDatPlIni: TCmDbField;
    FIdInstrutor: TCmDbField;
    FDatReIni: TCmDbField;
    FFlgControle: TCmDbField;
    FFlgAvalTeor: TCmDbField;
    FValor: TCmDbField;
    FDesp_Viag: TCmDbField;
    FIdProcesso: TCmDbField;
    FDur_Prat: TCmDbField;
    FDur_Tot: TCmDbField;
    FIdModulo: TCmDbField;
    FDataHora: TCmDbField;
    FInstrutores: TCmDbField;
    FCertificacao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property IdInstrutor: TCmDbField read FIdInstrutor write FIdInstrutor;
    property IdEntidInstr: TCmDbField read FIdEntidInstr write FIdEntidInstr;
    property IdProcesso: TCmDbField read FIdProcesso write FIdProcesso;
    property IdCurso: TCmDbField read FIdCurso write FIdCurso;
    property LocalCurso: TCmDbField read FLocalCurso write FLocalCurso;
    property DatReIni: TCmDbField read FDatReIni write FDatReIni;
    property DatReFim: TCmDbField read FDatReFim write FDatReFim;
    property DatPlIni: TCmDbField read FDatPlIni write FDatPlIni;
    property DatPlFim: TCmDbField read FDatPlFim write FDatPlFim;
    property FlgControle: TCmDbField read FFlgControle write FFlgControle;
    property FlgAvalTeor: TCmDbField read FFlgAvalTeor write FFlgAvalTeor;
    property FlgAvalPrat: TCmDbField read FFlgAvalPrat write FFlgAvalPrat;
    property FlgAvalCurs: TCmDbField read FFlgAvalCurs write FFlgAvalCurs;
    property Dur_Tot: TCmDbField read FDur_Tot write FDur_Tot;
    property Dur_Teor: TCmDbField read FDur_Teor write FDur_Teor;
    property Dur_Prat: TCmDbField read FDur_Prat write FDur_Prat;
    property Desp_Viag: TCmDbField read FDesp_Viag write FDesp_Viag;
    property Desp_Outr: TCmDbField read FDesp_Outr write FDesp_Outr;
    property Desp_Estad: TCmDbField read FDesp_Estad write FDesp_Estad;
    property AvalTeor: TCmDbField read FAvalTeor write FAvalTeor;
    property AvalPrat: TCmDbField read FAvalPrat write FAvalPrat;
    property AvalCurso: TCmDbField read FAvalCurso write FAvalCurso;
    property Valor: TCmDbField read FValor write FValor;
    property IdModulo: TCmDbField read FIdModulo write FIdModulo;
    property DataHora: TCmDbField read FDataHora write FDataHora;
    property Instrutores: TCmDbField read FInstrutores write FInstrutores;
    property Certificacao: TCmDbField read FCertificacao write FCertificacao;
  end;

implementation

{ TDbHstTrn }

constructor TDbHstTrn.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTTRN';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,true,'');
  FIdCurso := CreateCmDbField('IDCURSO',ftFloat,true,true,false,true,'');
  FIdInstrutor := CreateCmDbField('IDINSTRUTOR',ftFloat,false,false,false,true,'');
  FIdEntidInstr := CreateCmDbField('IDENTIDINSTR',ftFloat,false,false,false,true,'');
  FIdProcesso := CreateCmDbField('IDPROCESSO',ftFloat,false,false,false,true,'');
  FLocalCurso := CreateCmDbField('LOCALCURSO',ftString,false,false,false,true,'');
  FDatReIni := CreateCmDbField('DATREINI',ftDateTime,false,false,false,true,'');
  FDatReFim := CreateCmDbField('DATREFIM',ftDateTime,false,false,false,true,'');
  FDatPlIni := CreateCmDbField('DATPLINI',ftDateTime,false,false,false,true,'');
  FDatPlFim := CreateCmDbField('DATPLFIM',ftDateTime,false,false,false,true,'');
  FFlgControle := CreateCmDbField('FLGCONTROLE',ftFloat,false,false,false,false,'');
  FFlgAvalTeor := CreateCmDbField('FLGAVALTEOR',ftFloat,false,false,false,false,'');
  FFlgAvalPrat := CreateCmDbField('FLGAVALPRAT',ftFloat,false,false,false,false,'');
  FFlgAvalCurs := CreateCmDbField('FLGAVALCURS',ftFloat,false,false,false,false,'');
  FDur_Tot := CreateCmDbField('DUR_TOT',ftFloat,false,false,false,false,'');
  FDur_Teor := CreateCmDbField('DUR_TEOR',ftFloat,false,false,false,false,'');
  FDur_Prat := CreateCmDbField('DUR_PRAT',ftFloat,false,false,false,false,'');
  FDesp_Viag := CreateCmDbField('DESP_VIAG',ftFloat,false,false,false,false,'');
  FDesp_Outr := CreateCmDbField('DESP_OUTR',ftFloat,false,false,false,false,'');
  FDesp_Estad := CreateCmDbField('DESP_ESTAD',ftFloat,false,false,false,false,'');
  FAvalTeor := CreateCmDbField('AVALTEOR',ftFloat,false,false,false,false,'');
  FAvalPrat := CreateCmDbField('AVALPRAT',ftFloat,false,false,false,false,'');
  FAvalCurso := CreateCmDbField('AVALCURSO',ftFloat,false,false,false,false,'');
  FValor := CreateCmDbField('VALOR',ftFloat,false,false,false,false,'');
  FIdModulo := CreateCmDbField('IDMODULO',ftFloat,false,false,false,true,'');
  FDataHora := CreateCmDbField('DATAHORA',ftString,false,false,false,true,'');
  FInstrutores := CreateCmDbField('INSTRUTORES',ftString,false,false,false,true,'');
  FCertificacao := CreateCmDbField('CERTIFICACAO',ftString,false,false,false,true,'');
end;

end.
