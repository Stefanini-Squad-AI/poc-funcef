//***************************************************************************************
//N. Chamado....: WO29619
//Dt Alterações.: 24/12/2025
//Responsável...: Paulo Nobre
//Descrição.....: Inclusão do CAST na coluna HMEPARCELA no SQL da função
//                MontaSelectMovContr.
//***************************************************************************************
//Nº SIG............: 90625
//Data da Alteração.: 06/12/2019
//Alteração Form....: Inclusão SISTEMA_AMORTIZAÇÃO
//Responsável.......: Rafael Vasconcelos
//**************************************************************************************
//Nº SOL............: 265007.17919
//Nº PPM............: 1167870
//Data da Alteração.: 18/11/2015
//Alteração Form....: Alteração da query na rotina MontaSelectMovContr
//Responsável.......: William Santana
//Descrição.........: alteração no relatório Extrato de Movimentações por Contrato.
//**************************************************************************************
//------------------------------------------------------------------------------
//Responsável : Fanuel Junior
//Pendência   : SOL 174448 Kintana 1576064
//Data        : 29/02/2012
//Descrição   : Soma do valor previsto esta errado
//------------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 124654 Kintana 746350
//Data        : 22/02/2010
//Descrição   : Adicionar campo indicando a situação do item(suspenso, abonado ou quitado).
//------------------------------------------------------------------------------
//Pendência   : SOL 114575 KINTANA 535771
//Responsável : Jésica Lana
//Data        : 24/04/2009
//Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
//------------------------------------------------------------------------------
unit CRelMovContr;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, CheckLst, fcCombo, fcColorCombo, Mask, wwdbedit,
   Wwdbspin, wwdblook, Db, DBTables, mListaPlano, mListaPatro;

type
   TcfgRelMovContr = class(TcfgRel)
      rgOrdenar: TRadioGroup;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAnoIni: TwwDBSpinEdit;
      cboMesIni: TComboBox;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      cboMesFim: TComboBox;
      DBspnAnoFim: TwwDBSpinEdit;
      chkCentralizador: TCheckBox;
      chkTrataSaldo: TCheckBox;
      Label3: TLabel;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
    chkAtuDia: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

      function  MontaSelectMovContr(const idContrato: Extended; const idTipoEmprestimo, idTipoContrato: Int64;
                                    const sMesCompetencia, sAnoCompetencia, sOrdenar: String): String;

  public { Public declarations }

  end;



var
  cfgRelMovContr: TcfgRelMovContr;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UFuncoesEmptmo,
   UDiasUteis,
   dRelMovContr,
   USistema,
   dEmptmo;




function TcfgRelMovContr.MontaSelectMovContr(const idContrato: Extended; const idTipoEmprestimo, idTipoContrato: Int64;
                                             const sMesCompetencia, sAnoCompetencia, sOrdenar: String): String;
var
   sSQL            : String;
   sCompetenciaIni : String;
   sCompetenciaFim : String;
   sMes            : String;
