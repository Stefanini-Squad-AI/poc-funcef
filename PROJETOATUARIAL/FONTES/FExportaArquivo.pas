unit FExportaArquivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, FileCtrl, Mask, checklst, Db,
  Wwdatsrc, DBTables, Wwquery, Grids, DBGrids;

type
  TfrmExportaArquivo = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    DrveCmbBxDrive: TDriveComboBox;
    DrctryLstBxDiret: TDirectoryListBox;
    Label7: TLabel;
    EdtNomeArquivo: TEdit;
    GrpBxLayoutArquivo: TGroupBox;
    DBLkpCmbBxLayout: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    ChckLstBxGrupoPartic: TCheckListBox;
    qryVersaoBase: TwwQuery;
    dsVersaoBase: TwwDataSource;
    qryVersaoBaseCD_VERSAO: TFloatField;
    qryVersaoBaseDS_VERSAO: TStringField;
    qryVersaoBaseLOGIN: TStringField;
    qryVersaoBaseDT_REFER_BASE: TDateTimeField;
    qryVersaoBaseCD_PESSOA_PATROC: TFloatField;
    qryVersaoBaseNO_PESSOA_PATROC: TStringField;
    qryVersaoBaseCD_PESSOA_ENTID: TFloatField;
    qryVersaoBaseNO_PESSOA_ENTID: TStringField;
    qryVersaoBaseCD_PLANO: TFloatField;
    qryVersaoBaseNO_PLANO: TStringField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    BitBtn1: TBitBtn;
    qryVersaoBaseDT_GERACAO: TDateTimeField;
    qryLayout: TwwQuery;
    qryLayoutCD_ARQUIVO: TFloatField;
    qryLayoutNO_ARQUIVO: TStringField;
    dsLayout: TwwDataSource;
    qryGrupoPartic: TwwQuery;
    wwDataSource1: TwwDataSource;
    qryGrupoParticCD_GRUPO_PARTIC: TFloatField;
    qryGrupoParticNO_GRUPO_PARTIC: TStringField;
    LblDiretorio: TLabel;
    GroupBox2: TGroupBox;
    PnlOrdem: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBLkpListBxGrupoAtributo: TDBLookupListBox;
    qryGrupoLogico: TwwQuery;
    qryGrupoLogicoCD_GRUPO: TFloatField;
    qryGrupoLogicoNO_GRUPO: TStringField;
    qryGrupoLogicoNR_ORDEM: TFloatField;
    dsGrupoLogico: TwwDataSource;
    BtnAdicionar: TBitBtn;
    BtnRetirar: TBitBtn;
    LstBxOrdemCampos: TListBox;
    BitBtn6: TBitBtn;
    dsGrupoAtributo: TwwDataSource;
    qryGrupoAtributo: TwwQuery;
    qryGrupoAtributoCHAVE: TStringField;
    qryGrupoAtributoNO_TABELA: TStringField;
    qryGrupoAtributoNO_ATRIBUTO_TABELA: TStringField;
    qryGrupoAtributoDS_ATRIBUTO_TABELA: TStringField;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure qryVersaoBaseBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryGrupoParticAfterOpen(DataSet: TDataSet);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnRetirarClick(Sender: TObject);
    function Get_Ordem_Campos: String;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBLkpListBxGrupoAtributoDblClick(Sender: TObject);
  private
    { Private declarations }
    lstOrdem_Campos: TStringList;
  public
    { Public declarations }
  end;

var
  frmExportaArquivo: TfrmExportaArquivo;

implementation

uses FTelaAut, uVersaoBase, uGlobal, FPrincipal, uValidaLayout, uExporta, FmxUtils;

{$R *.DFM}

procedure TfrmExportaArquivo.FormShow(Sender: TObject);
begin
  inherited;
  lstOrdem_Campos := TStringList.Create;

  qryVersaoBase.Open;
  qryLayout.Open;
  qryGrupoPartic.Open;

  qryGrupoLogico.Open;
  qryGrupoAtributo.Open;
end;

procedure TfrmExportaArquivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  lstOrdem_Campos.Free;

  qryVersaoBase.Close;
  qryLayout.Close;
  qryGrupoPartic.Close;

  qryGrupoLogico.Close;
  qryGrupoAtributo.Close;

  inherited;
end;

