{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbRubXRub;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbRubXRub = class(TCmDbObject)
  private
    FIdRubPrinc: TCmDbField;
    FIdRubSecund: TCmDbField;
    FIndPeriodo: TCmDbField;
    FFlgBaseCalc: TCmDbField;
    FFlgTipoFolha: TCmDbField;
    FFlgAcaoIncide: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IndPeriodo: TCmDbField read FIndPeriodo write FIndPeriodo;
    property IdRubSecund: TCmDbField read FIdRubSecund write FIdRubSecund;
    property IdRubPrinc: TCmDbField read FIdRubPrinc write FIdRubPrinc;
    property FlgTipoFolha: TCmDbField read FFlgTipoFolha write FFlgTipoFolha;
    property FlgBaseCalc: TCmDbField read FFlgBaseCalc write FFlgBaseCalc;
    property FlgAcaoIncide: TCmDbField read FFlgAcaoIncide write FFlgAcaoIncide;
  end;

implementation

{ TDbRubXRub }

constructor TDbRubXRub.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'RUBXRUB';

  FIndPeriodo := CreateCmDbField('INDPERIODO',ftFloat,false,false,false,false,'');
  FIdRubSecund := CreateCmDbField('IDRUBSECUND',ftFloat,True,true,false,false,'');
  FIdRubPrinc := CreateCmDbField('IDRUBPRINC',ftFloat,true,true,false,false,'');
  FFlgTipoFolha := CreateCmDbField('FLGTIPOFOLHA',ftFloat,false,false,false,false,'');
  FFlgBaseCalc := CreateCmDbField('FLGBASECALC',ftFloat,false,false,false,false,'');
  FFlgAcaoIncide := CreateCmDbField('FLGACAOINCIDE',ftFloat,false,false,false,false,'');
end;

end.
