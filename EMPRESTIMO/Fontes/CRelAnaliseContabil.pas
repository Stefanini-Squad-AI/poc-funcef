unit CRelAnaliseContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, mInscricaoEmptmo, wwdbdatetimepicker,
  mListaPlano, mListaPatro;

type
   TcfgRelAnaliseContabil = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      molContratoEmptmo: TmolContratoEmptmo;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Label3: TLabel;
      edtDataRef: TwwDBDateTimePicker;
      chkPlanilha: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;

      procedure FormShow(Sender: TObject);

      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);

      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

  public { Public declarations }

  end;



var
  cfgRelAnaliseContabil: TcfgRelAnaliseContabil;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   dEmptmo,
   dRelAnaliseContabil,
   uMensErro;




procedure TcfgRelAnaliseContabil.AbreQueries;
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




procedure TcfgRelAnaliseContabil.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche a data de referência
   edtDataRef.Date := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));

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



procedure TcfgRelAnaliseContabil.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelAnaliseContabil.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelAnaliseContabil.MontaQuery;
begin
   inherited;

   with dtmRelAnaliseContabil do
   begin
      (* preenche a label de data de referência *)
      sDataRef := edtDataRef.Text;

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



procedure TcfgRelAnaliseContabil.FiltraRelatorio;
var
   sSQL  : String;
   sData : String;
