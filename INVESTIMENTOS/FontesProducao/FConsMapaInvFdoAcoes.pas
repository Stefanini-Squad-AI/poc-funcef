//******************************************************************************
// Rotina     : AbreQry
// SOL        : 189456
// Kintana    : 1809649
// Data       : 26/10/2012
// Responsável: Monica Gonzaga
// Descrição  : Mudança nas concatenações para formação do ID1 e ID.
//******************************************************************************
// Rotina     : AbreQry
// SOL        : 178236
// Kintana    : 1636025
// Data       : 13/04/2012
// Responsável: Otacilio aquino
// Descrição  : Implementado na consulta da qryMapaInvestFdoOutrosAn
//              tratamento para consulta Fundo Direito Creditorio valor
//              Amortização estava trazendo valor zero.
//              Alguns campos foram comentados na consulta
//******************************************************************************
// Rotina     : AbreQry
// SOL        : 177857
// Kintana    : 1631932
// Data       : 10/04/2012
// Responsável: Otacilio aquino
// Descrição  : Inversão na concatenação para a formação do ID na consulta da
//              qryMapaInvestFdoOutros.
//              Antes: (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVEST) AS ID
//              Atual: (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPATR) AS ID
//******************************************************************************
// Rotina     : AbreQry
// SOL        : 176518
// Kintana    : 1613211
// Data       : 16/03/2012
// Responsável: Otacilio aquino
// Descrição  : Implementado na consulta da qryMapaInvestFdoOutros
//              tratamento para consulta Fundo Direito Creditorio valor variacao
//              estava trazendo valores zero.
//******************************************************************************
// Rotina     : AbreQry
// SOL        : 175860
// Kintana    : 1602376
// Data       : 09/03/2012
// Responsável: Otacilio aquino
// Descrição  : Implementado na consulta da qryMapaInvestFdoOutros
//              adicionando mais um parametro na consulta (:IDFUNDOINVEST).
//******************************************************************************
// Rotina     : AbreQry
// SOL        : 166338.6801
// Kintana    : 1451970
// Data       : 01/11/2011
// Responsável: Otacilio aquino
// Descrição  : Permitir mais de uma integralização para o mesmo fundo e na
//              mesma data
//******************************************************************************
// Data      : 11/06/2007
// Código    : AL_14
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da taxa de despesa conforme especificação para as operações
//             de aplicação, resgate, amortização e integralização
//******************************************************************************
// Data      : 30/03/2007
// Código    : AL_13
// Pendencia : 24891
// SOL       : 56401
// Motivo    : Implementação para o fundo imobiliário para a data anterior não ser
//             tratanda com dias úteis
//******************************************************************************
// Data      : 19/12/2006
// Código    : AL_12
// Pendencia :
// SOL       :
// Motivo    : Implementação do campo Tipo de Fundo na grid
//******************************************************************************
// Data      : 18/12/2006
// Código    : AL_11
// Pendencia :
// SOL       :
// Motivo    : Implementação do fechamento de querys no bbtnCancelarClick
//******************************************************************************
// Data      : 15/12/2006
// Código    : AL_10
// Pendencia : 24008
// SOL       : 50435
// Motivo    : Alterado na query qryFundoInvestAcoes a HISTFUNDOINVEST para FUNDOINVEST,
//             devido estar duplicando fundos que mudaram de tipo de fundo
//******************************************************************************
// Data      : 01/09/2006
// Código    : AL_9
// Pendencia : 22946
// SOL       :
// Motivo    : Implementação de ajustes para o tipo de fundo FIP
//******************************************************************************
// Data      : 07/06/2006
// Código    : AL_8
// Pendencia :
// SOL       :
// Motivo    : Alteração do local de abertura da query analitica. Passa a ser
//             junto com a Sintetica
//******************************************************************************
// Data      : 14/02/2006
// Código    : AL_7
// Pendencia : 21579
// SOL       :
// Motivo    : Implementação da descrição do tipo de investimento no nome do relatório
//******************************************************************************
// Data      : 22/11/2005
// Código    : AL_6
// Motivo    : Melhora na performace do relatório
//******************************************************************************
// Data      : 21/10/2005
// Código    : AL_5
// Motivo    : Implementação a coluna Amortização a Receber
//******************************************************************************
// Data      : 02/09/2005
// Código    : AL_4
// Motivo    : Acerto no layout das combos
//******************************************************************************
// Data      : 04/08/2005
// Código    : AL_3
// Motivo    : Acerto na passagem de parametro de dataanterior pra ultimo dia util
//******************************************************************************
// Data      : 11/07/2005
// Código    : AL_2
// Motivo    : Acerto no filtro da qryFundoInvestAcoes (IDTIPOFUNDOINVEST)
//******************************************************************************
// Data     : 11/07/2005
// Código   :
// Motivo   : Implemetação da Consulta : Mapa de Investimentos em
//            Fundos de Acoes/FDIC e Imobiliario
//******************************************************************************

unit FConsMapaInvFdoAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, FPreview, Db, DBTables, uCMFileUtils;

type
  TfrmConsMapaInvFdoAcoes = class(TfrmOkCancelarRelInv)
    pnlDados: TPanel;
    lblDtIni: TLabel;
    lblDtFim: TLabel;
    lblPlanoPatro: TLabel;
    lblFundoInvest: TLabel;
    dtDataIni: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    dblkFundoInvest: TwwDBLookupCombo;
    dbgLanContPerRF: TwwDBGrid;
    dblTipoCota: TwwDBLookupCombo;
    lblTipoCota: TLabel;
    dblTipoFundo: TwwDBLookupCombo;
    lblTipoFundo: TLabel;
    dblSegmentacao: TwwDBLookupCombo;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure dbgLanContPerRFCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    //Al_6
    procedure dblkFundoInvestExit(Sender: TObject);
    procedure dblkFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    //AL_14
    procedure dtDataFimExit(Sender: TObject);
    procedure dblTipoFundoEnter(Sender: TObject);
  private
    { Private declarations }
     bModif  : Boolean;
     //AL_14
     sVarAnt : string;
     procedure AbreQry;
  public
    { Public declarations }
  end;

var
  frmConsMapaInvFdoAcoes: TfrmConsMapaInvFdoAcoes;

implementation

uses FDmRelMapaInvFdo, UOperComum, UMensErro, UBibliotecaInvest, UDiasUteisInv,
     FPrincipal;

{$R *.DFM}

procedure TfrmConsMapaInvFdoAcoes.FormShow(Sender: TObject);
begin
  inherited;
   //AL_9  
   lblTipoCota.Visible := (iTipoInvestUsu in [9,10]);
   dblTipoCota.Visible := (iTipoInvestUsu in [9,10]);

   with DmRelMapaInvFdo do
   begin

      qryPlanPrevCtbPatr.Open;

      QryTipoCota.Open;

      OperComum.LimpaParametros(DmRelMapaInvFdo.QryTipoFundo);
      QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryTipoFundo.Open;
      if QryTipoFundo.RecordCount = 1 then
         dtDataIni.Text := QryTipoFundo.FieldByNAme('DATAULTFECH').AsString
      else
      begin
         While Not QryTipoFundo.Eof do
         begin
            if QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime > dtDataIni.Date then
               dtDataIni.Text := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
            QryTipoFundo.Next;
         end;
         QryTipoFundo.First;
      end;

      dtDataFim.Text := dtDataIni.Text;

      //AL_2
      OperComum.LimpaParametros(DmRelMapaInvFdo.qryFundoInvestAcoes);
      qryFundoInvestAcoes.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      if QryTipoFundo.RecordCount = 1 then
         qryFundoInvestAcoes.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      //AL_14
      if Trim(dtDataFim.Text) <> '' then
         qryFundoInvestAcoes.ParamByName('DATAMOVFUNDO').AsString := dtDataFim.Text;
      //AL_10
      qryFundoInvestAcoes.Open;

      OperComum.LimpaParametros(DmRelMapaInvFdo.qrySegmentacao);
      qrySegmentacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      qrySegmentacao.Open;

   end;
end;

procedure TfrmConsMapaInvFdoAcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   //AL_9
   With DmRelMapaInvFdo do
   begin
      QryTipoCota.Close;
      QryTipoFundo.Close;
      qryPlanPrevCtbPatr.Close;
      qrySegmentacao.Close;
      qryFundoInvestAcoes.Close;
      qryMapaInvestFdoOutros.Close;
      qryMapaInvestFdoOutrosAn.Close;
   end;      
end;

procedure TfrmConsMapaInvFdoAcoes.FormCreate(Sender: TObject);
begin
  inherited;

   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

end;

procedure TfrmConsMapaInvFdoAcoes.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   AbreQry;
end;

procedure TfrmConsMapaInvFdoAcoes.AbreQry;
var
   //AL_3
   dDataAnt : TDateTime;
   sSql: String;
