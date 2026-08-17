unit fConsHistContrAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConsultar, Wwdotdot, Wwdbcomb, Db, DBTables, Wwquery, StdCtrls, Mask,
  wwdbedit, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Tabs, ComCtrls, MAHlpBtn,
  Buttons, ExtCtrls, wwdblook, MskEdDlg, DBCtrls, Spin,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppCtrls,
  ppVar, ppPrnabl, ppClass, ppBands, ppCache, ppProd, ppReport, MontaSelect;

type
  TfrmConsultContr = class(TfrmConsultar)
    qryhistcontr: TwwQuery;
    qryhistcontrVALORESPERADO: TFloatField;
    qryhistcontrVALORRECEBIDO: TFloatField;
    qryhistcontrNOME: TStringField;
    qryhistcontrMES: TStringField;
    qryhistcontrMESCOBRANCA: TStringField;
    qryhistcontrDATA: TDateTimeField;
    qryhistcontrPLANASS: TStringField;
    qryhistcontrPLANPREV: TStringField;
    qryhistcontrNOME_1: TStringField;
    qryhistcontrCONTRIB: TStringField;
    qryhistcontrDESCRICAO: TStringField;
    qryhistcontrNOMEREGRA: TStringField;
    grplegenda: TGroupBox;
    Shape3: TShape;
    Label10: TLabel;
    Shape4: TShape;
    Label11: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Label14: TLabel;
    Label12: TLabel;
    Shape1: TShape;
    Label16: TLabel;
    qryhistcontrSIT: TStringField;
    Shape2: TShape;
    Label17: TLabel;
    Shape7: TShape;
    Label18: TLabel;
    qryhistcontrDATAPREVISAO: TDateTimeField;
    Splitter1: TSplitter;
    qryhistcontrDESCRICAO_1: TStringField;
    qryTotais: TwwQuery;
    qryTotaisTOTESPERADO: TFloatField;
    qryTotaisTOTRECEBIDO: TFloatField;
    qryhistcontrSITPLANOPREV: TStringField;
    qryhistcontrMATRICULA: TStringField;
    ppBDEPipeline: TppBDEPipeline;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabelTitulo: TppLabel;
    ppLabelTipo: TppLabel;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel9: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabelSistema: TppLabel;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppLabel10: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    qryhistcontrSITUACAO: TStringField;
    qryhistcontrSTATUS: TStringField;
    Panel2: TPanel;
    Label21: TLabel;
    edTotEsperado: TEdit;
    Label22: TLabel;
    edTotRecebido: TEdit;
    btnImprimir: TButton;
    PageControl1: TPageControl;
    tbhst: TTabSheet;
    rdgpagador: TRadioGroup;
    rddiverg: TRadioGroup;
    GroupBox3: TGroupBox;
    cmb1: TComboBox;
    spin1: TSpinEdit;
    tbsFiltros: TTabSheet;
    Panel5: TPanel;
    qryPlano: TwwQuery;
    qrySitPart: TwwQuery;
    qryPatro: TwwQuery;
    qryhistcontrPATROCINADORA: TStringField;
    pnlPatro: TPanel;
    GroupBox2: TGroupBox;
    cbSituacao: TComboBox;
    GroupBox4: TGroupBox;
    dblkPlano: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    dblkPatro: TwwDBLookupCombo;
    rgrFiltro: TRadioGroup;
    pnlParticip: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNomeParticip: TEdit;
    btnLocalizar: TBitBtn;
    edtNomePatro: TEdit;
    edtMatricula: TEdit;
    edtNomePlanAss: TEdit;
    Label6: TLabel;
    edtNumInscricao: TEdit;
    Label5: TLabel;
    msParticip: TMontaSelect;
    MontaSelect: TMontaSelect;
    qryhistcontrVLRALTERADOR: TFloatField;
    qryhistcontrTOTALRECEBIDO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure dbgrdResultadoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure qryhistcontrAfterOpen(DataSet: TDataSet);
    procedure rgrFiltroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
    Function ValidaMesCobranca(MM:String):Boolean;
    procedure FazConsulta;
  public
    pano : integer;

    iIdPessoa,
    iIdPessjur,
    iIdPlanoPrev,
    iIdPlanAss,
    iSeqProposta     : Integer;

    sNomeParticip,
    sNomePatro,
    sMatricula,
    sNumInscricao,
    sNomePlanoAssist : String;

    { Public declarations }
  end;

