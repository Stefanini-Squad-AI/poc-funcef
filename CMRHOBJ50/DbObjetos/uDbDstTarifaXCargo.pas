{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Andre Mesquita                  }
{ Atualizado Em: 22/03/2007                             }
{                                                       }
{*******************************************************}

unit uDbDstTarifaXCargo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDstTarifaXCargo = class(TCmDbObject)

  private
    FIdcargo: TCmDbField;
    FIddsttarifa: TCmDbField;
    procedure SetIdcargo(const Value: TCmDbField);
    procedure SetIddsttarifa(const Value: TCmDbField);

  public

     Property Iddsttarifa: TCmDbField read FIddsttarifa write SetIddsttarifa;
     Property Idcargo: TCmDbField read FIdcargo write SetIdcargo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbDstTarifaXCargo }

constructor TDbDstTarifaXCargo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DSTTARIFAXCARGO';

   fIddsttarifa := CreateCmDbField('IDDSTTARIFA',ftfloat,True,True,False,False,'');
   fIdcargo := CreateCmDbField('IDCARGO',ftfloat,True,True,False,False,'');
end;

function TDbDstTarifaXCargo.Insert: Boolean;
begin
   // Não existe sequence para tabela com relacionamentos identificados.
   //fIddsttarifa.AsFloat := GetSequence('DSTTARIFAXCARGO');
   //fIdcargo.AsFloat := GetSequence('DSTTARIFAXCARGO');
  Result := Inherited Insert;
end;


procedure TDbDstTarifaXCargo.SetIdcargo(const Value: TCmDbField);
begin
  FIdcargo := Value;
end;

procedure TDbDstTarifaXCargo.SetIddsttarifa(const Value: TCmDbField);
begin
  FIddsttarifa := Value;
end;

end.