begin

   sMes := IntToStr(cboMesIni.ItemIndex + 1);
   if Length(sMes) = 1 then sMes := '0' + sMes;
   sCompetenciaIni := FormatFloat('0000',DBspnAnoIni.Value) + sMes;

   sMes := IntToStr(cboMesFim.ItemIndex + 1);
   if Length(sMes) = 1 then sMes := '0' + sMes;
   sCompetenciaFim := FormatFloat('0000',DBspnAnoFim.Value) + sMes;

   //Fanuel Junior SOL174448 Kintana1576064
   dtmRelMovContr.qryValorAberto.Close;
   dtmRelMovContr.qryValorAberto.ParamByName('DATAINICIO').AsString := sCompetenciaIni;
   dtmRelMovContr.qryValorAberto.ParamByName('DATAFIM').AsString := sCompetenciaFim;
   dtmRelMovContr.qryValorAberto.ParamByName('PIDCONTRATOEMPTMO').AsFloat := idContrato;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      dtmRelMovContr.qryValorAberto.ParamByName('PINIBESUSP').AsInteger := 1;

   dtmRelMovContr.qryValorAberto.Open;
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   //Início - William Santana - SOL 265007.17919 PPM 1167870
//   sSQL :=
//   'SELECT '                                                                  + #13 +
//   '  DECODE(H.HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) AS ORDENACAO, ' + #13 +
//
//   '  NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '                       + #13 +
//   '  DATACREDITO, '                                                          + #13 +
//   '  C.IDTIPOCONTREMPTMO, '                                                  + #13 +
//   '  C.IDCONTRATOEMPTMO, '                                                   + #13 +
//   '  I.IDITEMEMPTMO, '                                                       + #13 +
//   '  I.ITEDESCRICAO, '                                                       + #13 +
//   '  P.NOME, '                                                               + #13 +
//   '  H.HMEVLRPREVISTO, '                                                     + #13 +
//   '  H.HMEVLREFETIVO, '                                                      + #13 +
//   '  HMETXJUROS, '                                                           + #13 +
//   '  CODDOCUMENTO, '                                                         + #13 +
//   '  IDRUBRICA, '                                                            + #13 +
//   '  H.HMEDATAPREVISTA, '                                                    + #13 +
//   '  H.HMEDATAEFETIVA, '                                                     + #13 +
//   '  H.HMEDATAVENCTO, '                                                      + #13 +
//   '  H.HMEANOCOMPETENCIA AS ANOCOMP, '                                       + #13 +
//   '  H.HMEMESCOMPETENCIA AS MESCOMP, '                                       + #13 +
//   '  H.HMEANOCOBRANCA AS ANOCOBR, '                                          + #13 +
//   '  H.HMEMESCOBRANCA AS MESCOBR, '                                          + #13 +
//
//   '  (TO_CHAR(NVL(H.HMEPARCELAALT, H.HMEPARCELA), ''00'') || ''/'' || TO_CHAR(H.HMENUMPARCELAS, ''00'')) AS HMEPARCELA, '  + #13 +
//
//   '  H.HMESEQCOBRANCA, '                                                     + #13 +
//   '  H.HMESALDODEV, '                                                        + #13 +
//   '  (PL.PLNCODIGO||''/''||PL.PLNPLANIL) AS PLNPLANIL, '                     + #13 +
//   '  PL.PLNDATDIA, '                                                         + #13 +
//   '  TC.TCEDESCRICAO, '                                                      + #13 +
//   '  H.HMETIPOMOV AS TIPOMOV, '                                              + #13 +
//   '  IC.ITCSEQCALCULO, '                                                     + #13 +
//
//   '  DECODE(C.FLGFORMAPAG, '                                                 + #13 +
//   '         ''F'', ''Folha de Pagamento'', '                                 + #13 +
//   '                ''Banco'' '                                               + #13 +
//   '        ) AS FLGFORMAPAG, '                                               + #13 +
//
//    Renato Visoni SOL 124654 Kintana 746350
//   '  DECODE(NVL(H.FLGSUSPENSAO, 0), '                                        + #13 +
//   '         0 , '' '', '                                                     + #13 +
//   '             TSE.TSEDESCRICAO '                                           + #13 +
//   '        ) AS SUSPENSAO, '                                                 + #13 +
//
//
//   ' DECODE(NVL(H.FLGSUSPENSAO, 0), '                                         + #13 +
//   '    1,                          '                                         + #13 +
//   '    TSE.TSEDESCRICAO,           '                                         + #13 +
//   '    DECODE(NVL(H.FLGABONADO, 0),'                                         + #13 +
//   '           1,                   '                                         + #13 +
//   '           ''Abonado'',         '                                         + #13 +
//   '           DECODE(NVL(H.FLGQUITADO, 0), 1, ''Quitado''))) AS SUSPENSAO, ' + #13 +
//    Renato Visoni SOL 124654 Kintana 746350
//   
//
//   '  DECODE(H.HMETIPOMOV, '                                                  + #13 +
//   '         0, ''Concessão/Renovação'', '                                    + #13 +
//   '         1, ''Prestação '', '                                             + #13 +
//   '         2, ''Amortização/Refinanciamento'', '                            + #13 +
//   '         3, ''Quitação'', '                                               + #13 +
//   '         4, ''Atualização de Débito'', '                                  + #13 +
//   '         5, ''Atualização de Saldo (Diária)'' , '                         + #13 +
//   '         6, ''Importação/Migração'', '                                    + #13 +
//   '         7, ''Ajustes (Cobrança/Devolução)'', '                           + #13 +
//   '         8, ''Ajustes (Saldo Devedor)'' '                                 + #13 +
//   '        ) AS EVENTO, '                                                    + #13 +
//
//   '  TO_CHAR(H.HMEMESCOMPETENCIA, ''00'') || ''/'' || TO_CHAR(H.HMEANOCOMPETENCIA,''0000'') AS ANOMESCOMP, ' + #13 +
//   '  TO_CHAR(H.HMEMESCOBRANCA, ''00'')    || ''/'' || TO_CHAR(H.HMEANOCOBRANCA,''0000'')    AS ANOMESCOBR, ' + #13 +
//
//   '  DECODE(H.HMETIPOMOV, '                                                                                         + #13 +
//   '         0, 0, '                                                                                                 + #13 +
//   '         5, 0, '                                                                                                 + #13 +
//   '         8, 0, '                                                                                                 + #13 +
//   '         DECODE(H.HMEVLREFETIVO, '                                                                               + #13 +
//   '                NULL, '                                                                                   + #13 +
//   '                DECODE(NVL(H.FLGQUITADO, 0), '                                                                   + #13 +
//   '                       1, 0, '                                                                                   + #13 +
//   '                       DECODE(NVL(H.FLGABONADO, 0), '                                                            + #13 +
//   '                              1, 0, '                                                                            + #13 +
//   '                              DECODE(NVL(PEP.FLGEXCEPCIONAL, 0), '                                               + #13 +
//   '                                     0, ( '                                                                      + #13 +
//   '                                        DECODE(NVL(H.HMECENTRALIZA, 0), '                                        + #13 +
//   '                                               0, 0, '                                                           + #13 +
//   '                                               DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, 0) '              + #13 +
//   '                                              ) + '                                                              + #13 +
//   '                                        DECODE(NVL(H.HMEDESTACADO, 0), '                                         + #13 +
//   '                                               0, 0, '                                                           + #13 +
//   '                                               DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, 0) '              + #13 +
//   '                                              ) '                                                                + #13 +
//   '                                        ), '                                                                     + #13 +
//   '                                     1, ( '                                                                      + #13 +
//   '                                        DECODE(NVL(H.FLGSUSPENSAO, 0), '                                         + #13 +
//   '                                               1, 0, '                                                           + #13 +
//   '                                               ( '                                                               + #13 +
//   '                                               DECODE(NVL(H.HMECENTRALIZA, 0), '                                 + #13 +
//   '                                                      0, 0, '                                                    + #13 +
//   '                                                      DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, 0)) + '    + #13 +
//   '                                               DECODE(NVL(H.HMEDESTACADO, 0), '                                  + #13 +
//   '                                                      0, 0, '                                                    + #13 +
//   '                                                      DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, 0)) '      + #13 +
//   '                                               ) '                                                               + #13 +
//   '                                              ) '                                                                + #13 +
//   '                                        ) '                                                                      + #13 +
//   '                                    ) '                                                                          + #13 +
//   '                             ) '                                                                                 + #13 +
//   '                      ), '                                                                                       + #13 +
//   '                0 '                                                                                              + #13 +
//   '               ) '                                                                                               + #13 +
//   '        ) AS VLR_ABERTO '                                                                                        + #13 +
//
//   'FROM '                                                                    + #13 +
//   '  PESSOA           P,   '                                                 + #13 +
//   '  DEPENTIT         DEP, '                                                 + #13 +
//   '  ELEGPATRO        ELP, '                                                 + #13 +
//   '  PLANILHA         PL,  '                                                 + #13 +
//   '  HISTMOVEMPTMO    H,   '                                                 + #13 +
//   '  CONTRATOEMPTMO   C,   '                                                 + #13 +
//   '  PARAMEMPTMO      PEP, '                                                 + #13 +
//   '  ITEMXTIPOCONTR   IC,  '                                                 + #13 +
//   '  TIPOCONTREMPTMO  TC,  '                                                 + #13 +
//   '  TIPOSUSPEMPTMO   TSE, '                                                 + #13 +
//   '  ITEMEMPTMO       I    '                                                 + #13 +
//
//   'WHERE '                                                                   + #13 +
//
//   '      PEP.IDEMPRESAPROP = ' + FormatFloat('#0', Sistema.IDEmpresa)     + #13 +
//
//   '  AND (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, ''0000'')))) || ' +
//        ' (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, ''00'')))) >= ' + QuotedStr(sCompetenciaIni) + #13 +
//
//   '  AND (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, ''0000'')))) || ' +
//        ' (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, ''00'')))) <= ' + QuotedStr(sCompetenciaFim) + #13 +
//
//   '  AND NVL(H.FLGESTORNADO, 0) = 0 '                                        + #13 +
//
//   '  AND C.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '          + #13 +
//   '  AND C.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '          + #13;
//
//   if chkCentralizador.Checked then sSQL := sSQL +
//   '  AND ( (H.HMECENTRALIZA  = 1) OR (H.HMEDESTACADO = 1) ) '                + #13;
//
//   if chkTrataSaldo.Checked then sSQL := sSQL +
//   '  AND IC.ITCTRATASALDODEV <> 0  '                                         + #13;
//
//   if chkAtuDia.Checked then sSQL := sSQL +
//   '  AND H.HMETIPOMOV        <> 5 '                                          + #13;
//
//   if idContrato > 0 then sSQL := sSQL +
//   '  AND C.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', idContrato)             + #13;
//
//   if idTipoEmprestimo <> -1 then
//   begin
//      if idTipoContrato <> -1 then
//      begin
//         sSQL := sSQL +
//   ' AND (C.IDTIPOCONTREMPTMO = ' + IntToStr(idTipoContrato)   + ')     '
//      end
//      else
//      begin
//         sSQL := sSQL +
//   ' AND (C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO)                  ' +
//   ' AND (TC.IDTIPOEMPTMO     = ' + IntToStr(idTipoEmprestimo) + ')     ' ;
//      end;
//   end;
//
//   sSQL := sSQL +
//   '  AND C.IDBENEF           = P.IDPESSOA '                                  + #13 +
//   '  AND C.IDBENEF           = DEP.IDPESSOA '                                + #13 +
//   '  AND C.IDPESSOA          = DEP.IDTITULAR '                               + #13 +
//   '  AND C.IDPESSOA          = ELP.IDPESSOA '                                + #13 +
//   '  AND C.IDPATRO           = ELP.IDPESSJUR '                               + #13 +
//   '  AND C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO '                          + #13 +
//   '  AND C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO '                        + #13 +
//   '  AND I.IDITEMEMPTMO      = IC.IDITEMEMPTMO '                             + #13 +
//   '  AND H.IDITEMEMPTMO      = IC.IDITEMEMPTMO '                             + #13 +
//   '  AND H.PLNCODIGO         = PL.PLNCODIGO(+) '                             + #13 +
//   '  AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '                        + #13 +
//   '  AND H.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO(+) '                     + #13;
//
//    ----------------------------------------------------------------------------------------------
//    ----------------------------------------------------------------------------------------------
//    ----------------------------------------------------------------------------------------------
//
//   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
//   begin
//      sSQL := sSQL +
//      'UNION '                                                    + #13 +
//
//      'SELECT '                                                   + #13 +
//      '  DECODE(H.HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) AS ORDENACAO, ' + #13 +
//
//      '  NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '        + #13 +
//      '  DATACREDITO, '                                           + #13 +
//      '  C.IDTIPOCONTREMPTMO, '                                   + #13 +
//      '  C.IDCONTRATOEMPTMO, '                                    + #13 +
//      '  I.IDITEMEMPTMO, '                                        + #13 +
//      '  I.ITEDESCRICAO, '                                        + #13 +
//      '  P.NOME, '                                                + #13 +
//      '  H.HMEVLRPREVISTO, '                                      + #13 +
//      '  H.HMEVLREFETIVO, '                                       + #13 +
//      '  HMETXJUROS, '                                            + #13 +
//      '  CODDOCUMENTO, '                                          + #13 +
//      '  IDRUBRICA, '                                             + #13 +
//      '  H.HMEDATAPREVISTA, '                                     + #13 +
//      '  H.HMEDATAEFETIVA, '                                      + #13 +
//      '  H.HMEDATAVENCTO, '                                       + #13 +
//      '  H.HMEANOCOMPETENCIA AS ANOCOMP, '                        + #13 +
//      '  H.HMEMESCOMPETENCIA AS MESCOMP, '                        + #13 +
//      '  H.HMEANOCOBRANCA AS ANOCOBR, '                           + #13 +
//      '  H.HMEMESCOBRANCA AS MESCOBR, '                           + #13 +
//
//      '  (TO_CHAR(NVL(H.HMEPARCELAALT, H.HMEPARCELA), ''00'') || ''/'' || TO_CHAR(H.HMENUMPARCELAS, ''00'')) AS HMEPARCELA, '  + #13 +
//
//      '  H.HMESEQCOBRANCA, '                                      + #13 +
//      '  H.HMESALDODEV, '                                         + #13 +
//      '  (PL.PLNCODIGO||''/''||PL.PLNPLANIL) AS PLNPLANIL, '      + #13 +
//      '  PL.PLNDATDIA, '                                          + #13 +
//      '  TC.TCEDESCRICAO, '                                       + #13 +
//      '  H.HMETIPOMOV AS TIPOMOV, '                               + #13 +
//      '  IC.ITCSEQCALCULO, '                                      + #13 +
//      '  DECODE(C.FLGFORMAPAG, '                                  + #13 +
//      '         ''F'', ''Folha de Pagamento'', '                  + #13 +
//      '                ''Banco'') AS FLGFORMAPAG, '               + #13 +
//
//      Renato Visoni SOL 124654 Kintana 746350
//      '  DECODE(NVL(H.FLGSUSPENSAO, 0), 1, ''Suspensa'', '' '') AS SUSPENSAO, '  + #13 +
//
//      ' DECODE(NVL(H.FLGSUSPENSAO, 0), '                                         + #13 +
//      '    1,                          '                                         + #13 +
//      '    ''Suspensa'',           '                                         + #13 +
//      '    DECODE(NVL(H.FLGABONADO, 0),'                                         + #13 +
//      '           1,                   '                                         + #13 +
//      '           ''Abonado'',         '                                         + #13 +
//      '           DECODE(NVL(H.FLGQUITADO, 0), 1, ''Quitado''))) AS SUSPENSAO, ' + #13 +
//      Renato Visoni SOL 124654 Kintana 746350
//
//      '  DECODE(H.HMETIPOMOV, '                                   + #13 +
//      '         0, ''Concessão/Renovação'', '                     + #13 +
//      '         1, ''Prestação '', '                              + #13 +
//      '         2, ''Amortização/Refinanciamento'', '             + #13 +
//      '         3, ''Quitação'', '                                + #13 +
//      '         4, ''Atualização de Débito'', '                   + #13 +
//      '         5, ''Atualização de Saldo (Diária)'' , '          + #13 +
//      '         6, ''Importação/Migração'', '                     + #13 +
//      '         7, ''Ajustes (Cobrança/Devolução)'', '            + #13 +
//      '         8, ''Ajustes (Saldo Devedor)'' '                  + #13 +
//      '        ) AS EVENTO, '                                     + #13 +
//
//      '  TO_CHAR(H.HMEMESCOMPETENCIA, ''00'') || ''/'' || TO_CHAR(H.HMEANOCOMPETENCIA,''0000'') AS ANOMESCOMP, ' + #13 +
//      '  TO_CHAR(H.HMEMESCOBRANCA, ''00'')    || ''/'' || TO_CHAR(H.HMEANOCOBRANCA,''0000'')    AS ANOMESCOBR, ' + #13 +
//
//      '  DECODE(H.HMETIPOMOV, '                                                                                         + #13 +
//      '         0, 0, '                                                                                                 + #13 +
//      '         5, 0, '                                                                                                 + #13 +
//      '         8, 0, '                                                                                                 + #13 +
//      '         DECODE(H.HMEVLREFETIVO, '                                                                               + #13 +
//      '                NULL, '                                                                                   + #13 +
//      '                DECODE(NVL(H.FLGQUITADO, 0), '                                                                   + #13 +
//      '                       1, 0, '                                                                                   + #13 +
//      '                       DECODE(NVL(H.FLGABONADO, 0), '                                                            + #13 +
//      '                              1, 0, '                                                                            + #13 +
//      '                              DECODE(NVL(PEP.FLGEXCEPCIONAL, 0), '                                               + #13 +
//      '                                     0, ( '                                                                      + #13 +
//      '                                        DECODE(NVL(H.HMECENTRALIZA, 0), '                                        + #13 +
//      '                                               0, 0, '                                                           + #13 +
//      '                                               DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, 0) '              + #13 +
//      '                                              ) + '                                                              + #13 +
//      '                                        DECODE(NVL(H.HMEDESTACADO, 0), '                                         + #13 +
//      '                                               0, 0, '                                                           + #13 +
//      '                                               DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, 0) '              + #13 +
//      '                                              ) '                                                                + #13 +
//      '                                        ), '                                                                     + #13 +
//      '                                     1, ( '                                                                      + #13 +
//      '                                        DECODE(NVL(H.FLGSUSPENSAO, 0), '                                         + #13 +
//      '                                               1, 0, '                                                           + #13 +
//      '                                               ( '                                                               + #13 +
//      '                                               DECODE(NVL(H.HMECENTRALIZA, 0), '                                 + #13 +
//      '                                                      0, 0, '                                                    + #13 +
//      '                                                      DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, 0)) + '    + #13 +
//      '                                               DECODE(NVL(H.HMEDESTACADO, 0), '                                  + #13 +
//      '                                                      0, 0, '                                                    + #13 +
//      '                                                      DECODE(H.HMEVLREFETIVO, NULL, H.HMEVLRPREVISTO, 0)) '      + #13 +
//      '                                               ) '                                                               + #13 +
//      '                                              ) '                                                                + #13 +
//      '                                        ) '                                                                      + #13 +
//      '                                    ) '                                                                          + #13 +
//      '                             ) '                                                                                 + #13 +
//      '                      ), '                                                                                       + #13 +
//      '                0 '                                                                                              + #13 +
//      '               ) '                                                                                               + #13 +
//      '        ) AS VLR_ABERTO '                                                                                        + #13 +
//
//      'FROM '                                                     + #13 +
//      '  PESSOA           P,   '                                  + #13 +
//      '  DEPENTIT         DEP, '                                  + #13 +
//      '  ELEGPATRO        ELP, '                                  + #13 +
//      '  PLANILHA         PL,  '                                  + #13 +
//      '  HISTMOVEMPTMOEXT H,   '                                  + #13 +
//      '  CONTRATOEMPTMO   C,   '                                  + #13 +
//      '  PARAMEMPTMO      PEP, '                                  + #13 +
//      '  ITEMXTIPOCONTR   IC,  '                                  + #13 +
//      '  TIPOCONTREMPTMO  TC,  '                                  + #13 +
//      '  ITEMEMPTMO       I    '                                  + #13 +
//
//      'WHERE '                                                    + #13 +
//
//      '      PEP.IDEMPRESAPROP = ' + FormatFloat('#0', Sistema.IDEmpresa)     + #13 +
//
//      '  AND (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, ''0000'')))) || ' +
//           ' (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, ''00'')))) >= ' + QuotedStr(sCompetenciaIni) + #13 +
//
//      '  AND (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, ''0000'')))) || ' +
//           ' (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, ''00'')))) <= ' + QuotedStr(sCompetenciaFim) + #13 +
//
//      '  AND NVL(H.FLGESTORNADO, 0) = 0 '                                        + #13 +
//
//      '  AND C.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '          + #13 +
//      '  AND C.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '          + #13;
//
//      if chkCentralizador.Checked then sSQL := sSQL +
//      '  AND ( (H.HMECENTRALIZA = 1) OR (H.HMEDESTACADO = 1) ' + ' ) '           + #13;
//
//      if chkTrataSaldo.Checked then sSQL := sSQL +
//      '  AND ( IC.ITCTRATASALDODEV <> 0 ) '                                      + #13;
//
//      if chkAtuDia.Checked then sSQL := sSQL +
//      '  AND H.HMETIPOMOV    <> 5 '                                              + #13;
//
//      if idContrato > 0 then sSQL := sSQL +
//      '  AND C.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', idContrato)             + #13;
//
//      sSQL := sSQL +
//      '  AND C.IDBENEF           = P.IDPESSOA           '         + #13 +
//      '  AND C.IDBENEF           = DEP.IDPESSOA           '       + #13 +
//      '  AND C.IDPESSOA          = DEP.IDTITULAR           '      + #13 +
//      '  AND C.IDPESSOA          = ELP.IDPESSOA           '       + #13 +
//      '  AND C.IDPATRO           = ELP.IDPESSJUR           '      + #13 +
//      '  AND C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO   '         + #13 +
//      '  AND C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO '         + #13 +
//      '  AND I.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '         + #13 +
//      '  AND H.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '         + #13 +
//      '  AND H.PLNCODIGO         = PL.PLNCODIGO(+)      '         + #13 +
//      '  AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '         + #13;
//
//      if idTipoEmprestimo <> -1 then
//      begin
//         if idTipoContrato <> -1 then
//         begin
//            sSQL := sSQL +
//      ' AND (C.IDTIPOCONTREMPTMO = ' + IntToStr(idTipoContrato)   + ')     '
//         end
//         else
//         begin
//            sSQL := sSQL +
//      ' AND (C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO)                  ' +
//      ' AND (TC.IDTIPOEMPTMO     = ' + IntToStr(idTipoEmprestimo) + ')     ' ;
//         end;
//      end;
//   end;
//
//   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL + #13 +
//     'ORDER BY '                                                                                  + #13 +
//     '  ' + sOrdenar + ', HMEDATAPREVISTA, ORDENACAO, HMEPARCELA, ITCSEQCALCULO, HMESEQCOBRANCA ' + #13
//     else sSQL := sSQL + #13 +
//     'ORDER BY '                                                                            + #13 +
//     '  ' + sOrdenar + ', H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA,                      '  + #13 +
//                       '  H.HMETIPOMOV, H.HMEPARCELA, IC.ITCSEQCALCULO, H.HMESEQCOBRANCA '  + #13;


     sSQL :=
    ' SELECT' + #13 +
    '  P.NOME,' + #13 +
    '  NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA,' + #13 +
    '  C.IDCONTRATOEMPTMO,' + #13 +
    '  C.IDTIPOCONTREMPTMO,' + #13 +
    '  TC.TCEDESCRICAO,' + #13 +
    '  CASE ' + #13 +
    '  WHEN C.IDTIPOCONTREMPTMO IN (82,83,92,93,19,20,15,12,16,13,14,11) THEN ''Não se aplica'' ' + #13 +
    '  WHEN C.IDTIPOCONTREMPTMO IN (28,81,30,90,96,97,21,17,26,85,84,94,18,10,9,8,1,6,2,3,4,5,22,24,23,6,25) THEN ''Price'' ' + #13 +
    '  WHEN C.IDTIPOCONTREMPTMO IN (89,95) THEN ''Sac'' ' + #13 +
    '  END AS SISTEMA_AMORTIZACAO,' + #13 +    //Rafael SIG 90625
    '  DECODE(H.TIPOMOV, 0, ''Concessão/Renovação'',' + #13 +
    '                    1, ''Prestação '',' + #13 +
    '                    2, ''Amortização/Refinanciamento'',' + #13 +
    '                    3, ''Quitação'',' + #13 +
    '                    4, ''Atualização de Débito'',' + #13 +
    '                    5, ''Atualização de Saldo (Diária)'' ,' + #13 +
    '                    6, ''Importação/Migração'',' + #13 +
    '                    7, ''Ajustes (Cobrança/Devolução)'',' + #13 +
    '                    8, ''Ajustes (Saldo Devedor)'') AS EVENTO,' + #13 +
    '  I.ITEDESCRICAO,' + #13 +

    // Paulo Nobre - WO29619 - Inicio
    //    '  (TO_CHAR(NVL(H.PARCELAALT, H.PARCELA), ''00'') || ''/'' || TO_CHAR(H.NUMPARCELAS, ''00'')) AS HMEPARCELA,' + #13 + 
    '  CAST((TO_CHAR(NVL(H.PARCELAALT, H.PARCELA), ''00'') || '' / '' || TO_CHAR(H.NUMPARCELAS, ''00'')) AS VARCHAR2(5)) AS HMEPARCELA, ' + #13 +
    // Paulo Nobre - WO29619 - Fim

    '  H.SEQCOBRANCA HMESEQCOBRANCA,' + #13 +
    '  H.DATAPREVISTA HMEDATAPREVISTA,' + #13 +
    '  TO_CHAR(H.DATAPREVISTA,''MM/YYYY'') ANOMESCOMP,' + #13 +
    '  TO_CHAR(H.DATAVENCTO,''MM/YYYY'') AS ANOMESCOBR,' + #13 +
    '  H.DATAVENCTO HMEDATAVENCTO,' + #13 +
    '  H.DATAEFETIVA HMEDATAEFETIVA,' + #13 +
    '  H.VLRPREVISTO HMEVLRPREVISTO,' + #13 +
    '  H.VLREFETIVO HMEVLREFETIVO,' + #13 +
    '  NVL2(H.IDTIPOSUSPEMPTMO, (SELECT TSE.TSEDESCRICAO' + #13 +
    '                           FROM TIPOSUSPEMPTMO TSE' + #13 +
    '                           WHERE H.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO),' + #13 +
    '                           DECODE(H.FLGQUITABONOESTORNO, 1, ''Quitado'',' + #13 +
    '                                                       2, ''Abonado'')) AS SUSPENSAO,' + #13 +
    ' H.SALDODEV HMESALDODEV,' + #13 +
    ' TXJUROS HMETXJUROS,' + #13 +
    ' (SELECT HEV.CODDOCUMENTO FROM HMEENVIO HEV' + #13 +
    '  WHERE HEV.IDHISTMOVEMPTMO = H.IDHISTMOVEMPTMO) CODDOCUMENTO,' + #13 +
    ' IDRUBRICA,' + #13 +
    ' (SELECT PLA.PLNCODIGO || NVL2(PLA.PLNPLANIL, ''/'' || PLA.PLNPLANIL, NULL)' + #13 +
    ' FROM HMECONTABILIZACAO HCONTAB' + #13 +
    ' INNER JOIN PLANILHA PLA ON HCONTAB.PLNCODIGO = PLA.PLNCODIGO' + #13 +
    ' WHERE HCONTAB.IDHISTMOVEMPTMO = H.IDHISTMOVEMPTMO) PLNPLANIL,' + #13 +
    ' DECODE(C.FLGFORMAPAG, ''F'', ''Folha de Pagamento'', ''Banco'') AS FLGFORMAPAG,' + #13 +
    ' DECODE(H.TIPOMOV, 0, 0,' + #13 +
    '                   5, 0,' + #13 +
    '                   8, 0,' + #13 +
    '                  DECODE(H.VLREFETIVO, NULL, DECODE(' + #13 +
    '                                                      H.FLGQUITABONOESTORNO, 1, 0,' + #13 +
    '                                                                             2, 0,' + #13 +
    '                                                                             DECODE(PEP.FLGEXCEPCIONAL, 1, 0, DECODE(H.NATUREZAITEM, 0, 0, H.VLRPREVISTO),' + #13 +
    '                                                                                                        1, NVL2(H.IDTIPOSUSPEMPTMO, DECODE(H.NATUREZAITEM, 0, 0, H.VLRPREVISTO), 0)' + #13 +
    '                                                                                    )' + #13 +
    '                                                     ),' + #13 +
    '                                              0' + #13 +
    '                          )' + #13 +
    '       ) AS VLR_ABERTO,' + #13 +
    ' IC.ITCSEQCALCULO,' + #13 +
    ' DATACREDITO,' + #13 +
    ' DECODE(H.TIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) AS ORDENACAO,' + #13 +
    ' I.IDITEMEMPTMO,' + #13 +
    ' TO_NUMBER(TO_CHAR(H.DATAPREVISTA,''YYYY'')) AS ANOCOMP,' + #13 +
    ' TO_NUMBER(TO_CHAR(H.DATAPREVISTA,''MM'')) AS MESCOMP,' + #13 +
    ' TO_NUMBER(TO_CHAR(H.DATAVENCTO,''YYYY'')) AS ANOCOBR,' + #13 +
    ' TO_NUMBER(TO_CHAR(H.DATAVENCTO,''MM'')) AS MESCOBR,' + #13 +
    ' (SELECT PLA.PLNDATDIA' + #13 +
    ' FROM HMECONTABILIZACAO HCONTAB' + #13 +
    ' INNER JOIN PLANILHA PLA ON HCONTAB.PLNCODIGO = PLA.PLNCODIGO' + #13 +
    ' WHERE HCONTAB.IDHISTMOVEMPTMO = H.IDHISTMOVEMPTMO) PLNDATDIA,' + #13 +
    ' H.TIPOMOV AS TIPOMOV' + #13 +
    ' FROM CONTRATOEMPTMO C' + #13 +
    ' INNER JOIN HMEALL H ON C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO' + #13 +
    ' INNER JOIN PESSOA P ON C.IDBENEF = P.IDPESSOA' + #13 +
    ' INNER JOIN DEPENTIT DEP ON C.IDBENEF = DEP.IDPESSOA AND' + #13 +
    '                           C.IDPESSOA = DEP.IDTITULAR' + #13 +
    ' INNER JOIN ELEGPATRO ELP ON C.IDPESSOA = ELP.IDPESSOA AND' + #13 +
    '                            C.IDPATRO = ELP.IDPESSJUR' + #13 +
    ' INNER JOIN ITEMXTIPOCONTR IC ON C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO AND' + #13 +
    '                                H.IDITEMEMPTMO      = IC.IDITEMEMPTMO' + #13 +
    ' INNER JOIN ITEMEMPTMO I ON I.IDITEMEMPTMO = IC.IDITEMEMPTMO' + #13 +
    ' INNER JOIN TIPOCONTREMPTMO TC ON C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO' + #13 +

    ' LEFT JOIN PARAMEMPTMO PEP ON PEP.IDEMPRESAPROP = ' + FormatFloat('#0', Sistema.IDEmpresa)   + #13 +

    ' WHERE H.FLGQUITABONOESTORNO < 3 ' + #13 +
    ' AND TO_CHAR(H.DATAPREVISTA,''YYYYMM'') >= ' + QuotedStr(sCompetenciaIni) + #13 +
    ' AND TO_CHAR(H.DATAPREVISTA,''YYYYMM'') <= ' + QuotedStr(sCompetenciaFim) + #13 +

    '  AND C.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '          + #13 +
    '  AND C.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '          + #13;

   if chkCentralizador.Checked then sSQL := sSQL +       // Exibir apenas itens centralizadores
   '   AND NATUREZAITEM IN (1,2)  '                + #13;
   if chkTrataSaldo.Checked then sSQL := sSQL +       //Exibir apenas itens que afetam o Saldo Devedor
   '  AND IC.ITCTRATASALDODEV <> 0  '              + #13;

   if chkAtuDia.Checked then sSQL := sSQL +        //NÃO exibir atualização diária
   '  AND H.TIPOMOV        <> 5 '           + #13;
   if idContrato > 0 then sSQL := sSQL +       //contrato selecionado
   '  AND C.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', idContrato)    + #13;

   if idTipoEmprestimo <> -1 then    //tipo de emprestimo selecionado
   begin
     if idTipoContrato <> -1 then   //tipo de contrato selecionado
     begin
        sSQL := sSQL +
        ' AND (C.IDTIPOCONTREMPTMO = ' + IntToStr(idTipoContrato)   + ')  '
     end
     else
     begin
        sSQL := sSQL +
        ' AND (TC.IDTIPOEMPTMO     = ' + IntToStr(idTipoEmprestimo) + ')  ' ;
     end;
   end;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
    sSQL := sSQL + #13 + 'ORDER BY ' + #13 +
            sOrdenar + ', HMEDATAPREVISTA, ORDENACAO, HMEPARCELA, NATUREZAITEM, ITCSEQCALCULO, HMESEQCOBRANCA ' + #13
   else
      sSQL := sSQL + #13 + 'ORDER BY ' + #13 +
            sOrdenar + ', TO_CHAR(DATAPREVISTA,''YYYYMM'') ,  '  + #13 +
                     '  TIPOMOV, HMEPARCELA, NATUREZAITEM, ITCSEQCALCULO, HMESEQCOBRANCA '  + #13;
