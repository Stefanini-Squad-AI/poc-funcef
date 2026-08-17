{
-------------------------------------------------------------------------------------------------
Rotina......: FazerSelectsGeraisReport
Nº SOL......: 244125.18329
Data........: 06/10/2016
Responsável.: Marcelo Cardoso
Descrição...: Melhoria no Cad. de Relatórios, para que seja validado na primeira consulta, se existe
              dados para o parametro informado. Deve ser apresentado uma menssagem
------------------------------------------------------------------------------
Nº SOL......: 243475
Nº KINTANA..: 799921
Data........: 26/05/2013
Responsável.: Marcelo Cardoso Santos Filho
Descrição...: Na opção inserir relatório, quando o campo "Exporta Relatório" é
              selecionado a opção não gera a funcionalidade esperada
------------------------------------------------------------------------------

Rotina......: AjustaQueryRelatorios
Nº SOL......: 211165
Nº KINTANA..: 2031517
Data........: 09/07/2013
Responsável.: William Moreira da Silva
Descrição...: Inseria linha em branco a mais nas descrições
------------------------------------------------------------------------------
  Desenvolvedor: Arnaldo Vicente Scarin
  Data.........: 29/04/2010
  SOL / Kintana: 132513 / 765092
  Alteração....: Implementação de SubRelatorio nos Relatórios definidos pelo sistema
------------------------------------------------------------------------------------}
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
    // Inicio - Arnaldo V. Scarin - Sol 132513
    FFlgSubReport: TCmDbField;
    FIdSubDataView1: TCmDbField;
    FIdSubDataView2: TCmDbField;
    FIdSubDataView3: TCmDbField;
    FIdSubDataView4: TCmDbField;
    FIdSubDataView5: TCmDbField;
    FIdSubDataView6: TCmDbField;
    FOrigemcmdv1: TCmDbField;
    FOrigemcmdv2: TCmDbField;
    FOrigemcmdv4: TCmDbField;
    FOrigemcmdv3: TCmDbField;
    // Final - Arnaldo V. Scarin - Sol 132513
    FOrigemcmdv5: TCmDbField;
    FOrigemcmdv6: TCmDbField;

    FFlgRelatAtivo: TCmDbField;  //Vinicius Maciel - SOL 168857 - KINTANA 1506883
    FFlgExportadados: TCmDbField; //Marcelo Cardoso - SOL SOL243475 - PPM799921

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
    // Inicio - Arnaldo V. Scarin - Sol 132513
    procedure SetFlgSubReport(const Value: TCmDbField);
    procedure SetIdSubDataView1(const Value: TCmDbField);
    procedure SetIdSubDataView2(const Value: TCmDbField);
    procedure SetIdSubDataView3(const Value: TCmDbField);
    procedure SetIdSubDataView4(const Value: TCmDbField);
    procedure SetIdSubDataView5(const Value: TCmDbField);//SOL244125.18329- Marcelo Cardoso
    procedure SetIdSubDataView6(const Value: TCmDbField);//SOL244125.18329- Marcelo Cardoso
    procedure SetOrigemcmdv1(const Value: TCmDbField);
    procedure SetOrigemcmdv2(const Value: TCmDbField);
    procedure SetOrigemcmdv3(const Value: TCmDbField);
    procedure SetOrigemcmdv4(const Value: TCmDbField);
    procedure SetOrigemcmdv5(const Value: TCmDbField);//SOL244125.18329- Marcelo Cardoso
    procedure SetOrigemcmdv6(const Value: TCmDbField);//SOL244125.18329- Marcelo Cardoso
    // Final - Arnaldo V. Scarin - Sol 132513
    procedure SetFlgRelatAtivo(const Value: TCmDbField);  //Vinicius Maciel - SOL 168857 - KINTANA 1506883
    procedure SetFlgExportadados(const Value: TCmDbField); //Marcelo Cardoso - SOL SOL243475 - PPM799921

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
    // Inicio - Arnaldo V. Scarin - Sol 132513
    Property FlgSubReport  : TCmDbField read FFlgSubReport write SetFlgSubReport;
    Property IdSubDataView1: TCmDbField read FIdSubDataView1 write SetIdSubDataView1;
    Property Origemcmdv1   : TCmDbField read FOrigemcmdv1 write SetOrigemcmdv1;
    Property IdSubDataView2: TCmDbField read FIdSubDataView2 write SetIdSubDataView2;
    Property Origemcmdv2   : TCmDbField read FOrigemcmdv2 write SetOrigemcmdv2;
    Property IdSubDataView3: TCmDbField read FIdSubDataView3 write SetIdSubDataView3;
    Property Origemcmdv3   : TCmDbField read FOrigemcmdv3 write SetOrigemcmdv3;
    Property IdSubDataView4: TCmDbField read FIdSubDataView4 write SetIdSubDataView4;
    Property Origemcmdv4   : TCmDbField read FOrigemcmdv4 write SetOrigemcmdv4;
    Property IdSubDataView5: TCmDbField read FIdSubDataView5 write SetIdSubDataView5;//SOL244125.18329- Marcelo Cardoso
    Property Origemcmdv6   : TCmDbField read FOrigemcmdv6 write SetOrigemcmdv6;//SOL244125.18329- Marcelo Cardoso
    // Final - Arnaldo V. Scarin - Sol 132513
    Property FlgRelatAtivo   : TCmDbField read FFlgRelatAtivo   write SetFlgRelatAtivo; //Vinicius Maciel - SOL 168857 - KINTANA 1506883
    Property FlgExportadados : TCmDbField read FFlgExportadados write SetFlgExportadados; //Marcelo Cardoso - SOL SOL243475 - PPM799921

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
  //fDescription       := CreateCmDbField('DESCRIPTION',ftString,False,False,False,True,'Descrição');
  fDescription       := CreateCmDbField('DESCRIPTION',ftString,False,False,False,True,'Descrição');//William Moreira da Silva - SOL 211165 KINTANA 2031517
  fTemplate          := CreateCmDbField('TEMPLATE',ftBlob,False,False,False,True,'Template');
  fPpreport          := CreateCmDbField('PPREPORT',ftString,False,False,False,True,'ppReport');
  fFormparamrel      := CreateCmDbField('FORMPARAMREL',ftString,False,False,False,True,'Form de Parâmetros');
  fFormeventos       := CreateCmDbField('FORMEVENTOS',ftString,False,False,False,True,'Form de Eventos');
  fFlgtipo           := CreateCmDbField('FLGTIPO',ftString,False,False,False,True,'Tipo');
  fFlgfiltromanual   := CreateCmDbField('FLGFILTROMANUAL',ftString,False,False,False,True,'Filtro Manual');
  fFlgexibenopreview := CreateCmDbField('FLGEXIBENOPREVIEW',ftString,False,False,False,True,'Exibe no Preview');
  fFlgauditoriafront := CreateCmDbField('FLGAUDITORIAFRONT',ftString,False,False,False,True,'Auditoria Front');
  // Inicio - Arnaldo V. Scarin - Sol 132513
  fFlgSubReport      := CreateCmDbField('FLGSUBREPORT',ftString,False,False,False,True,'Sub-Relatório');
  fIdSubDataView1    := CreateCmDbField('IDSUBDATAVIEW1',ftfloat,False,False,False,True,'SubDataview1');
  fOrigemcmdv1       := CreateCmDbField('ORIGEMCMDV1',ftfloat,False,False,False,False,'Origem CM SubDataview1');
  fIdSubDataView2    := CreateCmDbField('IDSUBDATAVIEW2',ftfloat,False,False,False,True,'SubDataview2');
  fOrigemcmdv2       := CreateCmDbField('ORIGEMCMDV2',ftfloat,False,False,False,False,'Origem CM SubDataview2');
  fIdSubDataView3    := CreateCmDbField('IDSUBDATAVIEW3',ftfloat,False,False,False,True,'SubDataview3');
  fOrigemcmdv3       := CreateCmDbField('ORIGEMCMDV3',ftfloat,False,False,False,False,'Origem CM SubDataview3');
  fIdSubDataView4    := CreateCmDbField('IDSUBDATAVIEW4',ftfloat,False,False,False,True,'SubDataview4');
  fOrigemcmdv4       := CreateCmDbField('ORIGEMCMDV4',ftfloat,False,False,False,False,'Origem CM SubDataview4');
  // Final - Arnaldo V. Scarin - Sol 132513

  // Marcelo Cardoso - Inicio - SOL244125.18329
  fIdSubDataView5    := CreateCmDbField('IDSUBDATAVIEW5',ftfloat,False,False,False,True,'SubDataview5');
  fOrigemcmdv5       := CreateCmDbField('ORIGEMCMDV5',ftfloat,False,False,False,False,'Origem CM SubDataview5');
  fIdSubDataView6    := CreateCmDbField('IDSUBDATAVIEW6',ftfloat,False,False,False,True,'SubDataview6');
  fOrigemcmdv6       := CreateCmDbField('ORIGEMCMDV6',ftfloat,False,False,False,False,'Origem CM SubDataview6');
  // Marcelo Cardoso - fim  - SOL244125.18329

  FFlgRelatAtivo     := CreateCmDbField('FLGRELATATIVO',ftString,False,False,False,False,'Relatório Ativo');  //Vinicius Maciel - SOL 168857 - KINTANA 1506883
  FFlgExportadados    := CreateCmDbField('FLGEXPORTADADOS',ftString,False,False,False,False,'Exportar Relatório'); //Marcelo Cardoso - SOL SOL243475 - PPM799921
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

