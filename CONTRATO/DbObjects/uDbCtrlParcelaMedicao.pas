{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Sol..........: 218909/16724 
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação do alerta de contratos.
--------------------------------------------------------------------------------}

unit uDbCtrlParcelaMedicao;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbCtrlParcelaMedicao = class(TCmDbObject)
  private
    FFlgParcelaMedida: TCmDbField;
    FVencimento: TCmDbField;
    FIdContrato: TCmDbField;
    FIdParcMedicao: TCmDbField;
    FParcelaNum: TCmDbField;
    FIdItem: TCmDbField;
    FIdAditamento: TCmDbField;
    FIdMedicao: TCmDbField;
    FIdObjeto: TCmDbField;

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert : Boolean; override;

    property IdParcMedicao : TCmDbField read FIdParcMedicao write FIdParcMedicao;
    property IdMedicao : TCmDbField read FIdMedicao write FIdMedicao;
    property IdContrato : TCmDbField read FIdContrato write FIdContrato;
    property IdItem : TCmDbField read FIdItem write FIdItem;
    property IdObjeto : TCmDbField read FIdObjeto write FIdObjeto;
    property ParcelaNum : TCmDbField read FParcelaNum write FParcelaNum;
    property Vencimento : TCmDbField read FVencimento write FVencimento;
    property FlgParcelaMedida : TCmDbField read FFlgParcelaMedida write FFlgParcelaMedida;
    property IdAditamento : TCmDbField read FIdAditamento write FIdAditamento;
  end;

implementation

{ TDbCtrlParcelaMedicao }

constructor TDbCtrlParcelaMedicao.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;

  TableName := 'CTRLPARCELAMEDICAO';

  IdParcMedicao := CreateCmDbField('IDPARCMEDICAO', ftFloat, True, True, False, False, '');
  IdMedicao := CreateCmDbField('IDMEDICAO', ftFloat, False, False, False, True, '');
  IdContrato := CreateCmDbField('IDCONTRATO', ftFloat, False, False, False, False, '');
  IdItem := CreateCmDbField('IDITEM', ftFloat, False, False, False, False, '');
  IdObjeto := CreateCmDbField('IDOBJETO', ftFloat, False, False, False, False, '');
  ParcelaNum := CreateCmDbField('PARCELANUM', ftFloat, False, False, False, False, '');
  Vencimento := CreateCmDbField('VENCIMENTO', ftDateTime, False, False, False, True, '');
  FlgParcelaMedida := CreateCmDbField('FLGPARCELAMEDIDA', ftFloat, False, False, False, False, '');
  IdAditamento := CreateCmDbField('IDADITAMENTO', ftFloat, False, False, False, True, '');

end;

function TDbCtrlParcelaMedicao.Insert: Boolean;
begin
  FIdParcMedicao.AsFloat := GetSequence('CTRLPARCELAMEDICAO');
  Result := inherited Insert;
end;

end.
