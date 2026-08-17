unit CRelConciliaFolhaPP;

// Alterações:
{   --------------------------------------------------------------------------------------------------
Rotina      : FiltraRelatorio
Pendência   : SIG131775
Responsável : Leandro                  
Data        : 02/08/2023
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO->HEMORIGEM = 11
--------------------------------------------------------------------------------------------------
Pendência   : SOL 253185  PPM 771995
Responsável : Wylliam Leite da Silva/ William Moreira da Silva
Data        : 13/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
----------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}


interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mListaPlano, mListaPatro, fcCombo, fcColorCombo,
   mMutuario, Mask, wwdbedit, Wwdbspin, wwdblook, Db, DBTables, Wwquery,
   mContratoEmptmo;

type
   TcfgRelConciliaFolhaPP = class(TcfgRel)
      Label2: TLabel;
      Label1: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox1: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      rdgOrdenacao: TRadioGroup;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      GroupBox3: TGroupBox;
      molContratoEmptmo: TmolContratoEmptmo;
      chkSintetico: TCheckBox;
      GroupBox4: TGroupBox;

      chkValorDivergFolha: TCheckBox;
      chkValorZeroFolha: TCheckBox;
      chkValorNAOZeroFolha: TCheckBox;
      chkValorDivergEP: TCheckBox;
      chkValorZeroEP: TCheckBox;
      chkValorNAOZeroEP: TCheckBox;
      chkNaoProcessadoFolha: TCheckBox;
      chkNaoProcessadoEP: TCheckBox;
      chkDivergFolhaEP: TCheckBox;
    chkNaoEnviado: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
  cfgRelConciliaFolhaPP: TcfgRelConciliaFolhaPP;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   uFuncoesEmptmo,
   dEmptmo,
   uMensErro,
   dRelConciliaFolhaPP;




procedure TcfgRelConciliaFolhaPP.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;
end;



procedure TcfgRelConciliaFolhaPP.MontaQuery;
begin
   inherited;

   with dtmRelConciliaFolhaPP do
   begin
      // preenche a label do mês de cobrança
      lblMesCobranca.Caption  := FormatFloat('00', cboMes.ItemIndex + 1) + '/' +
                                 FormatFloat('0000', DBspnAno.Value);

      lblFolhaPatro.Visible   := chkFolhaPatro.Checked;
      lblFolhaBenef.Visible   := chkFolhaBenef.Checked;

      // -------------------------------------------------------------------------------------------

      lblNaoEnviado.Visible         := chkNaoEnviado.Checked;

      lblValorDivergFolha.Visible   := chkValorDivergFolha.Checked;
      lblValorNAOZeroFolha.Visible  := chkValorNAOZeroFolha.Checked;
      lblValorZeroFolha.Visible     := chkValorZeroFolha.Checked;
      lblNaoProcessadoFolha.Visible := chkNaoProcessadoFolha.Checked;

      lblValorDivergEP.Visible      := chkValorDivergEP.Checked;
      lblValorNAOZeroEP.Visible     := chkValorNAOZeroEP.Checked;
      lblValorZeroEP.Visible        := chkValorZeroEP.Checked;
      lblNaoProcessadoEP.Visible    := chkNaoProcessadoEP.Checked;
      lblDivergFolhaEP.Visible      := chkDivergFolhaEP.Checked;

      lblCabecalhoFolha.Visible     := chkValorDivergFolha.Checked or chkValorNAOZeroFolha.Checked or
                                       chkValorZeroFolha.Checked or chkNaoProcessadoFolha.Checked;
      linCabecalhoFolha.Visible     := lblCabecalhoFolha.Visible;

      lblCabecalhoEP.Visible        := chkValorDivergEP.Checked or chkValorNAOZeroEP.Checked or
                                       chkValorZeroEP.Checked or chkNaoProcessadoEP.Checked or
                                       chkDivergFolhaEP.Checked;

      linCabecalhoEP.Visible        := lblCabecalhoEP.Visible;

      // -------------------------------------------------------------------------------------------

      bSeparador  := chkLinhas.Checked;
      bSintetico  := chkSintetico.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelConciliaFolhaPP.FiltraRelatorio;