// Inicio - Arnaldo V. Scarin - Sol 132513

procedure TDbReportsRelCm.SetFlgSubReport(const Value: TCmDbField);
begin
  FFlgSubReport := Value;
end;
// Final - Arnaldo V. Scarin - Sol 132513

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

// Inicio - Arnaldo V. Scarin - Sol 132513
procedure TDbReportsRelCm.SetIdSubDataView1(const Value: TCmDbField);
begin
  FIdSubDataView1 := Value;
end;

procedure TDbReportsRelCm.SetIdSubDataView2(const Value: TCmDbField);
begin
  FIdSubDataView2 := Value;
end;

procedure TDbReportsRelCm.SetIdSubDataView3(const Value: TCmDbField);
begin
  FIdSubDataView3 := Value;
end;

procedure TDbReportsRelCm.SetIdSubDataView4(const Value: TCmDbField);
begin
  FIdSubDataView4 := Value;
end;
// Final - Arnaldo V. Scarin - Sol 132513

//Marcelo Cardoso - Inicio - SOL244125.18329
procedure TDbReportsRelCm.SetIdSubDataView5(const Value: TCmDbField);
begin
  FIdSubDataView5 := Value;
end;

procedure TDbReportsRelCm.SetIdSubDataView6(const Value: TCmDbField);
begin
  FIdSubDataView6 := Value;
