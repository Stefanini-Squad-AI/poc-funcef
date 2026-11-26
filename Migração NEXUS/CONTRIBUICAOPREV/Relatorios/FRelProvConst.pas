{-------------------------------------------------------------------------------
SIG........: 127397    
Resp.......: Leandro Pocebon
Data.......: 19/04/2023
Descrição..: Relatório de Evolução da Provisão Matemática a Constituir em Excel.
--------------------------------------------------------------------------------
SIG........: 84982
Resp.......: Everson Cunha
Data.......: 04/11/2021
Descrição..: Ajustes no sql da GetSQLImpressao conforme pedido da
             analista Roberta Neder
--------------------------------------------------------------------------------
Pendência   : SOL 253577/17989  PPM 1198155
Responsável : Darivaldo Alencar
Data        : 08/04/2016
Descrição   : Criacao deste form(FRelProvConst) para emissao de relatorio
-------------------------------------------------------------------------------}

unit FRelProvConst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  FileCtrl, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uMensErro, Db, DBTables, Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  fAguarde, QExport3, QExport3PDF, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ComObj, ppBands, ppCache, ppDB, ppDBPipe, ppDBBDE, ppPrnabl, ppCtrls, ppStrtch,
  ppMemo, QExport3Dialog,USistema, ppVar,ShellAPI;

