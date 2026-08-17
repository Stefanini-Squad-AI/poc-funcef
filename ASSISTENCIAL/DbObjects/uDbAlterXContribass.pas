{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbAlterXContribass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAlterXContribass = class(TCmDbObject)

  private
     FIdPlanass: TCmDbField;
     FIdContribuicao: TCmDbField;
     FCodAlterador: TCmDbField;
     FIdRegraCalculo: TCmDbField;
     FFlgCobra: TCmDbField;
     FFlgAtraso: TCmDbField;
     FFlgDevol: TCmDbField;

     procedure SetIdPlanass(const Value: TCmDbField);
     procedure SetIdContribuicao(const Value: TCmDbField);
     procedure SetCodAlterador(const Value: TCmDbField);
     procedure SetIdRegraCalculo(const Value: TCmDbField);
     procedure SetFlgCobra(const Value: TCmDbField);
     procedure SetFlgAtraso(const Value: TCmDbField);
     procedure SetFlgDevol(const Value: TCmDbField);

  public
     Property IdPlanass: TCmDbField read FIdPlanass write SetIdPlanass;
     Property IdContribuicao: TCmDbField read FIdContribuicao write SetIdContribuicao;
     Property CodAlterador: TCmDbField read FCodAlterador write SetCodAlterador;
     Property IdRegraCalculo: TCmDbField read FIdRegraCalculo write SetIdRegraCalculo;
     Property FlgCobra: TCmDbField read FFlgCobra write SetFlgCobra;
     Property FlgAtraso: TCmDbField read FFlgAtraso write SetFlgAtraso;
     Property FlgDevol: TCmDbField read FFlgDevol write SetFlgDevol;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAlterXContribass }

constructor TDbAlterXContribass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AlterXContribass';

  FIdPlanass:= CreateCmDbField('IDPLANASS',ftFloat,True,False);
  FIdContribuicao:= CreateCmDbField('IDCONTRIBUICAO',ftFloat,True,False);
  FCodAlterador:= CreateCmDbField('CODALTERADOR',ftFloat,True,False);
  FIdRegraCalculo:= CreateCmDbField('IDREGRACALCULO',ftFloat,False,False);
  FFlgCobra:= CreateCmDbField('FLGCOBRA',ftFloat,False,False);
  FFlgAtraso:= CreateCmDbField('FLGATRASO',ftFloat,False,False);
  FFlgDevol:= CreateCmDbField('FLGDEVOL',ftFloat,False,False);
end;

function TDbAlterXContribass.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbAlterXContribass.LoadFromDB: Boolean;
begin
  Result := True;
end;

procedure TDbAlterXContribass.SetIdPlanass(const Value: TCmDbField);
begin
  FIdPlanass:=Value;
end;

procedure TDbAlterXContribass.SetIdContribuicao(const Value: TCmDbField);
begin
  FIdContribuicao:=Value;
end;

procedure TDbAlterXContribass.SetCodAlterador(const Value: TCmDbField);
begin
  FCodAlterador:=Value;
end;

procedure TDbAlterXContribass.SetIdRegraCalculo(const Value: TCmDbField);
begin
  FIdRegraCalculo:=Value;
end;

procedure TDbAlterXContribass.SetFlgCobra(const Value: TCmDbField);
begin
  FFlgCobra:=Value;
end;

procedure TDbAlterXContribass.SetFlgAtraso(const Value: TCmDbField);
begin
  FFlgAtraso:=Value;
end;

procedure TDbAlterXContribass.SetFlgDevol(const Value: TCmDbField);
begin
  FFlgDevol:=Value;
end;

end.
