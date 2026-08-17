{---------------------------Alteração-------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
-------------------------------------------------------------------------------}
unit CRelDividasMutuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, mInscricaoEmptmo, wwdbdatetimepicker,
  mParticipante, mMutuario, mListaPlano, mListaPatro, mListaPlanoContab,
  DBTables, Wwquery, fProgresso;

type
   TcfgRelDividasMutuario = class(TcfgRel)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel1: TPanel;
      edtDataRef: TwwDBDateTimePicker;
      Label3: TLabel;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      DBcboSitPart: TwwDBLookupCombo;
      Label4: TLabel;
      molMutuario: TmolMutuario;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlanoContab;
      qrySaldoDev: TwwQuery;
      qrySaldoDevIDCONTRATOEMPTMO: TFloatField;
      qrySaldoDevHMEDATAATUALIZA: TDateTimeField;
      qrySaldoDevHMESALDODEV: TFloatField;
      qrySaldoDevHMEPARCELA: TFloatField;
      qrySaldoDevHMENUMPARCELAS: TFloatField;
      qryContrato: TwwQuery;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      qryContratoNOME: TStringField;
      qryContratoMATRICULA: TStringField;
      qryContratoTCEDESCRICAO: TStringField;
      qryContratoSITDESCRICAO: TStringField;
      qryContratoVLRCONTRATO: TFloatField;
      qryContratoSTATUSCONTR: TStringField;
      qryHistMov: TwwQuery;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovCOMPETENCIA: TStringField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovITEDESCRICAO: TStringField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure molMutuariobtnBuscaPartClick(Sender: TObject);
      procedure molMutuariobtnLimpaPartClick(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;
      procedure FiltraRelatorioAtuDia;

  public { Public declarations }

  end;



var
  cfgRelDividasMutuario: TcfgRelDividasMutuario;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   dEmptmo,
   dRelDividasMutuario,
   uMensErro;




procedure TcfgRelDividasMutuario.AbreQueries;
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



procedure TcfgRelDividasMutuario.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molMutuario.btnLimpaPartClick(Sender);

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



procedure TcfgRelDividasMutuario.MontaQuery;
begin
   inherited;

   with dtmRelDividasMutuario do begin

      (* preenche a label de data de referência *)
      if length(trim(edtDataRef.Text)) > 0 then sDataRef := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

      bSeparador  := chkLinhas.Checked;

      // -------------------------------------------------------------------------------------------

      lblTipoEmptmo.Caption := ' < todos > ';
      if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

      lblTipoContr.Caption  := ' < todos > ';
      if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

      memPatro.RichText := molListaPatro.ListaPatro;
      memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------


      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   ParametrosSistema;

   case dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger of
      0: FiltraRelatorio;
      1: FiltraRelatorioAtuDia;
   end;
end;



procedure TcfgRelDividasMutuario.FiltraRelatorio;
var
   sSQL  : String;
   sData : String;
begin
   sData := FormatDateTime('DD/MM/YYYY', edtDataRef.Date);

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  CON.IDCONTRATOEMPTMO, CON.NOME, CON.MATRICULA, CON.TCEDESCRICAO, '                     + #13 +
   '  CON.SITDESCRICAO, CON.VLRCONTRATO, '                                                   + #13 +
   '  SLD.HMEDATAATUALIZA, SLD.HMESALDODEV, '                                                + #13 +
   '  HME.PARCELA, HME.COMPETENCIA, HME.HMEVLRPREVISTO, HME.HMESEQCOBRANCA, '                + #13 +
   '  HME.ITEDESCRICAO, '                                                                    + #13 +

// Marchetti - Pendencia 23949
   '  DECODE(CON.FLGSITUACAO, '                                                              + #13 +
   '            ''A'', ''Ativo'', '                                                          + #13 +
   '            ''C'', ''Cancelado'', '                                                      + #13 +
   '            ''J'', ''Cobrança Jurídica'', '                                              + #13 +
   '            ''E'', ''Encerrado'', '                                                      + #13 +
   '            ''Q'', ''Quitado'', '                                                        + #13 +
   '            ''R'', ''Refinanciado'', '                                                   + #13 +
   '            ''S'', ''Suspenso'', '                                                       + #13 +
   '            ''K'', ''Pendente de Quitação'') AS STATUSCONTR  '                           + #13 +
// Fim Marchetti - Pendencia 23949

   'FROM '                                                                                   + #13 +
   '   VWCONTRATOEP CON, '                                                                   + #13 +
   '   VW_MOVEP     HME, '                                                                   + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, HME.HMENUMPARCELAS '         + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                           + #13 +
   '      ( '                                                                                + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   '      SELECT '                                                         + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                 + #13 +
   '      FROM '                                                                             + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                        + #13 +
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                       + #13 +
   '      WHERE '                                                                            + #13 +
   '             ( ITC.ITCTRATASALDODEV   <> 0 ) '                                           + #13 +
   '         AND ( HME.HMEDATAATUALIZA    <= TO_DATE(''' + sData + ''', ''DD/MM/YYYY'') ) '  + #13 +
   '         AND ( (HME.FLGESTORNADO       IS NULL) OR (HME.FLGESTORNADO = 0) ) '            + #13 +
   '         AND ( CON.FLGSITUACAO        <> ''C'' ) '                                       + #13 +
   '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                         + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                        + #13 +
   '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                        + #13 +
   '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                        + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                             + #13 +
   '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                             + #13 +
   '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                             + #13 +
   '      GROUP BY '                                                                         + #13 +
   '         CON.IDCONTRATOEMPTMO '                                                          + #13 +
   '      ) MAX '                                                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          ( CON.FLGSITUACAO        <> ''C'' ) '                                          + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                            + #13 +
   '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '                            + #13 +
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                             + #13 +
   '   ) SLD '                                                                               + #13 +

   'WHERE '                                                                                  + #13 +
   '       CON.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +
   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                   + #13 +
   '   AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                   + #13 +

   '   AND HME.HMEDATAPREVISTA      <= TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'') '   + #13 +

   '   AND ( (HME.HMEDATAEFETIVA    IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'')) ) '  + #13 +
   '   AND ( (HME.HMEVLREFETIVO     IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'')) ) '  + #13 +

   '   AND ( (HME.HMECENTRALIZA     = 1) OR (HME.HMEDESTACADO = 1) ) '                       + #13 +
   '   AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) '                   + #13 +

   '   AND ( (HME.FLGQUITADO      IS NULL OR HME.FLGQUITADO = 0) OR ((HME.FLGQUITADO IS NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY''))) ) ' + #13 +
   '   AND ( (HME.FLGABONADO      IS NULL OR HME.FLGABONADO = 0) OR ((HME.FLGABONADO IS NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY''))) ) ' + #13;

   if molMutuario.IDBenef > 0 then begin
      sSql := sSql +
   '   AND CON.IDBENEF              = ' + IntToStr(molMutuario.IDBenef)                + #13;
   end;

   (* filtro por Tipo de Empréstimo *)
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;

   (* filtro por Tipo de Contrato *)
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;

   (* filtro por SitPArt *)
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDSITPART            = ' + DBcboSitPart.LookupValue                           + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '                               + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO ) '                               + #13 +
   'ORDER BY '                                                                               + #13 +
   '   CON.NOME, CON.IDCONTRATOEMPTMO, HME.PARCELA, HME.COMPETENCIA, HME.EVENTO, HME.HMESEQCOBRANCA ';


   with dtmRelDividasMutuario.qryDividas do begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;



procedure TcfgRelDividasMutuario.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelDividasMutuario.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TcfgRelDividasMutuario.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
  inherited;
  molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelDividasMutuario.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelDividasMutuario.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelDividasMutuario.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelDividasMutuario.molMutuariobtnBuscaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnBuscaPartClick(Sender);
end;



procedure TcfgRelDividasMutuario.molMutuariobtnLimpaPartClick(Sender: TObject);
begin
   inherited;
   molMutuario.btnLimpaPartClick(Sender);
end;



procedure TcfgRelDividasMutuario.FiltraRelatorioAtuDia;
var
   sSQL            : String;
   sData           : String;
   sAno            : String;
   sMes            : String;
   sTipoEmprestimo : String;
   iContador       : Integer;
   bPossuiItens    : Boolean;
begin

   sData := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataRef.Date));
   sAno  := FormatDateTime('YYYY', edtDataRef.Date);
   sMes  := FormatDateTime('MM', edtDataRef.Date);

   sSQL :=
   'SELECT'                                                                                                     + #13 +
   '  CON.IDCONTRATOEMPTMO,'                                                                                    + #13 +
   '  MUT.NOME,'                                                                                                + #13 +
   '  DECODE(DEP.MATRICULA,NULL,ELP.MATRICULA,DEP.MATRICULA) AS MATRICULA,'                                     + #13 +
   '  TCE.TCEDESCRICAO,'                                                                                        + #13 +
   '  DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO,'                       + #13 +
   '  CON.VLRCONTRATO,'                                                                                         + #13 +
   '  DECODE(CON.FLGSITUACAO,'                                                                                  + #13 +
   '            ''A'', ''Ativo'','                                                                              + #13 +
   '            ''C'', ''Cancelado'','                                                                          + #13 +
   '            ''J'', ''Cobrança Jurídica'','                                                                  + #13 +
   '            ''E'', ''Encerrado'','                                                                          + #13 +
   '            ''Q'', ''Quitado'','                                                                            + #13 +
   '            ''R'', ''Refinanciado'','                                                                       + #13 +
   '            ''S'', ''Suspenso'','                                                                           + #13 +
   '            ''K'', ''Pendente de Quitação'') AS STATUSCONTR'                                                + #13 +
   'FROM'                                                                                                       + #13 +
   '   PESSOA            MUT,'                                                                                  + #13 +
   '   CONTRATOEMPTMO    CON,'                                                                                  + #13 +
   '   DEPENTIT          DEP,'                                                                                  + #13 +
   '   ELEGPATRO         ELP,'                                                                                  + #13 +
   '   TIPOCONTREMPTMO   TCE,'                                                                                  + #13 +
   '   SITPART           SIT,'                                                                                  + #13 +
   '   PARTPREVPLAN      PPP,'                                                                                  + #13 +
   '   TIPOEMPTMO        TEP,'                                                                                  + #13 +
   '   VWMIGRACONTRATOEP MIG'                                                                                   + #13 +
   'WHERE'                                                                                                      + #13 +
   '       TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                                              + #13 +
   '   AND CON.FLGSITUACAO       <> ''C'' '                                                                     + #13 +
   '   AND CON.IDBENEF           = MUT.IDPESSOA'                                                                + #13 +
   '   AND CON.IDPESSOA          = ELP.IDPESSOA'                                                                + #13 +
   '   AND CON.IDPATRO           = ELP.IDPESSJUR'                                                               + #13 +
   '   AND CON.IDBENEF           = DEP.IDPESSOA'                                                                + #13 +
   '   AND CON.IDPESSOA          = DEP.IDTITULAR'                                                               + #13 +
   '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'                                                       + #13 +
   '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO'                                                            + #13 +
   '   AND PPP.IDSITPART         = SIT.IDSITPART'                                                               + #13 +
   '   AND CON.IDPESSOA          = PPP.IDPESSOA'                                                                + #13 +
   '   AND CON.IDPATRO           = PPP.IDPESSJUR'                                                               + #13 +
   '   AND PPP.FLGDESATIVADO     = 0'                                                                           + #13 +
   '   AND MIG.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO'                                                        + #13 +
   '   AND MIG.DATAMIGRA         = (SELECT MAX(DATAMIGRA)'                                                      + #13 +
   '                                FROM   VWMIGRACONTRATOEP'                                                   + #13 +
   '                                WHERE  IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'                             + #13 +
   '                                AND    DATAMIGRA <= TO_DATE(' + sData + ', ''DD/MM/YYYY''))'                + #13 +
   '   AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ')'                                          + #13 +
   '   AND MIG.IDPLANOCONTATU    IN (' + molListaPlano.PegaPlano + ')'                                          + #13;

   if molMutuario.IDBenef > 0 then sSql := sSql +
   '   AND CON.IDBENEF           = ' + IntToStr(molMutuario.IDBenef)                                            + #13;

   (* filtro por Tipo de Empréstimo *)
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                                              + #13;

   (* filtro por Tipo de Contrato *)
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue                                            + #13;

   (* filtro por SitPArt *)
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND SIT.IDSITPART         = ' + DBcboSitPart.LookupValue                                                 + #13;

   sSQL := sSQL +
   'ORDER BY'                                                                                                   + #13 +
   '   MUT.NOME, CON.IDCONTRATOEMPTMO'                                                                          + #13;

   qryContrato.SQL.Clear;
   qryContrato.Sql.Text := sSQL;
   qryContrato.Open;

   iContador := 0;

   dtmRelDividasMutuario.qryDividas.Open;

   frmProgresso.MostraFormProgresso('Gerando dados para o relatório',True,True,True, iContador, qryContrato.RecordCount);
   while not qryContrato.Eof do
   begin

      Inc(iContador);

      if frmProgresso.Cancelou then
      begin
         Repaint;
         Application.ProcessMessages;

         // Verifica se abortou processo
         if MsgDlg('Deseja realmente interromper o relatório?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
            Repaint;
            frmProgresso.EscondeFormProgresso;

            Exit;
         end;
         Repaint;
      end;
      Repaint;

      frmProgresso.AndaFormProgresso(iContador);


      LimpaParametros(qrySaldoDev);
      qrySaldoDev.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratoIDCONTRATOEMPTMO.AsFloat;
      qrySaldoDev.ParamByName('PDATA').AsDateTime          := edtDataRef.Date;
      qrySaldoDev.ParamByName('PANO').AsInteger            := StrToInt(sAno);
      qrySaldoDev.ParamByName('PMES').AsInteger            := StrToInt(sMes);
      qrySaldoDev.ParamByName('PANOMES').AsString          := QuotedStr(sAno + sMes);
      qrySaldoDev.Open;

      LimpaParametros(qryHistMov);
      qryHistMov.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratoIDCONTRATOEMPTMO.AsFloat;
      qryHistMov.ParamByName('PDATA').AsDateTime          := edtDataRef.Date;
      qryHistMov.Open;

      bPossuiItens := False;

      while not qryHistMov.eof do
      begin
         bPossuiItens := True;

         dtmRelDividasMutuario.qryDividas.Append;
         dtmRelDividasMutuario.qryDividasIDCONTRATOEMPTMO.AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
         dtmRelDividasMutuario.qryDividasNOME.AsString                := qryContratoNOME.AsString;
         dtmRelDividasMutuario.qryDividasMATRICULA.AsString           := qryContratoMATRICULA.AsString;
         dtmRelDividasMutuario.qryDividasTCEDESCRICAO.AsString        := qryContratoTCEDESCRICAO.AsString;
         dtmRelDividasMutuario.qryDividasSITDESCRICAO.AsString        := qryContratoSITDESCRICAO.AsString;
         dtmRelDividasMutuario.qryDividasHMEDATAATUALIZA.AsDateTime   := qrySaldoDevHMEDATAATUALIZA.AsDateTime;
         dtmRelDividasMutuario.qryDividasHMESALDODEV.AsCurrency       := qrySaldoDevHMESALDODEV.AsCurrency;
         dtmRelDividasMutuario.qryDividasPARCELA.AsInteger            := qryHistMovHMEPARCELA.AsInteger;
         dtmRelDividasMutuario.qryDividasCOMPETENCIA.AsString         := qryHistMovCOMPETENCIA.AsString;
         dtmRelDividasMutuario.qryDividasHMEVLRPREVISTO.AsCurrency    := qryHistMovHMEVLRPREVISTO.AsCurrency;
         dtmRelDividasMutuario.qryDividasHMESEQCOBRANCA.AsInteger     := qryHistMovHMESEQCOBRANCA.AsInteger;
         dtmRelDividasMutuario.qryDividasSTATUSCONTR.AsString         := qryContratoSTATUSCONTR.AsString;
         dtmRelDividasMutuario.qryDividasITEDESCRICAO.AsString        := qryHistMovITEDESCRICAO.AsString;
         dtmRelDividasMutuario.qryDividasVLRCONTRATO.AsCurrency       := qryContratoVLRCONTRATO.AsCurrency;
         dtmRelDividasMutuario.qryDividas.Post;

         qryHistMov.Next;
      end;

      if (not bPossuiItens) and (qrySaldoDevHMESALDODEV.AsCurrency > 0) then
      begin
         dtmRelDividasMutuario.qryDividas.Append;
         dtmRelDividasMutuario.qryDividasIDCONTRATOEMPTMO.AsFloat     := qryContratoIDCONTRATOEMPTMO.AsFloat;
         dtmRelDividasMutuario.qryDividasNOME.AsString                := qryContratoNOME.AsString;
         dtmRelDividasMutuario.qryDividasMATRICULA.AsString           := qryContratoMATRICULA.AsString;
         dtmRelDividasMutuario.qryDividasTCEDESCRICAO.AsString        := qryContratoTCEDESCRICAO.AsString;
         dtmRelDividasMutuario.qryDividasSITDESCRICAO.AsString        := qryContratoSITDESCRICAO.AsString;
         dtmRelDividasMutuario.qryDividasHMEDATAATUALIZA.AsDateTime   := qrySaldoDevHMEDATAATUALIZA.AsDateTime;
         dtmRelDividasMutuario.qryDividasHMESALDODEV.AsCurrency       := qrySaldoDevHMESALDODEV.AsCurrency;
         dtmRelDividasMutuario.qryDividasSTATUSCONTR.AsString         := qryContratoSTATUSCONTR.AsString;
         dtmRelDividasMutuario.qryDividasVLRCONTRATO.AsCurrency       := qryContratoVLRCONTRATO.AsCurrency;
         dtmRelDividasMutuario.qryDividas.Post;
      end;

      qryContrato.Next;
   end;
   frmProgresso.EscondeFormProgresso;
end;



end.
