// Alterações:
{-------------------------------------------------------------------------------
Autor(a)  : Thiago Melo
Data      : 21/06/2012
Pendência : SOL 182322 Kintana 1705526
Rotina    : bbtnProcurarClick, Benefícios
Descricao : ERRO FUNCIONALIDADE HISTORICO DE PAGAMENTO DE BENEFÍCIOS
            Foi corrigida a Select para que ficasse igual a anterior ao SOL 180483
--------------------------------------------------------------------------------
Autor(a)  : Thiago Melo
Data      : 25/05/2012
Pendência : SOL 180483 Kintana 1669173
Rotina    : bbtnProcurarClick, Benefícios
Descricao : AJUSTES NA FUNCIONALIDADE HISTORIO DE PAGAMENTOS DE BENEFÍCIOS
--------------------------------------------------------------------------------
Autor(a)  : Otacilio Aquino
Data      : 21/12/2011
Pendência : SOL 136386/7381 Kintana 1525155
Rotina    : bbtnProcurarClick
Descricao : Alteração na consulta de agrupamento.
--------------------------------------------------------------------------------
Autor(a)  : Marcos Merola
Data      : 13/09/2010
Pendência : SOL 136386/4901 Kintana 1278330
Rotina    : BtnProcura
Descricao : Implementação de Pesquisa de Historicos Pagos solicitado pela Getif.
--------------------------------------------------------------------------------}

unit FConsHistPagBeneficio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, Spin, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  FPreview, MontaSelect, QExport3Dialog, Mask, CMDataTransf, DBCtrls,
  TB97Ctls, fcLabel, CmEventosCadastro, ImgList, DBGrids;

