unit cRelItensAberto;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, fcCombo, fcColorCombo, StdCtrls, wwdblook, IvDictio, IvMulti, db,
   IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
   Wwdbspin, mListaPlano, mListaPatro, wwdbdatetimepicker, mContratoEmptmo,
   mMutuario;

type
   TcfgRelItensAberto = class(TcfgRel)
      Label2: TLabel;
      Label1: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      molMutuario: TmolMutuario;
      molContratoEmptmo: TmolContratoEmptmo;
      Label4: TLabel;
      DBcboSitPart: TwwDBLookupCombo;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      chkItemMes: TCheckBox;
      chkItemAnt: TCheckBox;

      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure molMutuariobtnBuscaPartClick(Sender: TObject);
      procedure molMutuariobtnLimpaPartClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public { Public declarations }

   end;



var
   cfgRelItensAberto: TcfgRelItensAberto;



implementation
{$R *.DFM}
uses
   DLookEmptmo, USistema, UFuncoesEmptmo, dEmptmo, uMensErro, uDiasUteis, dRelItensAberto;



procedure TcfgRelItensAberto.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;
end;




procedure TcfgRelItensAberto.MontaQuery;
begin
   inherited;

   with dtmRelItensAberto do
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
        if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

        memPatro.RichText := molListaPatro.ListaPatro;
        memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------
      // Fim Pendência 21063

   end;

   FiltraRelatorio;
end;



procedure TcfgRelItensAberto.FiltraRelatorio;
var
   sSQL  : String;
   sAno  : String;
   sMes  : String;
