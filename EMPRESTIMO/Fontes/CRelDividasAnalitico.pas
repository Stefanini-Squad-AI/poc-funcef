{--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Wylliam Leite da Silva
Data        : 04/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
-------------------------------------------------------------------------------- }
unit CRelDividasAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, mInscricaoEmptmo, wwdbdatetimepicker,
  mListaPlano, mListaPatro;

type
   TcfgRelDividasAnalitico = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      molContratoEmptmo: TmolContratoEmptmo;
      edtDataRef: TwwDBDateTimePicker;
      Label3: TLabel;
      chkParcelasAberto: TCheckBox;
      rdgOrdenar: TRadioGroup;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      chkSaldoZERO: TCheckBox;
      DBcboSitPart: TwwDBLookupCombo;
      Label4: TLabel;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;

      procedure FormShow(Sender: TObject);
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

  public { Public declarations }

  end;



var
  cfgRelDividasAnalitico: TcfgRelDividasAnalitico;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   dEmptmo,
   dRelDividasAnalitico,
   uMensErro;




procedure TcfgRelDividasAnalitico.AbreQueries;
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



procedure TcfgRelDividasAnalitico.FormShow(Sender: TObject);
begin
   inherited;

   (* limpa a seleção de Contrato *)
   molContratoEmptmo.btnLimpaContrato.Click;

   (* preenche a data de referência *)
   edtDataRef.Date := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));

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



procedure TcfgRelDividasAnalitico.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelDividasAnalitico.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelDividasAnalitico.MontaQuery;
begin
   inherited;

   with dtmRelDividasAnalitico do begin

      (* preenche a label de data de referência *)
      if length(trim(edtDataRef.Text)) > 0 then sDataRef := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelDividasAnalitico.FiltraRelatorio;
var
   sSQL  : string;
   sData : string;