begin
   if Trim(dtDataIni.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataIni.CanFocus then
         dtDataIni.SetFocus;
      Exit;
   end
   else if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end
   else if (dtDataFim.Date < dtDataIni.Date) then
   begin
      MsgDlg('A Data Final não pode ser menor que a Data Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end;

   sSql := 'SELECT                                                                                              ' + #13 +
           '   SLDATU.ID,                                                                                       ' + #13 +
           '   NVL(SLDANT.SALDOANTERIOR,0)     AS SALDOANTERIOR,                                                ' + #13 +
           '   NVL(SLDATU.VLRAPLICADO,0)       AS VLRAPLICADO,                                                  ' + #13 +
           '   (NVL(TRP.VLRENTRADA,0) + NVL(TRP.VLRSAIDA,0)) AS VLRTRANSF,                                      ' + #13 +
           '    NVL(SLDATU.VLRIRPROV,0)         AS VLRIRPROV,                                                   ' + #13 +
           '    NVL((SLDATU.VLRIOFPROV * -1),0) AS VLRIOFPROV,                                                  ' + #13 +
           '    NVL((OPE.VLRRESGATE * -1),0)    AS VLRRESGATE,                                                  ' + #13 +
           '    NVL(OPE.VLRAPLICACAO,0)         AS VLRAPLICACAO,                                                ' + #13 +
           '    NVL(OPE.VLRINTEGRALIZ,0)        AS VLRINTEGRALIZ,                                               ' + #13 +
           '    NVL(ATU.VLRVARIACAO,0)          AS VLRVARIACAO,                                                 ' + #13 +
           '    NVL(AMODIV.VLRAMORTIZ,0)        AS VLRAMORTIZ,                                                  ' + #13 +
           '    NVL(AMODIV.VLRAMORTIZREC,0)     AS VLRAMORTIZREC,                                               ' + #13 +
           '    NVL(AMODIV.VLRDIVIDENDO,0)      AS VLRDIVIDENDO,                                                ' + #13 +
           '     NVL(SLDATU.SALDOQTDCOTAS,0)     AS SALDOQTDCOTAS,                                              ' + #13 +
           '   (NVL(SLDATU.SALDOVLRFUNDO,0) - NVL(SLDATU.VLRIOFPROV,0)) AS SALDOVLRFUNDO,                       ' + #13 +
           '    NVL(SLDATU.SALDOLIQUIDO,0)      AS SALDOLIQUIDO,                                                ' + #13 +
           '    NVL((SLDANT.SALDOANTERIOR + OPE.VLRAPLICACAO - SLDATU.VLRIOFPROV - OPE.VLRRESGATE + ATU.VLRVARIACAO - SLDATU.SALDOVLRFUNDO),0) AS DIF, ' + #13 +
           '    NVL(OPE.VLRTAXAS,0)             AS VLRTAXAS,                                                    ' + #13 +
           '    SLDATU.IDTIPOINVEST,                                                                            ' + #13 +
           '    SLDATU.IDFUNDOINVEST,                                                                           ' + #13 +
           '    SLDATU.IDTIPOFUNDOINVEST,                                                                       ' + #13 +
           '    SLDATU.IDPLANPREVCTBPATR,                                                                       ' + #13 +
           '    SLDATU.IDSEGMENTACAO,                                                                           ' + #13 +
           '    SLDATU.DESCSEGMENTACAO,                                                                         ' + #13 +
           '    SLDATU.DTAVIGENCIA,                                                                             ' + #13 +
           '    TF.DESCTIPOFUNDOINV,                                                                            ' + #13 +
           '    PLA.PLANPRVCONTABPATRO,                                                                         ' + #13 +
           '    FI.DESCFUNDOINVEST                                                                              ' + #13 +
           ' FROM                                                                                               ' + #13 +
           '   (SELECT MAX(DTAVIGENCIA)DTAVIGENCIA, IDFUNDOINVEST  FROM HISTFUNDOINVEST                         ' + #13 +
           '                           WHERE To_Char(DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY')+')  <= TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')' + #13 +
           '                           GROUP BY IDFUNDOINVEST) VIGENCIA,                                        ' + #13 +
           '   (SELECT                                                                                          ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** INICIO **
           //'      (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVEST) AS ID,  ' + #13 +
           '      (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPATR) AS ID,  ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** FIM **
           '       0 AS SALDOANTERIOR,                                                                          ' + #13 +
           '       SUM(NVL(HI.VLRAPLICADO,0)) AS VLRAPLICADO,                                                   ' + #13 +
           '       SUM(NVL(HI.VLRIRPROV,0)) AS VLRIRPROV  ,                                                     ' + #13 +
           '       SUM(NVL(HI.VLRIOFPROV,0)) AS VLRIOFPROV ,                                                    ' + #13 +
           '       0 AS VLRRESGATE, 0 AS VLRAPLICACAO, 0 AS VLRVARIACAO,                                        ' + #13 +
           '       SUM(NVL(HI.SALDOQTDCOTAS,0)) AS SALDOQTDCOTAS ,                                              ' + #13 +
           '       SUM(NVL(HI.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO ,                                              ' + #13 +
           '       SUM((NVL(HI.SALDOVLRFUNDO,0) - (NVL(HI.VLRIOFPROV,0) + NVL(HI.VLRIRPROV,0)))) AS  SALDOLIQUIDO, ' + #13 +
           '       HI.IDTIPOINVEST, HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR,                                     ' + #13 +
           '       FI.IDTIPOFUNDOINVEST, FI.IDSEGMENTACAO, FI.DESCSEGMENTACAO, FI.DTAVIGENCIA                   ' + #13 +
           '    FROM                                                                                            ' + #13 +
           '       HISTFUNDO HI,                                                                                ' + #13 +
           '      (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, TPF.IDSEGMENTACAO,     ' + #13 +
           '              SM.DESCSEGMENTACAO, HF1.DTAVIGENCIA                                                   ' + #13 +
           '       FROM HISTFUNDOINVEST HF1, TIPOFUNDOINVEST TPF, SEGMENTACAOMERCADO SM                         ' + #13 +
           '       WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,' + QuotedStr(' DD/MM/YYYY, HH24:MI:SS') + ') IN ' + #13 +
           '             (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' + QuotedStr(' DD/MM/YYYY, HH24:MI:SS') + ') ' + #13 +
           '              FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF                                           ' + #13 +
           '              WHERE                                                                                 ' + #13 +
           '                  (TF.IDTIPOINVEST = :IDTIPOINVEST)                                                 ' + #13 +
           '              AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))    ' + #13 +
           '              AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')+1)                        ' + #13 +
           '              AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                     ' + #13 +
           '              GROUP BY HF.IDFUNDOINVEST))                                     ' + #13 +
           '       AND (HF1.IDTIPOFUNDOINVEST = TPF.IDTIPOFUNDOINVEST)                                          ' + #13 +
           '       AND (TPF.IDSEGMENTACAO     = SM.IDSEGMENTACAO) ) FI,                                         ' + #13 +
           '                                                                                                    ' + #13 +
           '      (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO                                                   ' + #13 +
           '       FROM HISTFUNDO HI1,                                                                          ' + #13 +
           '           (SELECT                                                                                  ' + #13 +
           '                 HI2.IDTIPOINVEST,                                                                  ' + #13 +
           '                 HI2.IDPLANPREVCTBPATR,                                                             ' + #13 +
           '                 HI2.IDFUNDOINVEST,                                                                 ' + #13 +
           '                 HI2.DATAAPLICACAO,                                                                 ' + #13 +
           '                 HI2.DATAMOVFUNDO                                                                   ' + #13 +
           '            FROM HISTFUNDO HI2                                                                      ' + #13 +
           '                                                                                                    ' + #13 +
           '            WHERE                                                                                   ' + #13 +
           '                 (HI2.IDTIPOINVEST   = :IDTIPOINVEST)                                               ' + #13 +
           '            AND   (((:IDPLANPREVCTBPATR IS NULL) AND (HI2.IDPLANPREVCTBPATR > 0)) OR                ' + #13 +
           '                   ((:IDPLANPREVCTBPATR IS NOT NULL) AND  (HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))) ' + #13 +
           '            AND  (HI2.IDFUNDOINVEST > 0)                                                            ' + #13 +
           '            AND  (HI2.DATAAPLICACAO <= TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                              ' + #13 +
           '            AND  (HI2.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND                     ' + #13 +
           '                                           TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                          ' + #13 +
           '            AND    ((:IDTIPOCOTA IS NULL) OR (HI2.IDTIPOCOTA = :IDTIPOCOTA))                        ' + #13 +
           '            AND  (HI2.TIPMOVFUNDO   <> '+QuotedStr('PIR')+')                                                       ' + #13 +
           '            GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2.IDFUNDOINVEST, HI2.DATAAPLICACAO, ' + #13 +
           '                    HI2.DATAMOVFUNDO, HI2.IDTIPOCOTA) HI3,                                          ' + #13 +
           '                                                                                                    ' + #13 +
           '           (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO                                               ' + #13 +
           '            FROM   TIPOOPERACAO TP                                                                  ' + #13 +
           '            WHERE  (TP.IDTIPOINVEST = :IDTIPOINVEST) AND (TP.NATUREZAOPERACAO <> '+QuotedStr('R')+')) TP1          ' + #13 +
           '       WHERE                                                                                        ' + #13 +
           '            (HI1.IDTIPOINVEST   = :IDTIPOINVEST)                                                    ' + #13 +
           '       AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPREVCTBPATR = HI3.IDPLANPREVCTBPATR)) OR ' + #13 +
           '              ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))  ' + #13 +
           '       AND  (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)                                             ' + #13 +
           '       AND  (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)                                             ' + #13 +
           '       AND  (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)                                              ' + #13 +
           '       AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDTIPOCOTA))                             ' + #13 +
           '       AND  (HI1.TIPMOVFUNDO   <> '+QuotedStr('PIR')+')                                                            ' + #13 +
           '       AND  (TP1.IDTIPOINVEST   = HI1.IDTIPOINVEST)                                                 ' + #13 +
           '       AND  (TP1.IDTIPOOPERACAO = HI1.IDTIPOOPERACAO)                                               ' + #13 +
           '       GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDFUNDOINVEST, HI1.DATAAPLICACAO,      ' + #13 +
           '                HI1.IDTIPOCOTA) HIMAX                                                               ' + #13 +
           '    WHERE                                                                                           ' + #13 +
           '        (HI.IDHISTFUNDO = HIMAX.IDHISTFUNDO)                                                        ' + #13 +
           '    AND (HI.IDCOMPOSICAOFUNDO IS NULL)                                                              ' + #13 +
           '    AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))              ' + #13 +
           '    AND (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)                                                      ' + #13 +
           '    GROUP BY  HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST,                              ' + #13 +
           '              FI.IDTIPOFUNDOINVEST, FI.IDSEGMENTACAO, FI.DESCSEGMENTACAO, FI.DTAVIGENCIA) SLDATU,   ' + #13 +
           '                                                                                                    ' + #13 +
           '   (SELECT                                                                                          ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** INICIO **
           //'      (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVEST) AS ID,  ' + #13 +
           '      (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPATR) AS ID,  ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** FIM **
           '       SUM(NVL(HI.SALDOVLRFUNDO,0)) AS SALDOANTERIOR,                                               ' + #13 +
           '       0 AS VLRAPLICADO,                                                                            ' + #13 +
           '       0 AS VLRIRPROV  , 0 AS VLRIOFPROV , 0 AS VLRRESGATE, 0 AS VLRAPLICACAO,                      ' + #13 +
           '       0 AS VLRVARIACAO, 0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUIDO,                ' + #13 +
           '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR                                     ' + #13 +
           '    FROM                                                                                            ' + #13 +
           '       HISTFUNDO HI,                                                                                ' + #13 +
           '                                                                                                    ' + #13 +
           '      (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST                         ' + #13 +
           '       FROM HISTFUNDOINVEST HF1                                                                     ' + #13 +
           '       WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,' + QuotedStr(' DD/MM/YYYY, HH24:MI:SS') + ') IN ' + #13 +
           '             (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' + QuotedStr(' DD/MM/YYYY, HH24:MI:SS') + ') ' + #13 +
           '              FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF                                           ' + #13 +
           '              WHERE                                                                                 ' + #13 +
           '                  (TF.IDTIPOINVEST = :IDTIPOINVEST)                                                 ' + #13 +
           '              AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))    ' + #13 +
           '              AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAANT,'+QuotedStr('DD/MM/YYYY')+')+1)                        ' + #13 +
           '              AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                     ' + #13 +
           '              GROUP BY HF.IDFUNDOINVEST))) FI,                                ' + #13 +
           '                                                                                                    ' + #13 +
           '      (SELECT MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO                                                   ' + #13 +
           '       FROM HISTFUNDO HI1,                                                                          ' + #13 +
           '           (SELECT                                                                                  ' + #13 +
           '                 HI2.IDTIPOINVEST,                                                                  ' + #13 +
           '                 HI2.IDPLANPREVCTBPATR,                                                             ' + #13 +
           '                 HI2.IDFUNDOINVEST,                                                                 ' + #13 +
           '                 HI2.DATAAPLICACAO,                                                                 ' + #13 +
           '                 HI2.DATAMOVFUNDO                                                                   ' + #13 +
           '            FROM HISTFUNDO HI2                                                                      ' + #13 +
           '            WHERE                                                                                   ' + #13 +
           '                (HI2.IDTIPOINVEST  = :IDTIPOINVEST)                                                 ' + #13 +
           '            AND   (((:IDPLANPREVCTBPATR IS NULL) AND (HI2.IDPLANPREVCTBPATR > 0)) OR                ' + #13 +
           '                   ((:IDPLANPREVCTBPATR IS NOT NULL) AND  (HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))) ' + #13 +
           '            AND  (HI2.IDFUNDOINVEST > 0)                                                            ' + #13 +
           '            AND  (HI2.DATAAPLICACAO <= TO_DATE(:DATAANT,'+QuotedStr('DD/MM/YYYY')+'))                              ' + #13 +
           '            AND  (HI2.DATAMOVFUNDO   = TO_DATE(:DATAANT,'+QuotedStr('DD/MM/YYYY')+'))                              ' + #13 +
           '            AND    ((:IDTIPOCOTA IS NULL) OR (HI2.IDTIPOCOTA = :IDTIPOCOTA))                        ' + #13 +
           '            AND  (HI2.TIPMOVFUNDO   <> '+QuotedStr('PIR')+')                                                       ' + #13 +
           '            GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2.IDFUNDOINVEST, HI2.DATAAPLICACAO, ' + #13 +
           '                     HI2.DATAMOVFUNDO, HI2.IDTIPOCOTA) HI3,                                         ' + #13 +
           '                                                                                                    ' + #13 +
           '           (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO                                               ' + #13 +
           '            FROM   TIPOOPERACAO TP                                                                  ' + #13 +
           '            WHERE (TP.IDTIPOINVEST = :IDTIPOINVEST) AND (TP.NATUREZAOPERACAO <> '+QuotedStr('R')+')) TP1           ' + #13 +
           '       WHERE                                                                                        ' + #13 +
           '            (HI1.IDTIPOINVEST   = :IDTIPOINVEST)                                                    ' + #13 +
           '       AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPREVCTBPATR = HI3.IDPLANPREVCTBPATR)) OR ' + #13 +
           '              ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))  ' + #13 +
           '       AND  (HI1.IDFUNDOINVEST     = HI3.IDFUNDOINVEST)                                             ' + #13 +
           '       AND  (HI1.DATAAPLICACAO     = HI3.DATAAPLICACAO)                                             ' + #13 +
           '       AND  (HI1.DATAMOVFUNDO      = HI3.DATAMOVFUNDO)                                              ' + #13 +
           '       AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA =:IDTIPOCOTA))                              ' + #13 +
           '       AND  (HI1.TIPMOVFUNDO   <> '+QuotedStr('PIR')+')                                                            ' + #13 +
           '       AND  (HI1.IDTIPOINVEST   = TP1.IDTIPOINVEST)                                                 ' + #13 +
           '       AND  (HI1.IDTIPOOPERACAO = TP1.IDTIPOOPERACAO)                                               ' + #13 +
           '       GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDFUNDOINVEST, HI1.DATAAPLICACAO,      ' + #13 +
           '                HI1.DATAMOVFUNDO, HI1.IDTIPOCOTA) HIMAX1                                            ' + #13 +
           '    WHERE                                                                                           ' + #13 +
           '        (HI.IDHISTFUNDO = HIMAX1.IDHISTFUNDO)                                                       ' + #13 +
           '    AND (HI.SALDOQTDCOTAS > 0)                                                                      ' + #13 +
           '    AND (HI.IDCOMPOSICAOFUNDO IS NULL)                                                              ' + #13 +
           '    AND (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)                                                      ' + #13 +
           '    GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, FI.IDTIPOFUNDOINVEST) SLDANT, ' + #13 +
           '                                                                                                    ' + #13 +
           '   (SELECT                                                                                          ' + #13 +
           '       ID,                                                                                          ' + #13 +
           '       SUM(SALDOANTERIOR) AS SALDOANTERIOR, SUM(VLRAPLICADO) AS VLRAPLICADO, SUM(VLRIRPROV) AS VLRIRPROV, ' + #13 +
           '       SUM(VLRIOFPROV) AS VLRIOFPROV,                                                               ' + #13 +
           '       SUM(VLRAPLICACAO) AS VLRAPLICACAO, SUM(VLRINTEGRALIZ) AS VLRINTEGRALIZ, SUM(VLRRESGATE) AS VLRRESGATE, ' + #13 +
           '       SUM(VLRVARIACAO) AS VLRVARIACAO, SUM(SALDOQTDCOTAS) AS SALDOQTDCOTAS, SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDO, ' + #13 +
           '       SUM(SALDOLIQUIDO) AS SALDOLIQUIDO, SUM(VLRTAXAS) AS VLRTAXAS,                                ' + #13 +
           '       IDTIPOINVEST, IDFUNDOINVEST, IDPLANPREVCTBPATR                                               ' + #13 +
           '    FROM                                                                                            ' + #13 +
           '      (SELECT                                                                                       ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** INICIO **
           //'         (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVEST) AS ID, ' + #13 +
           '         (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPATR) AS ID, ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** FIM **
           '          0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 AS VLRIOFPROV ,                   ' + #13 +
           '          SUM(DECODE(HI.NATURMOVFUNDO,'+ QuotedStr('A')+',                                                          ' + #13 +
           '                        DECODE(HI.IDTIPOOPERACAO,-100,0,                                            ' + #13 +
                                        // SOL 166338.6801 Kintana 1451970 Otacilio Aquino
           '                            DECODE(HI.IDTIPOOPERACAO,-1005,0,                                       ' + #13 +
           '                                  DECODE(HI.IDTIPOOPERACAO,-105,0,HI.VLRMOVFUNDO))),0)) AS VLRAPLICACAO, ' + #13 +
           '          SUM(DECODE(HI.NATURMOVFUNDO,'+ QuotedStr('A')+',                                                          ' + #13 +
           '                        DECODE(HI.IDTIPOOPERACAO,-100,HI.VLRMOVFUNDO,                               ' + #13 +
                                        // SOL 166338.6801 Kintana 1451970 Otacilio Aquino
           '                            DECODE(HI.IDTIPOOPERACAO,-1005,HI.VLRMOVFUNDO,                          ' + #13 +
           '                                  DECODE(HI.IDTIPOOPERACAO,-105,HI.VLRMOVFUNDO,0))),0)) AS VLRINTEGRALIZ, ' + #13 +
           '          SUM(DECODE(HI.NATURMOVFUNDO,'+ QuotedStr('D')+',NVL(HI.VLRMOVFUNDO,0),0)) AS VLRRESGATE,                  ' + #13 +
           '          0 AS VLRVARIACAO,                                                                         ' + #13 +
           '          0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUIDO,                               ' + #13 +
           '                                                                                                    ' + #13 +
           '          SUM(DECODE(HI.IDTIPOOPERACAO, -43, DECODE(HMIN.IDHISTFUNDO, HI.IDHISTFUNDO,               ' + #13 +
           '                                                     NVL(TX.VLRTAXAS,0), 0), NVL(TX.VLRTAXAS,0)))+  ' + #13 +
           '          SUM(DECODE((SELECT MIN(O.IDOPERACAOFUNDO) FROM OPERACAOFUNDO O                            ' + #13 +
           '                      WHERE O.IDPEDIDOFUNDO = PD.IDPEDIDOFUNDO AND O.IDTIPOOPERACAO <> -177), PD.IDOPERACAOFUNDO, ' + #13 +
           '                      NVL(RGT.VLRTAXAS,0),0)) AS VLRTAXAS,                                          ' + #13 +
           '                                                                                                    ' + #13 +
           '          HI.IDTIPOINVEST, HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR                                   ' + #13 +
           '       FROM                                                                                         ' + #13 +
           '          HISTFUNDO HI,                                                                             ' + #13 +
           '                                                                                                    ' + #13 +
           '         (SELECT MIN(H.IDHISTFUNDO) AS IDHISTFUNDO,                                                 ' + #13 +
           '                 H.IDOPERACAOFUNDO                                                                  ' + #13 +
           '          FROM HISTFUNDO H                                                                          ' + #13 +
           '          WHERE                                                                                     ' + #13 +
           '               (H.IDTIPOINVEST   = :IDTIPOINVEST)                                                   ' + #13 +
           '          AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (H.IDPLANPREVCTBPATR > 0)) OR                 ' + #13 +
           '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (H.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))  ' + #13 +
           '          AND  (H.IDFUNDOINVEST > 0)                                                                ' + #13 +
           '          AND  (H.DATAAPLICACAO <= TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                                  ' + #13 +
           '          AND  (H.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND                         ' + #13 +
           '                                        TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                             ' + #13 +
           '          AND   ((:IDTIPOCOTA IS NULL) OR (H.IDTIPOCOTA = :IDTIPOCOTA))                             ' + #13 +
           '          AND   (H.TIPMOVFUNDO    = '+ QuotedStr('OPE')+')                                                          ' + #13 +
           '          AND   (H.IDCOMPOSICAOFUNDO IS NULL)                                                       ' + #13 +
           '          GROUP BY H.IDOPERACAOFUNDO) HMIN,                                                         ' + #13 +
           '                                                                                                    ' + #13 +
           '         (SELECT OP.VLRTAXAS, OP.IDOPERACAOORIGEM FROM OPERACAOFUNDO OP                             ' + #13 +
           '          WHERE                                                                                     ' + #13 +
           '                (OP.IDTIPOINVEST   = :IDTIPOINVEST)                                                 ' + #13 +
           '          AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR > 0)) OR               ' + #13 +
           '                 ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))) ' + #13 +
           '          AND   (OP.IDFUNDOINVEST > 0)                                                              ' + #13 +
           '          AND   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND                       ' + #13 +
           '                                         TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                            ' + #13 +
           '          AND   (OP.IDTIPOOPERACAO IN (-174,-175,-176))                                             ' + #13 +
           '          AND    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA))) TX,                      ' + #13 +
           '                                                                                                    ' + #13 +
           '         (SELECT OP.IDPEDIDOFUNDO, OP.IDOPERACAOFUNDO, OP.IDOPERACAOORIGEM FROM OPERACAOFUNDO OP    ' + #13 +
           '          WHERE                                                                                     ' + #13 +
           '                (OP.IDTIPOINVEST   = :IDTIPOINVEST)                                                 ' + #13 +
           '          AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR > 0)) OR               ' + #13 +
           '                 ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))) ' + #13 +
           '          AND   (OP.IDFUNDOINVEST > 0)                                                              ' + #13 +
           '          AND   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND                       ' + #13 +
           '                                         TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                            ' + #13 +
           '          AND   (OP.IDTIPOOPERACAO = -177)                                                          ' + #13 +
           '          AND    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA))                           ' + #13 +
           '          AND   (OP.IDPEDIDOFUNDO IS NOT NULL)                                                      ' + #13 +
           '          AND   (OP.IDOPERACAOORIGEM IS NOT NULL)) PD,                                              ' + #13 +
           '                                                                                                    ' + #13 +
           '         (SELECT OP.VLRTAXAS, OP.IDPEDIDOFUNDO FROM OPERACAOFUNDO OP                                ' + #13 +
           '          WHERE                                                                                     ' + #13 +
           '                (OP.IDTIPOINVEST   = :IDTIPOINVEST)                                                 ' + #13 +
           '          AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR > 0)) OR               ' + #13 +
           '                 ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))' + #13 +
           '          AND   (OP.IDFUNDOINVEST > 0)                                                              ' + #13 +
           '          AND   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND                       ' + #13 +
           '                                         TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                            ' + #13 +
           '          AND   (OP.IDTIPOOPERACAO = -177)                                                          ' + #13 +
           '          AND    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA))) RGT,                     ' + #13 +
           '                                                                                                    ' + #13 +
           '         (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST                      ' + #13 +
           '          FROM HISTFUNDOINVEST HF1                                                                  ' + #13 +
           '          WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'+ QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN ' + #13 +
           '                (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'+ QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ' + #13 +
           '                 FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF                                        ' + #13 +
           '                 WHERE                                                                              ' + #13 +
           '                     (TF.IDTIPOINVEST = :IDTIPOINVEST)                                              ' + #13 +
           '                 AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) ' + #13 +
           '                 AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')+1)                     ' + #13 +
           '                 AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                  ' + #13 +
           '                 AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                  ' + #13 +
           '                 GROUP BY HF.IDFUNDOINVEST))) FI,                             ' + #13 +
           '                                                                                                    ' + #13 +
           '         (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO, TP.NATUREZAOPERACAO                            ' + #13 +
           '          FROM   TIPOOPERACAO TP                                                                    ' + #13 +
           '          WHERE (TP.IDTIPOINVEST =:IDTIPOINVEST) AND (TP.NATUREZAOPERACAO <> '+QuotedStr('R')+')) TP               ' + #13 +
           '       WHERE                                                                                        ' + #13 +
           '             (HI.IDTIPOINVEST   = :IDTIPOINVEST)                                                    ' + #13 +
           '       AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI.IDPLANPREVCTBPATR > 0)) OR                  ' + #13 +
           '              ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))   ' + #13 +
           '       AND   (HI.IDFUNDOINVEST > 0)                                                                 ' + #13 +
           '       AND   (HI.DATAAPLICACAO <= TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                                   ' + #13 +
           '       AND   (HI.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND                          ' + #13 +
           '                                      TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                               ' + #13 +
           '       AND    ((:IDTIPOCOTA IS NULL) OR (HI.IDTIPOCOTA = :IDTIPOCOTA))                              ' + #13 +
           '       AND   (HI.TIPMOVFUNDO    = '+QuotedStr('OPE')+')                                                            ' + #13 +
           '       AND   (HI.IDCOMPOSICAOFUNDO IS NULL)                                                         ' + #13 +
           '       AND   (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)                                                 ' + #13 +
           '       AND   (HI.IDTIPOINVEST   = TP.IDTIPOINVEST)                                                  ' + #13 +
           '       AND   (HI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)                                                ' + #13 +
           '       AND   (TX.IDOPERACAOORIGEM(+)= HI.IDOPERACAOFUNDO)                                           ' + #13 +
           '       AND   (PD.IDOPERACAOORIGEM(+)= HI.IDOPERACAOFUNDO)                                           ' + #13 +
           '       AND  (RGT.IDPEDIDOFUNDO(+)   = PD.IDPEDIDOFUNDO)                                             ' + #13 +
           '       AND (HMIN.IDHISTFUNDO(+)     = HI.IDHISTFUNDO)                                               ' + #13 +
           '       GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST,                            ' + #13 +
           '                FI.IDTIPOFUNDOINVEST, HI.VLRAPLICADO, HI.IDTIPOOPERACAO)                            ' + #13 +
           '    GROUP BY ID, IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST) OPE,                               ' + #13 +
           '                                                                                                    ' + #13 +
           '   (SELECT                                                                                          ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** INICIO **
           //'      (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVEST) AS ID,  ' + #13 +
           '      (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPATR) AS ID,  ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** FIM **
           '       0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 AS VLRIOFPROV ,                      ' + #13 +
           '       SUM(DECODE(HI.NATURMOVFUNDO,'+QuotedStr('A')+',NVL(HI.VLRMOVFUNDO,0),0)) AS VLRENTRADA,                     ' + #13 +
           '       SUM(DECODE(HI.NATURMOVFUNDO,'+QuotedStr('D')+',NVL(HI.VLRMOVFUNDO,0),0))*-1 AS VLRSAIDA,                    ' + #13 +
           '       0 AS VLRVARIACAO,                                                                            ' + #13 +
           '       0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUIDO,                                  ' + #13 +
           '       HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR                                     ' + #13 +
           '    FROM HISTFUNDO HI,                                                                              ' + #13 +
           '                                                                                                    ' + #13 +
           '                                                                                                    ' + #13 +
           '       (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST                        ' + #13 +
           '         FROM HISTFUNDOINVEST HF1                                                                   ' + #13 ;

           //WILLIAM M. SANTOS - SOL Nº 131456 KINTANA Nº748685 - INI
           // '              WHERE (decode(NULL,NULL,1,HF1.IDTIPOFUNDOINVEST)||                      ' + #13 +
           if dblTipoFundo.LookupValue <> '' then
             sSql:= sSql+'         WHERE (decode('+dblTipoFundo.LookupValue+',NULL,1,HF1.IDTIPOFUNDOINVEST)||   ' + #13
           else
             sSql:= sSql+'         WHERE (decode(NULL,NULL,1,HF1.IDTIPOFUNDOINVEST)||                           ' + #13 ;
           //WILLIAM M. SANTOS - SOL Nº 131456 KINTANA Nº748685 - FIM

           sSql:= sSql+'           HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN           ' + #13 ;

              if dblTipoFundo.LookupValue <> '' then
                 sSql:= sSql+'    (SELECT decode('+dblTipoFundo.LookupValue+', NULL,1,HF.IDTIPOFUNDOINVEST)||                    ' + #13
              else
                 sSql:= sSql+'    (SELECT decode(NULL, NULL,1,HF.IDTIPOFUNDOINVEST)||                    ' + #13;

           sSql:= sSql+'  HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+')    ' + #13 +
           '                FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF                                         ' + #13 +
           '                WHERE                                                                               ' + #13 +
           '                    (TF.IDTIPOINVEST = :IDTIPOINVEST)                                               ' + #13 +
           '                AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))  ' + #13 +
           '                AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')+1)                      ' + #13 +
           '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                   ' + #13;

           if dblTipoFundo.LookupValue <> '' then
             sSql:= sSql+'  GROUP BY decode('+dblTipoFundo.LookupValue+',NULL,1,HF.IDTIPOFUNDOINVEST), HF.IDFUNDOINVEST))) FI, ' + #13
           else
             sSql:= sSql+'   GROUP BY decode(NULL,NULL,1,HF.IDTIPOFUNDOINVEST), HF.IDFUNDOINVEST))) FI, ' + #13;

           sSql := sSql +'                                                                                      ' + #13 +
           '                                                                                                    ' + #13 +
           '                                                                                                    ' + #13 +
           '        (SELECT                                                                                     ' + #13 +
           '            MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO                                                     ' + #13 +
           '         FROM HISTFUNDO HI1,                                                                        ' + #13 +
           '                                                                                                    ' + #13 +
           '             (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST                  ' + #13 +
           '              FROM HISTFUNDOINVEST HF1                                                              ' + #13  ;

          //WILLIAM M. SANTOS - SOL Nº 131456 KINTANA Nº748685 - INI
        // '              WHERE (decode(NULL,NULL,1,HF1.IDTIPOFUNDOINVEST)||                      ' + #13 +
           if dblTipoFundo.LookupValue <> '' then
             sSql:= sSql+'         WHERE (decode('+dblTipoFundo.LookupValue+',NULL,1,HF1.IDTIPOFUNDOINVEST)||   ' + #13 
           else
             sSql:= sSql+'         WHERE (decode(NULL,NULL,1,HF1.IDTIPOFUNDOINVEST)||                           ' + #13 ;
           //WILLIAM M. SANTOS - SOL Nº 131456 KINTANA Nº748685 - FIM
           sSql:= sSql+'                  HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN      ' + #13;

              if dblTipoFundo.LookupValue <> '' then
                 sSql:= sSql+'    (SELECT decode('+dblTipoFundo.LookupValue+', NULL,1,HF2.IDTIPOFUNDOINVEST)||                    ' + #13 
              else
                 sSql:= sSql+'    (SELECT decode(NULL, NULL,1,HF2.IDTIPOFUNDOINVEST)||                    ' + #13;

            sSql:= sSql+'     HF2.IDFUNDOINVEST || TO_CHAR(MAX(HF2.DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ' + #13 +
           '                     FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF2                                  ' + #13 +
           '                     WHERE                                                                          ' + #13 +
           '                         (TF2.IDTIPOINVEST = :IDTIPOINVEST)                                         ' + #13 +
           '                     AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF2.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) ' + #13 +
           '                     AND (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')+1)                ' + #13 +
           '                     AND (HF2.IDTIPOFUNDOINVEST = TF2.IDTIPOFUNDOINVEST)                            ' + #13;

                   if dblTipoFundo.LookupValue <> '' then
                       sSql:= sSql+' GROUP BY decode('+dblTipoFundo.LookupValue+',NULL,1,HF2.IDTIPOFUNDOINVEST), HF2.IDFUNDOINVEST))) FI1 ' + #13
                        else
                       sSql:= sSql+' GROUP BY decode(NULL,NULL,1,HF2.IDTIPOFUNDOINVEST), HF2.IDFUNDOINVEST))) FI1 ' + #13;

            sSql := sSql +'           WHERE                                                                     ' + #13 +
           '              (HI1.IDTIPOINVEST   = :IDTIPOINVEST)                                                  ' + #13 +
           '         AND   (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPREVCTBPATR > 0)) OR               ' + #13 +
           '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))' + #13 +
           '         AND  (HI1.IDFUNDOINVEST > 0)                                                               ' + #13 +
           '         AND  (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                                 ' + #13 +
           '         AND  (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND                        ' + #13 +
           '                                        TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                             ' + #13 +
           '         AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDTIPOCOTA))                           ' + #13 +
           '         AND ((HI1.TIPMOVFUNDO    = '+QuotedStr('OPE')+') OR (HI1.TIPMOVFUNDO = '+QuotedStr('TRP')+') OR (HI1.TIPMOVFUNDO = '+QuotedStr('TRT')+')) ' + #13 +
           '         AND  (HI1.IDTIPOOPERACAO IN (-107,-108,-160,-161))                                         ' + #13 +
           '         AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)                                                       ' + #13 +
           '         AND  (FI1.IDFUNDOINVEST  = HI1.IDFUNDOINVEST)                                              ' + #13 +
           '         GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDFUNDOINVEST, HI1.DATAAPLICACAO,    ' + #13 +
           '                  HI1.DATAMOVFUNDO, HI1.IDOPERACAOFUNDO, HI1.IDTIPOCOTA, FI1.IDTIPOFUNDOINVEST) HMAX ' + #13 +
           '    WHERE                                                                                           ' + #13 +
           '         (HI.IDHISTFUNDO    = HMAX.IDHISTFUNDO)                                                     ' + #13 +
           '    AND  (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)                                                     ' + #13 +
           '    GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, FI.IDTIPOFUNDOINVEST) TRP,    ' + #13 +
           '                                                                                                    ' + #13 +
           '   (SELECT                                                                                          ' + #13 +
           // SOL 178236 KTN 1636025 Otacilio Aquino  ** INICIO **
           //Ricardo Cristiano - 18/02/2010 - N. Sol 131143 -  N. Kintana 744252
           //'       (OP.IDTIPOINVEST || OP.IDPLANPREVCTBPATR || OP.IDFUNDOINVEST ) AS ID, ' + #13 +
           '       (OP.IDTIPOINVEST || OP.IDFUNDOINVEST || OP.IDPLANPREVCTBPATR) AS ID, ' + #13 +
           // SOL 178236 KTN 1636025 Otacilio Aquino  ** FIM **
           '       SUM(DECODE(TP.IDTIPOOPERACAO, -43, NVL(OP.VLROPERACAO,0),0)) AS VLRAMORTIZ,                  ' + #13 +
           '       SUM(DECODE(TP.IDTIPOOPERACAO,-143, NVL(OP.VLROPERACAO,0),0)) AS VLRAMORTIZREC,               ' + #13 +
           '       SUM(DECODE(TP.NATUREZAOPERACAO,'+QuotedStr('R')+',NVL(OP.VLROPERACAO,0),0)) AS VLRDIVIDENDO,                ' + #13 +
           '       OP.IDTIPOINVEST , OP.IDFUNDOINVEST, OP.IDPLANPREVCTBPATR                                     ' + #13 +
           '    FROM                                                                                            ' + #13 +
           '       OPERACAOFUNDO OP,                                                                            ' + #13 +
           '                                                                                                    ' + #13 +
           '      (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST                         ' + #13 +
           '       FROM HISTFUNDOINVEST HF1                                                                     ' + #13 +
           '       WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN ' + #13 +
           '             (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+')'+ #13 +
           '              FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF                                           ' + #13 +
           '              WHERE                                                                                 ' + #13 +
           '                  (TF.IDTIPOINVEST = :IDTIPOINVEST)                                                 ' + #13 +
           '              AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))    ' + #13 +
           '              AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')+1)                        ' + #13 +
           '              AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                     ' + #13 +
           '              GROUP BY HF.IDFUNDOINVEST))) FI,                                ' + #13 +
           '                                                                                                    ' + #13 +
           '      (SELECT TP.IDTIPOINVEST, TP.IDTIPOOPERACAO, TP.NATUREZAOPERACAO                               ' + #13 +
           '       FROM   TIPOOPERACAO TP                                                                       ' + #13 +
           '       WHERE ((TP.IDTIPOINVEST =:IDTIPOINVEST) AND (TP.NATUREZAOPERACAO = '+QuotedStr('R')+') OR (TP.IDTIPOOPERACAO IN (-43,-143)))) TP ' + #13 +
           '    WHERE                                                                                           ' + #13 +
           '         (OP.IDTIPOINVEST    = :IDTIPOINVEST)                                                       ' + #13 +
           '    AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR > 0)) OR                      ' + #13 +
           '          ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))       ' + #13 +
           '    AND  (OP.IDFUNDOINVEST > 0)                                                                     ' + #13 +
           '    AND  (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND               ' + #13 +
           '                                  TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                    ' + #13 +
           '    AND   ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA))                                  ' + #13 +
           '    AND  (FI.IDFUNDOINVEST  = OP.IDFUNDOINVEST)                                                     ' + #13 +
           '    AND  (OP.IDTIPOINVEST   = TP.IDTIPOINVEST)                                                      ' + #13 +
           '    AND  (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)                                                    ' + #13 +
           '    GROUP BY OP.IDTIPOINVEST, OP.IDPLANPREVCTBPATR, OP.IDFUNDOINVEST, FI.IDTIPOFUNDOINVEST) AMODIV, ' + #13 +
           '                                                                                                    ' + #13 +
           '   (SELECT                                                                                          ' + #13 +
           '      VATUTRP.ID,                                                                                   ' + #13 +
           '      SUM(NVL(VATUTRP.SALDOANTERIOR,0)) AS SALDOANTERIOR,                                           ' + #13 +
           '      SUM(NVL(VATUTRP.VLRAPLICADO,0))   AS VLRAPLICADO,                                             ' + #13 +
           '      SUM(NVL(VATUTRP.VLRIRPROV,0))     AS VLRIRPROV,                                               ' + #13 +
           '      SUM(NVL(VATUTRP.VLRIOFPROV,0))    AS VLRIOFPROV,                                              ' + #13 +
           '      SUM(NVL(VATUTRP.VLRAPLICACAO,0))  AS VLRAPLICACAO,                                            ' + #13 +
           '      SUM(NVL(VATUTRP.VLRRESGATE,0))    AS VLRRESGATE,                                              ' + #13 +
           '      SUM(NVL(VATUTRP.VLRVARIACAO,0))   AS VLRVARIACAO,                                             ' + #13 +
           '      SUM(NVL(VATUTRP.SALDOQTDCOTAS,0)) AS SALDOQTDCOTAS,                                           ' + #13 +
           '      SUM(NVL(VATUTRP.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO,                                           ' + #13 +
           '      SUM(NVL(VATUTRP.SALDOLIQUIDO,0))  AS SALDOLIQUIDO,                                            ' + #13 +
           '      VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOINVEST, VATUTRP.IDPLANPREVCTBPATR, VATUTRP.IDTIPOFUNDOINVEST ' + #13 +
           '   FROM                                                                                             ' + #13 +
           '      (SELECT                                                                                       ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** INICIO **
           //'          (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVEST) AS ID, ' + #13 +
           '          (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPATR) AS ID, ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** FIM **
           '           0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 AS VLRIOFPROV ,                  ' + #13 +
           '           0 AS VLRAPLICACAO,                                                                       ' + #13 +
           '           0 AS VLRRESGATE,                                                                         ' + #13 +
           '           SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,                                               ' + #13 +
           '           0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUIDO,                              ' + #13 +
           '           HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR, FI.IDTIPOFUNDOINVEST           ' + #13 +
           '       FROM                                                                                         ' + #13 +
           '          HISTFUNDO HI,                                                                             ' + #13 +
           '         (SELECT MAX(H.IDHISTFUNDO) AS IDHISTFUNDO                                                  ' + #13 +
           '          FROM HISTFUNDO H                                                                          ' + #13 +
           '          WHERE                                                                                     ' + #13 +
           '               (H.IDTIPOINVEST   = :IDTIPOINVEST)                                                   ' + #13 +
           '          AND (((:IDPLANPREVCTBPATR IS NULL)     AND (H.IDPLANPREVCTBPATR > 0)) OR                  ' + #13 +
           '               ((:IDPLANPREVCTBPATR IS NOT NULL) AND (H.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))   ' + #13 +
           '          AND  (H.IDFUNDOINVEST > 0)                                                                ' + #13 +
           '          AND  (H.DATAAPLICACAO <= TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                                  ' + #13 +
           '          AND  (H.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND                         ' + #13 +
           '                                       TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                              ' + #13 +
           '                                                                                                    ' + #13 +
           '          AND  ((:IDTIPOCOTA IS NULL) OR (H.IDTIPOCOTA = :IDTIPOCOTA))                              ' + #13 +
           '                                                                                                    ' + #13 +
           '          AND ((H.TIPMOVFUNDO    = '+QuotedStr('ATU')+') OR (H.TIPMOVFUNDO  = '+QuotedStr('AJU')+')    OR                         ' + #13 +
