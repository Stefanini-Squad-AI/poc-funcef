unit CRelItensDiverg;

// Alterações:
{   --------------------------------------------------------------------------------------------------
Rotina      : FiltraRelatorio
Pendência   : SIG131775            
Responsável : Leandro
Data        : 02/08/2023
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO->HEMORIGEM = 11
--------------------------------------------------------------------------------------------------
}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, CheckLst, fcCombo, fcColorCombo, Mask, wwdbedit,
   Wwdbspin, wwdblook, Db, DBTables, mListaPlano, mListaPatro,
   wwdbdatetimepicker, CMDateTimePicker;

type
   TcfgRelItensDiverg = class(TcfgRel)
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      molContratoEmptmo: TmolContratoEmptmo;
      GroupBox3: TGroupBox;
      chkRecebInesperado: TCheckBox;
      chkRecebidoMenor: TCheckBox;
      chkRecebidoMaior: TCheckBox;
      chkDivergData: TCheckBox;
      chkValorEmAberto: TCheckBox;
      chkNaoSeraoPagos: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      function  MontaDiverg: String;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public { Public declarations }

   end;



var
  cfgRelItensDiverg: TcfgRelItensDiverg;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UFuncoesEmptmo,
   UDiasUteis,
   USistema,
   uMensErro,
   dRelItensDiverg;




procedure TcfgRelItensDiverg.AbreQueries;
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