begin
   sAno := FormatFloat('00', DBspnAno.Value);
   sMes := FormatFloat('00', (cboMes.ItemIndex + 1));

   sSQL :=
   'SELECT '                                                                     + #13 +
   '  CON.IDCONTRATOEMPTMO, '                                                    + #13 +

   // Início Pendência 23260 - Marcos Topini
   '  DEP.MATRICULA   AS MATRICULA, '                                            + #13 +
   '  PPP.INSCRICAONUMERO, '                                                     + #13 +
   '  MUT.NOME, '                                                                + #13 +
   '  DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO,' + #13 +
   '  HME.HMEPARCELA, '                                                          + #13 +
   '  HME.HMENUMPARCELAS, '                                                      + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00''))) ||''/''|| LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000''))) ) AS COMPETENCIA,' + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, ''00'')))    ||''/''|| LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, ''0000''))) )    AS COBRANCA,'    + #13 +

   '  HME.HMEVLRPREVISTO, '                                                      + #13 +
   '  HME.HMEDATAPREVISTA, '                                                     + #13 +
   '  HME.HMEDATAVENCTO, '                                                       + #13 +

   '  HME.HMESEQCOBRANCA, '                                                      + #13 +

   '  DECODE(HME.HMETIPOMOV, 0, ''Concessão'',                          '        + #13 +
   '                         1, ''Prestação'',                          '        + #13 +
   '                         2, ''Amortização'',                        '        + #13 +
   '                         3, ''Quitação'',                           '        + #13 +
   '                         4, ''Atualização Débito'',                 '        + #13 +
   '                         5, ''Atualização Diária'') AS DESC_EVENTO, '        + #13 +

   '  ITE.ITEDESCRICAO,  '                                                        + #13 +
   // Fim Pendência 23260

   '  DECODE(CON.FLGSITUACAO, ''A'', ''Ativo'', '                                + #13 +
   '                          ''C'', ''Cancelado'', '                            + #13 +
   '                          ''E'', ''Encerrado'', '                            + #13 +
   '                          ''Q'', ''Quitado'', '                              + #13 +
   '                          ''R'', ''Refinanciado'', '                         + #13 +
   '                          ''S'', ''Suspenso'', '                             + #13 +
   '                          ''K'', ''Em Quitação'') AS DESCSITCONTRATO '       + #13 +

   'FROM '                                                                       + #13 +

   // Início Pendência 23260 - Marcos Topini
   '  HISTMOVEMPTMO  HME,  '                                                     + #13 +
   '  ITEMEMPTMO     ITE,  '                                                     + #13 +
   '  CONTRATOEMPTMO  CON,'                                                      + #13 +
   '  DEPENTIT        DEP,'                                                      + #13 +
   '  PARTPREVPLAN    PPP,'                                                      + #13 +
   '  PESSOA          MUT,'                                                      + #13 +
   '  SITPART         SIT,'                                                      + #13 +
   '  TIPOEMPTMO      TEP,'                                                      + #13 +
   '  TIPOCONTREMPTMO TCE,'                                                      + #13 +

   '  VWMIGRACONTRATOEP MIG '                                                    + #13 +
   // Fim Pendência 23260

   'WHERE '                                                                      + #13 +

   // Início Pendência 23260 - Marcos Topini
   // filtro por Empresa Proprietátia
   '      TEP.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)               + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '  AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27205 - 09/01/2007
   //'  AND CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue               + #13;
   '  AND TEP.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue               + #13;
   //Fim Pendência 27205

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue             + #13;

   sSQL := sSQL +
   // filtro por Patrocinadora
   '  AND MIG.IDPATROATU         IN (' + molListaPatro.PegaPatro + ') '          + #13 +

   // filtro por Plano
   '  AND MIG.IDPLANOCONTATU     IN (' + molListaPlano.PegaPlano + ') '          + #13;

   // filtro por SitPart
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27333 - 30/01/2008
   //'  AND CON.IDSITPART          = ' + DBcboSitPart.LookupValue                  + #13;
   '  AND PPP.IDSITPART          = ' + DBcboSitPart.LookupValue                  + #13;
   //Fim Pendência 27333

   // ----------------------------------------------------------------------------------------------
   if (chkItemMes.Checked) and (chkItemAnt.Checked) then
   begin
      sSQL := sSQL +

   // Início Pendência 23260 - Marcos Topini
   '    AND (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000''))) || LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00''))) ) <= ' + sAno + sMes  + #13;
   end
   else
   begin
      if (chkItemMes.Checked) or (chkItemAnt.Checked) then
      begin
         // filtro por Competência
         if chkItemMes.Checked then sSQL := sSQL +
   '  AND HME.HMEANOCOMPETENCIA  = ' + sAno                                      + #13 +
   '  AND HME.HMEMESCOMPETENCIA  = ' + sMes                                      + #13;

         if chkItemAnt.Checked then sSQL := sSQL +
   '  HME.ANOMESCOMPETENCIA      < ' + sAno + sMes                               + #13;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   // Início Pendência 23260 - Marcos Topini
   '  AND HME.HMETIPOMOV           <> 0 '                                          + #13 +

   '  AND HME.HMEVLREFETIVO      IS NULL '                                       + #13 +
   '  AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 ) '                 + #13 +
   '  AND ( HME.FLGESTORNADO     = 0 OR HME.FLGESTORNADO IS NULL ) '             + #13 +
   '  AND ( HME.FLGABONADO       = 0 OR HME.FLGABONADO   IS NULL ) '             + #13 +
   '  AND ( HME.FLGQUITADO       = 0 OR HME.FLGQUITADO   IS NULL ) '             + #13 +
   '  AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                        + #13 +

   // Início Pendência 23260 - Marcos Topini
   'AND ITE.IDITEMEMPTMO      = HME.IDITEMEMPTMO        '                        + #13 +
   'AND PPP.fLGDESATIVADO     = 0                       '                        + #13 +
   'AND PPP.IDSITPART         = SIT.IDSITPART           '                        + #13 +
   'AND CON.IDBENEF           = MUT.IDPESSOA            '                        + #13 +
   'AND PPP.IDPESSJUR         = CON.IDPATRO             '                        + #13 +
   'AND PPP.IDPLANOPREV       = CON.IDPLANOPREV         '                        + #13 +
   'AND PPP.IDPESSOA          = CON.IDPESSOA            '                        + #13 +
   'AND PPP.SEQPROPOSTA       = 1                       '                        + #13 +
   'AND DEP.IDPESSOA          = CON.IDBENEF             '                        + #13 +
   'AND DEP.IDPESSOA          = CON.IDBENEF             '                        + #13 +
   'AND DEP.IDTITULAR         = CON.IDPESSOA            '                        + #13 +
   'AND DEP.IDTITULAR         = CON.IDPESSOA            '                        + #13 +
   'AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO   '                        + #13 +
   'AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO        '                        + #13 +
   'AND MIG.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO    '                        + #13 +
   'AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)  '                        + #13 +
   '                               FROM VWMIGRACONTRATOEP '                      + #13 +
   '                              WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO' + #13 +
   '                                AND DATAMIGRA       <= HME.HMEDATAPREVISTA)' + #13 +

   'ORDER BY '                                                                   + #13 +
   '   MUT.NOME, CON.IDCONTRATOEMPTMO, HMEANOCOMPETENCIA, HMEMESCOMPETENCIA,   ' + #13 +
   '   HMEANOCOBRANCA, HMEMESCOBRANCA, HMETIPOMOV, HME.HMESEQCOBRANCA '          + #13;

   with dtmRelItensAberto.qryItensAberto do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelItensAberto.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensAberto.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensAberto.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensAberto.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelItensAberto.FormShow(Sender: TObject);
begin
   inherited;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex     := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value       := DiasUteis.ExtraiAno(Date);

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




procedure TcfgRelItensAberto.molMutuariobtnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TcfgRelItensAberto.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnLimpaPartClick(Sender);
end;



procedure TcfgRelItensAberto.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TcfgRelItensAberto.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TcfgRelItensAberto.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelItensAberto.DBcboTipoEmptmoExit(Sender: TObject);
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