//Ricardo Cristiano - 24/02/2010 - N. Sol 131393 -  N. Kintana 747826           
//           '              ((H.TIPMOVFUNDO    = '+QuotedStr('OPE')+') AND ((H.IDTIPOOPERACAO = -106) OR                         ' + #13 +
           '              ((H.TIPMOVFUNDO    = '+QuotedStr('OPE')+') AND ((H.IDTIPOOPERACAO = -105) OR                         ' + #13 +
                               // SOL 166338.6801 Kintana 1451970 Otacilio Aquino
           '               (H.IDTIPOOPERACAO = -100) OR (H.IDTIPOOPERACAO = -1005) )) )                         ' + #13 +
           '          AND  (H.IDCOMPOSICAOFUNDO IS NULL)                                                        ' + #13 +
           '          GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUNDOINVEST, H.DATAAPLICACAO,           ' + #13 +
           '                   H.DATAMOVFUNDO, H.IDTIPOCOTA) HI1,                                               ' + #13 +
           '                                                                                                    ' + #13 +
           '         (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST                      ' + #13 +
           '          FROM HISTFUNDOINVEST HF1                                                                  ' + #13 +
           '          WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN ' + #13 +
           '                (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ' + #13 +
           '                 FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF                                        ' + #13 +
           '                 WHERE                                                                              ' + #13 +
           '                     (TF.IDTIPOINVEST = :IDTIPOINVEST)                                              ' + #13 +
           '                 AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) ' + #13 +
           '                 AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')+1)                     ' + #13 +
           '                 AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                  ' + #13 +
           '                 GROUP BY HF.IDFUNDOINVEST))) FI                              ' + #13 +
           '       WHERE                                                                                        ' + #13 +
           '           (HI.IDHISTFUNDO = HI1.IDHISTFUNDO)                                                       ' + #13 +
           '       AND (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)                                                   ' + #13 ;

           // Kintana 1613211 SOL 176518 Otacilio ** INICIO **
           {// Kintana 1602376 SOL 175860 Otacilio
           if (dblkFundoInvest.Text <> '') then
            sSql :=  sSql +   '      AND (HI.IDFUNDOINVEST = :IDFUNDOINVEST)                                                       ' + #13 ;
           // Kintana 1613211 SOL 176518 Otacilio ** FIM ** }

           sSql :=  sSql +
           '       GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, FI.IDTIPOFUNDOINVEST       ' + #13 +
           '                                                                                                    ' + #13 +
           '       UNION                                                                                        ' + #13 +
           '                                                                                                    ' + #13 +
           '       SELECT                                                                                       ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** INICIO **
           //'         (HI.IDTIPOINVEST || HI.IDPLANPREVCTBPATR || HI.IDFUNDOINVEST) AS ID, ' + #13 +
           '         (HI.IDTIPOINVEST || HI.IDFUNDOINVEST || HI.IDPLANPREVCTBPATR) AS ID, ' + #13 +
           // SOL 177857 KTN 1631932 Otacilio Aquino  ** FIM **
           '          0 AS SALDOANTERIOR, 0 AS VLRAPLICADO, 0 AS VLRIRPROV, 0 AS VLRIOFPROV ,                   ' + #13 +
           '          0 AS VLRAPLICACAO,                                                                        ' + #13 +
           '          0 AS VLRRESGATE,                                                                          ' + #13 +
           '          SUM(NVL(HI.VLRVARIACAO,0)) AS VLRVARIACAO,                                                ' + #13 +
           '          0 AS SALDOQTDCOTAS, 0 AS SALDOVLRFUNDO, 0 AS  SALDOLIQUIDO,                               ' + #13 +
           '          HI.IDTIPOINVEST , HI.IDFUNDOINVEST, HI.IDPLANPREVCTBPATR, FI.IDTIPOFUNDOINVEST            ' + #13 +
           '       FROM                                                                                         ' + #13 +
           '          HISTFUNDO HI,                                                                             ' + #13 +
           '                                                                                                    ' + #13 +
           '         (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST                      ' + #13 +
           '          FROM HISTFUNDOINVEST HF1                                                                  ' + #13 +
           '          WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN ' + #13 +
           '                (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ' + #13 +
           '                 FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF                                        ' + #13 +
           '                 WHERE                                                                              ' + #13 +
           '                     (TF.IDTIPOINVEST = :IDTIPOINVEST)                                              ' + #13 +
           '                 AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) ' + #13 +
           '                 AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')+1)                     ' + #13 +
           '                 AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                  ' + #13 +
           '                 GROUP BY HF.IDFUNDOINVEST))) FI,                             ' + #13 +
           '                                                                                                    ' + #13 +
           '         (SELECT                                                                                    ' + #13 +
           '             MAX(HI1.IDHISTFUNDO) AS IDHISTFUNDO                                                    ' + #13 +
           '          FROM                                                                                      ' + #13 +
           '             HISTFUNDO HI1,                                                                         ' + #13 +
           '                                                                                                    ' + #13 +
           '            (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST                   ' + #13 +
           '             FROM HISTFUNDOINVEST HF1                                                               ' + #13 +
           '             WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN ' + #13 +
           '                   (SELECT HF2.IDFUNDOINVEST || TO_CHAR(MAX(HF2.DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ' + #13 +
           '                    FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF2                                   ' + #13 +
           '                    WHERE                                                                           ' + #13 +
           '                        (TF2.IDTIPOINVEST = :IDTIPOINVEST)                                          ' + #13 +
           '                    AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF2.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) ' + #13 +
           '                    AND (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')+1)                 ' + #13 +
           '                    AND (HF2.IDTIPOFUNDOINVEST = TF2.IDTIPOFUNDOINVEST)                             ' + #13 +
           '                    GROUP BY HF2.IDFUNDOINVEST))) FI1                        ' + #13 +
           '                                                                                                    ' + #13 +
           '          WHERE                                                                                     ' + #13 +
           '               (HI1.IDTIPOINVEST    = :IDTIPOINVEST)                                                ' + #13 +
           '          AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (HI1.IDPLANPREVCTBPATR > 0)) OR               ' + #13 +
           '                ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))' + #13 +
           '          AND  (HI1.IDFUNDOINVEST > 0)                                                              ' + #13 +
           '          AND  (HI1.DATAAPLICACAO <= TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                                ' + #13 +
           '          AND  (HI1.DATAMOVFUNDO BETWEEN TO_DATE(:DATAINI,'+QuotedStr('DD/MM/YYYY')+')   AND                       ' + #13 +
           '                                         TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+'))                            ' + #13 +
           '                                                                                                    ' + #13 +
           '          AND    ((:IDTIPOCOTA IS NULL) OR (HI1.IDTIPOCOTA = :IDTIPOCOTA))                          ' + #13 +
           '                                                                                                    ' + #13 +
           '          AND ((HI1.TIPMOVFUNDO    = '+QuotedStr('OPE')+') OR (HI1.TIPMOVFUNDO = '+QuotedStr('TRP')+') OR (HI1.TIPMOVFUNDO = '+QuotedStr('TRT')+'))' + #13 +
           '          AND  (HI1.IDTIPOOPERACAO IN (-107,-108,-160,-161))                                        ' + #13 +
           '          AND  (HI1.IDCOMPOSICAOFUNDO IS NULL)                                                      ' + #13 +
           '          AND  (FI1.IDFUNDOINVEST  = HI1.IDFUNDOINVEST)                                             ' + #13 +
           '          GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, HI1.IDFUNDOINVEST, HI1.DATAAPLICACAO,   ' + #13 +
           '                   HI1.DATAMOVFUNDO, HI1.IDOPERACAOFUNDO, HI1.IDTIPOCOTA, FI1.IDTIPOFUNDOINVEST) HMAX ' + #13 +
           '       WHERE                                                                                        ' + #13 +
           '            NVL(HI.VLRVARIACAO,0) <> 0                                                              ' + #13 +
           '       AND     (HI.IDHISTFUNDO    = HMAX.IDHISTFUNDO)                                               ' + #13 +
           '       AND     (FI.IDFUNDOINVEST  = HI.IDFUNDOINVEST)                                               ' + #13 ;

           // Kintana 1613211 SOL 176518 Otacilio ** INICIO **
           {// Kintana 1602376 SOL 175860 Otacilio
           if (dblkFundoInvest.Text <> '') then
             sSql :=  sSql + '      AND (HI.IDFUNDOINVEST = :IDFUNDOINVEST)                                                       ' + #13 ;
           // Kintana 1613211 SOL 176518 Otacilio ** FIM ** }

           sSql :=  sSql +
           '       GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, FI.IDTIPOFUNDOINVEST) VATUTRP ' + #13 +
           '                                                                                                    ' + #13 +
           '    GROUP BY VATUTRP.ID, VATUTRP.IDTIPOINVEST, VATUTRP.IDFUNDOINVEST,                               ' + #13 +
           '             VATUTRP.IDPLANPREVCTBPATR, VATUTRP.IDTIPOFUNDOINVEST) ATU,                             ' + #13 +
           '                                                                                                    ' + #13 +
           '   (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST                            ' + #13 +
           '    FROM HISTFUNDOINVEST HF1                                                                        ' + #13 +
           '    WHERE ( HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') IN ' + #13 +
           '          (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'+QuotedStr('DD/MM/YYYY, HH24:MI:SS')+') ' + #13 +
           '           FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF                                              ' + #13 +
           '           WHERE                                                                                    ' + #13 +
           '               (TF.IDTIPOINVEST = :IDTIPOINVEST)                                                    ' + #13 +
           '           AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))       ' + #13 +
           '           AND (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAFIM,'+QuotedStr('DD/MM/YYYY')+')+1)                           ' + #13 +
           '           AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                        ' + #13 +
           '           GROUP BY HF.IDFUNDOINVEST))) FI,                                   ' + #13 +
           '                                                                                                    ' + #13 +
           '   (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'+QuotedStr(' - ')+'|| PE.NOME) AS PLANPRVCONTABPATRO                  ' + #13 +
           '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL                                     ' + #13 +
           '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))                                                             ' + #13 +
           '    AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLA,                                                     ' + #13 +
           '                                                                                                    ' + #13 +
           '   (SELECT TI1.DESCTIPOINVEST ||'+QuotedStr(' - ')+'|| TF1.DESCTIPOFUNDOINV AS DESCTIPOFUNDOINV,    ' + #13 +
           '           TF1.IDTIPOFUNDOINVEST                                                                    ' + #13 +
           '    FROM   TIPOFUNDOINVEST TF1, TIPOINVEST TI1                                                      ' + #13 +
           '    WHERE                                                                                           ' + #13 +
           '        (TI1.IDTIPOINVEST = :IDTIPOINVEST)                                                          ' + #13 +
           '    AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (TF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))            ' + #13 +
           '    AND (TF1.IDTIPOINVEST = TI1.IDTIPOINVEST)) TF                                                   ' + #13 +
           '                                                                                                    ' + #13 +
           ' WHERE                                                                                              ' + #13 +
           '     (SLDATU.ID = SLDANT.ID(+))                                                                     ' + #13 +
           ' AND (SLDATU.ID = OPE.ID(+))                                                                        ' + #13 +
           ' AND (SLDATU.ID = TRP.ID(+))                                                                        ' + #13 +
           ' AND (SLDATU.ID = AMODIV.ID(+))                                                                     ' + #13 +
           ' AND (SLDATU.ID = ATU.ID(+))                                                                        ' + #13 +
           ' AND (SLDATU.IDFUNDOINVEST     = FI.IDFUNDOINVEST)                                                  ' + #13 +
          // ' AND (SLDATU.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST)                                              ' + #13 +
           ' AND (SLDATU.IDPLANPREVCTBPATR = PLA.IDPLANPREVCTBPATR)                                             ' + #13 +
           ' AND (FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                                  ' + #13 +
          // ' AND (SLDATU.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)                                              ' + #13 +
           ' AND (SLDATU.IDFUNDOINVEST = VIGENCIA.IDFUNDOINVEST)                                                ' + #13 +
           ' AND (SLDATU.DTAVIGENCIA = VIGENCIA.DTAVIGENCIA)                                                    ' + #13 +
           ' ORDER BY TF.DESCTIPOFUNDOINV, PLA.PLANPRVCONTABPATRO, FI.DESCFUNDOINVEST                           ' + #13;

   //Al_6
   with DmRelMapaInvFdo do
   begin
      //AL_9
      try
         qryMapaInvestFdoOutros.Close;
         qryMapaInvestFdoOutros.sql.Clear;
         qryMapaInvestFdoOutros.sql.Add(sSql);

         qryMapaInvestFdoOutros.DisableControls;

         qryMapaInvestFdoOutros.Filter    := '';
         qryMapaInvestFdoOutros.Filtered  := False;

