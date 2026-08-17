//***************************************************************************************
//N. SIG.............: 102320
//Data da Alteração..: 30/09/2020 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de campo para identificação de Tipo de Pagamento/Recebimento.
//***************************************************************************************
unit uDbFormaRecPagXTipoFormaRecPag;

interface
uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject; 

type
  TDbFormaRecPagXTipoFormaRecPag = class(TCmDbObject)

  private
    FIdTipoFormaRecPag: TCmDbField;
    FCodForma: TCmDbField;
    procedure SetCodForma(const Value: TCmDbField);
    procedure SetIdTipoFormaRecPag(const Value: TCmDbField);

  public
    property CodForma: TCmDbField read FCodForma write SetCodForma;
    property IdTipoFormaRecPag: TCmDbField read FIdTipoFormaRecPag write SetIdTipoFormaRecPag;
    constructor Create(owner : TCmCustomCdbObject); override;
    function Insert :Boolean; override;
    function LoadFromDb :Boolean; override;
  end;

implementation

{ TDbFormaRecPagXTipoFormaRecPag }

constructor TDbFormaRecPagXTipoFormaRecPag.Create(
  owner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORMARECPAGXTIPOFORMARECPAG';

  FCodForma := CreateCmDbField('CODFORMA',ftFloat,True,True,False,False,'');
  FIdTipoFormaRecPag := CreateCmDbField('IDTIPOFORMARECPAG',ftFloat,False,False,False,False,'');

end;

function TDbFormaRecPagXTipoFormaRecPag.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbFormaRecPagXTipoFormaRecPag.LoadFromDb: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbFormaRecPagXTipoFormaRecPag.SetCodForma(
  const Value: TCmDbField);
begin
  FCodForma := Value;
end;

procedure TDbFormaRecPagXTipoFormaRecPag.SetIdTipoFormaRecPag(
  const Value: TCmDbField);
begin
  FIdTipoFormaRecPag := Value;
end;

end.