type
  TfrmConsHistPagBeneficio = class(TfrmSairAjuda)
    pnlTop: TPanel;
    pnlClient: TPanel;
    ToolbarSep971: TToolbarSep97;
    bbtnExportar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qrybeneficio: TwwQuery;
    edmatricula: TEdit;
    Label15: TLabel;
    ednome: TEdit;
    Label13: TLabel;
    edcpf: TEdit;
    Label7: TLabel;
    qryplano: TwwQuery;
    Label35: TLabel;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    grpMesAnoCob: TGroupBox;
    cmbMesCobr: TComboBox;
    spedAnoCobr: TSpinEdit;
    bbtnProcurarMatricula: TBitBtn;
    MontaSelect: TMontaSelect;
    bbtnLimpa: TBitBtn;
    bbtnProcurar: TBitBtn;
    bt_Imprime: TBitBtn;
    cbRubContr: TCheckBox;
    cbRubBenef: TCheckBox;
    qeHistPagBeneficio: TQExport3Dialog;
    cbAgrupaMesRef: TCheckBox;
    edPrevidenciario: TEdit;
    ImlPadrao: TImageList;
    dbgrdResultado: TwwDBGrid;
    QryAux: TwwQuery;
    wwDataSource1: TwwDataSource;
    QryAux1: TwwQuery;
    vwDataSource2: TDataSource;
    dbgrdResultado1: TwwDBGrid;
    QryAuxMES: TStringField;
    QryAuxVALPAGBENEF: TFloatField;
    QryAuxVALPAGCONTRIB: TFloatField;
    QryAux1MESREF: TStringField;
    QryAux1MESCOBR: TStringField;
    QryAux1DESCRUBBENEF: TStringField;
    QryAux1RUBBENEF: TStringField;
    QryAux1VALPAGBENEF: TFloatField;
    QryAux1DESCRUBCONTRIB: TStringField;
    QryAux1RUBCONTRIB: TStringField;
    QryAux1VALPAGCONTRIB: TFloatField;
    wwDataSource3: TwwDataSource;
    dbGrdBeneficio: TwwDBGrid;
    procedure bbtnLimpaClick(Sender: TObject);
    procedure bbtnProcurarMatriculaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure dbcmbplanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbcmbplanoExit(Sender: TObject);
    procedure dbcmbplanoEnter(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure edmatriculaExit(Sender: TObject);
    procedure bbtnExportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cbAgrupaMesRefClick(Sender: TObject);
    procedure QryAux1AfterScroll(DataSet: TDataSet);
    procedure qrybeneficioAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
     bModif  : Boolean;
     wValAnt : String;
     iPessoa : Integer;
     DtRef   : String;

    //--Marcos SOL  136386/4901 Kintana 1278330 06/10
    sAnoMesRefTela, sAnoMesCobrancaTela : string;

  public
    { Public declarations }

  end;


var
  frmConsHistPagBeneficio: TfrmConsHistPagBeneficio;


implementation

uses DRelatorioHistPagBenef, UMensErro, FConciliacao;

{$R *.DFM}


procedure TfrmConsHistPagBeneficio.bbtnLimpaClick(Sender: TObject);
begin
  inherited;
   edmatricula.clear;
   edcpf.clear;
   ednome.clear;

   //--Marcos SOL  136386/4901 Kintana 1278330 06/10
   edPrevidenciario.clear;
   cmbMesRef.Clear;
   cmbMesCobr.Clear;

   spedAnoRef.Text          := DtRef;
   spedAnoCobr.Text         := DtRef;

   grpMesAnoRef.Enabled     := False;
   grpMesAnoCob.Enabled     := False;
   cbRubContr.Enabled       := False;

   cbRubBenef.Enabled       := False;
   cbAgrupaMesRef.Enabled   := False;

   cbRubBenef.Checked       := False;
   cbRubContr.Checked       := False;
   cbAgrupaMesRef.Checked   := False;

   qryAux.active            := False;
   qryAux1.active           := False;

   qrybeneficio.active      := False;
   //--Marcos SOL  136386/4901 Kintana 1278330 06/10
end;

procedure TfrmConsHistPagBeneficio.bbtnProcurarMatriculaClick(
  Sender: TObject);
begin
  inherited;
   // Sol 136386/4901 Kintana 1278330 Marcos Merola 27/09
   bbtnLimpaClick(sender);
   edPrevidenciario.ReadOnly   := True;
   edmatricula.ReadOnly        := True;
   edcpf.ReadOnly              := True;
   ednome.ReadOnly             := True;

   grpMesAnoRef.Enabled        := True;
   cmbMesRef.Enabled           := True;
   spedAnoRef.Enabled          := True;

   grpMesAnoCob.Enabled        := True;
   cmbMesCobr.Enabled          := True;
   spedAnoCobr.Enabled         := True;

   cbRubContr.Enabled          := True;
   cbRubBenef.Enabled          := True;
   cbAgrupaMesRef.Enabled      := True;

   bbtnExportar.Enabled      := true;
   bt_Imprime.Enabled        := true;


   // Sol 136386/4901 Kintana 1278330 Marcos Merola 27/09

   MontaSelect.Filtro.Clear;
   MontaSelect.Filtro.Add('DEPENTIT.IDPESSOA = PESSOA.IDPESSOA');
   MontaSelect.Filtro.Add('DEPENTIT.MATRICULA IS NOT NULL');
   MontaSelect.Filtro.Add('(EXISTS(SELECT DISTINCT HISTRUBSAL.IDPESSOA FROM HISTRUBSAL WHERE HISTRUBSAL.IDPESSOA = PESSOA.IDPESSOA))');

   if (Trim(edmatricula.Text) <> '') then
      MontaSelect.Filtro.Add('DEPENTIT.MATRICULA = '+QuotedStr(edmatricula.Text));

   MontaSelect.ExibePergunta := ((Trim(edmatricula.Text) = ''));

   MontaSelect.Executar;

   if MontaSelect.RetornouValor then
   begin
      ednome.Text := MontaSelect.ValoresChave[0];
      edcpf.Text  := FormatMaskText('000.000.000-00;0',MontaSelect.ValoresChave[1]);

      edmatricula.Text := MontaSelect.ValoresChave[2];

      iPessoa     := StrToInt(MontaSelect.ValoresChave[3]);

      cmbMesRef.Items.Add('Janeiro');
      cmbMesRef.Items.Add('Fevereiro');
      cmbMesRef.Items.Add('Março');
      cmbMesRef.Items.Add('Abril');
      cmbMesRef.Items.Add('Maio');
      cmbMesRef.Items.Add('Junho');
      cmbMesRef.Items.Add('Julho');
      cmbMesRef.Items.Add('Agosto');
      cmbMesRef.Items.Add('Setembro');
      cmbMesRef.Items.Add('Outubro');
      cmbMesRef.Items.Add('Novembro');
      cmbMesRef.Items.Add('Dezembro');

      cmbMescobr.Items.Add('Janeiro');
      cmbMescobr.Items.Add('Fevereiro');
      cmbMescobr.Items.Add('Março');
      cmbMescobr.Items.Add('Abril');
      cmbMescobr.Items.Add('Maio');
      cmbMescobr.Items.Add('Junho');
      cmbMescobr.Items.Add('Julho');
      cmbMescobr.Items.Add('Agosto');
      cmbMescobr.Items.Add('Setembro');
      cmbMescobr.Items.Add('Outubro');
      cmbMescobr.Items.Add('Novembro');
      cmbMescobr.Items.Add('Dezembro');


      qryplano.Close;
      // SOL 136386/7381 Kintana 1525155 - Otacilio
      qryplano.ParamByName('MATRICULA').Asstring := edmatricula.text;
      qryplano.Open;

      // SOL 136386/7381 Kintana 1525155 - Otacilio ** Inicio **
      qrybeneficio.Close;
      qrybeneficio.ParamByName('IDPESSOA').AsInteger    := StrToInt(MontaSelect.ValoresChave[3]);
      // qrybeneficio.ParamByName('IDPLANOPREV').AsInteger := qryPlano.Fieldbyname('IDPLANOPREV').asInteger;
      qrybeneficio.Open;
      

      // Sol 136386/4901 Kintana 1278330 Marcos Merola 27/09
{      if not(qryplano.isempty) then
         edprevidenciario.Text  := qryPlano.Fieldbyname('NOME').AsString
      else
         edprevidenciario.Text  := qrybeneficio.Fieldbyname('PLANO').AsString;}
      // SOL 136386/7381 Kintana 1525155 - Otacilio ** Fim **
   end
   else
   begin
      iPessoa := 0;

      edmatricula.clear;
      edcpf.clear;
      ednome.clear;

      // Sol 136386/4901 Kintana 1278330 Marcos Merola 27/09
      edPrevidenciario.clear;

      cmbMesRef.Clear;
      cmbMesCobr.Clear;

      cbRubContr.Checked     := False;
      cbRubBenef.Checked     := False;
      cbAgrupaMesRef.Checked := False;
    // Sol 136386/4901 Kintana 1278330 Marcos Merola 27/09
   end;
end;

procedure TfrmConsHistPagBeneficio.FormCreate(Sender: TObject);
begin
  inherited;
   qryplano.Close;
   // SOL 136386/7381 Kintana 1525155 - Otacilio 
   qryplano.ParamByName('MATRICULA').AsString := '-1';
   qryplano.Open;

   iPessoa := 0;

   // Sol 136386/4901 Kintana 1278330 Marcos Merola 27/09
   bbtnExportar.Enabled   := false;
   bt_Imprime.Enabled     := false;
   // Sol 136386/4901 Kintana 1278330 Marcos Merola 27/09
end;

procedure TfrmConsHistPagBeneficio.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   // Sol 136386/4901 Kintana 1278330 Marcos Merola 06/10
   if not(dtmRelatorioHistPagBenef.qryHistPagBeneficio.IsEmpty) and not(cbAgrupaMesRef.Checked) then
   begin
      TfrmPreview.CreateModalPreview(Application,
                                     dtmRelatorioHistPagBenef.rpHistPagBeneficio,
                                     dtmRelatorioHistPagBenef.rpHistPagBeneficio.PrinterSetup.DocumentName);
   end;
 
   if not(dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.IsEmpty) and (cbAgrupaMesRef.Checked) then
   begin
         TfrmPreview.CreateModalPreview(Application,
                                        dtmRelatorioHistPagBenef.rpHistPagBeneficioAgrupa,
                                        dtmRelatorioHistPagBenef.rpHistPagBeneficioAgrupa.PrinterSetup.DocumentName);
   end;
   // Sol 136386/4901 Kintana 1278330 Marcos Merola 06/10
end;

procedure TfrmConsHistPagBeneficio.dbcmbplanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
{   bModif := modified;
   if ((modified) and (Trim(edmatricula.text) <> '') and (Trim(edPrevidenciario.Text) <> '')) then
   begin
      qrybeneficio.Close;
      qrybeneficio.ParamByName('IDPESSOA').AsInteger    := StrToInt(MontaSelect.ValoresChave[3]);
      qrybeneficio.ParamByName('IDPLANOPREV').AsInteger := StrToInt(edPrevidenciario.LookupValue);
      qrybeneficio.Open;
   end;}
end;

procedure TfrmConsHistPagBeneficio.dbcmbplanoExit(Sender: TObject);
begin
  inherited;
{   if ((Not bModif) and (Trim(edmatricula.text) <> '') and (Trim(dbcmbplano.Text) <> '') and (wValAnt <> dbcmbplano.LookupValue)) then
   begin
      qrybeneficio.Close;
      qrybeneficio.ParamByName('IDPESSOA').AsInteger    := StrToInt(MontaSelect.ValoresChave[3]);
      qrybeneficio.ParamByName('IDPLANOPREV').AsInteger := StrToInt(dbcmbplano.LookupValue);
      qrybeneficio.Open;
   end;}
end;

procedure TfrmConsHistPagBeneficio.dbcmbplanoEnter(Sender: TObject);
begin
  inherited;
//   wValAnt := dbcmbplano.LookupValue;
end;

procedure TfrmConsHistPagBeneficio.bbtnProcurarClick(Sender: TObject);
var
  Contador, i : Integer;
  sSql: String;
begin
  inherited;

  if ((Trim(edmatricula.Text) <> '') and (not (iPessoa > 0))) then
  begin
     if not (iPessoa > 0) then
        MsgDlg('É necessário selecionar a matrícula do participante.','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;

  if not ((Trim(edmatricula.Text) <> '') and (iPessoa > 0)) then
  begin
     MsgDlg('É necessário selecionar a matrícula do participante.','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;

  if not ((cbRubContr.Checked) or (cbRubBenef.Checked)) then
  begin
     MsgDlg('É obrigatório selecionar rubricas de benefícios ou rubricas de contribuição.','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;
  // Sol 136386/4901 Kintana 1278330 Marcos Merola 06/10
  if cmbMesRef.Text = '' then
  begin
     MsgDlg('É obrigatório selecionar o mês de referência inicial.','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;
  if cmbMesCobr.Text = '' then
  begin
     MsgDlg('É obrigatório selecionar o mês de referência final.','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;

   dtmRelatorioHistPagBenef.sAnoMesRefTela      := sAnoMesRefTela + FormatFloat('00', cmbMesRef.ItemIndex+1);
   dtmRelatorioHistPagBenef.sAnoMesCobrancaTela := sAnoMesCobrancaTela + FormatFloat('00', cmbMescobr.ItemIndex+1);
  // Sol 136386/4901 Kintana 1278330 Marcos Merola 06/10

{  If cmbMesRef.ItemIndex <= 8 Then
    sAnoMesRefTela := sAnoMesRefTela+'0'+IntToStr(cmbMesRef.ItemIndex+1)
  Else
    sAnoMesRefTela := sAnoMesRefTela+IntToStr(cmbMesRef.ItemIndex+1);

  If cmbMescobr.ItemIndex <= 8 Then
    sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMescobr.ItemIndex+1)
  Else
    sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMescobr.ItemIndex+1);}

  //--Marcos Merola SOL  136386/4901 Kintana 1278330 30/09
  dtmRelatorioHistPagBenef.sAnoMesRefTela        :=    inttostr(spedAnoRef.Value)+'/'+dtmRelatorioHistPagBenef.sAnoMesRefTela;
  dtmRelatorioHistPagBenef.sAnoMesCobrancaTela   :=    inttostr(spedanoCobr.Value)+'/'+dtmRelatorioHistPagBenef.sAnoMesCobrancaTela;
  //--Marcos Merola SOL  136386/4901 Kintana 1278330 30/09

  if (cbAgrupaMesRef.Checked)  then
  begin
    //--Marcos Merola SOL  136386/4901 Kintana 1278330 28/10 Inicio
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.Close;
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Clear;
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('SELECT NVL(B.MES, P.MES) MES,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('       B.VALORPAGO VALPAGBENEF,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('       P.VALORPAGO VALPAGCONTRIB');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('  FROM --BENEFICIO');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('       (SELECT HR.MES,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('               D.IDPESSOA,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('               D.IDTITULAR,');

    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('               SUM(DECODE(NVL(Hr.FLGDESCONTO,PD.FLGDESCONTO),0,hr.valorprovento,1,-Hr.VALORPROVENTO,NULL)) AS VALORPAGO ');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('          FROM HISTRUBSAL       HR,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('               PROVDESC         PD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('               PLANPREVCONTABIL PPC,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('               DEPENTIT         D,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('               PESSOA           P,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('               PLANPREV         PP');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('         WHERE HR.IDRESPONSAVEL = ' + MontaSelect.ValoresChave[3]);
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('           AND P.IDPESSOA = ' + MontaSelect.ValoresChave[3]);
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('           AND D.IDPESSOA = P.IDPESSOA');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('           AND HR.IDRUBRICA = PD.IDPROVENTO');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('           AND HR.FONTEPAGADORA = 1');

    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('           AND (PD.FLGEXIBEHIST = ''B'' OR (HR.FLGTIPODESC = ''B''');
    // SOL 136386/7381 Kintana 1525155 - Otacilio ** Inicio **
    {dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('           AND EXISTS');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                (SELECT 1');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                    FROM CONTPREV CP');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                   WHERE HR.IDRUBRICA IN (CP.IDRUB13ACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUB13ATRACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUB13DESCACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUB13DEVACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUB13DVADTACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBACERTO,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBACERTODECT,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBADIANT,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBADIANT13,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBATRACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBDADACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBDECTERC,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBDECTERCATRA,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBDECTERCDEVOL,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBDEVACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBDEVADIANT13,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBDEVADTACJUD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBDEVOLADIANT,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBFERIASATRASO,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBFERIASDEVOL,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBFERIASNORM,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                                          CP.IDRUBRICA))))');  }
    // SOL 136386/7381 Kintana 1525155 - Otacilio ** Fim **
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' AND EXISTS');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' (SELECT 1');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' FROM BENEFPLANPREV BP');
    // Thiago Melo 182322 Kintana 1705526
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' WHERE HR.IDBENEFICIO = BP.IDBENEFICIO AND');


    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, BP.IDRUBRICAATRASO, BP.IDRUBRICA, BP.IDRUBABONO, BP.IDRUBANTECABONO, ');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' BP.IDRUBDESCANTECAB, BP.IDRUBDEVOLUCAO, BP.IDRUBRICADIF, BP.IDRUBRICACORRECAO, ');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' BP.IDRUBDEVOLABONO, BP.IDRUBADIANT, BP.IDRUBDEVOLADIANT, BP.IDRUBADIANT13, ');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' BP.IDRUBDEVADIANT13, BP.IDRUBACERTOABONO, BP.IDRUBDEVANTABONO, BP.IDRUBATRASOABONO, ');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' BP.IDRUBATR13ACJUD, BP.IDRUBDEV13ACJUD, BP.IDRUBATRREVACJUD, BP.IDRUBDEVREVACJUD, ');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' BP.IDRUBATRREVISAO, BP.IDRUBDEVREVISAO, BP.IDRUBRICAQUITANT, BP.IDRUBNORADICJUD, ');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' BP.IDRUBATRADICJUD, BP.IDRUBDEVADICJUD, BP.IDRUBABONOFIM))))');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('           AND PP.IDPLANOPREV = HR.IDPLANOPREV');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('           AND PPC.IDPLANOPREV = HR.IDPLANOCONTABIL');
    if not(cbRubBenef.Checked)  then begin
      dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('  AND 1 = 2');
    end;
      dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' GROUP BY HR.MES, D.IDPESSOA, D.IDTITULAR) B');

    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('  FULL OUTER JOIN (SELECT HR.MES,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                          D.IDPESSOA,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                          D.IDTITULAR,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                          SUM(DECODE(NVL(Hr.FLGDESCONTO,PD.FLGDESCONTO),0,hr.valorprovento,1,-Hr.VALORPROVENTO,NULL)) AS VALORPAGO');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                     FROM HISTRUBSAL       HR,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                          PROVDESC         PD,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                          PLANPREVCONTABIL PPC,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                          DEPENTIT         D,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                          PESSOA           P,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                          PLANPREV         PP');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                    WHERE HR.IDRESPONSAVEL = '  + MontaSelect.ValoresChave[3]);
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                      AND P.IDPESSOA = ' +   MontaSelect.ValoresChave[3]);
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                      AND D.IDPESSOA = P.IDPESSOA');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                      AND HR.IDRUBRICA = PD.IDPROVENTO');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                      AND HR.FONTEPAGADORA = 1');

    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                      AND (PD.FLGEXIBEHIST = ''C'' OR');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                          (HR.FLGTIPODESC = ''P'' AND ');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' EXISTS (SELECT 1');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' FROM CONTPREV CP');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('WHERE CP.IDCONTRIBUICAO IN (259,500,633) AND');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('HR.IDRUBRICA IN (CP.IDRUB13ACJUD,CP.IDRUB13ATRACJUD,CP.IDRUB13DESCACJUD,CP.IDRUB13DEVACJUD,CP.IDRUB13DVADTACJUD,CP.IDRUBACERTO,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('CP.IDRUBACERTODECT,CP.IDRUBACJUD,CP.IDRUBADIANT,CP.IDRUBADIANT13,CP.IDRUBATRACJUD,CP.IDRUBDADACJUD,CP.IDRUBDECTERC,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('CP.IDRUBDECTERCATRA,CP.IDRUBDECTERCDEVOL,CP.IDRUBDEVACJUD,CP.IDRUBDEVADIANT13,CP.IDRUBDEVADTACJUD,CP.IDRUBDEVOLADIANT,');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('CP.IDRUBFERIASATRASO,CP.IDRUBFERIASDEVOL,CP.IDRUBFERIASNORM,CP.IDRUBRICA,CP.IDRUBRICAATRASO,CP.IDRUBRICADEVOLUC))))');

    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                      AND PP.IDPLANOPREV = HR.IDPLANOPREV');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('                      AND PPC.IDPLANOPREV = HR.IDPLANOCONTABIL');
    if not(cbRubContr.Checked)  then begin
      dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' AND 1 = 2');
    end;
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' GROUP BY HR.MES, D.IDPESSOA, D.IDTITULAR) P');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('    ON B.MES = P.MES');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('   AND B.IDPESSOA = P.IDPESSOA');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add('   AND B.IDTITULAR = P.IDTITULAR');
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' WHERE NVL(B.MES, P.MES) BETWEEN ' +QuotedStr(dtmRelatorioHistPagBenef.sAnoMesRefTela) +'  AND '+QuotedStr(dtmRelatorioHistPagBenef.sAnoMesCobrancaTela));
    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.SQL.Add(' ORDER BY NVL(B.MES, P.MES)');
    //--Marcos Merola SOL  136386/4901 Kintana 1278330 28/10 Fim

    dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.Open;
    dtmRelatorioHistPagBenef.qryHistPagBeneficio.Close;

     qryaux.close;
     qryaux.sql.clear;
     qryaux.sql.text := dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.sql.text;
     qryaux.open;

     //--Marcos Merola SOL  136386/4901 Kintana 1278330 10/10
     QryAux.FieldByName('VALPAGBENEF').Visible    := cbRubBenef.Checked;

     QryAux.FieldByName('VALPAGCONTRIB').Visible   := cbRubContr.Checked;
     //--Marcos Merola SOL  136386/4901 Kintana 1278330 10/10

     qeHistPagBeneficio.ExportedFields.Clear;
     qeHistPagBeneficio.DataSet := nil;

     qeHistPagBeneficio.DataSet := qryaux;
     for Contador := 0 to qeHistPagBeneficio.DataSet.FieldCount-1 do begin
       if (qeHistPagBeneficio.DataSet.Fields[Contador].Visible) then begin
          qeHistPagBeneficio.ExportedFields.Add(qeHistPagBeneficio.DataSet.Fields[Contador].FieldName);
       end;
     end;
  end
  else
  begin
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.Close;
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Clear;
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('SELECT NVL(B.MES,P.MES) MESREF, NVL(B.MESCOBR,P.MESCOBR) MESCOBR,  B.DESCRICAO DESCRUBBENEF,   B.CODPROVDESC RUBBENEF, ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('B.VALORPAGO VALPAGBENEF,  P.DESCRICAO DESCRUBCONTRIB, P.CODPROVDESC RUBCONTRIB, P.VALORPAGO VALPAGCONTRIB ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('FROM --BENEFICIO ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' (SELECT HR.MES, D.IDPESSOA, D.IDTITULAR, PD.DESCRICAO, HR.MESCOBRANCA AS MESCOBR, PD.CODPROVDESC, SUM(DECODE(NVL(Hr.FLGDESCONTO,PD.FLGDESCONTO),0,hr.valorprovento,1,-Hr.VALORPROVENTO,NULL)) AS VALORPAGO ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('FROM HISTRUBSAL HR, PROVDESC PD, PLANPREVCONTABIL PPC, DEPENTIT D, PESSOA P, PLANPREV PP ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('WHERE HR.IDRESPONSAVEL = '+MontaSelect.ValoresChave[3]);
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('AND P.IDPESSOA       = '+MontaSelect.ValoresChave[3]);
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('AND D.IDPESSOA       = P.IDPESSOA');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('AND HR.IDRUBRICA     = PD.IDPROVENTO');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('AND HR.FONTEPAGADORA = 1');

     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND (PD.FLGEXIBEHIST  = ''B'' OR ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' (HR.FLGTIPODESC = ''B'' AND ');

     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' EXISTS (SELECT 1 ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' FROM BENEFPLANPREV BP');
     // Thiago Melo 182322 Kintana 1705526
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' WHERE HR.IDBENEFICIO = BP.IDBENEFICIO AND');



     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, BP.IDRUBRICAATRASO, BP.IDRUBRICA, BP.IDRUBABONO, BP.IDRUBANTECABONO, ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' BP.IDRUBDESCANTECAB, BP.IDRUBDEVOLUCAO, BP.IDRUBRICADIF, BP.IDRUBRICACORRECAO, ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' BP.IDRUBDEVOLABONO, BP.IDRUBADIANT, BP.IDRUBDEVOLADIANT, BP.IDRUBADIANT13, ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' BP.IDRUBDEVADIANT13, BP.IDRUBACERTOABONO, BP.IDRUBDEVANTABONO, BP.IDRUBATRASOABONO, ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' BP.IDRUBATR13ACJUD, BP.IDRUBDEV13ACJUD, BP.IDRUBATRREVACJUD, BP.IDRUBDEVREVACJUD, ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' BP.IDRUBATRREVISAO, BP.IDRUBDEVREVISAO, BP.IDRUBRICAQUITANT, BP.IDRUBNORADICJUD, ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' BP.IDRUBATRADICJUD, BP.IDRUBDEVADICJUD, BP.IDRUBABONOFIM))))');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND PP.IDPLANOPREV   = HR.IDPLANOPREV');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND PPC.IDPLANOPREV  = HR.IDPLANOCONTABIL');

     if not(cbRubBenef.Checked)  then
        dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND 1 = 2 ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' GROUP BY HR.MES, D.IDPESSOA, D.IDTITULAR, PD.DESCRICAO, HR.MESCOBRANCA, PD.CODPROVDESC) B FULL OUTER JOIN ');
     //CONTRIBUICAO
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' (SELECT HR.MES, D.IDPESSOA, D.IDTITULAR, PD.DESCRICAO, HR.MESCOBRANCA AS MESCOBR, PD.CODPROVDESC, SUM(DECODE(NVL(Hr.FLGDESCONTO,PD.FLGDESCONTO),0,hr.valorprovento,1,-Hr.VALORPROVENTO,NULL)) AS VALORPAGO  ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' FROM HISTRUBSAL HR, PROVDESC PD, PLANPREVCONTABIL PPC, DEPENTIT D, PESSOA P, PLANPREV PP ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' WHERE HR.IDRESPONSAVEL = '+MontaSelect.ValoresChave[3]);
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND P.IDPESSOA       = '+MontaSelect.ValoresChave[3]);
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND D.IDPESSOA       = P.IDPESSOA');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND HR.IDRUBRICA     = PD.IDPROVENTO');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND HR.FONTEPAGADORA = 1');

     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND (PD.FLGEXIBEHIST  = ''C'' OR ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' (HR.FLGTIPODESC = ''P'' AND ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' EXISTS (SELECT 1');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' FROM CONTPREV CP');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('WHERE CP.IDCONTRIBUICAO IN (259,500,633) AND');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('HR.IDRUBRICA IN (CP.IDRUB13ACJUD,CP.IDRUB13ATRACJUD,CP.IDRUB13DESCACJUD,CP.IDRUB13DEVACJUD,CP.IDRUB13DVADTACJUD,CP.IDRUBACERTO,');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('CP.IDRUBACERTODECT,CP.IDRUBACJUD,CP.IDRUBADIANT,CP.IDRUBADIANT13,CP.IDRUBATRACJUD,CP.IDRUBDADACJUD,CP.IDRUBDECTERC,');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('CP.IDRUBDECTERCATRA,CP.IDRUBDECTERCDEVOL,CP.IDRUBDEVACJUD,CP.IDRUBDEVADIANT13,CP.IDRUBDEVADTACJUD,CP.IDRUBDEVOLADIANT,');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('CP.IDRUBFERIASATRASO,CP.IDRUBFERIASDEVOL,CP.IDRUBFERIASNORM,CP.IDRUBRICA,CP.IDRUBRICAATRASO,CP.IDRUBRICADEVOLUC))))');

     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND PP.IDPLANOPREV   = HR.IDPLANOPREV');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND PPC.IDPLANOPREV  = HR.IDPLANOCONTABIL');
     if not(cbRubContr.Checked)  then
        dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' AND 1 = 2 ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' GROUP BY HR.MES, D.IDPESSOA, D.IDTITULAR, PD.DESCRICAO, HR.MESCOBRANCA, PD.CODPROVDESC) P ON B.MES = P.MES AND ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' B.MESCOBR   = P.MESCOBR AND ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' B.IDPESSOA  = P.IDPESSOA AND ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' B.IDTITULAR = P.IDTITULAR ');
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add('WHERE NVL(B.MES,P.MES) BETWEEN '+ QuotedStr(dtmRelatorioHistPagBenef.sAnoMesRefTela) +'  AND '+QuotedStr(dtmRelatorioHistPagBenef.sAnoMesCobrancaTela));
     dtmRelatorioHistPagBenef.qryHistPagBeneficio.SQL.Add(' ORDER BY  NVL(B.MES,P.MES), NVL(B.MESCOBR,P.MESCOBR) ');

     dtmRelatorioHistPagBenef.qryHistPagBeneficio.Open;
     dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.Close;

     qryaux1.close;
     qryaux1.sql.clear;
     qryaux1.sql.text := dtmRelatorioHistPagBenef.qryHistPagBeneficio.sql.text;
     qryaux1.open;

     //--Marcos Merola SOL  136386/4901 Kintana 1278330 10/10
     QryAux1.FieldByName('RUBBENEF').Visible       := cbRubBenef.Checked;
     QryAux1.FieldByName('DESCRUBBENEF').Visible   := cbRubBenef.Checked;
     QryAux1.FieldByName('VALPAGBENEF').Visible    := cbRubBenef.Checked;

     QryAux1.FieldByName('RUBCONTRIB').Visible      := cbRubContr.Checked;
     QryAux1.FieldByName('DESCRUBCONTRIB').Visible  := cbRubContr.Checked;
     QryAux1.FieldByName('VALPAGCONTRIB').Visible   := cbRubContr.Checked;
     //--Marcos Merola SOL  136386/4901 Kintana 1278330 10/10

     qeHistPagBeneficio.ExportedFields.Clear;
     qeHistPagBeneficio.DataSet := nil;

     qeHistPagBeneficio.DataSet := qryaux1;
     for Contador := 0 to qeHistPagBeneficio.DataSet.FieldCount-1 do begin
        if (qeHistPagBeneficio.DataSet.Fields[Contador].Visible) then begin
           qeHistPagBeneficio.ExportedFields.Add(qeHistPagBeneficio.DataSet.Fields[Contador].FieldName);
        end;
     end;
  end;

   //--Marcos Merola SOL  136386/4901 Kintana 1278330
   dbgrdResultado1.Visible :=  (cbAgrupaMesRef.Checked);
   dbgrdResultado.Visible  :=  not(cbAgrupaMesRef.Checked);
   //--Marcos Merola SOL  136386/4901 Kintana 1278330

   //BRUNO AZEVEDO AJUSTES SOL 136386/4901 Kintana 1278330
   //if (cbAgrupaMesRef.Checked) then begin
   //  vwDataSource2.DataSet := qryAux;
   //end else begin
   //  vwDataSource2.DataSet := qryAux1;
   //end;
   //BRUNO AZEVEDO AJUSTES SOL 136386/4901 Kintana 1278330
