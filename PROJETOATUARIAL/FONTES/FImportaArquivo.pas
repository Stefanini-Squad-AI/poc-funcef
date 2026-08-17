unit FImportaArquivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FileCtrl, Mask, DBCtrls, Db, Wwdatsrc,
  DBTables, Wwquery;

type
  TfrmImportaArquivo = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    DrveCmbBxDrive: TDriveComboBox;
    DrctryLstBxDiret: TDirectoryListBox;
    FltrCmbBxFiltro: TFilterComboBox;
    FlLstBxArq: TFileListBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    LblDiretorio: TLabel;
    EdtArqSelec: TEdit;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    ChckBxTodosRegs: TCheckBox;
    Label6: TLabel;
    Label8: TLabel;
    MskEdtNumRegs: TMaskEdit;
    PnlVersaoBase: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RdGrpOpcao: TRadioGroup;
    DBLkpCmbBxEntidade: TDBLookupComboBox;
    DBLkpCmbBxPatrocinadora: TDBLookupComboBox;
    DBLkpCmbBxPlano: TDBLookupComboBox;
    Label11: TLabel;
    Label9: TLabel;
    MskEdtDtRefer: TMaskEdit;
    Label4: TLabel;
    Edit4: TEdit;
    qryEntidade: TwwQuery;
    dsEntidade: TwwDataSource;
    qryPatrocinadora: TwwQuery;
    dsPatrocinadora: TwwDataSource;
    qryPlano: TwwQuery;
    dsPlano: TwwDataSource;
    qryEntidadeCD_PESSOA_ENTID: TFloatField;
    qryEntidadeNO_PESSOA: TStringField;
    qryPatrocinadoraCD_PESSOA_ENTID: TFloatField;
    qryPatrocinadoraCD_PESSOA_PATROC: TFloatField;
    qryPatrocinadoraNO_PESSOA: TStringField;
    qryPlanoCD_PESSOA_ENTID: TFloatField;
    qryPlanoCD_PESSOA_PATROC: TFloatField;
    qryPlanoCD_PLANO: TFloatField;
    qryPlanoNO_PLANO: TStringField;
    Label10: TLabel;
    Panel2: TPanel;
    DBLkpCmbBxLayout: TDBLookupComboBox;
    Label12: TLabel;
    qryLayout: TwwQuery;
    dsLayout: TwwDataSource;
    qryLayoutCD_ARQUIVO: TFloatField;
    qryLayoutNO_ARQUIVO: TStringField;
    EdtVersao: TEdit;
    qryVersao: TwwQuery;
    dsVersao: TwwDataSource;
    EdtDtDescrBase: TEdit;
    qryChaveVersao: TwwQuery;
    qryVersaoCD_VERSAO: TFloatField;
    qryVersaoDS_VERSAO: TStringField;
    qryVersaoDT_GERACAO: TDateTimeField;
    qryVersaoLOGIN: TStringField;
    qryVersaoDT_REFER_BASE: TDateTimeField;
    qryVersaoIR_BASE_HISTORICA: TStringField;
    qryAux: TwwQuery;
    wwQryAtuPartic: TwwQuery;
    StringField2: TStringField;
    wwQryAtuTipoBenef: TwwQuery;
    StringField1: TStringField;
    qryEntid: TwwQuery;
    qryPatroc: TwwQuery;
    qryPlan: TwwQuery;
    qryEntidNO_PESSOA: TStringField;
    qryPatrocNO_PESSOA: TStringField;
    qryPlanNO_PLANO: TStringField;
    wwQryVersaoBase: TwwQuery;
    wwQryVersaoBaseCD_VERSAO: TFloatField;
    wwQryVersaoBaseCD_PESSOA_PATROC: TFloatField;
    wwQryVersaoBaseCD_PESSOA_ENTID: TFloatField;
    wwQryVersaoBaseCD_PLANO: TFloatField;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure RdGrpOpcaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaArquivo: TfrmImportaArquivo;

implementation

uses uGlobal, FPrincipal, uValidaLayout, uImporta, FmxUtils;

{$R *.DFM}

procedure TfrmImportaArquivo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmImportaArquivo.bbtnConfirmarClick(Sender: TObject);
Var W_Chave   : Integer;
    W_Layout  : TValidaLayout;
    W_Importa : TImporta;
