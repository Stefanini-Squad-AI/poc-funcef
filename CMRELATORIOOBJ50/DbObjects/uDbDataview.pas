{
Nº SOL......: 211165
Nº KINTANA..: 2031517
Data........: 09/07/2013
Responsável.: William Moreira da Silva
Descrição...: Inseria linha em branco a mais nas descrições
------------------------------------------------------------------------------------}
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 15/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbDataview;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDataview = class(TCmDbObject)
  private
    FDescription: TCmDbField;
    FClasseNome: TCmDbField;
    FTemplate: TCmDbField;
    FIddataview: TCmDbField;
    FName: TCmDbField;
    FOrigemcmdv: TCmDbField;
    FClasseDescricao: TCmDbField;
    procedure SetClasseDescricao(const Value: TCmDbField);
    procedure SetClasseNome(const Value: TCmDbField);
    procedure SetDescription(const Value: TCmDbField);
    procedure SetIddataview(const Value: TCmDbField);
    procedure SetName(const Value: TCmDbField);
    procedure SetOrigemcmdv(const Value: TCmDbField);
    procedure SetTemplate(const Value: TCmDbField);

  public
    Property Template: TCmDbField read FTemplate write SetTemplate;
    Property Origemcmdv: TCmDbField read FOrigemcmdv write SetOrigemcmdv;
    Property Name: TCmDbField read FName write SetName;
    Property Iddataview: TCmDbField read FIddataview write SetIddataview;
    Property Description: TCmDbField read FDescription write SetDescription;
    Property ClasseNome: TCmDbField read FClasseNome write SetClasseNome;
    Property ClasseDescricao: TCmDbField read FClasseDescricao write SetClasseDescricao;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbDataview }

constructor TDbDataview.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DATAVIEW';

  fIddataview      := CreateCmDbField('IDDATAVIEW',ftfloat,True,True,False,True,'Código');
  fOrigemcmdv      := CreateCmDbField('ORIGEMCMDV',ftfloat,True,True,False,False,'Origem CM');
  fName            := CreateCmDbField('NAME',ftString,True,False,False,True,'Nome');
  fDescription     := CreateCmDbField('DESCRIPTION',ftString,False,False,False,True,'Descrição');
  //fDescription     := CreateCmDbField('DESCRIPTION',ftBlob,False,False,False,True,'Descrição');//William Moreira da Silva - SOL 211165 KINTANA 2031517
  fTemplate        := CreateCmDbField('TEMPLATE',ftBlob,False,False,False,True,'Template');
  fClasseNome      := CreateCmDbField('CLASSNAME',ftString,False,False,False,True,'Nome da Classe');
  fClasseDescricao := CreateCmDbField('CLASSDESCRIPTION',ftString,False,False,False,True,'Descrição da Classe');
end;

function TDbDataview.Insert: Boolean;
begin
  fIddataview.AsFloat := GetSequence('DATAVIEW');
  Result := Inherited Insert;
end;

function TDbDataview.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbDataview.SetClasseDescricao(const Value: TCmDbField);
begin
  FClasseDescricao := Value;
end;

procedure TDbDataview.SetClasseNome(const Value: TCmDbField);
begin
  FClasseNome := Value;
end;

procedure TDbDataview.SetDescription(const Value: TCmDbField);
begin
  FDescription := Value;
end;

procedure TDbDataview.SetIddataview(const Value: TCmDbField);
begin
  FIddataview := Value;
end;

procedure TDbDataview.SetName(const Value: TCmDbField);
begin
  FName := Value;
end;

procedure TDbDataview.SetOrigemcmdv(const Value: TCmDbField);
begin
  FOrigemcmdv := Value;
end;

procedure TDbDataview.SetTemplate(const Value: TCmDbField);
begin
  FTemplate := Value;
end;

end.

