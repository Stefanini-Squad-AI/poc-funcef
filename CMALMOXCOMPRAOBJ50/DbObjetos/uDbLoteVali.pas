{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 05/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbLoteVali;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbLoteVali = class(TCmDbObject)

  private
    FSaldoLote: TCmDbField;
    FCodAlmoxarifado: TCmDbField;
    FDataValidade: TCmDbField;
    FCodArtigo: TCmDbField;
    procedure SetCodAlmoxarifado(const Value: TCmDbField);
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetDataValidade(const Value: TCmDbField);
    procedure SetSaldoLote(const Value: TCmDbField);

  public

     Property SaldoLote       : TCmDbField read FSaldoLote write SetSaldoLote;
     Property DataValidade    : TCmDbField read FDataValidade write SetDataValidade;
     Property CodArtigo       : TCmDbField read FCodArtigo write SetCodArtigo;
     Property CodAlmoxarifado : TCmDbField read FCodAlmoxarifado write SetCodAlmoxarifado;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbLoteVali }

constructor TDbLoteVali.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOTEVALI';

   fSaldolote       := CreateCmDbField('SALDOLOTE',ftfloat,False,False,False,False,'');
   fDatavalidade    := CreateCmDbField('DATAVALIDADE',ftDateTime,True,True,False,True,'');
   fCodartigo       := CreateCmDbField('CODARTIGO',ftString,True,True,False,True,'');
   fCodalmoxarifado := CreateCmDbField('CODALMOXARIFADO',ftfloat,True,True,False,True,'');
end;

function TDbLoteVali.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbLoteVali.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbLoteVali.SetCodAlmoxarifado(const Value: TCmDbField);
begin
  FCodAlmoxarifado := Value;
end;

procedure TDbLoteVali.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbLoteVali.SetDataValidade(const Value: TCmDbField);
begin
  FDataValidade := Value;
end;

procedure TDbLoteVali.SetSaldoLote(const Value: TCmDbField);
begin
  FSaldoLote := Value;
end;

end.



