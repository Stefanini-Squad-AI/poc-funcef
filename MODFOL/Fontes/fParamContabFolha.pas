// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamContabFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, checklst, Spin, wwdblook, Db, Wwdatsrc, DBTables, Wwquery,
  ComCtrls, Gauges, wwdbdatetimepicker, CMDateTimePicker, fcLabel, fSairAjuda;

type
  TfrmParamContabFolha = class(TfrmSairAjuda)
    qryParamRH: TwwQuery;
    qryMotivo: TwwQuery;
    qryMotivoDESCRICAO: TStringField;
    qryMotivoIDMOTIVO: TFloatField;
    qryTipoOper: TwwQuery;
    qryContabFolha: TwwQuery;
    qryAuxContab: TwwQuery;
    qryContasCC: TwwQuery;
    qryAux: TwwQuery;
    qryContas: TwwQuery;
    qryTipoDoc: TwwQuery;
    pnlSelecao: TPanel;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgConsolida: TRadioGroup;
    gbxEstabelecimento: TGroupBox;
    dblkcbEstabelecimento: TwwDBLookupCombo;
    gbxMotivo: TGroupBox;
    chkMotivo: TCheckListBox;
    spbtInvSelecao: TBitBtn;
    spbtSelTodos: TBitBtn;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    gbxOpcoes: TGroupBox;
    PageControl1: TPageControl;
    tbshContab: TTabSheet;
    gbxTipoPag: TGroupBox;
    dblcTipOper: TwwDBLookupCombo;
    tbshCAP: TTabSheet;
    Label11: TLabel;
    Label1: TLabel;
    dtPagamento: TCMDateTimePicker;
    dblcTipoDoc: TwwDBLookupCombo;
    chkRateioCC: TCheckBox;
    qryEstab: TwwQuery;
    tbshOpcoesCAP: TTabSheet;
    chkTipoDes: TCheckListBox;
    bbtnSelTipo: TBitBtn;
    bbtnInvTipo: TBitBtn;
    qryTipoDes: TwwQuery;
    pnlProgresso: TPanel;
    gagProgresso: TGauge;
    tblDocumentos: TTable;
    fcLabel3: TfcLabel;
    Bevel11: TBevel;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    rgProcesso: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkMotivoDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chkMotivoClickCheck(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelTipoClick(Sender: TObject);
    procedure bbtnInvTipoClick(Sender: TObject);
  private
    ListaMotivo, ListaTipo, ListaTipoCod: TStringList;

    iIDPatro, iIDPlanoPrev, iCodDocumento, iUnidNegoc, PortadorFormaDefault,
    iProvento, UltIdFavorecido: integer;

    sCodTipRecDes, sCodCentroRespon, ContaLiquido, sDebCre: string;

    dUltValorProvento, dTotal: double;

    procedure FazIntegraCAP;
  public
    { Public declarations }
  end;

var
  frmParamContabFolha: TfrmParamContabFolha;
  bTestaConta, bErroCAP: boolean;
  NomeTabela, DataRef, sMes, sMensagem, sMascara: string;
  I, liExercicio, liPeriodo, iEmpresa, iPlano, UltIdBanco: integer;

implementation

uses uSistema, uMensErro, uFuncoesUteisRH, dBaseDados, uLancContab, uFuncoesFolha, fPrincipal,
  uDocumento, UsoGeralRH, uFuncaoGeral;

{$R *.DFM}

procedure TfrmParamContabFolha.FormCreate(Sender: TObject);
begin
  inherited;
  ListaMotivo := TStringList.Create;
  ListaTipo   := TStringList.Create;
  ListaTipoCod:= TStringList.Create;
  Documento   := TDocumento.Create;

  qryTipoOper.Open;
  qryTipoDoc.Open;
  qryMotivo.Open;
  qryTipoDes.Open;

  ListaMotivo.Clear;
  chkMotivo.Items.Clear;
  I := 0;
  while not(qryMotivo.EOF) do
  begin
    chkMotivo.Items.Add(qryMotivo.FieldByName('DESCRICAO').asString);
    chkMotivo.Checked[I] := true;
    Inc(I);
    ListaMotivo.Add(qryMotivo.FieldByName('IDMOTIVO').asString);
    qryMotivo.Next;
  end;

  chkTipoDes.Items.Clear;
  ListaTipo.Clear;
  I := 0;
  while not(qryTipoDes.EOF) do
  begin
    chkTipoDes.Items.Add(qryTipoDes.FieldByName('DESCRICAO').asString);
    //chkTipoDes.Checked[I] := true; // 09/12/2002 ECF deixar default tudo desmarcado
    Inc(I);
    ListaTipo.Add(qryTipoDes.FieldByName('CODTIPRECDES').asString);
    qryTipoDes.Next;
  end;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    if (Pos(',',sUsuXfilial) > 0) then
      qryEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND'
    else
      qryEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
  end;

  qryEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryEstab.Open;
  qryParamRH.Open;
  qryContasCC.Open;

  with (qryAuxContab) do
  begin
    SQL.Clear;
    SQL.Add ('SELECT IDPATRO, IDPLANOPREV FROM PARALMOX');
    Open;
    iIDPatro     := IFF(Sistema.UsaPlanoPatro, FieldByName('IDPATRO').asInteger, -1);
    iIDPlanoPrev := IFF(Sistema.UsaPlanoPatro, FieldByName('IDPLANOPREV').asInteger, -1);
    Close;
  end;
  qryAuxContab.SQL.Clear;

  sMes             := Copy(qryParamRH.FieldByName('NORMALINI').asString,4,2);
  cmbMes.ItemIndex := StrToInt(sMes) - 1;
  speAno.Text      := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);
