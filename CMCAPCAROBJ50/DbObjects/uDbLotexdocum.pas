{******************************************************************************}
{  Sistema - CMCapCarObj50                                                     }
{  Unit    - uDbLotexdocum                                                     }
{------------------------------------------------------------------------------}
// Data      : 19/08/2004 (término)
// Autor     : David Ayrolla
// Pendência : 17221
// Descrição : Incluído campo IDPROCESSO.
//------------------------------------------------------------------------------

unit uDbLotexdocum;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbLotexdocum = class(TCmDbObject)

  private
    FLotetransmissao: TCmDbField;
    FValor: TCmDbField;
    FCoddocumento: TCmDbField;
    FCodbarravalor: TCmDbField;
    FCodbarra: TCmDbField;
    FFlgbaixa: TCmDbField;
    FNumlote: TCmDbField;
    FIdprocesso: TCmDbField;
    procedure SetCodbarra(const Value: TCmDbField);
    procedure SetCodbarravalor(const Value: TCmDbField);
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetFlgbaixa(const Value: TCmDbField);
    procedure SetLotetransmissao(const Value: TCmDbField);
    procedure SetNumlote(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetIdprocesso(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Numlote: TCmDbField read FNumlote write SetNumlote;
     Property Lotetransmissao: TCmDbField read FLotetransmissao write SetLotetransmissao;
     Property Flgbaixa: TCmDbField read FFlgbaixa write SetFlgbaixa;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Codbarravalor: TCmDbField read FCodbarravalor write SetCodbarravalor;
     Property Codbarra: TCmDbField read FCodbarra write SetCodbarra;

     //DAVID - Pendência 17221
     Property Idprocesso : TCmDbField read FIdprocesso write SetIdprocesso;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbLotexdocum }

constructor TDbLotexdocum.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOTEXDOCUM';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,False,'',2);
   fNumlote := CreateCmDbField('NUMLOTE',ftfloat,True,True,False,True,'');
   fLotetransmissao := CreateCmDbField('LOTETRANSMISSAO',ftfloat,False,False,False,True,'');
   fFlgbaixa := CreateCmDbField('FLGBAIXA',ftString,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,True,False,True,'');
   fCodbarravalor := CreateCmDbField('CODBARRAVALOR',ftString,False,False,False,True,'');
   fCodbarra := CreateCmDbField('CODBARRA',ftString,False,False,False,True,'');

   //DAVID - Pendência 17221
   fIdprocesso := CreateCmDbField('IDPROCESSO',ftfloat,False,False,False,True,'');
end;

function TDbLotexdocum.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbLotexdocum.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbLotexdocum.SetCodbarra(const Value: TCmDbField);
begin
  FCodbarra := Value;
end;

procedure TDbLotexdocum.SetCodbarravalor(const Value: TCmDbField);
begin
  FCodbarravalor := Value;
end;

procedure TDbLotexdocum.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbLotexdocum.SetFlgbaixa(const Value: TCmDbField);
begin
  FFlgbaixa := Value;
end;

procedure TDbLotexdocum.SetIdprocesso(const Value: TCmDbField);
begin
  FIdprocesso := Value;
end;

procedure TDbLotexdocum.SetLotetransmissao(const Value: TCmDbField);
begin
  FLotetransmissao := Value;
end;

procedure TDbLotexdocum.SetNumlote(const Value: TCmDbField);
begin
  FNumlote := Value;
end;

procedure TDbLotexdocum.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