procedure TfrmExportaArquivo.BitBtn1Click(Sender: TObject);
begin
  frmPrincipal.mniVersaoBaseTrabClick(frmPrincipal.mniVersaoBaseTrab);
end;

procedure TfrmExportaArquivo.qryVersaoBaseBeforeOpen(DataSet: TDataSet);
begin
  qryVersaoBase.ParamByName('CD_VERSAO').AsInteger := WG_CD_VERSAO;
end;

procedure TfrmExportaArquivo.FormActivate(Sender: TObject);
begin
  // Fechar Tabelas
  qryVersaoBase.Close;
  qryLayout.Close;
  qryGrupoPartic.Close;
  // Abrir Tabelas
  qryVersaoBase.Open;
  qryLayout.Open;
  qryGrupoPartic.Open;
end;

procedure TfrmExportaArquivo.bbtnConfirmarClick(Sender: TObject);
var wLayout  : TValidaLayout;
    wExporta : TExporta;
    wArquivo : String;
    wGrupos  : String;
    wi       : integer;
begin
   //---------------------------------------------------------
   // valida Preenchimento de Campos
   //---------------------------------------------------------

   // Verifica se versão de base selecionada
   If qryVersaoBase.IsEmpty Then
      Begin
        ShowMessage('Selecione a versão da base para exportação');
        abort;
      End;

   // Verifique se existe algum grupo selecionado
   wGrupos := '';
   For wi := 0 to ChckLstBxGrupoPartic.Items.Count-1 Do
     If ChckLstBxGrupoPartic.Checked[wi] Then
        If qryGrupoPartic.Locate ('NO_GRUPO_PARTIC', ChckLstBxGrupoPartic.Items.Strings[wi],[]) Then
           Begin
             If wGrupos = '' Then
                wGrupos := inttostr(qryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').AsInteger)
             Else
                wGrupos := wGrupos + ',' + inttostr(qryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').AsInteger);
           End
        Else
           Begin
             Raise Exception.Create ('Não foi possível selecionar o código do Grupo de Participantes. Entre em contato com o analista responsável');
             Exit;
           End;

   If wGrupos = '' Then
      Begin
        ShowMessage('Selecione pelo menos um grupo de participantes para exportação');
        abort;
      End;

   // Verifique se algum layout foi selecionado
   If (DBLkpCmbBxLayout.KeyValue = Null)
   or (DBLkpCmbBxLayout.KeyValue = -1) Then
      Begin
        ShowMessage('Selecione o Lay-out de arquivo para exportação');
        abort;
      End;

   LblDiretorio.Caption := DrctryLstBxDiret.Directory;

   // Verifique foi informado o nome do arquivo a ser exportado
   If EdtNomeArquivo.Text = '' Then
      Begin
        ShowMessage('Informe o nome do arquivo a ser exportado');
        abort;
      End
   Else
    begin
      if pos('\', LblDiretorio.Caption[length(LblDiretorio.Caption)]) > 0 then
        wArquivo := LblDiretorio.Caption + EdtNomeArquivo.Text + '.TXT'
      else
        wArquivo := LblDiretorio.Caption + '\' + EdtNomeArquivo.Text + '.TXT';
    end;  


   //---------------------------------------------------------
   // Verifica validade do lay-out
   //---------------------------------------------------------
   wLayout := TValidaLayout.Create (Self);
   if wLayout.Layout_Valido ( DBLkpCmbBxLayout.KeyValue ) Then
      wLayout.Free
   Else
      Begin
        if wLayout.FErro Then
           Begin
             wLayout.FMensagem := 'A Crítica do Layout constatou a existência do(s) seguinte(s) erro(s): ' + #13 + wLayout.FMensagem;
             ShowMessage(wLayout.FMensagem);
             wLayout.Free;
             Exit;
           End
        Else
           if wLayout.FAviso Then
              Begin
                wLayout.FMensagem := 'A Crítica do Layout constatou a existência do(s) seguinte(s) aviso(s): ' +
                                      #13 + wLayout.FMensagem + #13 + 'Deseja continuar?';
                if MessageDlg(wLayout.FMensagem, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                   wLayout.Free
                Else
                   Begin
                     wLayout.Free;
                     Exit;
                   End;
              End;
      End;
   //---------------------------------------------------------------------------
   // Efetua Exportação da Base selecionada
   //---------------------------------------------------------------------------
   wExporta := TExporta.Create(Self);

   wExporta.ExportaArquivo ( WG_CD_VERSAO, DBLkpCmbBxLayout.KeyValue, wGrupos, wArquivo,
       Get_Ordem_Campos );

   if (wExporta.Erro)
   or (wExporta.Aviso) Then
      Begin
        if MessageDlg('A exportação gerou um relatório de ocorrência. Gostaria de vê-lo agora?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           ExecuteFile('WordPad.EXE', wExporta.Critica , '', SW_SHOW);
      End
   Else
     ShowMessage ('Arquivo exportado com Sucesso!' + #13 + 'Total de Registros exportados ' + Inttostr(wExporta.NumRegsExport) );

   wExporta.Free;
end;

procedure TfrmExportaArquivo.qryGrupoParticAfterOpen(DataSet: TDataSet);
begin
  ChckLstBxGrupoPartic.Clear;

  While NOT qryGrupoPartic.Eof Do
    Begin
      ChckLstBxGrupoPartic.Items.Add(qryGrupoPartic.FieldByName('NO_GRUPO_PARTIC').AsString);
      qryGrupoPartic.Next;
    End;
end;

procedure TfrmExportaArquivo.BitBtn6Click(Sender: TObject);
begin
  PnlOrdem.Visible := True;
end;

procedure TfrmExportaArquivo.BitBtn2Click(Sender: TObject);
begin
  PnlOrdem.Visible := False;
end;

procedure TfrmExportaArquivo.BtnAdicionarClick(Sender: TObject);
begin
  if LstBxOrdemCampos.Items.IndexOf(Trim(qryGrupoAtributo.FieldByName('DS_ATRIBUTO_TABELA').asString)) >= 0 then
   begin
     MessageDlg('O campo já foi selecionado.', mtWarning, [mbOk], 0);
     DBLkpListBxGrupoAtributo.SetFocus;
     Exit;
   end;

  lstOrdem_Campos.Add(Trim(qryGrupoAtributo.FieldByName('NO_TABELA').asString) + '.' +
      Trim(qryGrupoAtributo.FieldByName('NO_ATRIBUTO_TABELA').asString));
  LstBxOrdemCampos.Items.Add(Trim(qryGrupoAtributo.FieldByName('DS_ATRIBUTO_TABELA').asString));
end;

procedure TfrmExportaArquivo.BtnRetirarClick(Sender: TObject);
var
  iPos: Integer;
begin
  iPos := LstBxOrdemCampos.ItemIndex;

  if iPos = -1 then
   begin
     MessageDlg('Não existe nenhum item selecionado.', mtWarning, [mbOk], 0);
   end
  else
   begin
     lstOrdem_Campos.Delete(iPos);
     LstBxOrdemCampos.Items.Delete(iPos);
   end;  
end;

function TfrmExportaArquivo.Get_Ordem_Campos: String;
var
  i: Integer;
begin
  Result := '';

  if lstOrdem_Campos.Count >= 1 then
    for i := 0 to lstOrdem_Campos.Count - 1 do
     begin
       if i = 0 then
         Result := Result + lstOrdem_Campos.Strings[i]
       else
         Result := Result + ', ' + lstOrdem_Campos.Strings[i];
     end;
end;

procedure TfrmExportaArquivo.BitBtn7Click(Sender: TObject);
var
  iPos: Integer;
begin
  iPos := LstBxOrdemCampos.ItemIndex;

  if iPos > 0 then
   begin
     LstBxOrdemCampos.Items.Exchange(iPos, iPos - 1);
     lstOrdem_Campos.Exchange(iPos, iPos - 1);
   end;  
end;

procedure TfrmExportaArquivo.BitBtn8Click(Sender: TObject);
var
  iPos: Integer;
begin
  iPos := LstBxOrdemCampos.ItemIndex;

  if (iPos < (LstBxOrdemCampos.Items.Count - 1)) then
   begin
     LstBxOrdemCampos.Items.Exchange(iPos, iPos + 1);
     lstOrdem_Campos.Exchange(iPos, iPos + 1);
   end;
end;

procedure TfrmExportaArquivo.DBLkpListBxGrupoAtributoDblClick(
  Sender: TObject);
begin
  BtnAdicionar.Click;  
end;

end.
