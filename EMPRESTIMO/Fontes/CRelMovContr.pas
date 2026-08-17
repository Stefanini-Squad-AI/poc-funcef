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
   dEmptmo,
   dRelContrConc, dRelDividas;




function TcfgRelMovContr.MontaSelectMovContr(const idContrato: Extended; const idTipoEmprestimo, idTipoContrato: Int64;
                                             const sMesCompetencia, sAnoCompetencia, sOrdenar: String): String;
var
   sSql            : String;
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
   
   sSql :=
   'SELECT '                                                   + #13 +
   '  DATACREDITO, '                                           + #13 +
   '  C.IDTIPOCONTREMPTMO, '                                   + #13 +
   '  C.IDCONTRATOEMPTMO, '                                    + #13 +
   '  I.IDITEMEMPTMO, '                                        + #13 +
   '  I.ITEDESCRICAO, '                                        + #13 +
   '  P.NOME, '                                                + #13 +
   '  H.HMEVLRPREVISTO, '                                      + #13 +
   '  H.HMEVLREFETIVO, '                                       + #13 +
   '  HMETXJUROS, '                                            + #13 +
   '  CODDOCUMENTO, '                                          + #13 +
   '  IDRUBRICA, '                                             + #13 +
   '  H.HMEDATAPREVISTA, '                                     + #13 +
   '  H.HMEDATAEFETIVA, '                                      + #13 +
   '  H.HMEDATAVENCTO, '                                       + #13 +
   '  H.HMEANOCOMPETENCIA AS ANOCOMP, '                        + #13 +
   '  H.HMEMESCOMPETENCIA AS MESCOMP, '                        + #13 +
   '  H.HMEANOCOBRANCA AS ANOCOBR, '                           + #13 +
   '  H.HMEMESCOBRANCA AS MESCOBR, '                           + #13 +
   '  H.HMEPARCELA, '                                          + #13 +
   '  H.HMESEQCOBRANCA, '                                      + #13 +
   '  H.HMESALDODEV, '                                         + #13 +
   '  (PL.PLNCODIGO||''/''||PL.PLNPLANIL) AS PLNPLANIL, '      + #13 +
   '  PL.PLNDATDIA, '                                          + #13 +
   '  TC.TCEDESCRICAO, '                                       + #13 +
   '  H.HMETIPOMOV AS TIPOMOV, '                               + #13 +
   '  IC.ITCSEQCALCULO, '                                      + #13 +
   '  DECODE(C.FLGFORMAPAG, '                                  + #13 +
   '         ''F'', ''Folha de Pagamento'', '                  + #13 +
   '                ''Banco'') AS FLGFORMAPAG, '               + #13 +

   '  DECODE(H.HMETIPOMOV, '                                   + #13 +
   '         0, ''Concessão/Renovação'', '                     + #13 +
   '         1, ''Prestação '', '                              + #13 +
   '         2, ''Amortização/Refinanciamento'', '             + #13 +
   '         3, ''Quitação'', '                                + #13 +
   '         4, ''Atualização de Débito'', '                   + #13 +
   '         5, ''Atualização de Saldo (Diária)'' , '          + #13 +
   '         6, ''Importação/Migração'', '                     + #13 +
   '         7, ''Ajustes (Cobrança/Devolução)'', '            + #13 +
   '         8, ''Ajustes (Saldo Devedor)'' '                  + #13 +
   '        ) AS EVENTO, '                                     + #13 +

   '  TO_CHAR(H.HMEMESCOMPETENCIA, ''00'') || ''/'' || TO_CHAR(H.HMEANOCOMPETENCIA,''0000'') AS ANOMESCOMP, ' + #13 +
   '  TO_CHAR(H.HMEMESCOBRANCA, ''00'')    || ''/'' || TO_CHAR(H.HMEANOCOBRANCA,''0000'')    AS ANOMESCOBR, ' + #13 +
   '    DECODE(NVL(H.HMECENTRALIZA,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLREFETIVO,0)) + ' +
   '    DECODE(NVL(H.HMEDESTACADO,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLREFETIVO,0)) AS VLR_ABERTO ' + #13 +

   'FROM '                                                     + #13 +
   '  PESSOA           P, '                                    + #13 +
   '  PLANILHA         PL, '                                   + #13 +
   '  HISTMOVEMPTMO    H, '                                    + #13 +
   '  CONTRATOEMPTMO   C, '                                    + #13 +
   '  ITEMXTIPOCONTR   IC, '                                   + #13 +
   '  TIPOCONTREMPTMO  TC, '                                   + #13 +
   '  ITEMEMPTMO       I '                                     + #13 +

   'WHERE '                                                    + #13 +

   '      (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, ''0000'')))) || ' +
   '      (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, ''00'')))) >= ' + QuotedStr(sCompetenciaIni) + #13 +

   '  AND (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, ''0000'')))) || ' +
   '      (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, ''00'')))) <= ' + QuotedStr(sCompetenciaFim) + #13 +

   '  AND ((H.FLGESTORNADO IS NULL) OR (H.FLGESTORNADO = 0))'  + #13 +
   '  AND C.IDBENEF           = P.IDPESSOA           '         + #13 +
   '  AND C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO   '         + #13 +
   '  AND C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO '         + #13 +
   '  AND I.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '         + #13 +
   '  AND H.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '         + #13 +
   '  AND H.PLNCODIGO         = PL.PLNCODIGO(+)      '         + #13 +
   '  AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ' ;


   if chkCentralizador.Checked then
      sSql := sSql +
   ' AND ( (H.HMECENTRALIZA = 1) OR (H.HMEDESTACADO = 1) ' + ' ) '  + #13;


   if chkTrataSaldo.Checked then
      sSql := sSql +
   ' AND ( IC.ITCTRATASALDODEV <> 0 ) '  + #13;

   if idContrato > 0 then
      sSql := sSql +
   ' AND (C.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', idContrato) + ' ) '  + #13;

   sSql := sSql +
   ' AND (C.IDPATRO           IN (' + molListaPatro.PegaPatro + ') ) '  + #13;

   sSql := sSql +
   ' AND (C.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') ) ' ;

   if idTipoEmprestimo <> -1 then begin
      if idTipoContrato <> -1 then begin
         sSql := sSql +
   ' AND (C.IDTIPOCONTREMPTMO = ' + IntToStr(idTipoContrato)   + ')     '
      end else begin
         sSql := sSql +
   ' AND (C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO)                  ' +
   ' AND (TC.IDTIPOEMPTMO     = ' + IntToStr(idTipoEmprestimo) + ')     ' ;
      end;
   end;

   sSql := sSql + #13 +
   'ORDER BY ' +
   '  ' + sOrdenar + ', H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA,                      ' + #13 +
                     '  H.HMETIPOMOV, H.HMEPARCELA, H.HMESEQCOBRANCA, IC.ITCSEQCALCULO ' + #13;

   Result := sSql;
end;



procedure TcfgRelMovContr.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
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
      sSql := sSql +
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

   sSql := sSQL +
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

   (* limpa a seleção de Contrato *)
   molContratoEmptmo.btnLimpaContrato.Click;


   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMesIni.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   DBspnAnoIni.Value   := DiasUteis.ExtraiAno(SysDate) - 5;

   cboMesFim.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   DBspnAnoFim.Value   := DiasUteis.ExtraiAno(SysDate);

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



procedure TcfgRelMovContr.bbtnConfirmarClick(Sender: TObject);
var
  sSql, sOrdena  : String;
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

   if rgOrdenar.ItemIndex = 0 then
     sOrdena := ' C.IDCONTRATOEMPTMO '
   else
     sOrdena := ' P.NOME ' ;


   sSql  := MontaSelectMovContr(molContratoEmptmo.IdContrato, idTipoEmptmo, idTipoContrato,
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
   dtmRelMovContr.qryMovimentoContr.SQL.Text := sSql;

   dtmRelMovContr.wIsCorLinha := chkCorLinha.Checked;
   dtmRelMovContr.wCorLinha := cboCorLinha.SelectedColor;

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
