{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbSubTipoIndicador;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbSubTipoIndicador = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FIdtipo: TCmDbField;
    FIdsubtipo: TCmDbField;
    FIdReports: TCmDbField;
    FOrigemCM: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdsubtipo(const Value: TCmDbField);
    procedure SetIdtipo(const Value: TCmDbField);
    procedure SetIdReports(const Value: TCmDbField);
    procedure SetOrigemCM(const Value: TCmDbField);

  public

     Property Idtipo: TCmDbField read FIdtipo write SetIdtipo;
     Property Idsubtipo: TCmDbField read FIdsubtipo write SetIdsubtipo;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property IdReports: TCmDbField read FIdReports write SetIdReports;
     Property OrigemCM:  TCmDbField read FOrigemCM  write SetOrigemCM;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSubTipoIndicador }

constructor TDbSubTipoIndicador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDSUBTIPOINDICADOR';

   fIdtipo := CreateCmDbField('IDTIPO',ftfloat,True,False,False,True,'ID do Tipo de Indicador');
   fIdsubtipo := CreateCmDbField('IDSUBTIPO',ftfloat,True,True,False,True,'ID do Subtipo de Indicador');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
   fIdReports := CreateCmDbField('IDREPORTS',ftString,False,False,False,True,'ID do Relatorio no SAD');
   fOrigemCM  := CreateCmDbField('ORIGEMCM',ftInteger,False,False,False,True,'Origem do Relatorio no SAD');
end;

function TDbSubTipoIndicador.Insert: Boolean;
begin

   fIdsubtipo.AsFloat := GetSequence('INDSUBTIPOINDICADOR');
   Result := Inherited Insert;

end;

function TDbSubTipoIndicador.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbSubTipoIndicador.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbSubTipoIndicador.SetIdReports(const Value: TCmDbField);
begin
  FIdReports := Value;
end;

procedure TDbSubTipoIndicador.SetIdsubtipo(const Value: TCmDbField);
begin
  FIdsubtipo := Value;
end;

procedure TDbSubTipoIndicador.SetIdtipo(const Value: TCmDbField);
begin
  FIdtipo := Value;
end;

procedure TDbSubTipoIndicador.SetOrigemCM(const Value: TCmDbField);
begin
  FOrigemCM := Value;
end;

end.



