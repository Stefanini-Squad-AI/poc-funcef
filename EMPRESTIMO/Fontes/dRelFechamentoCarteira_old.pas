{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelFechamentoCarteira_old;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TdtmRelFechamentoCarteira_old = class(TdtmReports)
      pplFechamentoCarteira: TppBDEPipeline;
      dsFechamentoCarteira: TwwDataSource;
      rptFechamentoCarteira: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppShape1: TppShape;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBText11: TppDBText;
      ppLine3: TppLine;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppLabel122: TppLabel;
      rptContratosAdminAnalShape1: TppShape;
      ppShape2: TppShape;
      ppLine4: TppLine;
      ppShape3: TppShape;
      ppLabel13: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLine1: TppLine;
      qryFechamentoCarteira: TwwQuery;
      StringField1: TStringField;
      StringField2: TStringField;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      FloatField7: TFloatField;
      FloatField8: TFloatField;
      FloatField9: TFloatField;
      FloatField10: TFloatField;
      FloatField11: TFloatField;
      FloatField12: TFloatField;
      FloatField13: TFloatField;
      FloatField14: TFloatField;
      FloatField15: TFloatField;
      FloatField16: TFloatField;
      FloatField17: TFloatField;
      FloatField18: TFloatField;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBCalc19: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppDBCalc21: TppDBCalc;
      ppDBCalc22: TppDBCalc;
      ppDBCalc23: TppDBCalc;
      ppDBCalc24: TppDBCalc;
      ppDBCalc25: TppDBCalc;
      ppDBCalc26: TppDBCalc;
      ppDBCalc27: TppDBCalc;
      ppDBCalc28: TppDBCalc;
      ppDBCalc29: TppDBCalc;
      ppDBCalc30: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppDBCalc32: TppDBCalc;
      ppDBCalc33: TppDBCalc;
      ppDBCalc34: TppDBCalc;
      ppDBCalc35: TppDBCalc;
      ppDBCalc36: TppDBCalc;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLabel13Print(Sender: TObject);
      procedure qryFechamentoCarteiraBeforeOpen(DataSet: TDataSet);


   private { Private declarations }

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

   public { Public declarations }

      sMesCompetencia   : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelFechamentoCarteira_old: TdtmRelFechamentoCarteira_old;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelFechamentoCarteira;




function TdtmRelFechamentoCarteira_old.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelfechamentocarteira') then begin
      frm := TcfgRelFechamentoCarteira.Create(Application);
   end else begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelFechamentoCarteira_old.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelFechamentoCarteira_old.ppShape3Print(Sender: TObject);
begin
   inherited;

   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelFechamentoCarteira_old.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCompetencia;
end;



procedure TdtmRelFechamentoCarteira_old.qryFechamentoCarteiraBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   (* Gravando o SQL de entrada para permitir verificação *)
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryFechamentoCarteira.SQL.SaveToFile(Sistema.TempDir + 'FechamentoCarteira.txt');
   qryFechamentoCarteira.SQL.SaveToFile(ftempregra + '\' + 'FechamentoCarteira.txt');
   Application.ProcessMessages;
end;



end.


{


SELECT /*+ ORDERED */

   TEP.DESCTIPOEMPTMO,
   TCE.TCEDESCRICAO,

   NVL(SALDOANT.SALDODEV, 0)           AS SALDODEV,
   NVL(SALDOANT.TOTALSLDDEV, 0)        AS TOTALSLDDEV,
   NVL(CONCESSOES.CONCESSOES, 0)       AS CONCESSOES,
   NVL(CONCESSOES.TOTALCONCESSOES, 0)  AS TOTALCONCESSOES,
   NVL(RENOVACOES.RENOVACOES, 0)       AS RENOVACOES,
   NVL(RENOVACOES.TOTALRENOV, 0)       AS TOTALRENOV,
   NVL(PARCELAS.PARCELAS, 0)           AS PARCELAS,
   NVL(PARCELAS.TOTALPARC, 0)          AS TOTALPARC,
   NVL(ENCARGOS.ENCARGOS, 0)           AS ENCARGOS,
   NVL(ENCARGOS.TOTALENC, 0)           AS TOTALENC,
   NVL(AMORT.AMORTIZACAO, 0)           AS AMORTIZACAO,
   NVL(AMORT.TOTALAMO, 0)              AS TOTALAMO,
   NVL(QUITACAO.QUITACAO, 0)           AS QUITACAO,
   NVL(QUITACAO.TOTALQUI, 0)           AS TOTALQUI,
   NVL(QUITMORT.QUIT_MORT, 0)          AS QUIT_MORT,
   NVL(QUITMORT.TOTALQUM, 0)           AS TOTALQUM,
   NVL(SALDOATU.SALDOATU, 0)           AS SALDOATU,
   NVL(SALDOATU.TOTALSLA, 0)           AS TOTALSLA

FROM
   TIPOCONTREMPTMO TCE, TIPOEMPTMO TEP,

-- SALDO ANTERIOR ----------------------------------------------------------------------------------
   (
   SELECT
      A.IDTIPOCONTREMPTMO, NVL(SUM(SLD.HMESALDODEV), 0) AS SALDODEV,
      NVL(COUNT(SLD.IDCONTRATOEMPTMO),0) AS TOTALSLDDEV
   FROM
      TIPOCONTREMPTMO A,
      (
      SELECT
         TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO,
         NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV
      FROM
         TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C,
         (
         SELECT  /*+ INDEX(ITC) */
            CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO
         FROM
            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,
            ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE
         WHERE
                ( ITC.ITCTRATASALDODEV   <> 0 )
            AND ( CON.FLGSITUACAO        <> 'C' )
            AND ( HME.HMEDATAATUALIZA    <= TO_DATE('31/01/2002', 'DD/MM/YYYY') )
            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )
            AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )
            AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )
            AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )
            AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )
            AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )
            AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )
            AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )
         GROUP BY
            CON.IDCONTRATOEMPTMO
         ) M
      WHERE
             M.IDHISTMOVEMPTMO   = H.IDHISTMOVEMPTMO
         AND M.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO
         AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO
         AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO
      GROUP BY
            TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO
      ) SLD
   WHERE
      A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO(+)
   GROUP BY
      A.IDTIPOCONTREMPTMO
   ) SALDOANT,