var
  frmConsultContr: TfrmConsultContr;
  iradiogroup : integer;

implementation

uses uMensErro, UAdmAss;

{$R *.DFM}

Function TfrmConsultContr.ValidaMesCobranca(MM:String):Boolean;
Var qryTmp: TQuery;
begin
  Result:=False;
  If cmb1.text <> ''  then
  begin
    qryTmp:=TQuery.Create(Application);
    qryTmp.DatabaseName:='BaseDados';
    qryTmp.SQL.Clear;
    qryTmp.SQL.Add(
      'SELECT DISTINCT MESCOBRANCA FROM HSTCONTRIBASS '+
      ' WHERE MESCOBRANCA = '+MM);
    qryTmp.Open;
    Result:=Not qryTmp.IsEmpty;
    qryTmp.Close;
    qryTmp.Free;
  end ;
end;

procedure TfrmConsultContr.FazConsulta;
var
   sSql1   : string;
begin
  qryhistcontr.close;
  qryhistcontr.sql.clear;

  //Procurar os benefícios dos beneficiários e dos assistidos
  sSQL1:= 'WHERE (AA.IDPLANASS = BB.IDPLANASS) AND ' +
          '(AA.IDCONTASS = BB.IDCONTASS) AND ' +
          '(AA.IDTITULAR   = DD.IDPESSOA) AND ' +
          '(AA.IDPESSJUR   = DD.IDPESSJUR) AND ' +
          '(AA.IDPESSJUR = PATRO.IDPESSOA) AND '+
          '(AA.IDPLANOPREV = BB.IDPLANOPREV) AND ' +
          '(DD.IDPESSOA =  CC.IDPESSOA) AND ' +
          '(CT.IDCONTASS =  BB.IDCONTASS) AND ' +
          '(BB.IDTITULAR =  DD.IDPESSOA) AND ' +
          '(AA.IDPLANASS = BB.IDPLANASS) AND ' +
          '(BB.IDCONTASS = CT.IDCONTASS) AND ' +
          '(AA.IDPESSJUR = BB.IDPESSJUR) AND ' +
          '(AA.IDTITULAR = BB.IDTITULAR) AND ' +
          '(AA.IDDEPENDENTE = BB.IDDEPENDENTE) AND ' +
          '(PL.IDPLANASS = AA.IDPLANASS) AND ' +
          '(PV.IDPLANOPREV = AA.IDPLANOPREV) AND ' +
          '(P1.IDPESSOA =  AA.IDDEPENDENTE) AND ' +
          '(CT.IDPLANASS =  AA.IDPLANASS) AND ' +
          '(AA.IDMOTIVO =  MT.IDMOTIVO) AND ' +
          '(PAT.IDPESSJUR =  AA.IDPESSJUR) AND ' +
          '(PAT.IDPESSOA = CC.IDPESSOA) AND ' +
          '(PAT.IDPLANASS = PL.IDPLANASS) AND ' +
          '(PAT.IDPLANOPREV = PV.IDPLANOPREV) AND ' +
          '(PT.CODPORTFORMA(+) = AA.CODPORTFORMA) AND ' +
          '(CT.IDCONTASS = CTO.IDCONTRIBUICAO) AND ' +
          '(AA.IDREGRA = REGRA.IDREGRA(+)) AND '+
          '(AA.IDPESSJUR = PP.IDPESSJUR) AND '+
          '(AA.IDPLANOPREV = PP.IDPLANOPREV) AND '+
          '(AA.IDTITULAR = PP.IDPESSOA) AND '+
          '(PP.IDSITPART = ST.IDSITPART) AND '+
          '(PP.IDSITPLANOPREV = SPV.IDSITPLANOPREV) AND '+
          '(AA.SEQPROPOSTA  = HA.SEQPROPOSTA(+)) AND '+
          '(AA.MES          = HA.MES(+)) AND '+
          '(AA.IDMOTIVO     = HA.IDMOTIVO(+)) AND '+
          '(AA.MESCOBRANCA  = HA.MESCOBRANCA(+)) AND '+
          '(AA.IDPLANASS    = HA.IDPLANASS(+)) AND '+
          '(AA.IDPLANOPREV  = HA.IDPLANOPREV(+)) AND '+
          '(AA.IDPESSJUR    = HA.IDPESSJUR(+)) AND '+
          '(AA.IDTITULAR    = HA.IDTITULAR(+)) AND '+
          '(AA.IDDEPENDENTE = HA.IDDEPENDENTE(+)) AND '+
          '(AA.IDCONTASS    = HA.IDCONTASS(+)) AND ';

  grpResultado.Caption:='RESULTADO';

  { Se  as datas inicial e final estiverem preenchidas}
  If Trim(cmb1.text) <> '' then
  begin
    sSQL1 := sSQL1 + '(AA.MESCOBRANCA = '+
    QuotedStr(IntToStr(spin1.value)+'/'+RetornaMes(cmb1.text))+')  AND ';
  end ;

  If rgrFiltro.ItemIndex = 0
   Then Begin
     If Trim(dblkPatro.Text) <> ''
      Then Begin
        sSQL1 := sSql1 + '(AA.IDPESSJUR =' +
          qryPatro.FieldByName('IDPESSOA').AsString+') AND ' ;
        grpResultado.Caption:=grpResultado.Caption+' - Patrocinadora '+
          qryPatro.FieldByName('NOME').AsString;
      end;

     If Trim(dblkPlano.Text) <> ''
      Then Begin
        sSQL1 := sSQL1 + '(AA.IDPLANASS = ' +
                 qryPlano.FieldByName('IDPLANASS').AsString+') AND ' ;
        grpResultado.Caption := grpResultado.Caption+' - Plano '+
                                qryPlano.FieldByName('NOME').AsString;
      End;

     Case cbSituacao.ItemIndex Of
       1: Begin
            sFlgInterno:='AS';
            grpResultado.Caption:=grpResultado.Caption+' - Situação "ASSISTIDO"';
          End;
       2: Begin
            sFlgInterno:='AT';
            grpResultado.Caption:=grpResultado.Caption+' - Situação "ATIVO"';
          End;
       3: Begin
            sFlgInterno:='MA';
            grpResultado.Caption:=grpResultado.Caption+' - Situação "MANUTENIDO TOTAL"';
          End;
       4: Begin
            sFlgInterno:='MT';
            grpResultado.Caption:=grpResultado.Caption+' - Situação "MANUTENIDO PARCIAL"';
          End;
       5: sFlgInterno:='99';
       else sFlgInterno:='';
     end; {Case}

     If  sFlgInterno<>''
      Then sSQL1 := sSQL1 + '(ST.FLGINTERNO = ' +QuotedStr(sFlgInterno)+') AND ';
   End
   Else Begin
    If Trim(sMatricula) <> '' then
      sSQL1 := sSql1 + '(DD.MATRICULA = '+ QuotedStr(sMatricula) +') AND ' ;

    If Trim(sNumInscricao) <> '' then
      sSQL1 := sSQL1 + '(PP.INSCRICAONUMERO = '+ QuotedStr(sNumInscricao) +') AND ';

    If Trim(sNomeParticip) <> '' then
      sSQL1 := sSql1 + ' (UPPER(CC.NOME) = UPPER('+ QuotedStr(sNomeParticip) +')) AND ' ;

    If rgrFiltro.ItemIndex = 1 then
     grpResultado.Caption:=grpResultado.Caption+' - CONSULTA INDIVIDUAL ';
   End;



  If rdgpagador.itemindex = 0 then
     sSQL1 := sSQL1 + ' (CT.PAGADOR = ''C'') AND ';

  If rdgpagador.itemindex = 1 then
     sSQL1 := sSQL1 + ' (CT.PAGADOR = ''P'') AND ';

  Case rdDiverg.itemindex of
    0: sSQL1:= sSQL1 + ' (AA.SITRECEBIMENTO = ''0'') AND ';
    1: sSQL1:= sSQL1 + ' (AA.SITRECEBIMENTO = ''1'') AND ';
    2: sSQL1:= sSQL1 + ' (AA.SITRECEBIMENTO = ''2'') AND ';
    3: sSQL1:= sSQL1 + ' (AA.SITRECEBIMENTO = ''3'') AND ';
    4: sSQL1:= sSQL1 + ' (AA.SITRECEBIMENTO = ''4'') AND ';
    5: sSQL1:= sSQL1 + ' (AA.SITRECEBIMENTO = ''5'') AND ';
  end;

  if sSQL1 <> '' then
    sSQL1 := Copy(sSQL1, 1, Length(sSQL1)-5);

  qryhistcontr.sql.clear;
  qryhistcontr.sql.add('SELECT DD.MATRICULA,CC.NOME,AA.MES,AA.MESCOBRANCA,'+
                      '       AA.VALORESPERADO, PATRO.NOME AS PATROCINADORA,'+
                      '       AA.VALORRECEBIDO,AA.DATA,PL.NOME PLANASS, '+
                      '       PV.NOME PLANPREV,P1.NOME,CTO.NOME CONTRIB, '+
                      '       MT.DESCRICAO,PT.DESCRICAO,REGRA.NOMEREGRA, '+
                      '       AA.SITRECEBIMENTO SIT, AA.DATAPREVISAO, '+
                      '       ST.DESCRICAO AS SITUACAO, '+
                      '       SPV.DESCRICAO SITPLANOPREV, '+
                      '       DECODE(AA.SITRECEBIMENTO,0,''NÃO ENVIADA'','+
                      '       1,''NÃO RECEBIDA'',2,''RECEBIDA'','+
                      '       3,''DIVERGENTE'',4,''PAGO EM ATRASO'','' '') AS STATUS, '+
                      '       NVL(DECODE(HA.FLGTIPO,''A'', HA.VLRALTERADOR, -HA.VLRALTERADOR),0) VLRALTERADOR, '+
                      '       NVL(AA.VALORRECEBIDO,0)+NVL(DECODE(HA.FLGTIPO,''A'', HA.VLRALTERADOR, -HA.VLRALTERADOR),0) AS TOTALRECEBIDO '+
                      'FROM   HSTCONTRIBASS AA,CONTASS BB,MOTIVO MT,CONTRIBASS CT,'+
                      '       PLANASS PL,PLANPREV PV,PESSOA P1,PESSOA CC,ELEGPATRO DD,'+
                      '       PESSOA PATRO, PARTASS PAT,PORTADORFORMA PT,CONTRIBUICAO CTO,'+
                      '       REGRA, PARTPREVPLAN PP, SITPART ST, SITPLANOPREV SPV, ' +
                      '       HSTATRASOCONTASS HA '+
                      sSql1 + ' ORDER BY PATRO.NOME, AA.MESCOBRANCA, CC.NOME, P1.NOME');

  { Executar query com condicoes especificadas pelo usuario }
  try
    qryhistcontr.Open;
  except
    on E:EDBEngineError do
    begin
       MostrarErro(E);
       Exit;
    end;
  end;

  // Calcular os valores Total Esperado e Total Recebido
  With qryTotais do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT NVL(SUM(AA.VALORESPERADO),0)+NVL(SUM(HA.VLRALTERADOR),0) AS TOTESPERADO, '+
            '       NVL(SUM(AA.VALORRECEBIDO),0)+NVL(SUM(HA.VLRALTERADOR),0) AS TOTRECEBIDO '+
            'FROM   HSTCONTRIBASS AA,CONTASS BB,MOTIVO MT,CONTRIBASS CT, '+
            '       PLANASS PL,PLANPREV PV,PESSOA P1,PESSOA CC,ELEGPATRO DD, '+
            '       PESSOA PATRO,PARTASS PAT,PORTADORFORMA PT,CONTRIBUICAO CTO,REGRA, '+
            '       PARTPREVPLAN PP, SITPART ST, SITPLANOPREV SPV, HSTATRASOCONTASS HA ' +
            sSql1);
    try
      Open;
    except
      on E:EDBEngineError do
      begin
         MostrarErro(E);
         Exit;
      end;
    end;
    if not IsEmpty then
    begin
      edTotEsperado.Text := FormatFloat('#,##0.00',FieldByName('TotEsperado').AsFloat);
      edTotRecebido.Text := FormatFloat('#,##0.00',FieldByName('TotRecebido').AsFloat);
    end
    else
    begin
      edTotEsperado.Text := '';
      edTotRecebido.Text := '';
    end;
  end;
