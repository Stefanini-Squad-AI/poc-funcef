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
    procedure SetAliquota_irrf(const Value: TCmDbField);
    procedure SetFaixa_irrf(const Value: TCmDbField);
    procedure SetParcdeduzirrf(const Value: TCmDbField);

  public

     Property Parcdeduzirrf: TCmDbField read FParcdeduzirrf write SetParcdeduzirrf;
     Property Faixa_irrf: TCmDbField    read FFaixa_irrf    write SetFaixa_irrf;
     Property Aliquota_irrf: TCmDbField read FAliquota_irrf write SetAliquota_irrf;

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
  fParcdeduzirrf := CreateCmDbField('PARCDEDUZIRRF',ftfloat,False,False,False,True,'');
  fFaixa_irrf := CreateCmDbField('FAIXA_IRRF',ftfloat,True,True,False,True,'');
  fAliquota_irrf := CreateCmDbField('ALIQUOTA_IRRF',ftfloat,False,False,False,True,'');
end;

function TDbIrrf.Insert: Boolean;
begin

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

procedure TDbIrrf.SetFaixa_irrf(const Value: TCmDbField);
begin
  FFaixa_irrf := Value;
end;

procedure TDbIrrf.SetParcdeduzirrf(const Value: TCmDbField);
begin
  FParcdeduzirrf := Value;
end;

end.