///         OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvestFdoOutros);


         qryMapaInvestFdoOutros.ParamByName('DATAANT').DataType           := FtString;
         qryMapaInvestFdoOutros.ParamByName('DATAFIM').DataType           := FtString;
         qryMapaInvestFdoOutros.ParamByName('IDTIPOINVEST').DataType      := FtInteger;
         qryMapaInvestFdoOutros.ParamByName('IDPLANPREVCTBPATR').DataType := FtInteger;
         qryMapaInvestFdoOutros.ParamByName('IDTIPOCOTA').DataType        := FtInteger;
         qryMapaInvestFdoOutros.ParamByName('IDTIPOFUNDOINVEST').DataType := ftInteger;

         // Kintana 1613211 SOL 176518 Otacilio ** INICIO **
         {// Kintana 1602376 SOL 175860 Otacilio
         if (dblkFundoInvest.Text <> '') then
           qryMapaInvestFdoOutros.ParamByName('IDFUNDOINVEST').DataType     := ftInteger;
         // Kintana 1613211 SOL 176518 Otacilio ** FIM ** }


         qryMapaInvestFdoOutros.ParamByName('DATAINI').AsString := dtDataIni.Text;
         //AL_13
         //AL_3
//        qryMapaInvestFdoOutros.ParamByName('IDTIPOFUNDOINVEST')


         if iTipoInvestUsu = 7 then  //Fundo Imobiliário
            dDataAnt := StrToDate(dtDataIni.Text)-1
         else
            dDataAnt := DiasUteisInv.UltDiaUtilAnterior(StrToDate(dtDataIni.Text),-1,1,'',True,False,False);

         qryMapaInvestFdoOutros.ParamByName('DATAANT').AsString := DateToStr(dDataAnt);

         qryMapaInvestFdoOutros.ParamByName('DATAFIM').AsString := dtDataFim.Text;
         qryMapaInvestFdoOutros.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;

         if Trim(dblPlanPrevCtbPatr.Text) <> ''  then
            qryMapaInvestFdoOutros.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);

         if (dblTipoFundo.Text <> '') then
            qryMapaInvestFdoOutros.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);

         if ((dblTipoCota.Visible) And (dblTipoCota.Text <> '')) then
            qryMapaInvestFdoOutros.ParamByName('IDTIPOCOTA').AsInteger := StrToInt(dblTipoCota.LookupValue);

         // Kintana 1613211 SOL 176518 Otacilio ** INICIO **
         {// Kintana 1602376 SOL 175860 Otacilio
         if (dblkFundoInvest.Text <> '') then
           qryMapaInvestFdoOutros.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblkFundoInvest.LookupValue);
         // Kintana 1613211 SOL 176518 Otacilio ** FIM ** }



         qryMapaInvestFdoOutros.Open;

         if Trim(dblkFundoInvest.Text) <> ''  then
            qryMapaInvestFdoOutros.Filter    := 'IDFUNDOINVEST  = '+dblkFundoInvest.LookupValue;

         if (Trim(dblSegmentacao.Text) <> '') and (qryMapaInvestFdoOutros.Filter <> '') then
            qryMapaInvestFdoOutros.Filter := qryMapaInvestFdoOutros.Filter + 'AND IDSEGMENTACAO = ' + dblSegmentacao.LookupValue
         else if (Trim(dblSegmentacao.Text) <> '') then
            qryMapaInvestFdoOutros.Filter := 'IDSEGMENTACAO = ' + dblSegmentacao.LookupValue;

         if (qryMapaInvestFdoOutros.Filter <> '') then
            qryMapaInvestFdoOutros.Filtered  := True;

      finally
         qryMapaInvestFdoOutros.EnableControls;
      end;

      if qryMapaInvestFdoOutros.IsEmpty then
      begin
         OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvestFdoOutrosAn);
         MsgDlg('Nenhum saldo foi encontrado neste período !','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dtDataIni.CanFocus then
            dtDataIni.SetFocus;
         Exit;
      end;

      try
         qryMapaInvestFdoOutrosAn.DisableControls;

         //AL_8
         qryMapaInvestFdoOutrosAn.Filter    := '';
         qryMapaInvestFdoOutrosAn.Filtered  := False;

         OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvestFdoOutrosAn);
         qryMapaInvestFdoOutrosAn.ParamByName('DATAINI').AsString := dtDataIni.Text;
         qryMapaInvestFdoOutrosAn.ParamByName('DATAANT').AsString := DateToStr(dDataAnt);
         qryMapaInvestFdoOutrosAn.ParamByName('DATAFIM').AsString := dtDataFim.Text;
         qryMapaInvestFdoOutrosAn.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;

         if Trim(dblPlanPrevCtbPatr.Text) <> ''  then
            qryMapaInvestFdoOutrosAn.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);

         if (dblTipoFundo.Text <> '') then
            qryMapaInvestFdoOutrosAn.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);

         if ((dblTipoCota.Visible) And (dblTipoCota.Text <> '')) then
            qryMapaInvestFdoOutrosAn.ParamByName('IDTIPOCOTA').AsInteger := StrToInt(dblTipoCota.LookupValue);


         qryMapaInvestFdoOutrosAn.Open;


         if (Trim(dblkFundoInvest.Text) <> '') then
         begin
            qryMapaInvestFdoOutrosAn.Filter    := 'IDFUNDOINVEST  = '+dblkFundoInvest.LookupValue;
            qryMapaInvestFdoOutrosAn.Filtered  := True;
         end;
      finally
         qryMapaInvestFdoOutrosAn.EnableControls;
      end;
   end;

