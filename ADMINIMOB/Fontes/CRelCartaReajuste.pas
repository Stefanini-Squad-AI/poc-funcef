unit CRelCartaReajuste;

//	-------------------------------------------------------------------------------------------------
//
//	   Emissão de Cartas de Reajuste
//
//	Autor             :  Telma
//	Data de Início    :  25/08/2000
//	Data de Término   :
//
//	Modificações      :  Alex 19/10/2000  Exportado o relatório pelo Word
//
// -------------------------------------------------------------------------------------------------
//  MODIFICAÇÕES IMPORTANTES
//
//  Foi temporariamente desabilitada a impressão pelo WORD, tanto em
//  mala direta(gerando arquivo texto com dados para leitura pelo WORD)
//  como a impressão direta no arquivo WORD, através da procedure ImprimeWordDetalhe.
//
//  27/04/2004 - Marcio Motta
//  ------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Menus, ppBands, ppClass, ppProd, ppReport, Db,
  Wwdatsrc, ppEndUsr, ppComm, ppCache, ppDB, ppDBBDE, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  fcButton, fcImgBtn, fcShapeBtn, MontaSelect, TB97Ctls,
  cmseldlg, wwidlg, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, wwdblook, Pptypes, Wwdbspin, ppPrvDlg, ppforms, CRel, TREdit, WordOle,
  Word_TLB, uExtensoCM, ppRelatv, ppDBPipe, mContrato, wwdbdatetimepicker,
  CMDateTimePicker;

const
   ArqCMCartaReaj = 'CartaReajuste.tmp';

   vNomeMes : array[1..12] of string = ('JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ');
   vNumMes  : array[1..12] of string = ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');

