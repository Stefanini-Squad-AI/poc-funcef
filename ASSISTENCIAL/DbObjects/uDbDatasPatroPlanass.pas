{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbDatasPatroPlanass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbDatasPatroPlanass = class(TCmDbObject)

  private
     FSitFundacao: TCmDbField;
     FIdPessJur: TCmDbField;
     FIdPlanoPrev: TCmDbField;
     FIdPlanass: TCmDbField;
     FDiaCobNormal: TCmDbField;
     FFlgUtilNormal: TCmDbField;
     FFlgAnteriorNormal: TCmDbField;
     FDiaCobAtraso: TCmDbField;
     FFlgUtilAtraso: TCmDbField;
     FFlgAnteriorAtraso: TCmDbField;
     FDiaCobDevolucao: TCmDbField;
     FFlgUtilDevolucao: TCmDbField;
     FFlgAnteriorDevol: TCmDbField;
     FFlgMesCobNormal: TCmDbField;
     FFlgMesCobAtraso: TCmDbField;
     FFlgMesCobDevoluc: TCmDbField;

     Procedure SetSitFundacao(const Value: TCmDbField);
     Procedure SetIdPessJur(const Value: TCmDbField);
     Procedure SetIdPlanoPrev(const Value: TCmDbField);
     Procedure SetIdPlanass(const Value: TCmDbField);
     Procedure SetDiaCobNormal(const Value: TCmDbField);
     Procedure SetFlgUtilNormal(const Value: TCmDbField);
     Procedure SetFlgAnteriorNormal(const Value: TCmDbField);
     Procedure SetDiaCobAtraso(const Value: TCmDbField);
     Procedure SetFlgUtilAtraso(const Value: TCmDbField);
     Procedure SetFlgAnteriorAtraso(const Value: TCmDbField);
     Procedure SetDiaCobDevolucao(const Value: TCmDbField);
     Procedure SetlgUtilDevolucao(const Value: TCmDbField);
     Procedure SetFlgAnteriorDevol(const Value: TCmDbField);
     Procedure SetFlgMesCobNormal(const Value: TCmDbField);
     Procedure SetFlgMesCobAtraso(const Value: TCmDbField);
     Procedure SetFlgMesCobDevoluc(const Value: TCmDbField);

  public
     Property SitFundacao: TCmDbField read FSitFundacao write SetSitFundacao;
     Property IdPessJur: TCmDbField read FIdPessJur write SetIdPessJur;
     Property IdPlanoPrev: TCmDbField read FIdPlanoPrev write SetIdPlanoPrev;
     Property IdPlanass: TCmDbField read FIdPlanass write SetIdPlanass;
     Property DiaCobNormal: TCmDbField read FDiaCobNormal write SetDiaCobNormal;
     Property FlgUtilNormal: TCmDbield read FFlgUtilNormal write SetFlgUtilNormal;
     Property FlgAnteriorNormal: TCmDbField read FFlgAnteriorNormal write SetFlgAnteriorNormal;
     Property DiaCobAtraso: TCmDbField read FDiaCobAtraso write SetDiaCobAtraso;
     Property FlgUtilAtraso: TCmDbField read FFlgUtilAtraso write SetFlgUtilAtraso;
     Property FlgAnteriorAtraso: TCmDbField read FFlgAnteriorAtraso write SetFlgAnteriorAtraso;
     Property DiaCobDevolucao: TCmDbField read FDiaCobDevolucao write SetDiaCobDevolucao;
     Property FlgUtilDevolucao: TCmDbField read FFlgUtilDevolucao write SetFlgUtilDevolucao;
     Property FlgAnteriorDevol: TCmDbField read FFlgAnteriorDevol write SetFlgAnteriorDevol;
     Property FlgMesCobNormal: TCmDbField read FFlgMesCobNormal write SetFlgMesCobNormal;
     Property FlgMesCobAtraso: TCmDbField read FFlgMesCobAtraso write SetFlgMesCobAtraso;
     Property FlgMesCobDevoluc: TCmDbField read FFlgMesCobDevoluc write SetFlgMesCobDevoluc;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbDatasPatroPlanass }

