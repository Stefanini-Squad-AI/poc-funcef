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
unit CRelConfereParcela;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, CheckLst, fcCombo, fcColorCombo, Mask, wwdbedit,
   Wwdbspin, wwdblook, Db, DBTables, mListaPlano, mListaPatro, Wwquery, TREdit;

type
   TcfgRelConfereParcela = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      DBedtDiferenca: TDBRealEdit;
      Label3: TLabel;
      Label4: TLabel;
      rdgOrdenacao: TRadioGroup;
      chkCOMAmortizacao: TCheckBox;
      chkSEMAmortizacao: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public // Public declarations

   end;



var
  cfgRelConfereParcela: TcfgRelConfereParcela;



implementation
{$R *.DFM}
uses
   DLookEmptmo, UFuncoesEmptmo, UDiasUteis, USistema, dRelConfereParcela;



procedure TcfgRelConfereParcela.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



procedure TcfgRelConfereParcela.MontaQuery;
begin
   inherited;

   with dtmRelConfereParcela do
   begin
      // cabeçalho: mês de competência
      lblMesCompetencia.Caption  := cboMes.Text + '/' + FormatFloat('0000', DBspnAno.Value);

      if chkCOMAmortizacao.Checked then rptConfereParcela_lblFiltroAmortiza.Caption := 'Contratos com Amortização';
      if chkSEMAmortizacao.Checked then rptConfereParcela_lblFiltroAmortiza.Caption := 'Contratos sem Amortização';

      if (chkCOMAmortizacao.Checked) and (chkSEMAmortizacao.Checked) then rptConfereParcela_lblFiltroAmortiza.Caption := '';

      bSeparador                 := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha                  := chkCorLinha.Checked;
      CorLinha                   := cboCorLinha.SelectedColor;

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



procedure TcfgRelConfereParcela.FiltraRelatorio;
var
   sSQL              : String;
   sMesComp          : String;
   sAnoComp          : String;
   sMesCompAnt       : String;
   sAnoCompAnt       : String;
   dData             : TDateTime;
