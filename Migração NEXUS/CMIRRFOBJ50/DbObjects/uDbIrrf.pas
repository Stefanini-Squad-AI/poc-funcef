{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 25/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbIrrf;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, ucmCustomCDbObject;

Type
  TDbIrrf = class(TCmDbObject)

  private
    FAliquota_irrf: TCmDbField;
    FParcdeduzirrf: TCmDbField;
    FFaixa_irrf: TCmDbField;

    FIdIRRF: TCmDbField;
    FDataIniVigencia: TCmDbField;

    procedure SetAliquota_irrf(const Value: TCmDbField);
    procedure SetFaixa_irrf(const Value: TCmDbField);
    procedure SetParcdeduzirrf(const Value: TCmDbField);

    procedure SetIdIRRF(const Value: TCmDbField);
    procedure SetDataIniVigencia(const Value: TCmDbField);

  public

     Property Parcdeduzirrf: TCmDbField   read FParcdeduzirrf   write SetParcdeduzirrf;
     Property Faixa_irrf: TCmDbField      read FFaixa_irrf      write SetFaixa_irrf;
     Property Aliquota_irrf: TCmDbField   read FAliquota_irrf   write SetAliquota_irrf;

     Property IdIRRF: TCmDbField          read FIdIRRF          write SetIdIRRF;
     Property DataIniVigencia: TCmDbField read FDataIniVigencia write SetDataIniVigencia;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbIrrf }

constructor TDbIrrf.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'IRRF';
  _UpdateKeyFields := True;
  fParcdeduzirrf := CreateCmDbField('PARCDEDUZIRRF',ftfloat,False,False,False,False,'');
  fFaixa_irrf := CreateCmDbField('FAIXA_IRRF',ftfloat,True,False,False,True,'');
  fAliquota_irrf := CreateCmDbField('ALIQUOTA_IRRF',ftfloat,False,False,False,False,'');

  fIdIRRF := CreateCmDbField( 'IDIRRF', ftfloat, True, True, False, False, '');
  fDataIniVigencia := CreateCmDbField('DATAINIVIGENCIA', ftDate, True, False, False, False, '');

end;

function TDbIrrf.Insert: Boolean;
begin

   FIdIRRF.AsFloat := GetSequence('IRRF');
   Result := Inherited Insert;

end;

function TDbIrrf.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbIrrf.SetAliquota_irrf(const Value: TCmDbField);
begin
  FAliquota_irrf := Value;
end;

procedure TDbIrrf.SetDataIniVigencia(const Value: TCmDbField);
begin
  FDataIniVigencia := Value;
end;

procedure TDbIrrf.SetFaixa_irrf(const Value: TCmDbField);
begin
  FFaixa_irrf := Value;
end;

procedure TDbIrrf.SetIdIRRF(const Value: TCmDbField);
begin
  FIdIRRF := Value;
end;

procedure TDbIrrf.SetParcdeduzirrf(const Value: TCmDbField);
begin
  FParcdeduzirrf := Value;
end;

end.