-- FIM SALDO ANTERIOR ------------------------------------------------------------------------------

-- CONCESSOES --------------------------------------------------------------------------------------
   (
   SELECT
      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS CONCESSOES,
      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALCONCESSOES
   FROM
      TIPOCONTREMPTMO A,
      (
      SELECT
         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,
         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO
      FROM
         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,
         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC
      WHERE
             C.IDCONTRQUITACAO      IS NULL
         AND C.FLGSITUACAO         <> 'C'
         AND HMETIPOMOV             = 0
         AND HMEPARCELA             = 0
         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )
         AND HME.HMEANOCOMPETENCIA  = 2002
         AND HME.HMEMESCOMPETENCIA  = 02
         AND ITC.ITCSEQCALCULO      = (
                                      SELECT /*+ INDEX(ITEMXTIPOCONTR) */
                                         MIN(ITCSEQCALCULO) AS ITCSEQCALCULO
                                      FROM
                                         ITEMXTIPOCONTR
                                      WHERE
                                             ITCEVENTO = 0
                                         AND IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO
                                      )
         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO
         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO
         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO
         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO
      ) CON
   WHERE
      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)
   GROUP BY
      A.IDTIPOCONTREMPTMO
   ) CONCESSOES,

-- FIM CONCESSÕES ----------------------------------------------------------------------------------

-- RENOVAÇÕES --------------------------------------------------------------------------------------
   (
   SELECT
      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS RENOVACOES,
      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALRENOV
   FROM
      TIPOCONTREMPTMO A,
      (
      SELECT
         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,
         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO
      FROM
         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, CONTRATOEMPTMO A,
         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC,
         (
         SELECT /*+ INDEX(ITEMXTIPOCONTR) */
            MIN(ITCSEQCALCULO) AS ITCSEQCALCULO, IDITEMEMPTMO, IDTIPOCONTREMPTMO
         FROM
            ITEMXTIPOCONTR
         WHERE
            ITCEVENTO = 0
         GROUP BY
            IDITEMEMPTMO, IDTIPOCONTREMPTMO
   	   ) ITS
      WHERE
             A.IDCONTRQUITACAO      IS NOT NULL
         AND C.FLGSITUACAO         <> 'C'
         AND C.IDCONTRATOEMPTMO     = A.IDCONTRQUITACAO
         AND HMETIPOMOV             = 0
         AND HMEPARCELA             = 0
         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )
         AND HME.HMEANOCOMPETENCIA  = 2002
         AND HME.HMEMESCOMPETENCIA  = 02
         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO
         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO
         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO
         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO
         AND TC.IDTIPOCONTREMPTMO   = ITS.IDTIPOCONTREMPTMO
         AND HME.IDITEMEMPTMO       = ITS.IDITEMEMPTMO
      ) CON
   GROUP BY
      A.IDTIPOCONTREMPTMO
   ) RENOVACOES,