end;

procedure TfrmConsMapaInvFdoAcoes.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   with DmRelMapaInvFdo do
   begin
      if not qryMapaInvestFdoOutros.IsEmpty then
      begin
        //AL_9
         lblTipoCota.Visible := (iTipoInvestUsu in [9,10]);
         ppTipoCota.Visible  := (iTipoInvestUsu in [9,10]);

         //Al_6
         lblPeriodoFdoAcoes.Caption := 'Período : ' + dtDataIni.Text + ' a ' + dtDataFim.Text;

         //AL_8
         try
            qryMapaInvestFdoOutros.DisableControls;
            TfrmPreview.CreateModalPreview(Application,
                                           DmRelMapaInvFdo.rptMapaInvestFdoOutros,
                                           DmRelMapaInvFdo.rptMapaInvestFdoOutros.PrinterSetup.DocumentName);
         finally
            qryMapaInvestFdoOutros.EnableControls;
         end;
      end;
   end;
end;

procedure TfrmConsMapaInvFdoAcoes.dbgLanContPerRFCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

//Al_6
procedure TfrmConsMapaInvFdoAcoes.dblkFundoInvestExit(Sender: TObject);
begin
  inherited;
  with DmRelMapaInvFdo do
  begin
     //AL_14
     if ((not bModif) and (not qryMapaInvestFdoOutros.IsEmpty)) then
     begin
        //AL_9
        qryMapaInvestFdoOutros.DisableControls;
        qryMapaInvestFdoOutros.Filter        := '';
        qryMapaInvestFdoOutros.Filtered      := False;
        if Trim(dblkFundoInvest.Text) <> '' then
        begin
           if qryMapaInvestFdoOutros.Locate('IDFUNDOINVEST',dblkFundoInvest.LookupValue,[]) then
           begin
              qryMapaInvestFdoOutros.Filter    := 'IDFUNDOINVEST  = '+dblkFundoInvest.LookupValue;
              qryMapaInvestFdoOutros.Filtered  := True;
           end
           else
              dblkFundoInvest.Text := '';
        end;
        qryMapaInvestFdoOutros.EnableControls;
     end;
  end;
  bModif := false;
