{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCmCtrlReports: Classe ancestral para os Objetos    }
{                          de controle de relatórios    }
{   herdados do FCmReport                               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 05/01/2001                             }
{                                                       }
{*******************************************************}

unit uCmCtrlReports;

interface                                    

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro,
     cmParamReport, uCMTypes;

Type

   TCmCtrlReports = Class(TCmControlObject)
   private
    FShowPrintDialog: Boolean;
    FShowCancelDialog: Boolean;
    FIdUsuario: Integer;
    FIdEmpresa: Double;
    FIdModulo: Integer;
    FNomeEmpresa: String;
    FParams: String;
    FNomeModulo: String;
    FFileName: String;
    FDevicetype: TReportDeviceType;
    FGeraHtmlFormParam: Boolean;
    FlstHtmlFOrmParam: TStrings;
    FIdReport: Integer;
    FIdHotel: Integer;
    FExibeMensagem: Boolean;
    FExibeFormParams: Boolean;
    fExceptionRaised: Boolean;
    procedure SetDevicetype(const Value: TReportDeviceType);
    procedure SetFileName(const Value: String);
    procedure SetIdEmpresa(const Value: Double);
    procedure SetIdModulo(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetNomeEmpresa(const Value: String);
    procedure SetNomeModulo(const Value: String);
    procedure SetParams(const Value: String);
    procedure SetShowCancelDialog(const Value: Boolean);
    procedure SetShowPrintDialog(const Value: Boolean);
    procedure SetGeraHtmlFormParam(const Value: Boolean);
    procedure SetlstHtmlFOrmParam(const Value: TStrings);
    procedure SetIdReport(const Value: Integer);
    procedure SetIdHotel(const Value: Integer);
    procedure SetExibeFormParams(const Value: Boolean);
    procedure SetExibeMensagem(const Value: Boolean);

   protected
    function PrintReport: Boolean; Virtual;

   public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): Boolean; Virtual;
    function ReportExists: Boolean; Virtual;

    procedure InitializeAs(CtrlReports: TCmCtrlReports);

    function ShowReport: Boolean;
    property IdReport: Integer read FIdReport write SetIdReport;
    property IdEmpresa: Double read FIdEmpresa write SetIdEmpresa;
    property IdUsuario: Integer read FIdUsuario write SetIdUsuario;
    property IdModulo: Integer read FIdModulo write SetIdModulo;
    property Params: String read FParams write SetParams;
    property FileName: String read FFileName write SetFileName;
    property NomeEmpresa: String read FNomeEmpresa write SetNomeEmpresa;
    property NomeModulo: String read FNomeModulo write SetNomeModulo;
    property Devicetype: TReportDeviceType read FDevicetype write SetDevicetype;
    property ShowCancelDialog: Boolean read FShowCancelDialog write SetShowCancelDialog;
    property ShowPrintDialog: Boolean read FShowPrintDialog write SetShowPrintDialog;
    property GeraHtmlFormParam: Boolean read FGeraHtmlFormParam write SetGeraHtmlFormParam;
    property lstHtmlFOrmParam: TStrings read FlstHtmlFOrmParam write SetlstHtmlFOrmParam;
    property IdHotel: Integer read FIdHotel write SetIdHotel;
    property ExibeMensagem: Boolean read FExibeMensagem write SetExibeMensagem;
    property ExibeFormParams: Boolean read FExibeFormParams write SetExibeFormParams;

    property ExceptionRaised: Boolean read fExceptionRaised;
   End;

implementation

{ TCmRptManager }

function TCmCtrlReports.PrintReport: Boolean;
{
Var
  sMensagem :String;
}
begin
   Result := True;