type
  TcfgRelCartaReajuste = class(TcfgRel)
    pplconsulta: TppBDEPipeline;
    rptImprime: TppReport;
    RpImprimeHeaderBand1: TppHeaderBand;
    RpImprimeDetailBand1: TppDetailBand;
    RpImprimeFooterBand1: TppFooterBand;
    dsSql: TwwDataSource;
    ds: TwwDataSource;
    qryTemplate: TwwQuery;
    qryReports: TwwQuery;
    qryReportsNAME: TStringField;
    qryReportsIDREPORTS: TFloatField;
    qryReportsORIGEMCM: TFloatField;
    qryReportsTEMPLATE: TBlobField;
    Label2: TLabel;
    DBcboModeloCarta: TwwDBLookupCombo;
    memReports: TMemo;
    qrySql: TwwQuery;
    grpCabecalho: TGroupBox;
    edtPrimeiraParte: TEdit;
    edtTerceiraParte: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtIncremental: TRealEdit;
    qrySqlNUMERO_CONTRATO: TStringField;
    qrySqlNOME_CONTRATO: TStringField;
    qrySqlVLR_ATUAL_CONTRATO: TFloatField;
    qrySqlVLR_ANT_CONTRATO: TFloatField;
    qrySqlCONINDICEREAJUSTE: TFloatField;
    qrySqlCONPROXREAJUSTE: TDateTimeField;
    qrySqlCONDATAREAJUSTE: TDateTimeField;
    qrySqlRS_LOCATARIO: TStringField;
    qrySqlNOME_CONTATO: TStringField;
    qrySqlINDICE_REAJUSTE: TStringField;
    qrySqlDIAS_VLR_ANTERIOR: TFloatField;
    qrySqlDIAS_VLR_POSTERIOR: TFloatField;
    qrySqlPERCENT_REAJUSTE_CALCULADO: TFloatField;
    qrySqlPERCENT_REAJUSTE_ACUMULADO: TFloatField;
    qrySqlMES_REAJUSTE: TStringField;
    qrySqlMES_ULT_REAJUSTE: TStringField;
    qrySqlMES_REAJUSTE_MENOS_UM: TStringField;
    qrySqlData_Atual: TStringField;
    qrySqlVLR_DIAS_ANTERIOR: TFloatField;
    qrySqlVLR_DIAS_POSTERIOR: TFloatField;
    qrySqlDIAS_MES: TFloatField;
    qrySqlCONPERREAJUSTE: TFloatField;
    qrySqlVLR_TOTAL: TFloatField;
    qrySqlValorExtenso: TStringField;
    edtCharCompleta: TEdit;
    Label7: TLabel;
    qrySqlValorExtensoTot: TStringField;
    qryTemplateIDCARTACOBRANCA: TFloatField;
    qryTemplateMODELOCARTA: TStringField;
    qryTemplateIDREPORTS: TFloatField;
    qryTemplateORIGEMCM: TFloatField;
    qryTemplateFLGTIPOCARTA: TStringField;
    edtWord: TEdit;
    Label8: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    dlgWord: TOpenDialog;
    updSql: TUpdateSQL;
    Extenso: TExtensoCM;
    qrySqlENDERECO: TStringField;
    ChkVisualiza: TCheckBox;
    Panel1: TPanel;
    Label3: TLabel;
    edtNumContrato: TEdit;
    Label4: TLabel;
    edtNomeContrato: TEdit;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    GroupBox3: TGroupBox;
    molContrato1: TmolContrato;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    lblMesVencimento: TLabel;
    Label9: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    qrySqlCABECALHO: TStringField;

    // procedimentos para imprimir pelo word
    procedure ImprimeWordDetalhe(WinWord: TWord);
    procedure ImprimeWordQuery(WinWord: TWord);
    procedure ImprimeWord;

    // procedimento para criação/escrita de arquivo txt p/Mala Direta
    procedure CriaTxt;

    // procedimentos definidos
    function VerificaPreenchimento: boolean;
    procedure FechaQueries; override;

    // outros procedimentos
    procedure qrySqlCalcFields(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtWordChange(Sender: TObject);
    procedure edtDataIniCloseUp(Sender: TObject);
    procedure edtDataFimCloseUp(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure DBcboModeloCartaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);


  private { Private declarations }
   sCharCompleta     : char;

  public { Public declarations }

  end;


var
  cfgRelCartaReajuste: TcfgRelCartaReajuste;


implementation
{$R *.DFM}
uses
   uDataBase, uSistema, uMensErro, uModeloRelatCM, uDiasInUteis, UComunsImobiliario, uVerificaPreenchimento,
   uFuncoesImob, dLookImobiliario, DMS; 



// procedimentos para imprimir pelo word
procedure TcfgRelCartaReajuste.ImprimeWordDetalhe(WinWord: TWord);
var
   sValorExtenso: string;
begin
   WinWord.Abre(edtWord.Text);

   if not(chkVisualiza.Checked) then begin
      WinWord.Imprime;
      WinWord.Fecha;
   end;
end;



procedure TcfgRelCartaReajuste.ImprimeWordQuery(WinWord: TWord);
begin
   qrySql.First;
   while not qrySql.EOF do begin
      ImprimeWordDetalhe(WinWord);
      qrySql.Next;
   end;
end;



procedure TcfgRelCartaReajuste.ImprimeWord;
var
   WinWord: TWord;
begin
   WinWord := TWord.Create;

   try
      CriaTxt;

      if not(chkVisualiza.Checked) then begin
         WinWord.Application.Visible := False;
      end else begin
         WinWord.Application.Visible := True;
      end;

      ImprimeWordQuery(WinWord);

   finally
      If not chkVisualiza.Checked then WinWord.Free;
   end;
end;



function TcfgRelCartaReajuste.VerificaPreenchimento: boolean;
begin
	Result := False;

  try
     if (DBcboModeloCarta.LookupValue = '') then
        raise EValidacao.CreateVal('É necessário indicar o Modelo de Carta de Reajuste!', DBcboModeloCarta);

     if (edtDataIni.Text <> '') and (edtDataFim.Text = '') then
        raise EValidacao.CreateVal('Para filtro por período de vencimento é necessário' + #13 +
                                     'informar data inicial e data final!', edtDataFim);

     if (edtDataFim.Text <> '') and (edtDataIni.Text = '') then
        raise EValidacao.CreateVal('Para filtro por período de vencimento é necessário' + #13 +
                                     'informar data inicial e data final!', edtDataIni);

     if (edtDataFim.Date < edtDataIni.Date) then
        raise EValidacao.CreateVal('A data inicial está maior que a data final!', edtDataIni);

     if (cboMes.Text <> '') and (dbSpnAno.Text = '') then
        raise EValidacao.CreateVal('Informe o ANO do reajuste!', edtDataIni);

     if (cboMes.Text = '') and (dbSpnAno.Text <> '') then
        raise EValidacao.CreateVal('Informe o MÊS do reajuste!', edtDataIni);

  except

     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;

  end;

  Result := True;
end;



procedure TcfgRelCartaReajuste.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;
end;



procedure TcfgRelCartaReajuste.qrySqlCalcFields(DataSet: TDataSet);
var
   sContratoExtenso: string;
   sValExtenso, sValExtensoTot : string;
   sCompleta, sCompletaTot: string;
   dDataReajuste : TDateTime;
   iDia, iMes, IAno : Word;

begin
   inherited;

   Extenso.Valor  := qrySqlVLR_ATUAL_CONTRATO.AsFloat;
   Extenso.Escreve;
   sValExtenso    := '( ' + Extenso.Extenso + ' )';
   sCompleta      := sValExtenso + StringOfChar(sCharCompleta,165-length(sValExtenso));

   Extenso.Valor  := qrySqlVLR_TOTAL.AsFloat;
   Extenso.Escreve;
   sValExtensoTot := '( ' + Extenso.Extenso + ' )';
   sCompletaTot   := sValExtensoTot + StringOfChar(sCharCompleta,165-length(sValExtensoTot));

   dDataReajuste := qrySqlCONDATAREAJUSTE.asDateTime;
   DecodeDate(dDataReajuste,iAno,iMes,Idia);

   qrySqlDATA_ATUAL.asString        := FormatDateTime('dd "de" mmmm "de" yyyy', Date);
   qrySqlMES_REAJUSTE.asString      := vNomeMes[iMes] + '/' + FormatFloat('0000', iAno);
   qrySqlValorExtenso.asString      := sCompleta;
   qrySqlValorExtensoTot.asString   := sCompletaTot;
end;



procedure TcfgRelCartaReajuste.bbtnConfirmarClick(Sender: TObject);
var
   iContador, iDiasMes                 : integer;
   iDiasAnterior, iDiasPosterior       : integer;
   iIndiceReajuste, iPeridodoReajuste  : integer;
   iAno, iMes, iDia                    : Word;

   fFatorCalculado, fFatorAcumulado    : double;
   dDataReajuste, dDataUltReajuste     : TDateTime;
   dDataMenosHum                       : TDateTime;

   sMensagem : string;
begin
   if VerificaPreenchimento then begin

      qryReports.Close;
      qryReports.ParamByName('PIDREPORTS').asInteger  := qryTemplate.FieldByName('IDREPORTS').asInteger;
      qryReports.ParamByName('PORIGEMCM').asInteger   := qryTemplate.FieldByName('ORIGEMCM').asInteger;
      qryReports.Open;

      memReports.Lines.Clear;
      memReports.Lines.Text := qryReports.FieldByName('TEMPLATE').asString;
      memReports.Lines.SaveToFile(Sistema.TempDir + ArqCMCartaReaj);

      // acha e troca as referências ao pipeline antigo
      ModeloRelatCM.SetaDataPipeline('cfgRelCartaReajuste', 'pplConsulta', 'frmDesenhoRelCartaReajuste', 'ppConsulta', memReports);

      // salva em disco o arquivo com as alteracões
      memReports.Lines.SaveToFile(Sistema.TempDir + ArqCMCartaReaj);

      // carrega o template e imprime o relatório
      rptImprime.Template.FileName := Sistema.TempDir + ArqCMCartaReaj;
      rptImprime.Template.LoadFromFile;

      ModeloRelatCM.SetaDadosRpt(rptImprime, pplConsulta, ArqCMCartaReaj);

      sCharCompleta  := edtCharCompleta.Text[1];

      with qrySql do begin
         LimpaParametros(qrySql);

         // Modificações ref. a inclusão de Período para Filtro  - Marcio Motta - 06/02/2004 - Pendência: 16033
         if (cboMes.Text <> '') then
           begin
             ParamByName('DATAINI').asDateTime   := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 01);
             ParamByName('DATAFIM').asDateTime   := DiasInUteis.UltDiaMes(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1));
           end
         else
           if (edtDataini.Text <> '') and (edtDataFim.Text <> '') then
             begin
               ParamByName('DATAINI').asDateTime := edtDataIni.Date;
               ParamByName('DATAFIM').asDateTime := edtDataFim.Date;
             end;

         ParamByName('CONTRATO').asInteger   := molContrato1.iContrato;

         if molContrato1.iContrato = -1 then
            ParamByName('CONTRATO').Clear;

         Open;
      end;

      // 26/04/2004 - Marcio Motta - Pendência: 16033
      if DBSpnAno.Text <> '' then begin
        iAno := Word(Trunc(DBspnAno.Value));
        iMes := cboMes.ItemIndex + 1
      end else
        DecodeDate(edtDataIni.DateTime,iAno,iMes,iDia);
      // Fim - Marcio Motta

      // verifica se há Contratos com reajuste no mês escolhido
      if qrySql.isEmpty then begin
         qrySql.Close;

         sMensagem   := 'Não houve Contratos reajustados em ' +
                        vNomeMes[(iMes)] + '/' + FormatFloat('0000', iAno) + '.';

         MsgDlg(sMensagem, 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      end;

      iContador := word(trunc(edtIncremental.Value));

      qrySql.First;
      while not(qrySql.EOF) do begin

         qrySql.Edit;

         dDataReajuste     := qrySqlCONDATAREAJUSTE.asDateTime;

         // 26/04/2004 - Marcio Motta - Pendência: 16033
         if DBSpnAno.Text <> '' then begin
           iAno := Word(Trunc(DBspnAno.Value));
           iMes := cboMes.ItemIndex + 1
         end else
           DecodeDate(dDataReajuste,iAno,iMes,iDia);
         // Fim - Marcio Motta

         iDiasMes          := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(word(trunc(iAno)), (iMes)));
         iDiasAnterior     := DiasInUteis.ExtraiDia(dDataReajuste) - 1;
         iDiasPosterior    := iDiasMes - iDiasAnterior;

         qrySqlDIAS_MES.AsInteger           :=  iDiasMes;
         qrySqlDIAS_VLR_ANTERIOR.AsInteger  :=  iDiasAnterior;
         qrySqlDIAS_VLR_POSTERIOR.AsInteger :=  iDiasPosterior;

         qrySqlVLR_DIAS_ANTERIOR.asFloat    := qrySqlVLR_ANT_CONTRATO.asFloat / iDiasMes * iDiasAnterior;
         qrySqlVLR_DIAS_POSTERIOR.asFloat   := qrySqlVLR_ATUAL_CONTRATO.asFloat / iDiasMes * iDiasPosterior;
         qrySqlVLR_TOTAL.asFloat            := qrySqlVLR_DIAS_ANTERIOR.asFloat + qrySqlVLR_DIAS_POSTERIOR.asFloat;

         iIndiceReajuste   := qrySqlCONINDICEREAJUSTE.AsInteger;
         iPeridodoReajuste := qrySqlCONPERREAJUSTE.AsInteger;

         dDataUltReajuste  := DiasInUteis.SomaMeses(dDataReajuste, (-1) * iPeridodoReajuste);
         dDataMenosHum     := DiasInUteis.SomaMeses(dDataReajuste, (-1));

         qrySqlMES_REAJUSTE.asString          := vNomeMes[(iMes)] + '/' + FormatFloat('0000', iAno);

         qrySqlMES_ULT_REAJUSTE.asString      := vNomeMes[DiasInUteis.ExtraiMes(dDataUltReajuste)] + '/' +
                                                 IntToStr(DiasInUteis.ExtraiAno(dDataUltReajuste));

         qrySqlMES_REAJUSTE_MENOS_UM.asString := vNomeMes[DiasInUteis.ExtraiMes(dDataMenosHum)] + '/' +
                                                 IntToStr(DiasInUteis.ExtraiAno(dDataMenosHum));

         // "calcula" o percentual de reajuste pelos 2 métodos
         // 27/04/2004 - Marcio Motta - Pendência 16033
         if qrySqlVLR_ANT_CONTRATO.asFloat <> 0 then
           fFatorCalculado   := ((qrySqlVLR_ATUAL_CONTRATO.asFloat / qrySqlVLR_ANT_CONTRATO.asFloat) - 1) * 100
         else
           fFatorCalculado := 1; // (Fator 1 = Não houve alteração)
         // Fim Marcio Motta
         fFatorAcumulado   := FuncoesImob.CalculaFatorCorrecao(iIndiceReajuste, dDataUltReajuste, dDataMenosHum, False);

         qrySqlPERCENT_REAJUSTE_CALCULADO.asFloat  := fFatorCalculado;
         qrySqlPERCENT_REAJUSTE_ACUMULADO.asFloat  := fFatorAcumulado;

         qrySqlCABECALHO.AsString               := edtPrimeiraParte.Text + IntToStr(iContador) + edtTerceiraParte.Text;

         // Anula o valor de qrySqlCABECALHO.AsString
         if qrySqlCABECALHO.AsString = '0' then qrySqlCABECALHO.AsString := '';
         qrySql.Post;

         inc(iContador);
         qrySql.Next;
      end;

      DesabilitaBotoes;

      if edtWord.Text <> '' then begin
         ImprimeWord;
      end else begin
         // mostra o relatório
         rptImprime.Device := dvScreen;
         rptImprime.Print;
      end;
      HabilitaBotoes;
   end;
