unit cRelItensGeradosDiaPP;

// Alterações:
{--------------------------------------------------------------------------------------------------
Pendência   : SOL 253185  PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 13/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 19/08/2004
Autor     : André Pontes
Pendência :
Descrição : Ajustes na query: de acorco com o FLGEXCEPCIONAL, a tabela PLANPREVXCONTABIL é usada ou
            não (para filtro e joins)
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, wwdblook, IvDictio, IvMulti,
   IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
   Wwdbspin, mListaPlano, mListaPatro, wwdbdatetimepicker, Db, DBTables,
   mListaPlanoContab;

type
   TcfgRelItensGeradosDiaPP = class(TcfgRel)
      Label2: TLabel;
      Label1: TLabel;
    DBcboTipoContr: TwwDBLookupCombo;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Panel5: TPanel;
      Label4: TLabel;
      chkCompetencia: TCheckBox;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      molListaPatro: TmolListaPatro;
      GroupBox3: TGroupBox;
      Label5: TLabel;
      Label6: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      Label7: TLabel;
      btnLimpaContrato: TBitBtn;
      molListaPlano: TmolListaPlanoContab;
      chkQuebraPatro: TCheckBox;
      cboEvento: TComboBox;
      chkPrestacaoSuspensa: TCheckBox;
      Label8: TLabel;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnLimpaContratoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
   cfgRelItensGeradosDiaPP: TcfgRelItensGeradosDiaPP;



implementation
{$R *.DFM}
uses
   DLookEmptmo, USistema, UFuncoesEmptmo, dEmptmo, uMensErro, uDiasUteis, dRelItensGeradosDiaPP;



procedure TcfgRelItensGeradosDiaPP.AbreQueries;
begin
   ParametrosSistema;

   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   LimpaParametros(dtmLookEmptmo.qryLookPlanPrevContab);
   dtmLookEmptmo.qryLookPlanPrevContab.Open;

   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;
end;




procedure TcfgRelItensGeradosDiaPP.MontaQuery;
begin
   inherited;

   with dtmRelItensGeradosDiaPP do
   begin
      bSeparador     := chkLinhas.Checked;
      bQuebraPatro   := chkQuebraPatro.Checked;

      rptItensGeradosDia_lblEvento.Caption  := '';
      if cboEvento.ItemIndex > -1 then
      begin
         rptItensGeradosDia_lblEvento.Caption  := cboEvento.Text;
      end
      else
      begin
         rptItensGeradosDia_lblEvento.Caption  := '< todos >';
      end;

      rptItensGeradosDia_lblPeriodo.Caption := '';
      if ( length(trim(edtDataIni.Text)) > 0 ) or ( length(trim(edtDataFim.Text)) > 0 ) then
      begin
         rptItensGeradosDia_lblPeriodo.Caption := 'de ' + edtDataIni.Text + '  até ' + edtDataFim.Text;
      end;

      rptItensGeradosDia_lblCompetencia.Caption := '';
      if chkCompetencia.Checked then
      begin
         rptItensGeradosDia_lblCompetencia.Caption := cboMes.Text + ' / ' + FormatFloat('0000', DBspnAno.Value);
      end
      else
      begin
         rptItensGeradosDia_lblCompetencia.Caption := '< qualquer >';
      end;

      // -------------------------------------------------------------------------------------------

      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContr.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContr.Text;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;


procedure TcfgRelItensGeradosDiaPP.FiltraRelatorio;
var
   sSQL  : string;
begin
   sSQL :=

   'SELECT  '                                                                                      + #13 +
   '   HMETIPOMOV AS EVENTO, '                                                                     + #13 +

   '   DECODE(HMETIPOMOV, '                                                                        + #13 +
   '          0, DECODE(HMEORIGEM,  0, ''Concessão/Renovação'', '                                  + #13 +
   '                               13, ''Concessão (Acerto)'' '                                    + #13 +
   '                   ), '                                                                        + #13 +
   '          1, ''Prestação '', '                                                                 + #13 +
   '          2, ''Amortização/Refinanciamento'', '                                                + #13 +
   '          3, DECODE(HMEORIGEM, 8, ''Quitação por Falecimento'', '                              + #13 +
   '                               0, ''Quitação (Renovação)'', '                                  + #13 +
   '                              10, ''Quitação (Resgate)'', '                                    + #13 +
   '                                  ''Quitação'' '                                               + #13 +
   '                   ), '                                                                        + #13 +
   '          4, ''Atualização de Débito'', '                                                      + #13 +
   '          5, ''Atualização de Saldo (Diária)'' , '                                             + #13 +
   '          6, ''Importação/Migração'', '                                                        + #13 +
   '          7, ''Ajustes (Cobrança/Devolução)'', '                                               + #13 +
   '          8, ''Ajustes (Saldo Devedor)'' '                                                     + #13 +
   '         ) AS DESC_EVENTO, '                                                                   + #13 +

   '   IDITEMEMPTMO, ITEDESCRICAO, '                                                               + #13 +

   '   DATA_REF AS HMEDATAPREVISTA, '                                                              + #13 +
   '   NOMEPLANO, NOMEPATRO, PLANO_PATRO, '                                                        + #13 +

   '   SUM(DECODE(NVL(FLGESTORNADO, 0), 1, 0, DECODE(HMECENTRALIZA, 0, NVL(HMEVLRPREVISTO, 0), 0))) AS VALOR_AGRUPADO, '                                                      + #13 +
   '   SUM(DECODE(NVL(FLGESTORNADO, 0), 1, 0, DECODE(HMECENTRALIZA, 1, NVL(HMEVLRPREVISTO, 0), DECODE(HMEDESTACADO, 1, NVL(HMEVLRPREVISTO, 0), 0) ))) AS VALOR_CENTRALIZA, '  + #13 +

   '   SUM(DECODE(NVL(FLGESTORNADO, 0), 1, '                                                       + #13 +
   '             0, '                                                                              + #13 +
   '             DECODE(HMECENTRALIZA, 1, '                                                        + #13 +
   '                   0, '                                                                        + #13 +
   '                   DECODE(NVL(PLNCODIGO, 0), 0, '                                              + #13 +
   '                         0, '                                                                  + #13 +
   '                         DECODE(CCDEBFINAN, NULL, '                                            + #13 +
   '                               0, '                                                            + #13 +
   '                               DECODE(CCCREDFINAN, NULL, '                                     + #13 +
   '                                     0, '                                                      + #13 +
   '                                     NVL(HMEVLRPREVISTO, 0) '                                  + #13 +
   '                                     ) '                                                       + #13 +
   '                               ) '                                                             + #13 +
   '                         ) '                                                                   + #13 +
   '                   ) '                                                                         + #13 +
   '             ) '                                                                               + #13 +
   '      ) AS VALOR_AGRUPADO_CONTAB, '                                                            + #13 +

   '   SUM(NVL(HMEVLREFETIVO, 0))   AS VALOR_EFETIVO, '                                            + #13 +

   '   SUM(DECODE(NVL(FLGABONADO, 0), 0, 0, DECODE(NVL(PLNCODIGO, 0), 0, NVL(VALOR_ABONADO, 0), 0))) AS VALOR_ABONADO, '               + #13 +
   '   SUM(DECODE(NVL(FLGABONADO, 0), 0, 0, DECODE(NVL(PLNCODIGO, 0), 0, 0, NVL(VALOR_ABONADO, 0)))) AS VALOR_ABONADO_CONTAB, '        + #13 +
   '   SUM(DECODE(NVL(FLGABONADO, 0), 0, 0, DECODE(NVL(PLNCODIGOESTORNO, 0), 0, 0, NVL(VALOR_ABONADO, 0)))) AS ABONO_CONTAB, '         + #13 +

   '   SUM(DECODE(NVL(FLGESTORNADO, 0), 0, 0, DECODE(NVL(PLNCODIGO, 0), 0, 0, NVL(VALOR_ESTORNADO, 0)))) AS VALOR_ESTORNADO_CONTAB, '  + #13 +
   '   SUM(DECODE(NVL(FLGESTORNADO, 0), 0, 0, DECODE(NVL(PLNCODIGOESTORNO, 0), 0, 0, NVL(VALOR_ESTORNADO, 0)))) AS ESTORNO_CONTAB '    + #13 +

   'FROM '                                                                                         + #13 +
   '   ( '                                                                                         + #13 +

   // ----------------------------------------------------------------------------------------------
   // 1ª parte: Valor Previsto
   // ----------------------------------------------------------------------------------------------

   //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
   '   SELECT '        + #13 +
   //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
   '      HME.HMETIPOMOV, HME.HMEORIGEM, ITC.ITCSEQCALCULO, HME.HMEDESTACADO, HME.HMECENTRALIZA, ' + #13 +
   '      HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, HME.FLGESTORNADO, HME.FLGABONADO, '                  + #13 +
   '      HME.PLNCODIGO, HME.PLNCODIGOESTORNO, HME.CCDEBFINAN, HME.CCCREDFINAN, '                  + #13 +
   '      HME.HMEDATAPREVISTA AS DATA_REF, '                                                       + #13 +
   '      PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '                                          + #13 +
   '      (PPC.NOME || '' / '' || PTR.NOME) AS PLANO_PATRO, '                                      + #13 +

   '      HME.HMEVLRPREVISTO,    '                                                                 + #13 +
   '      0 AS HMEVLREFETIVO,    '                                                                 + #13 +
   '      0 AS VALOR_ESTORNADO,  '                                                                 + #13 +
   '      0 AS VALOR_ABONADO     '                                                                 + #13 +

   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13;

   // André Pontes - 08/08/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '      TIPOSUSPEMPTMO    TSE, '                                                                 + #13;

   sSQL := sSQL +
   '      ITEMXTIPOCONTR    ITC, '                                                                 + #13 +
   '      ITEMEMPTMO        ITE, '                                                                 + #13 +
   '      TIPOCONTREMPTMO   TCE, '                                                                 + #13 +
   '      TIPOEMPTMO        TEP, '                                                                 + #13 +
   '      PESSOA            PTR, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   sSQL := sSQL +
   '      CONTRATOEMPTMO    CON,'                                                                  + #13 +
   '      VWMIGRACONTRATOEP MIG  '                                                                 + #13 +

   'WHERE '                                                                                        + #13 +

   // filtro por Empresa Proprietátia
   '          TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                              + #13 +

   // filtro por Patrocinadora
   '      AND MIG.IDPATROATU        IN (' + molListaPatro.PegaPatro + ') '                         + #13 +
   '      AND MIG.IDPLANOCONTATU    IN (' + molListaPlano.PegaPlano + ') '                   + #13 +
   '      AND MIG.IDPLANOCONTATU  = PPC.IDPLANOPREV '                                      + #13;
   // Fim Pendência 23260

   sSQL := sSQL +
   // filtro por sequencial (só deve levar em conta o 1º gerado)
   '      AND ( '                                                                                  + #13 +
   '          HME.HMESEQCOBRANCA   = 1 OR '                                                        + #13 +
   '          (HME.HMETIPOMOV      = 0 AND HME.HMEORIGEM = 13) OR '                                + #13 +
   '          HME.HMETIPOMOV       IN (7, 8) '                                                     + #13 +
   '          ) '                                                                                  + #13 +

   // filtro por faixa de Datas Previstas
   '      AND HME.HMEDATAPREVISTA   BETWEEN TO_DATE(''' + edtDataIni.Text + ''', ''DD/MM/YYYY'') ' +
                                   ' AND TO_DATE(''' + edtDataFim.Text + ''', ''DD/MM/YYYY'') '    + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContr.LookupValue                            + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV        = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   // filtro por Competência
   if chkCompetencia.Checked then sSQL := sSQL +
   '      AND HME.HMEANOCOMPETENCIA = ' + FormatFloat('0000', DBspnAno.Value)                      + #13 +
   '      AND HME.HMEMESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1)                           + #13;

   // André Pontes - 15/06/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '      AND ( '                                                                                  + #13 +
   '          NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                    + #13 +
   '          (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGATUALSALDOPARC, 0) = 1) '              + #13 +
   '          ) '                                                                                  + #13 +
   '      AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) '                                 + #13;
   // FIM André Pontes - 15/06/2005

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO '                                       + #13 +
   '      AND CON.IDPATRO           = PTR.IDPESSOA '                                               + #13 +
   '      AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
   '      AND TCE.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO '                                      + #13 +
   '      AND HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO '                                           + #13 +
   '      AND HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO '                                           + #13 +
   '      AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                           + #13 +

   // Pendência 23260 - Marcos Topini em 06/11/2006
   '      AND MIG.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO          '                              + #13 +
   '      AND MIG.DATAMIGRA            = (SELECT MAX(DATAMIGRA)     '                              + #13 +
   '                                        FROM VWMIGRACONTRATOEP  '                              + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '         + #13 +
   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '         + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   'UNION ALL '                                                                                    + #13 +

   // ----------------------------------------------------------------------------------------------
   // 2ª parte: Valor Efetivo
   // ----------------------------------------------------------------------------------------------

   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                  + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      HME.HMETIPOMOV, HME.HMEORIGEM, ITC.ITCSEQCALCULO, HME.HMEDESTACADO, HME.HMECENTRALIZA, ' + #13 +
   '      HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, HME.FLGESTORNADO, HME.FLGABONADO, '                  + #13 +
   '      HME.PLNCODIGO, HME.PLNCODIGOESTORNO, HME.CCDEBFINAN, HME.CCCREDFINAN, '                  + #13 +
   '      HME.HMEDATAEFETIVA AS DATA_REF, '                                                        + #13 +
   '      PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '                                          + #13 +
   '      (PPC.NOME || '' / '' || PTR.NOME) AS PLANO_PATRO, '                                      + #13 +

   '      0 AS HMEVLRPREVISTO,   '                                                                 + #13 +
   '      HME.HMEVLREFETIVO,     '                                                                 + #13 +
   '      0 AS VALOR_ESTORNADO,  '                                                                 + #13 +
   '      0 AS VALOR_ABONADO     '                                                                 + #13 +

   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13;

   // André Pontes - 08/08/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '      TIPOSUSPEMPTMO    TSE, '                                                                 + #13;

   sSQL := sSQL +
   '      ITEMXTIPOCONTR    ITC, '                                                                 + #13 +
   '      ITEMEMPTMO        ITE, '                                                                 + #13 +
   '      TIPOCONTREMPTMO   TCE, '                                                                 + #13 +
   '      TIPOEMPTMO        TEP, '                                                                 + #13 +
   '      PESSOA            PTR, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   sSQL := sSQL +
   '      CONTRATOEMPTMO    CON, '                                                                  + #13 +
   '      VWMIGRACONTRATOEP MIG  '                                                                 + #13 +

   'WHERE '                                                                                        + #13 +

   // filtro por Empresa Proprietátia
   '          TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                              + #13 +

   // filtro por Patrocinadora
   '      AND MIG.IDPATROATU        IN (' + molListaPatro.PegaPatro + ') '                         + #13 +
   '      AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                         + #13 +
   '      AND MIG.IDPLANOCONTATU     = PPC.IDPLANOPREV '                                            + #13;

   // filtro por faixa de Datas Previstas
   sSQL := sSQL +
   '      AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                       + #13 +
   '      AND HME.HMEVLREFETIVO    IS NOT NULL '                                                   + #13 +
   '      AND HME.HMEDATAEFETIVA   BETWEEN TO_DATE(''' + edtDataIni.Text + ''', ''DD/MM/YYYY'') '  +
                                     ' AND TO_DATE(''' + edtDataFim.Text + ''', ''DD/MM/YYYY'') '  + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContr.LookupValue                            + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV        = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   // filtro por Competência
   if chkCompetencia.Checked then sSQL := sSQL +
   '      AND HME.HMEANOCOMPETENCIA = ' + FormatFloat('0000', DBspnAno.Value)                      + #13 +
   '      AND HME.HMEMESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1)                           + #13;

   // André Pontes - 15/06/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '      AND ( '                                                                                  + #13 +
   '          NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                    + #13 +
   '          (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGATUALSALDOPARC, 0) = 1) '              + #13 +
   '          ) '                                                                                  + #13 +
   '      AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) '                                 + #13;
   // FIM André Pontes - 15/06/2005

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO '                                       + #13 +
   '      AND CON.IDPATRO           = PTR.IDPESSOA '                                               + #13 +
   '      AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
   '      AND TCE.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO '                                      + #13 +
   '      AND HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO '                                           + #13 +
   '      AND HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO '                                           + #13 +
   '      AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                           + #13 +

   // Pendência 23260 - Marcos Topini em 06/11/2006
   '      AND MIG.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO          '                              + #13 +
   '      AND MIG.DATAMIGRA            = (SELECT MAX(DATAMIGRA)     '                              + #13 +
   '                                        FROM VWMIGRACONTRATOEP  '                              + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '         + #13 +
   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '         + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   'UNION ALL '                                                                                    + #13 +

   // ----------------------------------------------------------------------------------------------
   // 3ª parte: Valor Estornado
   // ----------------------------------------------------------------------------------------------
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
   '   SELECT '                                                                                    + #13 +
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   '      HME.HMETIPOMOV, HME.HMEORIGEM, ITC.ITCSEQCALCULO, HME.HMEDESTACADO, HME.HMECENTRALIZA, ' + #13 +
   '      HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, HME.FLGESTORNADO, HME.FLGABONADO, '                  + #13 +
   '      HME.PLNCODIGO, HME.PLNCODIGOESTORNO, HME.CCDEBFINAN, HME.CCCREDFINAN, '                  + #13 +
   '      HME.HMEDATAESTORNO AS DATA_REF, '                                                        + #13 +
   '      PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '                                          + #13 +
   '      (PPC.NOME || '' / '' || PTR.NOME) AS PLANO_PATRO, '                                      + #13 +

   '      0 AS HMEVLRPREVISTO,   '                                                                 + #13 +
   '      0 AS HMEVLREFETIVO,    '                                                                 + #13 +
   '      HME.HMEVLRPREVISTO AS VALOR_ESTORNADO, '                                                 + #13 +
   '      0 AS VALOR_ABONADO     '                                                                 + #13 +

   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13 +
   '      VWMIGRACONTRATOEP MIG, '                                                                 + #13;


   // André Pontes - 08/08/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '      TIPOSUSPEMPTMO    TSE, '                                                                 + #13;

   sSQL := sSQL +
   '      ITEMXTIPOCONTR    ITC, '                                                                 + #13 +
   '      ITEMEMPTMO        ITE, '                                                                 + #13 +
   '      TIPOCONTREMPTMO   TCE, '                                                                 + #13 +
   '      TIPOEMPTMO        TEP, '                                                                 + #13 +
   '      PESSOA            PTR, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   sSQL := sSQL +
   '      CONTRATOEMPTMO    CON '                                                                  + #13 +


   'WHERE '                                                                                        + #13 +

   // filtro por Empresa Proprietátia
   '      TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                              + #13 +

   // filtro por Patrocinadora
   '      AND MIG.IDPATROATU        IN (' + molListaPatro.PegaPatro + ') '                     + #13 +
   '      AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                         + #13 +
   '      AND MIG.IDPLANOCONTATU     = PPC.IDPLANOPREV '                                            + #13;
   // Fim Pendência 23260

   sSQL := sSQL +
   // Marchetti - Pendencia 21421
   '      AND NVL(HME.FLGESTORNADO, 0) = 1 '                                                       + #13 +
   '      AND HME.HMEDATAESTORNO    BETWEEN TO_DATE(''' + edtDataIni.Text + ''', ''DD/MM/YYYY'') ' +
                                      ' AND TO_DATE(''' + edtDataFim.Text + ''', ''DD/MM/YYYY'') ' + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContr.LookupValue                            + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV        = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   // filtro por Competência
   if chkCompetencia.Checked then sSQL := sSQL +
   '      AND HME.HMEANOCOMPETENCIA = ' + FormatFloat('0000', DBspnAno.Value)                      + #13 +
   '      AND HME.HMEMESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1)                           + #13;

   // André Pontes - 15/06/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '      AND ( '                                                                                  + #13 +
   '          NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                    + #13 +
   '          (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGATUALSALDOPARC, 0) = 1) '              + #13 +
   '          ) '                                                                                  + #13 +
   '      AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) '                                 + #13;
   // FIM André Pontes - 15/06/2005

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO '                                       + #13 +
   '      AND CON.IDPATRO           = PTR.IDPESSOA '                                               + #13 +
   '      AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
   '      AND TCE.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO '                                      + #13 +
   '      AND HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO '                                           + #13 +
   '      AND HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO '                                           + #13 +
   '      AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                           + #13 +

  // Pendência 23260 - Marcos Topini em 06/11/2006
   '      AND MIG.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO       '                              + #13 +
   '      AND MIG.DATAMIGRA            = (SELECT MAX(DATAMIGRA)     '                              + #13 +
   '                                        FROM VWMIGRACONTRATOEP  '                              + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '         + #13 +
   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '         + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   'UNION ALL '                                                                                    + #13 +

   // ----------------------------------------------------------------------------------------------
   // 4ª parte: Valor Abonado
   // ----------------------------------------------------------------------------------------------
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
   '   SELECT '                                                                                    + #13 +
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   '      HME.HMETIPOMOV, HME.HMEORIGEM, ITC.ITCSEQCALCULO, HME.HMEDESTACADO, HME.HMECENTRALIZA, ' + #13 +
   '      HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, HME.FLGESTORNADO, HME.FLGABONADO, '                  + #13 +
   '      HME.PLNCODIGO, HME.PLNCODIGOESTORNO, HME.CCDEBFINAN, HME.CCCREDFINAN, '                  + #13 +
   '      HME.HMEDATAQUITABONO AS DATA_REF, '                                                      + #13 +
   '      PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '                                          + #13 +
   '      (PPC.NOME || '' / '' || PTR.NOME) AS PLANO_PATRO, '                                      + #13 +

   '      0 AS HMEVLRPREVISTO,   '                                                                 + #13 +
   '      0 AS HMEVLREFETIVO,    '                                                                 + #13 +
   '      0 AS VALOR_ESTORNADO,  '                                                                 + #13 +
   '      HME.HMEVLRPREVISTO AS VALOR_ABONADO '                                                    + #13 +

   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO     HME, '                                                                 + #13;

   // André Pontes - 08/08/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '      TIPOSUSPEMPTMO    TSE, '                                                                 + #13;

   sSQL := sSQL +
   '      ITEMXTIPOCONTR    ITC, '                                                                 + #13 +
   '      ITEMEMPTMO        ITE, '                                                                 + #13 +
   '      TIPOCONTREMPTMO   TCE, '                                                                 + #13 +
   '      TIPOEMPTMO        TEP, '                                                                 + #13 +
   '      PESSOA            PTR, '                                                                 + #13 +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13;

   sSQL := sSQL +
   '      CONTRATOEMPTMO    CON, '                                                                  + #13 +
   '      VWMIGRACONTRATOEP MIG  '                                                                 + #13 +


   'WHERE '                                                                                        + #13 +

   // filtro por Empresa Proprietátia
   '      TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                                  + #13 +

   // filtro por Patrocinadora
   '      AND MIG.IDPATROATU        IN (' + molListaPatro.PegaPatro + ') '                         + #13 +
   '      AND MIG.IDPLANOCONTATU    IN (' + molListaPlano.PegaPlano + ') '                         + #13 +
   '      AND MIG.IDPLANOCONTATU    = PPC.IDPLANOPREV '                                            + #13;

   // filtro por faixa de Datas Previstas
   sSQL := sSQL +
   '      AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                       + #13 +
   '      AND HME.FLGABONADO        = 1 '                                                          + #13 +
   '      AND HME.HMEDATAQUITABONO  BETWEEN TO_DATE(''' + edtDataIni.Text + ''', ''DD/MM/YYYY'') ' +
                                      ' AND TO_DATE(''' + edtDataFim.Text + ''', ''DD/MM/YYYY'') ' + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                              + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContr.LookupValue                            + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '      AND HME.HMETIPOMOV        = ' + IntToStr(cboEvento.ItemIndex)                            + #13;

   // filtro por Competência
   if chkCompetencia.Checked then sSQL := sSQL +
   '      AND HME.HMEANOCOMPETENCIA = ' + FormatFloat('0000', DBspnAno.Value)                      + #13 +
   '      AND HME.HMEMESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1)                           + #13;

   // André Pontes - 15/06/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '      AND ( '                                                                                  + #13 +
   '          NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                    + #13 +
   '          (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGATUALSALDOPARC, 0) = 1) '              + #13 +
   '          ) '                                                                                  + #13 +
   '      AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) '                                 + #13;
   // FIM André Pontes - 15/06/2005

   sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO '                                       + #13 +
   '      AND CON.IDPATRO           = PTR.IDPESSOA '                                               + #13 +
   '      AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
   '      AND TCE.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO '                                      + #13 +
   '      AND HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO '                                           + #13 +
   '      AND HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO '                                           + #13 +
   '      AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                           + #13 +

   // Pendência 23260 - Marcos Topini em 06/11/2006
   '      AND MIG.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO       '                              + #13 +
   '      AND MIG.DATAMIGRA            = (SELECT MAX(DATAMIGRA)     '                              + #13 +
   '                                        FROM VWMIGRACONTRATOEP  '                              + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '         + #13 +
   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '         + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   ) '                                                                                         + #13 +

   // ----------------------------------------------------------------------------------------------

   'GROUP BY '                                                                                     + #13 +
   '   HMETIPOMOV, HMEORIGEM, '                                                                    + #13 +
   '   NOMEPLANO, NOMEPATRO, PLANO_PATRO, '                                                        + #13 +
   '   IDITEMEMPTMO, ITEDESCRICAO, '                                                               + #13 +
   '   ITCSEQCALCULO, '                                                                            + #13 +
   '   HMEDESTACADO, HMECENTRALIZA, '                                                              + #13 +
   '   DATA_REF '                                                                                  + #13 +

   'ORDER BY '                                                                                     + #13 +
   '   DATA_REF, '                                                                                 + #13 +
   '   HMETIPOMOV, HMEORIGEM, '                                                                    + #13 +
   '   NOMEPLANO, NOMEPATRO, PLANO_PATRO, '                                                        + #13 +
   '   ITCSEQCALCULO, '                                                                            + #13 +
   '   HMEDESTACADO, HMECENTRALIZA, '                                                              + #13 +
   '   IDITEMEMPTMO '                                                                              + #13;

   with dtmRelItensGeradosDiaPP.qryItensGeradosDiaPP do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensGeradosDiaPP.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensGeradosDiaPP.txt');
      Open;
   end;
end;



procedure TcfgRelItensGeradosDiaPP.FormShow(Sender: TObject);
begin
   inherited;

   DBspnAno.Value    := DiasUteis.ExtraiAno(SysDate);
   cboMes.ItemIndex  := DiasUteis.ExtraiMes(SysDate) - 1;

   edtDataIni.Date   := EncodeDate(DiasUteis.ExtraiAno(SysDate), DiasUteis.ExtraiMes(SysDate), 1);
   edtDataFim.Date   := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(SysDate), DiasUteis.ExtraiMes(SysDate));

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelItensGeradosDiaPP.DBcboTipoEmptmoExit(Sender: TObject);
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

      DBcboTipoContr.Enabled := True;
   end;
end;



procedure TcfgRelItensGeradosDiaPP.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensGeradosDiaPP.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensGeradosDiaPP.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensGeradosDiaPP.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelItensGeradosDiaPP.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   cboEvento.ItemIndex := -1;
end;



procedure TcfgRelItensGeradosDiaPP.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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

      DBcboTipoContr.Enabled := True;
   end;
end;



end.