begin
   sMesComp    := IntToStr(cboMes.ItemIndex + 1);
   sAnoComp    := FormatFloat('0000', DBspnAno.Value);

   dData       := EncodeDate(word(trunc(DBspnAno.Value)), word(cboMes.ItemIndex + 1), 1);

   sMesCompAnt := FormatDateTime('mm', dData - 1);
   sAnoCompAnt := FormatDateTime('yyyy', dData - 1);

   sSQL :=
   'SELECT '                                                                                 +
   '   CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME, '                                      + #13 +
   '   DECODE(SIT.FLGINTERNO, ''AS'', ''Assistido'', '                                       + #13 +
   '                          ''AT'', ''Ativo'', '                                           + #13 +
   '                          ''CA'', DECODE(CON.IDPESSOA, CON.IDBENEF, ''Cancelado'', '     + #13 +
   '                                                                    ''Pensionista''), '  + #13 +
   '                          ''MA'', ''Mantido'', '                                         + #13 +
   '                          ''MP'', ''Manut. Parcial'', '                                  + #13 +
   '                          ''MS'', ''Manut. Saldo'', ''Outros'') AS SITUACAO, '           + #13 +

   '   ANT.HMEVLRPREVISTO AS PREV_ANT,  ATU.HMEVLRPREVISTO AS PREV_ATU, '                    + #13 +
   '   ANT.HMEPARCELA AS PARC_ANT,      ATU.HMEPARCELA AS PARC_ATU, '                        + #13 +
   '   ANT.HMENUMPARCELAS AS PARCS_ANT, ATU.HMENUMPARCELAS AS PARCS_ATU, '                   + #13 +
   '   ANT.HMEDATAPREVISTA AS DATA_ANT, ATU.HMEDATAPREVISTA AS DATA_ATU, '                   + #13 +
   '   ABS((ATU.HMEVLRPREVISTO - ANT.HMEVLRPREVISTO) / ANT.HMEVLRPREVISTO * 100) AS PERC, '  + #13 +
   '   DECODE(ANT.FLGSUSPENSAO,1,''*'','' '') AS SUSPENSO '                                  + #13 +
   'FROM '                                                                                   + #13 +
   '   HISTMOVEMPTMO   ANT, '                                                                + #13 +
   '   HISTMOVEMPTMO   ATU, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   PARTPREVPLAN    PPP, '                                                                + #13 +
   '   SITPART         SIT, '                                                                + #13 +
   '   DEPENTIT        DEP, '                                                                + #13 +
   '   PESSOA          MUT, '                                                                + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                + #13 +
   '   TIPOEMPTMO      TEP, '                                                                + #13 +

   // Pendência 23260 - Marcos Topini em 14/11/2006
   '   VWMIGRACONTRATOEP MIG '                                                              + #13 +

   'WHERE '                                                                                  + #13 +
   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                        + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;

   sSQL := sSQL +

   // Pendência 23260 - Marcos Topini em 14/11/2006
   // filtro por Patrocinadora
   '   AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   // filtro por Plano
   '   AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                   + #13 +
   // Fim Pendência 23260

   '   AND CON.FLGSITUACAO          NOT IN (''C'', ''Q'') '                                  + #13 +
   '   AND ANT.HMETIPOMOV           = 1 '                                                    + #13 +
   '   AND ANT.HMESEQCOBRANCA       = 1 '                                                    + #13 +
   '   AND ATU.HMETIPOMOV           = 1 '                                                    + #13 +
   '   AND ATU.HMESEQCOBRANCA       = 1 '                                                    + #13 +
   '   AND (ANT.HMECENTRALIZA       = 1 OR ANT.HMEDESTACADO = 1) '                           + #13 +
   '   AND (ATU.HMECENTRALIZA       = 1 OR ATU.HMEDESTACADO = 1) '                           + #13 +
   '   AND ATU.HMEANOCOMPETENCIA    = ' + sAnoComp                                           + #13 +
   '   AND ATU.HMEMESCOMPETENCIA    = ' + sMesComp                                           + #13 +
   '   AND ANT.HMEANOCOMPETENCIA    = ' + sAnoCompAnt                                        + #13 +
   '   AND ANT.HMEMESCOMPETENCIA    = ' + sMesCompAnt                                        + #13;

   sSQL := sSQL +
   '   AND NVL(ANT.FLGESTORNADO, 0) = 0 '                                                    + #13 +
   '   AND NVL(ATU.FLGESTORNADO, 0) = 0 '                                                    + #13 +
   '   AND ( '                                                                               + #13 +

   '       ATU.HMEVLRPREVISTO       > (ANT.HMEVLRPREVISTO + (ANT.HMEVLRPREVISTO * ' + NumeroIngles(DBedtDiferenca.Value) + ' / 100)) or ' + #13 +
   '       ATU.HMEVLRPREVISTO       < (ANT.HMEVLRPREVISTO - (ANT.HMEVLRPREVISTO * ' + NumeroIngles(DBedtDiferenca.Value) + ' / 100)) '    + #13 +

   '       ) '                                                                               + #13;

   if chkSEMAmortizacao.Checked then sSQL := sSQL +
   '   AND NOT EXISTS '                                                                      + #13 +
   '       ( '                                                                               + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '       SELECT IDHISTMOVEMPTMO '                                                          + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '       FROM   HISTMOVEMPTMO '                                                            + #13 +
   '       WHERE  HMETIPOMOV           = 2 '                                                 + #13 +
   '          AND NVL(FLGESTORNADO, 0) = 0 '                                                 + #13 +
   '          AND ( '                                                                        + #13 +
   '              HMEDATAPREVISTA      BETWEEN ANT.HMEDATAPREVISTA AND ATU.HMEDATAPREVISTA ' + #13 +
   '           OR ( '                                                                        + #13 +
   '              HMEANOCOMPETENCIA    = ANT.HMEANOCOMPETENCIA '                             + #13 +
   '          AND HMEMESCOMPETENCIA    = ANT.HMEMESCOMPETENCIA '                             + #13 +
   '              ) '                                                                        + #13 +
   '              ) '                                                                        + #13 +
   '          AND IDCONTRATOEMPTMO     = ATU.IDCONTRATOEMPTMO '                              + #13 +
   '       ) '                                                                               + #13;

   if chkCOMAmortizacao.Checked then sSQL := sSQL +
   '   AND EXISTS '                                                                          + #13 +
   '       ( '                                                                               + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   '       SELECT IDHISTMOVEMPTMO '                                                          + #13 +
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
   '       FROM   HISTMOVEMPTMO '                                                            + #13 +
   '       WHERE  HMETIPOMOV           = 2 '                                                 + #13 +
   '          AND NVL(FLGESTORNADO, 0) = 0 '                                                 + #13 +
   '          AND ( '                                                                        + #13 +
   '              HMEDATAPREVISTA      BETWEEN ANT.HMEDATAPREVISTA AND ATU.HMEDATAPREVISTA ' + #13 +
   '           OR ( '                                                                        + #13 +
   '              HMEANOCOMPETENCIA    = ANT.HMEANOCOMPETENCIA '                             + #13 +
   '          AND HMEMESCOMPETENCIA    = ANT.HMEMESCOMPETENCIA '                             + #13 +
   '              ) '                                                                        + #13 +
   '              ) '                                                                        + #13 +
   '          AND IDCONTRATOEMPTMO     = ATU.IDCONTRATOEMPTMO '                              + #13 +
   '       ) '                                                                               + #13;

   sSQL := sSQL +
   '   AND ATU.IDCONTRATOEMPTMO     = ANT.IDCONTRATOEMPTMO '                           + #13 +
   '   AND ATU.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                           + #13 +
   '   AND ATU.IDITEMEMPTMO         = ANT.IDITEMEMPTMO '                               + #13 +
   '   AND CON.IDPESSOA             = DEP.IDTITULAR '                                  + #13 +
   '   AND CON.IDBENEF              = DEP.IDPESSOA '                                   + #13 +
   '   AND CON.IDBENEF              = MUT.IDPESSOA '                                   + #13 +
   '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                          + #13 +
   '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                               + #13 +

   '   AND CON.IDPESSOA             = PPP.IDPESSOA '                                   + #13 +
   '   AND PPP.IDSITPART            = SIT.IDSITPART '                                  + #13 +
   '   AND PPP.FLGDESATIVADO        = 0 '                                              + #13 +

   // Pendência 23260 - Marcos Topini
   '  AND MIG.IDCONTRATOEMPTMO = ATU.IDCONTRATOEMPTMO '                                + #13 +
   '  AND MIG.DATAMIGRA        = (SELECT MAX(DATAMIGRA) '                              + #13 +
   '                                    FROM VWMIGRACONTRATOEP '                       + #13 +
   '                                   WHERE IDCONTRATOEMPTMO = ATU.IDCONTRATOEMPTMO ' + #13 +
   '                                     AND DATAMIGRA       <= ATU.HMEDATAPREVISTA) ' + #13 +
   // Fim Pendência 23260

   'ORDER BY '                                                                         + #13;

   case rdgOrdenacao.ItemIndex of
      0: sSQL := sSQL + '   CON.IDCONTRATOEMPTMO ';
      1: sSQL := sSQL + '   DEP.MATRICULA ';
      2: sSQL := sSQL + '   MUT.NOME ';
      3: sSQL := sSQL + '   ABS((ATU.HMEVLRPREVISTO - ANT.HMEVLRPREVISTO) / ANT.HMEVLRPREVISTO * 100) DESC, MUT.NOME ';
   end;

   with dtmRelConfereParcela.qryConfereParcela do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'EP-RelConfereParcela.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-RelConfereParcela.txt');
      Open;
   end;
end;



procedure TcfgRelConfereParcela.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

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



procedure TcfgRelConfereParcela.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelConfereParcela.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelConfereParcela.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelConfereParcela.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelConfereParcela.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