end;
//Marcelo Cardoso - Fim  - SOL244125.18329

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

// Inicio - Arnaldo V. Scarin - Sol 132513
procedure TDbReportsRelCm.SetOrigemcmdv1(const Value: TCmDbField);
begin
  FOrigemcmdv1 := Value;
end;

procedure TDbReportsRelCm.SetOrigemcmdv2(const Value: TCmDbField);
begin
  FOrigemcmdv2 := Value;
end;

procedure TDbReportsRelCm.SetOrigemcmdv3(const Value: TCmDbField);
begin
  FOrigemcmdv3 := Value;
end;

procedure TDbReportsRelCm.SetOrigemcmdv4(const Value: TCmDbField);
begin
  FOrigemcmdv4 := Value;
end;
// Final - Arnaldo V. Scarin - Sol 132513

// Marcelo Cardoso - Inicio - SOL244125.18329
procedure TDbReportsRelCm.SetOrigemcmdv5(const Value: TCmDbField);
begin
  FOrigemcmdv5 := Value;
end;

procedure TDbReportsRelCm.SetOrigemcmdv6(const Value: TCmDbField);
begin
  FOrigemcmdv6 := Value;
end;
// Marcelo Cardoso - Inicio - SOL244125.18329

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

procedure TDbReportsRelCm.SetFlgRelatAtivo(const Value: TCmDbField);
begin
  FFlgRelatAtivo := Value;
end;

 //Início - Marcelo Cardoso - SOL SOL243475 - PPM799921
procedure TDbReportsRelCm.SetFlgExportadados (const Value: TCmDbField);
begin
  FFlgExportadados  := Value;
end;
//Final - Marcelo Cardoso - SOL SOL243475 - PPM799921
end.

