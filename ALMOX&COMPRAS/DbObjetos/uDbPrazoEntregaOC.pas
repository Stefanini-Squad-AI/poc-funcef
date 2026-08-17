{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 13/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbPrazoEntregaOC;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbPrazoEntregaOC = class(TCmDbObject)

  private
    FQtdeEntrega: TCmDbField;
    FParcelaEntrega: TCmDbField;
    FDataEntrega: TCmDbField;
    FIdItemOC: TCmDbField;
    FPeriodoPrazo: TCmDbField;
    FPrazoEntrega: TCmDbField;
    procedure SetDataEntrega(const Value: TCmDbField);
    procedure SetIdItemOC(const Value: TCmDbField);
    procedure SetParcelaEntrega(const Value: TCmDbField);
    procedure SetPeriodoPrazo(const Value: TCmDbField);
    procedure SetPrazoEntrega(const Value: TCmDbField);
    procedure SetQtdeEntrega(const Value: TCmDbField);

  public

     Property QtdeEntrega    : TCmDbField read FQtdeEntrega write SetQtdeEntrega;
     Property PrazoEntrega   : TCmDbField read FPrazoEntrega write SetPrazoEntrega;
     Property PeriodoPrazo   : TCmDbField read FPeriodoPrazo write SetPeriodoPrazo;
     Property ParcelaEntrega : TCmDbField read FParcelaEntrega write SetParcelaEntrega;
     Property IdItemOC       : TCmDbField read FIdItemOC write SetIdItemOC;
     Property DataEntrega    : TCmDbField read FDataEntrega write SetDataEntrega;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPrazoEntregaOC }

constructor TDbPrazoEntregaOC.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PRAZOENTREGAOC';

   fQtdeentrega    := CreateCmDbField('QTDEENTREGA'    ,ftfloat,False,False,False,True,'');
   fPrazoentrega   := CreateCmDbField('PRAZOENTREGA'   ,ftfloat,False,False,False,True,'');
   fPeriodoprazo   := CreateCmDbField('PERIODOPRAZO'   ,ftString,False,False,False,True,'');
   fParcelaentrega := CreateCmDbField('PARCELAENTREGA' ,ftfloat,True,True,False,True,'');
   fIditemoc       := CreateCmDbField('IDITEMOC'       ,ftfloat,True,True,False,True,'');
   fDataentrega    := CreateCmDbField('DATAENTREGA'    ,ftDateTime,False,False,False,True,'');
end;

function TDbPrazoEntregaOC.Insert: Boolean;
begin
   Result := Inherited Insert;

end;

function TDbPrazoEntregaOC.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPrazoEntregaOC.SetDataEntrega(const Value: TCmDbField);
begin
  FDataEntrega := Value;
end;

procedure TDbPrazoEntregaOC.SetIdItemOC(const Value: TCmDbField);
begin
  FIdItemOC := Value;
end;

procedure TDbPrazoEntregaOC.SetParcelaEntrega(const Value: TCmDbField);
begin
  FParcelaEntrega := Value;
end;

procedure TDbPrazoEntregaOC.SetPeriodoPrazo(const Value: TCmDbField);
begin
  FPeriodoPrazo := Value;
end;

procedure TDbPrazoEntregaOC.SetPrazoEntrega(const Value: TCmDbField);
begin
  FPrazoEntrega := Value;
end;

procedure TDbPrazoEntregaOC.SetQtdeEntrega(const Value: TCmDbField);
begin
  FQtdeEntrega := Value;
end;

end.



