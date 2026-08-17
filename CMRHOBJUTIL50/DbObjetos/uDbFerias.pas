{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFerias;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbFerias = class(TCmDbObject)
  private
    FQtdParcDevol: TCmDbField;
    FIdPessoa: TCmDbField;
    FIniPeriodoFerias: TCmDbField;
    FNumSeq: TCmDbField;
    FFlgAbono: TCmDbField;
    FIdProcesso: TCmDbField;
    FQtDiasAbono: TCmDbField;
    FIniGozoFerias: TCmDbField;
    FFlgOcorrida: TCmDbField;
    FFimGozoFerias: TCmDbField;
    FIndCompleta: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property FlgOcorrida: TCmDbField read FFlgOcorrida write FFlgOcorrida;
    property FlgAbono: TCmDbField read FFlgAbono write FFlgAbono;
    property IdProcesso: TCmDbField read FIdProcesso write FIdProcesso;
    property IniPeriodoFerias: TCmDbField read FIniPeriodoFerias write FIniPeriodoFerias;
    property IniGozoFerias: TCmDbField read FIniGozoFerias write FIniGozoFerias;
    property FimGozoFerias: TCmDbField read FFimGozoFerias write FFimGozoFerias;
    property QtdParcDevol: TCmDbField read FQtdParcDevol write FQtdParcDevol;
    property QtDiasAbono: TCmDbField read FQtDiasAbono write FQtDiasAbono;
    property IndCompleta: TCmDbField read FIndCompleta write FIndCompleta;
  end;

implementation

{ TDbFerias }

constructor TDbFerias.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FERIAS';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,false,'');
  FFlgOcorrida := CreateCmDbField('FLGOCORRIDA',ftFloat,false,false,false,false,'');
  FFlgAbono := CreateCmDbField('FLGABONO',ftFloat,false,false,false,false,'');
  FIdProcesso := CreateCmDbField('IDPROCESSO',ftFloat,false,false,false,true,'');
  FIniPeriodoFerias := CreateCmDbField('INIPERIODOFERIAS',ftDateTime,true,true,false,true,'');
  FIniGozoFerias := CreateCmDbField('INIGOZOFERIAS',ftDateTime,false,false,false,true,'');
  FFimGozoFerias := CreateCmDbField('FIMGOZOFERIAS',ftDateTime,false,false,false,true,'');
  FQtdParcDevol := CreateCmDbField('QTDPARCDEVOL',ftFloat,false,false,false,false,'');
  FQtDiasAbono := CreateCmDbField('QTDIASABONO',ftFloat,false,false,false,false,'');
  FIndCompleta := CreateCmDbField('INDCOMPLETA',ftFloat,false,false,false,false,'');
end;

end.
