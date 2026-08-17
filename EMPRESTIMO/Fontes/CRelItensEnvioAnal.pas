{---------------------------Alteração-------------------------------------------
Rotina      : FiltraRelatorio
Pendência   : SIG131775
Responsável : Leandro                
Data        : 02/08/2023
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO->HEMORIGEM = 11
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelItensEnvioAnal;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

   uTypesEmptmo, mMutuario, mListaPlano, mListaPatro;

type
   TcfgRelItensEnvioAnal = class(TcfgRel)
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      rdgOrdenar: TRadioGroup;
      chkValorZero: TCheckBox;
      chkValorDiverg: TCheckBox;
      molMutuario: TmolMutuario;
      chkValorNAOZero: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      chkQuitaAmortiza: TCheckBox;
      chkSintetico: TCheckBox;
      Label4: TLabel;
      DBcboSitPart: TwwDBLookupCombo;
    chkSuspensao: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molMutuario1btnBuscaPartClick(Sender: TObject);
      procedure molMutuariobtnLimpaPartClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure DBcboTipoEmptmoExit(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
  cfgRelItensEnvioAnal: TcfgRelItensEnvioAnal;




implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   FProgresso,     (* FrmProgresso *)
   uMensErro, dRelItensEnvioAnal;




procedure TcfgRelItensEnvioAnal.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   // SitPart
   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;
end;




procedure TcfgRelItensEnvioAnal.MontaQuery;
begin
   inherited;

   with dtmRelItensEnvioAnal do
   begin
      sMesCobranca   := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha      := chkCorLinha.Checked;
      CorLinha       := cboCorLinha.SelectedColor;

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

      dtmRelItensEnviolAnal_lblSitPart.Caption := '< Todas >';
      if DBcboSitPart.LookupValue <> '' then
      begin
         dtmRelItensEnviolAnal_lblSitPart.Caption := DBcboSitPart.Text;
      end;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelItensEnvioAnal.FiltraRelatorio;
var
   sSQL        : String;
   sAno, sMes  : String;
   sOrdenacao  : String;
   sTipoFolha  : String;
begin
   sAno  := FormatFloat('0000', DBspnAno.Value);
   sMes  := FormatFloat('00', cboMes.ItemIndex + 1);

   // ----------------------------------------------------------------------------------------------
   //    Filtro por forma de cobranca / tipo de folha
   // ----------------------------------------------------------------------------------------------

   // Tipo Folha
   sTipoFolha := '';

   if chkFolhaBenef.Checked then sTipoFolha := '(''B'')';

   if chkFolhaPatro.Checked then
   begin
      if sTipoFolha = '' then
      begin
         sTipoFolha := '(''P'')';
      end
      else
      begin
         sTipoFolha := '(''B'', ''P'')';
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   //    FIM Filtro por forma de cobranca / tipo de folha
   // ----------------------------------------------------------------------------------------------

   case rdgOrdenar.ItemIndex of
      0 : sOrdenacao := '   PTR.NOME, CON.IDCONTRATOEMPTMO';
      1 : sOrdenacao := '   PTR.NOME, NVL(DEP.MATRICULA, ELP.MATRICULA), CON.IDCONTRATOEMPTMO';
      2 : sOrdenacao := '   PTR.NOME, MUT.NOME, CON.IDCONTRATOEMPTMO';
   end;


   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +

   '   CON.IDPATRO, PTR.NOME AS PATRO, '                                                     + #13 +
   '   CON.IDPLANOPREV,  '                                                                   + #13 +

   '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '                                     + #13 +
   '   PPP.INSCRICAONUMERO, MUT.NOME, '                                                      + #13 +

   '   TCE.TCEDESCRICAO, '                                                                   + #13 +

   '   ITE.ITEDESCRICAO, '                                                                   + #13 +
   '   HME.HMEPARCELA, '                                                                     + #13 +
   '   HME.HMENUMPARCELAS, '                                                                 + #13 +

   '   DECODE(HME.HMETIPOMOV, '                                                              + #13 +
   '          0, ''Concessão/Renovação'', '                                                  + #13 +
   '          1, ''Prestação '', '                                                           + #13 +
   '          2, ''Amortização/Refinanciamento'', '                                          + #13 +
   '          3, ''Quitação'', '                                                             + #13 +
   '          4, ''Atualização de Débito'', '                                                + #13 +
   '          5, ''Atualização de Saldo (Diária)'' , '                                       + #13 +
   '          6, ''Importação/Migração'', '                                                  + #13 +
   '          7, ''Ajustes (Cobrança/Devolução)'', '                                         + #13 +
   '          8, ''Ajustes (Saldo Devedor)'' '                                               + #13 +
   '         ) AS DESC_EVENTO, '                                                             + #13 +

   '   DECODE(HME.HMEORIGEM, '                                                               + #13 +
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
   //'         11, ''Recebimento'', '                                                          + #13 +            //LEANDRO SIG131775
   '          11, DECODE(TMP_ORI.PRESTPARCIAL,''1'', ''Prestação Parcial'', NULL , ''Recebimento''), ' + #13 +    //LEANDRO SIG131775
   '         12, ''Entrada Manual'', '                                                       + #13 +
   '         13, ''Alteração de Concessão'', '                                               + #13 +
   '         14, ''Tratamento de Valores Não Programados'', '                                + #13 +
   '         15, ''Consulta de Contratos'', '                                                + #13 +
   '         16, ''Cancelamento de Concessão'', '                                            + #13 +
   '         17, ''Alteração Contratual'', '                                                 + #13 +
   '         18, ''Liberação de Concessão'', '                                               + #13 +
   '         19, ''Envio'', '                                                                + #13 +
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
   '         62, ''Desfazer Recebimento'' '                                                  + #13 +
   '         ) AS ORIGEM, '                                                                  + #13 +

   '   HME.IDTMPDESC, '                                                                      + #13 +

   '   DECODE(HME.HMEFORMACOBRANCA, ''C'', 0, '                                              + #13 +
   '      DECODE(HME.HMETIPOFOLHA, ''P'', 0, '                                               + #13 +
   '         DECODE(HME.FLGENVIO, 0, 0, HME.HMEVLRPREVISTO)))           AS VLR_PREV_BENEF, ' + #13 +

   '   DECODE(HME.HMEFORMACOBRANCA, ''C'', 0, '                                              + #13 +
   '      DECODE(HME.HMETIPOFOLHA, ''B'', 0, '                                               + #13 +
   '         DECODE(HME.FLGENVIO, 0, 0, HME.HMEVLRPREVISTO)))           AS VLR_PREV_PATRO, ' + #13 +

   '   DECODE(HME.HMEFORMACOBRANCA, ''F'', 0, '                                              + #13 +
   '      DECODE(HME.FLGENVIO, 0, 0, HME.HMEVLRPREVISTO))               AS VLR_PREV_FIN, '   + #13 +

   '   DECODE(HME.HMEFORMACOBRANCA, ''C'', 0, '                                              + #13 +
   '      DECODE(HME.HMETIPOFOLHA, ''P'', 0, '                                               + #13 +
   '                                      NVL(HME.HMEVLREFETIVO, 0)))   AS VLR_EFET_BENEF, ' + #13 +

   '   DECODE(HME.HMEFORMACOBRANCA, ''C'', 0, '                                              + #13 +
   '      DECODE(HME.HMETIPOFOLHA, ''B'', 0, '                                               + #13 +
   '                                      NVL(HME.HMEVLREFETIVO, 0)))   AS VLR_EFET_PATRO, ' + #13 +

   '   DECODE(HME.HMEFORMACOBRANCA, ''F'', 0, '                                              + #13 +
   '                                       NVL(HME.HMEVLREFETIVO, 0))   AS VLR_EFET_FIN '    + #13 +

   'FROM '                                                                                   + #13 +
   '   PESSOA           PTR, '                                                               + #13 +
   '   PESSOA           MUT, '                                                               + #13 +
   '   CONTRATOEMPTMO   CON, '                                                               + #13 +
   '   ELEGPATRO        ELP, '                                                               + #13 +
   '   DEPENTIT         DEP, '                                                               + #13 +
   '   PARTPREVPLAN     PPP, '                                                               + #13 +
   '   HISTMOVEMPTMO    HME, '                                                               + #13 +
   '   ITEMEMPTMO       ITE, '                                                               + #13 +
   '   TIPOCONTREMPTMO  TCE, '                                                               + #13 +
   '   TIPOEMPTMO       TEP, '                                                               + #13 +

   // Pendência 23260 - Marcos Topini em 14/11/2006
   '   VWMIGRACONTRATOEP MIG, '                                                              + #13 +

   //LEANDRO SIG131775 INICIO
   '     (SELECT ''1'' AS PRESTPARCIAL , TMP.*   '                                                   + #13 +
   '                             FROM TMPDESC TMP    '                                             + #13 +
   '                             WHERE ((TMP.VALORRECEBIDO > 0 AND TMP.VALORRECEBIDO < VALOR)  '   + #13 +
   '                             AND  TMP.DATARECEBIMENTO IS NOT NULL)) as TMP_ORI'                + #13 +
   //LEANDRO SIG131775 FIM


   'WHERE '                                                                                  + #13 +

   // ----------------------------------------------------------------------------------------------

   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP           = ' + IntToStr(Sistema.IDEmpresa)                     + #13;

   // filtro por Contrato
   if molMutuario.IDBenef > 0 then sSQL := sSQL +
   '   AND CON.IDPESSOA                = ' + IntToStr(molMutuario.IDTitular)                 + #13 +
   '   AND CON.IDBENEF                 = ' + IntToStr(molMutuario.IDBenef)                   + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                     + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO       = ' + DBcboTipoContrato.LookupValue                   + #13;

   // filtro por SitPart
   //Pendência 27333 - 30/01/2008
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND PPP.IDSITPART               = ' + DBcboSitPart.LookupValue                        + #13;
   //Fim Pendência 27333

   // filtro por Patrocinadora / Plano
   sSQL := sSQL +
   '   AND ( MIG.IDPATROATU            IN (' + molListaPatro.PegaPatro + ') '                +
        ' OR ELP.IDPESSJURCEDIDO       IN (' + molListaPatro.PegaPatro + ') ) '              + #13 +

   '   AND MIG.IDPLANOCONTATU          IN (' + molListaPlano.PegaPlano + ') '                + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND HME.HMEANOCOBRANCA          = ' + sAno                                            + #13 +
   '   AND HME.HMEMESCOBRANCA          = ' + sMes                                            + #13 +
   '   AND HME.HMETIPOMOV              NOT IN (5, 8) '                                       + #13 +
   '   AND ( HME.HMECENTRALIZA         = 1 OR HME.HMEDESTACADO = 1 ) '                       + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0)    = 0 '                                                 + #13 +
   '   AND HME.HMEFORMACOBRANCA        = ''F'' '                                             + #13;

   if chkQuitaAmortiza.Checked then sSQL := sSQL +
   '   AND HME.HMETIPOMOV              NOT IN (2, 3) '                                       + #13;

   if chkSuspensao.Checked then sSQL := sSQL +
   '   AND NVL(HME.FLGSUSPENSAO, 0)    = 0 '                                                 + #13;

   if trim(sTipoFolha) <> '' then sSQL := sSQL +
   '   AND HME.HMETIPOFOLHA            IN ' + sTipoFolha                                     + #13;

   if chkValorZero.Checked then sSQL := sSQL +
   '   AND NVL(HME.HMEVLREFETIVO, 0)   = 0 '                                                 + #13;

   if chkValorDiverg.Checked then sSQL := sSQL +
   '   AND NVL(HME.HMEVLREFETIVO, 0)   <> NVL(HME.HMEVLRPREVISTO, 0) '                       + #13;

   if chkValorNAOZero.Checked then sSQL := sSQL +
   '   AND NVL(HME.HMEVLREFETIVO, 0)   <> 0 '                                                + #13;

   sSQL := sSQL +
   '   AND PTR.IDPESSOA          = NVL(ELP.IDPESSJURCEDIDO, CON.IDPATRO) '                   + #13 +
   '   AND CON.IDBENEF           = MUT.IDPESSOA '                                            + #13 +
   '   AND CON.IDPESSOA          = ELP.IDPESSOA '                                            + #13 +
   '   AND CON.IDPESSOA          = PPP.IDPESSOA '                                            + #13 +
   '   AND CON.IDPATRO           = PPP.IDPESSJUR '                                           + #13 +
   '   AND CON.IDPATRO           = ELP.IDPESSJUR '                                           + #13 +
   '   AND CON.IDBENEF           = DEP.IDPESSOA '                                            + #13 +
   '   AND CON.IDPESSOA          = DEP.IDTITULAR '                                           + #13 +
   '   AND CON.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO '                                    + #13 +
   '   AND HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO '                                        + #13 +
   '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
   '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                        + #13 +

   '   AND PPP.FLGDESATIVADO     = 0 '                                                       + #13 +

   // Pendência 23260 - Marcos Topini
   '  AND MIG.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO '                              + #13 +
   '  AND MIG.DATAMIGRA                = (SELECT MAX(DATAMIGRA) '                            + #13 +
   '                                        FROM VWMIGRACONTRATOEP '                         + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '   + #13 +
   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '   + #13 +

   '   AND (HME.idcontratoemptmo = TMP_ORI.IDDESCONTO(+) AND HME.HMEPARCELAALT    = TMP_ORI.PARCELA(+) ) ' + #13 +  // LEANDRO SIG131775

   'ORDER BY ' + #13 + sOrdenacao;

   with dtmRelItensEnvioAnal.qryItensEnvioAnal do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelItensEnvRecebFolhaAnal.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelItensEnvRecebFolhaAnal.txt');
      Open;
   end;
end;



procedure TcfgRelItensEnvioAnal.FormShow(Sender: TObject);
begin
   inherited;

   molMutuario.btnLimpaPartClick(self);

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



procedure TcfgRelItensEnvioAnal.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelItensEnvioAnal.molMutuario1btnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TcfgRelItensEnvioAnal.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnLimpaPartClick(Sender);
end;



procedure TcfgRelItensEnvioAnal.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensEnvioAnal.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensEnvioAnal.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensEnvioAnal.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelItensEnvioAnal.DBcboTipoEmptmoExit(Sender: TObject);
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



end.
