unit uDbTurmaxInstrutorExterno;

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

   TDbTurmaxInstrutorExterno = Class(TCmDbObject)

   private
    FIDTURMA: TCmDbField;
    FIDINSTEXT: TCmDbField;
    FIDTXIE: TCmDbField;
    procedure SetIDINSTEXT(const Value: TCmDbField);
    procedure SetIDTURMA(const Value: TCmDbField);
    procedure SetIDTXIE(const Value: TCmDbField);

   protected

   public
      Property IDTXIE     : TCmDbField read FIDTXIE write SetIDTXIE;
      Property IDTURMA    : TCmDbField read FIDTURMA write SetIDTURMA;
      Property IDINSTEXT  : TCmDbField read FIDINSTEXT write SetIDINSTEXT;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;
      Function Insert: Boolean; Override;
      Function Update: Boolean; Override;
      Function LoadFromDb: Boolean; Override;

   end;


implementation

{ TDbTurmaxConteudo }

constructor TDbTurmaxInstrutorExterno.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TURMAXINST_EXT';

  fIdTxIE    := CreateCmDbField( 'IDTXIE',     ftfloat,  True,  True,   False, True, '');
  fIdTurma   := CreateCmDbField( 'IDTURMA',    ftfloat,  True,  False,  False, True, '');
  fIdInstExt := CreateCmDbField( 'IDINSTEXT',  ftfloat,  True,  False,  False, True, '');

end;

function TDbTurmaxInstrutorExterno.Insert: Boolean;
begin
   fIDTXIE.AsFloat := GetSequence('TURMAXINST_EXT');
   Result := Inherited Insert;
end;

function TDbTurmaxInstrutorExterno.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbTurmaxInstrutorExterno.SetIDINSTEXT(const Value: TCmDbField);
begin
  FIDINSTEXT := Value;
end;

procedure TDbTurmaxInstrutorExterno.SetIDTURMA(const Value: TCmDbField);
begin
  FIDTURMA := Value;
end;

procedure TDbTurmaxInstrutorExterno.SetIDTXIE(const Value: TCmDbField);
begin
  FIDTXIE := Value;
end;

function TDbTurmaxInstrutorExterno.Update: Boolean;
begin
   Result := Inherited Update;
end;

end.