end;

procedure TfrmConsultContr.FormCreate(Sender: TObject);
begin
  inherited;
  qryhistcontr.close;
  RetornaDataCorr(cmb1, spin1);
  qryPatro.Open;
  qryPlano.Open;
  cbSituacao.ItemIndex:=0;
end;

procedure TfrmConsultContr.dbgrdResultadoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
var
  I : Byte;
begin
  inherited;
  If rddiverg.itemindex = 6 then
  begin
    If Trim(qryhistcontr.FieldByName('SIT').AsString) <> '' then
    begin
      I:= qryhistcontr.FieldByName('SIT').AsInteger;
      Case I of
        0: begin
             ABrush.Color := clWindow;
             AFont.Color  := clWindowText;
             If highlight then
             begin
               ABrush.Color := clWindow;
               AFont.Color  := clWindowText;
             end;
           end;
        1: begin
             ABrush.Color := clTeal;
             AFont.Color  := clWindow;
             If highlight then
             begin
               ABrush.Color := clTeal;
               AFont.Color  := clWindow;
             end;
           end;
        2: begin
             ABrush.Color := clGray;
             AFont.Color  := clWindow;
             If highlight then
             begin
               ABrush.Color := clGray;
               AFont.Color  := clWindow;
             end;
           end;
        3: begin
             ABrush.Color := clMaroon;
             AFont.Color  := clWindow;
             If highlight then
             begin
               ABrush.Color := clMaroon;
               AFont.Color  := clWindow;
             end;
           end;
        4: begin
             ABrush.Color := clOlive;
             AFont.Color  := clWindow;
             If highlight then
             begin
               ABrush.Color := clOlive;
               AFont.Color  := clWindowtext;
             end;
           end;
        5: begin
             ABrush.Color := clLime;
             AFont.Color  := clWindowText;
             If highlight then
             begin
               ABrush.Color := clLime;
               AFont.Color  := clWindowtext;
             end;
           end;
      end;//case
    end;//if
  end;//if
