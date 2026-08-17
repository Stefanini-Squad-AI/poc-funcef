{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 05/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbCustoMed;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbCustoMed = class(TCmDbObject)

  private
    FSaldoQtdeUC: TCmDbField;
    FCustoMedio: TCmDbField;
    FCodCusteio: TCmDbField;
    FIdMovUltCompra: TCmDbField;
    FCustoRep: TCmDbField;
    FCodArtigo: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodCusteio(const Value: TCmDbField);
    procedure SetCustoMedio(const Value: TCmDbField);
    procedure SetCustoRep(const Value: TCmDbField);
    procedure SetIdMovUltCompra(const Value: TCmDbField);
    procedure SetSaldoQtdeUC(const Value: TCmDbField);

  public

     Property SaldoQtdeUC     : TCmDbField read FSaldoQtdeUC write SetSaldoQtdeUC;
     Property IdMovUltCompra  : TCmDbField read FIdMovUltCompra write SetIdMovUltCompra;
     Property CustoRep        : TCmDbField read FCustoRep write SetCustoRep;
     Property CustoMedio      : TCmDbField read FCustoMedio write SetCustoMedio;
     Property CodCusteio      : TCmDbField read FCodCusteio write SetCodCusteio;
     Property CodArtigo       : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCustoMed }

constructor TDbCustoMed.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CUSTOMED';

   fSaldoqtdeuc    := CreateCmDbField('SALDOQTDEUC',ftfloat,False,False,False,False,'');
   fIdmovultcompra := CreateCmDbField('IDMOVULTCOMPRA',ftfloat,False,False,False,True,'');
   fCustorep       := CreateCmDbField('CUSTOREP',ftfloat,False,False,False,False,'');
   fCustomedio     := CreateCmDbField('CUSTOMEDIO',ftfloat,False,False,False,False,'');
   fCodcusteio     := CreateCmDbField('CODCUSTEIO',ftfloat,True,True,False,True,'');
   fCodartigo      := CreateCmDbField('CODARTIGO',ftString,True,True,False,True,'');
end;

function TDbCustoMed.Insert: Boolean;
begin
   Result := Inherited Insert;
End;

function TDbCustoMed.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbCustoMed.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbCustoMed.SetCodCusteio(const Value: TCmDbField);
begin
  FCodCusteio := Value;
end;

procedure TDbCustoMed.SetCustoMedio(const Value: TCmDbField);
begin
  FCustoMedio := Value;
end;

procedure TDbCustoMed.SetCustoRep(const Value: TCmDbField);
begin
  FCustoRep := Value;
end;

procedure TDbCustoMed.SetIdMovUltCompra(const Value: TCmDbField);
begin
  FIdMovUltCompra := Value;
end;

procedure TDbCustoMed.SetSaldoQtdeUC(const Value: TCmDbField);
begin
  FSaldoQtdeUC := Value;
end;

end.



