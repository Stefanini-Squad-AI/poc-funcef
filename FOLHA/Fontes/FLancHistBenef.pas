// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
//Pendência   : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        : 22/02/2018
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
//Pendência   : SOL 208956 - KTN 2017630
//Responsável : William Santana
//Data        : 23/09/2013
//Descrição   : Alteração no arquivo de entrada
//------------------------------------------------------------------------------

unit FLancHistBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, fcLabel, Buttons, ExtCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, TB97, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  Db, DBTables, Wwquery, Wwdatsrc, ComCtrls, DBClient, uCMClientDataSet,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmLancHistBenef = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    SB1: TSpeedButton;
    edtArquivo: TEdit;
    bBtnDesfazer: TBitBtn;
    Label2: TLabel;
    dblkcMotivo: TwwDBLookupCombo;
    dblkcLote: TwwDBLookupCombo;
    qryMotivo: TwwQuery;
    qryMotivoIDMOTIVO: TFloatField;
    qryMotivoDESCRICAO: TStringField;
    QryImporta: TwwQuery;
    qryLote: TwwQuery;
    OpenDialog1: TOpenDialog;
    DsImporta: TwwDataSource;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    mmResultado: TMemo;
    GS: TwwDBGrid;
    TabSheet3: TTabSheet;
    mmLogErro: TMemo;
    qryLoteIDLOTE: TFloatField;
    qryLoteMESREFERENCIA: TStringField;
    qryLoteDESCRICAO: TStringField;
    qryLoteDATAPAGAMENTO: TDateTimeField;
    RGLancamento: TRadioGroup;
    lblLote: TLabel;
    QryImportaIDTITULAR: TFloatField;
    QryImportaIDPESSJUR: TFloatField;
    QryImportaIDPLANOPREV: TFloatField;
    QryImportaIDBENEFICIO: TFloatField;
    QryImportaIDMOTIVO: TFloatField;
    QryImportaIDPESSOA: TFloatField;
    QryImportaNUMEROPROCESSO: TFloatField;
    QryImportaMES: TStringField;
    QryImportaSEQBENEFICIO: TFloatField;
    QryImportaSEQPROPOSTA: TFloatField;
    QryImportaIDLOTE: TFloatField;
    QryImportaVLBENEFPGTO: TFloatField;
    QryImportaDATAPAGAMENTO: TDateTimeField;
    QryImportaCODPORTFORMA: TFloatField;
    QryImportaVALORPREV: TFloatField;
    QryImportaFLGACERTODESFEITO: TFloatField;
    QryImportaCODREFERENCIA: TStringField;
    QryImportaFLGENVIADO: TFloatField;
    QryImportaMESREFERENCIA: TStringField;
    QryImportaFLGCONCESSAO: TFloatField;
    QryImportaFLGDEVOLUCAO: TFloatField;
    QryImportaFLGFORMAPAGTO: TStringField;
    QryImportaVALORTOTAL: TFloatField;
    QryImportaFONTEPAGADORA: TFloatField;
    QryImportaVALORINTEGRAL: TFloatField;
    QryImportaDTEFETPGTO: TDateTimeField;
    QryImportaVALORCALCULADO: TFloatField;
    QryImportaESTADO: TStringField;
    QryImportaFLGMANUAL: TFloatField;
    QryImportaIDPLANOORIGEM: TFloatField;
    QryImportaVALOROP1: TFloatField;
    QryImportaVALOROP2: TFloatField;
    QryImportaVALOROP3: TFloatField;
    QryImportaVALORPREVMIN: TFloatField;
    QryImportaVALORSRB: TFloatField;
    QryImportaPERCENTUAL: TFloatField;
    QryImportaIDSEQINTERNOFB: TFloatField;
    QryImportaTRGDTINCLUSAO: TDateTimeField;
    QryImportaTRGUSERINCLUSAO: TStringField;
    QryImportaNOMEUSU: TStringField;
    QryImportaTIPOMANUAL: TStringField;
    QryImportaFLGTIPOREGISTRO: TFloatField;
    QryImportaTIPOREGISTRO: TStringField;
    QryImportaALIMRESERVA: TStringField;
    QryImportaDESCRICAO: TStringField;
    QryImportaMATRICULA: TStringField;
    QryImportaNOME: TStringField;
    QryImportaMESCOMPREEM: TStringField;
    prbReproc: TProgressBar;
    QryExcel: TwwQuery;
    QryExcelMATRICULA: TStringField;
    QryExcelMESCOBRANCA: TStringField;
    QryExcelMESREFERENCIA: TStringField;
    QryExcelMESCOMPETENCIAINSS: TStringField;
    QryExcelVALORPREVISTO: TFloatField;
    QryExcelIDBENEFICIO: TFloatField;
    QryExcelIDPLANOPREV: TFloatField;
    QryExcelIDPLANOORIGEM: TFloatField;
    QryExcelFLGFONTEPAGADORA: TFloatField;
    QryExcelFLGTIPOREGISTRO: TFloatField;
    QryExcelFLGDEVOLUCAO: TFloatField;
    UpdateSQL1: TUpdateSQL;
    QryImportaDESCLOTE: TStringField;
    strngfldQryExcelNUMEROPROCESSO: TStringField;   //  William Santana  SOL 208956 - KTN 2017630
    procedure RBLancLoteClick(Sender: TObject);
    procedure RBLancProcessadoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblkcLoteChange(Sender: TObject);
    procedure dblkcMotivoChange(Sender: TObject);
    procedure dblkcMotivoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkcLoteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure SB1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure RGLancamentoExit(Sender: TObject);
    procedure edtArquivoKeyPress(Sender: TObject; var Key: Char);
    procedure edtArquivoChange(Sender: TObject);
    procedure edtArquivoExit(Sender: TObject);
    procedure GSCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bBtnDesfazerClick(Sender: TObject);
    procedure RGLancamentoClick(Sender: TObject);
    procedure dblkcLoteExit(Sender: TObject);
    procedure dblkcMotivoExit(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure dtDataExit(Sender: TObject);
    procedure dtDataChange(Sender: TObject);
    procedure dtDataEnter(Sender: TObject);
    procedure dtDataClick(Sender: TObject);
  private
    dtData : TDateTime;
    Function ExtraiCampo(var Linha: String; bInteiro: Boolean): String;
    Function ValidaDados : Boolean;
    Function Importar: Boolean;
    Function ArquivoJaImportado: Boolean;
    Procedure DeletaRegistro;
    Procedure AtualizaBusca(dData: TDateTime; FlgBusca: String = 'N');

    Procedure AlimentaCamposIDs;
    Procedure ZerarRegistros;
    Function CarregaArquivoExcel: Boolean;
    Function ListaExcel: OleVariant;
    Function ValidaNumProcesso: Boolean; //William Santana SOL 208956 KIN 2017630

  public
    Registro : Record
      //CAMPOS DO ARQUIVO //////////
      NumeroProcesso: Integer;    //  William Santana  SOL 208956 - KTN 2017630
      Matricula: String;          //
      MesCobranca: String;        //  (DATAPAGAMENTO ex: 20/MM/YYYY)
      MesReferencia : String;     //  (MES e MESREFERENCIA)
      MesCompetenciaINSS: String; //  (MESCOMPREEM)
      ValorPrevisto: Double;      //
      IDBeneficio: Integer;       //
      IDPlanoPrev: Integer;       //
      IDPlanoOrigem: Integer;     //
      FlgFontePagadora: Integer;  //
      FlgTipoRegistro: Integer;   //
      FlgDevolucao: integer;      //
      FlgEnviado: integer;        //
      //////////////////////////////

      //CAMPOS ID //////////////////
      IDPessoa: Integer;          // OK
      IDTitular: integer;         // OK
      IDPessjur: Integer;         // OK
      IDMotivo: Integer;          // OK
    //  NumeroProcesso: Integer;    // OK
      SeqProposta: Integer;       // OK
      IDLote: Integer;            // OK
      FlgConcessao: Integer;      // OK //Sempre 1.
      SeqBeneficio: Integer;      // OK
      FlgManual: Integer;         // OK // 3 Importação de arquivo.
      IDSeqInternoFb: Integer;    // OK //se for inserção, Buscar o próximo da sequenci SEQINTERNOFB

      DtEfetPgto: String;         // ****  se FLGENVIADO = 1 (Processado) Pegar do arquivo o mês e ano COBRANCA + dia 20  //Será igual a data prevista, quando o registro for lançado como PROCESSADO.
      VlBenefPgto: Double;        // ****  se FLGENVIADO = 1 (Processado) Pegar do arquivo o Valor Previsto //Será igual ao valor previsto, quando o registro for lançado como PROCESSADO.
      DataPagamento: String;      // ****  Pegar do arquivo o mês e ano COBRANCA + dia 20

      ValorTotal: Double;         // Indica o valor total do beneficio (sem rateio) no mes de referencia.
      ValorIntegral: Double;      // Valor integral do benefício no caso de estar sendo pago um pro rata do benefício no mês de referência.
      ValorCalculado: Double;     // Valor calculado na concessão e igual ao valor previsto de pagamento do benefício.
      ValorSRB: Double;           // Valor do Salário Real de Benefício no mês que está sendo gerado.

      //VARIAVEIS AUXILIAR ////
      SequenciaFor: Integer; //
      LogErro: String;       //
      Resultado: String;     //
      Totalizador: Double;   //
      QtdImportado: Integer; //
      /////////////////////////
    end;
  end;
  
var
  frmLancHistBenef: TfrmLancHistBenef;

implementation
uses
  UMensErro, DBaseDados, uDataBase, uCtrlPadroes, uFuncoesUteis,
  ComObj;

{$R *.DFM}

procedure TfrmLancHistBenef.RBLancLoteClick(Sender: TObject);
begin
  inherited;
{  if (RBLancLote.Checked) then
     dblkcLote.Visible := True;}
end;

procedure TfrmLancHistBenef.RBLancProcessadoClick(Sender: TObject);
begin
  inherited;
{  if (RBLancProcessado.Checked) then
     dblkcLote.Visible := False;}
end;

procedure TfrmLancHistBenef.FormShow(Sender: TObject);
var
  Mes, Ano: Word;
begin
  inherited;
  RGLancamento.ItemIndex := 0; //a Processar

  PageControl.Pages[0].TabVisible := True;
  PageControl.Pages[1].TabVisible := False;
  PageControl.Pages[2].TabVisible := False;

  QryLote.Close;
  QryLote.Open;

  QryMotivo.Close;
  QryMotivo.SQL.Clear;
  QryMotivo.SQL.Add('SELECT IDMOTIVO, DESCRICAO FROM MOTIVO ORDER BY UPPER(DESCRICAO)');
  QryMotivo.Open;

  bbtnCancelar.Enabled := ((dblkcMotivo.Text <> '') or (dblkcLote.Text <> ''));
  bbtnConfirmar.Enabled := ((dblkcMotivo.Text <> '') and (dblkcLote.Text <> ''));
  bBtnDesfazer.Enabled := ((dblkcMotivo.Text <> '') and (dblkcLote.Text <> ''));

  Mes := StrToInt(Copy(FormatDateTime('DD/MM/YYYY', Now), 4, 2));
  Ano := StrToInt(Copy(FormatDateTime('DD/MM/YYYY', Now), 7, 4));

  dtData := StrToDate(FormatDateTime('DD/MM/YYYY', EncodeDate(Ano, Mes, 20)));

end;

procedure TfrmLancHistBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryMotivo.Close;
  QryLote.Close;
  QryImporta.Close;
end;

procedure TfrmLancHistBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dblkcMotivo.Clear;
   dblkcLote.Clear;
   EdtArquivo.Clear;
   QryImporta.Close;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := Not (QryImporta.IsEmpty);

   if (bbtnSair.Enabled = False) then bbtnSair.Enabled:= True;  // William Santana SOL 208956 - KTN 2017630
end;

procedure TfrmLancHistBenef.dblkcLoteChange(Sender: TObject);
begin
  inherited;
  //  Atualiza Botões
{  bbtnCancelar.Enabled := ((dblkcMotivo.Text <> '') or ((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (edtArquivo.Text <> ''));
  bbtnConfirmar.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
  bBtnDesfazer.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
 }
     
  AtualizaBusca(dtData);

end;

procedure TfrmLancHistBenef.dblkcMotivoChange(Sender: TObject);
begin
  
    AtualizaBusca(dtData);

  //  Atualiza Botões
{  bbtnCancelar.Enabled := ((dblkcMotivo.Text <> '') or ((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (edtArquivo.Text <> ''));
  bbtnConfirmar.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
  bBtnDesfazer.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
 }
end;

procedure TfrmLancHistBenef.dblkcMotivoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin

  AtualizaBusca(dtData);

end;

procedure TfrmLancHistBenef.dblkcLoteCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin

  AtualizaBusca(dtData);
    
end;

procedure TfrmLancHistBenef.SB1Click(Sender: TObject);
begin
  inherited;
  If (OpenDialog1.Execute) Then
     edtArquivo.Text := UpperCase(OpenDialog1.FileName);

  // William Santana SOL 208956 - KTN 2017630
  If edtArquivo.Text <> '' then
    bbtnSair.Enabled:= False
  else
     bbtnSair.Enabled:= True;
  // END- William Santana SOL 208956 - KTN 2017630   
end;

procedure TfrmLancHistBenef.bbtnConfirmarClick(Sender: TObject);
var
  i: Integer;
  Log: TStringList;
  Resultado: TStringList;
  Mes, Ano: Word;
  ArquivoSemErros : Boolean; //William Santana SOL 208956 KIN 2017630
begin
  QryImporta.Close;
  PageControl.Pages[0].TabVisible := True;
  PageControl.Pages[1].TabVisible := False;
  PageControl.Pages[2].TabVisible := False;

  mmResultado.Clear;
  mmLogErro.Clear;

  ZerarRegistros;
  prbReproc.Max := 0;
  prbReproc.StepIt;


{  if (RBLancLote.Checked = False) and (RBLancProcessado.Checked = False) then
  begin
     MsgDlg('É necessário selecionar se o lançamento será feito como processado ou não.', 'Atenção', mtWarning, [mbOk], 0);
     RBLancProcessado.SetFocus;
     Abort;
  end;}

{  if (RBLancLote.Checked) and (Trim(dblkcLote.Text) = '') then
  begin
     MsgDlg('É necessário selecionar o para pagamento.', 'Atenção', mtWarning, [mbOk], 0);
     dblkcLote.SetFocus;
     Abort;
  end;}

  if RGLancamento.ItemIndex < 0 then
  begin
     MsgDlg('É necessário informar o estado dos lançamentos.', 'Atenção', mtWarning, [mbOk], 0);
     RGLancamento.SetFocus;
     Abort;
  end;

  if (Trim(dblkcMotivo.Text) = '') then
  begin
     MsgDlg('É necessário informar o motivo dos lançamentos.', 'Atenção', mtWarning, [mbOk], 0);
     dblkcMotivo.SetFocus;
     Abort;
  end;

  if (Trim(edtArquivo.Text) = '') then
  begin
     MsgDlg('É necessário selecionar o arquivo para importação.', 'Atenção', mtWarning, [mbOk], 0);
     edtArquivo.SetFocus;
     Abort;
  end;

  //Cria a variavel arquivo
  Log       := TStringList.Create();
  Resultado := TStringList.Create();

  //Verifica se o arquivo existe no diretório informado
  if Not(FileExists(edtArquivo.Text)) then
  begin
     MsgDlg('Arquivo de importação não existe.', 'Atenção', mtWarning, [mbOk], 0);
     edtArquivo.SetFocus;
     Abort;
  end;                 

  If (MsgDlg('Deseja Importar o Arquivo?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrNo) Then
     Abort;

    Try

      If Not dtmbasedados.dbBaseDados.InTransaction Then
         dtmbasedados.dbBaseDados.StartTransaction;

      Try

        If Not(CarregaArquivoExcel) then
        begin
          MsgDlg('O arquivo está vazio!' +#13+#10+
                 'O processo será cancelado.', 'Atenção', mtWarning, [mbOk], 0);
          Exit;
        end;
        
        Resultado.Add('Manual de Lançamentos para histórico de benefícios');
        Resultado.Add('Resultado de Importação de Arquivo');
        Resultado.Add('');
        Resultado.Add('Matricula       Valor       ');
        Resultado.Add('');

        Log.Add('Manual de Lançamentos para histórico de benefícios');
        Log.Add('Erros de Importação de Arquivo');
        Log.Add('');


        prbReproc.Position := 0;
        prbReproc.Max := QryExcel.RecordCount;

        //Verifica Arquivos ja importados
        QryExcel.First;
        While Not(QryExcel.Eof) do
        begin
          Registro.Matricula           := QryExcel.FieldByName('MATRICULA').AsString;
          Registro.MesCobranca         := QryExcel.FieldByName('MESCOBRANCA').AsString;
          Registro.MesReferencia       := QryExcel.FieldByName('MESREFERENCIA').AsString;
          Registro.MesCompetenciaINSS  := QryExcel.FieldByName('MESCOMPETENCIAINSS').AsString;
          Registro.ValorPrevisto       := QryExcel.FieldByName('VALORPREVISTO').AsFloat;
          Registro.IDBeneficio         := QryExcel.FieldByName('IDBENEFICIO').AsInteger;
          Registro.IDPlanoPrev         := QryExcel.FieldByName('IDPLANOPREV').AsInteger;
          Registro.IDPlanoOrigem       := QryExcel.FieldByName('IDPLANOORIGEM').AsInteger;
          Registro.FlgFontePagadora    := QryExcel.FieldByName('FLGFONTEPAGADORA').AsInteger;
          Registro.FlgTipoRegistro     := QryExcel.FieldByName('FLGTIPOREGISTRO').AsInteger;
          Registro.FlgDevolucao        := QryExcel.FieldByName('FLGDEVOLUCAO').AsInteger;

          // William Santana  SOL 208956 - KTN 2017630
          try
           Registro.NumeroProcesso     := StrToInt(QryExcel.FieldByName('NUMEROPROCESSO').AsString);
          except
           Registro.NumeroProcesso     := -1;
          end;
          //END - William Santana  SOL 208956 - KTN 2017630

          If ArquivoJaImportado then
          begin
             if (MsgDlg('Existem registros no arquivo que já foram importados!' +#13+#10+
                        'Talvez o arquivo ja tenha sido importado!' +#13+#10+
                        'Deseja continuar a importação?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrNo) Then
                Exit
             else
                Break;
          end;

          prbReproc.StepIt;
          QryExcel.Next;

        End; //END LOOP

        prbReproc.Position := 0;
        prbReproc.Max := QryExcel.RecordCount;
        i := 2; //Pulando o cabeçalho

        // William Santana  SOL 208956 - KTN 2017630

        { QryExcel.First;
        While Not(QryExcel.Eof) do
        begin

          Registro.SequenciaFor        := i;
          Registro.Matricula           := QryExcel.FieldByName('MATRICULA').AsString;
          Registro.MesCobranca         := QryExcel.FieldByName('MESCOBRANCA').AsString;
          Registro.MesReferencia       := QryExcel.FieldByName('MESREFERENCIA').AsString;
          Registro.MesCompetenciaINSS  := QryExcel.FieldByName('MESCOMPETENCIAINSS').AsString;
          Registro.ValorPrevisto       := QryExcel.FieldByName('VALORPREVISTO').AsFloat;
          Registro.IDBeneficio         := QryExcel.FieldByName('IDBENEFICIO').AsInteger;
          Registro.IDPlanoPrev         := QryExcel.FieldByName('IDPLANOPREV').AsInteger;
          Registro.IDPlanoOrigem       := QryExcel.FieldByName('IDPLANOORIGEM').AsInteger;
          Registro.FlgFontePagadora    := QryExcel.FieldByName('FLGFONTEPAGADORA').AsInteger;
          Registro.FlgTipoRegistro     := QryExcel.FieldByName('FLGTIPOREGISTRO').AsInteger;
          Registro.FlgDevolucao        := QryExcel.FieldByName('FLGDEVOLUCAO').AsInteger;

          AlimentaCamposIDs;

          if (ValidaDados) then
          begin
            Importar;
            Resultado.Add(Registro.Resultado);
          end else
            Log.Add(Registro.LogErro);

          prbReproc.StepIt;
          QryExcel.Next;
          Inc(i);

        end; //Fim do Loop}

        ArquivoSemErros := true;
        QryExcel.First;
        While Not(QryExcel.Eof) do
        begin

          Registro.SequenciaFor        := i;
          Registro.Matricula           := QryExcel.FieldByName('MATRICULA').AsString;
          Registro.MesCobranca         := QryExcel.FieldByName('MESCOBRANCA').AsString;
          Registro.MesReferencia       := QryExcel.FieldByName('MESREFERENCIA').AsString;
          Registro.MesCompetenciaINSS  := QryExcel.FieldByName('MESCOMPETENCIAINSS').AsString;
          Registro.ValorPrevisto       := QryExcel.FieldByName('VALORPREVISTO').AsFloat;
          Registro.IDBeneficio         := QryExcel.FieldByName('IDBENEFICIO').AsInteger;
          Registro.IDPlanoPrev         := QryExcel.FieldByName('IDPLANOPREV').AsInteger;
          Registro.IDPlanoOrigem       := QryExcel.FieldByName('IDPLANOORIGEM').AsInteger;
          Registro.FlgFontePagadora    := QryExcel.FieldByName('FLGFONTEPAGADORA').AsInteger;
          Registro.FlgTipoRegistro     := QryExcel.FieldByName('FLGTIPOREGISTRO').AsInteger;
          Registro.FlgDevolucao        := QryExcel.FieldByName('FLGDEVOLUCAO').AsInteger;

          try
           Registro.NumeroProcesso     := StrToInt(QryExcel.FieldByName('NUMEROPROCESSO').AsString);
          except
           Registro.NumeroProcesso     := -1;
          end;

          AlimentaCamposIDs;

           if not(ValidaDados) then
           begin
             Log.Add(Registro.LogErro);
             ArquivoSemErros := False;
           end;

          QryExcel.Next;
          Inc(i);

        end; //Fim do Loop

        If ArquivoSemErros then
        begin
         i := 2;
         QryExcel.First;
         While Not(QryExcel.Eof) do
         begin

          Registro.SequenciaFor        := i;
          Registro.Matricula           := QryExcel.FieldByName('MATRICULA').AsString;
          Registro.MesCobranca         := QryExcel.FieldByName('MESCOBRANCA').AsString;
          Registro.MesReferencia       := QryExcel.FieldByName('MESREFERENCIA').AsString;
          Registro.MesCompetenciaINSS  := QryExcel.FieldByName('MESCOMPETENCIAINSS').AsString;
          Registro.ValorPrevisto       := QryExcel.FieldByName('VALORPREVISTO').AsFloat;
          Registro.IDBeneficio         := QryExcel.FieldByName('IDBENEFICIO').AsInteger;
          Registro.IDPlanoPrev         := QryExcel.FieldByName('IDPLANOPREV').AsInteger;
          Registro.IDPlanoOrigem       := QryExcel.FieldByName('IDPLANOORIGEM').AsInteger;
          Registro.FlgFontePagadora    := QryExcel.FieldByName('FLGFONTEPAGADORA').AsInteger;
          Registro.FlgTipoRegistro     := QryExcel.FieldByName('FLGTIPOREGISTRO').AsInteger;
          Registro.FlgDevolucao        := QryExcel.FieldByName('FLGDEVOLUCAO').AsInteger;

          try
           Registro.NumeroProcesso     := StrToInt(QryExcel.FieldByName('NUMEROPROCESSO').AsString);
          except
           Registro.NumeroProcesso     := -1;
          end;

          AlimentaCamposIDs;

           Importar;

           Registro.Resultado := Registro.Matricula + '       ' +
                         'R$ ' + FormatFloat('###,###,##0.00',Registro.ValorPrevisto);
                                 Registro.Totalizador := Registro.Totalizador + Registro.ValorPrevisto;
                                 Registro.QtdImportado := Registro.QtdImportado + 1;

           Resultado.Add(Registro.Resultado);
          
          prbReproc.StepIt;
          QryExcel.Next;
          Inc(i);

         end; //Fim do Loop
        end;
        //END - William Santana  SOL 208956 - KTN 2017630

        if Resultado.Count > 1 then
        begin
           Resultado.Add('');
           Resultado.Add('Quantidade total de matriculas importadas: ' + IntToStr(Registro.QtdImportado) + ' Matriculas');
           Resultado.Add('Valor total importado: R$ ' + FormatFloat('###,###,##0.00',Registro.Totalizador));
           Resultado.SaveToFile('C:\PLANUS\TEMP\IMPORT_HISTORICOBENEFICIO_'+ FormatDateTime('DDMMYYYY',(Now)) + '.txt');
           PageControl.Pages[1].TabVisible := True;
           mmResultado.Lines.LoadFromFile('C:\PLANUS\TEMP\IMPORT_HISTORICOBENEFICIO_'+ FormatDateTime('DDMMYYYY',(Now)) + '.txt');
        end;

        if Log.Count > 1 then
        begin
           Log.SaveToFile('C:\PLANUS\TEMP\IMPORT_HISTORICOBENEFICIO_LOGERRO_'+ FormatDateTime('DDMMYYYY',(Now)) + '.txt');
           PageControl.Pages[2].TabVisible := True;
           mmLogErro.lines.LoadFromFile('C:\PLANUS\TEMP\IMPORT_HISTORICOBENEFICIO_LOGERRO_'+ FormatDateTime('DDMMYYYY',(Now)) + '.txt');
        end;      
        
      Except
        on e: Exception do
        begin
          MsgDlg('Ocorreu o seguinte erro ao importar o arquivo:' +#13+#10+
                  UpperCase(e.Message) + #13+#10+
                  'O processo será cancelado.', 'Atenção', mtError, [mbOk], 0);

          If dtmbasedados.dbBaseDados.InTransaction Then
             dtmbasedados.dbBaseDados.Rollback;
        end;
      End;

    Finally
      edtArquivo.Clear;
      dblkcMotivo.Clear;
      dblkcLote.Clear;

      bbtnSair.Enabled := True; // William Santana  SOL 208956 - KTN 2017630

      if Trim(Registro.MesCobranca) <> '' then
      begin
         Mes := StrToInt(Copy(Registro.MesCobranca, Pos('/',Registro.MesCobranca) + 1, Length(Registro.MesCobranca)));
         Ano := StrToInt(Copy(Registro.MesCobranca, 1, Pos('/',Registro.MesCobranca) - 1));
         dtData := StrToDate(FormatDateTime('DD/MM/YYYY', EncodeDate(Ano,Mes,20)));
      end;

{      QryImporta.Close;
      QryImporta.ParamByName('DATAPAGAMENTO').AsString := Registro.DataPagamento;
      QryImporta.ParamByName('IDMOTIVO').AsInteger     := qryMotivoIDMOTIVO.AsInteger;
      if (dblkcLote.Visible) then
         QryImporta.ParamByName('IDLOTE').AsInteger       := qryLoteIDLOTE.AsInteger;
      QryImporta.ParamByName('FLGENVIADO').AsInteger   := RGLancamento.ItemIndex;
      QryImporta.Open;}

      AtualizaBusca(dtData, 'S');

      If dtmbasedados.dbBaseDados.InTransaction Then
         dtmbasedados.dbBaseDados.Commit;

      ZerarRegistros;
      prbReproc.Position := 0;

      FreeAndNil(Log);
      FreeAndNil(Resultado);
    End;

end;

function TfrmLancHistBenef.ExtraiCampo(var Linha: String; bInteiro: Boolean): String;
begin
   If pos(';', Linha) > 0 Then
      Result := Trim(Copy(Linha, 1, pos(';', Linha) - 1))
   Else
      Result := Trim(copy(Linha, 1, Length(Linha))); //Ultimo Campo

   If ((Trim(Result)) = '') and (bInteiro) then
     Result := '-1';

   Linha := copy(Linha, Pos(';', Linha) + 1, Length(Linha));
end;

function TfrmLancHistBenef.ValidaDados: Boolean;
begin
  Result := True;
  Registro.LogErro := '';

  If Trim(Registro.Matricula) = '' then
  begin
    Registro.LogErro := 'Matricula não informada; ' + #13#10;
    Result := False;
  End
  else
  If (Registro.IDPessoa = -1) or (Registro.IDTitular = -1) or
     (Registro.IDPessjur = -1) or (Registro.NumeroProcesso = -1) or
     (Registro.SeqProposta = -1) then
  begin
    Registro.LogErro := 'Informações não localizadas; ' + #13#10;
    Result := False;
  End;

  If Trim(Registro.MesCobranca) = '' then
  begin
    Registro.LogErro := Registro.LogErro + 'Mês de Cobrança não informado; ' + #13#10;
    Result := False;
  End;

  If Trim(Registro.MesReferencia) = '' then
  begin
    Registro.LogErro := Registro.LogErro + 'Mês de Referência não informado; ' + #13#10;
    Result := False;
  End;

  If ((Trim(Registro.MesCompetenciaINSS) = '') and (Registro.FlgFontePagadora = 2)) then
  begin
    Registro.LogErro := Registro.LogErro + 'Mês de Competencia não informado; ' + #13#10;
    Result := False;
  End;

  If Registro.ValorPrevisto = -1 then
  begin
    Registro.LogErro := Registro.LogErro + 'Valor previsto não informado; ' + #13#10;
    Result := False;
  End;

  If Registro.IDBeneficio = -1 then
  begin
    Registro.LogErro := Registro.LogErro + 'Beneficio não informado; ' + #13#10;
    Result := False;
  End;

  If Registro.IDPlanoPrev = -1 then
  begin
    Registro.LogErro := Registro.LogErro + 'Plano não informado; ' + #13#10;
    Result := False;
  End;

  If Registro.IDPlanoOrigem = -1 then
  begin
    Registro.LogErro := Registro.LogErro + 'Plano de origem não informado; ' + #13#10;
    Result := False;
  End;

  If Not(Registro.FlgFontePagadora in [1,2]) then
  begin
    Registro.LogErro := Registro.LogErro + 'Fonte pagadora inválida; ' + #13#10;
    Result := False;
  End;

  If Not(Registro.FlgTipoRegistro in [0,1,2,3,4,5]) then
  begin
    Registro.LogErro := Registro.LogErro + 'Tipo do registro de lançamento inválido; ' + #13#10;
    Result := False;
  End;

  If Not(Registro.FlgDevolucao in [0,1]) then
  begin
    Registro.LogErro := Registro.LogErro + 'Tipo do lançamento inválido; ' + #13#10;
    Result := False;
  End;

  // William Santana  SOL 208956 - KTN 2017630
  If (Registro.NumeroProcesso = -1) then
  begin
   Registro.LogErro := Registro.LogErro + 'Número do processo de benefício '+QryExcel.FieldByName('NUMEROPROCESSO').AsString +' é inválido.' + #13#10;;
   Result := False;
  end;

  {
  If (Result) then //OK
  Begin
    Registro.Resultado := Registro.Matricula + '       ' +
                          'R$ ' + FormatFloat('###,###,##0.00',Registro.ValorPrevisto);// + '       ' +
//                          'Linha ' + IntToStr(Registro.SequenciaFor);
    Registro.Totalizador := Registro.Totalizador + Registro.ValorPrevisto;
    Registro.QtdImportado := Registro.QtdImportado + 1;
  end else //Não Ok
    Registro.LogErro := 'Linha ' + IntToStr(Registro.SequenciaFor) + ': ' + #13#10 + Registro.LogErro + #13#10;
  }

   if not(Result) then
     Registro.LogErro := 'Linha ' + IntToStr(Registro.SequenciaFor) + ': ' + #13#10 + Registro.LogErro + #13#10;
  //END - William Santana  SOL 208956 - KTN 2017630

end;

function TfrmLancHistBenef.Importar: Boolean;
var
  Qry : TwwQuery;
begin    
   try
    result := true;    //William Santana SOL 208956 - KTN 2017630
    Try

       Qry := TwwQuery.Create(nil);
       Qry.DatabaseName := 'BaseDados';

       Qry.Close;
       Qry.Sql.Clear;
       Qry.SQL.Add('INSERT INTO HSTBENEFBFCIARIO ');
       Qry.SQL.Add('(IDTITULAR, IDPESSJUR, IDPLANOPREV, IDBENEFICIO, IDMOTIVO, IDPESSOA,');
       Qry.SQL.Add('   NUMEROPROCESSO, MES, SEQBENEFICIO, SEQPROPOSTA, IDLOTE,');
       Qry.SQL.Add('VLBENEFPGTO, ');
       Qry.SQL.Add('   DATAPAGAMENTO, ');
       Qry.SQL.Add('VALORPREV, ');
       Qry.SQL.Add('   FLGENVIADO, MESREFERENCIA, FLGCONCESSAO, FLGDEVOLUCAO, ');
       Qry.SQL.Add('   VALORTOTAL, FONTEPAGADORA, VALORINTEGRAL, DTEFETPGTO, ');
       Qry.SQL.Add('VALORCALCULADO, ');
       Qry.SQL.Add('   FLGMANUAL, IDPLANOORIGEM, ');
       Qry.SQL.Add('VALORSRB, ');
       Qry.SQL.Add('IDSEQINTERNOFB, ');
       Qry.SQL.Add('FLGTIPOREGISTRO, MESCOMPREEM) ');
       Qry.SQL.Add('VALUES ');
       Qry.SQL.Add('  (:IDTITULAR, :IDPESSJUR, :IDPLANOPREV, :IDBENEFICIO, :IDMOTIVO, ');
       Qry.SQL.Add(':IDPESSOA, ');
       Qry.SQL.Add('   :NUMEROPROCESSO, :MES, :SEQBENEFICIO, :SEQPROPOSTA, :IDLOTE, ');
       Qry.SQL.Add(':VLBENEFPGTO, ');
       Qry.SQL.Add('   :DATAPAGAMENTO, ');
       Qry.SQL.Add('   :VALORPREV, ');
       Qry.SQL.Add('   :FLGENVIADO, :MESREFERENCIA, :FLGCONCESSAO, :FLGDEVOLUCAO, ');
       Qry.SQL.Add('   :VALORTOTAL, :FONTEPAGADORA, :VALORINTEGRAL, :DTEFETPGTO, ');
       Qry.SQL.Add(':VALORCALCULADO, ');
       Qry.SQL.Add('   :FLGMANUAL, :IDPLANOORIGEM, ');
       Qry.SQL.Add(':VALORSRB, ');
       Qry.SQL.Add(':IDSEQINTERNOFB,');
       Qry.SQL.Add(':FLGTIPOREGISTRO, :MESCOMPREEM) ');

       Qry.ParamByName('IDTITULAR').DataType          := ftInteger;
       Qry.ParamByName('IDTITULAR').AsInteger         := Registro.IDTitular;

       Qry.ParamByName('IDPESSJUR').DataType          := ftInteger;
       Qry.ParamByName('IDPESSJUR').AsInteger         := Registro.IDPessjur;

       Qry.ParamByName('IDPLANOPREV').DataType        := ftInteger;
       Qry.ParamByName('IDPLANOPREV').AsInteger       := Registro.IDPlanoPrev;

       Qry.ParamByName('IDBENEFICIO').DataType        := ftInteger;
       Qry.ParamByName('IDBENEFICIO').AsInteger       := Registro.IDBeneficio;

       Qry.ParamByName('IDMOTIVO').DataType           := ftInteger;
       Qry.ParamByName('IDMOTIVO').AsInteger          := Registro.IDMotivo;

       Qry.ParamByName('IDPESSOA').DataType           := ftInteger;
       Qry.ParamByName('IDPESSOA').AsInteger          := Registro.IDPessoa;

       Qry.ParamByName('NUMEROPROCESSO').DataType     := ftInteger;
       Qry.ParamByName('NUMEROPROCESSO').AsInteger    := Registro.NumeroProcesso;

       Qry.ParamByName('MES').DataType                := ftString;
       //Qry.ParamByName('MES').AsString                := Registro.MesReferencia;
       Qry.ParamByName('MES').AsString                := qryLote.FieldByName('MesReferencia').AsString;

       Qry.ParamByName('SEQBENEFICIO').DataType       := ftInteger;
       Qry.ParamByName('SEQBENEFICIO').AsInteger      := Registro.SeqBeneficio;

       Qry.ParamByName('SEQPROPOSTA').DataType        := ftInteger;
       Qry.ParamByName('SEQPROPOSTA').AsInteger       := Registro.SeqProposta;

       Qry.ParamByName('IDLOTE').DataType             := ftInteger;
       if (dblkcLote.Visible) then
          Qry.ParamByName('IDLOTE').AsInteger            := Registro.IDLote
       else
          Qry.ParamByName('IDLOTE').IsNull;       

       Qry.ParamByName('VLBENEFPGTO').DataType        := ftFloat;
       If (Registro.VlBenefPgto <> 0) then
          Qry.ParamByName('VLBENEFPGTO').AsFloat         := Registro.VlBenefPgto
       else
          Qry.ParamByName('VLBENEFPGTO').IsNull;

       Qry.ParamByName('DATAPAGAMENTO').DataType      := ftString;
       Qry.ParamByName('DATAPAGAMENTO').AsString      := Registro.DataPagamento;

       Qry.ParamByName('VALORPREV').DataType          := ftFloat;
       if (Registro.ValorPrevisto <> 0) then
          Qry.ParamByName('VALORPREV').AsFloat        := Registro.ValorPrevisto
       else
          Qry.ParamByName('VALORPREV').IsNull;


       Qry.ParamByName('FLGENVIADO').DataType         := ftInteger;
       Qry.ParamByName('FLGENVIADO').AsInteger        := Registro.FlgEnviado;

       Qry.ParamByName('MESREFERENCIA').DataType      := ftString;
       Qry.ParamByName('MESREFERENCIA').AsString      := Registro.MesReferencia;

       Qry.ParamByName('FLGCONCESSAO').DataType       := ftInteger;
       Qry.ParamByName('FLGCONCESSAO').AsInteger      := Registro.FlgConcessao;

       Qry.ParamByName('FLGDEVOLUCAO').DataType       := ftInteger;
       Qry.ParamByName('FLGDEVOLUCAO').AsInteger      := Registro.FlgDevolucao;

       Qry.ParamByName('VALORTOTAL').DataType         := ftFloat;
       if (Registro.ValorTotal = 0) then
          Qry.ParamByName('VALORTOTAL').AsFloat       := Registro.ValorTotal
       else
          Qry.ParamByName('VALORTOTAL').IsNull;

       Qry.ParamByName('FONTEPAGADORA').DataType      := ftInteger;
       Qry.ParamByName('FONTEPAGADORA').AsInteger     := Registro.FlgFontePagadora;

       Qry.ParamByName('VALORINTEGRAL').DataType      := ftFloat;
       if (Registro.ValorIntegral = 0) then
          Qry.ParamByName('VALORINTEGRAL').AsFloat    := Registro.ValorIntegral
       else
          Qry.ParamByName('VALORINTEGRAL').IsNull;

       Qry.ParamByName('DTEFETPGTO').DataType         := ftString;
       Qry.ParamByName('DTEFETPGTO').AsString         := Registro.DtEfetPgto;

       Qry.ParamByName('VALORCALCULADO').DataType     := ftFloat;
       if (Registro.ValorCalculado = 0) then
          Qry.ParamByName('VALORCALCULADO').AsFloat      := Registro.ValorCalculado
       else
          Qry.ParamByName('VALORCALCULADO').IsNull;


       Qry.ParamByName('FLGMANUAL').DataType          := ftInteger;
       Qry.ParamByName('FLGMANUAL').AsInteger         := Registro.FlgManual;

       Qry.ParamByName('IDPLANOORIGEM').DataType      := ftInteger;
       Qry.ParamByName('IDPLANOORIGEM').AsInteger     := Registro.IDPlanoOrigem;

       Qry.ParamByName('VALORSRB').DataType           := ftFloat;
       If Registro.ValorSRB = 0 then
          Qry.ParamByName('VALORSRB').AsFloat            := Registro.ValorSRB
       else
          Qry.ParamByName('VALORSRB').IsNull;

       Qry.ParamByName('IDSEQINTERNOFB').DataType     := ftInteger;
       Qry.ParamByName('IDSEQINTERNOFB').AsInteger    := Registro.IDSeqInternoFb;

       Qry.ParamByName('FLGTIPOREGISTRO').DataType    := ftInteger;
       Qry.ParamByName('FLGTIPOREGISTRO').AsInteger   := Registro.FlgTipoRegistro;

       Qry.ParamByName('MESCOMPREEM').DataType        := ftString;
//       if Registro.FlgFontePagadora = 2 then
          Qry.ParamByName('MESCOMPREEM').AsString        := Registro.MesCompetenciaINSS;
//       else
//          Qry.ParamByName('MESCOMPREEM').IsNull;

       Qry.ExecSQL;

     //William Santana SOL 208956 - KTN 2017630

    Except
      MsgDlg('Não foi possível inserir o registro', 'Informação', mtInformation, [mbOk], 0);
      result := false;
    end;
     //END - William Santana SOL 208956 - KTN 2017630

   finally
      FreeAndNil(Qry);
   end;

end;

Procedure TfrmLancHistBenef.AlimentaCamposIDs;
var
  Qry: TwwQuery;
  Dia, Mes, Ano: Word;
begin
  try
    Qry := TwwQuery.Create(nil);
    Qry.DatabaseName := 'BaseDados';

    Qry.Close;
    Qry.Sql.Clear;
    Qry.Sql.Add('SELECT B.IDPESSOA, B.IDTITULAR, B.IDPESSJUR, B.NUMEROPROCESSO, B.SEQPROPOSTA FROM DEPENTIT D, BENEFBFCIARIO B');
    Qry.Sql.Add('WHERE D.MATRICULA = ' + QuotedStr(Registro.Matricula));
    Qry.Sql.Add('AND B.IDBENEFICIO = ' + IntToStr(Registro.IDBeneficio));
    Qry.Sql.Add('AND B.IDPLANOPREV = ' + IntToStr(Registro.IDPlanoPrev));
    Qry.Sql.Add('AND B.IDPLANOORIGEM = ' + IntToStr(Registro.IDPlanoOrigem));
    Qry.Sql.Add('AND B.NUMEROPROCESSO = ' + IntToStr(Registro.NumeroProcesso));  //William Santana SOL 208956 - KTN 2017630
    Qry.Sql.Add('AND D.IDPESSOA = B.IDPESSOA');
    Qry.Sql.Add('AND D.IDTITULAR = B.IDTITULAR');
    Qry.Open;

    if Qry.FieldByName('IDPESSOA').AsInteger > 0 then
       Registro.IDPessoa       := Qry.FieldByName('IDPESSOA').AsInteger
    else
       Registro.IDPessoa       := -1;

    if Qry.FieldByName('IDTITULAR').AsInteger > 0 then
       Registro.IDTitular      := Qry.FieldByName('IDTITULAR').AsInteger
    else
       Registro.IDTitular      := -1;

    if Qry.FieldByName('IDPESSJUR').AsInteger > 0 then
       Registro.IDPessjur      := Qry.FieldByName('IDPESSJUR').AsInteger
    else
       Registro.IDPessjur      := -1;

    if Qry.FieldByName('NUMEROPROCESSO').AsInteger > 0 then
       Registro.NumeroProcesso := Qry.FieldByName('NUMEROPROCESSO').AsInteger
    else
       Registro.NumeroProcesso := -1;

    if Qry.FieldByName('SEQPROPOSTA').AsInteger > 0 then
       Registro.SeqProposta    := Qry.FieldByName('SEQPROPOSTA').AsInteger
    else
       Registro.SeqProposta    := -1;

    Registro.IDMotivo       := qryMotivoIDMOTIVO.AsInteger;
    Registro.IDLote         := qryLoteIDLOTE.AsInteger;
    Registro.FlgEnviado     := RGLancamento.ItemIndex;


    Qry.Close;
    Qry.Sql.Clear;
    Qry.Sql.Add(
            'SELECT NVL(MAX(SEQBENEFICIO),0)+1 AS IDSEQ '+
            'FROM HSTBENEFBFCIARIO '+
            'WHERE IDPLANOPREV  = ' + inttostr(Registro.IDPlanoPrev)         +' '+
            'AND IDPLANOORIGEM  = ' + inttostr(Registro.IDPlanoOrigem)       +' '+
            'AND IDPESSJUR      = ' + inttostr(Registro.IDPessjur)           +' '+
            'AND IDBENEFICIO    = ' + inttostr(Registro.IDBeneficio)         +' '+
            'AND NUMEROPROCESSO = ' + inttostr(Registro.NumeroProcesso)      +' '+
     //     'AND MES            = ' + quotedstr(Registro.MesReferencia)      +' '+                        //William Santana SOL 208956 KIN 2017630
            'AND MES            = ' + quotedstr(qryLote.FieldByName('MesReferencia').AsString)      +' '+ //William Santana SOL 208956 KIN 2017630
            'AND MESREFERENCIA  = ' + quotedstr(Registro.MesReferencia)      +' '+
            'AND IDMOTIVO       = ' + inttostr(Registro.IDMotivo)            +' '+
            'AND IDTITULAR      = ' + inttostr(Registro.IDTitular)           +' '+
            'AND IDPESSOA       = ' + inttostr(Registro.IDPessoa)            +' '+
            'AND SEQPROPOSTA    = ' + inttostr(Registro.SeqProposta)         );
    Qry.Open;

    Registro.SeqBeneficio := Qry.FieldByName('IDSEQ').AsInteger;
    Registro.FlgConcessao := 1;
    Registro.FlgManual := 3; //3 = Importação de arquivo.
    Registro.IDSeqInternoFb := LeUltRegistro(Nil, 'SEQINTERNOFB');

    Dia := 20;
    Mes := StrToInt(Copy(Registro.MesCobranca, Pos('/',Registro.MesCobranca) + 1, Length(Registro.MesCobranca)));
    Ano := StrToInt(Copy(Registro.MesCobranca, 1, Pos('/',Registro.MesCobranca) - 1));

    Registro.DataPagamento := FormatDateTime('DD/MM/YYYY', EncodeDate(Ano, Mes, Dia));

    if Registro.FlgEnviado = 1 then
    Begin
      Registro.DtEfetPgto := FormatDateTime('DD/MM/YYYY', EncodeDate(Ano, Mes, Dia));
      Registro.VlBenefPgto := Registro.ValorPrevisto;
    End else
      Registro.VlBenefPgto := 0;


    Qry.Close;
    Qry.Sql.Clear;
    Qry.Sql.Add(
            'SELECT BF.VALORATUAL,                        ' +
            '     BF.VALORTOTAL,                          ' +
            '     BF.VALORCALCULADO,                      ' +
            '     BF.VALORSRB                             ' +
            'FROM BENEFBFCIARIO BF                        ' +
            'WHERE  (BF.IDPESSJUR      = ' + inttostr(Registro.IDPessjur)     +') '+
            'AND    (BF.IDPLANOPREV    = ' + inttostr(Registro.IDPlanoPrev)   +') '+
            'AND    (BF.IDPLANOORIGEM  = ' + inttostr(Registro.IDPlanoOrigem) +') '+
            'AND    (BF.IDTITULAR      = ' + inttostr(Registro.IDTitular)     +') '+
            'AND    (BF.IDPESSOA       = ' + inttostr(Registro.IDPessoa)      +') '+
            'AND    (BF.SEQPROPOSTA    = ' + inttostr(Registro.SeqProposta)   +') '+
            'AND    (BF.IDBENEFICIO    = ' + inttostr(Registro.IDBeneficio)   +') '+
            'AND    (BF.NUMEROPROCESSO = ' + inttostr(Registro.NumeroProcesso)+') ');
    Qry.Open;

    Registro.ValorTotal := Qry.FieldByName('VALORTOTAL').AsFloat;
    Registro.ValorIntegral := Qry.FieldByName('VALORTOTAL').AsFloat;
    Registro.ValorCalculado := Qry.FieldByName('VALORCALCULADO').AsFloat;
    Registro.ValorSRB := Qry.FieldByName('VALORSRB').AsFloat;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TfrmLancHistBenef.RGLancamentoExit(Sender: TObject);
var
  Mes, Ano: Word;
  AnoMes: String;
begin
  //  Atualiza Botões
{  bbtnCancelar.Enabled := ((dblkcMotivo.Text <> '') or ((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (edtArquivo.Text <> ''));
  bbtnConfirmar.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
  bBtnDesfazer.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
 }
  AtualizaBusca(dtData);

end;

procedure TfrmLancHistBenef.edtArquivoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := #0;
end;

procedure TfrmLancHistBenef.edtArquivoChange(Sender: TObject);
begin

  //  Atualiza Botões
  bbtnCancelar.Enabled := ((dblkcMotivo.Text <> '') or ((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (edtArquivo.Text <> ''));
  bbtnConfirmar.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
  bBtnDesfazer.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));

end;

procedure TfrmLancHistBenef.edtArquivoExit(Sender: TObject);
begin

  //  Atualiza Botões
  bbtnCancelar.Enabled := ((dblkcMotivo.Text <> '') or ((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (edtArquivo.Text <> ''));
  bbtnConfirmar.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
  bBtnDesfazer.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));

end;

procedure TfrmLancHistBenef.ZerarRegistros;
begin
  Registro.Matricula          := '';
  Registro.MesCobranca        := '';
  Registro.MesReferencia      := '';
  Registro.MesCompetenciaINSS := '';
  Registro.LogErro            := '';
  Registro.Resultado          := '';
  Registro.DtEfetPgto         := '';
  Registro.DataPagamento      := '';
  Registro.IDBeneficio        := -1;
  Registro.IDPlanoPrev        := -1;
  Registro.IDPlanoOrigem      := -1;
  Registro.FlgFontePagadora   := -1;
  Registro.FlgTipoRegistro    := -1;
  Registro.FlgDevolucao       := -1;
  Registro.FlgEnviado         := -1;
  Registro.IDPessoa           := -1;
  Registro.IDTitular          := -1;
  Registro.IDPessjur          := -1;
  Registro.IDMotivo           := -1;
  Registro.NumeroProcesso     := -1;
  Registro.SeqProposta        := -1;
  Registro.IDLote             := -1;
  Registro.FlgConcessao       := -1;
  Registro.SeqBeneficio       := -1;
  Registro.FlgManual          := -1;
  Registro.IDSeqInternoFb     := -1;
  Registro.SequenciaFor       := -1;
  Registro.ValorTotal         := 0;
  Registro.ValorIntegral      := 0;
  Registro.ValorCalculado     := 0;
  Registro.ValorSRB           := 0;
  Registro.ValorPrevisto      := 0;
  Registro.Totalizador        := 0;
  Registro.QtdImportado       := 0;
end;

procedure TfrmLancHistBenef.GSCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  If State <> [gdSelected] Then
     Begin
        If Not Highlight Then
           Begin
              // linhas ímpares = amarelo, linhas pares = branco
              If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                 ABrush.Color := $00C0FFFF // amarelo bebê
              Else
                 ABrush.Color := clWhite;
           End;
     End
  Else
     Begin
        ABrush.Color := clHighLight;
        AFont.Color := clHighLightText;
     End;
end;

function TfrmLancHistBenef.ArquivoJaImportado: Boolean;
var
  Qry: TwwQuery;
  Ano, Mes: Word;
begin

  Try
      Result := False;
      Qry := TwwQuery.Create(nil);
      Qry.DatabaseName := 'BaseDados';

      Qry.Close;
      Qry.Sql.Clear;
      Qry.Sql.Add('SELECT D.MATRICULA, H.DATAPAGAMENTO, H.MESREFERENCIA, H.MESCOMPREEM, H.VALORPREV, H.IDBENEFICIO, H.IDMOTIVO, ');
      Qry.Sql.Add('       H.NUMEROPROCESSO, ');  //William Santana SOL 208956 - KTN 2017630
      Qry.Sql.Add('       H.IDPLANOPREV, H.IDPLANOORIGEM, H.FONTEPAGADORA, H.FLGTIPOREGISTRO, H.FLGDEVOLUCAO, H.IDLOTE ');
      Qry.Sql.Add('       FROM  HSTBENEFBFCIARIO H, DEPENTIT D ');
      Qry.Sql.Add('       WHERE H.MESREFERENCIA   = '+ QuotedStr(Registro.MesReferencia));

      Mes := StrToInt(Copy(Registro.MesCobranca, Pos('/',Registro.MesCobranca) + 1, Length(Registro.MesCobranca)));
      Ano := StrToInt(Copy(Registro.MesCobranca, 1, Pos('/',Registro.MesCobranca) - 1));
      Qry.Sql.Add('       AND   H.DATAPAGAMENTO   = '+ QuotedStr(FormatDateTime('DD/MM/YYYY', EncodeDate(Ano,Mes,20))));

      If (Registro.FlgFontePagadora = 2) or (Trim(Registro.MesCompetenciaINSS) <> '') then
         Qry.Sql.Add('       AND   H.MESCOMPREEM     = '+ QuotedStr(Registro.MesCompetenciaINSS))
      else
         Qry.Sql.Add('       AND   H.MESCOMPREEM IS NULL');

      Qry.Sql.Add('       AND   H.VALORPREV       = '+ TrocaCaracter(FormatFloat('#0.0000',Registro.ValorPrevisto),',','.'));
      Qry.Sql.Add('       AND   H.IDBENEFICIO     = '+ IntToStr(Registro.IDBeneficio));
      Qry.Sql.Add('       AND   H.IDPLANOPREV     = '+ IntToStr(Registro.IDPlanoPrev));
      Qry.Sql.Add('       AND   H.IDPLANOORIGEM   = '+ IntToStr(Registro.IDPlanoOrigem));
      Qry.Sql.Add('       AND   H.FONTEPAGADORA   = '+ IntToStr(Registro.FlgFontePagadora));
      Qry.Sql.Add('       AND   H.FLGTIPOREGISTRO = '+ IntToStr(Registro.FlgTipoRegistro));
      Qry.Sql.Add('       AND   H.FLGDEVOLUCAO    = '+ IntToStr(Registro.FlgDevolucao));
      Qry.Sql.Add('       AND   D.MATRICULA       = '+ QuotedStr(Registro.Matricula));
      Qry.Sql.Add('       AND   H.NUMEROPROCESSO  = '+ IntToStr(Registro.NUmeroprocesso));  //William Santana SOL 208956 - KTN 2017630
      Qry.Sql.Add('       AND   H.FLGMANUAL       = 3 ' );

      if (dblkcLote.Visible) then
         Qry.Sql.Add('       AND   H.IDLOTE          = '+ qryLoteIDLOTE.AsString);
      if qryMotivoIDMOTIVO.AsInteger > 0 then
         Qry.Sql.Add('       AND   H.IDMOTIVO        = '+ qryMotivoIDMOTIVO.AsString);
      if RGLancamento.ItemIndex in [0,1] then
         Qry.Sql.Add('       AND   H.FLGENVIADO      = '+ IntToStr(RGLancamento.ItemIndex));

      Qry.Sql.Add('       AND  (H.IDPESSOA = D.IDPESSOA) ');
      Qry.Sql.Add('       AND  (H.IDTITULAR = D.IDTITULAR) ');
      Qry.Sql.Add('       ORDER BY H.TRGDTINCLUSAO DESC, H.MESREFERENCIA DESC' );
      Qry.Open;

      if Not(Qry.IsEmpty) then
         Result := True;

  Finally
    FreeAndNil(Qry);
  end;

end;

procedure TfrmLancHistBenef.bBtnDesfazerClick(Sender: TObject);
var
  i: Integer;
  Mes, Ano: Word;
  ArquivoSemErros : Boolean; //William Santana SOL 208956 KIN 2017630
  Log: TStringList;          //William Santana SOL 208956 KIN 2017630
begin
  inherited;
  Try
    QryImporta.Close;
    PageControl.Pages[0].TabVisible := True;
    PageControl.Pages[1].TabVisible := False;
    PageControl.Pages[2].TabVisible := False;

    mmResultado.Clear;
    mmLogErro.Clear;

    ZerarRegistros;
    prbReproc.Max := 0;
    prbReproc.StepIt;

    if RGLancamento.ItemIndex < 0 then
    begin
       MsgDlg('É necessário informar o estado dos lançamentos.', 'Atenção', mtWarning, [mbOk], 0);
       RGLancamento.SetFocus;
       Abort;
    end;

    if (Trim(dblkcMotivo.Text) = '') then
    begin
       MsgDlg('É necessário informar o motivo dos lançamentos.', 'Atenção', mtWarning, [mbOk], 0);
       dblkcMotivo.SetFocus;
       Abort;
    end;

    if (Trim(edtArquivo.Text) = '') then
    begin
       MsgDlg('É necessário selecionar o arquivo para importação.', 'Atenção', mtWarning, [mbOk], 0);
       edtArquivo.SetFocus;
       Abort;
    end;

    If Not(CarregaArquivoExcel) then
    begin
      MsgDlg('O arquivo está vazio!' +#13+#10+
             'O processo será cancelado.', 'Atenção', mtWarning, [mbOk], 0);
      Exit;
    end;

    prbReproc.Position := 0;
    prbReproc.Max := QryExcel.RecordCount;
                                   
    //William Santana SOL 208956 - KTN 2017630
    Log       := TStringList.Create();
    mmLogErro.Clear;
    ArquivoSemErros := true;
    i := 2;
    Log.Add('Manual de Lançamentos para histórico de benefícios');
    Log.Add('Erros de Importação de Arquivo');
    Log.Add('');
    
    QryExcel.First;
    While Not(QryExcel.Eof) do
    begin

      Registro.SequenciaFor        := i;
      Registro.Matricula           := QryExcel.FieldByName('MATRICULA').AsString;
      Registro.MesCobranca         := QryExcel.FieldByName('MESCOBRANCA').AsString;
      Registro.MesReferencia       := QryExcel.FieldByName('MESREFERENCIA').AsString;
      Registro.MesCompetenciaINSS  := QryExcel.FieldByName('MESCOMPETENCIAINSS').AsString;
      Registro.ValorPrevisto       := QryExcel.FieldByName('VALORPREVISTO').AsFloat;
      Registro.IDBeneficio         := QryExcel.FieldByName('IDBENEFICIO').AsInteger;
      Registro.IDPlanoPrev         := QryExcel.FieldByName('IDPLANOPREV').AsInteger;
      Registro.IDPlanoOrigem       := QryExcel.FieldByName('IDPLANOORIGEM').AsInteger;
      Registro.FlgFontePagadora    := QryExcel.FieldByName('FLGFONTEPAGADORA').AsInteger;
      Registro.FlgTipoRegistro     := QryExcel.FieldByName('FLGTIPOREGISTRO').AsInteger;
      Registro.FlgDevolucao        := QryExcel.FieldByName('FLGDEVOLUCAO').AsInteger;

      try
       Registro.NumeroProcesso     := StrToInt(QryExcel.FieldByName('NUMEROPROCESSO').AsString);
      except
       Registro.NumeroProcesso     := -1;
      end;

      if not(ValidaNumProcesso) then
      begin
        Log.Add(Registro.LogErro);
        ArquivoSemErros := False;
      end;

      QryExcel.Next;
      Inc(i);

    end; //Fim do Loop

    If not(ArquivoSemErros) then
    begin
      if Log.Count > 1 then
      begin
        Log.SaveToFile('C:\PLANUS\TEMP\IMPORT_HISTORICOBENEFICIO_LOGERRO_'+ FormatDateTime('DDMMYYYY',(Now)) + '.txt');
        PageControl.Pages[2].TabVisible := True;
        mmLogErro.lines.LoadFromFile('C:\PLANUS\TEMP\IMPORT_HISTORICOBENEFICIO_LOGERRO_'+ FormatDateTime('DDMMYYYY',(Now)) + '.txt');
      end;
    end
    else
    begin
    //END - William Santana SOL 208956 - KTN 2017630

    //Verifica Arquivos Ja importados
     QryExcel.First;
     While Not(QryExcel.Eof) do
     begin
        Registro.Matricula           := QryExcel.FieldByName('MATRICULA').AsString;
        Registro.MesCobranca         := QryExcel.FieldByName('MESCOBRANCA').AsString;
        Registro.MesReferencia       := QryExcel.FieldByName('MESREFERENCIA').AsString;
        Registro.MesCompetenciaINSS  := QryExcel.FieldByName('MESCOMPETENCIAINSS').AsString;

  //      if RGLancamento.ItemIndex = 1 then
        Registro.ValorPrevisto       := QryExcel.FieldByName('VALORPREVISTO').AsFloat;
  //      else
  //         Registro.ValorPrevisto       := 0;

        Registro.IDBeneficio         := QryExcel.FieldByName('IDBENEFICIO').AsInteger;
        Registro.IDPlanoPrev         := QryExcel.FieldByName('IDPLANOPREV').AsInteger;
        Registro.IDPlanoOrigem       := QryExcel.FieldByName('IDPLANOORIGEM').AsInteger;
        Registro.FlgFontePagadora    := QryExcel.FieldByName('FLGFONTEPAGADORA').AsInteger;
        Registro.FlgTipoRegistro     := QryExcel.FieldByName('FLGTIPOREGISTRO').AsInteger;
        Registro.FlgDevolucao        := QryExcel.FieldByName('FLGDEVOLUCAO').AsInteger;

        // William Santana  SOL 208956 - KTN 2017630
        try
         Registro.NumeroProcesso     := StrToInt(QryExcel.FieldByName('NUMEROPROCESSO').AsString);
        except
         Registro.NumeroProcesso     := -1;
        end;

        //END -  William Santana  SOL 208956 - KTN 2017630

        If ArquivoJaImportado then
           DeletaRegistro;

        prbReproc.StepIt;
        QryExcel.Next;

     End; //END LOOP

    End;  //William Santana  SOL 208956 - KTN 2017630
    {QryImporta.Close;
    QryImporta.ParamByName('DATAPAGAMENTO').AsString := Registro.DataPagamento;
    QryImporta.ParamByName('IDMOTIVO').AsInteger     := Registro.IDMotivo;
    QryImporta.ParamByName('IDLOTE').AsInteger       := Registro.IDLote;
    QryImporta.ParamByName('FLGENVIADO').AsInteger   := Registro.FlgEnviado;
    QryImporta.Open;}

  Finally

      edtArquivo.Clear;
      dblkcMotivo.Clear;
      dblkcLote.Clear;

      bbtnSair.Enabled := True; // William Santana  SOL 208956 - KTN 2017630

      if Trim(Registro.MesCobranca) <> '' then
      begin
         Mes := StrToInt(Copy(Registro.MesCobranca, Pos('/',Registro.MesCobranca) + 1, Length(Registro.MesCobranca)));
         Ano := StrToInt(Copy(Registro.MesCobranca, 1, Pos('/',Registro.MesCobranca) - 1));
         dtData := StrToDate(FormatDateTime('DD/MM/YYYY', EncodeDate(Ano,Mes,20)));
      end;

      If dtmbasedados.dbBaseDados.InTransaction Then
         dtmbasedados.dbBaseDados.Commit;

      AtualizaBusca(dtData, 'S');

      ZerarRegistros;
      prbReproc.Position := 0;

     if (bbtnSair.Enabled = False) then bbtnSair.Enabled:= True;  //William Santana SOL 208956 - KTN 2017630
  end;

end;

procedure TfrmLancHistBenef.DeletaRegistro;
var
  Qry: TwwQuery;
  Mes, Ano: Word;
begin
  Try

    Try
        Qry := TwwQuery.Create(nil);
        Qry.DataBaseName := 'BaseDados';

        Qry.Close;
        Qry.Sql.Clear;
        Qry.Sql.Add('DELETE FROM HSTBENEFBFCIARIO H ');
        Qry.Sql.Add('       WHERE H.MESREFERENCIA   = '+ QuotedStr(Registro.MesReferencia));
        Mes := StrToInt(Copy(Registro.MesCobranca, Pos('/',Registro.MesCobranca) + 1, Length(Registro.MesCobranca)));
        Ano := StrToInt(Copy(Registro.MesCobranca, 1, Pos('/',Registro.MesCobranca) - 1));
        Qry.Sql.Add('       AND   H.DATAPAGAMENTO   = '+ QuotedStr(FormatDateTime('DD/MM/YYYY', EncodeDate(Ano,Mes,20))));

        If (Registro.FlgFontePagadora = 2) or (Trim(Registro.MesCompetenciaINSS) <> '') then
           Qry.Sql.Add('       AND   H.MESCOMPREEM     = '+ QuotedStr(Registro.MesCompetenciaINSS))
        else
           Qry.Sql.Add('       AND   H.MESCOMPREEM     IS NULL');


        if Registro.ValorPrevisto <> 0 then
           Qry.Sql.Add('       AND   H.VALORPREV       = '+ TrocaCaracter(FormatFloat('#0.0000',Registro.ValorPrevisto),',','.'))
        else
           Qry.Sql.Add('       AND   H.VALORPREV       IS NULL ');

        Qry.Sql.Add('       AND   H.NUMEROPROCESSO = '+ IntToStr(Registro.Numeroprocesso)); //William Santana SOL 208956 - KTN 2017630
        Qry.Sql.Add('       AND   H.IDBENEFICIO     = '+ IntToStr(Registro.IDBeneficio));
        Qry.Sql.Add('       AND   H.IDPLANOPREV     = '+ IntToStr(Registro.IDPlanoPrev));
        Qry.Sql.Add('       AND   H.IDPLANOORIGEM   = '+ IntToStr(Registro.IDPlanoOrigem));
        Qry.Sql.Add('       AND   H.FONTEPAGADORA   = '+ IntToStr(Registro.FlgFontePagadora));
        Qry.Sql.Add('       AND   H.FLGTIPOREGISTRO = '+ IntToStr(Registro.FlgTipoRegistro));
        Qry.Sql.Add('       AND   H.FLGDEVOLUCAO    = '+ IntToStr(Registro.FlgDevolucao));
        Qry.Sql.Add('       AND   H.IDPESSOA IN (SELECT D1.IDPESSOA FROM DEPENTIT D1  ');
        Qry.Sql.Add('                            WHERE  D1.MATRICULA       = '+ QuotedStr(Registro.Matricula)+') ');
        Qry.Sql.Add('       AND   H.IDTITULAR IN (SELECT D2.IDTITULAR FROM DEPENTIT D2 ');
        Qry.Sql.Add('                            WHERE  D2.MATRICULA       = '+ QuotedStr(Registro.Matricula)+') ');
        if (dblkcLote.Visible) then
           Qry.Sql.Add('       AND   H.IDLOTE          = '+ qryLoteIDLOTE.AsString)
        else
           Qry.Sql.Add('       AND   H.IDLOTE          IS NULL');
        Qry.Sql.Add('       AND   H.IDMOTIVO        = '+ qryMotivoIDMOTIVO.AsString);
        Qry.Sql.Add('       AND   H.FLGENVIADO      = '+ IntToStr(RGLancamento.ItemIndex));
        Qry.Sql.Add('       AND   H.FLGMANUAL       = 3 ' );

        Qry.ExecSQL;
    Except
      on E: Exception do
      Begin
        MsgDlg('Ocorreu o seguinte erro ao deletar um registro:' +#13+#10+
               UpperCase(e.Message) + #13+#10+
               'O processo será cancelado.', 'Atenção', mtError, [mbOk], 0);
      end;
    end;
  Finally
    FreeAndNil(Qry);
  End;

end;

procedure TfrmLancHistBenef.RGLancamentoClick(Sender: TObject);
begin
  inherited;
  If RGLancamento.ItemIndex = 1 then
  begin
    lblLote.Visible := False;
    dblkcLote.Visible := False;
    dblkcLote.Tag := 0;
  end
  else
  if RGLancamento.ItemIndex = 0 then
  begin
    dblkcLote.Clear;
    dblkcLote.Visible := True;
    lblLote.Visible := True;
    dblkcLote.Tag := 1;
  end;
  
  AtualizaBusca(dtData);

end;

Function TfrmLancHistBenef.CarregaArquivoExcel : Boolean;
var
  Excel:Variant;
  sAux: String;
  iQtdLinha, i: Integer;
begin
  Try
    QryExcel.Close;
    QryExcel.Open;
    Result := True;

    Excel := CreateOleObject('Excel.application'); //cria o objeto
    Excel.WorkBooks.Open(edtArquivo.Text);  //abre o arquivo

    //Total a importar
    i := 2;
    iQtdLinha := 0;
    sAux := 'X';
    while Trim(sAux) <> '' do
    begin
      sAux := Trim(Excel.workbooks[1].sheets[1].cells[i,'A'].Value) + Trim(Excel.workbooks[1].sheets[1].cells[i,'B'].Value) +
              Trim(Excel.workbooks[1].sheets[1].cells[i,'A'].Value) + Trim(Excel.workbooks[1].sheets[1].cells[i,'D'].Value) +
              Trim(Excel.workbooks[1].sheets[1].cells[i,'E'].Value) + Trim(Excel.workbooks[1].sheets[1].cells[i,'F'].Value) +
              Trim(Excel.workbooks[1].sheets[1].cells[i,'G'].Value) + Trim(Excel.workbooks[1].sheets[1].cells[i,'H'].Value) +
            //  Trim(Excel.workbooks[1].sheets[1].cells[i,'I'].Value) + Trim(Excel.workbooks[1].sheets[1].cells[i,'K'].Value) +
              Trim(Excel.workbooks[1].sheets[1].cells[i,'I'].Value) + Trim(Excel.workbooks[1].sheets[1].cells[i,'L'].Value); //  William Santana  SOL 208956 - KTN 2017630
      Inc(iQtdLinha);
      Inc(i);
    end;

    //dec(iQtdLinha);

    prbReproc.Position := 0;
    prbReproc.Max := iQtdLinha;

    For i := 1 to iQtdLinha do
    Begin

      if i = 1 then
        Continue;  //Ignora a primeira linha (Cabeçalho)

      QryExcel.Insert;
      {        //  William Santana  SOL 208956 - KTN 2017630
      QryExcel.FieldByName('MATRICULA').AsString           := Excel.workbooks[1].sheets[1].cells[i,'A'].Value;
      QryExcel.FieldByName('MESCOBRANCA').AsString         := Excel.workbooks[1].sheets[1].cells[i,'B'].Value;
      QryExcel.FieldByName('MESREFERENCIA').AsString       := Excel.workbooks[1].sheets[1].cells[i,'C'].Value;
      QryExcel.FieldByName('MESCOMPETENCIAINSS').AsString  := Excel.workbooks[1].sheets[1].cells[i,'D'].Value;
      QryExcel.FieldByName('VALORPREVISTO').AsFloat        := StrToFloat(StringReplace(Excel.workbooks[1].sheets[1].cells[i,'E'].Value,'.',',',[]));
      QryExcel.FieldByName('IDBENEFICIO').AsInteger        := Excel.workbooks[1].sheets[1].cells[i,'F'].Value;
      QryExcel.FieldByName('IDPLANOPREV').AsInteger        := Excel.workbooks[1].sheets[1].cells[i,'G'].Value;
      QryExcel.FieldByName('IDPLANOORIGEM').AsInteger      := Excel.workbooks[1].sheets[1].cells[i,'H'].Value;
      QryExcel.FieldByName('FLGFONTEPAGADORA').AsInteger   := Excel.workbooks[1].sheets[1].cells[i,'I'].Value;
      QryExcel.FieldByName('FLGTIPOREGISTRO').AsInteger    := Excel.workbooks[1].sheets[1].cells[i,'J'].Value;
      QryExcel.FieldByName('FLGDEVOLUCAO').AsInteger       := Excel.workbooks[1].sheets[1].cells[i,'K'].Value;
      }

      QryExcel.FieldByName('NUMEROPROCESSO').AsString      := Excel.workbooks[1].sheets[1].cells[i,'A'].Value;
      QryExcel.FieldByName('MATRICULA').AsString           := Excel.workbooks[1].sheets[1].cells[i,'B'].Value;
      QryExcel.FieldByName('MESCOBRANCA').AsString         := Excel.workbooks[1].sheets[1].cells[i,'C'].Value;
      QryExcel.FieldByName('MESREFERENCIA').AsString       := Excel.workbooks[1].sheets[1].cells[i,'D'].Value;
      QryExcel.FieldByName('MESCOMPETENCIAINSS').AsString  := Excel.workbooks[1].sheets[1].cells[i,'E'].Value;
      QryExcel.FieldByName('VALORPREVISTO').AsFloat        := StrToFloat(StringReplace(Excel.workbooks[1].sheets[1].cells[i,'F'].Value,'.',',',[]));
      QryExcel.FieldByName('IDBENEFICIO').AsInteger        := Excel.workbooks[1].sheets[1].cells[i,'G'].Value;
      QryExcel.FieldByName('IDPLANOPREV').AsInteger        := Excel.workbooks[1].sheets[1].cells[i,'H'].Value;
      QryExcel.FieldByName('IDPLANOORIGEM').AsInteger      := Excel.workbooks[1].sheets[1].cells[i,'I'].Value;
      QryExcel.FieldByName('FLGFONTEPAGADORA').AsInteger   := Excel.workbooks[1].sheets[1].cells[i,'J'].Value;
      QryExcel.FieldByName('FLGTIPOREGISTRO').AsInteger    := Excel.workbooks[1].sheets[1].cells[i,'K'].Value;
      QryExcel.FieldByName('FLGDEVOLUCAO').AsInteger       := Excel.workbooks[1].sheets[1].cells[i,'L'].Value;
     //END -  William Santana  SOL 208956 - KTN 2017630
      QryExcel.Post;

      prbReproc.StepIt;

    end;

    If QryExcel.IsEmpty then
      Result := False;
  Finally
    Excel.WorkBooks.Close;
  end;  //abre o arquivo
end;

function TfrmLancHistBenef.ListaExcel: OleVariant;
var
  sSql: String;
begin

 // sSql := 'SELECT '+QuotedStr('jul')+' AS MATRICULA, '+QuotedStr('')+' AS MESCOBRANCA,              ' + #13+#10 +

  sSql := 'SELECT '+QuotedStr('')+' AS NUMEROPROCESSO, '+QuotedStr('jul')+' AS MATRICULA, '+QuotedStr('')+' AS MESCOBRANCA, ' + #13+#10 +    //  William Santana  SOL 208956 - KTN 2017630
          '       '+QuotedStr('')+' AS MESREFERENCIA, '+QuotedStr('')+' AS MESCOMPETENCIAINSS,   ' + #13+#10 +
          '       0 AS VALORPREVISTO, -1 AS IDBENEFICIO, -1 AS IDPLANOPREV, -1 AS IDPLANOORIGEM, ' + #13+#10 +
          '       -1 FLGFONTEPAGADORA, -1 AS FLGTIPOREGISTRO, -1 AS FLGDEVOLUCAO                 ' + #13+#10 +
          'FROM HSTBENEFBFCIARIO                                                                 ' + #13+#10 +
          'WHERE ROWNUM = 1                                                                      ' + #13+#10 ;



  Result := Padroes.GetDataPacket(sSql);

end;

procedure TfrmLancHistBenef.dblkcLoteExit(Sender: TObject);
begin
  //  Atualiza Botões
{  bbtnCancelar.Enabled := ((dblkcMotivo.Text <> '') or ((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (edtArquivo.Text <> ''));
  bbtnConfirmar.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
  bBtnDesfazer.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
 }
  AtualizaBusca(dtData);

end;

procedure TfrmLancHistBenef.dblkcMotivoExit(Sender: TObject);
var
  Mes, Ano: Word;
  AnoMes: String;
begin
  //  Atualiza Botões
{  bbtnCancelar.Enabled := ((dblkcMotivo.Text <> '') or ((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (edtArquivo.Text <> ''));
  bbtnConfirmar.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
  bBtnDesfazer.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
 }
  AtualizaBusca(dtData);

end;

procedure TfrmLancHistBenef.AtualizaBusca(dData: TDateTime; FlgBusca: String = 'N');
var
  Mes, Ano : Word;
  Data: String;
  sSql: String;
begin

    Mes := StrToInt(Copy(FormatDateTime('DD/MM/YYYY', dData), 4, 2));
    Ano := StrToInt(Copy(FormatDateTime('DD/MM/YYYY', dData), 7, 4));

    Data := FormatDateTime('DD/MM/YYYY', EncodeDate(Ano, Mes, 20));

    sSql := 'SELECT H.IDTITULAR, H.IDPESSJUR, H.IDPLANOPREV, H.IDBENEFICIO, H.IDMOTIVO, H.IDPESSOA,                           ' + #13 + #10 +
            '       H.NUMEROPROCESSO, H.MES, H.SEQBENEFICIO, H.SEQPROPOSTA, H.IDLOTE, H.VLBENEFPGTO,                          ' + #13 + #10 +
            '       H.DATAPAGAMENTO, H.CODPORTFORMA, H.VALORPREV, H.FLGACERTODESFEITO, H.CODREFERENCIA,                       ' + #13 + #10 +
            '       H.FLGENVIADO, H.MESREFERENCIA, H.FLGCONCESSAO, H.FLGDEVOLUCAO, H.FLGFORMAPAGTO, H.VALORTOTAL,             ' + #13 + #10 +
            '       H.FONTEPAGADORA, H.VALORINTEGRAL, H.DTEFETPGTO, M.DESCRICAO, H.VALORCALCULADO, D.MATRICULA,               ' + #13 + #10 +
//            '       DECODE(FLGENVIADO,8,''Fora convênio'',9,''Retido'',1,''Processado'',''A Processar'') ESTADO, B.NOME,      ' + #13 + #10 + //Everson TIBERO
            '       DECODE(H.FLGENVIADO,8,''Fora convênio'',9,''Retido'',1,''Processado'',''A Processar'') ESTADO, B.NOME,      ' + #13 + #10 + //Everson TIBERO
            '       H.FLGMANUAL, H.IDPLANOORIGEM, H.VALOROP1, H.VALOROP2, H.VALOROP3, H.VALORPREVMIN, C.DESCRICAO AS DESCLOTE,' + #13 + #10 +
            '       H.VALORSRB, H.PERCENTUAL, H.IDSEQINTERNOFB, H.TRGDTINCLUSAO, H.TRGUSERINCLUSAO, H.MESCOMPREEM,            ' + #13 + #10 +
            '       ''                                        '' AS NOMEUSU, H.FLGTIPOREGISTRO,                               ' + #13 + #10 +
            '       DECODE(NVL(H.FLGMANUAL,0),                                                                                ' + #13 + #10 +
            '         0, ''Não manual'',                                                                                      ' + #13 + #10 +
            '         1, ''Inclusão Manual'',                                                                                 ' + #13 + #10 +
            '         2, ''Alteração Manual'',                                                                                ' + #13 + #10 +
            '         3, ''Importado'',                                                                                       ' + #13 + #10 +
            '         ''Não identificado'') AS TIPOMANUAL,                                                                    ' + #13 + #10 +
            '       DECODE(NVL(H.FLGTIPOREGISTRO,0),                                                                          ' + #13 + #10 +
            '         0, ''Normal'',                                                                                          ' + #13 + #10 +
            '         1, ''Abono'',                                                                                           ' + #13 + #10 +
            '         2, ''Antecipação de abono'',                                                                            ' + #13 + #10 +
            '         3, ''Revisão Normal'',                                                                                  ' + #13 + #10 +
            '         4, ''Abono revisão'',                                                                                   ' + #13 + #10 +
            '         5, ''Antecipação de abono revisão'',                                                                    ' + #13 + #10 +
            '         ''Não identificado'') AS TIPOREGISTRO,                                                                  ' + #13 + #10 +
            '       DECODE(NVL(H.FLGALIMRESERVA,0), 0, ''Não'', ''Sim'') AS ALIMRESERVA                                       ' + #13 + #10 +
            '       FROM   HSTBENEFBFCIARIO H, MOTIVO M, DEPENTIT D, BENEFICIO B, CTRLINTERFACE C                             ' + #13 + #10 +
            '       Where 1=1                                                                                                 ' + #13 + #10 ;  // William Santana SOL 208956 - KTN 2017630
         // '       WHERE (H.DATAPAGAMENTO   = TO_DATE('+QuotedStr(Data) +',''DD/MM/YYYY''))                                  ' + #13 + #10 ;  // William Santana SOL 208956 - KTN 2017630

            if (dblkcLote.Visible) then
               sSql := sSql + '       AND   (H.IDLOTE          = '+ qryLoteIDLOTE.AsString +')                                ' + #13 + #10;

            sSql := sSql +
            '       AND   (H.IDMOTIVO        = '+ qryMotivoIDMOTIVO.AsString +')                                              ' + #13 + #10 +
            '       AND   (H.FLGENVIADO      = '+ IntToStr(RGLancamento.ItemIndex) +')                                        ' + #13 + #10 +
            '       AND   (H.FLGMANUAL       = 3)                                                                             ' + #13 + #10 +
            '       AND   (H.IDMOTIVO = M.IDMOTIVO)                                                                           ' + #13 + #10 +
            '       AND   (H.IDPESSOA = D.IDPESSOA)                                                                           ' + #13 + #10 +
            '       AND   (H.IDTITULAR = D.IDTITULAR)                                                                         ' + #13 + #10 +
            '       AND   (H.IDBENEFICIO = B.IDBENEFICIO)                                                                     ' + #13 + #10 +
            '       AND   (H.IDLOTE      = C.IDLOTE(+))                                                                          ' + #13 + #10 +
            '       ORDER BY H.TRGDTINCLUSAO DESC, H.MESREFERENCIA DESC                                                       ' + #13 + #10 ;


  // Atualiza Botões
  bbtnCancelar.Enabled  := ((dblkcMotivo.Text <> '') or  ((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (edtArquivo.Text <> ''));
  bbtnConfirmar.Enabled := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));
  bBtnDesfazer.Enabled  := ((dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) and (edtArquivo.Text <> ''));

  //William Santana SOL 208956 - KTN 2017630
  SB1.Enabled := ((RGLancamento.ItemIndex = 1) and (dblkcMotivo.Text <> ''))
             or  ((RGLancamento.ItemIndex = 0) and (dblkcLote.Tag = 1) and (dblkcLote.Text <> '') and (dblkcMotivo.Text <> ''))
             or   (edtArquivo.Text <> '');
  //William Santana SOL 208956 - KTN 2017630

  //  Se os campos tiverem preenchidos executa o select ou se FlgBusca for = S
  if (dblkcMotivo.Text <> '') and (((dblkcLote.Tag = 1) and (dblkcLote.Text <> '')) or (dblkcLote.Tag = 0)) or (FlgBusca = 'S') then
  begin
    QryImporta.Close;
    Qryimporta.Sql.Clear;
    QryImporta.Sql.Add(sSql);
    QryImporta.Open;
  end else
  begin
    QryImporta.Close;
  end;

end;

procedure TfrmLancHistBenef.Panel1Exit(Sender: TObject);
begin
  inherited;

  AtualizaBusca(dtData);

end;

procedure TfrmLancHistBenef.dtDataExit(Sender: TObject);
begin
  inherited;
  AtualizaBusca(dtData);
end;

procedure TfrmLancHistBenef.dtDataChange(Sender: TObject);
begin
  inherited;
  AtualizaBusca(dtData);
end;

procedure TfrmLancHistBenef.dtDataEnter(Sender: TObject);
begin
  inherited;
  AtualizaBusca(dtData);
end;

procedure TfrmLancHistBenef.dtDataClick(Sender: TObject);
begin
  inherited;
  AtualizaBusca(dtData);
end;


//William Santana SOL 208956 KIN 2017630
Function TfrmLancHistBenef.ValidaNumProcesso():boolean;
var
  Qry2 : TwwQuery;
begin

  Qry2 := TwwQuery.Create(nil);
  Qry2.DatabaseName := 'BaseDados';

  Qry2.Close;
  Qry2.Sql.Clear;
  Qry2.Sql.Add('SELECT B.IDPESSOA, B.IDTITULAR, B.IDPESSJUR, B.NUMEROPROCESSO, B.SEQPROPOSTA FROM DEPENTIT D, BENEFBFCIARIO B');
  Qry2.Sql.Add('WHERE D.MATRICULA = ' + QuotedStr(Registro.Matricula));
  Qry2.Sql.Add('AND B.IDBENEFICIO = ' + IntToStr(Registro.IDBeneficio));
  Qry2.Sql.Add('AND B.IDPLANOPREV = ' + IntToStr(Registro.IDPlanoPrev));
  Qry2.Sql.Add('AND B.IDPLANOORIGEM = ' + IntToStr(Registro.IDPlanoOrigem));
  Qry2.Sql.Add('AND B.NUMEROPROCESSO = ' + IntToStr(Registro.NumeroProcesso));  //William Santana SOL 208956 - KTN 2017630
  Qry2.Sql.Add('AND D.IDPESSOA = B.IDPESSOA');
  Qry2.Sql.Add('AND D.IDTITULAR = B.IDTITULAR');
  Qry2.Open;

  Result := true;

  if (qry2.IsEmpty) or (Qry2.FieldByName('NUMEROPROCESSO').AsInteger <> QryExcel.FieldByName('NUMEROPROCESSO').AsInteger) then
  begin
    result := False;
    Registro.LogErro := 'Linha ' + IntToStr(Registro.SequenciaFor) + ': ' + #13#10 +
   'Número do processo de benefício '+QryExcel.FieldByName('NUMEROPROCESSO').AsString +' é inválido.' + #13#10;
  end;
  
end;
//END - William Santana SOL 208956 KIN 2017630

end.