-- FIM RENOVAÇÕES ----------------------------------------------------------------------------------

-- PARCELAS ----------------------------------------------------------------------------------------
   (
   SELECT
      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PARCELAS,
      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC
   FROM
      TIPOCONTREMPTMO A,
      (
      SELECT
         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,
         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO
      FROM
         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,
         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC
      WHERE
             HMETIPOMOV             = 1
         AND HMECENTRALIZA          = 1
         AND C.FLGSITUACAO         <> 'C'
         AND FLGESTORNADO           IS NULL
         AND HME.HMEANOCOMPETENCIA  = 2002
         AND HME.HMEMESCOMPETENCIA  = 02
         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )
         AND (( NULL    IS NULL) OR (ITC.ITCTRATASALDODEV <>  NULL  ))
         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO
         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO
         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO
         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO
      ) CON
   WHERE
      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)
   GROUP BY
      A.IDTIPOCONTREMPTMO
   ) PARCELAS,

-- FIM PARCELAS ------------------------------------------------------------------------------------

-- ENCARGOS ----------------------------------------------------------------------------------------
   (
   SELECT
      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS ENCARGOS,
      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC
   FROM
      TIPOCONTREMPTMO A,
      (
      SELECT /*+ INDEX(ITC) */
         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,
         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO
      FROM
         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,
         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC
      WHERE
             HMETIPOMOV             = 4
         AND HMECENTRALIZA          = 0
         AND C.FLGSITUACAO         <> 'C'
         AND FLGESTORNADO           IS NULL
         AND HME.HMEANOCOMPETENCIA  = 2002 
         AND HME.HMEMESCOMPETENCIA  = 02 
         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )
         AND (( NULL    IS NULL) OR (ITC.ITCTRATASALDODEV <>  NULL  ))
         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO
         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO
         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO
         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO
      ) CON
   WHERE
      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)
   GROUP BY
      A.IDTIPOCONTREMPTMO
   ) ENCARGOS,

-- FIM ENCARGOS ------------------------------------------------------------------------------------

-- AMORTIZAÇÃO -------------------------------------------------------------------------------------
   (
   SELECT
      A.IDTIPOCONTREMPTMO,
      NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO,
      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO
   FROM
      TIPOCONTREMPTMO A,
      (
      SELECT /*+ INDEX(ITC) */
         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,
         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO
      FROM
         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,
         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC
      WHERE
             HMETIPOMOV             = 2
         AND HMECENTRALIZA          = 1
         AND C.FLGSITUACAO         <> 'C'
         AND FLGESTORNADO           IS NULL
         AND HME.HMEANOCOMPETENCIA  = 2002 
         AND HME.HMEMESCOMPETENCIA  = 02 
         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )
         AND (( NULL    IS NULL) OR (ITC.ITCTRATASALDODEV <>  NULL  ))
         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO
         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO
         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO
         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO
      ) CON
   WHERE
      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)
   GROUP BY
      A.IDTIPOCONTREMPTMO
   ) AMORT,

-- FIM AMORTIZAÇÃO ---------------------------------------------------------------------------------

-- QUITAÇÂO ----------------------------------------------------------------------------------------
   (
   SELECT
      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUITACAO,
      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI
   FROM
      TIPOCONTREMPTMO A,
      (
      SELECT /*+ INDEX(ITC) */
         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,
         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO
      FROM
         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,
         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC
      WHERE
             HMETIPOMOV             = 3
         AND HMEORIGEM             <> 8
         AND C.FLGSITUACAO         <> 'C'
         AND FLGESTORNADO           IS NULL
         AND HME.HMEANOCOMPETENCIA  = 2002
         AND HME.HMEMESCOMPETENCIA  = 02
         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )
         AND ITC.ITCTRATASALDODEV  <> 0
         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO
         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO
         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO
         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO
      ) CON
   WHERE
      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)
   GROUP BY
      A.IDTIPOCONTREMPTMO
   ) QUITACAO,