//Término - William Santana - SOL 265007.17919 PPM 1167870

   Result := sSQL;
end;



procedure TcfgRelMovContr.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;


procedure TcfgRelMovContr.MontaQuery;
begin
   inherited;
{
   with dtmRelDividas do begin

      (* preenche a label de data de referência *)
      if length(trim(edtDataRef.Text)) > 0 then sDataRef := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;
}
   FiltraRelatorio;
end;



procedure TcfgRelMovContr.FiltraRelatorio;
{
var
   sSQL  : string;
   sData : string;
}
begin
{
   sData := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

   sSQL :=
   'SELECT '                                                                              + #13 +
   '   C.IDCONTRATOEMPTMO, '                                                              + #13 +
   '   PT.NOME, '                                                                         + #13 +
   '   EL.MATRICULA, '                                                                    + #13 +
   '   SALDO.HMEDATAATUALIZA, SALDO.HMESALDODEV, '                                        + #13 +
   '   SALDO.HMEPARCELA, SALDO.HMENUMPARCELAS, '                                          + #13 +
   '   PARC.VALOR_DEVIDO '                                                                + #13 +

   'FROM '                                                                                + #13 +
   '   PESSOA PT, '                                                                       + #13 +
   '   CONTRATOEMPTMO C, '                                                                + #13 +
   '   ELEGPATRO EL, '                                                                    + #13 +
   '   TIPOCONTREMPTMO TC, '                                                              + #13 +
   '   TIPOEMPTMO TE, '                                                                   + #13 +

   '   ( '                                                                                + #13 +
   '   SELECT '                                                                           + #13 +
   '      C.IDCONTRATOEMPTMO, '                                                           + #13 +
   '      H.HMEDATAATUALIZA, H.HMESALDODEV, H.HMEPARCELA, H.HMENUMPARCELAS '              + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, '                                            + #13 +
   '      ( '                                                                             + #13 +
   '      SELECT '                                                                        + #13 +
   '         C.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                + #13 +
   '      FROM '                                                                          + #13 +
   '         HISTMOVEMPTMO HME, '                                                         + #13 +
   '         CONTRATOEMPTMO C, '                                                          + #13 +
   '         ITEMXTIPOCONTR ITC '                                                         + #13 +
   '      WHERE '                                                                         + #13 +
   '             ( ITC.ITCTRATASALDODEV   <> 0 ) '                                        + #13 +
   '         AND ( C.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO ) '                      + #13 +
   '         AND ( C.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ) '                     + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                          + #13 +
   '         AND ( HME.HMEDATAATUALIZA    =   ( '                                         + #13 +
   '                                          SELECT '                                    + #13 +
   '                                             MAX(HMEDATAATUALIZA) '                   + #13 +
   '                                          FROM '                                      + #13 +
   '                                             HISTMOVEMPTMO HME, '                     + #13 +
   '                                             CONTRATOEMPTMO C, '                      + #13 +
   '                                             ITEMXTIPOCONTR ITC, '                    + #13 +
   '                                             TIPOCONTREMPTMO TC '                     + #13 +
   '                                          WHERE '                                                                         + #13 +
   '                                                 ( HME.HMEDATAATUALIZA  <= TO_DATE(''' + sData + ''', ''DD/MM/YYYY'') ) ' + #13 +
   '                                             AND ( ITC.ITCTRATASALDODEV <> 0 ) '                                          + #13 +
   '                                             AND ( HME.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) '                          + #13 +
   '                                             AND ( C.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                       + #13 +
   '                                             AND ( HME.IDITEMEMPTMO     = ITC.IDITEMEMPTMO ) '                            + #13 +
   '                                          ) '                                                                             + #13 +
   '              ) '                                                                     + #13 +
   '      GROUP BY '                                                                      + #13 +
   '         C.IDCONTRATOEMPTMO '                                                         + #13 +
   '      ) M '                                                                           + #13 +
   '   WHERE '                                                                            + #13 +
   '          ( C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO ) '                               + #13 +
   '      AND ( H.IDCONTRATOEMPTMO = M.IDCONTRATOEMPTMO ) '                               + #13 +
   '   ) SALDO, '                                                                         + #13 +

   '   ( '                                                                                + #13 +
   '   SELECT '                                                                           + #13 +
   '      C.IDCONTRATOEMPTMO, SUM(HMEVLRPREVISTO) AS VALOR_DEVIDO '                       + #13 +
   '   FROM '                                                                             + #13 +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C '                                             + #13 +
   '   WHERE '                                                                            + #13 +
   '          ( H.FLGBAIXADO       = 0 ) '                                                + #13 +
   '      AND ( H.HMEDATAVENCTO    <= TO_DATE(''' + sData + ''', ''DD/MM/YYYY'') ) '      + #13 +
   '      AND ( H.HMETIPOMOV       IN(1, 4) ) '                                           + #13 +
   '      AND ( (H.FLGESTORNADO    = 0) OR (H.FLGESTORNADO IS NULL) ) '                   + #13 +
   '      AND ( (H.HMECENTRALIZA   = 1) OR (H.HMEDESTACADO = 1) ) '                       + #13 +
   '      AND ( C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO ) '                               + #13 +
   '   GROUP BY '                                                                         + #13 +
   '      C.IDCONTRATOEMPTMO '                                                            + #13 +
   '   ) PARC '                                                                           + #13 +

   'WHERE '                                                                               + #13 +

   (* filtro por Empresa Proprietátia *)
   '       TE.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +

   (* filtro por Patrocinadora *)
   '   AND C.IDPATRO             IN (' + PegaPatro + ') '                                 + #13 +

   (* filtro por Plano *)
   '   AND C.IDPLANOPREV         IN (' + PegaPlano + ') '                                 + #13;

   (* filtro por Contrato *)
   if molContratoEmptmo.IDContrato > 0 then begin
      sSQL := sSQL +
   '   AND C.IDCONTRATOEMPTMO    = ' + IntToStr(molContratoEmptmo.IDContrato)             + #13;
   end;

   (* filtro por Tipo de Empréstimo *)
   if DBcboTipoEmptmo.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND TC.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                        + #13 +
   '   AND TE.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                        + #13;
   end;

   (* filtro por Tipo de Contrato *)
   if DBcboTipoContrato.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND C.IDTIPOCONTREMPTMO   = ' + DBcboTipoContrato.LookupValue                      + #13 +
   '   AND TC.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                      + #13;
   end;

   sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO  = SALDO.IDCONTRATOEMPTMO ) '                             + #13 +
   '   AND ( C.IDPESSOA          = EL.IDPESSOA ) '                                        + #13 +
   '   AND ( C.IDPATRO           = EL.IDPESSJUR ) '                                       + #13 +
   '   AND ( C.IDPESSOA          = PT.IDPESSOA ) '                                        + #13 +
   '   AND ( PT.IDPESSOA         = EL.IDPESSOA ) '                                        + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO ) '                                    + #13 +

   'ORDER BY '                                                                            + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   C.IDCONTRATOEMPTMO,'              + #13;
      1: sSQL := sSQL + '   PT.NOME, C.IDCONTRATOEMPTMO,'     + #13;
      2: sSQL := sSQL + '   EL.MATRICULA, C.IDCONTRATOEMPTMO' + #13;
   end;

   sSQL := sSQL +
   ' H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA,                      ' + #13 +
   ' H.HMETIPOMOV, H.HMEPARCELA, H.HMESEQCOBRANCA, IC.ITCSEQCALCULO ' + #13;

   with dtmRelDividas.qryDividas do begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
}
end;



procedure TcfgRelMovContr.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   chkAtuDia.Visible := dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1;
   chkAtuDia.Checked := dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche a data de lançamento e o ano de referência/competência
   cboMesIni.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   DBspnAnoIni.Value   := DiasUteis.ExtraiAno(SysDate) - 5;

   cboMesFim.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   DBspnAnoFim.Value   := DiasUteis.ExtraiAno(SysDate);

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

                                                                                

procedure TcfgRelMovContr.bbtnConfirmarClick(Sender: TObject);
var
  sSQL, sOrdena  : String;
  idTipoEmptmo, idTipoContrato : Integer;
begin
   idTipoEmptmo   := -1;
   idTipoContrato := -1;

   if Trim(DBcboTipoEmptmo.LookupValue) <> '' then
   begin
      idTipoEmptmo := dtmLookEmptmo.qryLookTipoEmptmoIDTIPOEMPTMO.AsInteger;
      if DBcboTipoContrato.LookupValue <> '' then
         idTipoContrato := dtmLookEmptmo.qryLookTipoContratoIDTIPOCONTREMPTMO.AsInteger;
   end;

   // ----------------------------------------------------------------------------------------------
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      if rgOrdenar.ItemIndex = 0 then
        sOrdena := ' IDCONTRATOEMPTMO '
      else
        sOrdena := ' NOME ' ;
   end
   else
   begin
      if rgOrdenar.ItemIndex = 0 then
        sOrdena := ' C.IDCONTRATOEMPTMO '
      else
        sOrdena := ' P.NOME ' ;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL  := MontaSelectMovContr(molContratoEmptmo.IdContrato, idTipoEmptmo, idTipoContrato,
               IntToStr(cboMesIni.ItemIndex + 1), FormatFloaT('0000',DBspnAnoIni.Value),
                  sOrdena);


   dtmRelMovContr.IdContrato     := molContratoEmptmo.IdContrato;
//   dtmRelMovContr.TipoRelatorio  := rgTipoRelatorio.Items[rgTipoRelatorio.ItemIndex];
   dtmRelMovContr.MesCompetencia := cboMesIni.Text +' / '+ DBspnAnoIni.Text;
//   dtmRelMovContr.IsCorLinha     := chkCorLinha.Checked;
//   dtmRelMovContr.CorLinha       := cboCorLinha.SelectedColor;
 
//   dtmRelMovContr.cdsMovimentoContr.Close;
   dtmRelMovContr.qryMovimentoContr.Close;
   dtmRelMovContr.qryMovimentoContr.SQL.Clear;
   dtmRelMovContr.qryMovimentoContr.SQL.Text := sSQL;
// Jéssica Lana SOL 114575 24/04/2009
// dtmRelMovContr.qryMovimentoContr.SQL.SaveToFile(Sistema.TempDir + 'EP-RelExtratoContrato.txt');
   dtmRelMovContr.qryMovimentoContr.SQL.SaveToFile(ftempregra + '\' + 'EP-RelExtratoContrato.txt');

   dtmRelMovContr.wIsCorLinha := chkCorLinha.Checked;
   dtmRelMovContr.wCorLinha   := cboCorLinha.SelectedColor;

   dtmRelMovContr.qryMovimentoContr.Open;

   inherited;
end;



procedure TcfgRelMovContr.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelMovContr.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelMovContr.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelMovContr.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelMovContr.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelMovContr.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