begin

   //Verifica seleção de parâmetros obrigatórios
   if MskEdtDtRefer.Text = '  /  /    ' Then
      Begin
        ShowMessage('Informe a data de referência da base a ser criada');
        abort;
      End;

   if DBLkpCmbBxEntidade.KeyValue = -1 Then
      Begin
        ShowMessage('Selecione a Entidade');
        abort;
      End;

   if DBLkpCmbBxPatrocinadora.KeyValue = -1 Then
      Begin
        ShowMessage('Selecione a Patrocinadora');
        abort;
      End;

   if DBLkpCmbBxPlano.KeyValue = -1 Then
      Begin
        ShowMessage('Selecione o Plano');
        abort;
      End;

   if EdtDtDescrBase.Text = '' Then
      Begin
        ShowMessage('Informe a descrição da nova versão de base a ser gerada');
        abort;
      End;

   if DBLkpCmbBxLayout.KeyValue = -1 Then
      Begin
        ShowMessage('Selecione o Lay-out correspondente ao arquivo');
        abort;
      End;

   if EdtArqSelec.Text = '*.txt' Then
      Begin
        ShowMessage('Selecione o arquivo desejado');
        abort;
      End;

   If  (NOT ChckBxTodosRegs.Checked)
   AND (MskEdtNumRegs.Text = '     ') Then
      Begin
        ShowMessage('Informe se deseja importar todo o arquivo ou apenas alguns registros');
        abort;
      End;

   //---------------------------------------------------------
   // Verifica validade do lay-out
   //---------------------------------------------------------
   W_Layout := TValidaLayout.Create (Self);
   if W_Layout.Layout_Valido (  DBLkpCmbBxLayout.KeyValue ) Then
      W_Layout.Free
   Else
      Begin
        if W_Layout.FErro Then
           Begin
             W_Layout.FMensagem := 'A Crítica do Layout constatou a existência do(s) seguinte(s) erro(s): ' + #13 + W_Layout.FMensagem;
             ShowMessage(W_Layout.FMensagem);
             W_Layout.Free;
             abort;
           End
        Else
           if W_Layout.FAviso Then
              Begin
                W_Layout.FMensagem := 'A Crítica do Layout constatou a existência do(s) seguinte(s) aviso(s): ' +
                                      #13 + W_Layout.FMensagem + #13 + 'Deseja continuar?';
                if MessageDlg(W_Layout.FMensagem, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                   W_Layout.Free
                Else
                   Begin
                     W_Layout.Free;
                     abort;
                   End;
              End;
      End;


   //---------------------------------------------------------
   // Grava Nova versão de Base
   //---------------------------------------------------------
   If RdGrpOpcao.ItemIndex = 0 Then // Grava nova versão de Base
      Begin

        qryChaveVersao.Open;
        W_Chave := qryChaveVersao.FieldByName('COD').AsInteger + 1;
        qryChaveVersao.Close;

        With qryAux Do
          Begin

            Sql.Clear;
            Sql.Add('INSERT INTO FI_VERSAO_BASE VALUES (');
            Sql.Add(IntToStr(W_Chave) + ',');
            Sql.Add(#39 + EdtDtDescrBase.Text + #39 + ',');
            Sql.Add('TO_DATE(' + #39 + DateTimetoStr(Now) + #39 + ',' + #39 + 'DD/MM/YYYY HH24:MI:SS' + #39 + '),');
            Sql.Add(#39 + 'Fórmula' + #39 + ',');
            Sql.Add('TO_DATE(' + #39 + MskEdtDtRefer.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '),');
            Sql.Add(#39 + 'N' + #39 + ')');
            Try
              ExecSQl;
            Except
              ShowMessage('Erro na inclusão da tabela FI_VERSAO_BASE');
              Exit;
            End;

            Sql.Clear;
            Sql.Add('INSERT INTO FI_BASE_PLANO_PATRONAL VALUES (');
            Sql.Add(IntToStr(W_Chave) + ',');
            Sql.Add(inttostr(DBLkpCmbBxPatrocinadora.KeyValue) + ',');
            Sql.Add(inttostr(DBLkpCmbBxEntidade.KeyValue) + ',');
            Sql.Add(inttostr(DBLkpCmbBxPlano.KeyValue) + ')');
            Try
              ExecSQl;
            Except
              ShowMessage('Erro na inclusão da tabela FI_BASE_PLANO_PATRONAL');
              Exit;
            End;
          End;
      End
   Else
     W_Chave := WG_CD_VERSAO; 


   //---------------------------------------------------------
   // Seta Versão Gravada como Versão de Trabalho
   //---------------------------------------------------------

   //-- Lê versão Gravada
   qryVersao.Close;
   qryVersao.ParamByName('CD_VERSAO').AsInteger := W_Chave;
   qryVersao.Open;
   If qryVersao.IsEmpty Then
      Raise Exception.Create('Erro na Gravação da versão da base');

  wwQryVersaoBase.Close;
  wwQryVersaoBase.ParamByName('CD_VERSAO').AsInteger := W_Chave;
  wwQryVersaoBase.Open;
  If wwQryVersaoBase.IsEmpty Then
      Raise Exception.Create('Erro na Gravação da versão da base');

   WG_CD_VERSAO          := W_Chave;
   WG_CD_PESSOA_ENTID    := wwQryVersaoBase.FieldByName('CD_PESSOA_ENTID').AsInteger;
   WG_CD_PESSOA_PATROC   := wwQryVersaoBase.FieldByName('CD_PESSOA_PATROC').AsInteger;
   WG_CD_PLANO           := wwQryVersaoBase.FieldByName('CD_PLANO').AsInteger;
   WG_DT_REFER_BASE      := StrToDate(MskEdtDtRefer.Text);

   qryEntid.Close;
   qryPatroc.Close;
   qryPlan.Close;
   qryEntid.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
   qryPatroc.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
   qryPlan.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
   qryEntid.Open;
   qryPatroc.Open;
   qryPlan.Open;
   WG_ENTID_PATROC_PLANO :=  qryEntid.FieldByName('NO_PESSOA').asString + ' / ' +
                             qryPatroc.FieldByName('NO_PESSOA').asString + ' / ' +
                             qryPlan.FieldByName('NO_PLANO').asString;

   frmPrincipal.stbarStatusBar.panels[4].Text := qryEntidade.FieldByName('NO_PESSOA').AsString;
   frmPrincipal.stbarStatusBar.panels[5].Text := qryPatrocinadora.FieldByName('NO_PESSOA').AsString;
   frmPrincipal.stbarStatusBar.panels[6].Text := qryPlano.FieldByName('NO_PLANO').AsString;

   //---------------------------------------------------------
   // Invoca importação do Arquivo
   //---------------------------------------------------------
   W_Importa := TImporta.Create(Self);

   If NOT ChckBxTodosRegs.Checked Then
      W_Importa.FNumRegsImpot := strtoint(Trim(MskEdtNumRegs.Text));

   W_Importa.ImportaArquivo ( DBLkpCmbBxLayout.KeyValue , DrctryLstBxDiret.Directory , EdtArqSelec.Text );

  //Atualiza Tipo do Participante (Ativo ou Beneficiário)
   wwQryAtuTipoBenef.close;
   wwQryAtuTipoBenef.ParamByName('cd_versao').asinteger := WG_CD_VERSAO;
   wwQryAtuTipoBenef.ExecSQL;

   wwQryAtuPartic.close;
   wwQryAtuPartic.ParamByName('cd_versao').asinteger    := WG_CD_VERSAO;
   wwQryAtuPartic.ExecSQL;   

   if (W_Importa.FErro)
   or (W_Importa.FAviso) Then
      Begin
        if MessageDlg('A importação gerou um relatório de ocorrência. Gostaria de vê-lo agora?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           ExecuteFile('WordPad.EXE', W_Importa.FCritica , '', SW_SHOW);
      End
   Else
     ShowMessage ('Arquivo importado com Sucesso!');

   W_Importa.Free;
end;

procedure TfrmImportaArquivo.RdGrpOpcaoClick(Sender: TObject);
begin

  If RdGrpOpcao.ItemIndex = 0 Then
     Begin
       PnlVersaoBase.Enabled := True;
       MskEdtDtRefer.Text := DateToStr(Date);
       EdtVersao.Text := '';
       DBLkpCmbBxEntidade.KeyValue := -1;
       DBLkpCmbBxPatrocinadora.KeyValue := -1;
       DBLkpCmbBxPlano.KeyValue := -1;
       EdtDtDescrBase.Text := '';
     End
   Else
     If qryVersao.IsEmpty Then
        Begin
          ShowMessage('Para que esta opção possa ser escolhida é necessário que uma Versão de Base de Trabalho esteja selecionada');
          RdGrpOpcao.ItemIndex := 0;
        End
     Else
        Begin
          MskEdtDtRefer.Text := DateToStr(WG_DT_REFER_BASE);
          EdtVersao.Text := DateTimeToStr(qryVersao.FieldByName('DT_GERACAO').AsDateTime);
          DBLkpCmbBxEntidade.KeyValue := WG_CD_PESSOA_ENTID;
          DBLkpCmbBxPatrocinadora.KeyValue :=WG_CD_PESSOA_PATROC;
          DBLkpCmbBxPlano.KeyValue := WG_CD_PLANO;
          EdtDtDescrBase.Text := qryVersao.FieldByName('DS_VERSAO').AsString;;
        End;
end;

procedure TfrmImportaArquivo.FormShow(Sender: TObject);
begin
  inherited;
  qryVersao.ParamByName('CD_VERSAO').AsInteger := WG_CD_VERSAO;
  qryVersao.Open;
  qryEntidade.Open;
  qryPatrocinadora.Open;
  qryPlano.Open;
  qryLayout.Open;
  RdGrpOpcao.ItemIndex := 0;

  DBLkpCmbBxEntidade.KeyValue := -1;
  DBLkpCmbBxPatrocinadora.KeyValue := -1;
  DBLkpCmbBxPlano.KeyValue := -1;
  DBLkpCmbBxLayout.KeyValue := -1;

  RdGrpOpcaoClick(Self);
end;

procedure TfrmImportaArquivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryVersao.Close;
  qryEntidade.Close;
  qryPatrocinadora.Close;
  qryPlano.Close;
  qryLayout.Close;
end;

end.