(**
   Case Idreport Of
     {*******************************************************************************
      Almoxarifado
     *******************************************************************************}
     1681 : //Consumo Médio
        Result := TRptConsMed.PrintReport(IdReport, 1, fIdEmpresa, fIdUsuario, fIdModulo, fParams,
                  fFileName, DataBaseName  ,fNomeEmpresa, fNomeModulo, sMensagem, DbAdoConnection, DbConnectionType, fDevicetype, fShowCancelDialog, fShowPrintDialog, false, false, FlstHtmlFOrmParam , FGeraHtmlFormParam);
     1511 : //Inventário Físico e Financeiro por Data
        Result := TRptInventFFData.PrintReport(IdReport, 1, fIdEmpresa, fIdUsuario, fIdModulo, fParams,
                  fFileName, DataBaseName  ,fNomeEmpresa,fNomeModulo, sMensagem, DbAdoConnection, DbConnectionType, fDevicetype, fShowCancelDialog, fShowPrintDialog, false, false, FlstHtmlFOrmParam , FGeraHtmlFormParam);
     2125 : //Totais Financeiros
        Result := TRptTotFinanc.PrintReport(IdReport, 1, fIdEmpresa, fIdUsuario, fIdModulo, fParams,
                  fFileName, DataBaseName  ,fNomeEmpresa,fNomeModulo, sMensagem, DbAdoConnection, DbConnectionType, fDevicetype, fShowCancelDialog, fShowPrintDialog, false, false, FlstHtmlFOrmParam , FGeraHtmlFormParam);
     {*******************************************************************************
      Caf
     *******************************************************************************}
     6    : //Balancete Patrimonial por Bem
        Result := TRptCAFBalPatBem.PrintReport(IdReport, 1, fIdEmpresa, fIdUsuario, fIdModulo, fParams,
                  fFileName, DataBaseName  ,fNomeEmpresa,fNomeModulo, sMensagem, DbAdoConnection, DbConnectionType, fDevicetype, fShowCancelDialog, fShowPrintDialog, false, false, FlstHtmlFOrmParam , FGeraHtmlFormParam);
     4    : //Balancete Patrimonial por Grupo
        Result := TRptCAFBalPatGrp.PrintReport(IdReport, 1, fIdEmpresa, fIdUsuario, fIdModulo, fParams,
                  fFileName, DataBaseName  ,fNomeEmpresa,fNomeModulo, sMensagem, DbAdoConnection, DbConnectionType, fDevicetype, fShowCancelDialog, fShowPrintDialog, false, false, FlstHtmlFOrmParam , FGeraHtmlFormParam);
     2317 : //Movimento Patrimonial por Bem
        Result := TRptCAFMovPatBem.PrintReport(IdReport, 1, fIdEmpresa, fIdUsuario, fIdModulo, fParams,
                  fFileName, DataBaseName  ,fNomeEmpresa,fNomeModulo, sMensagem, DbAdoConnection, DbConnectionType, fDevicetype, fShowCancelDialog, fShowPrintDialog, false, false, FlstHtmlFOrmParam , FGeraHtmlFormParam);
   Else
      MessageInfo := 'Relalatório não implementado'
   End;

   If Not Result Then
      MessageInfo := sMensagem;
**)
end;

constructor TCmCtrlReports.Create;
begin
  inherited;
  fIdReport := 0;
  FShowPrintDialog := True;
  FShowCancelDialog  := True;
  FIdUsuario := -1;
  FIdEmpresa  := -1;
  FIdModulo  := -1;
  FNomeEmpresa := '';
  FParams  := '';
  FNomeModulo  := '';
  FFileName  := '';
  FDevicetype := rdtScreen;
  FGeraHtmlFormParam := False;
  FlstHtmlFOrmParam := TStringList.Create;
  fIdHotel := 0;
  FExibeMensagem := false;
  FExibeFormParams := false;
  fExceptionRaised := false;
end;

destructor TCmCtrlReports.Destroy;
begin
  If Assigned(FlstHtmlFOrmParam) Then FlstHtmlFOrmParam := nil;

  FlstHtmlFOrmParam.Free;

  inherited;
end;

procedure TCmCtrlReports.SetDevicetype(const Value: TReportDeviceType);
begin
  FDevicetype := Value;
end;

procedure TCmCtrlReports.SetFileName(const Value: String);
begin
  FFileName := Value;
end;

procedure TCmCtrlReports.SetGeraHtmlFormParam(const Value: Boolean);
begin
  FGeraHtmlFormParam := Value;
end;

procedure TCmCtrlReports.SetIdEmpresa(const Value: Double);
begin
  FIdEmpresa := Value;
end;

procedure TCmCtrlReports.SetIdModulo(const Value: Integer);
begin
  FIdModulo := Value;