end;

procedure TfrmConsHistPagBeneficio.edmatriculaExit(Sender: TObject);
begin
  inherited;
   iPessoa := 0;
   edcpf.clear;
   ednome.clear;
end;

procedure TfrmConsHistPagBeneficio.bbtnExportarClick(Sender: TObject);
begin
  inherited;
   //--Marcos Merola SOL  136386/4901 Kintana 1278330
  if (cbAgrupaMesRef.Checked) then
  begin
     if dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.IsEmpty then
        exit;

     qeHistPagBeneficio.Execute;
  end
  else
  begin
     if dtmRelatorioHistPagBenef.qryHistPagBeneficio.IsEmpty then
        exit;

     qeHistPagBeneficio.Execute;
  end;
  //--Marcos Merola SOL  136386/4901 Kintana 1278330
end;

procedure TfrmConsHistPagBeneficio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   //--Marcos Merola SOL  136386/4901 Kintana 1278330 13/10
   dtmRelatorioHistPagBenef.qryHistPagBeneficio.Close;
  //--Marcos Merola SOL  136386/4901 Kintana 1278330 13/10
end;

procedure TfrmConsHistPagBeneficio.FormShow(Sender: TObject);
begin
  inherited;
  //--Marcos Merola SOL  136386/4901 Kintana 1278330 27/09
  DtRef                    := Formatdatetime('YYYY', Date);

  spedAnoRef.Text          := DtRef;
  spedAnoCobr.Text         := DtRef;

  grpMesAnoRef.Enabled     := False;
  cmbMesRef.Enabled        := False;
  spedAnoRef.Enabled       := False;
  grpMesAnoCob.Enabled     := False;
  cmbMesCobr.Enabled       := False;
  spedAnoCobr.Enabled      := False;
  cbRubContr.Enabled       := False;
  cbRubBenef.Enabled       := False;
  cbAgrupaMesRef.Enabled   := False;
  //--Marcos Merola SOL  136386/4901 Kintana 1278330 27/09

