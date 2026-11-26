{-------------------------------------------------------------------------------
 Data       : 07.08.2015
 Sol        : 148922/8841
 PPM        : 1628565
 Autor      : Jonas Otavio
 Rotina     : Botão Ajuda
 Descrição  : Confeccionar documentação do módulo de Empréstimo
------------------------------------------------------------------------------- }
// andre tavares - pendência 17810 - 07/01/2005
unit fConfigRelatCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TB97Ctls, ppPrvDlg, wwdblook, CMDBLookupCombo,
  fcCombo, fctreecombo, fcTreeView, Db, DBTables, wwQuery, 
  ppComm, ppProd, ppClass, ppReport, Dsgnintf, ppTypes, Menus, ppForms, ppSubRpt,
  ppEndUsr, ImgList, DBClient, uCMClientDataSet, uCmSqlParams,
  //Rodolpho da Silva - 05/10/2006
  raIDE
  ;

type
  TFrmConfigRelatCM = class(TfrmSairAjuda)
    BtnRestaura: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    BtnAltera: TBitBtn;
    Label1: TLabel;
    TreeReports: TfcTreeCombo;
    ImlReports: TImageList;
    MergeMenu: TMainMenu;
    mniFile: TMenuItem;
    mniFilePageSetup: TMenuItem;
    mniFilePrintToFileSetup: TMenuItem;
    mniFileLine4: TMenuItem;
    Sair1: TMenuItem;
    MnuRlatorio: TMenuItem;
    MnuTitulo: TMenuItem;
    MnuSumario: TMenuItem;
    N2: TMenuItem;
    MnuCabecalho: TMenuItem;
    MnuRodape: TMenuItem;
    N3: TMenuItem;
    MnuGrupos: TMenuItem;
    MnuLInha: TMenuItem;
    MnuRetrato: TMenuItem;
    MnuPaisagem: TMenuItem;
    N5: TMenuItem;
    MnuUnidades: TMenuItem;
    MnuPixelsTela: TMenuItem;
    MnuPixelsImpressora: TMenuItem;
    MnuPolegada: TMenuItem;
    MnuMilimetros: TMenuItem;
    MnuMMilimetros: TMenuItem;
    ToolbarSep972: TToolbarSep97;
    DesReport: TppDesigner;
    SQLReports: TCMSqlParams;
    CdsReports: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure TreeReportsCheckValidItem(Sender: TObject; Node: TfcTreeNode;
      var Accept: Boolean);
    procedure BtnAlteraClick(Sender: TObject);
    procedure DesReportCreateComponent(Sender: TObject;
      Component: TComponent);
    procedure BtnRestauraClick(Sender: TObject);
    procedure mniFilePageSetupClick(Sender: TObject);
    procedure mniFilePrintToFileSetupClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure DesReportValidateComponent(Sender: TObject;
      Component: TComponent; var Valid: Boolean);
    procedure bbtnAjudaClick(Sender: TObject);
  private
    { Private declarations }
    procedure MontaArvoreRelatorio;
  public
    { Public declarations }
  end;

var
  FrmConfigRelatCM: TFrmConfigRelatCM;

implementation

{$R *.DFM}

Uses uSistema, DBaseDados, uDataBase, dReports, uMensErro, uCtrlPadroes,
     fCmPrincipalForms, uCtrlConfigreportscm;

procedure TFrmConfigRelatCM.FormCreate(Sender: TObject);
begin
  inherited;
  //ppRegisterForm(TppCustomPreviewer, TppPrintPreview);

  // Rodolpho da Silva - 22/01/2007
  DesReport.IniStorageName := Sistema.TempDir + '\RBuilder.ini';

  MontaArvoreRelatorio;
  DesReport.Notebook.Pages[1].Visible := False;

  If CdsReports.Active Then CdsReports.Close;
end;

procedure TFrmConfigRelatCM.MontaArvoreRelatorio;
Var
    SOldGrupo: String;
    TreeFilho, TreeGrupo: TfcTreeNode;