end;

//Al_6
procedure TfrmConsMapaInvFdoAcoes.dblkFundoInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_14
  bModif := modified;
  with DmRelMapaInvFdo do
  begin
     if ((modified) And (Not qryMapaInvestFdoOutros.IsEmpty)) then
     begin
        //AL_9
        qryMapaInvestFdoOutros.DisableControls;
        // Kintana 1613211 SOL 176518 Otacilio ** INICIO **
        AbreQry;
        qryMapaInvestFdoOutros.Filter      := '';
        qryMapaInvestFdoOutros.Filtered    := False;
        if Trim(dblkFundoInvest.Text) <> '' then
        begin
           if qryMapaInvestFdoOutros.Locate('IDFUNDOINVEST',dblkFundoInvest.LookupValue,[]) then
           begin
              qryMapaInvestFdoOutros.Filter    := 'IDFUNDOINVEST  = '+dblkFundoInvest.LookupValue;
              qryMapaInvestFdoOutros.Filtered  := True;
           end
           else
              dblkFundoInvest.Text := '';
        end;
        // Kintana 1613211 SOL 176518 Otacilio ** FIM **
        qryMapaInvestFdoOutros.EnableControls;
     end;
  end;
end;

procedure TfrmConsMapaInvFdoAcoes.dblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if modified then
   begin
      with DmRelMapaInvFdo do
      begin
         OperComum.LimpaParametros(DmRelMapaInvFdo.qryFundoInvestAcoes);
         qryFundoInvestAcoes.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
         if Trim(dblTipoFundo.Text) <> '' then
            qryFundoInvestAcoes.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
         //AL_14
         if Trim(dtDataFim.Text) <> '' then
            qryFundoInvestAcoes.ParamByName('DATAMOVFUNDO').AsString := dtDataFim.Text;
         //AL_10
         qryFundoInvestAcoes.Open;
      end;
   end;
