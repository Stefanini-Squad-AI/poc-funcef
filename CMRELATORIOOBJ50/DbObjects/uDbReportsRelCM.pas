{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 07/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbReportsRelCM;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbReportsRelCm = class(TCmDbObject)

  private
    FIdmodulo: TCmDbField;
    FOrigemcmgr: TCmDbField;
    FDescription: TCmDbField;
    FIdgruporelatorio: TCmDbField;
    FFlgfiltromanual: TCmDbField;
    FPpreport: TCmDbField;
    FOrigemcm: TCmDbField;
    FFlgauditoriafront: TCmDbField;
    FIdreports: TCmDbField;
    FFlgexibenopreview: TCmDbField;
    FFlgtipo: TCmDbField;
    FOrigemcmdv: TCmDbField;
    FFormeventos: TCmDbField;
    FIddataview: TCmDbField;
    FTemplate: TCmDbField;
    FName: TCmDbField;
    FFormparamrel: TCmDbField;
    procedure SetDescription(const Value: TCmDbField);
    procedure SetFlgauditoriafront(const Value: TCmDbField);
    procedure SetFlgexibenopreview(const Value: TCmDbField);
    procedure SetFlgfiltromanual(const Value: TCmDbField);
    procedure SetFlgtipo(const Value: TCmDbField);
    procedure SetFormeventos(const Value: TCmDbField);
    procedure SetFormparamrel(const Value: TCmDbField);
    procedure SetIddataview(const Value: TCmDbField);
    procedure SetIdgruporelatorio(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetName(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);
    procedure SetOrigemcmdv(const Value: TCmDbField);
    procedure SetOrigemcmgr(const Value: TCmDbField);
    procedure SetPpreport(const Value: TCmDbField);
    procedure SetTemplate(const Value: TCmDbField);

  public
    Property Template: TCmDbField read FTemplate write SetTemplate;
    Property Ppreport: TCmDbField read FPpreport write SetPpreport;
    Property Origemcmgr: TCmDbField read FOrigemcmgr write SetOrigemcmgr;
    Property Origemcmdv: TCmDbField read FOrigemcmdv write SetOrigemcmdv;
    Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
    Property Name: TCmDbField read FName write SetName;
    Property Idreports: TCmDbField read FIdreports write SetIdreports;
    Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
    Property Idgruporelatorio: TCmDbField read FIdgruporelatorio write SetIdgruporelatorio;
    Property Iddataview: TCmDbField read FIddataview write SetIddataview;
    Property Formparamrel: TCmDbField read FFormparamrel write SetFormparamrel;
    Property Formeventos: TCmDbField read FFormeventos write SetFormeventos;
    Property Flgtipo: TCmDbField read FFlgtipo write SetFlgtipo;
    Property Flgfiltromanual: TCmDbField read FFlgfiltromanual write SetFlgfiltromanual;
    Property Flgexibenopreview: TCmDbField read FFlgexibenopreview write SetFlgexibenopreview;
    Property Flgauditoriafront: TCmDbField read FFlgauditoriafront write SetFlgauditoriafront;
    Property Description: TCmDbField read FDescription write SetDescription;

    Constructor Create(aOwner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbReports }

constructor TDbReportsRelCM.Create(aOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REPORTS';

  fIdreports         := CreateCmDbField('IDREPORTS',ftfloat,True,True,False,True,'Código');
  fOrigemcm          := CreateCmDbField('ORIGEMCM',ftfloat,True,True,False,False,'Origem CM');
  fIdmodulo          := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'Modulo');
  fIdgruporelatorio  := CreateCmDbField('IDGRUPORELATORIO',ftfloat,False,False,False,True,'Grupo de Relatórios');
  fOrigemcmgr        := CreateCmDbField('ORIGEMCMGR',ftfloat,False,False,False,False,'Origem CM Grupo');
  fIddataview        := CreateCmDbField('IDDATAVIEW',ftfloat,False,False,False,True,'Dataview');
  fOrigemcmdv        := CreateCmDbField('ORIGEMCMDV',ftfloat,False,False,False,False,'Origem CM Dataview');
  fName              := CreateCmDbField('NAME',ftString,True,False,False,True,'Nome');
  fDescription       := CreateCmDbField('DESCRIPTION',ftString,False,False,False,True,'Descrição');
  fTemplate          := CreateCmDbField('TEMPLATE',ftBlob,False,False,False,True,'Template');
  fPpreport          := CreateCmDbField('PPREPORT',ftString,False,False,False,True,'ppReport');
  fFormparamrel      := CreateCmDbField('FORMPARAMREL',ftString,False,False,False,True,'Form de Parâmetros');
  fFormeventos       := CreateCmDbField('FORMEVENTOS',ftString,False,False,False,True,'Form de Eventos');
  fFlgtipo           := CreateCmDbField('FLGTIPO',ftString,False,False,False,True,'Tipo');
  fFlgfiltromanual   := CreateCmDbField('FLGFILTROMANUAL',ftString,False,False,False,True,'Filtro Manual');
  fFlgexibenopreview := CreateCmDbField('FLGEXIBENOPREVIEW',ftString,False,False,False,True,'Exibe no Preview');
  fFlgauditoriafront := CreateCmDbField('FLGAUDITORIAFRONT',ftString,False,False,False,True,'Auditoria Front');
end;

function TDbReportsRelCM.Insert: Boolean;
begin
  fIdreports.AsFloat := GetSequence('REPORTS');
  Result := Inherited Insert;
end;

function TDbReportsRelCM.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbReportsRelCM.SetDescription(const Value: TCmDbField);
begin
  FDescription := Value;
end;

procedure TDbReportsRelCM.SetFlgauditoriafront(const Value: TCmDbField);
begin
  FFlgauditoriafront := Value;
end;

procedure TDbReportsRelCM.SetFlgexibenopreview(const Value: TCmDbField);
begin
  FFlgexibenopreview := Value;
end;

procedure TDbReportsRelCM.SetFlgfiltromanual(const Value: TCmDbField);
begin
  FFlgfiltromanual := Value;
end;

procedure TDbReportsRelCM.SetFlgtipo(const Value: TCmDbField);
begin
  FFlgtipo := Value;
end;

procedure TDbReportsRelCM.SetFormeventos(const Value: TCmDbField);
begin
  FFormeventos := Value;
end;

procedure TDbReportsRelCM.SetFormparamrel(const Value: TCmDbField);
begin
  FFormparamrel := Value;
end;

procedure TDbReportsRelCM.SetIddataview(const Value: TCmDbField);
begin
  FIddataview := Value;
end;

procedure TDbReportsRelCM.SetIdgruporelatorio(const Value: TCmDbField);
begin
  FIdgruporelatorio := Value;
end;

procedure TDbReportsRelCM.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbReportsRelCM.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbReportsRelCM.SetName(const Value: TCmDbField);
begin
  FName := Value;
end;

procedure TDbReportsRelCM.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

procedure TDbReportsRelCM.SetOrigemcmdv(const Value: TCmDbField);
begin
  FOrigemcmdv := Value;
end;

procedure TDbReportsRelCM.SetOrigemcmgr(const Value: TCmDbField);
begin
  FOrigemcmgr := Value;
end;

procedure TDbReportsRelCM.SetPpreport(const Value: TCmDbField);
begin
  FPpreport := Value;
end;

procedure TDbReportsRelCM.SetTemplate(const Value: TCmDbField);
begin
  FTemplate := Value;
end;

end.