-- FIM QUITAÇÃO ------------------------------------------------------------------------------------

-- QUITAÇÃO POR MORTE ------------------------------------------------------------------------------
   (
   SELECT
      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QUIT_MORT,
      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUM
   FROM
      TIPOCONTREMPTMO A,
      (
      SELECT /*+ INDEX(ITC) */
         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,
         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO
      FROM
         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,
         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC
      WHERE
             HMETIPOMOV             = 3
         AND HMEORIGEM              = 8
         AND C.FLGSITUACAO         <> 'C'
         AND FLGESTORNADO           IS NULL
         AND HME.HMEANOCOMPETENCIA  = 2002
         AND HME.HMEMESCOMPETENCIA  = 02
         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )
         AND ITC.ITCTRATASALDODEV  <> 0
         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO
         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO
         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO
         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO
      ) CON
   WHERE
      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)
   GROUP BY
      A.IDTIPOCONTREMPTMO
   ) QUITMORT,

-- FIM QUITAÇÃO POR MORTE --------------------------------------------------------------------------

-- SALDO ATUAL -------------------------------------------------------------------------------------
   (
   SELECT
      A.IDTIPOCONTREMPTMO, NVL(SUM(SLD.HMESALDODEV), 0) AS SALDOATU,
      NVL(COUNT(SLD.IDCONTRATOEMPTMO),0) AS TOTALSLA
   FROM
      TIPOCONTREMPTMO A,
      (
      SELECT
         TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO,
         NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV
      FROM
         TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C,
         (
         SELECT  /*+ INDEX(ITC) */
            CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO
         FROM
            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,
            ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE
         WHERE
                ( ITC.ITCTRATASALDODEV   <> 0 )
            AND ( CON.FLGSITUACAO        <> 'C' )
            AND ( HME.HMEDATAATUALIZA    <= TO_DATE('28/02/2002', 'DD/MM/YYYY') )
            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )
            AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )
            AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )
            AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )
            AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )
            AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )
            AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )
            AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )
         GROUP BY
            CON.IDCONTRATOEMPTMO
         ) M
      WHERE
             M.IDHISTMOVEMPTMO   = H.IDHISTMOVEMPTMO
         AND M.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO
         AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO
         AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO
      GROUP BY
         TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO
      ) SLD
   WHERE
      A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO(+)
   GROUP BY
      A.IDTIPOCONTREMPTMO
   ) SALDOATU

-- FIM SALDO ATUAL ---------------------------------------------------------------------------------

WHERE
       TEP.IDEMPRESAPROP      = 1
   AND ( (NULL      IS NULL) OR (TEP.IDTIPOEMPTMO       = NULL) )
   AND ( (NULL IS NULL) OR (TCE.IDTIPOCONTREMPTMO  = NULL) )
   AND TCE.IDTIPOCONTREMPTMO  = SALDOANT.IDTIPOCONTREMPTMO(+)
   AND TCE.IDTIPOCONTREMPTMO  = CONCESSOES.IDTIPOCONTREMPTMO(+)
   AND TCE.IDTIPOCONTREMPTMO  = RENOVACOES.IDTIPOCONTREMPTMO(+)
   AND TCE.IDTIPOCONTREMPTMO  = PARCELAS.IDTIPOCONTREMPTMO(+)
   AND TCE.IDTIPOCONTREMPTMO  = ENCARGOS.IDTIPOCONTREMPTMO(+)
   AND TCE.IDTIPOCONTREMPTMO  = AMORT.IDTIPOCONTREMPTMO(+)
   AND TCE.IDTIPOCONTREMPTMO  = QUITACAO.IDTIPOCONTREMPTMO(+)
   AND TCE.IDTIPOCONTREMPTMO  = QUITMORT.IDTIPOCONTREMPTMO(+)
   AND TCE.IDTIPOCONTREMPTMO  = SALDOATU.IDTIPOCONTREMPTMO(+)
   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO

ORDER BY
   TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO
