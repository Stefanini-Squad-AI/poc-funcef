//==================================================================================================================================
//Nº SIG......: 62086
//Data........: 13/07/2018
//Autor.......: Darivaldo Alencar
//Descrição...: Impressora padrão mudando sozinha durante a geração do relatório.
//Rotina......: FormCreate, spbPreviewPrintClick, FormClose
//==================================================================================================================================
// andre tavares - 20/01/2005 - pendência 21224 - DAVA ACCESS VIOLATION AO CLICAR NO BOTÃO SALVAR PARA ARQUIVO.
//==================================================================================================================================
unit FCmReport;

{String de Conexão para teste com ADO}
{Provider=MSDAORA.1;Password=CMSOL;User ID=CM;Data Source=CM;Persist Security Info=True}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, Db, DBTables, wwQuery,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, CmParamReport, ppBands, ppCache,
  TXComp, ppEndUsr, uCmRptManager, ADOdb, ppForms, ppPrvDlg,
  DbClient, uCMTypes, ppTypes, uMensErro, TXRB,uAutorizacao;

type
  TFrmCmReport = class(TForm)
    CmpRptCM: TCmParamReport;
    DevRptCM: TExtraOptions;
    CrmRptCM: TCmRptManager;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    PrintedFromSite: Boolean;
  private
    { Private declarations }
    Autorizacao : TAutorizacao;//Darivaldo Alencar SIG62086
    _NomeEmpresa, _NomeModulo: String;
    procedure SetLabelsSistemaEmpresa(Sender: TObject);
  public
    { Public declarations }
    Class function PrintReport(Const iIdReport, iIOrigemCM :Integer; Const iIdEmpresa :Double; Const iIdUsuario, iIdModulo :Integer;
          Const sParams, sFileName, sDataBaseName :String; sNomeEmpresa, sNomeModulo :String; Var sMensagem :String; cAdoConnection :TADOConnection = nil;
          Const ConnectionType :TDbConnectionType = cntBDE; Const DeviceType :TReportDeviceType = rdtScreen; bShowCancelDialog :Boolean = True; bShowPrintDialog :Boolean = True;
          bExibeMensagem :Boolean = True; bExibeFormParams :Boolean = True; lstHtmlFormParam: TStrings = nil; bGeraHtmlFormParam: Boolean = false; iIdHotel: Integer = 0) :Boolean;

    Class function ConfigReport(Const liIdReport, liIOrigemCM :Integer; Var sMensagem: String; DesReport: TObject): Boolean;
  end;

var
  FrmCmReport: TFrmCmReport;

implementation

Uses uCtrlConfigreportscm, uCtrlPadroes, uSistema;

{$R *.DFM}

{ TFrmCmReprot }


class function TFrmCmReport.ConfigReport(const liIdReport,
  liIOrigemCM: Integer; Var sMensagem: String; DesReport: TObject): Boolean;
Var
  aRpt, aRptLoaded  :TMemoryStream;
  aCds: TClientDataSet;
  sNomeReport: String;
