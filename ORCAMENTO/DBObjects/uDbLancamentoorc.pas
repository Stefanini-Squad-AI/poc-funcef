{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Goncalves             }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbLancamentoorc;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbLancamentoorc = class(TCmDbObject)

  private
     FVlrlancamento: TCmDbField;
     FPlncodigo: TCmDbField;
     FIdplanoorcamen: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdlancamentoorc: TCmDbField;
     FIdcontaorcamen: TCmDbField;
     FDatareferencia: TCmDbField;

     Procedure SetVlrlancamento(const Value: TCmDbField);
     Procedure SetPlncodigo(const Value: TCmDbField);
     Procedure SetIdplanoorcamen(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdlancamentoorc(const Value: TCmDbField);
     Procedure SetIdcontaorcamen(const Value: TCmDbField);
     Procedure SetDatareferencia(const Value: TCmDbField);

  public

     Property Vlrlancamento  : TCmDbField
                               Read FVlrlancamento   Write SetVlrlancamento;
     Property Plncodigo      : TCmDbField
                               Read FPlncodigo       Write SetPlncodigo;
     Property Idplanoorcamen : TCmDbField
                               Read FIdplanoorcamen  Write SetIdplanoorcamen;
     Property Idpessoa       : TCmDbField
                               Read FIdpessoa        Write SetIdpessoa;
     Property Idlancamentoorc: TCmDbField
                               Read FIdlancamentoorc Write SetIdlancamentoorc;
     Property Idcontaorcamen : TCmDbField
                               Read FIdcontaorcamen  Write SetIdcontaorcamen;
     Property Datareferencia : TCmDbField
                               Read FDatareferencia  Write SetDatareferencia;

     Constructor Create(AOwner: TcmCustomcdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbLancamentoorc }

constructor TDbLancamentoorc.Create(AOwner: TcmCustomcdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCAMENTOORC';

  fVlrlancamento   := CreateCmDbField('VLRLANCAMENTO'  ,ftfloat   ,False,
                      False,False,True,'');
  fPlncodigo       := CreateCmDbField('PLNCODIGO'      ,ftfloat   ,False,
                      False,False,True,'');
  fIdplanoorcamen  := CreateCmDbField('IDPLANOORCAMEN' ,ftfloat   ,False,
                      False,False,True,'');
  fIdpessoa        := CreateCmDbField('IDPESSOA'       ,ftfloat   ,False,
                      False,False,True,'');
  fIdlancamentoorc := CreateCmDbField('IDLANCAMENTOORC',ftfloat   ,True ,
                      True ,False,True,'');
  fIdcontaorcamen  := CreateCmDbField('IDCONTAORCAMEN' ,ftString  ,False,
                      False,False,True,'');
  fDatareferencia  := CreateCmDbField('DATAREFERENCIA' ,ftDateTime,False,
                      False,False,True,'');
end;

function TDbLancamentoorc.Insert: Boolean;
begin

   fIdlancamentoorc.AsFloat := GetSequence('LANCAMENTOORC');
   Result := Inherited Insert;

end;

function TDbLancamentoorc.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

Procedure TDbLancamentoorc.SetVlrlancamento(const Value: TCmDbField);
Begin

  FVlrlancamento := Value;
End;

Procedure TDbLancamentoorc.SetPlncodigo(const Value: TCmDbField);
Begin

  FPlncodigo := Value;
End;

Procedure TDbLancamentoorc.SetIdplanoorcamen(const Value: TCmDbField);
Begin

  FIdplanoorcamen := Value;
End;

Procedure TDbLancamentoorc.SetIdpessoa(const Value: TCmDbField);
Begin

  FIdpessoa := Value;
End;

Procedure TDbLancamentoorc.SetIdlancamentoorc(const Value: TCmDbField);
Begin

  FIdlancamentoorc := Value;
End;

Procedure TDbLancamentoorc.SetIdcontaorcamen(const Value: TCmDbField);
Begin

  FIdcontaorcamen := Value;
End;

Procedure TDbLancamentoorc.SetDatareferencia(const Value: TCmDbField);
Begin

  FDatareferencia := Value;
End;

end.