end;

procedure TfrmParamContabFolha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Documento.Free;
  ListaMotivo.Free;
  ListaTipo.Free;
  ListaTipoCod.Free;

  qryMotivo.Close;
  qryEstab.Close;
  qryParamRH.Close;
  qryContasCC.Close;
  inherited;
end;

procedure TfrmParamContabFolha.chkMotivoDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamContabFolha.chkMotivoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamContabFolha.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkMotivo.Items.Count-1 do
    chkMotivo.Checked[c] := not chkMotivo.Checked[c];

  chkMotivo.Repaint;
end;

procedure TfrmParamContabFolha.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chkMotivo.Items.Count-1 do
    chkMotivo.Checked[c] := true;

  chkMotivo.Repaint;
end;

procedure TfrmParamContabFolha.bbtnVoltarClick(Sender: TObject);
begin
  pnlResult.SendToBack;
end;

procedure TfrmParamContabFolha.bbtnConfirmarClick(Sender: TObject);
var
  SvNum: TBookMark;
  K, I, iUltPessJur: integer;
  planilha, Pln: LongInt;
  sHist1, sHist2, sHist3, sHist4, sHist5, sHistorico,
  sSql, sCentCust, sCodSubContaDeb, sCodSubContaCre, sMesRef: string;
  bTemOutroCC, bTemContaCC, bTemAlguma, bBookMark, bConsolida, FazCAP, FazContab: boolean;