type
  TPosicaoRelt = (tpPDF, tpEXCEL);    

  TRelProvConst = class(TfrmOkCancelar)
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    dtDataInicio: TCMDateTimePicker;
    LabPatrocinadoras: TLabel;
    Label1: TLabel;
    dtDataFim: TCMDateTimePicker;
    ComboPlanoPrevidenciario: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    ComboReserva: TComboBox;
    bbtnProcurar: TBitBtn;
    qryRel: TwwQuery;
    dsRel: TwwDataSource;
    dbgrdResultado: TwwDBGrid;
    Toolbar971: TToolbar97;
    ToolbarSep973: TToolbarSep97;
    btGerarPDF: TBitBtn;
    btGerarEXCEL: TmaHelpBitBtn;
    ppRep: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    pplRel: TppBDEPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLabel37: TppLabel;
    ppLabel41: TppLabel;
    ppImage2: TppImage;
    lbl_Titulo: TppLabel;
    LabTituloDataInicial: TppLabel;
    LabTituloDataFinal: TppLabel;
    LabTituloPlano: TppLabel;
    LabTituloReserva: TppLabel;
    LinhaSuperiorHeader: TppLine;
    LinhaHeaderEsquerda: TppLine;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppLabel10: TppLabel;
    ppLine4: TppLine;
    ppLabel11: TppLabel;
    ppLine5: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    LabDataInicial: TppLabel;
    LabDataFinal: TppLabel;
    DBPlano: TppDBText;
    DBReserva: TppDBText;
    ppLabel1: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    LabQt: TppLabel;
    LabValor: TppLabel;
    qe3dPadrao: TQExport3Dialog;
    qryRelNOMEPLANO: TStringField;
    qryRelVLRPROVCONSTITUIR: TFloatField;
    qryRelDATAREFERENCIA: TDateTimeField;
    qryRelQTPROVCONSTITUIR: TFloatField;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine19: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText5: TppDBText;
    ppLine20: TppLine;
    ppLine21: TppLine;
    qryRelMOVIMENTACAO: TStringField;
    qryRelVALORINDICE: TFloatField;
    qryRelOBSERVACAO: TStringField;
    qryRelSALDOREAL: TFloatField;
    qryRelINDICEREAJUSTE: TFloatField;
    qryRelNOME_RESERVA: TStringField;
    ppDBText6: TppDBText;
    lblReserva2: TppLabel;
    dbReserva2: TppDBText;
    BtnGerarProvisao: TmaHelpBitBtn;
    procedure ComboPlanoPrevidenciarioChange(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryRelAfterClose(DataSet: TDataSet);
    procedure dtDataInicioChange(Sender: TObject);
    procedure dtDataFimChange(Sender: TObject);
    procedure btGerarPDFClick(Sender: TObject);
    procedure PosicionaTopELeft(lab1: TppLabel; dTop: Double; lab2: TObject = Nil; boolPrimeiraColuna: Boolean = True);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure qryRelAfterOpen(DataSet: TDataSet);
    procedure btGerarEXCELClick(Sender: TObject);
    procedure ppGroupFooterBand1BeforeGenerate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnGerarProvisaoClick(Sender: TObject);
  private
    ExcelApp: Variant;
    Sheet: Variant;
    FTemDataIniFim: Boolean;
    FTemDataFim: Boolean;
    FTemReserva: Boolean;
    dTotalQtCotas: Double;
    dTotalVlrProv: Double;
    arIdPlanoPrev: array of Integer;
    arIdTipoReserva: array of Integer;
    dTotalPorReserva: double;
    sMsg: array [1..2] of string;
    qry: TwwQuery;
    qryFiltro: TwwQuery;
    qryProvReservas: TwwQuery;
    qryCabecalho: TwwQuery;
    procedure VerificaIndiceCotacao;
    function RetornaIDHISTRESERVA( ):string;
    function GetSQLDoCombo(nomeDoCombo: string): string;
    function ValidaFaixaDeDatas(sDataInicial, sDataFinal: string): Boolean;
    function LerStrings(strStringRead: string; intPosicao: Integer): string;
    function GetSQLImpressao(bTemDataInicialFinal, btemReserva: Boolean; sIdReserva: String = ''): string;
    function iif(bCondicao: Boolean; SeVerdadeiro, SeFalso: Variant): Variant;
    function ValidaDadosDoCombo(oCombo: TComboBox): Boolean;
    function MontaNomeDoArquivo(sComExtencao: string): string;
    procedure CarregaCombo(oCombo: TObject);
    procedure AtualizaIndice(oNomeDoCombo: string; intValor: Integer);
    procedure LimpaIndice(oNomeDoCombo: string);
    procedure PersonalizaGrid(oGrid: TwwDBGrid);
    procedure PosicionaCabecalho(tipoDeRelatorio: TPosicaoRelt);
    procedure MontaArquivoExcel();
    procedure prepara_form;
    function GetTotalReserva(RESERVA: String; tipo: byte): Double;
    function GetQryFiltro: TwwQuery;
    procedure MontaArquivoExcelProvisao(sTipoReservas, DataInicial, sDataFinal:string); // leandro sig127397
    procedure GetDadosReservaProvisao(qQuery:TwwQuery; iIDTIPORESERVA:integer; iIDTIPORESERVA2:integer; sDataIni:string);  // leandro sig127397

    { Private declarations }
  public
    { Public declarations }
  published
    property TemDataIniFim: Boolean read FTemDataIniFim;
    property TemReserva: Boolean read FTemReserva;
  end;

var
  RelProvConst: TRelProvConst;

implementation

{$R *.DFM}

function TRelProvConst.iif(bCondicao: Boolean; SeVerdadeiro, SeFalso: Variant): Variant;
begin
  if bCondicao then
    Result := SeVerdadeiro
  else
    Result := SeFalso;
end;

function TRelProvConst.LerStrings(strStringRead: string; intPosicao: Integer): string;
var
  slLoadString: TStringList;
begin
  slLoadString := TStringList.Create;
  slLoadString.CommaText := strStringRead;

  if intPosicao > slLoadString.Count - 1 then
    Result := ''
  else
    Result := slLoadString[intPosicao];

  FreeAndNil(slLoadString);
end;

function TRelProvConst.GetSQLDoCombo(nomeDoCombo: string): string;
var
  intIdPlanPrev: Integer;
begin
  if nomeDoCombo = 'ComboPlanoPrevidenciario' then
    Result := 'SELECT P1.IDPLANOPREV, P1.NOME FROM PLANPREV P1 WHERE P1.IDPLANOPREV IN (2, 66, 74) ORDER BY P1.NOME';
   (**   Result :=  ' SELECT P2.IDPLANOPREV, P2.NOME FROM PLANPREV P1, PLANPREVCONTABIL P2 '
                +' WHERE P1.IDPLANOPREV = P2.IDPLANOPREVPREV AND   P1.IDPLANOPREV IN (2, 66, 74) AND   P2.ATIVO = ''S'''
                +' ORDER BY P2.NOME';*)

 if nomeDoCombo = 'ComboReserva' then
  begin
    intIdPlanPrev := arIdPlanoPrev[ComboPlanoPrevidenciario.ItemIndex];
    Result := ' SELECT RXP.IDTIPORESERVA, RXP.NOME FROM RESERVAXPLANO RXP WHERE IDPLANOPREV = ' + IntToStr(intIdPlanPrev) + ' AND (ANALITICOSINTETI=''A'') AND (FLGDEFICIT = 1) AND (FLGCOLETIVA = 1) ORDER BY RXP.NOME ';
  end;
end;

procedure TRelProvConst.CarregaCombo(oCombo: TObject);
var
  aQry: TwwQuery;
  iCount: Integer;
const
  Colors: array[Boolean] of TColor = (clScrollBar, clWhite);
begin
  if oCombo.ClassType = TComboBox then
    if Assigned(oCombo) then
    begin
      try
        aQry := TwwQuery.Create(Self);
        aQry.DatabaseName := 'BaseDados';
        aQry.SQL.Clear;
        aQry.SQL.Add(GetSQLDoCombo(TComboBox(oCombo).Name));
        aQry.Open;
        LimpaIndice(TComboBox(oCombo).Name);
        TComboBox(oCombo).Items.Clear;
        while not aQry.Eof do
        begin
          TComboBox(oCombo).Items.Add(aQry.Fields[1].AsString);
          AtualizaIndice(TComboBox(oCombo).Name, aQry.Fields[0].AsInteger);
          aQry.Next;
        end;

        TComboBox(oCombo).Enabled := TComboBox(oCombo).Items.Count > 0;
        TComboBox(oCombo).Color := Colors[TComboBox(oCombo).Enabled];
        if TComboBox(oCombo).Items.Count > 0 then
          TComboBox(oCombo).ItemIndex := 0;

        if TComboBox(oCombo).Name = 'ComboPlanoPrevidenciario' then
         CarregaCombo(ComboReserva);
        aQry.Close;
      finally
        if Assigned(aQry) then
          FreeAndNil(aQry);
      end;
    end;
end;

procedure TRelProvConst.AtualizaIndice(oNomeDoCombo: string; intValor: Integer);
begin
  if oNomeDoCombo = 'ComboPlanoPrevidenciario' then
  begin
    SetLength(arIdPlanoPrev, Length(arIdPlanoPrev) + 1);
    arIdPlanoPrev[Length(arIdPlanoPrev) - 1] := intValor;
  end;
  if oNomeDoCombo = 'ComboReserva' then
  begin
    SetLength(arIdTipoReserva, Length(arIdTipoReserva) + 1);
    arIdTipoReserva[Length(arIdTipoReserva) - 1] := intValor;
  end;
end;

procedure TRelProvConst.LimpaIndice(oNomeDoCombo: string);
begin
  if oNomeDoCombo = 'ComboPlanoPrevidenciario' then
    Finalize(arIdPlanoPrev);
  if oNomeDoCombo = 'ComboReserva' then
    Finalize(arIdTipoReserva);
end;

function TRelProvConst.ValidaDadosDoCombo(oCombo: TComboBox): Boolean;
var
  bResult: Boolean;
begin
  bResult := True;
  if oCombo.Name = 'ComboReserva' then
    FTemReserva := iif(Length(Trim(ComboReserva.Text)) > 0, True, False);

  if Length(Trim(oCombo.Text)) = 0 then
  begin
    bResult := False;
    if oCombo.Name = 'ComboPlanoPrevidenciario' then
      MsgDlg('É necessário selecionar o plano previdenciário.', 'Atenção', mtError, [mbOk], 0)
    else
    begin
      if MsgDlg('Deseja continuar a opção? ', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        bResult := True;
    end;
  end;
  Result := bResult;
end;

function TRelProvConst.ValidaFaixaDeDatas(sDataInicial, sDataFinal: string): Boolean;
var
  bResult: Boolean;
  bGravouMensagem: Boolean;
  sMensagem: string;
  bInfDtIni: Boolean;
  bInfDtFim: Boolean;
  dtTeste: array of TDate;

  function DatasInformadas(sData: string): Boolean;
  var
    bData: Boolean;
    aData: TDate;
  begin
    try
      { é feito  o teste }
      aData := StrToDate(sData);
      {se passar ajusta o tamanho do array, dtInicio = 0, dtFim = 1 }
      SetLength(dtTeste, Length(dtTeste) + 1);
      { Grava a data sempre na última posição }
      dtTeste[Length(dtTeste) - 1] := aData;
      bData := True;
    except
      bData := False;
    end;
    Result := bData;
  end;

begin
  sMensagem := '';
  bGravouMensagem := False;
  FTemDataIniFim := False;

  { Verifica se a Data Inicial foi informada }
  bInfDtIni := DatasInformadas(sDataInicial);
  { Verifica se a Data Final foi informada }
  bInfDtFim := DatasInformadas(sDataFinal);

  {se não houver datas, ok}
  if (not bInfDtIni) and (not bInfDtFim) then
    bResult := True
  else
  begin
    { pelo menos uma data foi informada, é feito o teste para ver se as duas foram informadas }
    if (not bInfDtIni) or (not bInfDtFim) then
    begin
      bGravouMensagem := True;
      if not bInfDtIni then
        sMensagem := 'É necessário informar a data início.'
      else
        sMensagem := 'É necessário informar a data final.';
    end
    else
      FTemDataIniFim := True;

    {ok, agora é feito outro teste para verificar se a Data inicial é menor que a final, ambas gravadas no array }
    if (not bGravouMensagem) and (dtTeste[1] < dtTeste[0]) then
      sMensagem := 'A data final deverá ser maior ou igual a data início.'

  end;

  if Length(Trim(sMensagem)) > 0 then
  begin
    FTemDataIniFim := False;
    bResult := False;
    MsgDlg(sMensagem, 'Atenção', mtError, [mbOk], 0);
  end
  else
    bResult := True;

  { libera o Array }
  if Length(dtTeste) > 0 then
    Finalize(dtTeste);

  Result := bResult;
end;

procedure TRelProvConst.prepara_form;
begin
  CarregaCombo(ComboPlanoPrevidenciario);
  ComboReserva.ItemIndex:= -1;
  dtDataInicio.Date := Date;
  dtDataFim.Date := Date;
  qryRel.Close;
  sMsg[1]:= 'Atenção';
  sMsg[2]:= 'Não existe índice cadastrado para o período informado.';
end;

procedure TRelProvConst.ComboPlanoPrevidenciarioChange(Sender: TObject);
begin
  inherited;
  if qryRel.Active then
    qryRel.Close;
  if ComboPlanoPrevidenciario.Items.Count > 0 then
    begin
        CarregaCombo(ComboReserva);
        ComboReserva.ItemIndex:= -1;

        // Leandro - SIG127397 - Inicio
        if arIdPlanoPrev[ComboPlanoPrevidenciario.ItemIndex] = 2 then
          BtnGerarProvisao.Visible := true
        else
          BtnGerarProvisao.Visible := false;
        // Leandro - SIG127397 - Fim
    end;
end;

procedure TRelProvConst.VerificaIndiceCotacao;
var
  indice: string;
  sIdPlano: string;
begin
  indice:= qryRel.FieldbyName('INDICEREAJUSTE').AsString;
  sIdPlano:= IntToStr(arIdPlanoPrev[ComboPlanoPrevidenciario.ItemIndex]);
  if  (indice ='') then
      indice := '0';

  with qry do
   begin
     close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(1) as qtde FROM HISTMOVRESERVA H INNER JOIN RESERVAXPLANO R ');
     SQL.Add(' ON H.IDPLANOPREV= R.IDPLANOPREV  AND H.IDTIPORESERVA = R.IDTIPORESERVA AND R.FLGDEFICIT = 1 ');
     SQL.Add(' AND H.IDPLANOPREV = ' + sIdPlano);
     Open;
   end;

  if (qry.FieldByName('qtde').AsInteger = 0) then
     begin
       MsgDlg('Não Existe Movimentações Para o Plano: '+ ComboPlanoPrevidenciario.Text,'Atenção', mtWarning,[mbOk],0);
       exit;
     end;

   with qry do
    begin
      close;
      SQL.Clear;
      SQL.Add('select count(1) as qtde from COTACAOMOEDA where IDCOTACAOMOEDA = ' + indice);
      Open;
    end;

   if (qry.FieldByName('qtde').AsInteger = 0) then
     begin
       MsgDlg(sMsg[2],sMsg[1], mtWarning,[mbOk],0);
       exit;
     end;
end;

procedure TRelProvConst.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  dTotalQtCotas := 0;
  dTotalVlrProv := 0;

  qry:= TwwQuery.Create(nil);
  qry.DatabaseName:= 'BaseDados';
  if ValidaFaixaDeDatas(dtDataInicio.Text, dtDataFim.Text)
     and ValidaDadosDoCombo(ComboPlanoPrevidenciario)
     and ValidaDadosDoCombo(ComboReserva) then
  begin
      qryRel.Close;
      qryRel.SQL.Clear;
      qryRel.Params.Clear;
      qryRel.Sql.Add(GetSQLImpressao(TemDataIniFim, TemReserva));
      qryRel.Open;

  while not (qryRel.Eof) do
    begin
      if (qryRel.FieldbyName('INDICEREAJUSTE').AsString ='') then
         begin
           MsgDlg(sMsg[2],sMsg[1], mtWarning,[mbOk],0);
           bbtnCancelar.Click;
           exit;
         end;

      VerificaIndiceCotacao;

      qryRel.Next;
    end;

  if qryRel.IsEmpty then
    begin
      VerificaIndiceCotacao;
      qryRel.Close;
      qryRel.SQL.Clear;
      qryRel.Params.Clear;
      qryRel.Sql.Add(GetSQLImpressao(TemDataIniFim, TemReserva,'vazio'));
      qryRel.Open;
    end;

   sMsg[1]:= '';
   FreeAndNil(qry);
   PersonalizaGrid(dbgrdResultado);
 end;//valida as datas
end;

function TRelProvConst.RetornaIDHISTRESERVA():string;
var
   iIdPlano: Integer;
   iReserva: Integer;
   sReserva: String;
begin
   sReserva:= '';
   iIdPlano := arIdPlanoPrev[ComboPlanoPrevidenciario.ItemIndex];

   if  (ComboReserva.ItemIndex > -1) and (ComboReserva.Text<>'') then
      begin
       iReserva := arIdTipoReserva[ComboReserva.ItemIndex];
       sReserva:= 'AND H.IDTIPORESERVA = ' + IntToStr(iReserva);
      end;

      sReserva:=' (SELECT IDHISTRESERVA FROM( '
       + ' (SELECT MAX(H.IDHISTRESERVA) AS IDHISTRESERVA,H.IDTIPORESERVA  FROM HISTMOVRESERVA H '
       + ' RIGHT JOIN RESERVAXPLANO R ON  R.IDPLANOPREV = H.IDPLANOPREV AND R.IDTIPORESERVA = H.IDTIPORESERVA AND R.FLGDEFICIT = 1 '
       + ' AND R.IDPLANOPREV = ' + IntToStr(iIdPlano)
       + ' '+sReserva+' '
       + '  WHERE  H.IDTIPORESERVA IS NOT NULL '
       + '  GROUP BY(H.IDTIPORESERVA)))) ';
   result:= sReserva;
end;


function TRelProvConst.GetSQLImpressao(bTemDataInicialFinal, btemReserva: Boolean; sIdReserva: String = ''): string;
var
  sSQLPeriodo: string;
  sSQLReserva: string;
  sPlano: string;
  sSQLIdPlanPrev: string;
begin
  sSQLReserva := '';
  sSQLPeriodo := '';
  sPlano   := '';
  sSQLIdPlanPrev := '';

  if bTemDataInicialFinal then
    if (sIdReserva = '') then
       begin
         sSQLPeriodo := ' AND (HST.DATAALIMENTACAO BETWEEN TO_DATE('+ QuotedStr(FormatDateTime('dd/MM/YYYY', dtDataInicio.Date))+ ') AND TO_DATE(' + QuotedStr(FormatDateTime('dd/MM/YYYY', dtDataFim.Date)) + '))';
         sPlano      := ' and  RXP.IDPLANOPREV = '+ IntToStr(arIdPlanoPrev[ComboPlanoPrevidenciario.ItemIndex]);
       end
    else
       begin
         sSQLPeriodo := '';
         sIdReserva  := ' and HST.idhistReserva in ' + RetornaIDHISTRESERVA;
         sPlano:= '';
       end;

  if bTemReserva then
    sSQLReserva := 'AND (HST.IDTIPORESERVA = ' + IntToStr(arIdTipoReserva[ComboReserva.ItemIndex]) + ') ';

  if (ComboPlanoPrevidenciario.ItemIndex > 0) and (sIdReserva ='') then
    sSQLIdPlanPrev := ' AND (PP.IDPLANOPREV = ' + IntToStr(arIdPlanoPrev[ComboPlanoPrevidenciario.ItemIndex]) + ')';

  Result := 'SELECT '
    + 'PP.NOME AS NOMEPLANO, '
    + 'C.NOME AS MOVIMENTACAO, '
    + 'RXP.NOME AS NOME_RESERVA,'
    + 'HST.VALORINDICE AS VALORINDICE,'
    //Everson Cunha - SIG84982 - Ini
    {+ ' CASE '
    + '   WHEN HST.FLGENTRADA = 1 THEN HST.VLRCOTAS '
    + '   WHEN HST.FLGENTRADA = 0 THEN ((HST.VLRCOTAS)*(-1)) '
    + '  END AS QTPROVCONSTITUIR, '
    +' CASE '
    +'    WHEN HST.FLGENTRADA = 1 THEN HST.SALDOREAL '
    +'    WHEN HST.FLGENTRADA = 0 THEN ((HST.SALDOREAL)*(-1)) '
    +'   END AS VLRPROVCONSTITUIR, '}
    +' decode(hst.flgentrada,1, hst.vlrcotas * hst.valorindice,hst.vlrcotas * hst.valorindice*-1) vlrprovconstituir, '
    +' decode(hst.flgentrada,1, hst.vlrcotas,hst.vlrcotas *-1) qtprovconstituir, '
    +' SUM(decode(hst.flgentrada, 1, hst.vlrcotas, hst.vlrcotas * -1) *-1) OVER (ORDER BY hst.datamov, hst.mesreferencia,  hst.idhistreserva ) AS SALDO_ACUMULADO, '
    +' hst.dataalimentacao, cm.cotdatafim DATAREFERENCIA, hst.dataindice,'
    //+ 'HST.DATAMOV AS DATAREFERENCIA, '
    //Everson Cunha - SIG84982 - Fim
    +' SUBSTR(HST.OBSERVACAO, 1, 255) AS OBSERVACAO, '
    +' HST.SALDOREAL as  SALDOREAL, '
    +' RXP.INDICEREAJUSTE as INDICEREAJUSTE '
    +' FROM PLANPREV PP ' + 'INNER JOIN RESERVAXPLANO RXP ON '
    + '(' + '(RXP.IDPLANOPREV = PP.IDPLANOPREV) ' + sSQLIdPlanPrev + ') '
    + ' INNER JOIN HISTMOVRESERVA HST ON '
    + '(' + '(HST.IDTIPORESERVA = RXP.IDTIPORESERVA) '
    + sSQLReserva + sSQLPeriodo + ') '
        + ' INNER JOIN CONTRIBUICAO C '
    + ' ON (C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO) '
    //Everson Cunha - SIG84982 - Ini
    + ' join cotacaomoeda cm '
    + ' on cm.moecodigo = rxp.indicereajuste '
    + ' and nvl(to_char(hst.dataindice, ''yyyy/mm''),to_char(hst.datarecebimento, ''yyyy/mm'')) = '
    + '     to_char(cm.cotdata, ''yyyy/mm'') '
    //Everson Cunha - SIG84982 - Fim
    + ' WHERE RXP.FLGDEFICIT = 1  '
    + sPlano
    + sIdReserva
    //Everson Cunha - SIG84982 - Ini
    //+ ' GROUP BY RXP.NOME,RXP.INDICEREAJUSTE,HST.SALDOREAL,HST.FLGENTRADA,PP.NOME, C.NOME, HST.DATAMOV, HST.VLRCOTAS, '
    //+ ' HST.VLRREAL, HST.OBSERVACAO, HST.VALORINDICE,HST.IDHISTRESERVA,HST.DATAALIMENTACAO,HST.MESREFERENCIA '
//    + ' ORDER BY  RXP.NOME,C.NOME,HST.DATAMOV, HST.DATAALIMENTACAO ';
   //+ ' ORDER BY RXP.NOME,HST.MESREFERENCIA, HST.DATAALIMENTACAO ';
    + ' order by hst.dataindice, hst.datamov, hst.mesreferencia, hst.flgentrada ';
    //Everson Cunha - SIG84982 - Fim
end;

procedure TRelProvConst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if qryRel.Active then
    qryRel.Close;

  FreeAndNil(qryFiltro);  
end;

procedure TRelProvConst.PersonalizaGrid(oGrid: TwwDBGrid);
begin
  oGrid.Columns[0].DisplayLabel := 'Plano Previdenciário';
  oGrid.Columns[0].DisplayWidth := 25;
  oGrid.Columns[1].DisplayLabel := 'Movimentação ';
  oGrid.Columns[1].DisplayWidth := 40;
  oGrid.Columns[2].DisplayLabel := 'Valor Índice ';
  oGrid.Columns[2].DisplayWidth := 10;
  oGrid.Columns[3].DisplayLabel := 'Qt de Cotas da Prov. Mat. a Constituir ';
  oGrid.Columns[3].DisplayWidth := 25;
  oGrid.Columns[4].DisplayLabel := 'Valor da Porv. Mat. a Constituir ';
  oGrid.Columns[4].DisplayWidth := 25;
  oGrid.Columns[5].DisplayLabel := 'Data Referência ';
  oGrid.Columns[5].DisplayWidth := 10;
  oGrid.Columns[6].DisplayLabel := 'Observações ';
  oGrid.Columns[6].DisplayWidth := 25;
end;

procedure TRelProvConst.qryRelAfterClose(DataSet: TDataSet);
begin
  inherited;
  btGerarPDF.Enabled := False;
  btGerarEXCEL.Enabled := False;
  BtnGerarProvisao.Enabled := False; // leandro sig127397
end;

procedure TRelProvConst.dtDataInicioChange(Sender: TObject);
begin
  inherited;
  if qryRel.Active then
    qryRel.Close;
end;

procedure TRelProvConst.dtDataFimChange(Sender: TObject);
begin
  inherited;
  if qryRel.Active then
    qryRel.Close;
end;

procedure TRelProvConst.btGerarPDFClick(Sender: TObject);
var
  boolGerou: Boolean;
begin
  boolGerou := False;
  try
    qryRel.DisableControls;
    Screen.Cursor := crHourGlass;
    ppRep.DeviceType := 'PDFFile';
    ppRep.TextFileName :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + MontaNomeDoArquivo('pdf');
    ppRep.AllowPrintToFile := True;
    ppRep.ShowPrintDialog := False;
    ppRep.Print;
    boolGerou := True;
  finally
    qryRel.EnableControls;
    Screen.Cursor := crDefault;
  end;

  if boolGerou then
    MsgDlg('Arquivo em formato PDF gerado com sucesso no C:\Planus\Temp.', 'Informação', mtInformation, [mbOk], 0);

   ShellExecute(Application.HANDLE, 'open', PChar(ExtractFilePath('C:\Planus\Temp\')),nil,nil,SW_SHOWNORMAL);
end;

function TRelProvConst.MontaNomeDoArquivo(sComExtencao: string): string;
var
  oDia,
  oMes,
  oAno: string;
  wHora,wMinuto,wSegundo,wMSecundo : Word;
  wDia,
  wMes,
  wAno: Word;
  aHora,oMinuto,oSegundo,oMSecundo : string;
  function AjustaLength(sAjustar : string): string;
  begin
    Result := iif(Length(sAjustar) = 1, '0' + sAjustar, sAjustar);
  end;
begin
  DecodeDate(Date, wAno, wMes, wDia);
  oDia    := AjustaLength(intToStr(wDia));
  oMes    := AjustaLength(intToStr(wMes));
  oAno    := intToStr(wAno);

  DecodeTime(Time,wHora,wMinuto,wSegundo,wMSecundo);
  aHora   := AjustaLength(IntToStr(wHora));
  oMinuto := AjustaLength(IntToStr(wMinuto));
  Result       := '\Relatório de Provisões a Constituir - ' + oDia + '_' + oMes + '_' + oAno + '_' + aHora + '_' + oMinuto + '.' + sComExtencao;
end;

procedure TRelProvConst.PosicionaCabecalho(tipoDeRelatorio: TPosicaoRelt);
var
  dTop: Double;
  bPrimeiraColuna: Boolean;
  sReserva: string;
const
  dLinha = 0.1562;
begin
  case Integer(tipoDeRelatorio) of
    0:
      begin
        if FTemDataIniFim then
        begin
          dTop := 1.2187;
          LabDataInicial.Caption := dtDataInicio.Text;
          LabDataFinal.Caption := dtDataFim.Text;
          PosicionaTopELeft(LabTituloDataInicial, dTop, LabDataInicial);
          dTop := dTop + dLinha;
          PosicionaTopELeft(LabTituloDataFinal, dTop, LabDataFinal);
          { indica a posição da coluna do Plano }
          bPrimeiraColuna := False;
        end
        else
          bPrimeiraColuna := True;
        { Posiciona coluna do Plano Previdenciário na 1ª linha }
        dTop := 1.2187;
        PosicionaTopELeft(LabTituloPlano, dTop, dbPlano, bPrimeiraColuna);
        { Posiciona coluna da Reserva na 2ª linha }
        if Length(Trim(ComboReserva.Text)) > 0 then
        begin
          dTop := dTop + dLinha;
          LabTituloReserva.Visible := True;
          DBReserva.Visible := True;
          lblReserva2.Visible:= not LabTituloReserva.Visible;
          dbReserva2.Visible:= lblReserva2.Visible;
          PosicionaTopELeft(LabTituloReserva, dTop, dbReserva, bPrimeiraColuna);
        end
        else
        begin
          LabTituloReserva.Visible := False;
          DBReserva.Visible := LabTituloReserva.Visible;
          lblReserva2.Visible:= not DBReserva.Visible;
          dbReserva2.Visible:= lblReserva2.Visible;
        end;
      end;
    1:
      begin
        if FTemDataIniFim then
        begin
          if Length(Trim(ComboReserva.Text)) > 0 then
            sReserva := 'Reserva : ' + ComboReserva.Text
          else
            sReserva := '';

          qe3dPadrao.Header.Add('Data Inicial : ' + dtDataInicio.Text + '                    ' + 'Plano Previdenciário : ' + ComboPlanoPrevidenciario.Text);
          qe3dPadrao.Header.Add('Data Final   : ' + dtDataFim.Text + '                    ' + sReserva);
        end;
      end;
  end;
end;

procedure TRelProvConst.PosicionaTopELeft(lab1: TppLabel; dTop: Double; lab2: TObject = Nil; boolPrimeiraColuna: Boolean = True);
var
  dPosicao: Double;
  dLefth_1: Double;
  dLefth_2: Double;
begin
  if boolPrimeiraColuna then
  begin
    dLefth_1 := 0.0417;
    dLefth_2 := 0.7292;
  end
  else
  begin
    dLefth_1 := 2.2916;
    dLefth_2 := 3.5625;
  end;

  lab1.AutoSize := True;
  lab1.Left := dLefth_1;
  lab1.Top := dTop;
  if Assigned(lab2) then
  begin
    if (lab2 is TppLabel) then
    begin
      TppLabel(lab2).Left := dLefth_2;
      TppLabel(lab2).Top := dTop;
    end;
    if (lab2 is TppDBText) then
    begin
      TppDBText(lab2).Left := dLefth_2;
      TppDBText(lab2).Top := dTop;
    end;
  end;
end;

procedure TRelProvConst.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  PosicionaCabecalho(tpPDF);
end;

procedure TRelProvConst.qryRelAfterOpen(DataSet: TDataSet);
begin
  inherited;
  btGerarPDF.Enabled := not DataSet.IsEmpty;
  btGerarEXCEL.Enabled := not DataSet.IsEmpty;
  BtnGerarProvisao.Enabled := not DataSet.IsEmpty; // leandro sig127397
end;

procedure TRelProvConst.MontaArquivoExcel();
var
  lstDados: TStringList;
//  lstLinha: TStringList;
//  lstCabec: TStringList;
  ind, col: byte;
  lin: integer;
  sLinha: string;
  iCount: Integer;
  sDataIni: string;
  sDataFim: string;
  sNomeArq: string;
  sNomeReserva: string;
  linha: array [1..2,1..7] of string;
  dQtd: double;
  dVlr: double;

  function TrocaCaracter(aStr, aOld, aNew: string): string;
  begin
    Result := StringReplace(aStr, aOld, aNew, [rfReplaceAll]);
  end;

  (**procedure SplitString(sDelimitador, sTexto: string; var lstLista: TStringList);
  var
    i: byte;
  begin
    if copy(sTexto, length(sTexto), 1) <> sDelimitador then
      sTexto := sTexto + sDelimitador;
    while length(sTexto) > 0 do
    begin
      i := pos(sDelimitador, sTexto);
      if i = 0 then
        i := length(sTexto);

      lstLista.Add(copy(sTexto, 1, i - 1));

      sTexto := StringReplace(sTexto, lstLista.Strings[lstLista.count - 1] + sDelimitador, '', []);
    end;
  end; **)

  procedure InsereCabecalho(reserva: string);
   begin
    if (Trim(Sheet.Cells[8, 3])='') then
     begin
         Sheet.Cells[lin, 1] := 'NOME DA RESERVA';
         Sheet.Cells[lin, 2] :=  reserva;
         inc(lin);
    end;
    Sheet.Cells[lin, 1] := 'MOVIMENTAÇÃO';
    Sheet.Cells[lin, 2] := 'VALOR ÍNDICE';
    Sheet.Cells[lin, 3] := 'QT DE COTAS DA PROV. MAT. A CONSTITUIR';
    Sheet.Cells[lin, 4] := 'VALOR DA PROV. MAT. A CONSTITUIR';
    Sheet.Cells[lin, 5] := 'DATA REFERENCIA';
    Sheet.Cells[lin, 6] := 'OBSERVAÇÕES';
    inc(lin);
   end;

  procedure FormataColunas;
  begin
    Sheet.Columns[1].NumberFormat        := '@'; // Reserva
    Sheet.Columns[2].HorizontalAlignment := 4;   // 3=Center - 4=Righ
    Sheet.Columns[2].NumberFormat        := '@'; // Índice //Everson Cunha - SIG84982
    Sheet.Columns[3].HorizontalAlignment := 4;   // 3=Center - 4=Righ
    Sheet.Columns[4].HorizontalAlignment := 4;   // 3=Center - 4=Righ
    Sheet.Columns[4].NumberFormat        := '@'; // Data
    Sheet.Columns[5].HorizontalAlignment := 3;   // 3=Center - 4=Righ
    Sheet.Columns[6].NumberFormat        := '@'; // Observação
  end;

begin
  try
//    lstCabec := TStringList.create;
//    lstLinha := TStringList.create;
//    lstDados := TStringList.create;

    sDataIni := FormatDateTime('dd/mm/yyyy', dtDataInicio.Date);
    sDataFim := FormatDateTime('dd/mm/yyyy', dtDataFim.Date);

//    lstDados.Add('MOVIMENTAÇÃO' + #59 + 'VALOR ÍNDICE' + #59 +'QT DE COTAS DA PROV. MAT. A CONSTITUIR' + #59 + 'VALOR DA PROV. MAT. A CONSTITUIR' + #59 + 'DATA REFERENCIA' + #59 + 'OBSERVAÇÕES');

    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := false;
    ExcelApp.WorkBooks.Add(-4167);
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := 'Sheet1';
    sheet := ExcelApp.WorkBooks[1].WorkSheets['Sheet1'];

    Sheet.Range['A1', 'E1'].MergeCells := true;
    Sheet.Range['A1', 'E1'].font.size := 14;   // Tamanho da Fonte
    Sheet.Range['A1', 'E1'].font.bold := true; // Negrito
    Sheet.Range['A1', 'E1'] := 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS';
    Sheet.Range['A1', 'E1'].VerticalAlignment := 2;   // 1=Top - 2=Center - 3=Bottom
    Sheet.Range['A1', 'E1'].HorizontalAlignment := 3; // 3=Center - 4=Righ

    Sheet.Range['A2', 'E2'].MergeCells := true;
    Sheet.Range['A2', 'E2'].font.size := 12;    // Tamanho da Fonte
    Sheet.Range['A2', 'E2'].font.bold := False; // Negrito
    Sheet.Range['A2', 'E2'] := 'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e 13 Andares';
    Sheet.Range['A2', 'E2'].VerticalAlignment := 2;   // 1=Top - 2=Center - 3=Bottom
    Sheet.Range['A2', 'E2'].HorizontalAlignment := 3; // 3=Center - 4=Righ

    Sheet.Range['A3', 'E3'].MergeCells := true;
    Sheet.Range['A3', 'E3'].font.size := 12;    // Tamanho da Fonte
    Sheet.Range['A3', 'E3'].font.bold := False; // Negrito
    Sheet.Range['A3', 'E3'] := 'Brasília  DF CEP 70.712-900 - (061)3329-1700 - www.funcef.com.br';
    Sheet.Range['A3', 'E3'].VerticalAlignment := 2;   // 1=Top - 2=Center - 3=Bottom
    Sheet.Range['A3', 'E3'].HorizontalAlignment := 3; // 3=Center - 4=Righ

    Sheet.Range['A4', 'E4'].MergeCells := true;
    Sheet.Range['A4', 'E4'].font.size := 12;    // Tamanho da Fonte
    Sheet.Range['A4', 'E4'].font.bold := False; // Negrito
    Sheet.Range['A4', 'E4'] := 'CNPJ: 00.436.923/0001-90';
    Sheet.Range['A4', 'E4'].VerticalAlignment := 2;   // 1=Top - 2=Center - 3=Bottom
    Sheet.Range['A4', 'E4'].HorizontalAlignment := 3; // 3=Center - 4=Righ

    Sheet.Range['A5', 'E5'].MergeCells := true;
    Sheet.Range['A5', 'E5'].font.size := 12;    // Tamanho da Fonte
    Sheet.Range['A5', 'E5'].font.bold := False; // Negrito
    Sheet.Range['A5', 'E5'] := 'Relatório de Provisões a Constituir';
    Sheet.Range['A5', 'E5'].VerticalAlignment := 2;   // 1=Top - 2=Center - 3=Bottom
    Sheet.Range['A5', 'E5'].HorizontalAlignment := 3; // 3=Center - 4=Righ

    Sheet.Cells[7, 1] := 'Data Inicial : ' + sDataIni;
    Sheet.Cells[7, 1].HorizontalAlignment := 2; // 3=Center - 4=Righ

    Sheet.Cells[7, 2] := 'Plano Previdenciário :';
    Sheet.Cells[7, 2].HorizontalAlignment := 4; // 3=Center - 4=Righ
    Sheet.Cells[7, 3] := ComboPlanoPrevidenciario.Text;
    Sheet.Cells[7, 3].HorizontalAlignment := 2; // 3=Center - 4=Righ

    Sheet.Cells[8, 1] := 'Data Final : ' + sDataFim;
    Sheet.Cells[8, 1].HorizontalAlignment := 2; // 3=Center - 4=Righ

    Sheet.Cells[8, 3] := ComboReserva.Text;
    Sheet.Cells[8, 3].HorizontalAlignment := 2; // 3=Center - 4=Righ

    Application.ProcessMessages;
    FormataColunas();

    {* insere titulo colunas *}
//    lstCabec.clear;
//    SplitString(';', lstDados.Strings[0], lstCabec);
//    for col := 0 to lstCabec.Count - 1 do
//      Sheet.Cells[10, col + 1] := lstCabec.Strings[col];

    frmAguarde.pbAguarde.Max := qryRel.RecordCount;
    QryRel.First;
    dQtd:= 0;
    dVlr:= 0;
    lin := 11;

    while not(QryRel.eof) do
    begin
      frmAguarde.Mostra('Aguarde...');
      linha[1][1]:= (QryRel.FieldByName('MOVIMENTACAO').AsString);
      //linha[1][2]:=(FormatCurr('#,##0.00', QryRel.FieldByName('VALORINDICE').AsCurrency)); //Everson Cunha - SIG84982
      linha[1][2]:=(QryRel.FieldByName('VALORINDICE').AsString); //Everson Cunha - SIG84982
      linha[1][3]:=(FormatCurr('#,##0.00', QryRel.FieldByName('QTPROVCONSTITUIR').AsCurrency));
      linha[1][4]:=(FormatCurr('#,##0.00', QryRel.FieldByName('VLRPROVCONSTITUIR').AsCurrency));
      linha[1][5]:=(DateToStr(QryRel.FieldByName('DATAREFERENCIA').AsDateTime));
      linha[1][6]:=(QryRel.FieldByName('OBSERVACAO').AsString);
      linha[1][7]:=(QryRel.FieldByName('NOME_RESERVA').AsString);

      QryRel.next;

      {verifica proxima movimentação}
      linha[2][7]:= (QryRel.FieldByName('NOME_RESERVA').AsString);

      {preenche as celulas}
      if (Trim(Sheet.Cells[lin - 1, 1])='') then
        begin
          FormataColunas();
          InsereCabecalho(QryRel.FieldByName('NOME_RESERVA').AsString);
        end;

      Sheet.Cells[lin, 1] := linha[1][1];
      Sheet.Cells[lin, 2] := linha[1][2];
      Sheet.Cells[lin, 3] := linha[1][3];
      Sheet.Cells[lin, 4] := linha[1][4];
      Sheet.Cells[lin, 5] := linha[1][5];
      Sheet.Cells[lin, 6] := linha[1][6];
      dQtd:= StrToFloat(StringReplace(linha[1][3],'.','',[rfReplaceAll])) + dQtd;
      dVlr:= StrToFloat(StringReplace(linha[1][4],'.','',[rfReplaceAll])) + dVlr;

      inc(lin);

      {totalizador do plano }
      if (linha[1][7]<> linha[2][7]) or (QryRel.eof) then
         begin
           Sheet.Cells[lin, 1] := 'Totalizador por Reserva';
           Sheet.Cells[lin, 3] := FormatFloat('#,#0.00', dQtd);
           Sheet.Cells[lin, 4] := FormatFloat('#,#0.00', dVlr);
           lin := lin + 2;
           dQtd:= 0;
           dVlr:= 0;
         end;
    end;

    ExcelApp.Columns.AutoFit;
    frmAguarde.pbAguarde.Visible := False;
    frmAguarde.Mostra('Aguarde...' + chr(13) + 'Salvando Arquivo... ');
    frmAguarde.Apaga;
    frmAguarde.pbAguarde.Visible := True;

    sNomeArq := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ MontaNomeDoArquivo('xls');

    if FileExists(sNomeArq) then
      DeleteFile(sNomeArq);

    (* Fecha o Arquivo Independente do resultado da Operação *)
    ExcelApp.ActiveWorkbook.SaveAs(sNomeArq);
    ExcelApp.ActiveWorkbook.Close(False);
    ExcelApp.Quit;
    MsgDlg('Arquivo em formato Excel gerado com sucesso no C:\Planus\Temp.', 'Informação', mtInformation, [mbOk], 0);
  finally
//    FreeAndNil(lstCabec);
//    FreeAndNil(lstLinha);
//    FreeAndNil(lstDados);
  end;
end;

procedure TRelProvConst.btGerarEXCELClick(Sender: TObject);
begin
  MontaArquivoExcel;
  ShellExecute(Application.HANDLE, 'open', PChar(ExtractFilePath('C:\Planus\Temp\')),nil,nil,SW_SHOWNORMAL);
end;


function TRelProvConst.GetQryFiltro: TwwQuery;
var
 qryResult: TwwQuery;
begin
   qryResult := TwwQuery.Create(Self);
   qryResult.DatabaseName := 'BaseDados';
   qryResult.SQL.Clear;

   qryResult.SQL.Add(qryRel.Sql.GetText);
   qryResult.Open;
   Result := qryResult;
end;

function TRelProvConst.GetTotalReserva(RESERVA: String; tipo: byte): Double;
var
  dValor   : Double;
  bNaoConta: Boolean;
begin
  QryFiltro:= GetQryFiltro;
  QryFiltro.Filtered:= false;
  QryFiltro.Filter := ' (NOME_RESERVA = '+ QuotedStr(RESERVA)+')';
  QryFiltro.Filtered:= true;

  bNaoConta := False;
  dTotalPorReserva := 0;

  While not QryFiltro.Eof do
    begin
      case Integer(tipo) of
         1: dValor := QryFiltro.FieldByName('QTPROVCONSTITUIR').AsCurrency;
         2: dValor := QryFiltro.FieldByName('VLRPROVCONSTITUIR').AsCurrency;
      end;

     (** if dTotalPorReserva = 0 then
        begin
          dTotalPorReserva := dValor;
          bNaoConta        := True;
        end else
        bNaoConta := False;

      if Not bNaoConta then  **)
          dTotalPorReserva := dTotalPorReserva + (dValor);

      QryFiltro.Next;
    end;
  Result := dTotalPorReserva;
end;

procedure TRelProvConst.ppGroupFooterBand1BeforeGenerate(Sender: TObject);
begin
   inherited;
   LabQt.Caption    := FormatFloat('#,#0.00', GetTotalReserva(qryRel.FieldByName('NOME_RESERVA').asString ,1));
   LabValor.Caption := FormatFloat('#,#0.00', GetTotalReserva(qryRel.FieldByName('NOME_RESERVA').asString ,2));
end;

procedure TRelProvConst.FormShow(Sender: TObject);
begin
  inherited;
  prepara_form;
  qryFiltro := TwwQuery.Create(nil);
  qryFiltro.DatabaseName:= 'BaseDados';
end;

procedure TRelProvConst.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  prepara_form;
end;

procedure TRelProvConst.MontaArquivoExcelProvisao(sTipoReservas, DataInicial, sDataFinal:string);  // leandro sig127397
var
  lstDados: TStringList;
  ind : byte;
  lin, col: integer;
  sLinha: string;
  iCount: Integer;
  sDataIni: string;
  sDataFim: string;
  sNomeArq: string;
  sNomeReserva: string;
  sNomePla : string;
  linha: array [1..2,1..7] of string;
  dQtd: double;
  dVlr: double;

  function TrocaCaracter(aStr, aOld, aNew: string): string;
  begin
    Result := StringReplace(aStr, aOld, aNew, [rfReplaceAll]);
  end;

  procedure InsereCabecalho(reserva: string; data : string = '');
  var
    sTipo:string;
  begin
    qryCabecalho:= TwwQuery.Create(nil);
    qryCabecalho.DatabaseName:= 'BaseDados';

    if length(trim(data)) > 0 then
    begin

      if Pos('NSD',qryProvReservas.FieldByName('NOME').AsString) > 0 then
        sTipo :=  Copy(qryProvReservas.FieldByName('NOME').AsString,
                                     Pos('NSD',qryProvReservas.FieldByName('NOME').AsString),
                                     length(qryProvReservas.FieldByName('NOME').AsString))
      else
        sTipo :=  Copy(qryProvReservas.FieldByName('NOME').AsString,
                                     Pos('SD',qryProvReservas.FieldByName('NOME').AsString),
                                     length(qryProvReservas.FieldByName('NOME').AsString));

      sTipo :=  Copy(sTipo, 1, Pos(' ',sTipo));
      inc(lin);
      Sheet.Cells[lin, 2].Font.Color     := TColor($000000);
      Sheet.Cells[lin, 2].Font.Bold      := True;
      Sheet.Cells[lin, 2].Interior.Color := TColor(RGB(255, 217, 102));
      Sheet.Cells[lin, 2].Borders.LineStyle := 1;
      Sheet.Cells[lin, 2] := 'Data Referência Início/Mínima ' + sTipo;

      Sheet.Cells[lin, 3].Font.Color     := TColor($000000);
      Sheet.Cells[lin, 3].Font.Bold      := True;
      Sheet.Cells[lin, 3].Interior.Color := TColor(RGB(255, 217, 102));
      Sheet.Cells[lin, 2].Borders.LineStyle := 1;
      Sheet.Cells[lin, 3] := data;

      inc(lin);
    end;

    if reserva <> 'DIF' then
    begin
      inc(lin);
      Sheet.Cells[lin, 2].Font.Color     := TColor($ffffff);
      Sheet.Cells[lin, 2].Font.Bold      := True;
      Sheet.Cells[lin, 2].Interior.Color := TColor(RGB(0, 32, 96));
      Sheet.Cells[lin, 2].Borders.LineStyle := 1;
      Sheet.Cells[lin, 2] := 'IDTIPORESERVA';

      Sheet.Cells[lin, 3].Font.Color     := TColor($ffffff);
      Sheet.Cells[lin, 3].Font.Bold      := True;
      Sheet.Cells[lin, 3].Interior.Color := TColor(RGB(0, 32, 96));
      Sheet.Cells[lin, 2].Borders.LineStyle := 1;
      Sheet.Cells[lin, 3] := reserva;
      inc(lin);

      qryCabecalho.Close;
      qryCabecalho.SQL.Clear;
      qryCabecalho.Params.Clear;
      qryCabecalho.Sql.Add(' select IDTIPORESERVA, IDCONTRIBUICAO '+
                            '  from RESERVAXCONTRIB ' +
                            '  WHERE IDTIPORESERVA IN (' + reserva + ')');


      qryCabecalho.Open;
      qryCabecalho.First;
      while not(qryCabecalho.Eof) do
      begin
        if qryCabecalho.Bof then Sheet.Cells[lin, 2] := 'IDCONTRIBUICAO - Contribuições';
        Sheet.Cells[lin, 3] := qryCabecalho.FieldByName('IDCONTRIBUICAO').AsString;
        inc(lin);
        qryCabecalho.next;
      end;

      qryCabecalho.Close;
      qryCabecalho.SQL.Clear;
      qryCabecalho.Params.Clear;
      qryCabecalho.Sql.Add(' SELECT 736 AS IDCONTRIBUICAO FROM DUAL  ' +
                           '    UNION ' +
                           ' SELECT 737 AS IDCONTRIBUICAO FROM DUAL');
      qryCabecalho.Open;
      qryCabecalho.First;
      while not(qryCabecalho.Eof) do
      begin
        if qryCabecalho.Bof then Sheet.Cells[lin, 2] := 'IDCONTRIBUICAO - Revisões';
        Sheet.Cells[lin, 3] := qryCabecalho.FieldByName('IDCONTRIBUICAO').AsString;
        inc(lin);
        qryCabecalho.next;
       end;
      inc(lin);
    end
    else
    begin
      inc(lin);

      Sheet.Range[Sheet.Cells[lin, 2], Sheet.Cells[lin, 3]].MergeCells := true;
      Sheet.Range[Sheet.Cells[lin, 2], Sheet.Cells[lin, 3]].VerticalAlignment := 3;   // 1=Top - 2=Center - 3=Bottom
      Sheet.Range[Sheet.Cells[lin, 2], Sheet.Cells[lin, 3]].HorizontalAlignment := 3; // 3=Center - 4=Righ

      Sheet.Cells[lin, 2].Font.Color     := TColor($ffffff);
      Sheet.Cells[lin, 2].Font.Bold      := True;
      Sheet.Cells[lin, 2].Interior.Color := TColor(RGB(0, 32, 96));
      Sheet.Cells[lin, 2].Borders.LineStyle := 1;
      Sheet.Cells[lin, 2] := qryProvReservas.FieldByName('IDTIPORESERVA').AsString;
      lin := lin + 2;
    end;
    FreeAndNil(qryCabecalho);
  end;

  procedure InsereDetalhe;
  var
     nTotalAnt : Double;
  begin
    col := 2;

    Sheet.Columns[col].HorizontalAlignment := 4; // 3=Center - 4=Righ
    Sheet.Columns[col].NumberFormat        := '@';

    Sheet.Cells[lin  , col] := 'PROVISÃO MATEMÁTICA A CONSTITUIR';
    Sheet.Cells[lin  , col].Font.Color     := $ffffff;
    Sheet.Cells[lin  , col].Font.Bold      := True;
    Sheet.Cells[lin  , col].Borders.LineStyle := 1;
    Sheet.Cells[lin  , col].Interior.Color := TColor(RGB(0, 32, 96)) ;

    Sheet.Cells[lin+1, col] := 'Valor do Índice NO Mês';
    Sheet.Cells[lin+1, col].Borders.LineStyle := 1;

    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000008].Weight := $00000002;
    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000007].Weight := $00000002;
    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$0000000A].Weight := $00000002;
    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000009].Weight := $00000002;

    Sheet.Cells[lin+3, col] := 'Qtde Cota Total ACUM ATÉ O Mês (inclusive)';
    Sheet.Cells[lin+4, col] := 'Valor Total Cont NO Mês';
    Sheet.Cells[lin+5, col] := 'Valor Revisões NO Mês';
    Sheet.Cells[lin+6, col] := 'Valor Meta NO Mês';

    Sheet.Cells[lin+8, col].Font.Color     := $000000;
    Sheet.Cells[lin+8, col].Font.Bold      := True;
    Sheet.Cells[lin+8, col].Interior.Color := TColor(RGB(217, 217, 217));
    Sheet.Cells[lin+8, col].Borders.LineStyle := 1;
    Sheet.Cells[lin+8, col] := 'Total';
    inc(col);

    Sheet.Columns[col].HorizontalAlignment := 3; // 3=Center - 4=Righ
    Sheet.Columns[col].NumberFormat        := '@';

    Sheet.Cells[lin  , col].Font.Color     := $000000;
    Sheet.Cells[lin  , col].Font.Bold      := True;
    Sheet.Cells[lin  , col].Interior.Color := TColor(RGB(255, 217, 102));
    Sheet.Cells[lin  , col].Borders.LineStyle := 1;

    if Pos('NSD',qryProvReservas.FieldByName('NOME').AsString) > 0 then
      Sheet.Cells[lin  , col] :=  Copy(qryProvReservas.FieldByName('NOME').AsString,
                                     Pos('NSD',qryProvReservas.FieldByName('NOME').AsString),
                                     length(qryProvReservas.FieldByName('NOME').AsString))
    else
      Sheet.Cells[lin  , col] :=  Copy(qryProvReservas.FieldByName('NOME').AsString,
                                     Pos('SD',qryProvReservas.FieldByName('NOME').AsString),
                                     length(qryProvReservas.FieldByName('NOME').AsString));



    Sheet.Cells[lin+1, col] := '[A]';
    Sheet.Cells[lin+1, col].Borders.LineStyle := 1;

    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000008].Weight := $00000002;
    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000007].Weight := $00000002;
    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$0000000A].Weight := $00000002;
    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000009].Weight := $00000002;

    Sheet.Cells[lin+3, col] := '[B]';
    Sheet.Cells[lin+4, col] := '[C]';
    Sheet.Cells[lin+5, col] := '[D]';
    Sheet.Cells[lin+6, col] := '[E] = 0 ou [F - 1] * ([A] / [A - 1] - 1)';

    Sheet.Cells[lin+8, col].Font.Color     := $000000;
    Sheet.Cells[lin+8, col].Font.Bold      := True;
    Sheet.Cells[lin+8, col].Interior.Color := TColor(RGB(217, 217, 217));
    Sheet.Cells[lin+8, col].Borders.LineStyle := 1;
    Sheet.Cells[lin+8, col] := '[F] = [A] * [B] ou [C] + [D] + [E] + [F - 1]';
    inc(col);

    Sheet.Columns[col].HorizontalAlignment := 3; // 3=Center - 4=Righ
    Sheet.Columns[col].NumberFormat        := '@';

    Sheet.Cells[lin  , col].Font.Color     := TColor($ffffff);
    Sheet.Cells[lin  , col].Font.Bold      := True;
    Sheet.Cells[lin  , col].Interior.Color := TColor(RGB(0, 32, 96));
    Sheet.Cells[lin  , col].Borders.LineStyle := 1;
    Sheet.Cells[lin  , col] := 'Nome Reserva';

    Sheet.Cells[lin+1, col] := 'Valor Índice';
    Sheet.Cells[lin+1, col].Borders.LineStyle := 1;

    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000008].Weight := $00000002;
    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000007].Weight := $00000002;
    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$0000000A].Weight := $00000002;
    Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000009].Weight := $00000002;

    Sheet.Cells[lin+3, col] := 'Quantidade Cota';
    Sheet.Cells[lin+4, col] := 'Contribuições';
    Sheet.Cells[lin+5, col] := 'Revisões';
    Sheet.Cells[lin+6, col] := 'Meta Atuarial';
    Sheet.Cells[lin+8, col].Font.Color     := $000000;
    Sheet.Cells[lin+8, col].Font.Bold      := True;
    Sheet.Cells[lin+8, col].Interior.Color := TColor(RGB(217, 217, 217));
    Sheet.Cells[lin+8, col].Borders.LineStyle := 1;
    Sheet.Cells[lin+8, col] := 'Total';
    inc(col);

    nTotalAnt := 0;
    qryProvReservas.First;
    while not(qryProvReservas.eof) do
    begin
      Sheet.Columns[col].HorizontalAlignment := 3; // 3=Center - 4=Righ
      Sheet.Columns[col].NumberFormat        := '@';
      Sheet.Cells[lin  , col].Font.Color     := TColor($ffffff);
      Sheet.Cells[lin  , col].Font.Bold      := True;
      Sheet.Cells[lin  , col].Interior.Color := TColor(RGB(0, 32, 96));
      Sheet.Cells[lin  , col].Borders.LineStyle := 1;
      Sheet.Cells[lin  , col] := DateToStr(qryProvReservas.FieldByName('DATAREF').AsDateTime);

      Sheet.Cells[lin+1, col].Borders.LineStyle := 1;
      if qryProvReservas.FieldByName('COTVALOR').AsFloat > 0 then
        Sheet.Cells[lin+1, col] := qryProvReservas.FieldByName('COTVALOR').AsString
      else
        Sheet.Cells[lin+1, col] := '-';

      Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000008].Weight := $00000002;
      Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000007].Weight := $00000002;
      Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$0000000A].Weight := $00000002;
      Sheet.Range[Sheet.Cells[lin+3, col], Sheet.Cells[lin+6, col]].Borders.Item[$00000009].Weight := $00000002;

      if qryProvReservas.FieldByName('QTDCOTAS').AsFloat > 0 then
        Sheet.Cells[lin+3, col] := FormatCurr('#,##0.00', qryProvReservas.FieldByName('QTDCOTAS').AsCurrency)
      else
        Sheet.Cells[lin+3, col] := '0,00';

      if qryProvReservas.FieldByName('CONTRIBUICOES').AsFloat < 0 then
        Sheet.Cells[lin+4, col].Font.Color     := TColor(RGB(226, 0, 0));

      if qryProvReservas.FieldByName('CONTRIBUICOES').AsFloat <> 0 then
        Sheet.Cells[lin+4, col] := FormatCurr('#,##0.00', qryProvReservas.FieldByName('CONTRIBUICOES').AsCurrency)
      else
        Sheet.Cells[lin+4, col] := '0,00';

      if qryProvReservas.FieldByName('REVISOES').AsFloat < 0 then
        Sheet.Cells[lin+5, col].Font.Color     := TColor(RGB(226, 0, 0));

      Sheet.Cells[lin+5, col].Interior.Color := TColor(RGB(242, 242, 242));
      if qryProvReservas.FieldByName('REVISOES').AsFloat <> 0 then
        Sheet.Cells[lin+5, col] := FormatCurr('#,##0.00', qryProvReservas.FieldByName('REVISOES').AsCurrency)
      else
        Sheet.Cells[lin+5, col] := '0,00';

      if qryProvReservas.FieldByName('META').AsFloat < 0 then
        Sheet.Cells[lin+6, col].Font.Color     := TColor(RGB(226, 0, 0));

      Sheet.Cells[lin+6, col].Interior.Color := TColor(RGB(242, 242, 242));
      if qryProvReservas.FieldByName('META').AsFloat <> 0 then
        Sheet.Cells[lin+6, col] := FormatCurr('#,##0.00', qryProvReservas.FieldByName('META').AsCurrency)
      else
        Sheet.Cells[lin+6, col] := '0,00';

      Sheet.Cells[lin+8, col].Font.Color     := $000000;
      Sheet.Cells[lin+8, col].Font.Bold      := True;
      Sheet.Cells[lin+8, col].Interior.Color := TColor(RGB(217, 217, 217));
      Sheet.Cells[lin+8, col].Borders.LineStyle := 1;
      if qryProvReservas.FieldByName('TOTAL').AsFloat > 0 then
      begin
        //Sheet.Cells[lin+8, col] := FormatCurr('#,##0.00', qryProvReservas.FieldByName('TOTAL').AsCurrency);

        if qryProvReservas.Bof then
          nTotalAnt := qryProvReservas.FieldByName('TOTAL').AsCurrency
        else
          if nTotalAnt = 0 then
            nTotalAnt := qryProvReservas.FieldByName('TOTAL').AsCurrency
          else
            nTotalAnt := nTotalAnt +
                       qryProvReservas.FieldByName('CONTRIBUICOES').AsCurrency +
                       qryProvReservas.FieldByName('REVISOES').AsCurrency +
                       qryProvReservas.FieldByName('META').AsCurrency;

        Sheet.Cells[lin+8, col] := FormatCurr('#,##0.00', nTotalAnt);
      end
      else
        Sheet.Cells[lin+8, col] := '0,00';

      inc(col);


      qryProvReservas.next;
    end;

    lin := lin + 9;
  end;