Begin
   FazQuery(DtmBaseDados.Qry,
       ' SELECT ' +
       '   R.IDREPORTS, R.ORIGEMCM, M.NOMEMODULO, DECODE(C.DESCRICAO,NULL,R.NAME,C.DESCRICAO) AS NAME, G.DESCRICAO ' +
       ' FROM ' +
       '   REPORTS R, MODULO M, GRUPORELATORIO G, CONFIGREPORTSCM C ' +
       ' WHERE ' +
       '   ( R.IDMODULO = ' + INTTOSTR(SISTEMA.IDMODULO) + ') AND ' +
       '   ( C.IDPESSOA(+) = ' + INTTOSTR(SISTEMA.IDEMPRESA) + ') AND ' +
       '   ( R.PPREPORT IS NOT NULL ) AND ' +
       '   ( C.IDREPORTS(+) =  R.IDREPORTS ) AND ' +
       '   ( C.ORIGEMCM(+) =  R.ORIGEMCM ) AND ' +
       '   ( R.IDMODULO = M.IDMODULO ) AND ' +
       '   ( R.IDGRUPORELATORIO = G.IDGRUPORELATORIO(+) ) AND ' +
       '   ( R.ORIGEMCMGR = G.ORIGEMCMGR(+) ) ' +
       ' ORDER BY ' +
       '    M.NOMEMODULO, G.DESCRICAO, R.NAME');

  sOldGrupo := '';
  TreeGrupo := nil;

  TreeReports.Items.Clear;

  While Not DtmBaseDados.Qry.Eof Do
  Begin
     If SoldGrupo <> DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString Then
     Begin
      TreeGrupo               := TreeReports.Items.AddChild(nil,DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString);
      TreeGrupo.ImageIndex    := 3;
      TreeGrupo.SelectedIndex := 3;
      TreeGrupo.StringData    := DtmBaseDados.Qry.FieldByName('IdReports').AsString;
      TreeGrupo.StringData2   := DtmBaseDados.Qry.FieldByName('OrigemCm').AsString;
     End;

     TreeFilho                := TreeReports.Items.AddChild(TreeGrupo,DtmBaseDados.Qry.FieldByName('NAME').AsString);
     TreeFilho.ImageIndex     := 1;
     TreeFilho.SelectedIndex  := 2;
     TreeFilho.StringData     := DtmBaseDados.Qry.FieldByName('IdReports').AsString;
     TreeFilho.StringData2    := DtmBaseDados.Qry.FieldByName('OrigemCm').AsString;

     sOldGrupo := DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString;
     DtmBaseDados.Qry.Next;
  End;
  DtmBaseDados.Qry.Close;
end;


procedure TFrmConfigRelatCM.TreeReportsCheckValidItem(Sender: TObject;
  Node: TfcTreeNode; var Accept: Boolean);
begin
  inherited;
  Accept := (Node.ImageIndex = 1);
end;

procedure TFrmConfigRelatCM.BtnAlteraClick(Sender: TObject);
Var
  dtm: TdtmReports;
  rpt: TppReport;
  sNomeReport: String;
  aRpt: TMemoryStream;
begin
  inherited;
  If (TreeReports.SelectedNode <> nil) And
     (Trim(TreeReports.Text) <> '') Then
  Begin
    If Not TFrmCMPrincipalForms(Application.MainForm).AppPadrao.ConfigReport(StrToInt(TreeReports.SelectedNode.StringData), StrToInt(TreeReports.SelectedNode.StringData2), DesReport) Then
    Begin
      If CdsReports.Active       Then CdsReports.Close;

      SQLReports.Prepare;
      SQLReports.ParamByName('IDREPORTS').AsInteger := StrToInt(TreeReports.SelectedNode.StringData);
      SQLReports.ParamByName('ORIGEMCM').AsInteger  := StrToInt(TreeReports.SelectedNode.StringData2);
      SQLReports.Open;

      dtm := TdtmReports(Application.FindComponent(CdsReports.FieldByName('FORMEVENTOS').AsString));
      If dtm <> nil Then
      Begin
         rpt := TppReport(dtm.FindComponent(CdsReports.FieldByName('PPREPORT').AsString));
         aRpt := TMemoryStream.Create;

         If rpt <> nil Then
         Begin
           DesReport.Report                   := rpt;
           DesReport.Report.Template.SaveTo   := stFile;
            // início - andre tavares - pendência 17810 - 07/01/2005
            //DesReport.Report.Template.Format := ftAscii;
           DesReport.Report.Template.Format := ftBinary;
            // fim - andre tavares - pendência 17810
           //DesReport.Report.Template.Format   := ftBinary;
           DesReport.Report.Template.FileName := '';


           aRpt.Clear;
           DesReport.Report.Template.SaveToStream(aRpt);

           DesReport.ShowModal;

           If (MsgDlg('Confirma a alteração do relatório ?','Configuração de Relatórios',mtConfirmation, [mbYes,mbNo],0)=mrYes) Then
           Begin
              sNomeReport   := TreeReports.Text;
              If InputQuery('Configuração de Relatórios','Nome do Relatório',sNomeReport) Then
              Begin
                 If (Trim(sNomeReport) = '') Then
                    sNomeReport   := TreeReports.Text;
              End
              Else
                 sNomeReport   := TreeReports.Text;

              sNomeReport := Trim(sNomeReport);

              aRpt.Clear;
              DesReport.Report.Template.SaveToStream(aRpt);

              With TCtrlConfigreportscm.Create Do
                Try
                   InitializeAs(Padroes);
                   OpenCds(StrToInt(TreeReports.SelectedNode.StringData), StrToInt(TreeReports.SelectedNode.StringData2), Sistema.IdEmpresa);

                   If CdsReports.IsEmpty Then
                      CdsReports.Append
                   Else
                      CdsReports.Edit;

                   CdsReports.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
                   CdsReports.FieldByName('IDREPORTS').AsFloat  := StrToInt(TreeReports.SelectedNode.StringData);
                   CdsReports.FieldByName('ORIGEMCM').AsFloat   := StrToInt(TreeReports.SelectedNode.StringData2);
                   CdsReports.FieldByName('DESCRICAO').AsString := Trim(sNomeReport);

                   aRpt.Position := 0;
                   TBlobField(CdsReports.FieldByName('TEMPLATE')).LoadFromStream(aRpt);

                   CdsReports.Post;

                   If Not ProcessaConfigModelo Then
                      MsgDlg(MessageInfo,'Erro', mtError, [ mbOk ], 0);

                Finally
                   Free;
                End;
           End
           Else
           Begin
              aRpt.Position := 0;
              DesReport.Report.Template.LoadFromStream(aRpt)
           End;

           aRpt.Free;

           If sNomeReport <> TreeReports.Text Then TreeReports.SelectedNode.Text := sNomeReport;
         End;
      End;
    End;

    MontaArvoreRelatorio;
    TreeReports.Clear;
  End;

