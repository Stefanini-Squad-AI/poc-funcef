///////////////////////////////
// ClaudioR - 20-06-2006
// Foi incluido um visualizador das regras cadastradas por meio de TreeView
// CM nº 21453 / SOL nº 40240
///////////////////////////////

unit FCadRegrasTabuaServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, DBTables, Db, Wwquery, DBClient, StdCtrls, wwdblook,
  CMDBLookupCombo, cmseldlg, wwDialog, wwidlg, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, DBCtrls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask,
  wwdbedit, ComCtrls, MontaSelect;

type
  TfrmCadRegrasTabuaServico = class(TfrmCadastroGrid)
    Label3: TLabel;
    Label6: TLabel;
    CMDBLookupCombo1: TCMDBLookupCombo;
    CMDBLookupCombo2: TCMDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Label5: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label2: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    ClntDtStCondicaoAjuste: TClientDataSet;
    qryLkpRotinaCalculo: TwwQuery;
    qryLkpRotinaCalculoDS_GRUPO_FORMULA: TStringField;
    qryLkpRotinaCalculoCD_GRUPO_FORMULA: TFloatField;
    qryLkpRotinaCalculoIR_GRUPO_CALCULO: TStringField;
    qryLkpAjusteCalculo: TwwQuery;
    qryLkpAjusteCalculoNO_FORMULA: TStringField;
    qryLkpAjusteCalculoCD_FORMULA: TFloatField;
    qryLkpAjusteCalculoDS_FORMULA: TMemoField;
    qryLkpAjusteCalculoNO_VARIAVEL_RESULT: TStringField;
    qryLkpAjusteCalculoNO_VARIAVEL_INICIAL: TStringField;
    qryLkpAjusteCalculoNO_VARIAVEL_FINAL: TStringField;
    qryLkpAjusteCalculoIR_GRUPO_FORMULA: TStringField;
    QryLkpVersaoTabuaServico: TwwQuery;
    QryLkpVersaoTabuaServicoDS_VERSAO_COMUTACAO: TStringField;
    QryLkpVersaoTabuaServicoSQ_VERSAO_COMUTACAO: TFloatField;
    QryLkpVersaoTabuaServicoCD_TABUA_ROTATIV: TFloatField;
    QryLkpVersaoTabuaServicoCD_TABUA_ENTRADA_INVALID: TFloatField;
    QryLkpVersaoTabuaServicoCD_TABUA_INVALID: TFloatField;
    QryLkpVersaoTabuaServicoCD_TABUA_MORTAL: TFloatField;
    QryLkpVersaoTabuaServicoIR_VERSAO_COMUTACAO: TStringField;
    QryLkpVersaoTabuaServicoDT_GERACAO: TDateTimeField;
    QryLkpVersaoTabuaServicoTRGDTINCLUSAO: TDateTimeField;
    QryLkpVersaoTabuaServicoTRGUSERINCLUSAO: TStringField;
    QryLkpFormula: TwwQuery;
    QryLkpFormulaNO_FORMULA: TStringField;
    QryLkpFormulaCD_FORMULA: TFloatField;
    QryLkpFormulaDS_FORMULA: TMemoField;
    QryLkpFormulaNO_VARIAVEL_RESULT: TStringField;
    QryLkpFormulaNO_VARIAVEL_INICIAL: TStringField;
    QryLkpFormulaNO_VARIAVEL_FINAL: TStringField;
    QryLkpFormulaIR_GRUPO_FORMULA: TStringField;
    QryLkpFormulaNR_ORDEM_FORMULA: TFloatField;
    dsLkpRotinaCalculo: TwwDataSource;
    QryPrincipal: TwwQuery;
    QryPrincipalSQ_VERSAO_COMUTACAO: TFloatField;
    QryPrincipalCD_GRUPO_FORMULA: TFloatField;
    QryPrincipalCD_FORMULA: TFloatField;
    QryPrincipalNR_ORDEM_FORMULA: TFloatField;
    QryPrincipalCD_FORMULA_AJUSTE: TFloatField;
    QryPrincipalIR_CONDICAO_AJUSTE: TStringField;
    QryPrincipalTRGDTINCLUSAO: TDateTimeField;
    QryPrincipalTRGUSERINCLUSAO: TStringField;
    QryPrincipallkpFORMULA: TStringField;
    QryPrincipallkpFORMULA_AJUSTE: TStringField;
    QryPrincipallkpCONDICAO_AJUSTE: TStringField;
    upSQL: TUpdateSQL;
    Label1: TLabel;
    QryPrincipallkpVERSAO: TStringField;
    QryPrincipallkpROTINA_CALCULO: TStringField;
    PnlLookup: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    dsLkpFormula: TDataSource;
    dsLkpAjusteCalculo: TDataSource;
    dsCondicaoAjuste: TDataSource;
    qryLkpAjusteCalculocalcDS_FORMULA: TStringField;
    QryLkpFormulacalcDS_FORMULA: TStringField;
    wwDBEdit1: TwwDBEdit;
    Label9: TLabel;
    QryPrincipalNR_IDADE: TFloatField;
    ClntDtStCondicaoAjusteIR_CONDICAO_AJUSTE: TStringField;
    ClntDtStCondicaoAjusteDS_CONDICAO_AJUSTE: TStringField;
    qryLkpRotinaCalculoDS_OBSERV_FORMULA: TMemoField;
    trvRegras: TTreeView;
    ImageList1: TImageList;
    MontaSelect: TMontaSelect;
    sbtnDuplicar: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure qryLkpAjusteCalculoCalcFields(DataSet: TDataSet);
    procedure trvRegrasChange(Sender: TObject; Node: TTreeNode);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure trvRegrasClick(Sender: TObject);
  private
    { Private declarations }
    function  GetFieldList: TStringList;
  public
    { Public declarations }
    procedure Atualiza_TreeView;
  end;