constructor TDbDatasPatroPlanass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DatasPatroPlanass';
  FSitFundacao:= CreateCmDbField('SITFUNDACAO',ftfloat,True,False);
  FIdPessJur:= CreateCmDbField('IDPESSJUR',ftfloat,True,False);
  FIdPlanoPrev:= CreateCmDbField('IDPLANOPREV',ftfloat,True,False);
  FIdPlanass:= CreateCmDbField('IDPLANASS',ftfloat,True,False);
  FDiaCobNormal:= CreateCmDbField('DIACOBNORMAL',ftfloat,False,False);
  FFlgUtilNormal:= CreateCmDbField('FLGUTILNORMAL',ftfloat,False,False);
  FFlgAnteriorNormal:= CreateCmDbField('FLGANTERIORNORMAL',ftString,False,False);
  FDiaCobAtraso:= CreateCmDbField('DIACOBATRASO',ftString,False,False);
  FFlgUtilAtraso:= CreateCmDbField('FLGUTILATRASO',ftString,False,False);
  FFlgAnteriorAtraso:= CreateCmDbField('FLGANTERIORATRASO',ftString,False,False);
  FDiaCobDevolucao:= CreateCmDbField('DIACOBDEVOLUCAO',ftfloat,False,False);
  FFlgUtilDevolucao:= CreateCmDbField('FLGUTILDEVOLUCAO',ftString,False,False);
  FFlgAnteriorDevol:= CreateCmDbField('FLGANTERIORDEVOL',ftString,False,False);
  FFlgMesCobNormal:= CreateCmDbField('FLGMESCOBNORMAL',ftString,False,False);
  FFlgMesCobAtraso:= CreateCmDbField('FLGMESCOBATRASO',ftString,False,False);
  FFlgMesCobDevoluc:= CreateCmDbField('FLGMESCOBDEVOLUC',ftString,False,False);
end;

function TDbDatasPatroPlanass.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbDatasPatroPlanass.LoadFromDB: Boolean;
begin
  Result := True;
end;

procedure TDbDatasPatroPlanass.SetSitFundacao(const Value: TCmDbField);
begin
  FSitFundacao :=Value;
end;

procedure TDbDatasPatroPlanass.SetIdPessJur(const Value: TCmDbField);
begin
  FIdPessJur:=Value;
end;

procedure TDbDatasPatroPlanass.SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev:=Value;
end;

procedure TDbDatasPatroPlanass.SetIdPlanass(const Value: TCmDbField);
begin
  FIdPlanass:=Value;
end;

procedure TDbDatasPatroPlanass.SetDiaCobNormal(const Value: TCmDbField);
begin
  FDiaCobNormal:=Value;
end;

procedure TDbDatasPatroPlanass.SetFlgUtilNormal(const Value: TCmDbField);
begin
  FFlgUtilNormal:=Value;
end;

procedure TDbDatasPatroPlanass.SetFlgAnteriorNormal(const Value: TCmDbField);
begin
  FFlgAnteriorNormal:=Value;
end;

procedure TDbDatasPatroPlanass.SetDiaCobAtraso(const Value: TCmDbField);
begin
  FDiaCobAtraso:=Value;
end;

procedure TDbDatasPatroPlanass.SetFlgUtilAtraso(const Value: TCmDbField);
begin
  FFlgUtilAtraso:=Value;
end;

procedure TDbDatasPatroPlanass.SetFlgAnteriorAtraso(const Value: TCmDbField);
begin
  FFlgAnteriorAtraso:=Value;
end;

procedure TDbDatasPatroPlanass.SetDiaCobDevolucao(const Value: TCmDbField);
begin
  FDiaCobDevolucao:=Value;
end;

procedure TDbDatasPatroPlanass.SetFlgUtilDevolucao(const Value: TCmDbField);
begin
  FFlgUtilDevolucao:=Value;
end;

procedure TDbDatasPatroPlanass.SetFlgAnteriorDevol(const Value: TCmDbField);
begin
  FFlgAnteriorDevol:=Value;
end;

procedure TDbDatasPatroPlanass.SetFlgMesCobNormal(const Value: TCmDbField);
begin
  FFlgMesCobNormal:=Value;
end;

procedure TDbDatasPatroPlanass.SetFlgMesCobAtraso(const Value: TCmDbField);
begin
  FFlgMesCobAtraso:=Value;
end;

procedure TDbDatasPatroPlanass.SetFlgMesCobDevoluc(const Value: TCmDbField);
begin
  FFlgMesCobDevoluc:=Value;
end;

end.