end;

procedure TCmCtrlReports.SetIdReport(const Value: Integer);
begin
  FIdReport := Value;
end;

procedure TCmCtrlReports.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TCmCtrlReports.SetlstHtmlFOrmParam(const Value: TStrings);
begin
  FlstHtmlFOrmParam := Value;
end;

procedure TCmCtrlReports.SetNomeEmpresa(const Value: String);
begin
  FNomeEmpresa := Value;
end;

procedure TCmCtrlReports.SetNomeModulo(const Value: String);
begin
  FNomeModulo := Value;
end;

procedure TCmCtrlReports.SetParams(const Value: String);
begin
  FParams := Value;
end;

procedure TCmCtrlReports.SetShowCancelDialog(const Value: Boolean);
begin
  FShowCancelDialog := Value;
end;

procedure TCmCtrlReports.SetShowPrintDialog(const Value: Boolean);
begin
  FShowPrintDialog := Value;
end;


function TCmCtrlReports.ShowReport: Boolean;
begin
   fExceptionRaised := false;                           
   Result := False;
   MessageInfo := '';
   
   Try
     Result := PrintReport;

     If ( Not Result ) And ( Trim(MessageInfo) <> '' ) Then Raise Exception.Create( MessageInfo );
   Except
     On E:Exception Do
     Begin
        fExceptionRaised := True;
        //MessageInfo := FormatErrorMessage(Self,E,'Erro ao Gerar relatório' + (#13+#10) + MessageInfo);
        //MessageInfo := FormatErrorMessage(Self,E,'Erro ao Gerar relatório' + (#13+#10) + MessageInfo);
     End;
   End;
end;

procedure TCmCtrlReports.InitializeAs(CtrlReports: TCmCtrlReports);
begin
  //CmDebugToFile('Entrei no Initialize');

  Case DbConnectionType of
    cntADO:
    Begin
      DbAdoConnection := CtrlReports.DbAdoConnection;
      DataBase := nil;
    End;
    cntBde:
    Begin
      DataBase := CtrlReports.DataBase;
      DbAdoConnection := nil;
    End;
  End;

  ConnectionSide := CtrlReports.ConnectionSide;
  DbConnectionType := CtrlReports.DbConnectionType;
  Devicetype := CtrlReports.Devicetype;
  IdEmpresa := CtrlReports.IdEmpresa;
  IdUsuario := CtrlReports.IdUsuario;
  IdModulo := CtrlReports.IdModulo;
  FileName := CtrlReports.FileName;
  NomeEmpresa := CtrlReports.NomeEmpresa;
  NomeModulo := CtrlReports.NomeModulo;
  GeraHtmlFormParam := CtrlReports.GeraHtmlFormParam;
  lstHtmlFOrmParam := CtrlReports.lstHtmlFOrmParam;
  IdReport := CtrlReports.IdReport;
  Params := CtrlReports.Params;
  IdHotel := CtrlReports.IdHotel;

  ShowPrintDialog := CtrlReports.ShowPrintDialog;
  ShowCancelDialog := CtrlReports.ShowCancelDialog;
  ExibeMensagem := CtrlReports.ExibeMensagem;
  ExibeFormParams := CtrlReports.ExibeFormParams;

  //CmDebugToFile('Sai do Initialize');
end;

procedure TCmCtrlReports.SetIdHotel(const Value: Integer);
begin
  FIdHotel := Value;
end;

procedure TCmCtrlReports.SetExibeFormParams(const Value: Boolean);
begin
  FExibeFormParams := Value;
end;

procedure TCmCtrlReports.SetExibeMensagem(const Value: Boolean);
begin
  FExibeMensagem := Value;
end;

function TCmCtrlReports.ReportExists: Boolean;
begin
   Result := False;
end;

function TCmCtrlReports.ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): Boolean;
{
Var
  sMensagem :String;
}
begin
{
   Result := False;

   Case Idreport Of
    1477 : Result := TRptAgencias.ConfigReport(liIdreports, liOrigemCm, sMensagem);
   Else
      MessageInfo := 'Relatório não implementado'
   End;

   If Not Result Then  MessageInfo := sMensagem;
}
end;

end.
