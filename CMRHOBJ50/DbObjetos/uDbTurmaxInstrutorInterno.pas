unit uDbTurmaxInstrutorInterno;

{--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
--------------------------------------------------------------------------------------------------}

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

type

   TDbTurmaxInstrutorInterno = Class(TCmDbObject)

   private
    FIDTURMA: TCmDbField;
    FIDPESSOA: TCmDbField;
    FIDTXII: TCmDbField;
    procedure SetIDPESSOA(const Value: TCmDbField);
    procedure SetIDTURMA(const Value: TCmDbField);
    procedure SetIDTXII(const Value: TCmDbField);

   protected

   public
      Property IDTXII     : TCmDbField read FIDTXII write SetIDTXII;
      Property IDTURMA    : TCmDbField read FIDTURMA write SetIDTURMA;
      Property IDPESSOA   : TCmDbField read FIDPESSOA write SetIDPESSOA;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;
      Function Insert: Boolean; Override;
      Function Update: Boolean; Override;
      Function LoadFromDb: Boolean; Override;

   end;


implementation

{ TDbTurmaxConteudo }

constructor TDbTurmaxInstrutorInterno.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TURMAXINST_INT';

  fIdTxII    := CreateCmDbField( 'IDTXII',     ftfloat,  True,  True,   False, True, '');
  fIdTurma   := CreateCmDbField( 'IDTURMA',    ftfloat,  True,  False,  False, True, '');
  fIdPessoa  := CreateCmDbField( 'IDPESSOA',   ftfloat,  True,  False,  False, True, '');

end;

function TDbTurmaxInstrutorInterno.Insert: Boolean;
begin
   fIDTXII.AsFloat := GetSequence('TURMAXINST_INT');
   Result := Inherited Insert;
end;

function TDbTurmaxInstrutorInterno.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbTurmaxInstrutorInterno.SetIDPESSOA(const Value: TCmDbField);
begin
  FIDPESSOA := Value;
end;

procedure TDbTurmaxInstrutorInterno.SetIDTURMA(const Value: TCmDbField);
begin
  FIDTURMA := Value;
end;

procedure TDbTurmaxInstrutorInterno.SetIDTXII(const Value: TCmDbField);
begin
  FIDTXII := Value;
end;

function TDbTurmaxInstrutorInterno.Update: Boolean;
begin
   Result := Inherited Update;
end;

end.