begin
  FazCAP      := (dblcTipoDoc.Text <> '');
  FazContab   := (dblcTipOper.Text <> '');
  bConsolida  := (rgConsolida.ItemIndex = 0);
  iUltPessJur := -1;

  if (rgProcesso.ItemIndex = 0) then
  begin
    if (MsgDlg('Você tem certeza de que vai executar a partir da Prévia ? ','Confirmação ',
                  mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
      exit;
    if (MsgDlg('Esta é a última oportunidade de não executar a partir da Prévia. ' +
               'Confirma assim mesmo ? ','Confirmação ',
                  mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
      exit;
  end;

  if (dblcTipOper.Text = '') then
  begin
    if (MsgDlg('Tipo de Operação não preenchido. Contabilização não será processada. Confirma ? ','Confirmação ',
                  mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
    begin
      PageControl1.ActivePage := tbshContab;
      dblcTipOper.SetFocus;
      exit;
    end;
  end;

  if (dblcTipoDoc.Text = '') then
  begin
    if (MsgDlg('Tipo de Documento não preenchido. Contas a Pagar não será processada. Confirma ? ','Confirmação ',
                  mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
    begin
      PageControl1.ActivePage := tbshCAP;
      dblcTipoDoc.SetFocus;
      exit;
    end;
  end;

  if (dblcTipOper.Text = '') and (dblcTipoDoc.Text = '') then
  begin
    MsgDlg('Sem nenhuma das 2 opções, este processo não faz sentido !',
           'Aviso', mtInformation,[mbOk,mbHelp],0);
    PageControl1.ActivePage := tbshContab;
    dblcTipOper.SetFocus;
    exit;
  end;

  if (FazCAP) then
  begin
    ListaTipoCod.Clear;
    for I:=0 to chkTipoDes.Items.Count-1 do
      if (chkTipoDes.Checked[I]) then
        ListaTipoCod.Add(ListaTipo[I]);

    if (ListaTipoCod.Count  = 0) then
    begin
      MsgDlg('Selecione pelo menos um tipo de desembolso !',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      PageControl1.ActivePage := tbshOpcoesCAP;
      exit;
    end;

    AbreTempDocum(tblDocumentos); // query que contém todos os documentos
    // criados neste processo, que serão (ao final do mesmo) atualizados
    // com o número da planilha contábil (plncodigo) gerada na contabilização

    with (qryAuxContab) do
    begin
      PortadorFormaDefault := 0;
      UltIdbanco := 0;
      Close;
      SQL.Clear;
      SQL.Add('SELECT CODPORTFORMA FROM BANCOPORTFOLHA WHERE IDBANCO IS NULL');
      Open;

      if not(EOF) then
        PortadorFormaDefault := FieldByName('CODPORTFORMA').asInteger;

      close;

      SQL.Clear;
      SQL.Add('SELECT PC.IDBANCO FROM PORTADORFORMA PF, PORTADORCONTA PC');
      SQL.Add('WHERE PF.CODPORTFORMA = ' + IntToStr(PortadorFormaDefault));
      SQL.Add('AND   PF.CODPORTADOR  = PC.CODPORTADOR');
      Open;

      if not(EOF) then
        UltIdbanco := FieldByName('IDBANCO').asInteger;

      Close;
    end;
    frmPrincipal.prmCodTipDoc := dblcTipoDoc.LookupValue;
  end;

  sMes := IntToStr(cmbMes.ItemIndex + 1);
  if (cmbMes.ItemIndex < 9) then
    sMes := '0' + sMes;

  DataRef     := DateToStr(TrazUltDiaData(StrToDate('01/' + sMes + '/' + speAno.Text)));
  sMesRef     := speAno.Text + '/' + sMes;
  sMensagem   := '';
  sMascara    := '';
  bTestaConta := True;
  iEmpresa    := Sistema.idEmpresa;

  if not(TestaPeriodo(True,'BaseDados',DataRef,IntToStr(Sistema.idModulo),
         liExercicio,liPeriodo,iEmpresa, sMensagem) = 0) then
  begin
    cmbMes.SetFocus;
    exit;
  end;

  if (rgProcesso.ItemIndex = 0) then
    NomeTabela := 'PREVIAFOLPAG'
  else
    NomeTabela := 'HISTRUBSAL';


  with (qryAuxContab) do
  begin
    SQL.Clear;
    SQL.Add ('SELECT COUNT(*) AS CONTA FROM HORATRABOUTROCC');
    SQL.Add ('WHERE IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    SQL.Add ('AND   FLGRATEIO = 1');
    SQL.Add ('AND   TO_CHAR(DATATRAB,''YYYY/MM'') = '+QuotedStr(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1)));
    Open;
    bTemOutroCC := FieldByName('CONTA').asInteger > 0;
    Close;
  end;
  qryAuxContab.SQL.Clear;


  with (qryContabFolha.SQL) do
  begin
    Clear;
    if not bTemOutroCC then // não tem rateio de horas trabalhadas para outros C.Custo
    begin
      Add('SELECT ');
      Add('  FUNC.IDEMPRESA, FUNC.CODCENTROCUSTO,');
      Add('  H.MES, H.IDRUBRICA, H.CODPROVDESC, sum(H.VALORPROVENTO) AS TOTALPROVENTO ');
      Add('FROM');
      Add('  FUNCIONARIO FUNC, '+NomeTabela+' H ');
      // ------------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (H.MES        = '+QuotedStr(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ') AND');
      // ------------------------------------------------------------------------------- //
      K := 1;
      begin
        for I:=0 to chkMotivo.Items.Count-1 do
          if (chkMotivo.Checked[I]) then
          begin
            if (K = 1) then
            begin
              Add('  (H.IDMOTIVO IN ('+ListaMotivo.Strings[I]);
              Inc(K);
            end
            else
              Add(','+ListaMotivo.Strings[I]);
          end;
          if (K > 1) then
            Add(')) AND');
      end;
      // ------------------------------------------------------------------------------- //
      if (dblkcbEstabelecimento.Value <> '') then
        Add('  (FUNC.IDESTAB = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

      Add ('  (H.IDPESSOA           = FUNC.IDPESSOA)  ');
      Add ('GROUP BY');
      Add ('   H.MES, FUNC.IDEMPRESA, FUNC.CODCENTROCUSTO, H.IDRUBRICA, H.CODPROVDESC');
      Add ('ORDER BY');
      Add ('   H.MES, FUNC.IDEMPRESA, FUNC.CODCENTROCUSTO, H.IDRUBRICA');
    end
    else  // tem rateio de horas trabalhadas para outros C.Custo
    begin
      Add ('SELECT');
      Add ('  TUDO.IDEMPRESA, TUDO.CODCENTROCUSTO,');
      Add ('  TUDO.MES, TUDO.IDRUBRICA, TUDO.CODPROVDESC,');
      Add ('  ROUND(SUM(TUDO.TOTALPROVENTO),2) AS TOTALPROVENTO');
      Add ('FROM');
      Add ('(');
      Add ('SELECT');
      Add ('  FUNC.IDEMPRESA, FUNC.CODCENTROCUSTO,');
      Add ('  H.MES, H.IDRUBRICA, H.CODPROVDESC, sum(H.VALORPROVENTO) AS TOTALPROVENTO');
      Add ('FROM');
      Add ('  FUNCIONARIO FUNC, '+NomeTabela+' H ');
      Add ('WHERE');
      Add('  (H.MES        = '+QuotedStr(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ') AND');
      // ------------------------------------------------------------------------------- //
      K := 1;
      begin
        for I:=0 to chkMotivo.Items.Count-1 do
          if (chkMotivo.Checked[I]) then
          begin
            if (K = 1) then
            begin
              Add('  (H.IDMOTIVO IN ('+ListaMotivo.Strings[I]);
              Inc(K);
            end
            else
              Add(','+ListaMotivo.Strings[I]);
          end;
          if (K > 1) then
            Add(')) AND');
      end;
      // ------------------------------------------------------------------------------- //
      if (dblkcbEstabelecimento.Value <> '') then
        Add('  (FUNC.IDESTAB = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

      Add ('  (H.IDPESSOA           = FUNC.IDPESSOA)  ');
      Add ('GROUP BY');
      Add ('   FUNC.IDEMPRESA, H.MES, H.IDRUBRICA, H.CODPROVDESC, FUNC.CODCENTROCUSTO');

      Add ('UNION');

      Add ('SELECT');
      Add ('  HCC.IDEMPRESA, HCC.CODCENTROCUSTO,');
      Add ('  H.MES, H.IDRUBRICA, H.CODPROVDESC,');
      Add ('  - SUM(H.VALORPROVENTO)*HCC.RATEIO AS TOTALPROVENTO');
      Add ('FROM');
      Add ('  '+NomeTabela+' H,');
      Add ('  (SELECT');
      Add ('   HC.IDPESSOA, F.IDEMPRESA, F.CODCENTROCUSTO,');
      Add ('   SUM(HC.HORASTRAB) / HT.JORNADAMENSAL AS RATEIO');
      Add ('   FROM HORATRABOUTROCC HC, FUNCIONARIO F, HORATRAB HT');
      Add ('   WHERE   (HC.IDPESSOA  = F.IDPESSOA)');
      Add ('   AND     (F.IDHORARIO  = HT.IDHORARIO)');
      Add ('   AND     (HC.FLGRATEIO = 1)');
      Add ('   AND     (TO_CHAR(HC.DATATRAB,''YYYY/MM'') = '+QuotedStr(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ')');
      Add ('   GROUP BY HC.IDPESSOA, F.IDEMPRESA, F.CODCENTROCUSTO, HT.JORNADAMENSAL) HCC');
      Add ('WHERE');
      Add ('  (H.MES         = '+QuotedStr(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ') AND');
      // ------------------------------------------------------------------------------- //
      K := 1;
      begin
        for I:=0 to chkMotivo.Items.Count-1 do
          if (chkMotivo.Checked[I]) then
          begin
            if (K = 1) then
            begin
              Add('  (H.IDMOTIVO IN ('+ListaMotivo.Strings[I]);
              Inc(K);
            end
            else
              Add(','+ListaMotivo.Strings[I]);
          end;
          if (K > 1) then
            Add(')) AND');
      end;
      // ------------------------------------------------------------------------------- //

      Add ('  (H.IDPESSOA    = HCC.IDPESSOA)');
      Add ('GROUP BY');
      Add ('   HCC.IDEMPRESA, H.MES, H.IDRUBRICA, H.CODPROVDESC,');
      Add ('   HCC.CODCENTROCUSTO, HCC.RATEIO');

      Add ('UNION');

      Add ('SELECT');
      Add ('  HCC.IDEMPRESA, HCC.CODCENTROCUSTO,');
      Add ('  H.MES, H.IDRUBRICA, H.CODPROVDESC, sum(H.VALORPROVENTO)*HCC.RATEIO AS TOTALPROVENTO');
      Add ('FROM');
      Add ('  '+NomeTabela+' H,');
      Add ('  (SELECT');
      Add ('   HC.IDPESSOA, HC.IDEMPRESA, HC.CODCENTROCUSTO,');
      Add ('   SUM(HC.HORASTRAB) / HT.JORNADAMENSAL AS RATEIO');
      Add ('   FROM HORATRABOUTROCC HC, FUNCIONARIO F, HORATRAB HT');
      Add ('   WHERE   (HC.IDPESSOA  = F.IDPESSOA)');
      Add ('   AND     (F.IDHORARIO  = HT.IDHORARIO)');
      Add ('   AND     (HC.FLGRATEIO = 1)');
      Add ('   AND     (TO_CHAR(HC.DATATRAB,''YYYY/MM'') = '+QuotedStr(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ')');
      Add ('   GROUP BY HC.IDPESSOA, HC.IDEMPRESA, HC.CODCENTROCUSTO, HT.JORNADAMENSAL) HCC');
      Add ('WHERE');
      Add ('  (H.MES         = '+QuotedStr(IntToStr(speAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1))+ ') AND');
      // ------------------------------------------------------------------------------- //
      K := 1;
      begin
        for I:=0 to chkMotivo.Items.Count-1 do
          if (chkMotivo.Checked[I]) then
          begin
            if (K = 1) then
            begin
              Add('  (H.IDMOTIVO IN ('+ListaMotivo.Strings[I]);
              Inc(K);
            end
            else
              Add(','+ListaMotivo.Strings[I]);
          end;
          if (K > 1) then
            Add(')) AND');
      end;
      // ------------------------------------------------------------------------------- //

      Add ('  (H.IDPESSOA    = HCC.IDPESSOA)');
      Add ('GROUP BY');
      Add ('   HCC.IDEMPRESA, H.MES, H.IDRUBRICA, H.CODPROVDESC,');
      Add ('   HCC.CODCENTROCUSTO, HCC.RATEIO');
      Add (') TUDO');
      Add ('GROUP BY');
      Add ('   MES, IDEMPRESA, CODCENTROCUSTO, IDRUBRICA, CODPROVDESC');
      Add ('ORDER BY');
      Add ('   MES, IDEMPRESA, CODCENTROCUSTO, IDRUBRICA, CODPROVDESC');
    end;
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  with (qryContabFolha) do
  begin
    Open;

    pnlProgresso.Visible := true;
    pnlProgresso.Top := 130;
    pnlProgresso.BringToFront;
    pnlProgresso.Update;
    gagProgresso.MaxValue := RecordCount;
    gagProgresso.Progress := 0;
    memResult.Lines.Clear;

    dtmBaseDados.dbBaseDados.StartTransaction;
    while not(EOF) do
    begin
      //  Quebra empresa
      if (FieldByName('IdEmpresa').asInteger <> iUltPessJur) then
      begin
        iUltPessJur := FieldByName('IdEmpresa').asInteger;
        // Pega Máscara do Plano de Contas
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT PL.MASCARA, PR.PLANO FROM PLANO PL, PARAMCONTAB PR ');
        qryAux.SQL.Add('WHERE PR.PLANO = PL.PLANO AND PR.IDPESSOA = '+IntToStr(iUltPessJur));
        qryAux.Open;
        sMascara  := qryAux.Fields[0].asString;
        iPlano    := qryAux.Fields[1].asInteger;
        qryAux.Close;
      end;

      gagProgresso.Progress := gagProgresso.Progress + 1;
      iProvento             := FieldByName('IdRubrica').asInteger;
      sSql := 'SELECT C.IDPLANO1,C.IDPLANO2,C.CONTADEBITO,C.IDPESSDEBITO, '+
              'C.CONTACREDITO,C.IDPESSCREDITO,C.CODSUBDEBITO,C.CODSUBCREDITO,'+
              'C.RECPAG,C.CODTIPRECDES,C.CODCENTRORESPON,C.UNIDNEGOC,C.IDFAVORECIDO,'+
              'PD.DESCRICAO, PD.FLGDESCONTO '+
              ' FROM CONTABFOLHA C, PROVDESC PD'+
              ' WHERE (C.IDPROVENTO = '+IntToStr(iProvento)+')'+
              ' AND (C.CODCENTROCUSTO = ''' + FieldByName('CODCENTROCUSTO').asString + ''')'+
              ' AND (C.IDEMPRESA = ' + FieldByName('IDEMPRESA').asString + ')'+
              ' AND (C.IDPESSDEBITO IS NULL OR C.IDPESSDEBITO = ''' + FieldByName('IDEMPRESA').asString + ''')'+
              ' AND (C.IDPESSCREDITO IS NULL OR C.IDPESSCREDITO = ''' + FieldByName('IDEMPRESA').asString + ''')'+
              ' AND (C.IDPROVENTO = PD.IDPROVENTO) ';
      sCentCust    := FieldByName('CODCENTROCUSTO').asString;
      qryAuxContab.Close;
      qryAuxContab.SQL.Text := sSql;
      qryAuxContab.Open;

      if (qryAuxContab.IsEmpty) then
      begin
        sCentCust := '';
        sSql := 'SELECT C.IDPLANO1,C.IDPLANO2,C.CONTADEBITO,C.IDPESSDEBITO, '+
                'C.CONTACREDITO,C.IDPESSCREDITO,C.CODSUBDEBITO,C.CODSUBCREDITO,'+
                'C.RECPAG,C.CODTIPRECDES,C.CODCENTRORESPON,C.UNIDNEGOC,C.IDFAVORECIDO,'+
                'PD.DESCRICAO, PD.FLGDESCONTO '+
                ' FROM CONTABFOLHA C, PROVDESC PD'+
                ' WHERE (C.IDPROVENTO = '+IntToStr(iProvento)+')'+
                ' AND (C.CODCENTROCUSTO IS NULL) '+
                ' AND (C.IDPESSDEBITO IS NULL OR C.IDPESSDEBITO = ''' + FieldByName('IDEMPRESA').asString + ''')'+
                ' AND (C.IDPESSCREDITO IS NULL OR C.IDPESSCREDITO = ''' + FieldByName('IDEMPRESA').asString + ''')'+
                ' AND (C.IDPROVENTO = PD.IDPROVENTO) ';
        qryAuxContab.Close;
        qryAuxContab.SQL.Text := sSql;
        qryAuxContab.Open;
      end;

      if not(qryAuxContab.IsEmpty) then
      begin
        // Contas a Pagar
        iUnidNegoc       := qryAuxContab.FieldByName('UNIDNEGOC').asInteger;
        sCodCentroRespon := qryAuxContab.FieldByName('CODCENTRORESPON').asString;
        sCodTipRecDes    := qryAuxContab.FieldByName('CODTIPRECDES').asString;
        UltIdFavorecido  := qryAuxContab.FieldByName('IDFAVORECIDO').asInteger;

        if (qryAuxContab.FieldByName('FLGDESCONTO').asInteger = 0) then
          sDebCre := 'D'
        else
          sDebCre := 'C';

        ContaLiquido := ''; // Parametrizar Conta Contábil do Líquido ???
        dUltValorProvento := FieldByName('TOTALPROVENTO').asFloat;
        //iPortFormaParticip := 0; //(CASO TENHA OUTRAS FORMAS)qryPrinc.FieldByName('CODPORTFORMA').asInteger;

        // Contabilidade
        if (FazContab) then
        begin
          sCodSubContaDeb := '';
          sCodSubContaCre := '';
          bBookMark       := false;
          bTemAlguma      := false;
          bTemContaCC     := false;
          SvNum           := qryAuxContab.GetBookMark;

          qryAuxContab.First;
          while not(qryAuxContab.EOF) do
          begin
            {sSql:='SELECT PLACCUST '+
                   ' FROM PLANOCONTA'+
                   ' WHERE (PLANO  = '+qryAuxContab.FieldByName('IDPLANO1').asString+')'+
                   ' AND (PLACONTA = '+qryAuxContab.FieldByName('CONTADEBITO').asString)+')';
             qryContas.Close;
             qryContas.SQL.Text:=sSql;
             qryContas.Open;}
            bTemContaCC := False;

            if (Trim(qryAuxContab.FieldByName('CONTADEBITO').asString) <> '') then
            begin
              bTemAlguma  := True;
              bTemContaCC := (sCentCust = FieldByName('CODCENTROCUSTO').asString) or
                    (qryContasCC.Locate('PLANO;PLACONTA;IDEMPRESA;CODCENTROCUSTO',
                     VarArrayOf([qryAuxContab.FieldByName('IDPLANO2').asInteger,
                     qryAuxContab.FieldByName('CONTADEBITO').asString,
                     iUltPessJur,
                     FieldByName('CODCENTROCUSTO').asString]),[]));

              if (bTemContaCC) then
              begin
                bBookMark := False;
                break;
              end
              else
              begin
                SvNum     := qryAuxContab.GetBookMark;
                bBookMark := (sCentCust = '') or (not (qryContasCC.Locate('PLANO;PLACONTA',
                  VarArrayOf([qryAuxContab.FieldByName('IDPLANO2').asInteger,
                  qryAuxContab.FieldByName('CONTADEBITO').asString]),[])));
              end;
            end;

            qryAuxContab.Next;
          end;

          if (bBookMark) then
            qryAuxContab.GotoBookMark(SvNum);

          if (bBookMark) or (bTemContaCC) then
          begin
            if not(qryAuxContab.FieldByName('CODSUBDEBITO').isNull) then
              sCodSubContaDeb := qryAuxContab.FieldByName('CODSUBDEBITO').asString;

            Planilha := -1;
            try
              sHist1 := '';
              sHist2 := '';
              sHist3 := '';
              sHist4 := '';
              sHist5 := '';
              sHistorico := FieldByName('CODPROVDESC').asString +
                            ' ' +  qryAuxContab.FieldByName('DESCRICAO').asString +
                            ' ' +  sMesRef;
              FuncaoGeral.ArrumaHistorico(sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);
              Planilha := LANCACONTAB (True, 'BASEDADOS', DataRef,
                          InttoStr(Sistema.IdModulo), '0',
                          'D', '', '', '', '', '', '', '', '', '', '', sMesRef,
                          sHist1,
                          sHist2,
                          sHist3, sHist4, sHist5,
                          qryTipoOper.FieldByName('TIPCODIGO').asString,
                          FieldByName('CODCENTROCUSTO').asString,
                          qryAuxContab.FieldByName('CONTADEBITO').asString,
                          '',
                          '',
                          liExercicio, liPeriodo, FieldByName('IDEMPRESA').asInteger,
                          Sistema.IdUsuario,
                          qryAuxContab.FieldByName('IDPLANO2').asInteger,
                          FieldByName('TOTALPROVENTO').asFloat, 0, 0, 0, 0, 0, 0, 0, 0, '',
                          bConsolida, 0, 0, sCodSubContaDeb, '',
                          '', '', Pln, sMensagem, sMascara, bTestaConta, 0,
                          iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
              pln := planilha;

            except
              pln := planilha;

              if (pln > 0) then
                pln := -1;

              if (pln < 0) then
                break;

            {  on E: EDBEngineError do
              begin
                 MostrarErro(E);
              end;
            }
            end; //try
          end
          else
          begin
            if (bTemAlguma) and (MsgDlg('Conta a Débito Não Encontrada para a Rubrica '+
               IntToStr(iProvento) + ' (Código Interno) e o Centro de Custo '+
               Trim(FieldByName('CODCENTROCUSTO').asString)+ '. Continua o Processo ? ',
               'Confirmação ', mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
              break;
          end;

          bBookMark  := false;
          bTemAlguma := false;
          SvNum      := qryAuxContab.GetBookMark;

          qryAuxContab.First;
          while not(qryAuxContab.EOF) do
          begin
            {sSql:='SELECT PLACCUST '+
                   ' FROM PLANOCONTA'+
                   ' WHERE (PLANO  = '+qryAuxContab.FieldByName('IDPLANO2').asString+')'+
                   ' AND (PLACONTA = '+qryAuxContab.FieldByName('CONTACREDITO').asString)+')';
             qryContas.Close;
             qryContas.SQL.Text:=sSql;
             qryContas.Open;}
            bTemContaCC := False;

            if (Trim(qryAuxContab.FieldByName('CONTACREDITO').asString) <> '') then
            begin
              bTemAlguma  := True;
              bTemContaCC := (sCentCust = FieldByName('CODCENTROCUSTO').asString) or
                    (qryContasCC.Locate('PLANO;PLACONTA;IDEMPRESA;CODCENTROCUSTO',
                     VarArrayOf([qryAuxContab.FieldByName('IDPLANO1').asInteger,
                     qryAuxContab.FieldByName('CONTACREDITO').asString,
                     iUltPessJur,
                     FieldByName('CODCENTROCUSTO').asString]),[]));
              if (bTemContaCC) then
              begin
                bBookMark := false;
                break;
              end
              else
              begin
                SvNum     := qryAuxContab.GetBookMark;
                bBookMark := (sCentCust = '') or (not (qryContasCC.Locate('PLANO;PLACONTA',
                   VarArrayOf([qryAuxContab.FieldByName('IDPLANO1').asInteger,
                   qryAuxContab.FieldByName('CONTACREDITO').asString]),[])));
              end;
            end;
            qryAuxContab.Next;
          end;

          if (bBookMark) then
            qryAuxContab.GotoBookMark(SvNum);

          if (bBookMark) or (bTemContaCC) then
          begin
            if not(qryAuxContab.FieldByName('CODSUBCREDITO').isNull) then
              sCodSubContaCre := qryAuxContab.FieldByName('CODSUBCREDITO').asString;

            Planilha := -1;
            try
              sHist1 := '';
              sHist2 := '';
              sHist3 := '';
              sHist4 := '';
              sHist5 := '';
              sHistorico := FieldByName('CODPROVDESC').asString +
                            ' ' +  qryAuxContab.FieldByName('DESCRICAO').asString +
                            ' ' +  sMesRef;
              FuncaoGeral.ArrumaHistorico(sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);
              Planilha := LANCACONTAB (True, 'BASEDADOS', DataRef,
                          InttoStr(Sistema.IdModulo), '1',
                          'C', '', '', '', '', '', '', '', '', '', '', sMesRef,
                          sHist1,
                          sHist2,
                          sHist3, sHist4, sHist5,
                          qryTipoOper.FieldByName('TIPCODIGO').asString,
                          '',
                          '',
                          FieldByName('CODCENTROCUSTO').asString,
                          qryAuxContab.FieldByName('CONTACREDITO').asString,
                          liExercicio, liPeriodo, FieldByName('IDEMPRESA').asInteger,
                          Sistema.IdUsuario,
                          qryAuxContab.FieldByName('IDPLANO1').asInteger,
                          FieldByName('TOTALPROVENTO').asFloat, 0, 0, 0, 0, 0, 0, 0, 0, '',
                          bConsolida, 0, 0, '', sCodSubContaCre,
                          '', '', Pln, sMensagem, sMascara, bTestaConta, 0,
                          iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
              pln := planilha;

            except
             {
              on E: EDBEngineError do
              begin
                 MostrarErro(E);
              end;
             } 
              pln := planilha;

              if (pln > 0) then
                pln := -1;

              if (pln < 0) then
                break;

            end; //try
          end
          else
          begin
            if (bTemAlguma) and (MsgDlg('Conta a Crédito Não Encontrada para a Rubrica ' +
                IntToStr(iProvento)+ ' (Código Interno) e o Centro de Custo ' +
                Trim(FieldByName('CODCENTROCUSTO').asString) +
                '. Continua o Processo ? ','Confirmação ',
                mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
              break;
          end;
        end; // do FazContab

        if (FazCAP) and (sCodTipRecDes <> '') and
           (ListaTipoCod.IndexOf(sCodTipRecDes) <> -1) then
          FazIntegraCAP;
      end;
      Next;
    end;

    pnlProgresso.Visible := false;
    pnlProgresso.SendToBack;

    if (pln < 0) then
    begin
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Contabilização da Folha de Pagamento abortada pelo erro indicado.',
             'Informação',mtInformation,[mbOk,mbHelp],0);
      if (FazCAP) and (bErroCAP) then
        pnlSelecao.SendToBack;
    end
    else
    begin
      // Contas a Pagar
      if (FazCAP) then
      begin
        dTotal := 0;
        while not (tblDocumentos.EOF) do
        begin
          if (tblDocumentos.FieldByName('DEBCRE').asString = 'D') Then
            dTotal := dTotal + tblDocumentos.FieldByName('VALOR').asFloat
            else
            dTotal := dTotal - tblDocumentos.FieldByName('VALOR').asFloat;

          tblDocumentos.Next;
        end;

        tblDocumentos.First;
        iCodDocumento := DescarregaQryDocumentos(tblDocumentos, UltIdbanco, pln,
          IntToStr(PortadorFormaDefault), Copy(sMesRef,5,2), Copy(sMesRef,1,4),
          dTotal, StrToDate(dtPagamento.Text), Documento, chkRateioCC.Checked);
      end;

      if (FazCap) then
        tblDocumentos.Close;

      dtmBaseDados.dbBaseDados.Commit;
      MsgDlg('Contabilização e/ou Contas a Pagar da Folha de Pagamento efetuada com sucesso.',
             'Informação',mtInformation,[mbOk,mbHelp],0);
    end;
    Close;
  end;
end;

procedure TfrmParamContabFolha.FazIntegraCAP;
begin
  if not(AlimentaQryDocumentos(tblDocumentos,
         -1,
         -1,
         iPlano,
         IFF(iUnidNegoc <> 0, iUnidNegoc, -1),
         PortadorFormaDefault,
         UltIdFavorecido,
         ContaLiquido,
         sCodCentroRespon,
         sCodTipRecDes,
         sDebCre,
         dUltValorProvento,
         sMensagem,
         0,
         IFF(chkRateioCC.Checked, qryContabFolha.FieldByName('CODCENTROCUSTO').asString,''))) then
  begin
    memResult.Lines.Add('Erro na geração dos dados para o Contas a Pagar');
    memResult.Lines.Add('Rubrica..: ' +InttoStr(iProvento));
    memResult.Lines.Add(sMensagem);
    memResult.Lines.Add('---------------------------------------------------');
    bErroCAP := true;
  end;
end;

procedure TfrmParamContabFolha.bbtnSelTipoClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chkTipoDes.Items.Count-1 do
    chkTipoDes.Checked[c] := true;

  chkTipoDes.Repaint;
end;

procedure TfrmParamContabFolha.bbtnInvTipoClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chkTipoDes.Items.Count-1 do
    chkTipoDes.Checked[c] := not chkTipoDes.Checked[c];

  chkTipoDes.Repaint;
end;

end.
