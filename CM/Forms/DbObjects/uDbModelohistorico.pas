{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 30/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbModelohistorico;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbModelohistorico = class(TCmDbObject)

  private
    FTipo: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdpessoa: TCmDbField;
    FStatus: TCmDbField;
    FCompohistorico: TCmDbField;
    FDescricao: TCmDbField;
    FIdmodelohistorico: TCmDbField;
    procedure SetCompohistorico(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdmodelohistorico(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);

  public

     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Status: TCmDbField read FStatus write SetStatus;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idmodelohistorico: TCmDbField read FIdmodelohistorico write SetIdmodelohistorico;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Compohistorico: TCmDbField read FCompohistorico write SetCompohistorico;
     

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbModelohistorico }

constructor TDbModelohistorico.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MODELOHISTORICO';

  fTipo := CreateCmDbField('TIPO',ftfloat,True,False,False,false,'Tipo do Histórico');
  fStatus := CreateCmDbField('STATUS',ftString,True,False,False,True,'Status do Histórico');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'Identificador da Empresa Proprietária');
  fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True,'Identificador do Módulo do Histórico');
  fIdmodelohistorico := CreateCmDbField('IDMODELOHISTORICO',ftfloat,True,True,False,True,'');
  fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição do Histórico');
  fCompohistorico := CreateCmDbField('COMPOHISTORICO',ftString,True,False,False,True,'Composição do Histórico');
end;

function TDbModelohistorico.Insert: Boolean;
begin
  fIdmodelohistorico.AsFloat := GetSequence('MODELOHISTORICO');
  Result := Inherited Insert;
end;

procedure TDbModelohistorico.SetCompohistorico(const Value: TCmDbField);
begin
  FCompohistorico := Value;
end;

procedure TDbModelohistorico.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbModelohistorico.SetIdmodelohistorico(const Value: TCmDbField);
begin
  FIdmodelohistorico := Value;
end;

procedure TDbModelohistorico.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbModelohistorico.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbModelohistorico.SetStatus(const Value: TCmDbField);
begin
  FStatus := Value;
end;

procedure TDbModelohistorico.SetTipo(const Value: TCmDbField);
begin
  FTipo := Value;
end;

end.



