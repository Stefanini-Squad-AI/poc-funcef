{---------------------------Alteração-------------------------------------------
Rotina      : FiltraRelatorio
Pendência   : SIG131775
Responsável : Leandro               
Data        : 02/08/2023
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO->HEMORIGEM = 11
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit cRelItensGeradosAnal;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, ExtCtrls, wwdblook, IvDictio, IvMulti,
   IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Mask, wwdbedit, db,
   Wwdbspin, mListaPlano, mListaPatro, wwdbdatetimepicker,
   mListaPlanoContab;

type
   TcfgRelItensGeradosAnal = class(TcfgRel)
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
      cboEvento: TComboBox;
      Label7: TLabel;
      btnLimpaContrato: TBitBtn;
      molListaPlano: TmolListaPlanoContab;
      chkPrestacaoSuspensa: TCheckBox;
      Label8: TLabel;

      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnLimpaContratoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
   cfgRelItensGeradosAnal: TcfgRelItensGeradosAnal;



implementation
{$R *.DFM}
uses
   DLookEmptmo, USistema, UFuncoesEmptmo, dEmptmo, uMensErro, uDiasUteis, dRelItensGeradosAnal;



procedure TcfgRelItensGeradosAnal.AbreQueries;
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




procedure TcfgRelItensGeradosAnal.MontaQuery;
begin
   inherited;

   with dtmRelItensGeradosAnal do
   begin
      bSeparador  := chkLinhas.Checked;

      rptItensGeradosAnal_lblEvento.Caption  := '';
      if cboEvento.ItemIndex > -1 then rptItensGeradosAnal_lblEvento.Caption  := cboEvento.Text;

      rptItensGeradosAnal_lblPeriodo.Caption := '';
      if ( length(trim(edtDataIni.Text)) > 0 ) or ( length(trim(edtDataFim.Text)) > 0 ) then
      begin
         rptItensGeradosAnal_lblPeriodo.Caption := 'de ' + edtDataIni.Text + '  até ' + edtDataFim.Text;
      end;

      rptItensGeradosAnal_lblCompetencia.Caption := '';
      if chkCompetencia.Checked then rptItensGeradosAnal_lblCompetencia.Caption := cboMes.Text + ' / ' + FormatFloat('0000', DBspnAno.Value);

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



procedure TcfgRelItensGeradosAnal.FiltraRelatorio;
var
   sSQL  : string;
begin
   sSQL :=
   'SELECT '                                                                              + #13 +
   '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, '                                       + #13 +
   '   HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, '                                              + #13 +

   '   HME.HMEPARCELA AS PARCELA, HME.HMENUMPARCELAS AS PARCELAS_RESTANTES, '             + #13 +

   '   HME.HMETIPOMOV AS EVENTO, HME.HMEORIGEM, '                                         + #13 +

   '   DECODE(HME.HMETIPOMOV, '                                                           + #13 +
   '          0, DECODE(HME.HMEORIGEM,  0, ''Concessão/Renovação'', '                     + #13 +
   '                                   13, ''Concessão (Acerto)'' '                       + #13 +
   '                   ), '                                                               + #13 +
   '          1, ''Prestação '', '                                                        + #13 +
   '          2, ''Amortização/Refinanciamento'', '                                       + #13 +
   '          3, DECODE(HME.HMEORIGEM, 8, ''Quitação por Falecimento'', '                 + #13 +
   '                                   0, ''Quitação (Renovação)'', '                     + #13 +
   '                                  10, ''Quitação (Resgate)'', '                       + #13 +
   '                                      ''Quitação'' '                                  + #13 +
   '                   ), '                                                               + #13 +
   '          4, ''Atualização de Débito'', '                                             + #13 +
   '          5, ''Atualização de Saldo (Diária)'' , '                                    + #13 +
   '          6, ''Importação/Migração'', '                                               + #13 +
   '          7, ''Ajustes (Cobrança/Devolução)'', '                                      + #13 +
   '          8, ''Ajustes (Saldo Devedor)'' '                                            + #13 +
   '         ) AS DESC_EVENTO, '                                                          + #13 +

   '   DECODE(HME.HMEORIGEM, '                                                            + #13 +
   '          0, ''Concessão/Renovação'', '                                               + #13 +
   '          1, ''Geração de Parcelas'', '                                               + #13 +
   '          2, ''Amortização/Refinanciamento'', '                                       + #13 +
   '          3, ''Quitação Antecipada'', '                                               + #13 +
   '          4, ''Tratamento de Divergências'', '                                        + #13 +
   '          5, ''Atualização de Saldo (Diária)'', '                                     + #13 +
   '          6, ''Recálculo Diário'', '                                                  + #13 +
   '          7, ''Tratamento Individual'', '                                             + #13 +
   '          8, ''Quitação por Morte/Invalidez'', '                                      + #13 +
   '          9, ''Importação/Migração'', '                                               + #13 +
   '         10, ''Quitação por Resgate'', '                                              + #13 +
   //'         11, ''Recebimento'', '                                                       + #13 +   //LEANDRO SIG131775
   '          11, DECODE(TMP_ORI.PRESTPARCIAL,''1'', ''Prestação Parcial'', NULL , ''Recebimento''), ' + #13 +    //LEANDRO SIG131775
   '         12, ''Entrada Manual'', '                                                    + #13 +
   '         13, ''Alteração de Concessão'', '                                            + #13 +
   '         14, ''Tratamento de Valores Não Programados'', '                             + #13 +
   '         15, ''Consulta de Contratos'', '                                             + #13 +
   '         16, ''Cancelamento de Concessão'', '                                         + #13 +
   '         17, ''Alteração Contratual'', '                                              + #13 +
   '         18, ''Liberação de Concessão'', '                                            + #13 +
   '         19, ''Envio'', '                                                             + #13 +
   '         41, ''Contabilização em Lote de Concessão'', '                               + #13 +
   '         42, ''Contabilização em Lote de Prestação'', '                               + #13 +
   '         43, ''Contabilização em Lote de Amortização'', '                             + #13 +
   '         44, ''Contabilização em Lote de Quitação'', '                                + #13 +
   '         45, ''Contabilização em Lote de Encargos'', '                                + #13 +
   '         46, ''Contabilização em Lote de Atualização Diária'', '                      + #13 +
   '         47, ''Contabilização em Lote de Ajustes'', '                                 + #13 +
   '         51, ''Desfazer Geração de Parcelas'', '                                      + #13 +
   '         52, ''Cancelamento de Amortização'', '                                       + #13 +
   '         53, ''Cancelamento de Quitação'', '                                          + #13 +
   '         61, ''Desfazer Envio'', '                                                    + #13 +
   '         62, ''Desfazer Recebimento'' '                                               + #13 +
   '         ) AS ORIGEM, '                                                               + #13 +

   '   HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA, '                                          + #13 +

   '   DECODE(HME.HMEFORMACOBRANCA, ''C'', ''Financeiro'', ''F'', ''Folha'', '''') AS FORMA_COBRANCA, '  + #13 +
   '   DECODE(HME.HMETIPOFOLHA, ''B'', ''Benefício'', ''P'', ''Patrocinadora'', '''') AS TIPO_FOLHA, '   + #13 +

   '   HME.HMEMESCOMPETENCIA, HME.HMEANOCOMPETENCIA, '                                    + #13 +
   '   HME.HMEMESCOBRANCA, HME.HMEANOCOBRANCA, '                                          + #13 +

   '   HME.HMEDATA, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                             + #13 +
   '   HME.HMEDATAEFETIVA, HME.HMEDATAATUALIZA, '                                         + #13 +

   '   DECODE(NVL(HME.FLGESTORNADO, 0), 1, 0, DECODE(HME.HMECENTRALIZA, 1, NVL(HME.HMEVLRPREVISTO, 0), DECODE(HME.HMEDESTACADO, 1, NVL(HME.HMEVLRPREVISTO, 0), 0) )) AS VALOR_CENTRALIZA, '  + #13 +
   '   DECODE(NVL(HME.FLGESTORNADO, 0), 1, 0, DECODE(HME.HMECENTRALIZA, 0, NVL(HME.HMEVLRPREVISTO, 0), 0)) AS VALOR_AGRUPADO, '                                                              + #13 +
   '   DECODE(NVL(HME.FLGESTORNADO, 0), 0, 0, NVL(HME.HMEVLRPREVISTO, 0)) AS VALOR_ESTORNADO, '                                                                                              + #13 +

   '   DECODE(NVL(HME.FLGESTORNADO, 0), 1, '                                              + #13 +
   '         0, '                                                                         + #13 +
   '         DECODE(HME.HMECENTRALIZA, 1, '                                               + #13 +
   '               0, '                                                                   + #13 +
   '               DECODE(NVL(HME.PLNCODIGO, 0), 0, '                                     + #13 +
   '                     0, '                                                             + #13 +
   '                     DECODE(HME.CCDEBFINAN, NULL, '                                   + #13 +
   '                           0, '                                                       + #13 +
   '                           DECODE(HME.CCCREDFINAN, NULL, '                            + #13 +
   '                                 0, '                                                 + #13 +
   '                                 NVL(HME.HMEVLRPREVISTO, 0) '                         + #13 +
   '                                 ) '                                                  + #13 +
   '                           ) '                                                        + #13 +
   '                     ) '                                                              + #13 +
   '               ) '                                                                    + #13 +
   '         ) AS VALOR_AGRUPADO_CONTAB, '                                                + #13 +

   '   DECODE(NVL(HME.FLGESTORNADO, 0), 0, '                                              + #13 +
   '         0, '                                                                         + #13 +
   '         DECODE(NVL(HME.PLNCODIGOESTORNO, 0), 0, '                                    + #13 +
   '               0, '                                                                   + #13 +
   '               DECODE(HME.CCDEBFINAN, NULL, '                                         + #13 +
   '                     0, '                                                             + #13 +
   '                     DECODE(HME.CCCREDFINAN, NULL, '                                  + #13 +
   '                           0, '                                                       + #13 +
   '                           NVL(HME.HMEVLRPREVISTO, 0) '                               + #13 +
   '                           ) '                                                        + #13 +
   '                     ) '                                                              + #13 +
   '               ) '                                                                    + #13 +
   '         ) AS VALOR_ESTORNADO_CONTAB, '                                               + #13 +

   '   HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, '                                           + #13 +

   '   HME.CODDOCUMENTO, HME.CODDOCUMENTORECEB, '                                         + #13 +
   '   HME.PLNCODIGO, HME.PLNCODIGOESTORNO, HME.PLNCODIGORECEB, '                         + #13 +

   '   TCE.TCEDESCRICAO, TEP.DESCTIPOEMPTMO, '                                            + #13 +

   '   PLA.PLNPLANIL AS PLANIL_APROPRIA, PLR.PLNPLANIL AS PLANIL_RECEB '                  + #13 +

   'FROM '                                                                                + #13 +
   '   HISTMOVEMPTMO     HME, '                                                           + #13 +
   '   CONTRATOEMPTMO    CON, '                                                           + #13;

   // André Pontes - 08/08/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '   TIPOSUSPEMPTMO    TSE, '                                                           + #13;

   sSQL := sSQL +
   '   ITEMEMPTMO        ITE, '                                                           + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                           + #13 +
   '   TIPOEMPTMO        TEP, '                                                           + #13 +
   '   PLANILHA          PLA, '                                                           + #13 +
   '   PLANILHA          PLR, '                                                           + #13 +

   // Pendência 23260 - Marcos Topini em 28/11/2006
   '   VWMIGRACONTRATOEP MIG,'                                                             + #13 +

   //LEANDRO SIG131775 INICIO
   '     (SELECT ''1'' AS PRESTPARCIAL , TMP.*   '                                                   + #13 +
   '                             FROM TMPDESC TMP    '                                             + #13 +
   '                             WHERE ((TMP.VALORRECEBIDO > 0 AND TMP.VALORRECEBIDO < VALOR)  '   + #13 +
   '                             AND  TMP.DATARECEBIMENTO IS NOT NULL)) as TMP_ORI'                + #13 +
   //LEANDRO SIG131775 FIM

   'WHERE '                                                                               + #13 +

   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +

   // filtro por Patrocinadora
   '   AND MIG.IDPATROATU          IN (' + molListaPatro.PegaPatro + ') '                   + #13 +

   // filtro por sequencial (só deve levar em conta o 1º gerado)
   '   AND ( '                                                                            + #13 +
   '       HME.HMESEQCOBRANCA   = 1 OR '                                                  + #13 +
   '       (HME.HMETIPOMOV      = 0 AND HME.HMEORIGEM = 13) OR '                          + #13 +
   '       HME.HMETIPOMOV       IN (7, 8) '                                               + #13 +
   '       ) '                                                                            + #13 +

   // filtro por faixa de Datas Previstas
   '   AND HME.HMEDATAPREVISTA   BETWEEN TO_DATE(''' + edtDataIni.Text + ''', ''DD/MM/YYYY'') ' +
                                   ' AND TO_DATE(''' + edtDataFim.Text + ''', ''DD/MM/YYYY'') ' + #13;

   // Pendência 23260 - Marcos Topini em 28/11/2006
   sSQL := sSQL +
      '   AND MIG.IDPLANOCONTATU      IN (' + molListaPlano.PegaPlano + ') '                + #13;


   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                        + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContr.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContr.LookupValue                         + #13;

   // filtro por Evento
   if cboEvento.ItemIndex > -1 then sSQL := sSQL +
   '   AND HME.HMETIPOMOV        = ' + IntToStr(cboEvento.ItemIndex)                      + #13;

   // filtro por Competência
   if chkCompetencia.Checked then sSQL := sSQL +
   '   AND HME.HMEANOCOMPETENCIA = ' + FormatFloat('0000', DBspnAno.Value)                + #13 +
   '   AND HME.HMEMESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1)                     + #13;

   // André Pontes - 15/06/2005
   if chkPrestacaoSuspensa.Checked then sSQL := sSQL +
   '   AND ( '                                                                            + #13 +
   '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                              + #13 +
   '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGATUALSALDOPARC, 0) = 1) '        + #13 +
   '       ) '                                                                            + #13 +
   '   AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) '                           + #13;

   sSQL := sSQL +
   '   AND HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO  '                                + #13 +
   '   AND HME.PLNCODIGO         = PLA.PLNCODIGO(+)  '                                    + #13 +
   '   AND HME.PLNCODIGORECEB    = PLR.PLNCODIGO(+)  '                                    + #13 +
   '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                + #13 +
   '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                     + #13 +
   '   AND HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO '                                     + #13 +
   '   AND MIG.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO                            '      + #13 +

   '   AND (HME.idcontratoemptmo = TMP_ORI.IDDESCONTO(+) AND HME.HMEPARCELAALT    = TMP_ORI.PARCELA(+) ) ' + #13 +  // LEANDRO SIG131775

   // Pendência 23260 - Marcos Topini em 28/11/2006
   '   AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)                          '      + #13 +
   '                                  FROM VWMIGRACONTRATOEP                       '      + #13 +
   '                                 WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '      + #13 +
   '                                   AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '      + #13 +

   'ORDER BY '                                                                            + #13 +
   '   HME.HMETIPOMOV, HME.HMEDATAPREVISTA, HME.IDCONTRATOEMPTMO, '                       + #13 +
   '   HME.HMEDESTACADO, HME.HMECENTRALIZA, HME.IDITEMEMPTMO ';

   with dtmRelItensGeradosAnal.qryItensGeradosAnal do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensGeradosAnal.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensGeradosAnal.txt');
      Open;
   end;
end;



procedure TcfgRelItensGeradosAnal.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensGeradosAnal.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensGeradosAnal.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensGeradosAnal.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelItensGeradosAnal.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   cboEvento.ItemIndex := -1;
end;



procedure TcfgRelItensGeradosAnal.FormShow(Sender: TObject);
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



procedure TcfgRelItensGeradosAnal.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelItensGeradosAnal.DBcboTipoEmptmoExit(Sender: TObject);
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
