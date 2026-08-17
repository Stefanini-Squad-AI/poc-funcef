unit FCadLayoutArquivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Mask, DBTables, Wwquery,
  CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmCadLayoutArquivo = class(TfrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
    DBdtNomeArquivo: TDBEdit;
    DBMemo1: TDBMemo;
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    DbGrdDet: TwwDBGrid;
    PnlDetalhe: TPanel;
    Label7: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DBEdtNumCampo: TDBEdit;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    DBRdGrupTipoArquivo: TDBRadioGroup;
    DBRdGrpDelimitador: TDBRadioGroup;
    DBEdtOutroDelimitador: TDBEdit;
    DBRdGrpQualificador: TDBRadioGroup;
    QryPrincipal: TwwQuery;
    QryPrincipalCD_ARQUIVO: TFloatField;
    QryPrincipalNO_ARQUIVO: TStringField;
    QryPrincipalDS_ARQUIVO: TMemoField;
    QryPrincipalTP_ARQUIVO: TStringField;
    QryPrincipalTP_DELIMITADOR_CAMPO: TStringField;
    QryPrincipalDS_OUTRO_DELIMITADOR: TStringField;
    QryPrincipalTP_QUALIFICADOR_TEXTO: TStringField;
    UpdtSQLPrincipal: TUpdateSQL;
    QryAux: TwwQuery;
    TbShtExemplo: TTabSheet;
    MmExemplo: TMemo;
    QryDetalhe: TwwQuery;
    dsDet: TwwDataSource;
    UpdtSQLDetalhe: TUpdateSQL;
    Label3: TLabel;
    DBEdtNomeCampo: TDBEdit;
    Label4: TLabel;
    DBEdtDescrCampo: TDBEdit;
    DBRdGrpTipoCampo: TDBRadioGroup;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBChckBxRelatOcorr: TDBCheckBox;
    GroupBox1: TGroupBox;
    DBLkpCmbBxOcorr: TDBLookupComboBox;
    TabSheet1: TTabSheet;
    GrpBxData: TGroupBox;
    GrpBxNumero: TGroupBox;
    DBEditSimboloDecimal: TDBEdit;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdtCasasDecimais: TDBEdit;
    DBEdtSimboloAgrupador: TDBEdit;
    Label10: TLabel;
    DBEdtMaskData: TDBEdit;
    GrpBxTamCampo: TGroupBox;
    DBEdtTamCampo: TDBEdit;
    QryCampos: TwwQuery;
    dsCampos: TwwDataSource;
    QryCamposCD_ARQUIVO: TFloatField;
    QryCamposSQ_CAMPO: TFloatField;
    QryCamposNO_CAMPO_ARQUIVO: TStringField;
    wwDBGrid1: TwwDBGrid;
    QryDetalheCD_ARQUIVO: TFloatField;
    QryDetalheSQ_CAMPO: TFloatField;
    QryDetalheNR_ORDEM: TFloatField;
    QryDetalheNO_CAMPO_ARQUIVO: TStringField;
    QryDetalheDS_CAMPO_ARQUIVO: TStringField;
    QryDetalheNR_TAM_CAMPO: TFloatField;
    QryDetalheTP_ATRIBUTO: TStringField;
    QryDetalheDS_SIMBOLO_DECIMAL: TStringField;
    QryDetalheNR_DECIMAL: TFloatField;
    QryDetalheDS_SIMBOLO_AGRUPADOR: TStringField;
    QryDetalheDS_MASCARA_DATA: TStringField;
    QryDetalheCD_ARQUIVO_MASTER: TFloatField;
    QryDetalheSQ_CAMPO_MASTER: TFloatField;
    QryDetalheIR_RELATORIO_OCORRENCIA: TStringField;
    Panel1: TPanel;
    BtProcVinc: TSpeedButton;
    BtExclVinc: TSpeedButton;
    btAltVinc: TSpeedButton;
    BtInsVinc: TSpeedButton;
    DbGrdDetVinc: TwwDBGrid;
    PnlDetalheVinc: TPanel;
    bbtnOkDetVinc: TBitBtn;
    bbtnCancelarDetVinc: TBitBtn;
    qryDetalheVinc: TwwQuery;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    BtBtnDetalheVincValores: TBitBtn;
    qryGrupoLogico: TwwQuery;
    qryGrupoLogicoCD_GRUPO: TFloatField;
    qryGrupoLogicoNO_GRUPO: TStringField;
    qryGrupoLogicoNR_ORDEM: TFloatField;
    dsGrupoLogico: TwwDataSource;
    qryGrupoAtributo: TwwQuery;
    dsGrupoAtributo: TwwDataSource;
    DBLkpLstBxGrupo: TDBLookupListBox;
    DBLkpListBxGrupoAtributo: TDBLookupListBox;
    qryGrupoAtributoNO_TABELA: TStringField;
    qryGrupoAtributoNO_ATRIBUTO_TABELA: TStringField;
    qryGrupoAtributoDS_ATRIBUTO_TABELA: TStringField;
    dsDetalheVinc: TwwDataSource;
    UpdtSQLDetalheVinc: TUpdateSQL;
    qryDetalheVincNO_TABELA: TStringField;
    qryDetalheVincNO_ATRIBUTO_TABELA: TStringField;
    qryDetalheVincCD_ARQUIVO: TFloatField;
    qryDetalheVincSQ_CAMPO: TFloatField;
    qryDetalheVincDS_ATRIBUTO_TABELA: TStringField;
    qryDetalheVincNO_GRUPO: TStringField;
    qryGrupoAtributoCHAVE: TStringField;
    qryDetalheVincTP_ATRIBUTO: TStringField;
    qryDetalheVincNR_TAM_ATRIBUTO_TABELA: TFloatField;
    BtBtnValidaLayout: TBitBtn;
    SpdBttnExcluiOcorr: TSpeedButton;
    DBChckBxImportacao: TDBCheckBox;
    DBChckBxExportacao: TDBCheckBox;
    QryPrincipalIR_PARA_IMPORTACAO: TStringField;
    QryPrincipalIR_PARA_EXPORTACAO: TStringField;
    MontaSelect: TMontaSelect;
    SBtnGerar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure DBRdGrupTipoArquivoChange(Sender: TObject);
    procedure DBRdGrpDelimitadorChange(Sender: TObject);
    procedure DBRdGrpQualificadorChange(Sender: TObject);
    procedure DBEdtOutroDelimitadorChange(Sender: TObject);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtProcClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure QryPrincipalAfterDelete(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure DBRdGrpTipoCampoChange(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure QryDetalheAfterPost(DataSet: TDataSet);
    procedure QryDetalheAfterDelete(DataSet: TDataSet);
    procedure QryDetalheAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure QryDetalheUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure BtInsVincClick(Sender: TObject);
    procedure btAltVincClick(Sender: TObject);
    procedure BtProcVincClick(Sender: TObject);
    procedure BtExclVincClick(Sender: TObject);
    procedure bbtnOkDetVincClick(Sender: TObject);
    procedure bbtnCancelarDetVincClick(Sender: TObject);
    procedure qryDetalheVincAfterDelete(DataSet: TDataSet);
    procedure qryDetalheVincAfterPost(DataSet: TDataSet);
    procedure qryDetalheVincAfterOpen(DataSet: TDataSet);
    procedure BtBtnDetalheVincValoresClick(Sender: TObject);
    procedure qryDetalheVincUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure BtBtnValidaLayoutClick(Sender: TObject);
    procedure SpdBttnExcluiOcorrClick(Sender: TObject);
    procedure qryDetalheVincBeforePost(DataSet: TDataSet);
    procedure QryDetalheAfterOpen(DataSet: TDataSet);
    procedure QryPrincipalAfterInsert(DataSet: TDataSet);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure SBtnGerarClick(Sender: TObject);
  private
    { Private declarations }
    WidReg : Integer;
    Procedure MontaExemplo;
    Procedure SetaCamposDetalhe;
    Function  MascaraDataValida ( var werro : String ) : Boolean;
    Procedure SetDetalhe;
  public
    { Public declarations }
  end;

var
  frmCadLayoutArquivo: TfrmCadLayoutArquivo;

implementation

Uses UBibliotecaAtuarial, FTelaAut, FCadCamposVincValores, FAnimacao, uValidaLayout,
  DRelatsAtuarial;

{$R *.DFM}

procedure TfrmCadLayoutArquivo.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBdtNomeArquivo.SetFocus;

  // Inabilita Detalhe
  SetDetalhe;
end;

procedure TfrmCadLayoutArquivo.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// Seta Focus no Nome
  DBdtNomeArquivo.SetFocus;
// Inabilita Detalhe
  SetDetalhe;
end;

procedure TfrmCadLayoutArquivo.bbtnConfirmarClick(Sender: TObject);
begin
  // Efetua Críticas;
  If QryPrincipal.FieldByName('NO_ARQUIVO').Isnull Then
     Begin
       ShowMessage('Informe o Nome do Arquivo!');
       DBdtNomeArquivo.SetFocus;
       Exit;
     End;

  If QryPrincipal.FieldByName('TP_ARQUIVO').Isnull Then
     Begin
       ShowMessage('Informe o Tipo do Arquivo!');
       DBRdGrupTipoArquivo.SetFocus;
       Exit;
     End
  Else
    If QryPrincipal.FieldByName('TP_ARQUIVO').AsString = 'D' Then
       Begin
         If QryPrincipal.FieldByName('TP_DELIMITADOR_CAMPO').IsNull Then
            Begin
              ShowMessage('Informe o Tipo de Delimitador de campos do arquivo!');
              DBRdGrpDelimitador.SetFocus;
              Exit;
            End
         Else
           If QryPrincipal.FieldByName('TP_DELIMITADOR_CAMPO').AsString = 'O' Then
              Begin
                If QryPrincipal.FieldByName('DS_OUTRO_DELIMITADOR').IsNull Then
                   Begin
                     ShowMessage('Especifique o delimitador de campos do arquivo!');
                     DBEdtOutroDelimitador.SetFocus;
                     Exit;
                   End;
              End
           Else
              Begin
                QryPrincipal.FieldByName('DS_OUTRO_DELIMITADOR').Value := Null;
              End;
       End
    Else
       Begin
         QryPrincipal.FieldByName('TP_DELIMITADOR_CAMPO').Value := Null;
         QryPrincipal.FieldByName('DS_OUTRO_DELIMITADOR').Value := Null;
       End;

    If QryPrincipal.FieldByName('TP_QUALIFICADOR_TEXTO').Isnull Then
       Begin
         ShowMessage('Informe o Tipo do Qualificador dos Textos do Arquivo!');
         DBRdGrpQualificador.SetFocus;
         Exit;
       End;

  IF  (QryPrincipal.FieldByName('IR_PARA_IMPORTACAO').AsString = 'N')
  AND (QryPrincipal.FieldByName('IR_PARA_EXPORTACAO').AsString = 'N') Then
     Begin
       ShowMessage('Informe qual a finalidade do arquivo ( Importação, Exportação ou ambos ).');
       DBChckBxImportacao.SetFocus;
       Exit;
     End;


  // Herança
  inherited;

  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;

  DBdtNomeArquivo.SetFocus;

  // Cancela
  bbtnCancelar.Click;
  // Habilita Detalhe
  SetDetalhe
end;

procedure TfrmCadLayoutArquivo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  // Abilita Botoes de Detalhe
  SetDetalhe;
end;

procedure TfrmCadLayoutArquivo.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  WIdReg := 0;
  If QryPrincipal.State = dsInsert Then
     Begin
       QryAux.SQL.Text := 'Select MAX(CD_ARQUIVO) from FI_ARQUIVO';
       QryAux.Open;
       If QryAux.Fields[0].IsNull Then
          QryPrincipal.FieldByName('CD_ARQUIVO').AsInteger := 1
       ELse
          QryPrincipal.FieldByName('CD_ARQUIVO').AsInteger := QryAux.Fields[0].Value + 1;
       QryAux.Close;
       wIdReg:=Qryprincipal.FieldByName('CD_ARQUIVO').AsInteger;
     End;
end;

procedure TfrmCadLayoutArquivo.DBRdGrupTipoArquivoChange(Sender: TObject);
begin
  DBEdtOutroDelimitador.Visible := False;

  If DBRdGrupTipoArquivo.ItemIndex = 0 Then // Arquivo do Tipo Delimitado
     DBRdGrpDelimitador.Enabled  := True
  ELse Begin
     DBRdGrpDelimitador.Enabled  := False; // Arquivo do Tipo Fixo
     DBRdGrpDelimitador.ItemIndex := -1;
  End;

  // Seta Valores iniciais
  If QryPrincipal.State in [dsInsert,dsEdit] Then
     Begin
       QryPrincipal.FieldByName('TP_DELIMITADOR_CAMPO').Value := Null;
       QryPrincipal.FieldByName('DS_OUTRO_DELIMITADOR').Value := Null;
       QryPrincipal.FieldByName('TP_QUALIFICADOR_TEXTO').Value := Null;
       DBRdGrpDelimitador.ItemIndex  := -1;
       DBRdGrpQualificador.ItemIndex := -1;
     End;

  MontaExemplo;
end;

procedure TfrmCadLayoutArquivo.DBRdGrpDelimitadorChange(Sender: TObject);
begin
  If DBRdGrpDelimitador.ItemIndex = 4 Then // Delimitador de outro Tipo
     Begin
       DBEdtOutroDelimitador.Visible := True;
       If  (QryPrincipal.State in [dsInsert,dsEdit])
       AND (QryPrincipal.FieldByName('DS_OUTRO_DELIMITADOR').IsNull) Then
           QryPrincipal.FieldByName('DS_OUTRO_DELIMITADOR').AsString := '?';
     End
  Else
     Begin
       DBEdtOutroDelimitador.Visible := False;
       If  (QryPrincipal.State in [dsInsert,dsEdit])
       AND (QryPrincipal.FieldByName('DS_OUTRO_DELIMITADOR').IsNull) Then
           QryPrincipal.FieldByName('DS_OUTRO_DELIMITADOR').Value := Null;
     End;
  MontaExemplo;
end;

//Monta um exemplo de como o lay-out do arquivo está ficando
Procedure TfrmCadLayoutArquivo.MontaExemplo;
Var
  wi : Integer;
  w_linha : String;
Begin
  MmExemplo.Clear;
  w_linha := '';

  For wi := 1 to 5 do
    Begin
      //Seta Qualificador;
      If DBRdGrpQualificador.ItemIndex = 0 Then // Delimitador aspas
         w_linha := w_linha + '"'
      Else
         If DBRdGrpQualificador.ItemIndex = 1 Then // Delimitador Plic
            w_linha := w_linha + #39;

      w_linha := w_linha + 'Campo' + inttostr(wi); //Seta o número do campo

      If DBRdGrpQualificador.ItemIndex = 0 Then // Delimitador aspas
         w_linha := w_linha + '"'
      Else
         If DBRdGrpQualificador.ItemIndex = 1 Then // Delimitador Plic
            w_linha := w_linha + #39;

      if  (DBRdGrupTipoArquivo.ItemIndex = 0) and (wi < 5) Then //Arquivo com campos delimitados
         Begin
           if DBRdGrpDelimitador.ItemIndex = 0 Then
              w_linha := w_linha + '     '
           Else
              if DBRdGrpDelimitador.ItemIndex = 1 Then
                 w_linha := w_linha + ' '
              Else
                 if DBRdGrpDelimitador.ItemIndex = 2 Then
                    w_linha := w_linha + ','
                 Else
                    if DBRdGrpDelimitador.ItemIndex = 3 Then
                       w_linha := w_linha + ';'
                    Else
                       if DBRdGrpDelimitador.ItemIndex = 4 Then
                          w_linha := w_linha + DBEdtOutroDelimitador.Text;
         End;
    End;

  MmExemplo.Clear;
  For wi := 1 to 8 do
    MmExemplo.Lines.Add(w_linha);

End;

procedure TfrmCadLayoutArquivo.DBRdGrpQualificadorChange(Sender: TObject);
begin
  inherited;
  MontaExemplo
end;

procedure TfrmCadLayoutArquivo.DBEdtOutroDelimitadorChange(
  Sender: TObject);
begin
  inherited;
  MontaExemplo
end;

procedure TfrmCadLayoutArquivo.BtInsClick(Sender: TObject);
begin
  inherited;
  // Abaixa Botao
  BtIns.Down:=True;
  // Inabilita Botoes de Detalhe
  BtAlt.Enabled :=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
  // Esconde Grid Mostra Painel
  DbGrdDet.Visible:=False;
  PnlDetalhe.Visible:=True;

  //Habilita/Inabilita Campos Detalhe
  SetaCamposDetalhe;
  // Inclui Novo Registro
  QryDetalhe.Append;
end;

procedure TfrmCadLayoutArquivo.btAltClick(Sender: TObject);
begin
  inherited;
  // Se Nao Houverem Registros de Detalhe, Sai
  If QryDetalhe.RecordCount=0 then begin
     BtAlt.Down:=False;
     Exit;
  End;
  // Abaixa Botao
  BtAlt.Down:=True;
  // Inabilita Botoes de Detalhe
  BtIns.Enabled:=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
  // Esconde Grid Mostra Painel
  DbGrdDet.Visible:=False;
  PnlDetalhe.Visible:=True;
  // Seta Campos Detalhe
  SetaCamposDetalhe;
  // Alterar Registro
  QryDetalhe.Edit;
end;

procedure TfrmCadLayoutArquivo.BtProcClick(Sender: TObject);
begin
  inherited;
  // Muda Base de Dados e Executa Componente de Pesquisa
  SelDlgProcuraQry.DataSet:=QryDetalhe;
  SelDlgProcuraQry.Execute;
  // Volta Base de Dados Anterior
  SelDlgProcuraQry.DataSet:=QryPrincipal;
end;

procedure TfrmCadLayoutArquivo.BtExclClick(Sender: TObject);
begin
  inherited;

  // Se Vazio, Sai
  If QryDetalhe.RecordCount=0 then Exit;

  // Se Confirmar, Exclui Registro Posicionado
  If MessageBox(0,'Confirma ?','Mensagem do Sistema ',1) = IdOk Then
     QryDetalhe.Delete;
end;

procedure TfrmCadLayoutArquivo.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   QryPrincipal.ApplyUpdates;
   QryPrincipal.CommitUpdates;
  except
   bbtnCancelar.Click;
   exit;
  end;     
end;

procedure TfrmCadLayoutArquivo.QryPrincipalAfterDelete(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;
end;

procedure TfrmCadLayoutArquivo.FormShow(Sender: TObject);
begin
  inherited;
  QryPrincipal.Open;
  QryDetalhe.Open;
  QryCampos.Open;
//Querys de Vinculação
  qryDetalheVinc.Open;
  qryGrupoLogico.Open;
  qryGrupoAtributo.Open;

// Limpa memo
  if QryPrincipal.IsEmpty Then
     MmExemplo.Clear;
//Habilita/Inabilita Deltahe
  SetDetalhe;
end;

procedure TfrmCadLayoutArquivo.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       Qryprincipal.Locate('CD_ARQUIVO',wIdReg,[]);
       wIdReg := 0;
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadLayoutArquivo.QryDetalheBeforePost(DataSet: TDataSet);
begin
  If QryDetalhe.State = dsInsert Then
     Begin
       QryDetalhe.FieldByName('CD_ARQUIVO').AsInteger :=
       QryPrincipal.FieldByName('CD_ARQUIVO').AsInteger;
       QryAux.SQL.Text := 'Select MAX(SQ_CAMPO) from FI_LAYOUT_ARQUIVO WHERE CD_ARQUIVO = ' + inttostr(QryPrincipal.FieldByName('CD_ARQUIVO').AsInteger);
       QryAux.Open;
       If QryAux.Fields[0].IsNull Then
          QryDetalhe.FieldByName('SQ_CAMPO').AsInteger := 1
       else
          QryDetalhe.FieldByName('SQ_CAMPO').AsInteger := QryAux.Fields[0].Value + 1;
       QryAux.Close;
     End;
End;

procedure TfrmCadLayoutArquivo.bbtnOkDetClick(Sender: TObject);
Var wErro : String;
begin
  // Efetua Críticas;
  If QryDetalhe.FieldByName('NR_ORDEM').Isnull Then
     Begin
       ShowMessage('Informe o Número de Ordem do Campo!');
       DBEdtNumCampo.SetFocus;
       Exit;
     End;

  If QryDetalhe.FieldByName('NO_CAMPO_ARQUIVO').Isnull Then
     Begin
       ShowMessage('Informe o Nome do Campo!');
       DBEdtNomeCampo.SetFocus;
       Exit;
     End;

  If  (QryPrincipal.FieldByName('TP_ARQUIVO').AsString = 'F')
  And (QryDetalhe.FieldByName('NR_TAM_CAMPO').Isnull) Then
     Begin
       ShowMessage('Informe o Tamanho do campo!');
       DBEdtTamCampo.SetFocus;
       Exit;
     End;

  // Criticam Campos Numéricos Decimais
  If QryDetalhe.FieldByName('TP_ATRIBUTO').AsString = 'F' Then // Campo Numérico
     Begin
       If QryDetalhe.FieldByName('DS_SIMBOLO_DECIMAL').Isnull Then
          Begin
            ShowMessage('Informe o Símbolo de decimal');
            DBEditSimboloDecimal.SetFocus;
            Exit;
          End
       Else
          If  (QryDetalhe.FieldByName('DS_SIMBOLO_DECIMAL').AsString <> '.')
          AND (QryDetalhe.FieldByName('DS_SIMBOLO_DECIMAL').AsString <> ',') Then
             Begin
               ShowMessage('O Símbolo de decimal deve ser igual a "." ou ","');
               DBEditSimboloDecimal.SetFocus;
               Exit;
             End;

       If QryDetalhe.FieldByName('NR_DECIMAL').Isnull Then
          Begin
            ShowMessage('Informe o número de casas decimais. Caso não exista nenhuma informe zero (0)');
            DBEdtCasasDecimais.SetFocus;
            Exit;
          End;

       If QryDetalhe.FieldByName('DS_SIMBOLO_AGRUPADOR').AsString <> '' Then
          If  (QryDetalhe.FieldByName('DS_SIMBOLO_AGRUPADOR').AsString <> '.')
          AND (QryDetalhe.FieldByName('DS_SIMBOLO_AGRUPADOR').AsString <> ',') Then
             Begin
               ShowMessage('O Símbolo agrupador deve ser igual a "." ou ","');
               DBEdtSimboloAgrupador.SetFocus;
               Exit;
             End;

       If QryDetalhe.FieldByName('DS_SIMBOLO_DECIMAL').AsString =
          QryDetalhe.FieldByName('DS_SIMBOLO_AGRUPADOR').AsString Then
          Begin
            ShowMessage('O Símbolo Agrupador de Dígitos não pode ser igual ao Símbolo de Decimais');
            DBEdtSimboloAgrupador.SetFocus;
           Exit;
          End;
     End;

  // Criticam Campos Data
  If QryDetalhe.FieldByName('TP_ATRIBUTO').AsString = 'D' Then // Campo Data
     Begin
       If QryDetalhe.FieldByName('DS_MASCARA_DATA').Isnull Then
          Begin
            ShowMessage('Informe a Máscara da Data. Utilize D=Dia, M=Mês, A=Ano e se necessário separadores de data ("/","-" ou ".")');
            DBEdtMaskData.SetFocus;
            Exit;
          End
       Else
          Begin
            QryDetalhe.FieldByName('DS_MASCARA_DATA').AsString :=
            UpperCase(QryDetalhe.FieldByName('DS_MASCARA_DATA').AsString);
            If Not MascaraDataValida ( Werro ) Then
               Begin
                 ShowMessage(Werro);
                 DBEdtMaskData.SetFocus;
                 Exit;
               End
          End;
     End;

  // Critica vinculação entre campos
  if QryDetalhe.FieldByName('SQ_CAMPO_MASTER').Isnull Then
     QryDetalhe.FieldByName('CD_ARQUIVO_MASTER').Value := Null
  Else
     if QryDetalhe.FieldByName('SQ_CAMPO_MASTER').Value =
        QryDetalhe.FieldByName('SQ_CAMPO').Value Then
        Begin
          ShowMessage('Um campo não pode ocorrer em função dele mesmo!');
          DBLkpCmbBxOcorr.SetFocus;
          Exit;
        End
     Else
        QryDetalhe.FieldByName('CD_ARQUIVO_MASTER').AsInteger :=
        QryPrincipal.FieldByName('CD_ARQUIVO').AsInteger;

  //Grava Tabela
  QryDetalhe.Post;

  QryDetalhe.ApplyUpdates;
  QryDetalhe.CommitUpdates;

If BtIns.Down=True Then
  //Prepara para nova Inclusão
  QryDetalhe.Append
Else
  //Volta para o Browse
  bbtnCancelarDetClick(Self);

end;

Procedure TfrmCadLayoutArquivo.SetaCamposDetalhe;
Begin

  DBEdtNumCampo.SetFocus;

  If QryPrincipal.FieldByName('TP_ARQUIVO').AsString = 'D' Then //Delimitado
     GrpBxTamCampo.Enabled := False
  Else                                                          //Tamanho Fixo
     GrpBxTamCampo.Enabled := True;

End;

procedure TfrmCadLayoutArquivo.DBRdGrpTipoCampoChange(Sender: TObject);
begin
  If  (QryDetalhe.State <> dsInsert)
  and (QryDetalhe.State <> dsEdit  ) Then
     Exit;

  If DBRdGrpTipoCampo.ItemIndex = 0 Then      // Campo do Tipo AlfaNumérico
     Begin
       GrpBxNumero.Enabled := False;
       QryDetalhe.FieldByName('DS_SIMBOLO_DECIMAL').Value := Null;
       QryDetalhe.FieldByName('NR_DECIMAL').Value := Null;
       QryDetalhe.FieldByName('DS_SIMBOLO_AGRUPADOR').Value := Null;

       GrpBxData.Enabled := False;
       QryDetalhe.FieldByName('DS_MASCARA_DATA').Value := Null;
     End
  ELse
     If DBRdGrpTipoCampo.ItemIndex = 1 Then   // Campo do Tipo Numérico
        Begin
          GrpBxNumero.Enabled := False;
          QryDetalhe.FieldByName('DS_SIMBOLO_DECIMAL').Value := Null;
          QryDetalhe.FieldByName('NR_DECIMAL').Value := Null;
          QryDetalhe.FieldByName('DS_SIMBOLO_AGRUPADOR').Value := Null;

          GrpBxData.Enabled := False;
          QryDetalhe.FieldByName('DS_MASCARA_DATA').Value := Null;
        End
     ELse
        If DBRdGrpTipoCampo.ItemIndex = 2 Then   // Campo do Tipo Numérico Decimal
           Begin
             GrpBxNumero.Enabled := True;
             GrpBxData.Enabled := False;
             QryDetalhe.FieldByName('DS_MASCARA_DATA').Value := Null;
          End
        Else
          Begin                                    // Campo do Tipo Data
            GrpBxNumero.Enabled := False;
            QryDetalhe.FieldByName('DS_SIMBOLO_DECIMAL').Value := Null;
            QryDetalhe.FieldByName('NR_DECIMAL').Value := Null;
            QryDetalhe.FieldByName('DS_SIMBOLO_AGRUPADOR').Value := Null;
            GrpBxData.Enabled := True;
          End;
end;

Function TfrmCadLayoutArquivo.MascaraDataValida ( var werro : String ) : Boolean;
Var wMascara : String;
    wi       : Integer;

    wnDia    : Integer;
    wnMes    : Integer;
    wnAno    : Integer;
    wnSep    : Integer;

    wiDia    : Integer;
    wiMes    : Integer;
    wiAno    : Integer;
    wiSep    : Integer;

Begin

  // Seta retono Falso
  Result := False;
  werro  := '';

  wMascara := QryDetalhe.FieldByName('DS_MASCARA_DATA').AsString;

  // Verifica tamanho da máscara
  If Length(wMascara) < 6 Then
     Begin
       werro := 'A máscara deve ter no mínimo 6 caracteres. Utilize D=Dia, M=Mês, A=Ano e se necessário separadores de data ("/","-" ou ".")';
       Exit;
     End;

  // Verifica se existe algum caracter inválido
  For wi := 1 to Length(wMascara) Do
    If  ( wMascara[wi] <> 'D' )
    AND ( wMascara[wi] <> 'M' )
    AND ( wMascara[wi] <> 'A' )
    AND ( wMascara[wi] <> '/' )
    AND ( wMascara[wi] <> '-' )
    AND ( wMascara[wi] <> '.' ) Then
      Begin
        werro := 'Caracter inválido. Utilize apenas D=Dia, M=Mês, A=Ano e se necessário separadores de data ("/","-" ou ".")';
        Exit;
      End;

  //Verifica Sequência de Dias, Meses e Anos
  wiDia := 0;
  wiMes := 0;
  WiAno := 0;
  wiSep := 0;

  wnDia := 0;
  wnMes := 0;
  WnAno := 0;
  wnSep := 0;

  For wi := 1 to Length(wMascara) Do
    Begin
      // Critica Nº de Dias e se estão em sequência
      If wMascara[wi] = 'D' Then
         Begin
           If wiDia = 0 Then
              Begin
                wiDia := wi;
                wnDia := wnDia + 1;
              End
           Else
              Begin
                wiDia := wiDia + 1;
                wnDia := wnDia + 1;
                if (wiDia <> wi)
                or (wnDia  >  2) Then
                  Begin
                    werro := 'Máscara inválida. A máscara deve conter, no máximo, 2 caracteres "D" dispostos de forma subseqüênte';
                    Exit;
                  End;
              End;
         End;

      // Critica Nº de Meses e se estão em sequência
      If wMascara[wi] = 'M' Then
         Begin
           If wiMes = 0 Then
              Begin
                wiMes := wi;
                wnMes := wnMes + 1;
              End
           Else
              Begin
                wiMes := wiMes + 1;
                wnMes := wnMes + 1;
                if (wiMes <> wi)
                or (wnMes  >  3) Then
                  Begin
                    werro := 'Máscara inválida. A máscara deve conter, no máximo, 3 caracteres "M" dispostos de forma subseqüênte';
                    Exit;
                  End;
              End;
         End;

      // Critica Nº de Anos e se estão em sequência
      If wMascara[wi] = 'A' Then
         Begin
           If wiAno = 0 Then
              Begin
                wiAno := wi;
                wnAno := wnAno + 1;
              End
           Else
              Begin
                wiAno := wiAno + 1;
                wnAno := wnAno + 1;
                if (wiAno <> wi)
                or (wnAno  >  4) Then
                  Begin
                    werro := 'Máscara inválida. A máscara deve conter, no máximo, 4 caracteres "A" dispostos de forma subseqüênte';
                    Exit;
                  End;
              End;
         End;

      // Critica Nº de Separadores e se estão em sequência
      If  (wMascara[wi] <> 'D')
      AND (wMascara[wi] <> 'M')
      AND (wMascara[wi] <> 'A') Then
         Begin
           If wiSep = 0 Then
              Begin
                wiSep := wi;
                wnSep := wnSep + 1;
              End
           Else
              Begin
                // Verifica Separadores diferentes
                If wMascara[wi] <> wMascara[wiSep] Then
                  Begin
                    werro := 'Máscara inválida. Os separadores de data devem ser iguais';
                    Exit;
                  End;
                // Verifica sequência
                wiSep := wiSep + 4;
                wnSep := wnSep + 1;
                if (wiSep  < wi)
                or (wi     > WiSep + 4)
                or (wnSep  >  2) Then
                  Begin
                    werro := 'Máscara inválida. Deve haver, no máximo, 2 separadores de data que não podem estar dispostos de forma subseqüênte';
                    Exit;
                  End;
              End;
         End;

     End;

  if wnDia <> 2 Then
     Begin
       werro := 'Máscara inválida. Deve haver 2 caracteres iguais a "D"';
       Exit;
     End;

  if (wnMes < 2)
  OR (wnMes > 3) Then
     Begin
       werro := 'Máscara inválida. Deve haver no mínimo 2 e no máximo 3 caracteres iguais a "M"';
       Exit;
     End;

  if (wnMes < 2)
  OR (wnMes > 4) Then
     Begin
       werro := 'Máscara inválida. Deve haver no mínimo 2 e no máximo 4 caracteres iguais a "A"';
       Exit;
     End;

  If  (wnSep  > 0)
  AND (wnSep <> 2) Then
     Begin
       werro := 'Máscara inválida. Deve haver 2 caracteres separadores de data';
       Exit;
     End;

  // Seta retono Verdadeiro
  Result := True;

End;


procedure TfrmCadLayoutArquivo.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Cancela Operacao
  QryDetalhe.Cancel;
// Levanta Botoes
  BtIns.Down :=False;
  BtAlt.Down :=False;
// Inabilita Botoes
  BtIns.Enabled :=True;
  BtAlt.Enabled :=True;
  BtProc.Enabled:=True;
  BtExcl.Enabled:=True;
// ReExecuta a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
// Mostra Grid
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible  :=True;
// Mostra Incluidos
  DbGrdDet.ApplySelected;
end;

procedure TfrmCadLayoutArquivo.QryDetalheAfterPost(DataSet: TDataSet);
begin
  try
   QryDetalhe.ApplyUpdates;
   QryDetalhe.CommitUpdates;
   QryCampos.Close;
   QryCampos.Open;
  except
   bbtnCancelar.Click;
   exit;
  end;    
end;

procedure TfrmCadLayoutArquivo.QryDetalheAfterDelete(DataSet: TDataSet);
begin
  QryDetalhe.ApplyUpdates;
  QryDetalhe.CommitUpdates;
  QryCampos.Close;
  QryCampos.Open;
end;

procedure TfrmCadLayoutArquivo.QryDetalheAfterInsert(DataSet: TDataSet);
begin
  QryDetalhe.FieldByName('NR_ORDEM').AsInteger := QryDetalhe.RecordCount + 1; //Seta próximo número de ordem do campo
  QryDetalhe.FieldByName('TP_ATRIBUTO').AsString := 'A';                      //Seta Alfanumérico como valor inicial
  QryDetalhe.FieldByName('IR_RELATORIO_OCORRENCIA').AsString := 'N';          //Seta N como valor Inicial
  DBEdtNomeCampo.SetFocus;
end;

procedure TfrmCadLayoutArquivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha As Querys
  QryPrincipal.Close;
  QryDetalhe.Close;
  QryCampos.Close;
//Querys de Vinculação
  qryDetalheVinc.Close;
  qryGrupoLogico.Close;
  qryGrupoAtributo.Close;
end;

//Habilita/Inabilita Detalhe
Procedure TfrmCadLayoutArquivo.SetDetalhe;
Begin
  If QryPrincipal.State in [dsInsert,dsEdit] Then
     PgCtrlDetalhe.ActivePageIndex := 0
End;

procedure TfrmCadLayoutArquivo.QryPrincipalUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  qryPrincipal.RevertRecord;
  UpdateAction := uaAbort;
end;

procedure TfrmCadLayoutArquivo.QryDetalheUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  qryDetalhe.RevertRecord;
  UpdateAction := uaAbort;
end;

procedure TfrmCadLayoutArquivo.BtInsVincClick(Sender: TObject);
begin
  // Abaixa Botao
  BtInsVinc.Down:=True;
  // Inabilita Botoes de Detalhe
  BtAltVinc.Enabled :=False;
  BtProcVinc.Enabled:=False;
  BtExclVinc.Enabled:=False;
  BtBtnDetalheVincValores.Enabled := False;  
  // Esconde Grid Mostra Painel
  DbGrdDetVinc.Visible:=False;
  PnlDetalheVinc.Visible:=True;
  // Seta Valores iniciais para combos
  DBLkpLstBxGrupo.KeyValue := qryGrupoLogico.FieldByName('CD_GRUPO').AsInteger;
  DBLkpListBxGrupoAtributo.KeyValue := qryGrupoAtributo.FieldByName('CHAVE').AsString;
  // Inclui Novo Registro
  QryDetalheVinc.Append;
end;

procedure TfrmCadLayoutArquivo.btAltVincClick(Sender: TObject);
begin
  // Se Nao Houverem Registros de Detalhe, Sai
  If QryDetalheVinc.RecordCount=0 then begin
     BtAltVinc.Down:=False;
     Exit;
  End;

  // Abaixa Botao
  BtAltVinc.Down:=True;
  // Inabilita Botoes de Detalhe
  BtInsVinc.Enabled:=False;
  BtProcVinc.Enabled:=False;
  BtExclVinc.Enabled:=False;
  BtBtnDetalheVincValores.Enabled := False;  
  // Esconde Grid Mostra Painel
  DbGrdDetVinc.Visible:=False;
  PnlDetalheVinc.Visible:=True;
  // Seta Valores iniciais para combos
  DBLkpLstBxGrupo.KeyValue := qryGrupoLogico.FieldByName('CD_GRUPO').AsInteger;
  DBLkpListBxGrupoAtributo.KeyValue := qryGrupoAtributo.FieldByName('CHAVE').AsString;
  // Alterar Registro
  QryDetalheVinc.Edit;
end;

procedure TfrmCadLayoutArquivo.BtProcVincClick(Sender: TObject);
begin
  // Muda Base de Dados e Executa Componente de Pesquisa
  SelDlgProcuraQry.DataSet:=QryDetalheVinc;
  SelDlgProcuraQry.Execute;
  // Volta Base de Dados Anterior
  SelDlgProcuraQry.DataSet:=QryPrincipal;
end;

procedure TfrmCadLayoutArquivo.BtExclVincClick(Sender: TObject);
begin
  // Se Vazio, Sai
  If QryDetalheVinc.RecordCount=0 then Exit;

  // Se Confirmar, Exclui Registro Posicionado
  If MessageBox(0,'Confirma ?','Mensagem do Sistema ',1) = IdOk Then
     QryDetalheVinc.Delete;
end;

procedure TfrmCadLayoutArquivo.bbtnOkDetVincClick(Sender: TObject);
begin

  If Not (QryDetalheVinc.State in [dsInsert,dsEdit]) Then
     Begin
       bbtnCancelarDetVincClick(Self); //Volta para o Browse
       Exit;
     End;

  // Efetua Críticas;
  If  qryGrupoAtributo.FieldByName('NO_TABELA').IsNull Then
     Begin
       ShowMessage('Selecione a informação desejada!');
       DBLkpListBxGrupoAtributo.SetFocus;
       Exit;
     End;

  //Move campos
  qryDetalheVinc.FieldByName('NO_TABELA').AsString :=
  qryGrupoAtributo.FieldByName('NO_TABELA').AsString;

  qryDetalheVinc.FieldByName('NO_ATRIBUTO_TABELA').AsString :=
  qryGrupoAtributo.FieldByName('NO_ATRIBUTO_TABELA').AsString;

  qryDetalheVinc.FieldByName('CD_ARQUIVO').AsInteger :=
  qryCampos.FieldByName('CD_ARQUIVO').AsInteger;

  qryDetalheVinc.FieldByName('SQ_CAMPO').AsInteger :=
  qryCampos.FieldByName('SQ_CAMPO').AsInteger;

  //Grava Tabela
  QryDetalheVinc.Post;

  qryDetalheVinc.ApplyUpdates;
  qryDetalheVinc.CommitUpdates;


If BtIns.Down=True Then
  //Prepara para nova Inclusão
  QryDetalhe.Append
Else
  //Volta para o Browse
  bbtnCancelarDetVincClick(Self);

end;

procedure TfrmCadLayoutArquivo.bbtnCancelarDetVincClick(Sender: TObject);
begin
  inherited;
// Cancela Operacao
  QryDetalheVinc.Cancel;
// Levanta Botoes
  BtInsVinc.Down :=False;
  BtAltVinc.Down :=False;
// Inabilita Botoes
  BtInsVinc.Enabled :=True;
  BtAltVinc.Enabled :=True;
  BtProcVinc.Enabled:=True;
  BtExclVinc.Enabled:=True;
// ReExecuta a Query
  QryDetalheVinc.Close;
  QryDetalheVinc.Open;
// Mostra Grid
  PnlDetalheVinc.Visible:=False;
  DbGrdDetVinc.Visible  :=True;
// Mostra Incluidos
  DbGrdDetVinc.ApplySelected;
end;

procedure TfrmCadLayoutArquivo.qryDetalheVincAfterDelete(
  DataSet: TDataSet);
begin
  QryDetalheVinc.ApplyUpdates;
  QryDetalheVinc.CommitUpdates;
  qryDetalheVincAfterOpen(qryDetalheVinc);
end;

procedure TfrmCadLayoutArquivo.qryDetalheVincAfterPost(DataSet: TDataSet);
begin
  try
   QryDetalheVinc.ApplyUpdates;
   QryDetalheVinc.CommitUpdates;
  except
   bbtnCancelar.Click;
   exit;
  end;     
end;

procedure TfrmCadLayoutArquivo.qryDetalheVincAfterOpen(DataSet: TDataSet);
begin
  If qryDetalheVinc.FieldByName('NO_TABELA').IsNull Then
     BtBtnDetalheVincValores.Enabled := False
  Else
     BtBtnDetalheVincValores.Enabled := True;

  if QryDetalhe.FieldByName('SQ_CAMPO').IsNull Then
     Begin
       BtInsVinc.Enabled :=False;
       BtAltVinc.Enabled :=False;
       BtProcVinc.Enabled:=False;
       BtExclVinc.Enabled:=False;
     End
  Else
     Begin
       BtInsVinc.Enabled :=True;
       BtAltVinc.Enabled :=True;
       BtProcVinc.Enabled:=True;
       BtExclVinc.Enabled:=True;
     End;

end;

procedure TfrmCadLayoutArquivo.BtBtnDetalheVincValoresClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCamposVincValores,TfrmCadCamposVincValores,False );
end;

procedure TfrmCadLayoutArquivo.qryDetalheVincUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  qryDetalheVinc.RevertRecord;
  UpdateAction := uaAbort;
end;

procedure TfrmCadLayoutArquivo.BtBtnValidaLayoutClick(Sender: TObject);
Var WLayout : TValidaLayout;
begin

  //-- Cria Form de Animação
  Application.CreateForm(TfrmAnimacao, frmAnimacao);
  frmAnimacao.SetAnimacao ('Validando Lay-out...',0,False,False,aviFindFile);

  WLayout := TValidaLayout.Create (Self);

  if WLayout.Layout_Valido(QryPrincipal.FieldByName('CD_ARQUIVO').AsInteger) Then
     Begin
       frmAnimacao.Free;
       WLayout.Free;
       ShowMessage ('Lay-out de arquivo validado com Sucesso');
     End
  Else
     Begin
       frmAnimacao.Free;
       If WLayout.FErro Then
          Begin
            ShowMessage(WLayout.FMensagem);
            WLayout.Free;
            abort;
          End
       Else
          If WLayout.FAviso Then
             ShowMessage(WLayout.FMensagem);
       WLayout.Free;
    End;
end;

procedure TfrmCadLayoutArquivo.SpdBttnExcluiOcorrClick(Sender: TObject);
begin
  QryDetalhe.FieldByName('CD_ARQUIVO_MASTER').Value := Null;
  QryDetalhe.FieldByName('SQ_CAMPO_MASTER').Value := Null;
  DBLkpCmbBxOcorr.KeyValue := -1;
end;

procedure TfrmCadLayoutArquivo.qryDetalheVincBeforePost(DataSet: TDataSet);
begin
  If qryDetalheVinc.State = dsInsert Then
     Begin
       qryDetalheVinc.FieldByName('CD_ARQUIVO').AsInteger := QryDetalhe.FieldByName('CD_ARQUIVO').AsInteger;
       qryDetalheVinc.FieldByName('SQ_CAMPO').AsInteger := QryDetalhe.FieldByName('SQ_CAMPO').AsInteger;
     End;
end;

procedure TfrmCadLayoutArquivo.QryDetalheAfterOpen(DataSet: TDataSet);
begin
  //Habilita Botão
  If QryDetalhe.IsEmpty Then
     BtBtnValidaLayout.Enabled := False
  Else
     BtBtnValidaLayout.Enabled := True;
end;

procedure TfrmCadLayoutArquivo.QryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Seta valores iniciais para os campos;
  QryPrincipal.FieldByName('TP_ARQUIVO').AsString := 'F';
  QryPrincipal.FieldByName('TP_DELIMITADOR_CAMPO').Value := Null;
  QryPrincipal.FieldByName('DS_OUTRO_DELIMITADOR').Value := Null;
  QryPrincipal.FieldByName('TP_QUALIFICADOR_TEXTO').Value := Null;
  QryPrincipal.FieldByName('IR_PARA_IMPORTACAO').AsString := 'N';
  QryPrincipal.FieldByName('IR_PARA_EXPORTACAO').AsString := 'N';
end;

procedure TfrmCadLayoutArquivo.CmeCadastroFind(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmCadLayoutArquivo.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_ARQUIVO', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

procedure TfrmCadLayoutArquivo.SBtnGerarClick(Sender: TObject);
begin
  inherited;
  SBtnGerar.Down := false;
  if qryPrincipal.IsEmpty then
    exit;

  dtmRelatsAtuarial.qryLayout.Close;
  dtmRelatsAtuarial.qryLayout.ParamByName('CD_ARQUIVO').asInteger :=
     qryPrincipal.FieldByName('CD_ARQUIVO').asInteger;
  dtmRelatsAtuarial.qryLayout.Open;
  dtmRelatsAtuarial.rptLayout.Print;
end;

end.
