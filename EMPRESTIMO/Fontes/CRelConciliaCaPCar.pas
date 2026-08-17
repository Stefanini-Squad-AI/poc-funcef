unit CRelConciliaCaPCar;

// Alterações:
{  --------------------------------------------------------------------------------------------------
Rotina      : FiltraRelatorio
Pendência   : SIG131775         
Responsável : Leandro
Data        : 02/08/2023
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO->HEMORIGEM = 11
--------------------------------------------------------------------------------------------------
Pendência   : SOL 253185  PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 13/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 21/12/2005
Autor     : André Pontes
Pendência : -
Descrição : Cláusula para retirar os documentos estornados (na HistMovXDocum) da lista de "sem vínculo"
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mListaPlano, mListaPatro, fcCombo, fcColorCombo,
   mMutuario, Mask, wwdbedit, Wwdbspin, wwdblook, Db, DBTables, Wwquery,
   mContratoEmptmo, wwdbdatetimepicker, CMDateTimePicker;

type
   TcfgRelConciliaCapCar = class(TcfgRel)
      GroupBox1: TGroupBox;
      chkCaP: TCheckBox;
      chkCaR: TCheckBox;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      chkSintetico: TCheckBox;
      GroupBox4: TGroupBox;
      edtDataFim: TCMDateTimePicker;
      edtDataIni: TCMDateTimePicker;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      GroupBox3: TGroupBox;
      chkValorDivergCapCar: TCheckBox;
      chkValorZeroCapCar: TCheckBox;
      chkValorNAOZeroCapCar: TCheckBox;
      chkNaoProcessadoCapCar: TCheckBox;
      GroupBox5: TGroupBox;
      chkValorDivergEP: TCheckBox;
      chkValorZeroEP: TCheckBox;
      chkValorNAOZeroEP: TCheckBox;
      chkDivergCapCarEP: TCheckBox;
    chkNaoEnviado: TCheckBox;

      procedure FormShow(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
  cfgRelConciliaCapCar: TcfgRelConciliaCapCar;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   uFuncoesEmptmo,
   dEmptmo,
   uMensErro,
   dRelConciliaCapCar;




procedure TcfgRelConciliaCapCar.AbreQueries;
begin
   //
end;



procedure TcfgRelConciliaCapCar.MontaQuery;
begin
   inherited;

   with dtmRelConciliaCapCar do
   begin
      dDataIni             := edtDataIni.Date;
      dDataFim             := edtDataFim.Date;

      lblDataIni.Caption   := edtDataIni.Text;
      lblDataFim.Caption   := edtDataFim.Text;

      lblCaP.Visible       := chkCaP.Checked;
      lblCaR.Visible       := chkCaR.Checked;

      // -------------------------------------------------------------------------------------------

      lblNaoEnviado.Visible         := chkNaoEnviado.Checked;

      lblValorDivergFolha.Visible   := chkValorDivergCapCar.Checked;
      lblValorNAOZeroFolha.Visible  := chkValorNAOZeroCapCar.Checked;
      lblValorZeroFolha.Visible     := chkValorZeroCapCar.Checked;
      lblNaoProcessadoFolha.Visible := chkNaoProcessadoCapCar.Checked;

      lblValorDivergEP.Visible      := chkValorDivergEP.Checked;
      lblValorNAOZeroEP.Visible     := chkValorNAOZeroEP.Checked;
      lblValorZeroEP.Visible        := chkValorZeroEP.Checked;
      lblDivergFolhaEP.Visible      := chkDivergCapCarEP.Checked;

      lblCabecalhoFolha.Visible     := chkValorDivergCapCar.Checked or chkValorNAOZeroCapCar.Checked or
                                       chkValorZeroCapCar.Checked or chkNaoProcessadoCapCar.Checked;
      linCabecalhoFolha.Visible     := lblCabecalhoFolha.Visible;

      lblCabecalhoEP.Visible        := chkValorDivergEP.Checked or chkValorNAOZeroEP.Checked or
                                       chkValorZeroEP.Checked or chkDivergCapCarEP.Checked;

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



procedure TcfgRelConciliaCapCar.FiltraRelatorio;
var
   sSQL        : String;
   sSelect     : String;
   sMes        : String;
   sArquivo    : String;
   Arquivo     : TextFile;
begin
   //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   //sArquivo := Sistema.TempDir + 'EP-RelConcilicaoCapCar.txt';
     sArquivo := ftempregra + '\' + 'EP-RelConcilicaoCapCar.txt';

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   DOC.CODDOCUMENTO, DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, '                                    + #13 +
   '   (DOC.NODOCUMENTO || '' / '' || DOC.COMPLDOCUMENTO) AS NODOCUMENTO_COMPL, '                  + #13 +

   '   PES.NOME AS PESSOA_DOCUMENTO, '                                                             + #13 +

   '   SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS HMEVLRPREVISTO, '                                   + #13 +
   '   SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) AS HMEVLREFETIVO, '                                     + #13 +

   '   LDC.VALOR_LANCADO, LDC.VALOR_BAIXADO, '                                                     + #13 +
   '   (LDC.VALOR_LANCADO - LDC.VALOR_BAIXADO) AS RESIDUO, '                                       + #13 +
   '   (LDC.VALOR_BAIXADO - SUM(ABS(NVL(HME.HMEVLREFETIVO, 0)))) AS VLRNAORECEBIDO, '              + #13 +

   '   NVL(BAI.DATA_BAIXA, DOC.DATAVENCTO) AS DATA_REF, '                                          + #13 +

   '   DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' '') AS REC_PAG, '           + #13 +

   '   (DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' '') || '' - '' '           +
      '|| NVL(BAI.data_baixa, DOC.DATAVENCTO)) AS REC_PAG_DATA '                                   + #13 +

   'FROM '                                                                                         + #13 +
   '   PESSOA         PES, '                                                                       + #13 +
   '   HISTMOVEMPTMO  HME, '                                                                       + #13 +
   '   DOCUMENTO      DOC, '                                                                       + #13 +
   '   TIPOSUSPEMPTMO TSE, '                                                                       + #13 +

   '   ( '                                                                                         + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                                                     + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      RPT.CODDOCUMENTO, '                                                                      + #13 +
   '      MAX(DATABAIXA) AS DATA_BAIXA '                                                           + #13 +
   '   FROM '                                                                                      + #13 +
   '      RECBTOPAGTO RPT, '                                                                       + #13 +
   '      DOCUMENTO   DCU '                                                                        + #13 +
   '   WHERE '                                                                                     + #13 +
   '          DCU.IDMODULO     = 15 '                                                              + #13 +
   '      AND RPT.DATABAIXA    BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' +
                                           OraData(edtDataFim.Date)                                + #13 +
   '      AND RPT.CODDOCUMENTO = DCU.CODDOCUMENTO '                                                + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      RPT.CODDOCUMENTO '                                                                       + #13 +
   '   ) BAI, '                                                                                    + #13 +

   '   ( '                                                                                         + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                           + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '       LDO.CODDOCUMENTO, '                                                                     + #13 +
   '       SUM(DECODE(LDO.OPERACAO, 2, LDO.VALOR, 0)) AS VALOR_LANCADO, '                          + #13 +
   '       SUM(DECODE(LDO.OPERACAO, 5, LDO.VALOR, 0)) AS VALOR_BAIXADO '                           + #13 +
   '   FROM '                                                                                      + #13 +
   '       LANCTODOCUM LDO, '                                                                      + #13 +
   '       DOCUMENTO   DCU '                                                                       + #13 +
   '   WHERE '                                                                                     + #13 +
   '          DCU.IDMODULO     = 15 '                                                              + #13 +
   '      AND LDO.ESTORNO      IS NULL '                                                           + #13 +
   '      AND LDO.CODDOCUMENTO = DCU.CODDOCUMENTO '                                                + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '       LDO.CODDOCUMENTO '                                                                      + #13 +
   '   ) LDC '                                                                                     + #13 +

   'WHERE '                                                                                        + #13 +

   '       (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '                                 + #13 +
   '   AND DOC.IDMODULO             = 15 '                                                         + #13 +

   '   AND ( '                                                                                     + #13 +
   '       ((DOC.DATAVENCTO  BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' +
                                         OraData(edtDataFim.Date) + ') AND BAI.DATA_BAIXA IS NULL) OR '  + #13 +
   '       (BAI.DATA_BAIXA   BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' +
                                         OraData(edtDataFim.Date) + ') '                           + #13 +
   '       ) '                                                                                     + #13 +

   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                          + #13 +
   '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                          + #13;

   if (chkCaP.Checked) xor (chkCaR.Checked) then
   begin
      if chkCaP.Checked then sSQL := sSQL + '   AND DOC.RECPAG = ''P'' '                           + #13;
      if chkCaR.Checked then sSQL := sSQL + '   AND DOC.RECPAG = ''R'' '                           + #13;
   end;

   // ----------------------------------------------------------------------------------------------

   if chkValorDivergCapCar.Checked then sSQL := sSQL +
   '   AND (LDC.VALOR_BAIXADO       IS NOT NULL AND LDC.VALOR_BAIXADO <> LDC.VALOR_LANCADO) '      + #13;

   if chkValorNAOZeroCapCar.Checked then sSQL := sSQL +
   '   AND NVL(LDC.VALOR_BAIXADO, 0) <> 0 '                                                        + #13;

   if chkValorZeroCapCar.Checked then sSQL := sSQL +
   '   AND LDC.VALOR_BAIXADO        = 0 '                                                          + #13;

   if chkNaoProcessadoCapCar.Checked then sSQL := sSQL +
   '   AND RTRIM(LTRIM(DOC.STATUS)) <> ''2'' '                                                     + #13;

   // ----------------------------------------------------------------------------------------------

   if chkValorDivergEP.Checked then sSQL := sSQL +
   '   AND HME.HMEVLREFETIVO        IS NOT NULL '                                                  + #13;

   if chkValorNAOZeroEP.Checked then sSQL := sSQL +
   '   AND HME.HMEVLREFETIVO        IS NOT NULL '                                                  + #13;

   if chkValorZeroEP.Checked then sSQL := sSQL +
   '   AND HME.HMEVLREFETIVO        IS NULL '                                                      + #13;

   if chkDivergCapCarEP.Checked then sSQL := sSQL +
   '   AND HME.HMEVLREFETIVO        IS NOT NULL '                                                  + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND ( '                                                                                     + #13 +
   '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                       + #13 +
   '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1) '                       + #13 +
   '       ) '                                                                                     + #13 +

   '   AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) '                                    + #13 +
   '   AND HME.CODDOCUMENTO         = DOC.CODDOCUMENTO '                                           + #13 +
   '   AND DOC.CODDOCUMENTO         = BAI.CODDOCUMENTO(+) '                                        + #13 +
   '   AND DOC.CODDOCUMENTO         = LDC.CODDOCUMENTO '                                           + #13 +
   '   AND DOC.IDFORCLI             = PES.IDPESSOA '                                               + #13 +

   'GROUP BY '                                                                                     + #13 +
   '   DOC.CODDOCUMENTO, DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, '                                    + #13 +
   '   (DOC.NODOCUMENTO || '' / '' || DOC.COMPLDOCUMENTO), '                                       + #13 +
   '   NVL(BAI.DATA_BAIXA, DOC.DATAVENCTO), '                                                      + #13 +
   '   DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' ''), '                      + #13 +
   '   (DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' '') || '' - '' || '        +
       'NVL(BAI.data_baixa, DOC.DATAVENCTO)), '                                                    + #13 +
   '   PES.NOME, '                                                                                 + #13 +
   '   LDC.VALOR_LANCADO, '                                                                        + #13 +
   '   LDC.VALOR_BAIXADO '                                                                         + #13;

   if (chkValorDivergEP.Checked) or (chkDivergCapCarEP.Checked) then sSQL := sSQL +
   'HAVING '                                                                                       + #13;

   if chkValorDivergEP.Checked then sSQL := sSQL +
   '   SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) <> SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) '               + #13;

   if (chkValorDivergEP.Checked) and (chkDivergCapCarEP.Checked) then sSQL := sSQL +
   '   AND '                                                                                       + #13;

   if chkDivergCapCarEP.Checked then sSQL := sSQL +
   '   SUM(ABS(NVL(HME.HMEVLREFETIVO, 0))) <> LDC.VALOR_BAIXADO '                                  + #13;

   sSQL := sSQL +
   'ORDER BY '                                                                                     + #13 +
   '   NVL(BAI.DATA_BAIXA, DOC.DATAVENCTO), '                                                      + #13 +
   '   DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' ''), '                      + #13 +
   '   DOC.CODDOCUMENTO ';

   // ----------------------------------------------------------------------------------------------

   dtmRelConciliaCapCar.qryConciliaCapCar.Close;
   dtmRelConciliaCapCar.qryConciliaCapCar.SQL.Text := sSQL;
   dtmRelConciliaCapCar.qryConciliaCapCar.SQL.SaveToFile(sArquivo);

   AssignFile(Arquivo, sArquivo);

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, 'Início  : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      CloseFile(Arquivo);
   end;

   dtmRelConciliaCapCar.qryConciliaCapCar.Open;

   // ----------------------------------------------------------------------------------------------

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   DOC.CODDOCUMENTO, CON.IDCONTRATOEMPTMO, MUT.NOME, '                                         + #13 +
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
   //'          11, ''Recebimento'', '                                                               + #13 +  //LEANDRO SIG131775
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
   '   DOCUMENTO         DOC, '                                                                    + #13 +
   '   RECBTOPAGTO       RPT, '                                                                    + #13 +
   '   PESSOA            MUT, '                                                                    + #13 +
   '   CONTRATOEMPTMO    CON, '                                                                    + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                                    + #13 +
   '   DEPENTIT          DEP, '                                                                    + #13 +
   '   ELEGPATRO         ELP, '                                                                    + #13 +

   //LEANDRO SIG131775 INICIO
   '     (SELECT ''1'' AS PRESTPARCIAL , TMP.*   '                                                   + #13 +
   '                             FROM TMPDESC TMP    '                                             + #13 +
   '                             WHERE ((TMP.VALORRECEBIDO > 0 AND TMP.VALORRECEBIDO < VALOR)  '   + #13 +
   '                             AND  TMP.DATARECEBIMENTO IS NOT NULL)) as TMP_ORI'                + #13 +

   //LEANDRO SIG131775 FIM

   'WHERE '                                                                                        + #13 +
   '       ( '                                                                                     + #13 +
   '       ((DOC.DATAVENCTO  BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' +
                                         OraData(edtDataFim.Date) + ') AND RPT.DATABAIXA IS NULL) OR '   + #13 +
   '       (RPT.DATABAIXA    BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' +
                                         OraData(edtDataFim.Date) + ') '                           + #13 +
   '       ) '                                                                                     + #13;

   if (chkCaP.Checked) xor (chkCaR.Checked) then
   begin
      if chkCaP.Checked then sSQL := sSQL + '   AND DOC.RECPAG = ''P'' '                           + #13;
      if chkCaR.Checked then sSQL := sSQL + '   AND DOC.RECPAG = ''R'' '                           + #13;
   end;

   sSQL := sSQL +
   '   AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                                         + #13 +

   '   AND DOC.CODDOCUMENTO          = RPT.CODDOCUMENTO(+) '                                       + #13 +
   '   AND DOC.CODDOCUMENTO          = HME.CODDOCUMENTO '                                          + #13 +
   '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '   AND CON.IDPESSOA              = DEP.IDTITULAR '                                             + #13 +
   '   AND CON.IDBENEF               = DEP.IDPESSOA '                                              + #13 +
   '   AND CON.IDPESSOA              = ELP.IDPESSOA '                                              + #13 +
   '   AND CON.IDPATRO               = ELP.IDPESSJUR '                                             + #13 +
   '   AND CON.IDBENEF               = MUT.IDPESSOA '                                              + #13 +
   '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '                                     + #13 +
   '   AND (HME.idcontratoemptmo = TMP_ORI.IDDESCONTO(+) AND HME.HMEPARCELAALT    = TMP_ORI.PARCELA(+) ) ' + #13 +  // LEANDRO SIG131775

   'ORDER BY '                                                                                     + #13 +
   '   MUT.NOME, NVL(DEP.MATRICULA, ELP.MATRICULA), CON.IDCONTRATOEMPTMO ';

   dtmRelConciliaCapCar.qryHistMov.Close;
   dtmRelConciliaCapCar.qryHistMov.SQL.Text := sSQL;

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, dtmRelConciliaCapCar.qryHistMov.SQL.Text);
      CloseFile(Arquivo);
   end;

   dtmRelConciliaCapCar.qryHistMov.Open;

   // ----------------------------------------------------------------------------------------------

   sSelect :=
   'SELECT '                                                                                       + #13 +
   '   DECODE(HME.HMERECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' '') AS HMERECPAG, '      + #13 +
   '   HME.HMEDATAVENCTO, '                                                                        + #13 +
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
   '   TIPOSUSPEMPTMO    TSE  '                                                                    + #13 +
   //LEANDRO SIG131775 INICIO
   '     (SELECT ''1'' AS PRESTPARCIAL , TMP.*   '                                                   + #13 +
   '                             FROM TMPDESC TMP    '                                             + #13 +
   '                             WHERE ((TMP.VALORRECEBIDO > 0 AND TMP.VALORRECEBIDO < VALOR)  '   + #13 +
   '                             AND  TMP.DATARECEBIMENTO IS NOT NULL)) as TMP_ORI'                + #13 +
   //LEANDRO SIG131775 FIM

   'WHERE '                                                                                        + #13 +
   '       HME.HMEDATAVENCTO        BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' +
                                                OraData(edtDataFim.Date)                           + #13 +

   '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '                                 + #13 +
   '   AND HME.HMETIPOMOV           IN (0, 1, 2, 3, 4, 7) '                                        + #13 +
   '   AND HME.HMEVLRPREVISTO      <> 0 '                                                          + #13;

   if (chkCaP.Checked) xor (chkCaR.Checked) then
   begin
      if chkCaP.Checked then sSelect := sSelect + '   AND HME.HMERECPAG = ''P'' '                  + #13;
      if chkCaR.Checked then sSelect := sSelect + '   AND HME.HMERECPAG = ''R'' '                  + #13;
   end;

   sSelect := sSelect +
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
   '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 + // LEANDRO SIG131775
   '   AND (HME.idcontratoemptmo = TMP_ORI.IDDESCONTO(+) AND HME.HMEPARCELAALT    = TMP_ORI.PARCELA(+) ) '  + #13;  // LEANDRO SIG131775

   // ----------------------------------------------------------------------------------------------

   sSQL := sSelect;

   sSQL := sSQL +
   '   AND NVL(HME.FLGENVIO,0) = 0 '                                                      + #13 + //William Moreira da Silva - SOL 253185 PPM 771995
   '   AND HME.CODDOCUMENTO         IS NULL '                                                      + #13 +
   '   AND HME.HMEFORMACOBRANCA     =  ''C'' '                                                     + #13 +

   'ORDER BY '                                                                                     + #13 +
   '   HME.HMEDATAVENCTO, HME.HMERECPAG, HME.HMETIPOMOV, '                                         + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA), CON.IDCONTRATOEMPTMO ';

   dtmRelConciliaCapCar.qryHistMovSemTmpDesc.Close;
   dtmRelConciliaCapCar.qryHistMovSemTmpDesc.SQL.Text := sSQL;

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, dtmRelConciliaCapCar.qryHistMovSemTmpDesc.SQL.Text);
      CloseFile(Arquivo);
   end;

   dtmRelConciliaCapCar.qryHistMovSemTmpDesc.Open;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSelect;

   sSQL := sSQL +
   '   AND HME.FLGENVIO             = 0 '                                                          + #13 +
   '   AND HME.HMEFORMACOBRANCA     =  ''C'' '                                                     + #13 +

   'ORDER BY '                                                                                     + #13 +
   '   HME.HMEDATAVENCTO, HME.HMERECPAG, HME.HMETIPOMOV, '                                         + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA), CON.IDCONTRATOEMPTMO ';

   dtmRelConciliaCapCar.qryHistMovNaoEnviado.Close;
   dtmRelConciliaCapCar.qryHistMovNaoEnviado.SQL.Text := sSQL;

   if not(chkNaoEnviado.Checked) then
   begin
      if FileExists(sArquivo) then
      begin
         Append(Arquivo);
         Writeln(Arquivo, ' ');
         Writeln(Arquivo, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
         Writeln(Arquivo, ' ');
         Writeln(Arquivo, dtmRelConciliaCapCar.qryHistMovNaoEnviado.SQL.Text);
         CloseFile(Arquivo);
      end;

      dtmRelConciliaCapCar.qryHistMovNaoEnviado.Open;
   end;

   // ----------------------------------------------------------------------------------------------

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   DOC.CODDOCUMENTO, DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, '                                    + #13 +
   '   (DOC.NODOCUMENTO || '' / '' || DOC.COMPLDOCUMENTO) AS NODOCUMENTO_COMPL, '                  + #13 +
   '   PES.NOME AS PESSOA_DOCUMENTO, '                                                             + #13 +
   '   LDC.VALOR_LANCADO, LDC.VALOR_BAIXADO, '                                                     + #13 +
   '   NVL(BAI.DATA_BAIXA, DOC.DATAVENCTO) AS DATA_REF, '                                          + #13 +
   '   DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' '') AS REC_PAG, '           + #13 +
   '   (DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' '') || '' - '' '           +
      '|| NVL(BAI.data_baixa, DOC.DATAVENCTO)) AS REC_PAG_DATA '                                   + #13 +

   'FROM '                                                                                         + #13 +
   '   PESSOA         PES, '                                                                       + #13 +
   '   DOCUMENTO      DOC, '                                                                       + #13 +

   '   ( '                                                                                         + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                                                                                    + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '      RPT.CODDOCUMENTO, '                                                                      + #13 +
   '      MAX(DATABAIXA) AS DATA_BAIXA '                                                           + #13 +
   '   FROM '                                                                                      + #13 +
   '      RECBTOPAGTO RPT, '                                                                       + #13 +
   '      DOCUMENTO   DCU '                                                                        + #13 +
   '   WHERE '                                                                                     + #13 +
   '          DCU.IDMODULO     = 15 '                                                              + #13 +
   '      AND RPT.DATABAIXA    BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' +
                                           OraData(edtDataFim.Date)                                + #13 +
   '      AND RPT.CODDOCUMENTO = DCU.CODDOCUMENTO '                                                + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '      RPT.CODDOCUMENTO '                                                                       + #13 +
   '   ) BAI, '                                                                                    + #13 +

   '   ( '                                                                                         + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '   SELECT '                                                                                    + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '       LDO.CODDOCUMENTO, '                                                                     + #13 +
   '       SUM(DECODE(LDO.OPERACAO, 2, LDO.VALOR, 0)) AS VALOR_LANCADO, '                          + #13 +
   '       SUM(DECODE(LDO.OPERACAO, 5, LDO.VALOR, 0)) AS VALOR_BAIXADO '                           + #13 +
   '   FROM '                                                                                      + #13 +
   '       LANCTODOCUM LDO, '                                                                      + #13 +
   '       DOCUMENTO   DCU '                                                                       + #13 +
   '   WHERE '                                                                                     + #13 +
   '          DCU.IDMODULO     = 15 '                                                              + #13 +
   '      AND LDO.ESTORNO      IS NULL '                                                           + #13 +
   '      AND LDO.CODDOCUMENTO = DCU.CODDOCUMENTO '                                                + #13 +
   '   GROUP BY '                                                                                  + #13 +
   '       LDO.CODDOCUMENTO '                                                                      + #13 +
   '   ) LDC '                                                                                     + #13 +

   'WHERE '                                                                                        + #13 +
   '       DOC.IDMODULO             = 15 '                                                         + #13 +

   '   AND ( '                                                                                     + #13 +
   '       ((DOC.DATAVENCTO  BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' +
                                         OraData(edtDataFim.Date) + ') AND BAI.DATA_BAIXA IS NULL) OR '  + #13 +
   '       (BAI.DATA_BAIXA   BETWEEN ' + OraData(edtDataIni.Date) + ' AND ' +
                                         OraData(edtDataFim.Date) + ') '                           + #13 +
   '       ) '                                                                                     + #13;

   if (chkCaP.Checked) xor (chkCaR.Checked) then
   begin
      if chkCaP.Checked then sSQL := sSQL + '   AND DOC.RECPAG = ''P'' '                           + #13;
      if chkCaR.Checked then sSQL := sSQL + '   AND DOC.RECPAG = ''R'' '                           + #13;
   end;

   sSQL := sSQL +
   '   AND DOC.CODDOCUMENTO         = BAI.CODDOCUMENTO(+) '                                        + #13 +
   '   AND DOC.CODDOCUMENTO         = LDC.CODDOCUMENTO '                                           + #13 +
   '   AND DOC.IDFORCLI             = PES.IDPESSOA '                                               + #13 +

   '   AND NOT EXISTS ( '                                                                          + #13 +
   '                  SELECT 1 '                                                                   + #13 +
   '                  FROM   HISTMOVEMPTMO HME '                                                   + #13 +
   '                  WHERE  HME.CODDOCUMENTO = DOC.CODDOCUMENTO '                                 + #13 +
   '                  ) '                                                                          + #13 +

   // André Pontes - 21/12/2005
   '   AND NOT EXISTS ( '                                                                          + #13 +
   '                  SELECT 1 '                                                                   + #13 +
   '                  FROM   HISTMOVXDOCUM HMD '                                                   + #13 +
   '                  WHERE  HMD.HMDCODDOCUMENTO = DOC.CODDOCUMENTO '                              + #13 +
   '                  ) '                                                                          + #13 +
   // FIM André Pontes - 21/12/2005

   'GROUP BY '                                                                                     + #13 +
   '   DOC.CODDOCUMENTO, DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, '                                    + #13 +
   '   (DOC.NODOCUMENTO || '' / '' || DOC.COMPLDOCUMENTO), '                                       + #13 +
   '   NVL(BAI.DATA_BAIXA, DOC.DATAVENCTO), '                                                      + #13 +
   '   DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' ''), '                      + #13 +
   '   (DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' '') || '' - '' || '        +
       'NVL(BAI.DATA_BAIXA, DOC.DATAVENCTO)), '                                                    + #13 +
   '   PES.NOME, '                                                                                 + #13 +
   '   LDC.VALOR_LANCADO, '                                                                        + #13 +
   '   LDC.VALOR_BAIXADO '                                                                         + #13 +

   'ORDER BY '                                                                                     + #13 +
   '   NVL(BAI.DATA_BAIXA, DOC.DATAVENCTO), '                                                      + #13 +
   '   DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' ''), '                      + #13 +
   '   DOC.CODDOCUMENTO ';

   dtmRelConciliaCapCar.qryDocSemVinculo.Close;
   dtmRelConciliaCapCar.qryDocSemVinculo.SQL.Text := sSQL;

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, dtmRelConciliaCapCar.qryDocSemVinculo.SQL.Text);
      CloseFile(Arquivo);
   end;

   dtmRelConciliaCapCar.qryDocSemVinculo.Open;

   // ----------------------------------------------------------------------------------------------

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, 'Término : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      CloseFile(Arquivo);
   end;

   // ----------------------------------------------------------------------------------------------
end;



procedure TcfgRelConciliaCapCar.FormShow(Sender: TObject);
var
   dDataHoje : TDateTime;
   dDataIni  : TDateTime;
begin
   inherited;

   // preenche as datas - período sempre de Domingo a Sábado
   dDataHoje         :=  Sysdate;

   case DayOfWeek(dDataHoje) of
      1, 2, 3, 4: dDataIni := dDataHoje - (DayOfWeek(dDataHoje) + 6);
      5, 6, 7:    dDataIni := dDataHoje - (DayOfWeek(dDataHoje) - 1);
   end;

   edtDataIni.Date   := dDataIni;
   edtDataFim.Date   := dDataIni + 6;

   AbreQueries;
end;



end.