begin
  sMensagem := '';

  Result := True;

  With Create(Application) Do
    Try
      aRpt := TMemoryStream.Create;
      aRptLoaded := TMemoryStream.Create;
      aCds := TClientDataSet.Create(nil);

      CrmRptCM.IdReports := liIdReport;
      CrmRptCM.OrigemCM := liIOrigemCM;

      Try
         aCds.Data := Padroes.GetDataPacket('SELECT TEMPLATE FROM CONFIGREPORTSCM WHERE IDREPORTS = ' + IntToStr(liIdReport) + ' AND ORIGEMCM = ' + IntToStr(liIOrigemCM) + ' AND IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

         If Not aCds.IsEmpty Then
         Begin
            // início - andre tavares - pendência 17810 - 07/01/2005
            //CrmRptCM.Report.Template.Format := ftAscii;
            CrmRptCM.Report.Template.Format := ftBinary;
            // fim - andre tavares - pendência 17810
            CrmRptCM.Report.Template.SaveToStream(aRpt);

            TBlobField(aCds.FieldByName('TEMPLATE')).SaveToStream(aRptLoaded);

            Try

              // início - andre tavares - pendência 17810 - 07/01/2005
              //CrmRptCM.Report.Template.Format := ftAscii;
              CrmRptCM.Report.Template.Format := ftBinary;
              // fim - andre tavares - pendência 17810
              aRptLoaded.Position := 0;
              CrmRptCM.Report.Template.LoadFromStream(aRptLoaded);
            Except
              // início - andre tavares - pendência 17810 - 07/01/2005
              //CrmRptCM.Report.Template.Format := ftAscii;
              CrmRptCM.Report.Template.Format := ftBinary;
              // fim - andre tavares - pendência 17810
              aRpt.Position := 0;
              CrmRptCM.Report.Template.LoadFromStream(aRpt);
            End;
         End;

         aRptLoaded.Free;
      Except
        aRptLoaded.Free;
      End;

      Try
        // andre tavares - pendência 21224 - tem que ser assim para não dar access violation
        CrmRptCM.Report.Template.SaveTo := stFile;

        TppDesigner(DesReport).Report := CrmRptCM.Report;

        TppDesigner(DesReport).ShowModal;

        aRpt.Clear;
        TppDesigner(DesReport).Report.Template.SaveToStream(aRpt);


        aCds.Data := Padroes.GetDataPacket('SELECT NAME FROM REPORTS WHERE IDREPORTS = ' + IntToStr(liIdReport) + ' AND ORIGEMCM = ' + IntToStr(liIOrigemCM));
        sNomeReport   := aCds.FieldByName('NAME').AsString;

        If InputQuery('Configuração de Relatórios','Nome do Relatório',sNomeReport) Then
        Begin
           If Trim(sNomeReport) = '' Then
              sNomeReport   := aCds.FieldByName('NAME').AsString;

            aCds.Close;

           With TCtrlConfigreportscm.Create Do
             Try
                InitializeAs(Padroes);
                OpenCds(liIdReport, liIOrigemCM, Sistema.IdEmpresa);

                If CdsReports.IsEmpty Then
                   CdsReports.Append
                Else
                   CdsReports.Edit;

                CdsReports.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
                CdsReports.FieldByName('IDREPORTS').AsFloat  := liIdReport;
                CdsReports.FieldByName('ORIGEMCM').AsFloat   := liIOrigemCM;
                CdsReports.FieldByName('DESCRICAO').AsString := Trim(sNomeReport);

                aRpt.Position := 0;
                TBlobField(CdsReports.FieldByName('TEMPLATE')).LoadFromStream(aRpt);

                CdsReports.Post;

                If Not ProcessaConfigModelo Then
                   MsgDlg(MessageInfo,'Erro', mtError, [ mbOk ], 0);

             Finally
                Free;
             End;
        End;

        aRpt.Free;
        aCds.Free;
      Except
        aRpt.Free;
        aCds.Free;
        Raise;
      End;

      Free;
    Except
      On E:Exception Do
      Begin
        Free;
        sMensagem := E.Message;
        Result := False;
      End;
    End;

end;

Class function TFrmCmReport.PrintReport(Const iIdReport, iIOrigemCM :Integer; Const iIdEmpresa :Double; Const iIdUsuario, iIdModulo :Integer;
          Const sParams, sFileName, sDataBaseName :String; sNomeEmpresa, sNomeModulo :String; Var sMensagem :String; cAdoConnection :TADOConnection = nil;
          Const ConnectionType :TDbConnectionType = cntBDE; Const DeviceType :TReportDeviceType = rdtScreen; bShowCancelDialog :Boolean = True; bShowPrintDialog :Boolean = True;
          bExibeMensagem :Boolean = True; bExibeFormParams :Boolean = True; lstHtmlFormParam: TStrings = nil; bGeraHtmlFormParam: Boolean = false; iIdHotel: Integer = 0) :Boolean;
begin
  Result := False;

  //CmDebugToFile('Create do Print Report .3');
  //CmDebugToFile('Dll: ' + Application.ExeName);

  With Create(Application) Do
    Try
      _NomeEmpresa := sNomeEmpresa;
      _NomeModulo := sNomeModulo;
      
      PrintedFromSite := bGeraHtmlFormParam;

      If PrintedFromSite Then
      Begin
         Padroes := TCtrlPadroes.Create;
         Padroes.Initialize(Session.FindDatabase(sDataBaseName),false);
      End;

      //CmDebugToFile('O Objeto Foi Criado .3');
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
      CrmRptCM.SetLabelsSistemaEmpresa := SetLabelsSistemaEmpresa;

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
           Try
             //If Not PrintedFromSite Then ppRegisterForm(TppCustomPreviewer, TppPrintPreview);

             Autorizacao.FecharTelaPreviewRel;//Darivaldo Alencar SIG62086
             CrmRptCM.Print;

             //If Not PrintedFromSite Then ppUnRegisterForm(TppCustomPreviewer);
           Except
             //If Not PrintedFromSite Then ppUnRegisterForm(TppCustomPreviewer);
             Raise;
           End;
           Result := True;
        End;
      End;

      Free;

      If PrintedFromSite Then Padroes.Free;
    Except
      On E: Exception Do
      Begin
        If PrintedFromSite Then Padroes.Free;
        sMensagem := E.Message;
        Free;
      End;
    End;
end;

procedure TFrmCmReport.SetLabelsSistemaEmpresa(Sender: TObject);
begin
  If CrmRptCM.LabelEmpresa <> nil Then CrmRptCM.LabelEmpresa.Caption := _NomeEmpresa;
  If CrmRptCM.LabelSistema <> nil Then CrmRptCM.LabelSistema.Caption := _NomeModulo;
end;

procedure TFrmCmReport.FormCreate(Sender: TObject);
begin
  Autorizacao:= TAutorizacao.create;//Darivaldo Alencar SIG62086
end;

procedure TFrmCmReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(Autorizacao); //Darivaldo Alencar SIG62086
end;

end.
