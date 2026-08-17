 unit FCmReport;

{String de Conexão para teste com ADO}
{Provider=MSDAORA.1;Password=CMSOL;User ID=CM;Data Source=CM;Persist Security Info=True}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, Db, DBTables, wwQuery,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, CmParamReport, ppBands, ppCache,
  TXComp, ppEndUsr, uCmRptManager, ADOdb, uSistema, TXRB;

type
  TFrmCmReport = class(TForm)
    CmpRptCM: TCmParamReport;
    DevRptCM: TExtraOptions;
    CrmRptCM: TCmRptManager;
  protected

  private
    { Private declarations }
  public
    { Public declarations }
    Class function PrintReport(Const iIdReport, iIOrigemCM :Integer; Const iIdEmpresa :Double; Const iIdUsuario, iIdModulo :Integer;
          Const sParams, sFileName, sDataBaseName :String; sNomeEmpresa, sNomeModulo :String; Var sMensagem :String; cAdoConnection :TADOConnection = nil;
          Const ConnectionType :TDbConnectionType = cntBDE; Const DeviceType :TReportDeviceType = rdtScreen; bShowCancelDialog :Boolean = True; bShowPrintDialog :Boolean = True;
          bExibeMensagem :Boolean = True; bExibeFormParams :Boolean = True; lstHtmlFormParam: TStrings = nil; bGeraHtmlFormParam: Boolean = false; iIdHotel: Integer = 0) :Boolean;
  end;

var
  FrmCmReport: TFrmCmReport;

implementation

{$R *.DFM}

{ TFrmCmReprot }

//TRpt.PrintReport(-1,-1,1,1,1,'','','DBDEMOS','Empresa Proprietaria 1',
//                        'Teste de Relatório - 02.00.00',sMens);

Class function TFrmCmReport.PrintReport(Const iIdReport, iIOrigemCM :Integer; Const iIdEmpresa :Double; Const iIdUsuario, iIdModulo :Integer;
          Const sParams, sFileName, sDataBaseName :String; sNomeEmpresa, sNomeModulo :String; Var sMensagem :String; cAdoConnection :TADOConnection = nil;
          Const ConnectionType :TDbConnectionType = cntBDE; Const DeviceType :TReportDeviceType = rdtScreen; bShowCancelDialog :Boolean = True; bShowPrintDialog :Boolean = True;
          bExibeMensagem :Boolean = True; bExibeFormParams :Boolean = True; lstHtmlFormParam: TStrings = nil; bGeraHtmlFormParam: Boolean = false; iIdHotel: Integer = 0) :Boolean;
begin
  Result := False;

  With Self.Create(Application) Do
    Try
      CmpRptCM.DataBaseName := sDataBaseName;
      CmpRptCM.StrParams := sParams;
      CmpRptCM.ExibeMensagem := bExibeMensagem;
      CmPRptCM.ExibeFormParams := bExibeFormParams;

      CrmRptCM.ConnectionType := ConnectionType;

      CrmRptCM.IdHotel := iIdHotel;
      CrmRptCM.IdReports := iIdReport;
      CrmRptCM.OrigemCM := iIOrigemCM;
      CrmRptCM.IdEmpresa := iIdEmpresa;
      CrmRptCM.IdUsuario := iIdUsuario;
      CrmRptCM.IdModulo := iIdModulo;
      CrmRptCM.FileName := sFileName;
      CrmRptCM.DeviceType := DeviceType;
      CrmRptCM.ShowCancelDialog := bShowCancelDialog;
      CrmRptCM.ShowPrintDialog := bShowPrintDialog;
      If CrmRptCM.LabelEmpresa <> nil Then CrmRptCM.LabelEmpresa.Caption := sNomeEmpresa;
      If CrmRptCM.LabelSistema <> nil Then CrmRptCM.LabelSistema.Caption := sNomeModulo;

      Case ConnectionType of
        cntADO:
        Begin
           CrmRptCM.Connection := cAdoConnection;
        End;
        cntBde:
        Begin
          CrmRptCM.DataBaseName := sDataBaseName;
        End;
      End;

      If bGeraHtmlFormParam Then
      Begin
         Result := CmpRptCM.MontaHtmlFormParam(lstHtmlFormParam);
      End
      ELse
      Begin
        If CmpRptCM.Execute Then
        Begin
           CrmRptCM.Print;
           Result := True;
        End;
      End;

      Free;
    Except
      On E: Exception Do
      Begin
        sMensagem := E.Message;
        Free;
      End;
    End;
end;

end.