var
  frmCadRegrasTabuaServico: TfrmCadRegrasTabuaServico;
  FieldList:TStringList;
  bLibera_Botao:Boolean;

implementation

uses TreeFunc, FDuplicaRegrasTabuaServico;

{$R *.DFM}

procedure TfrmCadRegrasTabuaServico.Atualiza_TreeView;
Var w_i:Integer;
Begin
   trvRegras.Items.BeginUpdate;
   QryPrincipal.first;
   while not QryPrincipal.eof do
   begin
      TreeAddItem(trvRegras, GetFieldList, QryPrincipal.GetBookmark, false);
      QryPrincipal.next;
   end;
   trvRegras.Alphasort;
   trvRegras.items.Endupdate;

   For w_i:=0 to trvRegras.Items.Count-1 Do
   Begin
      If trvRegras.items[w_i].Level < 3 Then
         trvRegras.items[w_i].ImageIndex := 0
      Else
         trvRegras.items[w_i].ImageIndex := 1;

      trvRegras.items[w_i].SelectedIndex := trvRegras.items[w_i].ImageIndex;
      trvRegras.items[w_i].StateIndex    := trvRegras.items[w_i].ImageIndex;
   End;
End;

function TfrmCadRegrasTabuaServico.GetFieldList: TStringList;
begin
   FieldList.clear;

   If (QryPrincipal.FieldByName('lkpRotina_Calculo').AsString <> ' ') Then
        FieldList.add(Trim(QryPrincipal.FieldByName('lkpRotina_Calculo').AsString));

   If (QryPrincipal.FieldByName('lkpVersao').AsString <> ' ') Then
        FieldList.add(Trim(QryPrincipal.FieldByName('lkpVersao').AsString));

   If (QryPrincipal.FieldByName('lkpFormula').AsString <> ' ') Then
        FieldList.add(Trim(QryPrincipal.FieldByName('lkpFormula').AsString));

   If (QryPrincipal.FieldByName('NR_IDADE').AsString <> ' ') Then
        FieldList.add(Trim(QryPrincipal.FieldByName('lkpCONDICAO_AJUSTE').AsString +
                           ' - ' + QryPrincipal.FieldByName('NR_IDADE').AsString)  +
                           ' Alterar Para ' +
                           QuotedStr(QryPrincipal.FieldByName('lkpFormula_AJUSTE').AsString));

   Result := FieldList;
end;

procedure TfrmCadRegrasTabuaServico.FormCreate(Sender: TObject);
begin
   ClntDtStCondicaoAjuste.CreateDataSet;
   ClntDtStCondicaoAjuste.AppendRecord(['Z', 'Valor Zero']);
   ClntDtStCondicaoAjuste.AppendRecord(['N', 'Valor Negativo']);
   ClntDtStCondicaoAjuste.AppendRecord(['I', 'A partir da Idade']);

   qryLkpRotinaCalculo.Open;
   qryLkpAjusteCalculo.Open;
   QryLkpVersaoTabuaServico.Open;

   inherited;

   FieldList := TStringList.create;
   Atualiza_TreeView;
   FieldList.clear;     
end;

procedure TfrmCadRegrasTabuaServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClntDtStCondicaoAjuste.Close;
  qryLkpRotinaCalculo.Close;
  qryLkpAjusteCalculo.Close;
  QryLkpVersaoTabuaServico.Close;

  inherited;
