{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbPrazoPgtoOC;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbPrazoPgtoOC = class(TCmDbObject)

  private
    FIdItemOC: TCmDbField;
    FPercPagto: TCmDbField;
    FParcelaPgto: TCmDbField;
    FPeriodoPrazo: TCmDbField;
    FPrazoPgto: TCmDbField;
    FDataPagto: TCmDbField;
    procedure SetDataPagto(const Value: TCmDbField);
    procedure SetIdItemOC(const Value: TCmDbField);
    procedure SetParcelaPgto(const Value: TCmDbField);
    procedure SetPercPagto(const Value: TCmDbField);
    procedure SetPeriodoPrazo(const Value: TCmDbField);
    procedure SetPrazoPgto(const Value: TCmDbField);

  public

     Property PrazoPgto    : TCmDbField read FPrazoPgto write SetPrazoPgto;
     Property PeriodoPrazo : TCmDbField read FPeriodoPrazo write SetPeriodoPrazo;
     Property PercPagto    : TCmDbField read FPercPagto write SetPercPagto;
     Property ParcelaPgto  : TCmDbField read FParcelaPgto write SetParcelaPgto;
     Property IdItemOC     : TCmDbField read FIdItemOC write SetIdItemOC;
     Property DataPagto    : TCmDbField read FDataPagto write SetDataPagto;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPrazoPgtoOC }

constructor TDbPrazoPgtoOC.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PRAZOPGTOOC';

   fPrazopgto    := CreateCmDbField('PRAZOPGTO'    ,ftfloat,False,False,False,True,'');
   fPeriodoprazo := CreateCmDbField('PERIODOPRAZO' ,ftString,False,False,False,True,'');
   fPercpagto    := CreateCmDbField('PERCPAGTO'    ,ftfloat,False,False,False,True,'');
   fParcelapgto  := CreateCmDbField('PARCELAPGTO'  ,ftfloat,True,True,False,True,'');
   fIditemoc     := CreateCmDbField('IDITEMOC'     ,ftfloat,True,True,False,True,'');
   fDatapagto    := CreateCmDbField('DATAPAGTO'    ,ftDateTime,False,False,False,True,'');
end;

function TDbPrazoPgtoOC.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbPrazoPgtoOC.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPrazoPgtoOC.SetDataPagto(const Value: TCmDbField);
begin
  FDataPagto := Value;
end;

procedure TDbPrazoPgtoOC.SetIdItemOC(const Value: TCmDbField);
begin
  FIdItemOC := Value;
end;

procedure TDbPrazoPgtoOC.SetParcelaPgto(const Value: TCmDbField);
begin
  FParcelaPgto := Value;
end;

procedure TDbPrazoPgtoOC.SetPercPagto(const Value: TCmDbField);
begin
  FPercPagto := Value;
end;

procedure TDbPrazoPgtoOC.SetPeriodoPrazo(const Value: TCmDbField);
begin
  FPeriodoPrazo := Value;
end;

procedure TDbPrazoPgtoOC.SetPrazoPgto(const Value: TCmDbField);
begin
  FPrazoPgto := Value;
end;

end.