begin
  try
    sDataIni := FormatDateTime('dd/mm/yyyy', dtDataInicio.Date);
    sDataFim := FormatDateTime('dd/mm/yyyy', dtDataFim.Date);
    if UpperCase(sTipoReservas) = 'SD' then
      sNomePla := 'SD - Provisões a Constituir'
    else
      sNomePla := 'NSD - Provisões a Constituir';

    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := false;
    ExcelApp.WorkBooks.Add(-4167);
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := sNomePla;
    sheet := ExcelApp.WorkBooks[1].WorkSheets[sNomePla];

    Application.ProcessMessages;

    qryProvReservas:= TwwQuery.Create(nil);
    qryProvReservas.DatabaseName:= 'BaseDados';

    dQtd:= 0;
    dVlr:= 0;
    lin := 1;

    frmAguarde.pbAguarde.Max := 10;

    if UpperCase(sTipoReservas) = 'SD' then
    begin
      frmAguarde.Mostra('Gerando SD - Relatório de Provisões a Constituir...');

      GetDadosReservaProvisao(qryProvReservas, 183, 0, '31/12/2015' );
      InsereCabecalho('183', '31/12/2015');
      InsereDetalhe;

      //deve ficar sempre apos a 183 pois faz o comparativo A SEGUIR
      GetDadosReservaProvisao(qryProvReservas, 212 , 0, '31/12/2015');
      InsereCabecalho('212');
      InsereDetalhe;

      //diferença entre 183 e 212
      GetDadosReservaProvisao(qryProvReservas, 183, 212, '31/12/2015' );
      InsereCabecalho('DIF');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 185 , 0, '31/12/2015');
      InsereCabecalho('185');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 184 ,  0, '31/12/2015');
      InsereCabecalho('184');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 187 , 0, '31/12/2015');
      InsereCabecalho('187', '31/12/2015');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 213 , 0, '31/12/2015');
      InsereCabecalho('213');
      InsereDetalhe;

      //diferença entre 187 e 213
      GetDadosReservaProvisao(qryProvReservas, 187, 213 , '31/12/2015');
      InsereCabecalho('DIF');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 189 , 0, '31/12/2015');
      InsereCabecalho('189');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 188 , 0, '31/12/2015');
      InsereCabecalho('188');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 197 , 0, '31/12/2016');
      InsereCabecalho('197', '31/12/2016');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 214 , 0, '31/12/2016');
      InsereCabecalho('214');
      InsereDetalhe;

      //diferença entre 197 e 214
      GetDadosReservaProvisao(qryProvReservas, 197, 214 , '31/12/2016');
      InsereCabecalho('DIF');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 199 , 0, '31/12/2016');
      InsereCabecalho('199');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 198 , 0, '31/12/2016');
      InsereCabecalho('198');
      InsereDetalhe;
    end
    else
    begin
      frmAguarde.Mostra('Gerando NSD - Relatório de Provisões a Constituir...');

      GetDadosReservaProvisao(qryProvReservas, 205 , 0, '31/07/2017');
      InsereCabecalho('205', '31/07/2017');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 190 , 0, '31/07/2017');
      InsereCabecalho('190');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 215 , 0, '31/07/2017');
      InsereCabecalho('215');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 192 , 0, '31/07/2017');
      InsereCabecalho('192');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 191 , 0, '31/07/2017');
      InsereCabecalho('191');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 202 , 0, '30/09/2017');
      InsereCabecalho('202', '30/09/2017');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 206 , 0, '30/09/2017');
      InsereCabecalho('206');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 216 , 0, '30/09/2017');
      InsereCabecalho('216');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 204 , 0, '30/09/2017');
      InsereCabecalho('204');
      InsereDetalhe;

      GetDadosReservaProvisao(qryProvReservas, 203 , 0, '30/09/2017');
      InsereCabecalho('203');
      InsereDetalhe;
    end;

    ExcelApp.Columns.AutoFit;
    frmAguarde.pbAguarde.Visible := False;
    frmAguarde.Mostra('Aguarde...' + chr(13) + 'Salvando Arquivo... ');
    frmAguarde.Apaga;
    frmAguarde.pbAguarde.Visible := True;

    sNomeArq := MontaNomeDoArquivo('xls');
    if UpperCase(sTipoReservas) = 'SD' then
      sNomeArq := '\SD - ' + Copy(sNomeArq,2,length(sNomeArq))
    else
      sNomeArq := '\NSD - ' + Copy(sNomeArq,2,length(sNomeArq));

    sNomeArq := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + sNomeArq;

    if FileExists(sNomeArq) then
      DeleteFile(sNomeArq);

    (* Fecha o Arquivo Independente do resultado da Operação *)
    ExcelApp.ActiveWorkbook.SaveAs(sNomeArq);
    ExcelApp.ActiveWorkbook.Close(False);
    ExcelApp.Quit;
    MsgDlg('Arquivo em formato Excel gerado com sucesso no C:\Planus\Temp.', 'Informação', mtInformation, [mbOk], 0);
  finally
    FreeAndNil(qryProvReservas);
  end;