end;



procedure TcfgRelCartaReajuste.FormCreate(Sender: TObject);
begin
   inherited;
   //Henrique Massão
   dlgWord.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   // Inicializa os Frames (MOL)
   molContrato1.btnLimpaContratoClick(Self);

   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;



procedure TcfgRelCartaReajuste.FormShow(Sender: TObject);
begin
   inherited;

   qryTemplate.Open;
   qryTemplate.First;

   DBcboModeloCarta.LookupValue := IntToStr(qryTemplate.FieldByName('IDCARTACOBRANCA').AsInteger);

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);
end;



procedure TcfgRelCartaReajuste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DeleteFile('Dados.txt');
   Release;
end;

procedure TcfgRelCartaReajuste.BitBtn1Click(Sender: TObject);
begin
   inherited;
   if dlgWord.Execute then begin
      edtWord.Text := dlgWord.FileName;

      // Se escolhido um modelo de documento WORD para a impressão do recibo, limpa o modelo
      // de relatório - Marcio Motta - 06/02/2004 - Pendência: 16033
      if dbCboModeloCarta.Text <> '' then
         dbCboModeloCarta.Clear;
   end;

end;



procedure TcfgRelCartaReajuste.edtWordChange(Sender: TObject);
begin
  inherited;
  chkVisualiza.Enabled := edtWord.Text <> '';