begin
   sData := QuotedStr(FormatDateTime('dd/mm/yyyy', edtDataRef.Date));

   if chkPlanilha.Checked then
   begin
       sSQL :=
      'SELECT '                                                                              + #13 +
      '  ITC.CONTABAIXA, '                                                                   + #13 +
      '  CON.MATRICULA, '                                                                    + #13 +
      '  CON.IDCONTRATOEMPTMO, '                                                             + #13 +
      '  CON.NOME, '                                                                         + #13 +
      '  HST.PLNCODIGO, '                                                                    + #13 +
      '  HST.PLNPLANIL, '                                                                    + #13 +

      '  RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA,''00''))) || ''/'' || '                   +
        'HME.HMEANOCOMPETENCIA AS COMPETENCIA, '                                             + #13 +

      '  HME.HMEDATAPREVISTA, '                                                              + #13 +
      '  HST.PLNDATDIA, '                                                                    + #13 +
      '  HME.HMEPARCELA, '                                                                   + #13 +
      '  HME.HMEVLRPREVISTO AS VALOR, '                                                      + #13 +
      '  ITE.ITEDESCRICAO  '                                                                 + #13 +
      'FROM '                                                                                + #13 +
      '  HISTMOVEMPTMO   HME, '                                                              + #13 +
      '  VWCONTRATOEP    CON, '                                                              + #13 +
      '  ITEMXTIPOCONTR  ITC, '                                                              + #13 +
      '  ITEMEMPTMO      ITE, '                                                              + #13 +
      '  ( '                                                                                 + #13 +
      '  SELECT '                                                                            + #13 +
      '     DISTINCT HME.IDCONTRATOEMPTMO, HME.IDITEMCENTRALIZA, '                           + #13 +
      '     HME.PLNCODIGO, PLA.PLNDATDIA, HME.HMEPARCELA, '                                  + #13 +
      '     PLA.PLNPLANIL '                                                                  + #13 +
      '  FROM '                                                                              + #13 +
      '     HISTMOVEMPTMO  HME, '                                                            + #13 +
      '     PLANILHA       PLA '                                                             + #13 +
      '  WHERE '                                                                             + #13 +
      '         PLA.IDMODULO        = 15 '                                                   + #13 +

      '     AND PLA.PLNDATDIA       <= TO_DATE(' + sData + ',''DD/MM/YYYY'') '               + #13 +

      '     AND HME.PLNCODIGO       IS NOT NULL '                                            + #13 +
      '     AND (HME.HMECENTRALIZA  = 0 OR HMEDESTACADO = 0) '                               + #13 +
      '     AND PLA.PLNCODIGO       = HME.PLNCODIGO '                                        + #13 +
      '  ) HST '                                                                             + #13 +

      'WHERE '                                                                               + #13 +
      '      CON.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +

      '  AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1)) '                        + #13 +
      '  AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                   + #13 +

      '  AND ( (HME.HMEDATAEFETIVA  IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '   + #13 +
      '  AND ( (HME.HMEVLREFETIVO   IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '   + #13 +

      '  AND ( (HME.FLGQUITADO      IS NULL OR HME.FLGQUITADO = 0) OR ((HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +
      '  AND ( (HME.FLGABONADO      IS NULL OR HME.FLGABONADO = 0) OR ((HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +

      // filtro por Plano e Patro
      '  AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
      '  AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                   + #13;

      // -------------------------------------------------------------------------------------------

      // filtro por Contrato
      if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
      '  AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)             + #13;

      // filtro por Tipo de Empréstimo
      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
      '  AND CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                        + #13;

      // filtro por Tipo de Contrato
      if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
      '  AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                      + #13;

      // -------------------------------------------------------------------------------------------

      sSQL := sSQL +
      '  AND HST.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO '                                 + #13 +
      '  AND HST.IDITEMCENTRALIZA   = HME.IDITEMEMPTMO '                                     + #13 +
      '  AND HST.HMEPARCELA         = HME.HMEPARCELA '                                       + #13 +
      '  AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                 + #13 +
      '  AND ITC.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO '                                + #13 +
      '  AND ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO '                                     + #13 +
      '  AND ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO '                                     + #13 +
      '  AND ITE.IDITEMEMPTMO       = HME.IDITEMEMPTMO '                                     + #13 +
      'ORDER BY '                                                                            + #13 +
      '    ITC.CONTABAIXA, HST.PLNCODIGO, CON.IDCONTRATOEMPTMO '                             + #13;
   end
   else
   begin
      sSQL :=
      'SELECT '                                                                              + #13 +
      '  ITC.CONTABAIXA, '                                                                   + #13 +
      '  CON.MATRICULA, '                                                                    + #13 +
      '  CON.IDCONTRATOEMPTMO, '                                                             + #13 +
      '  CON.NOME, '                                                                         + #13 +
      '  HME.PLNCODIGO, '                                                                    + #13 +
      '  HME.PLNCODIGO AS PLNPLANIL, '                                                       + #13 +

      '  RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA,''00''))) || ''/'' || '                   +
        'HME.HMEANOCOMPETENCIA AS COMPETENCIA, '                                             + #13 +

      '  HME.HMEDATAPREVISTA, '                                                              + #13 +
      '  HME.HMEDATAPREVISTA  AS PLNDATDIA, '                                                + #13 +
      '  HME.HMEPARCELA, '                                                                   + #13 +
      '  HME.HMEVLRPREVISTO AS VALOR,'                                                       + #13 +
      '  ITE.ITEDESCRICAO  '                                                                 + #13 +
      'FROM '                                                                                + #13 +
      '  HISTMOVEMPTMO   HME, '                                                              + #13 +
      '  VWCONTRATOEP    CON, '                                                              + #13 +
      '  ITEMXTIPOCONTR  ITC, '                                                              + #13 +
      '  ITEMEMPTMO      ITE  '                                                              + #13 +
      'WHERE '                                                                               + #13 +
      '      CON.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +
      '  AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ',''DD/MM/YYYY'') '               + #13 +

      '  AND ( (HME.HMEDATAEFETIVA  IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '   + #13 +
      '  AND ( (HME.HMEVLREFETIVO   IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '   + #13 +

      '  AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +

      '  AND ( (HME.FLGQUITADO      IS NULL OR HME.FLGQUITADO = 0) OR ((HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +
      '  AND ( (HME.FLGABONADO      IS NULL OR HME.FLGABONADO = 0) OR ((HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +

      '  AND (HME.HMECENTRALIZA     = 1 OR HME.HMEDESTACADO = 1) '                           + #13 +
      '  AND (CON.FLGSITUACAO       <> ''C'' ) '                                             + #13 +

      // filtro por Plano e Patro
      '  AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
      '  AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                   + #13;

      // -------------------------------------------------------------------------------------------

      // filtro por Contrato
      if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
      '   AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)             + #13;

      // filtro por Tipo de Empréstimo
      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
      '   AND CON.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                        + #13;

      // filtro por Tipo de Contrato
      if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
      '  AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                      + #13;

      // -------------------------------------------------------------------------------------------

      sSQL := sSQL +
      '  AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                                 + #13 +
      '  AND ITC.IDTIPOCONTREMPTMO  = CON.IDTIPOCONTREMPTMO '                                + #13 +
      '  AND ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO '                                     + #13 +
      '  AND ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO '                                     + #13 +
      '  AND ITE.IDITEMEMPTMO       = HME.IDITEMEMPTMO '                                     + #13 +
      'ORDER BY '                                                                            + #13 +
      '    ITC.CONTABAIXA, HME.PLNCODIGO, CON.IDCONTRATOEMPTMO '                             + #13;

   end;

   with dtmRelAnaliseContabil.qryAnaliseContabil do
   begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelAnaliseContabil.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelAnaliseContabil.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelAnaliseContabil.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelAnaliseContabil.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelAnaliseContabil.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



end.