begin
   sData := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

   sSQL :=
   'SELECT  '                                                               + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +
   '   PTI.NOME AS NOME_TITULAR, '                                                           + #13 +
   '   PBF.NOME AS NOME_BENEF, '                                                             + #13 +
   '   SIT.DESCRICAO AS SIT_PART, '                                                          + #13 +
   '   ELP.MATRICULA, '                                                                      + #13 +
   '   SLD.HMEDATAATUALIZA, SLD.HMESALDODEV, SLD.HMEPARCELA, SLD.HMENUMPARCELAS, '           + #13 +
   '   SLD.IDITEMEMPTMO, ITM.ITEDESCRICAO, SLD.HMEVLRPREVISTO, '                             + #13 +
   '   PAR.VALOR_DEVIDO, (SLD.HMESALDODEV + PAR.VALOR_DEVIDO) AS TOTAL '                     + #13 +

   'FROM '                                                                                   + #13 +
   '   PESSOA PBF, '                                                                         + #13 +
   '   PESSOA PTI, '                                                                         + #13 +
   '   CONTRATOEMPTMO CON, '                                                                 + #13 +
   '   ELEGPATRO ELP, '                                                                      + #13 +
   '   PARTPREVPLAN PPP, '                                                                   + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                + #13 +
   '   TIPOEMPTMO TEP, '                                                                     + #13 +
   '   PATRO PTR, '                                                                          + #13 +
   '   PLANPREV PLP, '                                                                       + #13 +
   '   SITPART SIT, '                                                                        + #13 +
   '   ITEMEMPTMO ITM, '                                                                     + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, HME.HMENUMPARCELAS, '        + #13 +
   '      HME.IDITEMEMPTMO, HME.HMEVLRPREVISTO '                                             + #13 +

   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                           + #13 +
   '      ( '                                                                                + #13 +
   '      SELECT  '                                                         + #13 +
   '         CON.IDCONTRATOEMPTMO, IDHISTMOVEMPTMO '                                         + #13 +
   '      FROM '                                                                             + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                        + #13 +
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                       + #13 +
   '      WHERE '                                                                            + #13 +
   '             ( ITC.ITCTRATASALDODEV   <> 0 ) '                                           + #13 +
   '         AND ( HME.HMEDATAATUALIZA    <= TO_DATE(''' + sData + ''', ''DD/MM/YYYY'') ) '  + #13 +
   '         AND ( (HME.FLGESTORNADO       IS NULL) OR (HME.FLGESTORNADO = 0) ) '            + #13 +
   '         AND ( CON.FLGSITUACAO        <> ''C'' ) '                                       + #13 +
   '         AND ( HMETIPOMOV             IN (1, 2, 3, 4, 6, 7) ) '                          + #13 +

   '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                         + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                        + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                        + #13 +
   '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                        + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                             + #13 +
   '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                             + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                             + #13 +
   '      ) MAX '                                                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          ( CON.FLGSITUACAO        <> ''C'' ) '                                          + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                            + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '                            + #13 +
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                             + #13 +
   '   ) SLD, '                                                                              + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, SUM(HME.HMEVLRPREVISTO) AS VALOR_DEVIDO '                    + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          HMETIPOMOV             IN (1, 2, 3, 4, 6, 7) '                                 + #13 +
   '      AND ( CON.FLGSITUACAO      NOT IN (''C'', ''Q'' ) ) '                              + #13 +
   '      AND HMEDATAPREVISTA        <= TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'') '                                 + #13 +
   '      AND ( (HMEDATAEFETIVA      IS NULL) OR (HMEDATAEFETIVA > TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'')) ) '   + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +
   '      AND ( (HME.FLGQUITADO      IS NULL) OR ((HME.FLGQUITADO IS NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY''))) ) ' + #13 +
   '      AND ( (HME.FLGABONADO      IS NULL) OR ((HME.FLGABONADO IS NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY''))) ) ' + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +

   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13 +
   '   ) PAR '                                                                               + #13 +

   'WHERE '                                                                                  + #13 +

   (* filtro por Empresa Proprietátia *)
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +

   (* filtro por Patrocinadora *)
   '   AND PTR.IDPESSOA             IN (' + molListaPatro.PegaPatro + ') '                   + #13 +

   (* filtro por Plano *)
   '   AND PLP.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                   + #13;

   (* filtro por Contrato *)
   if molContratoEmptmo.IDContrato > 0 then begin
      sSql := sSql +
   '   AND CON.IDCONTRATOEMPTMO     = ' + IntToStr(molContratoEmptmo.IDContrato)             + #13;
   end;

   (* filtro por Tipo de Empréstimo *)
   if DBcboTipoEmptmo.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13 +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;
   end;

   (* filtro por Tipo de Contrato *)
   if DBcboTipoContrato.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;
   end;

   (* filtro por saldo devedor do contrato *)
   if chkSaldoZERO.Checked then begin
      sSQL := sSQL +
   '   AND ( SLD.HMESALDODEV        = 0 ) '                                                  + #13;
   end;

   (* filtro por SitPArt *)
   if DBcboSitPart.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND SIT.IDSITPART            = ' + DBcboSitPart.LookupValue                           + #13;
   end;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''Q'' ) '                                             + #13 +
   '   AND ( PPP.FLGDESATIVADO      = 0 ) '                                                  + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                               + #13;

   (* filtro por saldo parcelas vencidas em aberto *)
   if chkParcelasAberto.Checked then begin
      sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR.IDCONTRATOEMPTMO ) '                               + #13;
   end else begin
      sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR.IDCONTRATOEMPTMO(+) ) '                            + #13;
   end;

   sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO ) '                               + #13 +
   '   AND ( CON.IDPESSOA           = PTI.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPESSOA           = ELP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPATRO            = PTR.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPATRO            = PPP.IDPESSJUR ) '                                      + #13 +
   '   AND ( CON.IDPLANOPREV        = PPP.IDPLANOPREV ) '                                    + #13 +
   '   AND ( ELP.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( ELP.IDPESSJUR          = PPP.IDPESSJUR ) '                                      + #13 +
   '   AND ( PTR.IDPESSOA           = ELP.IDPESSJUR ) '                                      + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                       + #13 +
   '   AND ( PTI.IDPESSOA           = ELP.IDPESSOA ) '                                       + #13 +
   '   AND ( PTI.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPLANOPREV        = PLP.IDPLANOPREV ) '                                    + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO ) '                                   + #13 +
   '   AND ( PPP.IDSITPART          = SIT.IDSITPART ) '                                      + #13 +
   '   AND ( SLD.IDITEMEMPTMO       = ITM.IDITEMEMPTMO ) '                                   + #13 +

   'ORDER BY '                                                                               + #13;

   case rdgOrdenar.ItemIndex of
      0: sSQL := sSQL + '   CON.IDCONTRATOEMPTMO';
      1: sSQL := sSQL + '   PBF.NOME, CON.IDCONTRATOEMPTMO';
      2: sSQL := sSQL + '   SIT.DESCRICAO, PBF.NOME';
      3: sSQL := sSQL + '   ELP.MATRICULA, CON.IDCONTRATOEMPTMO';
   end;

   with dtmRelDividasAnalitico.qryDividas do begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelDividasAnalitico.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelDividasAnalitico.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelDividasAnalitico.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelDividasAnalitico.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