end;



procedure TcfgRelCartaReajuste.CriaTxt;
var
   ArqDadosCarta : TextFile;
begin
   AssignFile(ArqDadosCarta, 'Dados.doc');
   ReWrite(ArqDadosCarta);

   // Escreve cabeçalho da origem de dados separando os dados por TAB
   Write(ArqDadosCarta, 'RazaoSocial' + #09);
   Write(ArqDadosCarta, 'Responsavel' + #09);
   Write(ArqDadosCarta, 'Data' + #09);
   Write(ArqDadosCarta, 'Numero' + #09);
   Write(ArqDadosCarta, 'Valor' + #09);
   Write(ArqDadosCarta, 'Mes' + #09);
   Write(ArqDadosCarta, 'ValorReaj' + #09);
   Write(ArqDadosCarta, 'Indice' + #09);
   Write(ArqDadosCarta, 'Data1' + #09);
   Write(ArqDadosCarta, 'Data2' + #09);
   Write(ArqDadosCarta, 'PercentCalc' + #09);
   Write(ArqDadosCarta, 'PercentAcum' + #09);
   Write(ArqDadosCarta, 'DiAnt' + #09);
   Write(ArqDadosCarta, 'Valor1' + #09);
   Write(ArqDadosCarta, 'DiPos' + #09);
   Write(ArqDadosCarta, 'Valor2' + #09);
   Write(ArqDadosCarta, 'ValorTotal' + #09);
   Write(ArqDadosCarta, 'Cabec' + #09);
   Write(ArqDadosCarta, 'Ender' + #09);
   Write(ArqDadosCarta, 'DiaMes' + #09);

   // Insere na linha de baixo
   WriteLn(ArqDadosCarta, 'Extenso');


   // Escreve linha do detalhe
   qrySql.First;
   while not qrySql.EOF do begin
      Write(ArqDadosCarta, qrySqlRS_LOCATARIO.AsString + #09);
      Write(ArqDadosCarta, qrySqlNOME_CONTATO.AsString + #09);
      Write(ArqDadosCarta, qrySqlCONDATAREAJUSTE.AsString + #09);
      Write(ArqDadosCarta, qrySqlNUMERO_CONTRATO.AsString + #09);
      Write(ArqDadosCarta, FormatFloat('#,##0.00', qrySqlVLR_ANT_CONTRATO.AsFloat) + #09);
      Write(ArqDadosCarta, qrySqlMES_REAJUSTE.AsString + #09);
      Write(ArqDadosCarta, FormatFloat('#,##0.00',qrySqlVLR_ATUAL_CONTRATO.AsFloat) + #09);
      Write(ArqDadosCarta, qrySqlINDICE_REAJUSTE.AsString + #09);
      Write(ArqDadosCarta, qrySqlMES_ULT_REAJUSTE.AsString + #09);
      Write(ArqDadosCarta, qrySqlMES_REAJUSTE_MENOS_UM.AsString + #09);
      Write(ArqDadosCarta, FormatFloat('0.00',qrySqlPERCENT_REAJUSTE_CALCULADO.AsFloat) + #09);
      Write(ArqDadosCarta, FormatFloat('0.00',((qrySqlPERCENT_REAJUSTE_ACUMULADO.AsFloat-1)*100)) + #09);
      Write(ArqDadosCarta, qrySqlDIAS_VLR_ANTERIOR.AsString + #09);
      Write(ArqDadosCarta, FormatFloat('#,##0.00',qrySqlVLR_DIAS_ANTERIOR.AsCurrency) + #09);
      Write(ArqDadosCarta, qrySqlDIAS_VLR_POSTERIOR.AsString + #09);
      Write(ArqDadosCarta, FormatFloat('#,##0.00',qrySqlVLR_DIAS_POSTERIOR.AsCurrency) + #09);
      Write(ArqDadosCarta, FormatFloat('#,##0.00',qrySqlVLR_TOTAL.AsCurrency) + #09);
      Write(ArqDadosCarta, qrySqlCABECALHO.AsString + #09);
      Write(ArqDadosCarta, qrySqlENDERECO.AsString + #09);
      Write(ArqDadosCarta, qrySqlDIAS_MES.AsString + #09);

      Extenso.Valor := qrySqlVLR_ATUAL_CONTRATO.AsFloat;
      Extenso.Escreve;

      WriteLn(ArqDadosCarta,Extenso.Extenso);
      qrySql.Next;
   end;

   CloseFile(ArqDadosCarta);
end;



procedure TcfgRelCartaReajuste.edtDataIniCloseUp(Sender: TObject);
begin
  inherited;
  // Se existir data de início, apaga mês e ano de competência
  // Marcio Motta - 06/02/2004 - Pendência: 16033
  if edtDataIni.Text <> '' then begin
     cboMes.ItemIndex := -1;
     dbSpnAno.Clear;
  end;
end;

procedure TcfgRelCartaReajuste.edtDataFimCloseUp(Sender: TObject);
begin
  inherited;
  // Se existir data de fim, apaga mês e ano de competência
  // Marcio Motta - 06/02/2004 - Pendência: 16033
  if edtDataFim.Text <> '' then begin
     cboMes.ItemIndex := -1;
     dbSpnAno.Clear;
  end;
end;

procedure TcfgRelCartaReajuste.cboMesChange(Sender: TObject);
begin
  inherited;
   // Se mês competência for selecionada, desmarca Ignorar competência e limpa as datas do período de vencimento
   // Marcio Motta - 06/02/2004 - Pendência: 16033
   if cboMes.Text <> '' then begin
      edtDataIni.Clear;
      edtDataFim.Clear;
   end;
end;

procedure TcfgRelCartaReajuste.DBcboModeloCartaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // Se for selecionado um modelo de relatório, apaga conteúdo ref. ao modelo de arquivo WORD
  // e a opção de visualização - Marcio Motta - 06/02/2004 - Pendência: 16033
   if Trim(DbCboModeloCarta.Text) <> '' then begin
      edtWord.Clear;
      chkVisualiza.Checked := False;
   end;

end;

end.
