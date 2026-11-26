{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/05/2007                             }
{                                                       }
{*******************************************************}

unit uDbMotivo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbMotivo = class(TCmDbObject)

  private
    FIdmovcontrcaged: TCmDbField;
    FFlgtipo: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FMotivorais: TCmDbField;
    FDescricao: TCmDbField;
    FMotivofgts: TCmDbField;
    FObservacao: TCmDbField;
    FGrupomotivo: TCmDbField;
    FIdmotivo: TCmDbField;
    FFlgabateavos: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgabateavos(const Value: TCmDbField);
    procedure SetFlgtipo(const Value: TCmDbField);
    procedure SetGrupomotivo(const Value: TCmDbField);
    procedure SetIdmotivo(const Value: TCmDbField);
    procedure SetIdmovcontrcaged(const Value: TCmDbField);
    procedure SetMotivofgts(const Value: TCmDbField);
    procedure SetMotivorais(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Motivorais: TCmDbField read FMotivorais write SetMotivorais;
     Property Motivofgts: TCmDbField read FMotivofgts write SetMotivofgts;
     Property Idmovcontrcaged: TCmDbField read FIdmovcontrcaged write SetIdmovcontrcaged;
     Property Idmotivo: TCmDbField read FIdmotivo write SetIdmotivo;
     Property Grupomotivo: TCmDbField read FGrupomotivo write SetGrupomotivo;
     Property Flgtipo: TCmDbField read FFlgtipo write SetFlgtipo;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMotivo }

constructor TDbMotivo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MOTIVO';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fMotivorais := CreateCmDbField('MOTIVORAIS',ftString,False,False,False,True,'');
   fMotivofgts := CreateCmDbField('MOTIVOFGTS',ftString,False,False,False,True,'');
   fIdmovcontrcaged := CreateCmDbField('IDMOVCONTRCAGED',ftfloat,False,False,False,True,'');
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,True,True,False,True,'');
   fGrupomotivo := CreateCmDbField('GRUPOMOTIVO',ftString,False,False,False,True,'');
   fFlgtipo := CreateCmDbField('FLGTIPO',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbMotivo.Insert: Boolean;
begin

   fIdmotivo.AsFloat := GetSequence('MOTIVO');
   Result := Inherited Insert;

end;


procedure TDbMotivo.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbMotivo.SetFlgabateavos(const Value: TCmDbField);
begin
  FFlgabateavos := Value;
end;

procedure TDbMotivo.SetFlgtipo(const Value: TCmDbField);
begin
  FFlgtipo := Value;
end;

procedure TDbMotivo.SetGrupomotivo(const Value: TCmDbField);
begin
  FGrupomotivo := Value;
end;

procedure TDbMotivo.SetIdmotivo(const Value: TCmDbField);
begin
  FIdmotivo := Value;
end;

procedure TDbMotivo.SetIdmovcontrcaged(const Value: TCmDbField);
begin
  FIdmovcontrcaged := Value;
end;

procedure TDbMotivo.SetMotivofgts(const Value: TCmDbField);
begin
  FMotivofgts := Value;
end;

procedure TDbMotivo.SetMotivorais(const Value: TCmDbField);
begin
  FMotivorais := Value;
end;

procedure TDbMotivo.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbMotivo.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbMotivo.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