end;

procedure TfrmCadRegrasTabuaServico.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  if TwwQuery(DataSet).UpdatesPending then
   begin
     TwwQuery(DataSet).ApplyUpdates;
     TwwQuery(DataSet).CommitUpdates;
   end;

   trvRegras.Items.Clear;
   Atualiza_TreeView;
end;

procedure TfrmCadRegrasTabuaServico.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnCancelar.Click;
end;

procedure TfrmCadRegrasTabuaServico.QryPrincipalBeforePost(DataSet: TDataSet);
begin
   QryPrincipalNR_ORDEM_FORMULA.asInteger := QryLkpFormulaNR_ORDEM_FORMULA.asInteger;
end;

procedure TfrmCadRegrasTabuaServico.dsStateChange(Sender: TObject);
begin
   PnlLookup.Visible := not (QryPrincipal.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadRegrasTabuaServico.qryLkpAjusteCalculoCalcFields(DataSet: TDataSet);
begin
   TwwQuery(DataSet).FieldByName('calcDS_FORMULA').asString := TwwQuery(DataSet).FieldByName('NO_VARIAVEL_RESULT').asString +
                                                               ' - ' + TwwQuery(DataSet).FieldByName('NO_FORMULA').asString;
end;

procedure TfrmCadRegrasTabuaServico.trvRegrasChange(Sender: TObject;
  Node: TTreeNode);
begin
   ds.enabled := Node.data <> nil;
   bLibera_Botao := ds.enabled;

   If ds.enabled then
      QryPrincipal.GotoBookmark(node.data);
end;

procedure TfrmCadRegrasTabuaServico.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   trvRegras.Visible := False;
end;

procedure TfrmCadRegrasTabuaServico.sbtnAlterarClick(Sender: TObject);
begin
   If Not ds.enabled Then
   Begin
      sbtnAlterar.Down := False;
      Exit;
   End;

   inherited;
   trvRegras.Visible := False;
end;

procedure TfrmCadRegrasTabuaServico.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   trvRegras.Visible := True;
end;

procedure TfrmCadRegrasTabuaServico.bbtnSairClick(Sender: TObject);
begin
   inherited;
   trvRegras.Visible := True;
end;

procedure TfrmCadRegrasTabuaServico.sbtnProcurarClick(Sender: TObject);
Var Temp:String;
    Node: TTreeNode;
begin
   //inherited;

   MontaSelect.Executar;

   If (MontaSelect.ValoresChave.Count > 0) and
      (MontaSelect.ValoresChave[0] <> '') then
      QryPrincipal.Locate('SQ_VERSAO_COMUTACAO; CD_GRUPO_FORMULA; CD_FORMULA',
                          VarArrayOf([MontaSelect.ValoresChave[0],
                                      MontaSelect.ValoresChave[1],
                                      MontaSelect.ValoresChave[2] ]), []);

   sbtnProcurar.Down := False;

   trvRegras.Items.Clear;
   Atualiza_TreeView;
end;

procedure TfrmCadRegrasTabuaServico.sbtnApagarClick(Sender: TObject);
begin
   If Not ds.enabled Then
   Begin
      sbtnApagar.Down := False;
      Exit;
   End;

   inherited;
end;

procedure TfrmCadRegrasTabuaServico.sbtnDuplicarClick(Sender: TObject);
Var bErro:Boolean;
begin
  inherited;

  bErro := True;

  If qryLkpVersaoTabuaServico.Locate('DS_VERSAO_COMUTACAO', trvRegras.Selected.Text, []) Then
    berro := False;

  If qryLkpRotinaCalculo.Locate('DS_GRUPO_FORMULA', trvRegras.Selected.Parent.Text, []) Then
    bErro := False;

  If Not bErro Then
    DuplicaRegrasTabuaServico(qryLkpVersaoTabuaServicoSQ_VERSAO_COMUTACAO.AsInteger, trvRegras.Selected.Text,
                              qryLkpRotinaCalculoCD_GRUPO_FORMULA.AsInteger, trvRegras.Selected.Parent.Text);

  sbtnDuplicar.Down := False;
end;

procedure TfrmCadRegrasTabuaServico.trvRegrasClick(Sender: TObject);
Var iTabua, iRotina:Integer;
begin
  inherited;

  sbtnDuplicar.Enabled := False;
  If trvRegras.Selected.Level = 1 Then
  Begin
    sbtnDuplicar.Enabled := True;
  End;
end;

end.
