unit FConfSimulaDeslig;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor       : Paulo Ramos
// Data        : 17/04/2007
// Rotina      : qryDetAfterScroll
// Pendência   : 24983
// Alteração   : Evita erro na qryReservaAss quando qryDet está vazio. 
//------------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, DBCtrls, Mask, wwdbedit, uCMTypes, wwdblook,
  UMensErro, USistema, UDataBase, TB97Tlwn, ppModule, raCodMod, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB,
  ppRelatv, ppDBPipe, ppDBBDE, ppComm, ppEndUsr, Wwdotdot, Wwdbcomb,
  Wwdbspin, ppParameter;

type
  TFrmConfSimulaDeslig = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    edtNomePlano: TEdit;
    qryEventos: TwwQuery;
    qryAux: TwwQuery;
    tbsDetRes: TTabSheet;
    pnlDet2: TPanel;
    Label4: TLabel;
    dblkReservaAssoc: TwwDBLookupCombo;
    dbgReservaAssociada: TwwDBGrid;
    ToolWindow971: TToolWindow97;
    edtNomeEvento: TEdit;
    qryReservas: TwwQuery;
    qryReservaAss: TwwQuery;
    dsReservaAss: TwwDataSource;
    updReservaAss: TUpdateSQL;
    tbsLayout: TTabSheet;
    DsgnCM: TppDesigner;
    qryExtSimDeslig: TwwQuery;
    dsExtSimDeslig: TwwDataSource;
    ppExtSimDeslig: TppBDEPipeline;
    rpExtSimDeslig: TppReport;
    pnlLayout: TPanel;
    pnlBotao: TPanel;
    btnDesenho: TBitBtn;
    memLog: TRichEdit;
    qryRegra: TwwQuery;
    pgcConfigura: TPageControl;
    tbsDadosPrincipais: TTabSheet;
    TabSheet2: TTabSheet;
    dbcRodaRegraEleg: TDBCheckBox;
    dblcEventoGerador: TwwDBLookupCombo;
    Label2: TLabel;
    dbcCategoria: TwwDBComboBox;
    Label3: TLabel;
    Label6: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label7: TLabel;
    dblkpcmbRegDataBPD: TwwDBLookupCombo;
    Label5: TLabel;
    dbeNomeCampo1: TDBEdit;
    dbeNomeCampo2: TDBEdit;
    dbeOrdem: TwwDBSpinEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    btnQuery: TBitBtn;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel24: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText45: TppDBText;
    ppLabel63: TppLabel;
    ppDBText54: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel27: TppLabel;
    ppDBText32: TppDBText;
    ppLabel29: TppLabel;
    ppDBText35: TppDBText;
    ppLabel33: TppLabel;
    ppDBText36: TppDBText;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel11: TppLabel;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText11: TppDBText;
    ppShape3: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppShape4: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText15: TppDBText;
    ppShape5: TppShape;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppLabel18: TppLabel;
    ppDBText2: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText3: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppDBText20: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure dblkReservaAssocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcEventoGeradorExit(Sender: TObject);
    procedure tbsLayoutShow(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure btnDesenhoClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbcCategoriaCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    OperacaoDetalhe  : TOperacao;
    bCriaTemplate    : Boolean;
    { Public declarations }
  end;

var
  FrmConfSimulaDeslig: TFrmConfSimulaDeslig;

implementation

uses FMostraAux;

{$R *.DFM}

procedure TFrmConfSimulaDeslig.FormShow(Sender: TObject);
begin
  inherited;
  // Inicialização das Variaveis
  edtNomePlano.Text := '';

  // Inicialização das queries
  qry.ParamByName('PIDPLANOPREV').AsInteger := -1;
  qry.Open;

  qryDet.ParamByName('PIDPLANOPREV').AsInteger := -1;
  qryDet.Open;

  qryEventos.Open;

  qryRegra.Open;

  // Apresentação
  dbgrdDet.BringToFront;
  pgcConfigura.ActivePage := tbsDadosPrincipais;
  dbgReservaAssociada.BringToFront;
  pgctrlDetalhe.ActivePage := tbsDet;
  pnlLayout.Enabled        := False;
end;

procedure TFrmConfSimulaDeslig.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor
   Then Begin
     qry.Close;
     qry.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qryDet.Open;

     qryReservas.Close;
     qryReservas.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qryReservas.Open;

     qryReservaAss.Close;
     qryReservaAss.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qryReservaAss.Open;

     edtNomePlano.Text := qry.FieldByName('NOME').AsString;
     pnlLayout.Enabled        := False;
   End;
end;

procedure TFrmConfSimulaDeslig.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  OperacaoDetalhe := opInserir;
  If pgctrlDetalhe.ActivePage = tbsDet
   Then Begin
     qryDet.FieldByName('IDCFGSIMULADESLIG').AsInteger := LeUltRegistro(nil,'CFGSIMULADESLIG');
     qryDet.FieldByName('IDPLANOPREV').AsInteger       := qry.FieldByName('IDPLANOPREV').AsInteger;
     qryDet.FieldByName('FLGRODAELEG').AsInteger       := 0;
   End
   Else Begin
     qryReservaAss.FieldByName('IDRESERVADESLIG').AsInteger   := LeUltRegistro(nil,'CFGSIMULADESLIG');
     qryReservaAss.FieldByName('IDCFGSIMULADESLIG').AsInteger := qryDet.FieldByName('IDCFGSIMULADESLIG').AsInteger;
   End;
end;

procedure TFrmConfSimulaDeslig.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  If qryDet.State in [dsEdit, dsInsert, dsBrowse]
   Then AplicaAlteracoes([qryDet, qryReservaAss])
   Else AplicaAlteracoes([qryReservaAss, qryDet]);
  pnlLayout.Enabled := True;
end;

procedure TFrmConfSimulaDeslig.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('NOMEEVENTO').AsString := dblcEventoGerador.Text;
  edtNomeEvento.Text := qryEventos.FieldByName('NOME').AsString;
end;

procedure TFrmConfSimulaDeslig.bbtnOkDetClick(Sender: TObject);
begin
  If pgctrlDetalhe.ActivePage = tbsDet
   Then Begin
    If Trim(dblcEventoGerador.Text) = ''
     Then Begin
       MsgDlg('É necessário o preenchimento do Evento Gerador!!','ATENÇÃO',mtWarning,[mbOK],0);
       dblcEventoGerador.SetFocus;
     End;

    If Trim(dbeOrdem.Text) = ''
     Then Begin
       MsgDlg('É necessário o preenchimento do Sequencia de apresentação no relatório!!','ATENÇÃO',mtWarning,[mbOK],0);
       dbeOrdem.SetFocus;
     End;

   End
   Else Begin
    If Trim(dblkReservaAssoc.Text) = ''
     Then Begin
       MsgDlg('É necessário informar a reserva a ser associada ao evento.!!','ATENÇÃO',mtWarning,[mbOK],0);
       dblkReservaAssoc.SetFocus;
     End;
   End;
  inherited;
end;

procedure TFrmConfSimulaDeslig.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If qryDet.State = dsInsert
   Then Begin
     edtNomeEvento.Text := '';
     Exit;
   End;
  edtNomeEvento.Text := qryEventos.FieldByName('NOME').AsString;

  If not qryDet.isempty Then //P.RAMOS-17/04/2007-PEND.24983
    If qryReservaAss.Active Then
    Begin
      qryReservaAss.Filtered := False;
      qryReservaAss.Filter   := 'IDCFGSIMULADESLIG = '+qryDet.FieldByName('IDCFGSIMULADESLIG').AsString;
      qryReservaAss.Filtered := True;
      qryReservaAss.First;
    End;
end;

procedure TFrmConfSimulaDeslig.dblkReservaAssocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If qryReservaAss.State = dsInsert
   Then Begin
     qryReservaAss.FieldByName('CODHIERARQUIA').AsString := qryReservas.FieldByName('CODHIERARQUIA').AsString;
     qryReservaAss.FieldByName('NOME').AsString          := qryReservas.FieldByName('NOME').AsString;
   End;
end;

procedure TFrmConfSimulaDeslig.dblcEventoGeradorExit(Sender: TObject);
begin
  inherited;
  If qryDet.State = dsInsert
   Then Begin
     edtNomeEvento.Text := qryEventos.FieldByName('NOME').AsString;

     If qryReservaAss.Active
      Then Begin
        qryReservaAss.Filtered := False;
        qryReservaAss.Filter   := 'IDCFGSIMULADESLIG = '+qryDet.FieldByName('IDCFGSIMULADESLIG').AsString;
        qryReservaAss.Filtered := True;
        qryReservaAss.First;
      End;
   End;
end;

procedure TFrmConfSimulaDeslig.tbsLayoutShow(Sender: TObject);
begin
  inherited;
  btnDesenho.Height := ((pnlBotao.Height div 2)-1);
  btnQuery.Height   := ((pnlBotao.Height div 2)-1);
  btnDesenho.Width  := (pnlBotao.Width-3);
  btnQuery.Width    := (pnlBotao.Width-3);

  btnDesenho.Top    := btnQuery.Height;
end;

procedure TFrmConfSimulaDeslig.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  OperacaoDetalhe := opAlterar;
end;

procedure TFrmConfSimulaDeslig.btnDesenhoClick(Sender: TObject);
Var
  sNomeArqOrig,
  sNomeArqNovo    : String;
  fTemplateOrig,
  fTemplateNovo   : TStrings;
begin
  inherited;

  qryDet.First;
  While Not qryDet.Eof do
  Begin
   If Not qryDet.FieldByName('TEMPLATE').IsNull
   Then Break;

   qryDet.Next;
  End;

  sNomeArqOrig     := Sistema.TempDir + 'relsdo.tcm';
  sNomeArqNovo     := Sistema.TempDir + 'relsdn.tcm';
  fTemplateOrig    := TStringList.Create;
  fTemplateNovo    := TStringList.Create;
  fTemplateOrig.Clear;
  fTemplateNovo.Clear;

  // Guarda a Template Original
  DsgnCM.Report.Template.FileName := sNomeArqOrig;
  DsgnCM.Report.Template.SaveToFile;
  fTemplateOrig.LoadFromFile(sNomeArqOrig);

  // Caso Haja template modificada carrega em um arquivo e deste para o Report
  If Not qryDet.FieldByName('TEMPLATE').IsNull
   Then Begin
      fTemplateNovo.Add(qryDet.FieldByName('TEMPLATE').AsString);
      fTemplateNovo.SaveToFile(sNomeArqNovo);

      rpExtSimDeslig.Template.DatabaseSettings.Name := 'Personalização de Relatório para o plano '+edtNomePlano.Text;
      DsgnCM.Report.Template.FileName               := sNomeArqNovo;
      DsgnCM.Report.Template.LoadFromFile;
   End;

  qryExtSimDeslig.Open;

  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger    := Sistema.IdEmpresa;
  qryFundacao.Open;

  DsgnCM.ShowModal;

  DsgnCM.Report.Template.FileName                   := sNomeArqNovo;
  DsgnCM.Report.Template.SaveToFile;

  fTemplateNovo.Clear;
  fTemplateNovo.LoadFromFile(sNomeArqNovo);

  // Se houve modificações então grava no banco
  If MessageDlg('Deseja salvar o relatório personalizado no banco ?', mtConfirmation,[mbYes, mbNo],0) = mrYes
   Then Begin
     qryDet.Edit;
     TBlobField(qryDet.FieldByName('TEMPLATE')).LoadFromFile(sNomeArqNovo);
     qryDet.Post;
   End;

  DsgnCM.Report.Template.FileName                   := sNomeArqOrig;
  DsgnCM.Report.Template.LoadFromFile;

  fTemplateOrig.Free;
  fTemplateNovo.Free;

  If FileExists(sNomeArqOrig) Then  DeleteFile(sNomeArqOrig);
  If FileExists(sNomeArqNovo) Then  DeleteFile(sNomeArqNovo);
end;

procedure TFrmConfSimulaDeslig.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlLayout.Enabled := True;
end;

procedure TFrmConfSimulaDeslig.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlLayout.Enabled := False;
end;

procedure TFrmConfSimulaDeslig.dbcCategoriaCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  inherited;
  If dbcCategoria.ItemIndex <> 1
  Then dblkpcmbRegDataBPD.LookupValue := '0';

  dblkpcmbRegDataBPD.Enabled := (dbcCategoria.ItemIndex = 1);
end;

procedure TFrmConfSimulaDeslig.btnQueryClick(Sender: TObject);
Var
  sSql : String;
begin
  inherited;
  qryDet.First;

  While Not qryDet.Eof do
  Begin
   If Not qryDet.FieldByName('TEMPLATE').IsNull
   Then Break;

   qryDet.Next;
  End;

  If Trim(qryDet.FieldByName('CONSULTA').AsString) <> ''
  Then sSql := qryDet.FieldByName('CONSULTA').AsString
  Else sSql := qryExtSimDeslig.SQL.GetText;

  frmMostraAux.Caption := 'Consulta do Relatório de Extrato de Desligamento';

  frmMostraAux.memResult.Lines.Clear;

  frmMostraAux.memResult.Lines.Add(sSql);

  frmMostraAux.memResult.ReadOnly    := False;

  frmMostraAux.bbtnSalvar.Visible    := False;

  frmMostraAux.bbtnImprimir.Visible  := False;

  frmMostraAux.ShowModal;

  If sSql <> frmMostraAux.memResult.Lines.Text
  Then
    If MessageDlg('Deseja salvar a consulta (QUERY) modificada no banco ?', mtConfirmation,[mbYes, mbNo],0) = mrYes
    Then Begin
      qryDet.Edit;
      qryDet.FieldByName('CONSULTA').AsString := frmMostraAux.memResult.Lines.GetText;
      qryDet.Post;

      qryExtSimDeslig.SQL.Text := frmMostraAux.memResult.Lines.GetText;
    End;
end;

end.
