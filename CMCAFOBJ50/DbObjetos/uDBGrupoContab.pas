{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 24/05/2004                             }
{                                                       }
{*******************************************************}

unit uDBGrupoContab;

interface
Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBGrupoContab = class(TCmDbObject)

  private
    FUltidbem: TCmDbField;
    FStatus: TCmDbField;
    FValaluguel: TCmDbField;
    FMoecodigo: TCmDbField;
    FNome: TCmDbField;
    FDataultdep: TCmDbField;
    FClasse: TCmDbField;
    FIdgrupo: TCmDbField;
    FFlgimovel: TCmDbField;
    FDatarecalcdep: TCmDbField;
    FTipo: TCmDbField;
    FDepreciacao: TCmDbField;
    FFlgsemplaca: TCmDbField;
    FInativo: TCmDbField;
    FTipoFechamento: TCmDbField;
    procedure SetClasse(const Value: TCmDbField);
    procedure SetDatarecalcdep(const Value: TCmDbField);
    procedure SetDataultdep(const Value: TCmDbField);
    procedure SetDepreciacao(const Value: TCmDbField);
    procedure SetFlgimovel(const Value: TCmDbField);
    procedure SetFlgsemplaca(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);
    procedure SetUltidbem(const Value: TCmDbField);
    procedure SetValaluguel(const Value: TCmDbField);
    procedure SetInativo(const Value: TCmDbField);
    procedure SetTipoFechamento(const Value: TCmDbField);

  public

     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Classe: TCmDbField read FClasse write SetClasse;
     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Flgimovel: TCmDbField read FFlgimovel write SetFlgimovel;
     Property Status: TCmDbField read FStatus write SetStatus;
     Property Flgsemplaca: TCmDbField read FFlgsemplaca write SetFlgsemplaca;
     Property Valaluguel: TCmDbField read FValaluguel write SetValaluguel;
     Property Ultidbem: TCmDbField read FUltidbem write SetUltidbem;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Depreciacao: TCmDbField read FDepreciacao write SetDepreciacao;
     Property Dataultdep: TCmDbField read FDataultdep write SetDataultdep;
     Property Datarecalcdep: TCmDbField read FDatarecalcdep write SetDatarecalcdep;
     Property Inativo: TCmDbField read FInativo write SetInativo;
     Property TipoFechamento: TCmDbField read FTipoFechamento write SetTipoFechamento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBGrupoContab }

constructor TDBGrupoContab.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'GRUPO';

   fValaluguel := CreateCmDbField('VALALUGUEL',ftfloat,False,False,False,True,'');
   fUltidbem := CreateCmDbField('ULTIDBEM',ftfloat,False,False,False,True,'');
   fTipo := CreateCmDbField('TIPO',ftString,True,False,False,True,'');
   fStatus := CreateCmDbField('STATUS',ftString,True,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,True,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,True,'');
   fFlgsemplaca := CreateCmDbField('FLGSEMPLACA',ftfloat,False,False,False,False,'');
   fFlgimovel := CreateCmDbField('FLGIMOVEL',ftfloat,False,False,False,False,'');
   fDepreciacao := CreateCmDbField('DEPRECIACAO',ftfloat,False,False,False,True,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDatarecalcdep := CreateCmDbField('DATARECALCDEP',ftDateTime,False,False,False,True,'');
   fClasse := CreateCmDbField('CLASSE',ftString,True,False,False,True,'');
   fInativo := CreateCmDbField('INATIVO',ftInteger,False,False,False,False,'');
   fTipoFechamento := CreateCmDbField('FLGTIPOFECHAMENTO',ftInteger,False,False,False,False,'');
end;

function TDBGrupoContab.Insert: Boolean;
begin
   fIdgrupo.AsFloat := GetSequence('GRUPO');
   Result := Inherited Insert;
end;

function TDBGrupoContab.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBGrupoContab.SetClasse(const Value: TCmDbField);
begin
   FClasse := Value;
end;

procedure TDBGrupoContab.SetDatarecalcdep(const Value: TCmDbField);
begin
   FDatarecalcdep := Value;
end;

procedure TDBGrupoContab.SetDataultdep(const Value: TCmDbField);
begin
   FDataultdep := Value;
end;

procedure TDBGrupoContab.SetDepreciacao(const Value: TCmDbField);
begin
   FDepreciacao := Value;
end;

procedure TDBGrupoContab.SetFlgimovel(const Value: TCmDbField);
begin
   FFlgimovel := Value;
end;

procedure TDBGrupoContab.SetFlgsemplaca(const Value: TCmDbField);
begin
   FFlgsemplaca := Value;
end;

procedure TDBGrupoContab.SetIdgrupo(const Value: TCmDbField);
begin
   FIdgrupo := Value;
end;

procedure TDBGrupoContab.SetInativo(const Value: TCmDbField);
begin
  FInativo := Value;
end;

procedure TDBGrupoContab.SetMoecodigo(const Value: TCmDbField);
begin
   FMoecodigo := Value;
end;

procedure TDBGrupoContab.SetNome(const Value: TCmDbField);
begin
   FNome := Value;
end;

procedure TDBGrupoContab.SetStatus(const Value: TCmDbField);
begin
   FStatus := Value;
end;

procedure TDBGrupoContab.SetTipo(const Value: TCmDbField);
begin
   FTipo := Value;
end;

procedure TDBGrupoContab.SetTipoFechamento(const Value: TCmDbField);
begin
  FTipoFechamento := Value;
end;

procedure TDBGrupoContab.SetUltidbem(const Value: TCmDbField);
begin
   FUltidbem := Value;
end;

procedure TDBGrupoContab.SetValaluguel(const Value: TCmDbField);
begin
   FValaluguel := Value;
end;

end.