end;

procedure TFrmConfigRelatCM.DesReportCreateComponent(Sender: TObject;
  Component: TComponent);
begin
  inherited;
  Component.Tag := 1;
end;

procedure TFrmConfigRelatCM.BtnRestauraClick(Sender: TObject);
begin
  inherited;
  If (TreeReports.SelectedNode <> nil) And
     (Trim(TreeReports.Text) <> '') And 
     (MsgDlg('Deseja Restaurar o Desenho Original do Relatório Selecionado?','Configuração de Relatórios',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
  Begin
     If Padroes.ExecSqlAndCommit('DELETE FROM CONFIGREPORTSCM WHERE IDREPORTS = ' + TreeReports.SelectedNode.StringData + ' AND ORIGEMCM = ' + TreeReports.SelectedNode.StringData2 + ' AND IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)) Then
        MsgDlg('Desenho Restaurado com sucesso!' + (#13+#10) + 'Para que as alterações seja aplicadas favor reiniciar seu aplicativo','Aviso',mtInformation,[mbOk],0)
     Else
        MsgDlg('Não Foi Possível restaurar o Desenho do Relatório Selecionado.' + (#13+#10) + Padroes.MessageInfo,'Aviso',mtError,[mbOk],0);
  End;
end;

procedure TFrmConfigRelatCM.mniFilePageSetupClick(Sender: TObject);
var
  lPageSetupDlg: TppCustomPageSetupDialog;
  lFormClass: TFormClass;
begin
  Inherited;

  if (DesReport.CurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPageSetupDialog);
  lPageSetupDlg := TppCustomPageSetupDialog(lFormClass.Create(Self));

  lPageSetupDlg.Report := DesReport.CurrentReport;
  lPageSetupDlg.ShowModal;

  lPageSetupDlg.Free;
end;

procedure TFrmConfigRelatCM.mniFilePrintToFileSetupClick(Sender: TObject);
var
  lTextFileDialog: TppCustomPrintToFileSetupDialog;
  lFormClass: TFormClass;
begin
  Inherited;
  if (DesReport.CurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPrintToFileSetupDialog);

  lTextFileDialog := TppCustomPrintToFileSetupDialog(lFormClass.Create(Self));

  lTextFileDialog.Report := DesReport.Report;
  lTextFileDialog.CurrentReport := DesReport.CurrentReport;
  lTextFileDialog.ShowModal;

  lTextFileDialog.Free;
end;

procedure TFrmConfigRelatCM.Sair1Click(Sender: TObject);
begin
  inherited;
  DesReport.Close;
end;

procedure TFrmConfigRelatCM.DesReportValidateComponent(Sender: TObject;
  Component: TComponent; var Valid: Boolean);
begin
  inherited;
  If (Component is TppSubReport) Then
  Begin
     Valid := False;
     MsgDlg('Não é Possível inserir Sub-Relatórios.','Configuração de Relatórios',mtError,[mbOk],0);     
  End;
end;


procedure TFrmConfigRelatCM.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
   // SOL 148922/8841  - Jonas Otavio
   if  (Sistema.IdModulo        = 15)  then
      begin
           Application.HelpContext(230101)
      end;
end;

end.