var
   sSQL        : String;
   sSelect     : String;
   sMes        : String;
   sTipoFolha  : String;
   sArquivo    : String;
   Arquivo     : TextFile;
begin
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //sArquivo := Sistema.TempDir + 'EP-RelConciliacaoFolhaPP.txt';
   sArquivo := ftempregra + '\' + 'EP-RelConciliacaoFolhaPP.txt';

   sMes     := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1);

   sSQL :=
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   'SELECT '                                                                                       + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '   TMP.IDTMPDESC, CON.MATRICULA, CON.INSCRICAONUMERO, '                                        + #13 +
   '   CON.NOME_MUTUARIO, CON.TCEDESCRICAO, '                                                      + #13 +
   '   CON.NOME_PLANO, CON.NOME_PATRO, CON.NOME_PLANOPATRO, '                                      + #13 +
   '   TMP.IDDESCONTO, TMP.IDPROVENTO, TMP.CODPROVDESC, '                                          + #13 +
   '   TMP.MESCOBRANCA, TMP.MESREFERENCIA, TMP.IDPESSOA, TMP.IDTITULAR, '                          + #13 +
   '   TMP.FLGDESCFOLHA, TMP.DATAREFERENCIA, TMP.DATARECEBIMENTO, '                                + #13 +
   '   TMP.PARCELA, TMP.NUMPARCELAS, ( TMP.NUMPARCELAS - TMP.PARCELA + 1 ) AS PARC_RESTA, '        + #13 +
   '   TMP.VALOR, TMP.VALORRECEBIDO, HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, '                      + #13 +
   '   ( NVL(TMP.VALOR, 0) - NVL(HME.HMEVLREFETIVO, 0) ) AS VLRNAORECEBIDO, '                      + #13 +
   '   ( NVL(TMP.VALOR, 0) - NVL(TMP.VALORRECEBIDO, 0) ) AS RESIDUO, '                             + #13 +
   '   TMP.IDMODULO, TMP.SITENVIO, TMP.FLGTIPODESC, TMP.IDPLANOPREV, TMP.FLGDESCONTO, '            + #13 +
   '   TMP.DESCRICAO, TMP.REFERENCIA, TMP.DATACOBRANCA, TMP.NODOCUMENTO, '                         + #13 +
   '   TMP.IDLOTE, TMP.LOTEPREVIA, '                                                               + #13 +

   '   DECODE(TMP.FLGDESCFOLHA, ''P'', ''Folha da Patrocinadora'', ''B'', ''Folha de Benefícios'') AS TIPO_FOLHA '   + #13 +

   'FROM '                                                                                         + #13 +

   '   ( '                                                                                         + #13;

   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   SELECT '                                                                                    + #13
   else sSQL := sSQL +
   '   SELECT '                                                                                    + #13;
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim

   sSQL := sSQL +
   '      HME.IDTMPDESC, HME.IDCONTRATOEMPTMO, '                                                   + #13 +
   '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS HMEVLRPREVISTO, '                                + #13 +
   '      SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) AS HMEVLREFETIVO '                                   + #13 +
   '   FROM '                                                                                      + #13 +
   '      HISTMOVEMPTMO  HME, '                                                                    + #13 +
   '      TIPOSUSPEMPTMO TSE,  '                                                                   + #13 +

       // Pendência 23260 - Marcos Topini em 21/11/2006
   '      VWMIGRACONTRATOEP MIG'                                                                  + #13 +

   '   WHERE '                                                                                     + #13 +
   '          (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '                              + #13 +
   '      AND HME.HMEANOCOBRANCA       = ' + FormatFloat('0000', DBspnAno.Value)                   + #13 +
   '      AND HME.HMEMESCOBRANCA       = ' + FormatFloat('00', cboMes.ItemIndex + 1)               + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND HME.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   // Pendência 23260 - Marcos Topini em 20/11/2006
   sSQL := sSQL +
   '      AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '      AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                      + #13 +
   '      AND MIG.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO '                                + #13 +
   '      AND MIG.DATAMIGRA                = (SELECT MAX(DATAMIGRA) '                              + #13 +
   '                                            FROM VWMIGRACONTRATOEP '                           + #13 +
   '                                           WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '     + #13 +
   '                                             AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '     + #13 ;
   // Fim Pendência 23260

   sSQL := sSQL +
   '      AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                       + #13 +
   '      AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                       + #13 +
   '      AND NVL(HME.FLGABONADO, 0)   = 0 '                                                       + #13 +
   '      AND ( '                                                                                  + #13 +
   '          NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                    + #13 +
   '          (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1) '                    + #13 +
   '          ) '                                                                                  + #13 +
   '      AND HME.IDTMPDESC            IS NOT NULL '                                               + #13 +
   '      AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) '                                 + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      HME.IDTMPDESC, HME.IDCONTRATOEMPTMO '                                                    + #13 +
   '   ) HME, '                                                                                    + #13 +

   '   ( '                                                                                         + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                                                 + #13
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   else sSQL := sSQL +
   '   SELECT '                                                                                    + #13;

   sSQL := sSQL +
   '      CON.IDCONTRATOEMPTMO, '                                                                  + #13 +
   '      PPC.NOME AS NOME_PLANO, '                                                                + #13 +
   '      NVL(CED.NOME, PTR.NOME) AS NOME_PATRO, '                                                 + #13 +
   '      (PPC.NOME || '' - '' || NVL(CED.NOME, PTR.NOME)) AS NOME_PLANOPATRO, '                   + #13 +

   '      TCE.TCEDESCRICAO, '                                                                      + #13 +
   '      NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, PPP.INSCRICAONUMERO, '                   + #13 +
   '      MUT.NOME AS NOME_MUTUARIO, '                                                             + #13 +
   '      DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SIT_PART '          + #13 +

   '   FROM '                                                                                      + #13 +
   '      PESSOA            MUT, '                                                                 + #13 +
   '      PESSOA            PTR, '                                                                 + #13 +
   '      PESSOA            CED, '                                                                 + #13 +
   '      DEPENTIT          DEP, '                                                                 + #13 +
   '      PARTPREVPLAN      PPP, '                                                                 + #13 +
   '      ELEGPATRO         ELP, '                                                                 + #13 +
   '      SITPART           SIT, '                                                                 + #13 +
   '      TIPOCONTREMPTMO   TCE, '                                                                 + #13 +
   '      TIPOEMPTMO        TEP, '                                                                 + #13;

   // Pendência 23260 - Marcos Topini em 21/11/2006
   sSQL := sSQL +
   '      PLANPREVCONTABIL  PPC, '                                                                 + #13 +
   '      CONTRATOEMPTMO    CON  '                                                                 + #13 +

   '   WHERE '                                                                                     + #13 +
   '          TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +

   '      AND ( CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                      +
           ' OR ELP.IDPESSJURCEDIDO    IN (' + molListaPatro.PegaPatro + ') ) '                    + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   // Pendência 23260 - Marcos Topini em 21/11/2006
   sSQL := sSQL +
   '      AND CON.IDPLANOORIGEM     = PPC.IDPLANOPREV '                                            + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '      AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                         + #13;

   sSQL := sSQL +
   '      AND CON.FLGSITUACAO         <> ''C'' '                                                   + #13 +
   '      AND PPP.FLGDESATIVADO        = 0 '                                                       + #13;

   sSQL := sSQL +
   '      AND CON.IDPATRO              = PTR.IDPESSOA '                                            + #13 +
   '      AND ELP.IDPESSJURCEDIDO      = CED.IDPESSOA(+) '                                         + #13 +

   '      AND CON.IDBENEF              = MUT.IDPESSOA '                                            + #13 +
   '      AND CON.IDBENEF              = DEP.IDPESSOA '                                            + #13 +
   '      AND CON.IDPESSOA             = DEP.IDTITULAR '                                           + #13 +

   '      AND CON.IDPESSOA             = PPP.IDPESSOA '                                            + #13 +
   '      AND PPP.IDSITPART            = SIT.IDSITPART '                                           + #13 +

   '      AND CON.IDPESSOA             = ELP.IDPESSOA '                                            + #13 +
   '      AND CON.IDPATRO              = ELP.IDPESSJUR '                                           + #13 +
   '      AND CON.IDPATRO              = PPP.IDPESSJUR '                                           + #13 +

   '      AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
   '      AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                        + #13 +
   '   ) CON, '                                                                                    + #13 +

   '   TMPDESC TMP '                                                                               + #13 +

   'WHERE '                                                                                        + #13 +
   '       TMP.IDEMPRESAPROP           = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +
   '   AND TMP.IDMODULO                IN (15, 32) '                                               + #13 +
   '   AND (RTRIM(TMP.MESCOBRANCA))    = ' + QuotedStr(sMes)                                       + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND TMP.IDDESCONTO              = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   // ----------------------------------------------------------------------------------------------

   // filtro por tipo de folha
   sTipoFolha := '';
   if chkFolhaPatro.Checked then
   begin
      sTipoFolha := '(''P'')';
      if chkFolhaBenef.Checked then sTipoFolha := '(''B'', ''P'')';
   end
   else
   begin
      if chkFolhaBenef.Checked then sTipoFolha := '(''B'')';
   end;

   // ----------------------------------------------------------------------------------------------

   if chkValorDivergFolha.Checked then sSQL := sSQL +
   '    AND (TMP.VALOR                 IS NOT NULL AND TMP.VALOR <> TMP.VALORRECEBIDO) '           + #13;

   if chkValorNAOZeroFolha.Checked then sSQL := sSQL +
   '   AND NVL(TMP.VALORRECEBIDO, 0)  <> 0 '                                                       + #13;

   if chkValorZeroFolha.Checked then sSQL := sSQL +
   '   AND TMP.VALORRECEBIDO           = 0 '                                                       + #13;

   if chkNAOProcessadoFolha.Checked then sSQL := sSQL +
   '   AND TMP.SITENVIO                = 0 '                                                       + #13;

   // ----------------------------------------------------------------------------------------------

   if chkValorDivergEP.Checked then sSQL := sSQL +
   '   AND (HME.HMEVLREFETIVO          IS NOT NULL AND HME.HMEVLREFETIVO <> HME.HMEVLRPREVISTO) '  + #13;

   if chkValorNAOZeroEP.Checked then sSQL := sSQL +
   '   AND HME.HMEVLREFETIVO           IS NOT NULL '                                               + #13;

   if chkValorZeroEP.Checked then sSQL := sSQL +
   '   AND HME.HMEVLREFETIVO           IS NULL '                                                   + #13;

   if chkValorZeroEP.Checked then sSQL := sSQL +
   '   AND TMP.SITENVIO                IN (1, 2) '                                                 + #13;

   if chkDivergFolhaEP.Checked then sSQL := sSQL +
   '   AND (HME.HMEVLREFETIVO          IS NOT NULL AND HME.HMEVLREFETIVO <> TMP.VALORRECEBIDO) '   + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND TMP.FLGDESCFOLHA            IN ' + sTipoFolha                                           + #13 +
   '   AND TMP.IDPESSJUR               IN (' + molListaPatro.PegaPatro + ') '                      + #13 +

   '   AND TMP.IDDESCONTO              = CON.IDCONTRATOEMPTMO '                                    + #13 +
   '   AND TMP.IDTMPDESC               = HME.IDTMPDESC '                                           + #13 +

   'ORDER BY '                                                                                     + #13 +

   '   DECODE(TMP.FLGDESCFOLHA, ''P'', ''Folha da Patrocinadora'', ''B'', ''Folha de Benefícios''), '    + #13;

   case rdgOrdenacao.ItemIndex of
      0: sSQL := sSQL + '   CON.NOME_PLANO, CON.NOME_PATRO, CON.MATRICULA, TMP.IDTMPDESC ';
      1: sSQL := sSQL + '   CON.NOME_PLANO, CON.NOME_PATRO, CON.NOME_MUTUARIO, TMP.IDTMPDESC ';
      2: sSQL := sSQL + '   CON.NOME_PLANO, CON.NOME_PATRO, CON.IDCONTRATOEMPTMO, TMP.IDTMPDESC ';
   end;


   // ----------------------------------------------------------------------------------------------

   dtmRelConciliaFolhaPP.qryConciliaFolhaPP.Close;
   dtmRelConciliaFolhaPP.qryConciliaFolhaPP.SQL.Text := sSQL;
   dtmRelConciliaFolhaPP.qryConciliaFolhaPP.SQL.SaveToFile(sArquivo);

   AssignFile(Arquivo, sArquivo);

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, 'Início  : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      CloseFile(Arquivo);
   end;

   dtmRelConciliaFolhaPP.qryConciliaFolhaPP.Open;

   // ----------------------------------------------------------------------------------------------

   sSelect :=
   'SELECT  '                                                                                      + #13 +
   '   CON.IDCONTRATOEMPTMO, MUT.NOME, '                                                           + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '                                           + #13 +
   '   TCE.TCEDESCRICAO, '                                                                         + #13 +
   '   HME.HMEPARCELA, '                                                                           + #13 +
   '   HME.HMENUMPARCELAS, '                                                                       + #13 +

   '   DECODE(HME.HMETIPOMOV, '                                                                    + #13 +
   '          0, ''Concessão/Renovação'', '                                                        + #13 +
   '          1, ''Prestação '', '                                                                 + #13 +
   '          2, ''Amortização/Refinanciamento'', '                                                + #13 +
   '          3, DECODE(HME.HMEORIGEM, 8, ''Quitação por Falecimento'', ''Quitação''), '           + #13 +
   '          4, ''Atualização de Débito'', '                                                      + #13 +
   '          5, ''Atualização de Saldo (Diária)'' , '                                             + #13 +
   '          6, ''Importação/Migração'', '                                                        + #13 +
   '          7, ''Ajustes (Cobrança/Devolução)'', '                                               + #13 +
   '          8, ''Ajustes (Saldo Devedor)'' '                                                     + #13 +
   '         ) AS EVENTO, '                                                                        + #13 +

   '   DECODE(HME.HMEORIGEM, '                                                                     + #13 +
   '           0, ''Concessão/Renovação'', '                                                       + #13 +
   '           1, ''Geração de Parcelas'', '                                                       + #13 +
   '           2, ''Amortização/Refinanciamento'', '                                               + #13 +
   '           3, ''Quitação Antecipada'', '                                                       + #13 +
   '           4, ''Tratamento de Divergências'', '                                                + #13 +
   '           5, ''Atualização de Saldo (Diária)'', '                                             + #13 +
   '           6, ''Recálculo Diário'', '                                                          + #13 +
   '           7, ''Tratamento Individual'', '                                                     + #13 +
   '           8, ''Quitação por Morte/Invalidez'', '                                              + #13 +
   '           9, ''Importação/Migração'', '                                                       + #13 +
   '          10, ''Quitação por Resgate'', '                                                      + #13 +
   //'          11, ''Recebimento'', '                                                               + #13 +      //LEANDRO SIG131775
   '          11, DECODE(TMP_ORI.PRESTPARCIAL,''1'', ''Prestação Parcial'', NULL , ''Recebimento''), ' + #13 +    //LEANDRO SIG131775
   '          12, ''Entrada Manual'', '                                                            + #13 +
   '          13, ''Alteração de Concessão'', '                                                    + #13 +
   '          14, ''Tratamento de Valores Não Programados'', '                                     + #13 +
   '          15, ''Consulta de Contratos'', '                                                     + #13 +
   '          16, ''Cancelamento de Concessão'', '                                                 + #13 +
   '          17, ''Alteração Contratual'', '                                                      + #13 +
   '          18, ''Liberação de Concessão'', '                                                    + #13 +
   '          19, ''Envio'', '                                                                     + #13 +
   '          41, ''Contabilização em Lote de Concessão'', '                                       + #13 +
   '          42, ''Contabilização em Lote de Prestação'', '                                       + #13 +
   '          43, ''Contabilização em Lote de Amortização'', '                                     + #13 +
   '          44, ''Contabilização em Lote de Quitação'', '                                        + #13 +
   '          45, ''Contabilização em Lote de Encargos'', '                                        + #13 +
   '          46, ''Contabilização em Lote de Atualização Diária'', '                              + #13 +
   '          47, ''Contabilização em Lote de Ajustes'', '                                         + #13 +
   '          51, ''Desfazer Geração de Parcelas'', '                                              + #13 +
   '          52, ''Cancelamento de Amortização'', '                                               + #13 +
   '          53, ''Cancelamento de Quitação'', '                                                  + #13 +
   '          61, ''Desfazer Envio'', '                                                            + #13 +
   '          62, ''Desfazer Recebimento'' '                                                       + #13 +
   '         ) AS ORIGEM, '                                                                        + #13 +

   '   HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO '                                                     + #13 +

   'FROM '                                                                                         + #13 +
   '   HISTMOVEMPTMO     HME, '                                                                    + #13 +
   '   PESSOA            MUT, '                                                                    + #13 +
   '   CONTRATOEMPTMO    CON, '                                                                    + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                                    + #13 +
   '   DEPENTIT          DEP, '                                                                    + #13 +
   '   ELEGPATRO         ELP, '                                                                    + #13 +
   '   TIPOSUSPEMPTMO    TSE, '                                                                    + #13 +

   //LEANDRO SIG131775 INICIO
   '     (SELECT ''1'' AS PRESTPARCIAL , TMP.*   '                                                   + #13 +
   '                             FROM TMPDESC TMP    '                                             + #13 +
   '                             WHERE ((TMP.VALORRECEBIDO > 0 AND TMP.VALORRECEBIDO < VALOR)  '   + #13 +
   '                             AND  TMP.DATARECEBIMENTO IS NOT NULL)) as TMP_ORI'                + #13 +
   //LEANDRO SIG131775 FIM

   'WHERE '                                                                                        + #13 +
   '       HME.HMEANOCOBRANCA       = ' + FormatFloat('0000', DBspnAno.Value)                      + #13 +
   '   AND HME.HMEMESCOBRANCA       = ' + FormatFloat('00', cboMes.ItemIndex + 1)                  + #13 +

   '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '                                 + #13 +
   '   AND HME.HMETIPOMOV           IN (0, 1, 2, 3, 4, 7) '                                        + #13 +

   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '   AND ( '                                                                                     + #13 +
   '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                       + #13 +
   '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1) '                       + #13 +
   '       ) '                                                                                     + #13 +
   '   AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) '                                    + #13 +

   '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                       + #13 +
   '   AND CON.IDPESSOA             = DEP.IDTITULAR '                                              + #13 +
   '   AND CON.IDBENEF              = DEP.IDPESSOA '                                               + #13 +
   '   AND CON.IDPESSOA             = ELP.IDPESSOA '                                               + #13 +
   '   AND CON.IDPATRO              = ELP.IDPESSJUR '                                              + #13 +
   '   AND CON.IDBENEF              = MUT.IDPESSOA '                                               + #13 +
   '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
   '   AND (HME.idcontratoemptmo = TMP_ORI.IDDESCONTO(+) AND HME.HMEPARCELAALT    = TMP_ORI.PARCELA(+) ) ' + #13 ;  // LEANDRO SIG131775

   // ----------------------------------------------------------------------------------------------

   sSQL := sSelect;

   sSQL := sSQL +
   '   AND NVL(HME.FLGENVIO,0) = 0 '                                                      + #13 +//William Moreira da Silva - SOL 253185  PPM 771995
   '   AND HME.IDTMPDESC            IS NULL '                                                      + #13 +
   '   AND HME.HMEFORMACOBRANCA     =  ''F'' '                                                     + #13 +

   'ORDER BY '                                                                                     + #13;

   case rdgOrdenacao.ItemIndex of
      0: sSQL := sSQL + '   NVL(DEP.MATRICULA, ELP.MATRICULA), CON.IDCONTRATOEMPTMO ';
      1: sSQL := sSQL + '   MUT.NOME, CON.IDCONTRATOEMPTMO ';
      2: sSQL := sSQL + '   CON.IDCONTRATOEMPTMO, HME.HMEPARCELA ';
   end;

   dtmRelConciliaFolhaPP.qryHistMovSemTmpDesc.Close;
   dtmRelConciliaFolhaPP.qryHistMovSemTmpDesc.SQL.Text := sSQL;

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, dtmRelConciliaFolhaPP.qryHistMovSemTmpDesc.SQL.Text);
      CloseFile(Arquivo);
   end;

   dtmRelConciliaFolhaPP.qryHistMovSemTmpDesc.Open;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSelect;

   sSQL := sSQL +
   '   AND HME.FLGENVIO             = 0 '                                                          + #13 +
   '   AND HME.HMEFORMACOBRANCA     =  ''F'' '                                                     + #13 +

   'ORDER BY '                                                                                     + #13;

   case rdgOrdenacao.ItemIndex of
      0: sSQL := sSQL + '   NVL(DEP.MATRICULA, ELP.MATRICULA), CON.IDCONTRATOEMPTMO ';
      1: sSQL := sSQL + '   MUT.NOME, CON.IDCONTRATOEMPTMO ';
      2: sSQL := sSQL + '   CON.IDCONTRATOEMPTMO, HME.HMEPARCELA ';
   end;

   dtmRelConciliaFolhaPP.qryHistMovNaoEnviado.Close;
   dtmRelConciliaFolhaPP.qryHistMovNaoEnviado.SQL.Text := sSQL;

   if not(chkNaoEnviado.Checked) then
   begin
      if FileExists(sArquivo) then
      begin
         Append(Arquivo);
         Writeln(Arquivo, ' ');
         Writeln(Arquivo, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
         Writeln(Arquivo, ' ');
         Writeln(Arquivo, dtmRelConciliaFolhaPP.qryHistMovNaoEnviado.SQL.Text);
         CloseFile(Arquivo);
      end;

      dtmRelConciliaFolhaPP.qryHistMovNaoEnviado.Open;
   end;

   // ----------------------------------------------------------------------------------------------

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, 'Término : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      CloseFile(Arquivo);
   end;

   // ----------------------------------------------------------------------------------------------
end;



procedure TcfgRelConciliaFolhaPP.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContratoClick(Sender);

   // preenche o mês de cobrança
   cboMes.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(SysDate);

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



procedure TcfgRelConciliaFolhaPP.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelConciliaFolhaPP.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelConciliaFolhaPP.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelConciliaFolhaPP.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelConciliaFolhaPP.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelConciliaFolhaPP.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



end.