procedure TcfgRelItensDiverg.FormShow(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContrato.Click;

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



function TcfgRelItensDiverg.MontaDiverg: String;
begin
   Result := '0';

   if chkValorEmAberto.Checked then    Result := Result + ', 1';
   if chkRecebInesperado.Checked then  Result := Result + ', 2';
   if chkRecebidoMenor.Checked then    Result := Result + ', 3';
   if chkRecebidoMaior.Checked then    Result := Result + ', 4';
   if chkDivergData.Checked then       Result := Result + ', 5';
   if chkNaoSeraoPagos.Checked then    Result := Result + ', 6';
end;



procedure TcfgRelItensDiverg.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IdEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelItensDiverg.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IdEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelItensDiverg.MontaQuery;
begin
   inherited;

   with dtmRelItensDiverg do
   begin
      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      // Início Pendência 21063 - Marcos Ventura Topini
      // -------------------------------------------------------------------------------------------

        lblTipoEmptmo.Caption := ' < todos > ';
        if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

        lblTipoContr.Caption  := ' < todos > ';
        if DBcboTipoContrato.LookupValue <> '' then lblTipoContr.Caption  := DBcboTipoContrato.Text;

        memPatro.RichText := molListaPatro.ListaPatro;
        memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------
      // Fim Pendência 21063

   end;

   FiltraRelatorio;
end;


procedure TcfgRelItensDiverg.FiltraRelatorio;
var
   sSQL : string;
begin
   sSQL :=
   'SELECT  '                                                                                + #13 +
   '  DEP.MATRICULA, '                                                                       + #13 +
   '  CON.IDCONTRATOEMPTMO, '                                                                + #13 +
   '  PPP.INSCRICAONUMERO, '                                                                 + #13 +
   '  MUT.NOME, '                                                                            + #13 +

   '  HME.HMEPARCELA, '                                                                      + #13 +
   '  HME.HMENUMPARCELAS, '                                                                  + #13 +

   '  (HME.HMEMESCOMPETENCIA || ''/'' || HME.HMEANOCOMPETENCIA) AS COMPETENCIA, '            + #13 +
   '  (HME.HMEMESCOBRANCA || ''/'' || HME.HMEANOCOBRANCA) AS COBRANCA, '                     + #13 +

   '  HME.HMEVLRPREVISTO, '                                                                  + #13 +
   '  HME.HMEVLREFETIVO, '                                                                   + #13 +
   '  HME.HMEDATAPREVISTA, '                                                                 + #13 +
   '  HME.HMEDATAVENCTO, '                                                                   + #13 +
   '  HME.HMEDATAEFETIVA, '                                                                  + #13 +

   '  DECODE(HME.HMETIPOMOV, '                                                               + #13 +
   '         0, ''Concessão/Renovação'', '                                                   + #13 +
   '         1, ''Prestação '', '                                                            + #13 +
   '         2, ''Amortização/Refinanciamento'', '                                           + #13 +
   '         3, DECODE(HME.HMEORIGEM, 8, ''Quitação por Falecimento'', ''Quitação''), '      + #13 +
   '         4, ''Atualização de Débito'', '                                                 + #13 +
   '         5, ''Atualização de Saldo (Diária)'' , '                                        + #13 +
   '         6, ''Importação/Migração'', '                                                   + #13 +
   '         7, ''Ajustes (Cobrança/Devolução)'', '                                          + #13 +
   '         8, ''Ajustes (Saldo Devedor)'' '                                                + #13 +
   '        ) AS DESC_EVENTO, '                                                                   + #13 +

   '  DECODE(HME.HMEORIGEM, '                                                                + #13 +
   '          0, ''Concessão/Renovação'', '                                                  + #13 +
   '          1, ''Geração de Parcelas'', '                                                  + #13 +
   '          2, ''Amortização/Refinanciamento'', '                                          + #13 +
   '          3, ''Quitação Antecipada'', '                                                  + #13 +
   '          4, ''Tratamento de Divergências'', '                                           + #13 +
   '          5, ''Atualização de Saldo (Diária)'', '                                        + #13 +
   '          6, ''Recálculo Diário'', '                                                     + #13 +
   '          7, ''Tratamento Individual'', '                                                + #13 +
   '          8, ''Quitação por Morte/Invalidez'', '                                         + #13 +
   '          9, ''Importação/Migração'', '                                                  + #13 +
   '         10, ''Quitação por Resgate'', '                                                 + #13 +
   //'         11, ''Recebimento'', '                                                          + #13 +           //LEANDRO SIG131775
   '         11, DECODE(TMP_ORI.PRESTPARCIAL,''1'', ''Prestação Parcial'', NULL , ''Recebimento''), ' + #13 +    //LEANDRO SIG131775
   '         12, ''Entrada Manual'', '                                                       + #13 +
   '         13, ''Alteração de Concessão'', '                                               + #13 +
   '         14, ''Tratamento de Valores Não Programados'', '                                + #13 +
   '         15, ''Consulta de Contratos'', '                                                + #13 +
   '         16, ''Cancelamento de Concessão'', '                                            + #13 +
   '         17, ''Alteração Contratual'', '                                                 + #13 +
   '         18, ''Liberação de Concessão'', '                                               + #13 +
   '         19, ''Envio'', '                                                                + #13 +
   '         20, ''Tratamento de Itens não Recebidos'', '                                    + #13 +
   '         41, ''Contabilização em Lote de Concessão'', '                                  + #13 +
   '         42, ''Contabilização em Lote de Prestação'', '                                  + #13 +
   '         43, ''Contabilização em Lote de Amortização'', '                                + #13 +
   '         44, ''Contabilização em Lote de Quitação'', '                                   + #13 +
   '         45, ''Contabilização em Lote de Encargos'', '                                   + #13 +
   '         46, ''Contabilização em Lote de Atualização Diária'', '                         + #13 +
   '         47, ''Contabilização em Lote de Ajustes'', '                                    + #13 +
   '         51, ''Desfazer Geração de Parcelas'', '                                         + #13 +
   '         52, ''Cancelamento de Amortização'', '                                          + #13 +
   '         53, ''Cancelamento de Quitação'', '                                             + #13 +
   '         61, ''Desfazer Envio'', '                                                       + #13 +
   '         62, ''Desfazer Recebimento'', '                                                 + #13 +
   '         63, ''Desfazer Envio de Concessão em Lote'', '                                  + #13 +
   '         71, ''Desfazer Contabilização em Lote de Concessão'', '                         + #13 +
   '         72, ''Desfazer Contabilização em Lote de Prestação'', '                         + #13 +
   '         73, ''Desfazer Contabilização em Lote de Amortização'', '                       + #13 +
   '         74, ''Desfazer Contabilização em Lote de Quitação'', '                          + #13 +
   '         75, ''Desfazer Contabilização em Lote de Encargos'', '                          + #13 +
   '         76, ''Desfazer Contabilização em Lote de Atualização Diária'', '                + #13 +
   '         77, ''Desfazer Contabilização em Lote de Ajustes'' '                            + #13 +
   '        ) AS ORIGEM, '                                                                   + #13 +

   '  ITE.ITEDESCRICAO, '                                                                    + #13 +

   '   DECODE(CON.FLGSITUACAO, ''A'', ''Ativo'', '                                           + #13 +
   '                           ''C'', ''Cancelado'', '                                       + #13 +
   '                           ''E'', ''Encerrado'', '                                       + #13 +
   '                           ''Q'', ''Quitado'', '                                         + #13 +
   '                           ''R'', ''Refinanciado'', '                                    + #13 +
   '                           ''S'', ''Suspenso'', '                                        + #13 +
   '                           ''K'', ''Em Quitação'') AS DESCSITCONTRATO, '                 + #13 +

   '  DECODE(NVL(HME.FLGTIPODIVERG, 0), 0, '' '', '                                          + #13 +
   '                                    1, ''Valores ainda não recebidos'', '                + #13 +
   '                                    2, ''Recebimentos Inesperados'', '                   + #13 +
   '                                    3, ''Valores recebidos a menor'', '                  + #13 +
   '                                    4, ''Valores recebidos a maior'', '                  + #13 +
   '                                    5, ''Divergência de datas'', '                       + #13 +
   '                                    6, ''Valores não recebidos'') AS TIPO_DIVERG '       + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CON, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TCE, '                                                                 + #13 +
   '  TIPOEMPTMO      TEP, '                                                                 + #13 +
   '  ITEMEMPTMO      ITE, '                                                                 + #13 +
   '  PARTPREVPLAN    PPP, '                                                                 + #13 +
   '  DEPENTIT        DEP, '                                                                 + #13 +
   '  PESSOA          MUT, '                                                                  + #13 +

   // Pendência 23260 - Marcos Topini
   '  VWMIGRACONTRATOEP MIG, '                                                               + #13 +
   //Fim Pendência 23260

   //LEANDRO SIG131775 INICIO
   '     (SELECT ''1'' AS PRESTPARCIAL , TMP.*   '                                                   + #13 +
   '                             FROM TMPDESC TMP    '                                             + #13 +
   '                             WHERE ((TMP.VALORRECEBIDO > 0 AND TMP.VALORRECEBIDO < VALOR)  '   + #13 +
   '                             AND  TMP.DATARECEBIMENTO IS NOT NULL)) as TMP_ORI'                + #13 +
   //LEANDRO SIG131775 FIM

   'WHERE '                                                                                  + #13 +
   '      TEP.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +
   '  AND HME.HMETIPOMOV        <> 0 '                                                       + #13 +

   '  AND HME.FLGDIVERGPEND      = 1 '                                                       + #13 +
   '  AND HME.FLGTIPODIVERG      IN ( ' + MontaDiverg + ' ) '                                + #13 +

   '  AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 ) '                             + #13 +

   '  AND ( HME.FLGESTORNADO     = 0 OR HME.FLGESTORNADO IS NULL ) '                         + #13 +
   '  AND ( HME.FLGABONADO       = 0 OR HME.FLGABONADO   IS NULL ) '                         + #13 +
   '  AND ( HME.FLGQUITADO       = 0 OR HME.FLGQUITADO   IS NULL ) '                         + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '  AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND TCEIDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                         + #13;

   sSQL := sSQL +
   '      AND MIG.IDPATROATU         IN (' + molListaPatro.PegaPatro + ') '                  + #13 +
   '      AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '                  + #13 +

   '  AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                    + #13 +

   '  AND CON.FLGSITUACAO         <> ''C'' '                                                 + #13 +
   '  AND PPP.FLGDESATIVADO        = 0 '                                                     + #13 +

   '  AND CON.IDBENEF              = MUT.IDPESSOA '                                          + #13 +
   '  AND CON.IDBENEF              = DEP.IDPESSOA '                                          + #13 +
   '  AND CON.IDPESSOA             = DEP.IDTITULAR '                                         + #13 +
   '  AND CON.IDPESSOA             = PPP.IDPESSOA '                                          + #13 +
   '  AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '  AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                      + #13 +
   '  AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO '                                      + #13 +

   // Pendência 23260 - Marcos Topini
   '  AND MIG.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO '                              + #13 +
   '  AND MIG.DATAMIGRA                = (SELECT MAX(DATAMIGRA) '                            + #13 +
   '                                        FROM VWMIGRACONTRATOEP '                         + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '   + #13 +
   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA)'    + #13 +
   // Fim Pendência 23260

   '   AND (HME.idcontratoemptmo = TMP_ORI.IDDESCONTO(+) AND HME.HMEPARCELAALT    = TMP_ORI.PARCELA(+) ) ' + #13 +  // LEANDRO SIG131775

   'ORDER BY '                                                                               + #13 +
   '  MUT.NOME, CON.IDCONTRATOEMPTMO, HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, '        + #13 +
   '  HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA ';

   with dtmRelItensDiverg.qryItensDiverg do
   begin
      Close;
      SQL.Text := sSQL;
      Open;

      if isEmpty then
      begin
         MsgDlg('Não há itens divergentes com os critérios selecionados.',
                'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
      end;

   end;
end;


procedure TcfgRelItensDiverg.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;


procedure TcfgRelItensDiverg.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensDiverg.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensDiverg.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelItensDiverg.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelItensDiverg.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



end.