end;

procedure TRelProvConst.GetDadosReservaProvisao(qQuery:TwwQuery; iIDTIPORESERVA:integer; iIDTIPORESERVA2:integer; sDataIni:string);   // leandro sig127397
var
  sSql : ansistring;
begin
  IF iIDTIPORESERVA2 = 0 then
  begin
    sSql := ' WITH  ' +
          '      TINDICE AS ' +
          '      (SELECT COTDATAFIM, COTVALOR, NOME ' +
          '       from RESERVAXPLANO RE INNER JOIN  ' +
          '       COTACAOMOEDA CO ON RE.INDICEREAJUSTE = CO.MOECODIGO ' +
          '       WHERE IDTIPORESERVA = ' + inttostr(iIDTIPORESERVA) +
          '      ), ' +
          '      TCODCONTRIBUICOES AS ' +
          '      (select IDTIPORESERVA, IDCONTRIBUICAO ' +
          '       from RESERVAXCONTRIB ' +
          '       WHERE IDTIPORESERVA IN (' + inttostr(iIDTIPORESERVA) + ')' +
          '      ), ' +
          '      TCODREVISOES AS ' +
          '        (SELECT 736 AS IDCONTRIBUICAO FROM DUAL ' +
          '         UNION ' +
          '         SELECT 737 AS IDCONTRIBUICAO FROM DUAL ' +
          '        ), ' +
          '      TOTAL AS ' +
          '       (SELECT LAST_DAY(NVL(HT.DATAINDICE,HT.DATAMOV)) AS DATAREF, ' +
          '               SUM(DECODE(HT.FLGENTRADA, 1, HT.VLRCOTAS, -HT.VLRCOTAS)) ' +
          '                  OVER (ORDER BY NVL(HT.DATAINDICE,HT.DATAMOV)) AS QUANTIDADE_COTA, ' +
          '                  IDTIPORESERVA ' +
          '          FROM HISTMOVRESERVA HT   ' +
          '         WHERE HT.IDTIPORESERVA IN (' + inttostr(iIDTIPORESERVA) + ')' + //and  ht.flgentrada = 1
          '         ORDER BY NVL(HT.DATAINDICE,HT.DATAMOV)  ' +
          '       ),  ' +
          '      CONTRIBUICOES AS ' +
          '       (SELECT LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV)) AS DATAREF, ' +
          '               MAX(NVL(HC.VALORINDICE,1)) AS INDICE,   ' +
          '               SUM(DECODE(HC.FLGENTRADA, 1, HC.VLRREAL, -HC.VLRREAL)) AS CONTRIBUICOES ' +
          '          FROM HISTMOVRESERVA HC INNER JOIN ' +
          '               TCODCONTRIBUICOES TCC ON  HC.IDCONTRIBUICAO = TCC.IDCONTRIBUICAO ' +
          '   					    AND HC.IDTIPORESERVA  = TCC.IDTIPORESERVA ' +
          '         GROUP BY LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV)) ' +
          '       ), ' +
          '      REVISOES AS ' +
          '       (SELECT LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV)) AS DATAREF, ' +
          '               SUM(DECODE(HC.FLGENTRADA, 1, HC.VLRREAL, -HC.VLRREAL) ) AS REVISOES ' +
          '          FROM HISTMOVRESERVA HC INNER JOIN ' +
          '               TCODREVISOES TCR ON  HC.IDCONTRIBUICAO = TCR.IDCONTRIBUICAO ' +
          '     	WHERE HC.IDTIPORESERVA IN (' + inttostr(iIDTIPORESERVA) + ')' +
          '         GROUP BY LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV))  ' +
          '       ), ' +
          '     TOTAL_LANCAMENTOS AS ( ' +
          '     SELECT DISTINCT ' +
          '     	TOTAL.IDTIPORESERVA, ' +
          '     	NVL(TOTAL.DATAREF,TINDICE.COTDATAFIM) AS DATAREF, ' +
          '     	CONTRIBUICOES.INDICE, ' +
          '     	TINDICE.COTVALOR, ' +
          '             TINDICE.NOME, '  +
          '     	TOTAL.QUANTIDADE_COTA, ' +
          '     	CONTRIBUICOES.CONTRIBUICOES, ' +
          '     	REVISOES.REVISOES ' +
          '       FROM TINDICE ' +
          '       LEFT JOIN TOTAL ON to_char(TINDICE.COTDATAFIM, ''yyyy/mm'') = to_char(TOTAL.DATAREF, ''yyyy/mm'') ' +
          '       FULL OUTER JOIN CONTRIBUICOES  ON to_char(CONTRIBUICOES.DATAREF, ''yyyy/mm'') = to_char(TOTAL.DATAREF, ''yyyy/mm'') ' +
          '       FULL OUTER JOIN REVISOES  ON to_char(REVISOES.DATAREF, ''yyyy/mm'') = to_char(TOTAL.DATAREF, ''yyyy/mm'') ' +
          '      WHERE TINDICE.COTDATAFIM >= TO_DATE(''31/12/2015'', ''DD/MM/YYYY'') ' +
          '     ), ' +
          '    CALCULO_TOTAL_SEM_SOMA AS ( ' +
          '     SELECT DISTINCT ' +
          '     	IDTIPORESERVA, ' +
          '     	DATAREF, ' +
          '     	INDICE, ' +
          '     	NOME, ' +
          '            	COTVALOR, ' +
          '     	QUANTIDADE_COTA, ' +
          '     	CONTRIBUICOES, ' +
          '     	REVISOES, ' +
          '     	CASE ROW_NUMBER() OVER (ORDER BY DATAREF) ' +
          '     			WHEN 1 THEN COTVALOR * QUANTIDADE_COTA ' +
	  '                	ELSE LAG(COTVALOR * QUANTIDADE_COTA) OVER (ORDER BY DATAREF) ' +
          '     			END ' +
          '     			AS TOTAL_SEM_SOMA ' +
          '       FROM TOTAL_LANCAMENTOS ' +
          '     ), ' +
          '     CALCULO_TOTAL_SEM_SOMA_META as ( SELECT DISTINCT ' +
          '     	IDTIPORESERVA, ' +
          '             NOME, '+
          '     	DATAREF, ' +
          '     	INDICE, ' +
          '     	NVL(COTVALOR,INDICE) AS COTVALOR, ' +
          '     	NVL(QUANTIDADE_COTA,0) AS QTDCOTAS, ' +
          '     	NVL(CONTRIBUICOES,0) AS CONTRIBUICOES, ' +
          '     	NVL(REVISOES,0)  AS REVISOES, ' +
          '     	CASE ROW_NUMBER() OVER (ORDER BY DATAREF) ' +
          '     			WHEN 1 THEN 0 ' +
          '     			ELSE NVL(TOTAL_SEM_SOMA,0)* (COTVALOR / LAG(COTVALOR) OVER (ORDER BY DATAREF) - 1) ' +
          '     			END ' +
          '     			AS META, ' +
          '     	TOTAL_SEM_SOMA ' +
          '       FROM CALCULO_TOTAL_SEM_SOMA ' +
          '       )  '  +
          '  SELECT DISTINCT ' +
          ' 	IDTIPORESERVA,   ' +
          ' 	NOME,             ' +
          ' 	DATAREF,          ' +
          ' 	INDICE,           ' +
          ' 	COTVALOR,         ' +
          ' 	QTDCOTAS,         ' +
          ' 	CONTRIBUICOES,    ' +
          ' 	REVISOES,         ' +
          ' 	round(META,2) AS META ,    ' +
          //' 	trunc(	CASE ROW_NUMBER() OVER (ORDER BY DATAREF) ' +
          //' 			WHEN 1 THEN NVL(TOTAL_SEM_SOMA,0) + NVL(CONTRIBUICOES,0) + NVL(REVISOES,0) + 0 ' +

          ' 	trunc(	CASE DATAREF ' +
          ' 			WHEN ' + QuotedStr(sDataIni) + ' THEN COTVALOR * QTDCOTAS ' +
          ' 			ELSE NVL(TOTAL_SEM_SOMA,0) + NVL(CONTRIBUICOES,0) + NVL(REVISOES,0) + META     ' +
          ' 			END  ' +
          ' 	,2)		AS TOTAL  ' +
          '   FROM CALCULO_TOTAL_SEM_SOMA_META ' +
          '   order by dataref ' ;
  end
  else
  begin
    sSql := ' WITH                                           ' +
            '  TINDICE AS                                                ' +
            '  (SELECT COTDATAFIM, COTVALOR,IDTIPORESERVA,NOME           ' +
            '   from RESERVAXPLANO RE INNER JOIN                         ' +
            '        COTACAOMOEDA CO ON RE.INDICEREAJUSTE = CO.MOECODIGO ' +
            '   WHERE IDTIPORESERVA in (' + inttostr(iIDTIPORESERVA) + ') ' +
            '  ),                                                        ' +
            '  TCODCONTRIBUICOES AS                                      ' +
            '  (select IDTIPORESERVA, IDCONTRIBUICAO                     ' +
            '   from RESERVAXCONTRIB                                     ' +
            '   WHERE IDTIPORESERVA IN (' + inttostr(iIDTIPORESERVA) + ')' +
            '  ),                                                        ' +
            '  TCODREVISOES AS                                           ' +
            '    (SELECT 736 AS IDCONTRIBUICAO FROM DUAL                 ' +
            '     UNION                                                  ' +
            '     SELECT 737 AS IDCONTRIBUICAO FROM DUAL                 ' +
            '    ),                                                      ' +
            '  TOTAL AS                                                  ' +
            '   (SELECT LAST_DAY(NVL(HT.DATAINDICE,HT.DATAMOV)) AS DATAREF,              ' +
            '           SUM(DECODE(HT.FLGENTRADA, 1, HT.VLRCOTAS, -HT.VLRCOTAS)) ' +
            '              OVER (ORDER BY NVL(HT.DATAINDICE,HT.DATAMOV)) AS QUANTIDADE_COTA,     ' +
            '              IDTIPORESERVA                                         ' +
            '      FROM HISTMOVRESERVA HT                                        ' +
            '     WHERE HT.IDTIPORESERVA IN (' + inttostr(iIDTIPORESERVA) + ')   ' +
            '     ORDER BY NVL(HT.DATAINDICE,HT.DATAMOV)                                        ' +
            '   ),                                                               ' +
            '  CONTRIBUICOES AS                                                  ' +
            '   (SELECT LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV)) AS DATAREF,                      ' +
            '           MAX(NVL(HC.VALORINDICE,1)) AS INDICE,                    ' +
            '           SUM(DECODE(HC.FLGENTRADA, 1, HC.VLRREAL, -HC.VLRREAL)) AS CONTRIBUICOES ' +
            '      FROM HISTMOVRESERVA HC INNER JOIN                                            ' +
            '           TCODCONTRIBUICOES TCC ON  HC.IDCONTRIBUICAO = TCC.IDCONTRIBUICAO        ' +
            '           					    AND HC.IDTIPORESERVA  = TCC.IDTIPORESERVA       ' +
            '     GROUP BY LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV))                                              ' +
            '   ),                                                                              ' +
            '  REVISOES AS                                                                      ' +
            '   (SELECT LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV)) AS DATAREF,                                     ' +
            '           SUM(DECODE(HC.FLGENTRADA, 1, HC.VLRREAL, -HC.VLRREAL) ) AS REVISOES     ' +
            '      FROM HISTMOVRESERVA HC INNER JOIN                                            ' +
            '           TCODREVISOES TCR ON  HC.IDCONTRIBUICAO = TCR.IDCONTRIBUICAO             ' +
            ' 	WHERE HC.IDTIPORESERVA IN (' + inttostr(iIDTIPORESERVA) + ')                    ' +
            '     GROUP BY LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV))                                              ' +
            '   ),                                                                              ' +
            '                                                                                   ' +
            ' TOTAL_LANCAMENTOS AS (                                  ' +
            ' SELECT DISTINCT                                         ' +
            ' 	TOTAL.IDTIPORESERVA,                                  ' +
            ' 	NVL(TOTAL.DATAREF,TINDICE.COTDATAFIM) AS DATAREF,     ' +
            ' 	CONTRIBUICOES.INDICE,                                 ' +
            ' 	TINDICE.COTVALOR,                                     ' +
            ' 	TINDICE.NOME,                                         ' +
            ' 	TOTAL.QUANTIDADE_COTA,                                ' +
            ' 	CONTRIBUICOES.CONTRIBUICOES,                          ' +
            ' 	REVISOES.REVISOES                                     ' +
            '   FROM TINDICE                                          ' +
            '   LEFT JOIN TOTAL ON to_char(TINDICE.COTDATAFIM, ''yyyy/mm'') = to_char(TOTAL.DATAREF, ''yyyy/mm'') ' +
            '   FULL OUTER JOIN CONTRIBUICOES  ON to_char(CONTRIBUICOES.DATAREF, ''yyyy/mm'') = to_char(TOTAL.DATAREF, ''yyyy/mm'') ' +
            '   FULL OUTER JOIN REVISOES  ON to_char(REVISOES.DATAREF, ''yyyy/mm'') = to_char(TOTAL.DATAREF, ''yyyy/mm'')           ' +
            '  WHERE TINDICE.COTDATAFIM >= TO_DATE(''31/12/2015'', ''DD/MM/YYYY'')          ' +
            ' ),                            ' +
            '                               ' +
            ' CALCULO_TOTAL_SEM_SOMA AS (   ' +
            ' SELECT DISTINCT               ' +
            ' 	IDTIPORESERVA,              ' +
            ' 	DATAREF,                    ' +
            ' 	INDICE,                     ' +
            ' 	COTVALOR,                   ' +
            ' 	NOME,                       ' +
            ' 	QUANTIDADE_COTA,            ' +
            ' 	CONTRIBUICOES,              ' +
            ' 	REVISOES,                   ' +
            ' 	CASE ROW_NUMBER() OVER (ORDER BY DATAREF) ' +
            ' 			WHEN 1 THEN COTVALOR * QUANTIDADE_COTA  ' +
            ' 			ELSE LAG(COTVALOR * QUANTIDADE_COTA) OVER (ORDER BY DATAREF) ' +
            ' 			END                           ' +
            ' 			AS TOTAL_SEM_SOMA          ' +
            '   FROM TOTAL_LANCAMENTOS                ' +
            ' ),                                      ' +
            '                                         ' +
            '  TCODCONTRIBUICOES_2 AS                 ' +
            '  (select IDTIPORESERVA, IDCONTRIBUICAO  ' +
            '   from RESERVAXCONTRIB                  ' +
            '   WHERE IDTIPORESERVA IN (' + inttostr(iIDTIPORESERVA2) + ') ' +
            '  ),                                     ' +
            '                                         ' +
            '  TOTAL_2 AS                             ' +
            '   (SELECT LAST_DAY(NVL(HT.DATAINDICE,HT.DATAMOV)) AS DATAREF,                      ' +
            '           SUM(DECODE(HT.FLGENTRADA, 1, HT.VLRCOTAS, -HT.VLRCOTAS)) ' +
            '              OVER (ORDER BY NVL(HT.DATAINDICE,HT.DATAMOV)) AS QUANTIDADE_COTA,     ' +
            '              IDTIPORESERVA                                         ' +
            '      FROM HISTMOVRESERVA HT                                        ' +
            '     WHERE HT.IDTIPORESERVA IN (' + inttostr(iIDTIPORESERVA2) + ')  ' +
            '     ORDER BY NVL(HT.DATAINDICE,HT.DATAMOV)                                         ' +
            '   ),                                                               ' +
            '  CONTRIBUICOES_2 AS                                                ' +
            '   (SELECT LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV)) AS DATAREF,                      ' +
            '           MAX(NVL(HC.VALORINDICE,1)) AS INDICE,                    ' +
            '           SUM(DECODE(HC.FLGENTRADA, 1, HC.VLRREAL, -HC.VLRREAL)) AS CONTRIBUICOES ' +
            '      FROM HISTMOVRESERVA HC INNER JOIN                                            ' +
            '           TCODCONTRIBUICOES_2 TCC ON  HC.IDCONTRIBUICAO = TCC.IDCONTRIBUICAO      ' +
            '           					    AND HC.IDTIPORESERVA  = TCC.IDTIPORESERVA       ' +
            '     GROUP BY LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV))                                              ' +
            '   ),                                                                              ' +
            '  REVISOES_2 AS                                                                    ' +
            '   (SELECT LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV)) AS DATAREF,                                     ' +
            '           SUM(DECODE(HC.FLGENTRADA, 1, HC.VLRREAL, -HC.VLRREAL) ) AS REVISOES     ' +
            '      FROM HISTMOVRESERVA HC INNER JOIN                                            ' +
            '           TCODREVISOES TCR ON  HC.IDCONTRIBUICAO = TCR.IDCONTRIBUICAO             ' +
            ' 	WHERE HC.IDTIPORESERVA IN (' + inttostr(iIDTIPORESERVA2) + ')                   ' +
            '     GROUP BY LAST_DAY(NVL(HC.DATAINDICE,HC.DATAMOV))                                              ' +
            '   ),                                                   ' +
            '                                                        ' +
            ' TOTAL_LANCAMENTOS_2 AS (                               ' +
            ' SELECT DISTINCT                                        ' +
            ' 	TOTAL_2.IDTIPORESERVA,                               ' +
            ' 	NVL(TOTAL_2.DATAREF,TINDICE.COTDATAFIM) AS DATAREF,  ' +
            ' 	CONTRIBUICOES_2.INDICE,                              ' +
            ' 	TINDICE.COTVALOR,                                    ' +
            ' 	TINDICE.NOME,                                        ' +
            ' 	TOTAL_2.QUANTIDADE_COTA,                             ' +
            ' 	CONTRIBUICOES_2.CONTRIBUICOES,                       ' +
            ' 	REVISOES_2.REVISOES                                  ' +
            '   FROM TINDICE                                         ' +
            '   LEFT JOIN TOTAL_2 ON to_char(TINDICE.COTDATAFIM, ''yyyy/mm'') = to_char(TOTAL_2.DATAREF, ''yyyy/mm'')                   ' +
            '   FULL OUTER JOIN CONTRIBUICOES_2  ON to_char(CONTRIBUICOES_2.DATAREF, ''yyyy/mm'') = to_char(TOTAL_2.DATAREF, ''yyyy/mm'') ' +
            '   FULL OUTER JOIN REVISOES_2  ON to_char(REVISOES_2.DATAREF, ''yyyy/mm'') = to_char(TOTAL_2.DATAREF, ''yyyy/mm'')           ' +
            '  WHERE TINDICE.COTDATAFIM >= TO_DATE(''31/12/2015'', ''DD/MM/YYYY'')            ' +
            ' ),                            ' +
            '                               ' +
            ' CALCULO_TOTAL_SEM_SOMA_2 AS ( ' +
            ' SELECT DISTINCT               ' +
            ' 	IDTIPORESERVA,              ' +
            ' 	DATAREF,                    ' +
            ' 	INDICE,                     ' +
            ' 	COTVALOR,                   ' +
            ' 	NOME,                       ' +
            ' 	QUANTIDADE_COTA,            ' +
            ' 	CONTRIBUICOES,              ' +
            ' 	REVISOES,                   ' +
            ' 	CASE ROW_NUMBER() OVER (ORDER BY DATAREF)                     ' +
            ' 			WHEN 1 THEN COTVALOR * QUANTIDADE_COTA                      ' +
            ' 			ELSE LAG(COTVALOR * QUANTIDADE_COTA) OVER (ORDER BY DATAREF)' +
            ' 			END                                                         ' +
            ' 			AS TOTAL_SEM_SOMA                                        ' +
            '   FROM TOTAL_LANCAMENTOS_2                                            ' +
            ' ),                ' +
            '                   ' +
            '             PROVISAO_1_META AS (                 ' +
            ' SELECT DISTINCT                                  ' +
            ' 	IDTIPORESERVA,                                 ' +
            ' 	NOME,                                          ' +
            ' 	DATAREF,                                       ' +
            ' 	INDICE,                                        ' +
            ' 	NVL(COTVALOR,INDICE) AS COTVALOR,              ' +
            ' 	NVL(QUANTIDADE_COTA,0) AS QTDCOTAS,            ' +
            ' 	NVL(CONTRIBUICOES,0) AS CONTRIBUICOES,         ' +
            ' 	NVL(REVISOES,0) AS REVISOES,                   ' +
            ' 	CASE ROW_NUMBER() OVER (ORDER BY DATAREF)      ' +
            ' 			WHEN 1 THEN 0                  ' +
            ' 			ELSE NVL(TOTAL_SEM_SOMA,0)* (COTVALOR / LAG(COTVALOR) OVER (ORDER BY DATAREF) - 1) ' +
            ' 			END       ' +
            ' 			AS META,  ' +
            ' 	TOTAL_SEM_SOMA            ' +
            '   FROM CALCULO_TOTAL_SEM_SOMA   ' +
            ' ),  ' +
            '                   ' +
            ' PROVISAO_1 AS (   ' +
            ' SELECT DISTINCT   ' +
            ' 	IDTIPORESERVA,  ' +
            ' 	NOME,           ' +
            ' 	DATAREF,        ' +
            ' 	INDICE,         ' +
            ' 	COTVALOR,                 ' +
            ' 	QTDCOTAS,               ' +
            ' 	CONTRIBUICOES,            ' +
            ' 	REVISOES,                      ' +
            ' 	ROUND(META,2)		AS META,                                                                           ' +
            ' 	trunc(	CASE DATAREF                                          ' +
            ' 			WHEN  ' + QuotedStr(sDataIni) + ' THEN COTVALOR * QTDCOTAS     ' +
            ' 			ELSE NVL(TOTAL_SEM_SOMA,0) + NVL(CONTRIBUICOES,0) + NVL(REVISOES,0) + META  ' +
            ' 			END                                        ' +
            ' 	,2)		AS TOTAL                                   ' +
            '   FROM PROVISAO_1_META                        ' +
            ' ),                                                   ' +
            '             PROVISAO_2_META AS (                     ' +
            ' SELECT DISTINCT                                       ' +
            ' 	IDTIPORESERVA,                                     ' +
            ' 	NOME,                                              ' +
            ' 	DATAREF,                                           ' +
            ' 	INDICE,                                            ' +
            ' 	NVL(COTVALOR,INDICE) AS COTVALOR,                  ' +
            ' 	NVL(QUANTIDADE_COTA,0) AS QTDCOTAS,                ' +
            ' 	NVL(CONTRIBUICOES,0) AS CONTRIBUICOES,             ' +
            ' 	NVL(REVISOES,0) AS REVISOES,                       ' +
            ' 	CASE ROW_NUMBER() OVER (ORDER BY DATAREF)          ' +
            ' 			WHEN 1 THEN 0                      ' +
            ' 			ELSE NVL(TOTAL_SEM_SOMA,0)* (COTVALOR / LAG(COTVALOR) OVER (ORDER BY DATAREF) - 1)' +
            ' 			END ' +
            ' 			AS META, ' +
            ' 	TOTAL_SEM_SOMA              ' +
            '   FROM CALCULO_TOTAL_SEM_SOMA_2  ' +
            ' ), ' +
            '                                                      ' +
            ' PROVISAO_2 AS (                                      ' +
            ' SELECT DISTINCT                                      ' +
            ' 	IDTIPORESERVA,                                     ' +
            ' 	NOME,                                              ' +
            ' 	DATAREF,                                           ' +
            ' 	INDICE,                                            ' +
            ' 	COTVALOR,                  ' +
            ' 	QTDCOTAS,                ' +
            ' 	CONTRIBUICOES,             ' +
            ' 	REVISOES,                       ' +
            ' 	ROUND(META,2)		AS META,                                                                           ' +
            ' 	trunc(	CASE DATAREF                                          ' +
            ' 			WHEN  ' + QuotedStr(sDataIni) + ' THEN COTVALOR * QTDCOTAS     ' +
            ' 			ELSE NVL(TOTAL_SEM_SOMA,0) + NVL(CONTRIBUICOES,0) + NVL(REVISOES,0) + META  ' +
            ' 			END                                            ' +
            ' 	,2)		AS TOTAL                                       ' +
            '   FROM PROVISAO_2_META                          ' +
            ' )                                                        ' +
            '                                                          ' +
            ' SELECT 	                                               ' ;

    if iIDTIPORESERVA2 = 212 then
    begin
      sSql := sSql + ' 	''CALCULADO PELA DIFERENÇA ENTRE OS IDTIPORESERVA 183 E 212'' AS IDTIPORESERVA,    ' +
                     ' 	''SD14 Participante Patrocinador'' AS NOME,             ';
    end;
    if iIDTIPORESERVA2 = 213 then
    begin
      sSql := sSql + ' 	''CALCULADO PELA DIFERENÇA ENTRE OS IDTIPORESERVA 187 E 213'' AS IDTIPORESERVA,    ' +
                     ' 	''SD15 Participante Patrocinador'' AS NOME,             ';
    end;
    if iIDTIPORESERVA2 = 214 then
    begin
      sSql := sSql + ' 	''CALCULADO PELA DIFERENÇA ENTRE OS IDTIPORESERVA 197 E 214'' AS IDTIPORESERVA,    ' +
                     ' 	''SD16 Participante Patrocinador'' AS NOME,             ';
    end;

    sSql := sSql + ' 	P1.DATAREF,                                    ' +
            ' 	P1.INDICE,                                             ' +
            ' 	P1.COTVALOR,                                           ' +
            ' 	P1.QTDCOTAS - P2.QTDCOTAS AS QTDCOTAS,                 ' +
            ' 	P1.CONTRIBUICOES - P2.CONTRIBUICOES AS CONTRIBUICOES,  ' +
            ' 	P1.REVISOES - P2.REVISOES AS REVISOES,                 ' +
            ' 	P1.META - P2.META AS META,                             ' +
            ' 	P1.TOTAL - P2.TOTAL AS TOTAL 	                       ' +
            '   FROM PROVISAO_1 P1                                     ' +
            '   inner join  PROVISAO_2 P2 ON to_char(P1.DATAREF, ''yyyy/mm'') = to_char(P2.DATAREF, ''yyyy/mm'')   ' +
            '   order by P1.dataref                                    ' ;




  end;

  qryProvReservas.Close;
  qryProvReservas.SQL.Clear;
  qryProvReservas.Params.Clear;
  qryProvReservas.Sql.Add(sSql);
  qryProvReservas.Open;

  qryProvReservas.Filtered:= false;
  qryProvReservas.Filter := ' (DATAREF >= '+ QuotedStr(FormatDateTime('dd/MM/YYYY', dtDataInicio.Date)) + ' AND DATAREF <= '+ QuotedStr(FormatDateTime('dd/MM/YYYY', dtDataFim.Date)) +')';
  qryProvReservas.Filtered:= true;

end;

procedure TRelProvConst.BtnGerarProvisaoClick(Sender: TObject);
begin
  inherited;
  //leandro sig127397 inicio
  MontaArquivoExcelProvisao('SD',dtDataInicio.Text, dtDataFim.Text);
  MontaArquivoExcelProvisao('NSD',dtDataInicio.Text, dtDataFim.Text);
  //leandro sig127397 fim
end;

end.