end;

procedure TfrmConsHistPagBeneficio.cbAgrupaMesRefClick(Sender: TObject);
begin
  inherited;
     //--Marcos SOL  136386/4901 Kintana 1278330 30/09
  //dbgrdResultado1.Visible :=  (cbAgrupaMesRef.Checked);
  //dbgrdResultado.Visible  :=  not(cbAgrupaMesRef.Checked);
    //--Marcos SOL  136386/4901 Kintana 1278330 30/09
end;

procedure TfrmConsHistPagBeneficio.QryAux1AfterScroll(DataSet: TDataSet);
begin
  inherited;
    { if not(cbAgrupaMesRef.Checked) then
        if cbRubContr.Checked then
           dbGrdResultado.Selected.Delete(0);`}
end;

procedure TfrmConsHistPagBeneficio.qrybeneficioAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  // Thiago Melo SOL 180483 Kintana 1669173 - Ini

  edPrevidenciario.Text := qryBeneficio.FieldByName('plano').AsString;

  if ((dtmRelatorioHistPagBenef.qryHistPagBeneficio.State in [dsInactive]) or
     (dtmRelatorioHistPagBenef.qryHistPagBeneficio.IsEmpty)) and
     ((dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.State in [dsInactive]) or
     (dtmRelatorioHistPagBenef.qryHistPagBeneficioAgrupa.IsEmpty)) then
    Exit
  else
    bbtnProcurar.Click;

  // Thiago Melo SOL 180483 Kintana 1669173 - Fim
end;


end.
