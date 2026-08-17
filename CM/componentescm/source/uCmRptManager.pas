{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}

{---------------------------------------------------------------------------------
Rotina    : Print
Data      : 14/03/2017
Autor     : Edilaine
SIG       : 41804
Descrição : Preview com export migrado da CmForms para CmCompo e novo método CREATE
            para tratar apresentação de relatorios pela herança do CmRptManager
---------------------------------------------------------------------------------}

unit uCmRptManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DsgnIntf,
  Dbtables, ppReport, ppCtrls, uSistema, ADODb, ppViewr, ppFilDev, FPreview, uCtrlPadroes,
  DbClient, uCMTypes, ppTypes, db,
  fPreviewExport;    //edilaine - SIG41804

type
  TChangeDataBaseNameEvent = Procedure (Sender :TObject; sDataBaseName :String) of Object;

  TChangeConnectionType = Procedure (Sender :TObject; ConnectionType :TDbConnectionType) of Object;

  TChangeConnection = Procedure (Sender :TObject; Connection :TADOConnection) of Object;

  TCmRptManager = class(TComponent)
  private
    FShowCancelDialog: Boolean;
    FShowPrintDialog: Boolean;
    FIdModulo: Integer;
    FIdEmpresa: Double;
    FIdUsuario: Integer;
    FFileName: String;
    FDataBaseName: String;
    FDeviceType: TReportDeviceType;
    FBeforePrint: TNotifyEvent;
    FReport: TppReport;
    FChangeDataBaseName: TChangeDataBaseNameEvent;
    FIdReports: Integer;
    FOrigemCM: Integer;
    FLabelSistema: TppLabel;
    FLabelEmpresa: TppLabel;
    FConnectionType: TDbConnectionType;
    FChangeConnectionType: TChangeConnectionType;
    FConnection: TADOConnection;
    FChangeConnection: TChangeConnection;
    FIdHotel: Integer;
    FSetLabelsSistemaEmpresa: TNotifyEvent;
    FOnChangeIdReport: TNotifyEvent;
    procedure SetDataBaseName(const Value: String);
    procedure SetDeviceType(const Value: TReportDeviceType);
    procedure SetFileName(const Value: String);
    procedure SetIdEmpresa(const Value: Double);
    procedure SetIdModulo(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetShowCancelDialog(const Value: Boolean);
    procedure SetShowPrintDialog(const Value: Boolean);
    procedure SetBeforePrint(const Value: TNotifyEvent);
    procedure SetReport(const Value: TppReport);
    procedure SetChangeDataBaseName(const Value: TChangeDataBaseNameEvent);
    procedure LoadLayoutFromDB;
    procedure SetIdReports(const Value: Integer);
    procedure SetOrigemCM(const Value: Integer);
    procedure SetLabelSistema(const Value: TppLabel);
    procedure SetLabelEmpresa(const Value: TppLabel);
    procedure SetConnectionType(const Value: TDbConnectionType);
    procedure SetChangeConnectionType(const Value: TChangeConnectionType);
    procedure SetConnection(const Value: TADOConnection);
    procedure SetChangeConnection(const Value: TChangeConnection);
    procedure SetIdHotel(const Value: Integer);
    procedure SetSetLabelsSistemaEmpresa(const Value: TNotifyEvent);
    procedure SetOnChangeIdReport(const Value: TNotifyEvent);
    { Private declarations }
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    Constructor Create(Aowner :TComponent); Override;
    Destructor Destroy; Override;

    procedure Print;

    property IdReports :Integer read FIdReports write SetIdReports;
    property OrigemCM :Integer read FOrigemCM write SetOrigemCM;
    property IdHotel :Integer read FIdHotel write SetIdHotel;
    property SetLabelsSistemaEmpresa: TNotifyEvent read FSetLabelsSistemaEmpresa write SetSetLabelsSistemaEmpresa;
  published
    property BeforePrint :TNotifyEvent read FBeforePrint write SetBeforePrint;
    property ChangeDataBaseName: TChangeDataBaseNameEvent read FChangeDataBaseName write SetChangeDataBaseName;
    property ChangeConnectionType: TChangeConnectionType read FChangeConnectionType write SetChangeConnectionType;
    property ChangeConnection: TChangeConnection read FChangeConnection write SetChangeConnection;
    property OnChangeIdReport :TNotifyEvent read FOnChangeIdReport write SetOnChangeIdReport;


    property IdEmpresa :Double read FIdEmpresa write SetIdEmpresa;
    property IdUsuario :Integer read FIdUsuario write SetIdUsuario;
    property IdModulo :Integer read FIdModulo write SetIdModulo;
    property FileName :String read FFileName write SetFileName;
    property DataBaseName :String read FDataBaseName write SetDataBaseName;
    property DeviceType :TReportDeviceType read FDeviceType write SetDeviceType;
    property ShowPrintDialog :Boolean read FShowPrintDialog write SetShowPrintDialog;
    property ShowCancelDialog :Boolean read FShowCancelDialog write SetShowCancelDialog;
    property Report :TppReport read FReport write SetReport;
    property LabelEmpresa :TppLabel read FLabelEmpresa write SetLabelEmpresa;
    property LabelSistema :TppLabel read FLabelSistema write SetLabelSistema;

    property ConnectionType :TDbConnectionType read FConnectionType write SetConnectionType;
    property Connection :TADOConnection read FConnection write SetConnection;

    { Published declarations }
  end;

implementation

{ TCmRptManager }

constructor TCmRptManager.Create(Aowner: TComponent);
begin
  Inherited Create(Aowner);
  FShowCancelDialog := True;
  FShowPrintDialog  := True;
  FIdModulo  := 0;
  FIdEmpresa  := 0;
  fIdHotel  := 0;
  FIdUsuario := 0;
  FFileName  := '';
  FDeviceType := rdtScreen;

  FIdReports := -1;
  FOrigemCM := -1;
end;

destructor TCmRptManager.Destroy;
begin


  Inherited Destroy;
end;

procedure TCmRptManager.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;

  If (Not (csLoading in Owner.ComponentState)) Then
     If Assigned(ChangeDataBaseName) Then ChangeDataBaseName(Self,Value);
end;

procedure TCmRptManager.SetDeviceType(const Value: TReportDeviceType);
begin
  FDeviceType := Value;

  If (Not (csLoading in Owner.ComponentState)) Then
     If (FReport <> nil) And Not
        (csDesigning in ComponentState) Then
     Begin
       Case Integer(DeviceType) Of
       0: FReport.DeviceType := 'Screen';    //rdtScreen
       1: FReport.DeviceType := 'Printer';   //rdtPrinter
       2: FReport.DeviceType := 'PDFFile';   //rdtPdf
       3: FReport.DeviceType := 'TextFile';  //rdtTxt
       4: FReport.DeviceType := 'ExcelFile'; //rdtExcell
       5: FReport.DeviceType := 'RTFFile';   //rdtRtf,
       6, 7, 8: FReport.DeviceType := 'GraphicFile'; //rdtJpg, rdtBmp, rdtTif
       9: FReport.DeviceType := 'HTMLFile';          //rdtHtml
       10: FReport.DeviceType := 'ArchiveFile';
       End;
     End;
end;

procedure TCmRptManager.SetFileName(const Value: String);
begin
  FFileName := Value;

  If (Not (csLoading in Owner.ComponentState)) Then
     If (FReport <> nil) And not (csDesigning in ComponentState) Then
     Begin
       If (Value <> '') And (FileExists(Value)) Then
          DeleteFile(Value);

       FReport.ArchiveFileName := Value;
       FReport.TextFileName := Value;
     End;
end;

procedure TCmRptManager.SetIdEmpresa(const Value: Double);
begin
  FIdEmpresa := Value;
end;

procedure TCmRptManager.SetIdModulo(const Value: Integer);
begin
  FIdModulo := Value;
end;

procedure TCmRptManager.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TCmRptManager.SetBeforePrint(const Value: TNotifyEvent);
begin
  FBeforePrint := Value;
end;

procedure TCmRptManager.SetShowCancelDialog(const Value: Boolean);
begin
  FShowCancelDialog := Value;

  If (Not (csLoading in Owner.ComponentState)) Then
     If (FReport <> nil) And not (csDesigning in ComponentState) Then
        FReport.ShowCancelDialog := Value;
end;

procedure TCmRptManager.SetShowPrintDialog(const Value: Boolean);
begin
  FShowPrintDialog := Value;
  If (Not (csLoading in Owner.ComponentState)) Then
     If (FReport <> nil) And not (csDesigning in ComponentState) Then
        FReport.ShowPrintDialog := Value;
end;

procedure TCmRptManager.SetReport(const Value: TppReport);
begin
  if (FReport = Value) then Exit;

  FReport := Value;
end;

procedure TCmRptManager.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (aComponent = FReport) and (Operation = opRemove) then
    FReport := nil
  Else
    if (aComponent = FLabelSistema) and (Operation = opRemove) then
      FLabelSistema := nil
    Else
      if (aComponent = FLabelEmpresa) and (Operation = opRemove) then
        FLabelEmpresa := nil
      Else
        if (aComponent = FConnection) and (Operation = opRemove) then
          FConnection := nil;
end;

procedure TCmRptManager.LoadLayoutFromDB;
Var
  aRpt, aRptLoaded  :TMemoryStream;
  aCds: TClientDataSet;
  _LabelEmpresa, _LabelSistema: String;

begin
  aRpt := TMemoryStream.Create;
  aRptLoaded := TMemoryStream.Create;
  aCds := TClientDataSet.Create(nil);
  Try
     aCds.Data := Padroes.GetDataPacket('SELECT TEMPLATE FROM CONFIGREPORTSCM WHERE IDREPORTS = ' + IntToStr(IdReports) + ' AND ORIGEMCM = ' + IntToStr(OrigemCM) + ' AND IDPESSOA = ' + FloatToStr(FIdEmpresa));

     If Not aCds.IsEmpty Then
     Begin
        Report.Template.Format := ftAscii;
        Report.Template.SaveToStream(aRpt);

        TBlobField(aCds.FieldByName('TEMPLATE')).SaveToStream(aRptLoaded);

        Try
          Report.Template.Format := ftAscii;
          aRptLoaded.Position := 0;

          If FLabelSistema <> nil Then
             _LabelSistema := FLabelSistema.Name
          Else
             _LabelSistema := '';

          If FLabelEmpresa <> nil Then
             _LabelEmpresa := FLabelEmpresa.Name
          Else
             _LabelEmpresa := '';

          Report.Template.LoadFromStream(aRptLoaded);

        Except
          Report.Template.Format := ftAscii;
          aRpt.Position := 0;
          Report.Template.LoadFromStream(aRpt);
        End;

       If Report.Owner is TForm Then
       Begin
         If ( TForm(Report.Owner).FindComponent(_LabelSistema) <> nil ) Then
            LabelSistema := TppLabel(TForm(Report.Owner).FindComponent(_LabelSistema));

         If ( TForm(Report.Owner).FindComponent(_LabelEmpresa) <> nil ) Then
            LabelEmpresa := TppLabel(TForm(Report.Owner).FindComponent(_LabelEmpresa));
       End;
     End;

  finally
    aRpt.Free;
    aRptLoaded.Free;
    aCds.Free;
  End;
end;

procedure TCmRptManager.Print;
Var
  sNomeRpt: String;
  sExporta: string;          //edilaine - SIG41804
begin
  LoadLayoutFromDB;
  
  If Assigned(BeforePrint) Then BeforePrint(Self);

  If Assigned(SetLabelsSistemaEmpresa) Then SetLabelsSistemaEmpresa(Self);

  FReport.AllowPrintToArchive  := True;
  FReport.AllowPrintToFile     := True;
  FReport.ShowAutoSearchDialog := True;

  
  // Verifica a versão do RB, pois para o padrão
  //5.10.09, era utilizado a versão 5.5 do RB e que
  //não existe esta propriedade (NoDataBehaviors)
  //e que após o padrão 5.10.10, a versão do RB
  //utilizada é a 7.04. É necessário setar esta
  //propriedade para manter a mesma funcionalidade
  //dos relatórios com a versão anterior do RB.
  // A propriedade VersionNo tem formatação em
  //milhar, ex: 7.04 = 7040
  if FReport.VersionNo > 6000 then
     FReport.NoDataBehaviors := [ndBlankReport];

  If DeviceType = rdtScreen Then
  Begin
      With TClientDataSet.Create(Application) Do
        try
           //Data := Padroes.GetDataPacket('SELECT NAME FROM REPORTS WHERE IDREPORTS = ' + IntToStr(IdReports) + ' AND ORIGEMCM = ' + IntToStr(OrigemCM));    //edilaine - SIG41804
           Data := Padroes.GetDataPacket('SELECT NAME, FLGEXPORTADADOS FROM REPORTS WHERE IDREPORTS = ' + IntToStr(IdReports) + ' AND ORIGEMCM = ' + IntToStr(OrigemCM));      //edilaine - SIG41804
           sNomeRpt := Fields[0].AsString;
           sExporta := Fields[1].AsString;   //edilaine - SIG41804
           Close;
        finally
           Free;
        end;

    //edilaine - SIG41804 - inicio
    if sExporta = 'S' then
       TFrmPreviewExport.CreateModalPreviewExpPipe(Application, FReport, sNomeRpt)
    else
       TFrmPreview.CreateModalPreview(Application, FReport, sNomeRpt);
    //edilaine - SIG41804 - fim
  End
  Else
    FReport.Print;
end;

procedure TCmRptManager.SetChangeDataBaseName(
  const Value: TChangeDataBaseNameEvent);
begin
  FChangeDataBaseName := Value;
end;

procedure TCmRptManager.SetIdReports(const Value: Integer);
begin
  FIdReports := Value;
end;

procedure TCmRptManager.SetOrigemCM(const Value: Integer);
begin
  FOrigemCM := Value;

  if assigned(OnChangeIdReport) then OnChangeIdReport(Self);   
end;

procedure TCmRptManager.SetLabelSistema(const Value: TppLabel);
begin
  FLabelSistema := Value;
end;

procedure TCmRptManager.SetLabelEmpresa(const Value: TppLabel);
begin
  FLabelEmpresa := Value;
end;

procedure TCmRptManager.SetConnectionType(const Value: TDbConnectionType);
begin
  FConnectionType := Value;

  If (Not (csLoading in Owner.ComponentState)) Then
     If Assigned(ChangeConnectionType) Then ChangeConnectionType(Self,Value);
end;

procedure TCmRptManager.SetChangeConnectionType(
  const Value: TChangeConnectionType);
begin
  FChangeConnectionType := Value;
end;

procedure TCmRptManager.SetConnection(const Value: TADOConnection);
begin
  FConnection := Value;

  If (Not (csLoading in Owner.ComponentState)) And
     (Value <> nil) Then
     If Assigned(ChangeConnection) Then ChangeConnection(Self,Value);
end;

procedure TCmRptManager.SetChangeConnection(
  const Value: TChangeConnection);
begin
  FChangeConnection := Value;
end;

procedure TCmRptManager.SetIdHotel(const Value: Integer);
begin
  FIdHotel := Value;
end;

procedure TCmRptManager.SetSetLabelsSistemaEmpresa(
  const Value: TNotifyEvent);
begin
  FSetLabelsSistemaEmpresa := Value;
end;

procedure TCmRptManager.SetOnChangeIdReport(const Value: TNotifyEvent);
begin
  FOnChangeIdReport := Value;
end;

end.