end;

procedure TfrmConsultContr.bbSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultContr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TfrmConsultContr.bbtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultContr.bbtnConsultarClick(Sender: TObject);
Var bConsultar: Boolean;
begin
  anmLupa.Active := true;
  edTotEsperado.Text := '';
  edTotRecebido.Text := '';
  bConsultar:=False;

  If rgrFiltro.ItemIndex = 0
   Then Begin  // Executa Críticas do filtro de patrocinadora
     If (cbSituacao.ItemIndex = -1) And
        (Trim(dblkPatro.Text) = '') And
        (Trim(dblkPlano.Text) = '')
      Then Begin
         MsgDlg('Marque ao menos um filtro para a operação.','Erro',mtError,[mbOK],0);
         PageControl1.ActivePage := tbsFiltros;
         pnlPatro.BringToFront;
         Exit;
      End;
   End
   Else Begin
     If Trim(edtNomeParticip.Text) = ''
      Then Begin
         MsgDlg('Selecione o participante a ser filtrado.','Erro',mtError,[mbOK],0);
         PageControl1.ActivePage := tbsFiltros;
         pnlParticip.BringToFront;
         Exit;
      End;
   End;

  If (ValidaMesCobranca(QuotedStr(IntToStr(spin1.value)+'/'+RetornaMes(cmb1.text))))
  then begin
    FazConsulta;
  end else MsgDlg('O Mês de Cobrança escolhido,'+#13+
                   'não existe no histórico de cobranças!',
                    'Atenção',mtInformation,[mbOk,mbHelp],0);

  If MontaSelect.RetornouValor then
  begin
    MontaSelect.ValoresChave[0]:='';
    MontaSelect.ValoresChave[1]:='';
    MontaSelect.ValoresChave[2]:='';
    MontaSelect.ValoresChave[3]:='';
    MontaSelect.Filtro.Clear;
    MontaSelect.Filtro.Add('PT.IDPESSOA = PV.IDPESSOA');
    MontaSelect.Filtro.Add('PT.IDPESSOA = EL.IDPESSOA');
    MontaSelect.Filtro.Add('PT.IDPESSJUR = EL.IDPESSJUR');
    MontaSelect.Filtro.Add('PT.IDPESSJUR = PJ.IDPESSOA');
    MontaSelect.Filtro.Add('PT.IDPESSOA = PE.IDPESSOA');
    MontaSelect.Filtro.Add('PV.IDPESSOA = EL.IDPESSOA');
    MontaSelect.Filtro.Add('PT.IDPLANASS = PL.IDPLANASS');
    MontaSelect.Filtro.Add('PT.IDPESSOA = HT.IDTITULAR');
    MontaSelect.Filtro.Add('PT.IDPLANASS = HT.IDPLANASS');
    MontaSelect.Filtro.Add('PT.IDPESSJUR = HT.IDPESSJUR');
    MontaSelect.Filtro.Add('PV.IDSITPART = ST.IDSITPART');
    MontaSelect.Filtro.Add('PV.FLGDESATIVADO = 0');
  end;
  anmLupa.Active := false;
