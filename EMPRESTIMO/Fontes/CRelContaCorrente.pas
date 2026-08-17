{  --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185  PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 13/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelContaCorrente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

  uTypesEmptmo, mParticipante, mMutuario, mListaPatro, mListaPlano;

type
   TcfgRelContaCorrente = class(TcfgRel)
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label3: TLabel;
      DBcboSitPlanoPrev: TwwDBLookupCombo;
      rdgOrdenar: TRadioGroup;
      rdgAnalSint: TRadioGroup;
      molMutuario: TmolMutuario;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molParticipante1btnBuscaPartClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;
      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
  cfgRelContaCorrente: TcfgRelContaCorrente;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   dRelContaCorrente,
   FProgresso,
   uMensErro;




procedure TcfgRelContaCorrente.AbreQueries;
begin
   // Tipo de Contrato
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Situação do Participante
   LimpaParametros(dtmLookEmptmo.qryLookSitPlanoPrev);
   dtmLookEmptmo.qryLookSitPlanoPrev.Open;
end;




procedure TcfgRelContaCorrente.MontaQuery;
begin
   inherited;

   with dtmRelContaCorrente do
   begin
      sMesCompetencia   := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha         := chkCorLinha.Checked;
      CorLinha          := cboCorLinha.SelectedColor;

      case rdgAnalSint.ItemIndex of
         0: tAnalSint   := trAnalitico;
         1: tAnalSint   := trSintetico;
      end;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelContaCorrente.FiltraRelatorio;
var
   sPrimDiaMes : String;
   sUltDiaMes  : String;
   sMes, sAno  : String;
   sSQL        : String;
begin
   // monta a forma de cobrança ------------------------------------------------------------------- *)

   sMes        := FormatFloat('00', cboMes.ItemIndex + 1);
   sAno        := FormatFloat('0000', DBspnAno.Value);
   sPrimDiaMes := '01/' + sMes + '/' + sAno;
   sUltDiaMes  := FormatDateTime('dd/mm/yyyy', DiasUteis.UltDiaMes(Trunc(DbspnAno.Value), (cboMes.ItemIndex + 1)));

   sSQL :=
   'SELECT '                                                                              + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                            + #13 +
   '   PES.IDPESSOA, CON.IDTIPOCONTREMPTMO, '                                             + #13 +
   '   DECODE(CON.IDPESSOA, CON.IDBENEF, '''', ELP.MATRICULA) AS MATRICTIT, '             + #13 +
   '   DEP.MATRICULA, '                                                                   + #13 +
   '   SPP.IDSITPLANOPREV, SPP.DESCRICAO, '                                               + #13 +
   '   TCE.TCEDESCRICAO, '                                                                + #13 +
   '   PES.NOME, DECODE(CON.IDPESSOA, CON.IDBENEF, '''', PTIT.NOME) AS NOMETIT, '         + #13 +
   '   CON.DATAASSINATURA, CON.DATACREDITO, CON.NUMPARCELAS, '                            + #13 +
   '   PARC.HMEPARCELA, '                                                                 + #13 +
   '   DECODE(NVL(PARC.HMEVLRPREVISTO, 0), 0, CON.VLRPARCELA, NVL(PARC.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                   + #13 +
   '   NVL(PAG.HMEVLREFETIVO, 0) AS HMEVLREFETIVO, '                                      + #13 +
   '   PARC.HMEDATAPREVISTA, PARC.HMEDATAVENCTO, PARC.HMEDATAEFETIVA, '                   + #13 +

   '   DECODE( NVL(SLD_ANT.SLD_DEV_ANT, 0), 0, '                                          +
             '(NVL(SLD_ATU.SLD_DEV_ATU, 0) + NVL(DEV_ATU.VLR_DEV_ATU, 0)), '              +
             'NVL(SLD_ANT.SLD_DEV_ANT, 0) ) AS VLR_ANT, '                                 + #13 +

   '   NVL(SLD_ANT.SLD_DEV_ANT, 0) AS SLD_DEV_ANT, '                                      + #13 +
   '   NVL(DEV_ANT.VLR_DEV_ANT, 0) AS VLR_DEV_ANT, '                                      + #13 +
   '   NVL(SLD_ATU.SLD_DEV_ATU, 0) AS SLD_DEV_ATU, '                                      + #13 +
   '   NVL(DEV_ATU.VLR_DEV_ATU, 0) AS VLR_DEV_ATU, '                                      + #13 +

   '   (NVL(SLD_ATU.SLD_DEV_ATU, 0) + NVL(DEV_ATU.VLR_DEV_ATU, 0)) AS VLR_ATU, '          + #13 +
   '   NVL(VLR_PAGO.VLR_PAGO, 0) AS VLR_PAGO, '                                           + #13 +

   // Marchetti - Pendencia 19969
   '  DECODE(CON.FLGSITUACAO,''A'', ''Contrato Ativo'', '                                + #13 +
   '                         ''C'', ''Contrato Cancelado'', '                            + #13 +
   '                         ''E'', ''Contrato Encerrado'', '                            + #13 +
   '                         ''Q'', ''Contrato Quitado'', '                              + #13 +
   '                         ''R'', ''Contrato Refinanciado'', '                         + #13 +
   '                         ''S'', ''Contrato Suspenso'', '                             + #13 +
   '                         ''P'', ''Contrato Pendente de Liberação'', '                + #13 +
   '                         ''K'', ''Contrato Pendente de Quitação'') AS DESCSITCONTRATO, ' + #13 +
   '  QUIT.HMEDATAPREVISTA AS DATA_QUITACAO '                                            + #13 +
   // Fim Marchetti - Pendencia 19969

   'FROM '                                                                                + #13 +
   '   PESSOA           PES,  '                                                           + #13 +
   '   PESSOA           PTIT, '                                                           + #13 +
   '   DEPENTIT         DEP,  '                                                           + #13 +
   '   CONTRATOEMPTMO   CON,  '                                                           + #13 +
   '   PARTPREVPLAN     PPP,  '                                                           + #13 +
   '   ELEGPATRO        ELP,  '                                                           + #13 +
   '   TIPOCONTREMPTMO  TCE,  '                                                           + #13 +
   '   SITPLANOPREV     SPP,  '                                                           + #13 +

// -------------------------------------------------------------------------------------------------

   '   /* -- Valor da Parcela do Mês -------------------------------------- */ '          + #13 +
   '   ( '                                                                                + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                                                          + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      CON.IDCONTRATOEMPTMO, HME.HMEPARCELA, '                                         + #13 +
   '      NVL(HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO, '                                 + #13 +
   '      NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO, '                                   + #13 +
   '      HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEDATAEFETIVA '                    + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                         + #13 +
   '   WHERE '                                                                            + #13 +
   '          HMETIPOMOV             = 1 '                                                + #13;

   if molMutuario.IDBenef <> -1 then
   sSQL := sSQL +
   '      AND CON.IDBENEF            = ' + IntToStr(molMutuario.IDBenef)                  + #13;

   sSQL := sSQL +
   '      AND HME.HMECENTRALIZA      = 1 '                                                + #13 +
   '      AND HME.HMESEQCOBRANCA     = 1 '                                                + #13 +
   '      AND HME.HMEANOCOMPETENCIA  = ' + FormatFloat('0000', DBspnAno.Value)            + #13 +
   '      AND HME.HMEMESCOMPETENCIA  = ' + IntToStr(cboMes.ItemIndex + 1)                 + #13 +

   '      AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) OR (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) ) ' + #13 +
   '      AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) OR (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) ) ' + #13 +

   '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '               + #13 +

   '      AND CON.FLGSITUACAO        <> ''C'' '                                           + #13 +
   '      AND ( CON.DATAASSINATURA   <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '      AND ( CON.DATACREDITO      <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +

   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                             + #13 +
   '   ) PARC, '                                                                          + #13 +
   '   /* -- Fim Valor da Parcela do Mês ---------------------------------- */ '          + #13 +

// -------------------------------------------------------------------------------------------------

   '   /* -- Valor PAGO no Mês -------------------------------------------- */ '          + #13 +
   '   ( '                                                                                + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                            + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      CON.IDCONTRATOEMPTMO, '                                                         + #13 +
   '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS HMEVLREFETIVO '                               + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                         + #13 +
   '   WHERE '                                                                            + #13 +
   '          HMETIPOMOV             IN (1, 2, 3, 4, 7) '                                 + #13;

   if molMutuario.IDBenef <> -1 then
   sSQL := sSQL +
   '      AND CON.IDBENEF            = ' + IntToStr(molMutuario.IDBenef)                  + #13;

   sSQL := sSQL +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                   + #13 +
   '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '               + #13 +

   '      AND ( HMEDATAEFETIVA       BETWEEN TO_DATE(' + QuotedStr(sPrimDiaMes) + ', ''DD/MM/YYYY'') AND '  +
                                            'TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) '     + #13 +

   '      AND CON.FLGSITUACAO        <> ''C'' '                                           + #13 +
   '      AND ( CON.DATAASSINATURA   <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '      AND ( CON.DATACREDITO      <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +

   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                             + #13 +
   '   GROUP BY '                                                                         + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                          + #13 +
   '   ) PAG, '                                                                           + #13 +
   '   /* -- Fim Valor PAGO no Mês ---------------------------------------- */ '          + #13 +

// -------------------------------------------------------------------------------------------------

   '   /* -- Valor em Aberto (Anterior) ----------------------------------- */ '          + #13 +
   '   ( '                                                                                + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '   SELECT '               + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV_ANT '          + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                         + #13 +
   '   WHERE '                                                                            + #13 +
   '          HMETIPOMOV             IN (4) '                                             + #13;

   if molMutuario.IDBenef <> -1 then
   sSQL := sSQL +
   '      AND CON.IDBENEF            = ' + IntToStr(molMutuario.IDBenef)                  + #13;

   sSQL := sSQL +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                   + #13 +

   '      AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) OR (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) ) ' + #13 +
   '      AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) OR (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) ) ' + #13 +

   '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '               + #13 +

   '      AND CON.FLGSITUACAO        <> ''C'''                                            + #13 +

   '      AND ( CON.DATAASSINATURA   <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '      AND ( CON.DATACREDITO      <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'')'                                   + #13 +
   '      AND ( (HME.HMEDATAEFETIVA  IS NULL) OR (HMEDATAEFETIVA > TO_DATE(' + QuotedStr(sPrimDiaMes) + ', ''DD/MM/YYYY'')) ) '  + #13 +

   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'                              + #13 +
   '   GROUP BY'                                                                          + #13 +
   '      CON.IDCONTRATOEMPTMO'                                                           + #13 +
   '   ) DEV_ANT,'                                                                        + #13 +
   '   /* -- Fim Valor em Aberto (Anterior) ------------------------------- */'           + #13 +

// -------------------------------------------------------------------------------------------------

   '   /* -- Total do Débito ---------------------------------------------- */ '          + #13 +
   '   ( '                                                                                + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '   SELECT '   + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim

   // Para contornar a questão das baixas parciais de encargos
   '      CON.IDCONTRATOEMPTMO, SUM(DECODE( HME.HMEVLREFETIVO, NULL, NVL(HME.HMEVLRPREVISTO, 0), NVL(HME.HMEVLREFETIVO, 0)) ) AS SLD_DEV_ANT '  + #13 +

   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                        + #13 +
   '      ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                       + #13 +
   '   WHERE '                                                                            + #13 +

   (* TUDO que foi gerado de débito = itens de cobrança ORIGINAIS + itens de ENCARGOS *)
   '          ( (ITC.ITCTRATASALDODEV   = 2) OR ( HMETIPOMOV = 4 ) ) '                    + #13;

   if molMutuario.IDBenef <> -1 then
   sSQL := sSQL +
   '      AND CON.IDBENEF              = ' + IntToStr(molMutuario.IDBenef)                + #13;

   sSQL := sSQL +
   '      AND ( HME.HMEDATAPREVISTA    <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) '  + #13 +
   '      AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) ) '             + #13 +

   '      AND ( CON.FLGSITUACAO        <> ''C'' ) '                                       + #13 +

   '      AND ( CON.DATAASSINATURA     <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '      AND ( CON.DATACREDITO        <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +

   '      AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                         + #13 +
   '      AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                        + #13 +
   '      AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                        + #13 +
   '      AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                        + #13 +
   '      AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                             + #13 +
   '      AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                             + #13 +
   '      AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                             + #13 +
   '   GROUP BY '                                                                         + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                          + #13 +
   '   ) SLD_ANT, '                                                                       + #13 +
   '   /* -- Fim Saldo Devedor Anterior ----------------------------------- */ '          + #13 +

// -------------------------------------------------------------------------------------------------

   '   /* -- Valor pago até o momento ("Amortizações") -------------------- */ '          + #13 +
   '   ( '                                                                                + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT  '                                                                          + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VLR_PAGO '              + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                         + #13 +
   '   WHERE'                                                                             + #13 +
   '          HMETIPOMOV             IN (1, 2, 3, 4, 7) '                                 + #13;

   if molMutuario.IDBenef <> -1 then
   sSQL := sSQL +
   '      AND CON.IDBENEF            = ' + IntToStr(molMutuario.IDBenef)                  + #13;

   sSQL := sSQL +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                   + #13 +
   '      AND HME.FLGBAIXADO         IS NULL '                                            + #13 +

   '      AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) OR (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) ) ' + #13 +
   '      AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) OR (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) ) ' + #13 +

   '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '               + #13 +
   '      AND CON.FLGSITUACAO        <> ''C'' '                                           + #13 +

   '      AND ( CON.DATAASSINATURA   <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '      AND ( CON.DATACREDITO      <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +

   '      AND HMEDATAPREVISTA        < TO_DATE(' + QuotedStr(sPrimDiaMes) + ', ''DD/MM/YYYY'') '   + #13 +
   '      AND HMEDATAEFETIVA         < TO_DATE(' + QuotedStr(sPrimDiaMes) + ', ''DD/MM/YYYY'') '   + #13 +

   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                             + #13 +
   '   GROUP BY '                                                                         + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                          + #13 +
   '   ) VLR_PAGO, '                                                                      + #13 +
   '   /* -- Fim Valor pago até o momento ("Amortizações") ---------------- */ '          + #13 +

   '   /* -- Valor em Aberto (Posterior) ---------------------------------- */ '          + #13 +
   '   ( '                                                                                + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '   SELECT '   + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV_ATU '          + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                         + #13 +
   '   WHERE '                                                                            + #13 +
   '          HMETIPOMOV             IN (1, 2, 3, 4, 7) '                                 + #13;

   if molMutuario.IDBenef <> -1 then
   sSQL := sSQL +
   '      AND CON.IDBENEF            = ' + IntToStr(molMutuario.IDBenef)                  + #13;

   sSQL := sSQL +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                   + #13 +

   '      AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) OR (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) ) ' + #13 +
   '      AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) OR (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') ) ) ' + #13 +

   '      AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) ) '               + #13 +
   '      AND CON.FLGSITUACAO        <> ''C'' '                                           + #13 +

   '      AND ( CON.DATAASSINATURA   <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '      AND ( CON.DATACREDITO      <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +

   '      AND HMEDATAPREVISTA        <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') '                                 + #13 +
   '      AND ( (HMEDATAEFETIVA      IS NULL) OR (HMEDATAEFETIVA > TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'')) ) '   + #13 +

   '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                             + #13 +
   '   GROUP BY '                                                                         + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                          + #13 +
   '   ) DEV_ATU, '                                                                       + #13 +
   '   /* -- Fim Valor em Aberto (Posterior) ------------------------------ */ '          + #13 +

// -------------------------------------------------------------------------------------------------

   '   /* -- Saldo Devedor "Posterior" ------------------------------------ */ '          + #13 +
   '   ( '                                                                                + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '   SELECT '                                 + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '      CON.IDCONTRATOEMPTMO, NVL(HME.HMESALDODEV, 0) AS SLD_DEV_ATU '                  + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                        + #13 +
   '      ( '                                                                             + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                  + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '              + #13 +
   '      FROM '                                                                          + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                     + #13 +
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                    + #13 +
   '      WHERE '                                                                         + #13 +
   '             ( ITC.ITCTRATASALDODEV   <> 0 ) '                                        + #13;

   if molMutuario.IDBenef <> -1 then
   sSQL := sSQL +
   '         AND CON.IDBENEF              = ' + IntToStr(molMutuario.IDBenef)             + #13;

   sSQL := sSQL +
   '         AND ( HME.HMEDATAATUALIZA    <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) ) '          + #13 +
   '         AND ( CON.FLGSITUACAO        <> ''C'' ) '                                    + #13 +

   '         AND ( CON.DATAASSINATURA     <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '         AND ( CON.DATACREDITO        <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +

   '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                      + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                     + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                     + #13 +
   '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                     + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                          + #13 +
   '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                          + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                          + #13 +
   '      GROUP BY '                                                                      + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                       + #13 +
   '      ) MAX '                                                                         + #13 +
   '   WHERE '                                                                            + #13 +
   '          ( CON.FLGSITUACAO        <> ''C'' ) '                                       + #13 +

   '      AND ( CON.DATAASSINATURA     <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '      AND ( CON.DATACREDITO        <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                         + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '                         + #13 +
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                          + #13 +
   '   ) SLD_ATU, '                                                                       + #13 +
   '   /* -- Fim Saldo Devedor "Posterior" -------------------------------- */ '          + #13 +

// -------------------------------------------------------------------------------------------------
   // Marchetti - pendencia 27570
   '   ( '                                                                                + #13 +
   '    SELECT DISTINCT HME.HMEDATAPREVISTA, HME.IDCONTRATOEMPTMO '                       + #13 +
   '    FROM   HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                    + #13 +
   '    WHERE  CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                              + #13 +
   '    AND    HME.HMETIPOMOV = 3 '                                                       + #13 +
   '    AND    HME.HMEORIGEM IN (0,3,8) '                                                 + #13 +
   '    AND    NVL(HME.FLGESTORNADO,0) = 0 '                                              + #13;
   // Fim Marchetti - pendencia 27570

   if molMutuario.IDBenef <> -1 then
      sSQL := sSQL +
       '    AND CON.IDBENEF              = ' + IntToStr(molMutuario.IDBenef)              + #13;

   sSQL := sSQL +
   '   ) QUIT '                                                                           + #13 +

   'WHERE  '                                                                              + #13 +
   '      CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                    + #13 +
   '  AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                    + #13 +

   '  AND ( CON.DATAASSINATURA  <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13 +
   '  AND ( CON.DATACREDITO     <= TO_DATE(' + QuotedStr(sUltDiaMes) + ', ''DD/MM/YYYY'') )'   + #13;

   // filtro por Mutuário
   if molMutuario.IDBenef <> -1 then sSQL := sSQL +
   '  AND CON.IDBenef            = ' + IntToStr(molMutuario.IDBenef)                            + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND TCE.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                            + #13;

   // filtro por Situação do Participante no Plano
   if DBcboSitPlanoPrev.LookupValue <> '' then sSQL := sSQL +
   '  AND PPP.IDSITPLANOPREV     = ' + DBcboSitPlanoPrev.LookupValue                       + #13;

   sSQL := sSQL +
   '  AND PES.IDPESSOA          = CON.IDBENEF '                                           + #13 +
   '  AND ELP.IDPESSOA          = CON.IDPESSOA '                                          + #13 +

   '  AND ELP.IDPESSJUR         = CON.IDPATRO '                                           + #13 +

   '  AND PTIT.IDPESSOA         = ELP.IDPESSOA '                                          + #13 +
   '  AND PTIT.IDPESSOA         = CON.IDPESSOA '                                          + #13 +

   '  AND DEP.IDTITULAR         = CON.IDPESSOA '                                          + #13 +
   '  AND DEP.IDPESSOA          = CON.IDBENEF '                                           + #13 +

   '  AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +

   '  AND ELP.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '  AND ELP.IDPESSJUR         = PPP.IDPESSJUR '                                         + #13 +
   '  AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '  AND CON.IDPATRO           = PPP.IDPESSJUR '                                         + #13 +
   '  AND CON.IDPLANOPREV       = PPP.IDPLANOPREV '                                       + #13 +

   '  AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +

   '  AND CON.IDCONTRATOEMPTMO  = PARC.IDCONTRATOEMPTMO(+) '                              + #13 +
   '  AND CON.IDCONTRATOEMPTMO  = SLD_ANT.IDCONTRATOEMPTMO(+) '                           + #13 +
   '  AND CON.IDCONTRATOEMPTMO  = DEV_ANT.IDCONTRATOEMPTMO(+) '                           + #13 +
   '  AND CON.IDCONTRATOEMPTMO  = VLR_PAGO.IDCONTRATOEMPTMO(+) '                          + #13 +
   '  AND CON.IDCONTRATOEMPTMO  = SLD_ATU.IDCONTRATOEMPTMO(+) '                           + #13 +
   '  AND CON.IDCONTRATOEMPTMO  = DEV_ATU.IDCONTRATOEMPTMO(+) '                           + #13 +
   '  AND CON.IDCONTRATOEMPTMO  = PAG.IDCONTRATOEMPTMO(+) '                               + #13 +
   '  AND CON.IDCONTRATOEMPTMO  = QUIT.IDCONTRATOEMPTMO(+) '                              + #13 +
   '  AND PPP.FLGDESATIVADO     = 0 '                                                     + #13 +

   'ORDER BY'                                                                             + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '  SPP.IDSITPLANOPREV, ELP.MATRICULA, CON.IDCONTRATOEMPTMO, PARC.HMEPARCELA ';
      1: sSQL := sSQL + '  SPP.IDSITPLANOPREV, PES.NOME, CON.IDCONTRATOEMPTMO, PARC.HMEPARCELA ';
   end;


   with dtmRelContaCorrente.qryContaCorrente do begin
      Close;
      SQL.Clear;
      Sql.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //Sql.SaveToFile(Sistema.TempDir + 'EP-RelContaCorrente.txt');
      Sql.SaveToFile(ftempregra + '\' + 'EP-RelContaCorrente.txt');
      Open;
   end;
end;



procedure TcfgRelContaCorrente.FormShow(Sender: TObject);
begin
   inherited;

   molMutuario.btnLimpaPart.Click;

   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);

   AbreQueries;

   (* Preenche a listbox de patrocinadoras... *)
   molListaPatro.PreenchePatro;
   (* ...e marca todas por default *)
   molListaPatrobtnMarcaTodosPatroClick(self);

   (* Preenche a listbox de Planos... *)
   molListaPlano.PreenchePlano;
   (* ...e marca todos por default *)
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelContaCorrente.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelContaCorrente.molParticipante1btnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TcfgRelContaCorrente.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelContaCorrente.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelContaCorrente.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelContaCorrente.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
