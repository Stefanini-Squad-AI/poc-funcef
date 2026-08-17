{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 26054
Data........: 26/12/2016
Responsável.: Michelle Suellyn Mota | Darivaldo Alencar Add: NUMLANCTO
Descrição...: Criação da tela Gestão de Investimento - Imóvel.
--------------------------------------------------------------------------------}

unit uDbDocumentoXVoto;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbDocumentoXVoto = class(TCmDbObject)

  private
    FIdDocumentoXVoto:   TCmDbField;
    FIdVotoGestaoImovel: TCmDbField;
    FCodDocumento:       TCmDbField;
    fNumLancto: TCmDbField;

    procedure SetIdDocumentoXVoto(const Value: TCmDbField);
    procedure SetIdVotoGestaoImovel(const Value: TCmDbField);
    procedure SetCodDocumento(const Value: TCmDbField);
    procedure SetNumLancto(const Value: TCmDbField);

  public
    Property IdDocumentoXVoto: TCmDbField read FIdDocumentoXVoto write SetIdDocumentoXVoto;
    Property IdVotoGestaoImovel: TCmDbField read FIdVotoGestaoImovel write SetIdVotoGestaoImovel;
    Property CodDocumento: TCmDbField read FCodDocumento write SetCodDocumento;
    Property NumLancto:TCmDbField read fNumLancto write SetNumLancto;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbVotoGestaoImovel }

constructor TDbDocumentoXVoto.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'DocumentoXVoto';

   FIdDocumentoXVoto := CreateCmDbField('IDDOCUMENTOXVOTO',ftFloat,True,True,False,True,'');
   FIdVotoGestaoImovel := CreateCmDbField('IDVOTOGESTAOIMOVEL',ftFloat,False,False,False,True,'');
   FCodDocumento := CreateCmDbField('CODDOCUMENTO',ftFloat,False,False,False,True,'');
   NumLancto := CreateCmDbField('NUMLANCTO',ftFloat,False,False,False,True,'');
end;

function TDbDocumentoXVoto.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbDocumentoXVoto.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbDocumentoXVoto.SetIdDocumentoXVoto(const Value: TCmDbField);
begin
  FIdDocumentoXVoto := Value;
end;

procedure TDbDocumentoXVoto.SetIdVotoGestaoImovel(const Value: TCmDbField);
begin
  FIdVotoGestaoImovel := Value;
end;

procedure TDbDocumentoXVoto.SetCodDocumento(const Value: TCmDbField);
begin
  FCodDocumento := Value;
end;

procedure TDbDocumentoXVoto.SetNumLancto(const Value: TCmDbField);
begin
  fNumLancto := Value;
end;

end.