end;

procedure TfrmConsultContr.btnImprimirClick(Sender: TObject);
begin
  inherited;
  ppLabelTipo.Caption:='Mensalidades '+
   rddiverg.Items[rddiverg.ItemIndex];
 ppReport.Print;
end;

procedure TfrmConsultContr.qryhistcontrAfterOpen(DataSet: TDataSet);
begin
  inherited;
  btnImprimir.Enabled:=Not qryHistContr.IsEmpty;
end;

procedure TfrmConsultContr.rgrFiltroClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tbsFiltros;
  If rgrFiltro.ItemIndex = 0
   Then pnlPatro.BringToFront
   Else pnlParticip.BringToFront;
end;

procedure TfrmConsultContr.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tbhst;
  rgrFiltro.ItemIndex := 0;
  pnlPatro.BringToFront;
end;

procedure TfrmConsultContr.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  msParticip.Executar;

  If msParticip.RetornouValor
   Then Begin
     iIdPessoa             := StrToInt(msParticip.ValoresChave[0]);
     iIdPessjur            := StrToInt(msParticip.ValoresChave[1]);
     iIdPlanoPrev          := StrToInt(msParticip.ValoresChave[2]);
     iIdPlanAss            := StrToInt(msParticip.ValoresChave[3]);
     iSeqProposta          := StrToInt(msParticip.ValoresChave[4]);
     sNomeParticip         := msParticip.ValoresChave[5];
     sNomePatro            := msParticip.ValoresChave[6];
     sMatricula            := msParticip.ValoresChave[7];
     sNumInscricao         := msParticip.ValoresChave[9];
     sNomePlanoAssist      := msParticip.ValoresChave[10];

     edtNomeParticip.Text  := msParticip.ValoresChave[5];
     edtNomePatro.Text     := msParticip.ValoresChave[6];
     edtMatricula.Text     := msParticip.ValoresChave[7];
     edtNumInscricao.Text  := msParticip.ValoresChave[9];
     edtNomePlanAss.Text   := msParticip.ValoresChave[10];
   End;
end;

end.