end;

procedure TfrmConsMapaInvFdoAcoes.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
   //AL_14
   if ((not bModif) or (Trim(dblTipoFundo.Text) = '') and (sVarAnt <> dblTipoFundo.LookupValue)) then
   begin
      with DmRelMapaInvFdo do
      begin
         OperComum.LimpaParametros(DmRelMapaInvFdo.qryFundoInvestAcoes);
         qryFundoInvestAcoes.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
         if Trim(dblTipoFundo.Text) <> '' then
            qryFundoInvestAcoes.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
         if Trim(dtDataFim.Text) <> '' then
            qryFundoInvestAcoes.ParamByName('DATAMOVFUNDO').AsString := dtDataFim.Text;
         //AL_10
         qryFundoInvestAcoes.Open;
      end;
   end;
   bModif := false;
end;

procedure TfrmConsMapaInvFdoAcoes.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   //AL_11
   with DmRelMapaInvFdo do
   begin
      Try
         qryMapaInvestFdoOutros.DisableControls;

         qryMapaInvestFdoOutros.Filter    := '';
         qryMapaInvestFdoOutros.Filtered  := False;

         OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvestFdoOutros);
         DmRelMapaInvFdo.qryMapaInvestFdoOutros.Open;
      finally
         qryMapaInvestFdoOutros.EnableControls;
      end;

      Try
         qryMapaInvestFdoOutrosAn.DisableControls;

         qryMapaInvestFdoOutrosAn.Filter    := '';
         qryMapaInvestFdoOutrosAn.Filtered  := False;

         OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvestFdoOutrosAn);
         DmRelMapaInvFdo.qryMapaInvestFdoOutrosAn.Open;
      finally
         qryMapaInvestFdoOutrosAn.EnableControls;
      end;
   end;
end;

//AL_14
procedure TfrmConsMapaInvFdoAcoes.dtDataFimExit(Sender: TObject);
begin
  inherited;
   with DmRelMapaInvFdo do
   begin
      OperComum.LimpaParametros(DmRelMapaInvFdo.qryFundoInvestAcoes);
      qryFundoInvestAcoes.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      if Trim(dblTipoFundo.Text) <> '' then
         qryFundoInvestAcoes.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
      if Trim(dtDataFim.Text) <> '' then
         qryFundoInvestAcoes.ParamByName('DATAMOVFUNDO').AsString := dtDataFim.Text;
      qryFundoInvestAcoes.Open;

      OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvestFdoOutros);
      OperComum.LimpaParametros(DmRelMapaInvFdo.qryMapaInvestFdoOutrosAn);

   end;
end;

//AL_14
procedure TfrmConsMapaInvFdoAcoes.dblTipoFundoEnter(Sender: TObject);
begin
  inherited;
   sVarAnt := dblTipoFundo.LookupValue;
end;

end.
