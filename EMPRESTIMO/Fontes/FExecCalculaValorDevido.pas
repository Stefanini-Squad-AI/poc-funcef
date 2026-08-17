{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecCalculaValorDevido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, mParticipante, Db, DBTables,
  Wwquery, wwdblook, Mask, wwdbedit, Wwdbspin, mListaPlano, mListaPatro,
  TREdit, uTypesEmptmo, mMutuario, MontaSelect, wwdbdatetimepicker,
  mContratoEmptmo;

type
  TfrmCalculaValorDevido = class(TfrmWizardMTEP)
    Label2: TLabel;
    qryRubricas: TwwQuery;
    dsRubricas: TDataSource;
    cboRubrica: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    Label3: TLabel;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    Label4: TLabel;
    DBcboTipoContrato: TwwDBLookupCombo;
    molListaPatro: TmolListaPatro;
    molListaPlano: TmolListaPlano;
    dsTipoContrato: TDataSource;
    Panel3: TPanel;
    memResult: TMemo;
    Panel4: TPanel;
    memErro: TMemo;
    Total: TLabel;
    edtNumResult: TRealEdit;
    edtNumErro: TRealEdit;
    TotalN: TLabel;
    qryCalculo: TwwQuery;
    qryTipoContrato: TwwQuery;
    qryTipoContratoTCEDESCRICAO: TStringField;
    qryTipoContratoDESCTIPOEMPTMO: TStringField;
    qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
    qryTipoContratoIDTIPOEMPTMO: TFloatField;
    qryTipoContratoIDREGRAJURCONC: TFloatField;
    qryTipoContratoIDREGRAELEG: TFloatField;
    qryTipoContratoIDREGRALIMITES: TFloatField;
    qryTipoContratoIDREGRAPRAZOSCONC: TFloatField;
    qryTipoContratoIDREGRAMARGEM: TFloatField;
    qryTipoContratoIDREGRARESERVA: TFloatField;
    qryTipoContratoTEPMAXCONTRATO: TFloatField;
    qryTipoContratoFLGOBRIGBENEF: TFloatField;
    qryTipoContratoIDREGRASALBAS: TFloatField;
    qryTipoContratoMOECODIGO: TFloatField;
    qryTipoContratoFLGCONCESSAOZERO: TFloatField;
    qryTipoContratoTCEMINRENOVA: TFloatField;
    qryTipoContratoIDREGRADATACRED: TFloatField;
    qryTipoContratoIDREGRAPRAZOMAX: TFloatField;
    qryTipoContratoNUMPARCDESCONTO: TFloatField;
    qryTipoContratoIDREGRAPRIMPARC: TFloatField;
    qryTipoContratoIDREGRAJUREXIBE: TFloatField;
    qryTipoContratoTCELEGENDACALC: TStringField;
    qryTipoContratoTCELEGENDAEXIBE: TStringField;
    qryRubricasIDPROVENTO: TFloatField;
    qryRubricasDESCRICAO: TStringField;
    qryRubricasCODPROVDESC: TStringField;
    MontaSelect: TMontaSelect;
    qryTmpDesc: TwwQuery;
    updTmpDesc: TUpdateSQL;
    qryTmpDescIDTMPDESC: TFloatField;
    qryTmpDescMESREFERENCIA: TStringField;
    qryTmpDescRECPAG: TStringField;
    qryTmpDescIDPESSOA: TFloatField;
    qryTmpDescFLGTIPODESC: TStringField;
    qryTmpDescVALOR: TFloatField;
    qryTmpDescIDTITULAR: TFloatField;
    qryTmpDescIDDESCONTO: TFloatField;
    qryTmpDescMESCOBRANCA: TStringField;
    qryTmpDescIDPESSJUR: TFloatField;
    qryTmpDescIDPROVENTO: TFloatField;
    qryTmpDescIDPLANOPREV: TFloatField;
    qryTmpDescFLGDESCONTO: TFloatField;
    qryTmpDescCODPROVDESC: TStringField;
    qryTmpDescFLGDESCFOLHA: TStringField;
    qryTmpDescDATAREFERENCIA: TDateTimeField;
    qryTmpDescDESCRICAO: TStringField;
    qryTmpDescREFERENCIA: TStringField;
    qryTmpDescSITENVIO: TStringField;
    qryTmpDescVALORINFO: TFloatField;
    qryTmpDescDATACOBRANCA: TDateTimeField;
    qryTmpDescIDLOTE: TFloatField;
    molContratoEmptmo: TmolContratoEmptmo;
    edtDataRef: TwwDBDateTimePicker;
    Label1: TLabel;
    qryCalculoIDCONTRATOEMPTMO: TFloatField;
    qryCalculoIDPATRO: TFloatField;
    qryCalculoIDPLANOPREV: TFloatField;
    qryCalculoIDPESSOA: TFloatField;
    qryCalculoIDBENEF: TFloatField;
    qryCalculoNOME_TITULAR: TStringField;
    qryCalculoNOME_BENEF: TStringField;
    qryCalculoFLGINTERNO: TStringField;
    qryCalculoTOTAL_DEV: TFloatField;

    //Pendência 23554 - 17/10/2006 - Marchetti
    qryCalculoINSCRICAONUMERO: TFloatField;
    qryCalculoMATRICULA: TStringField;
    qryTmpDescINSCRICAONUMERO: TFloatField;
    qryTmpDescMATRICULA: TStringField;
    grbEnvio: TGroupBox;
    chkFolhaBenef: TCheckBox;
    chkFolhaPatro: TCheckBox;
    rdgTipoProc: TRadioGroup;
    qryDesfazerCalculo: TwwQuery;
    qryDesfazerCalculoIDCONTRATOEMPTMO: TFloatField;
    qryDesfazerCalculoIDPATRO: TFloatField;
    qryDesfazerCalculoIDPLANOPREV: TFloatField;
    qryDesfazerCalculoIDPESSOA: TFloatField;
    qryDesfazerCalculoIDBENEF: TFloatField;
    qryDesfazerCalculoIDTMPDESC: TFloatField;
    //Fim Pendência 23554

    procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
    procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
    procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
    procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure btnContinuarClick(Sender: TObject);


  private { Private declarations }

    iIDBenef            : Integer;

    procedure AbreQueries;
    function  VerificaPreenchimento: Boolean;
    procedure SelecionaParticipantes(iParticipante : Integer);
    procedure SelecionaDadosDesfazerCalculo;
    procedure ProcessaCalculo;
    procedure ProcessaDesfazerCalculo;


  public  { Public declarations }


  end;




var
  frmCalculaValorDevido: TfrmCalculaValorDevido;





implementation
{$R *.DFM}
uses
   USistema, UDataBase, UMensErro, UFuncoesEmptmo, FProgressoDuplo, FProgresso, dBaseDados,
   uModulo, uVerificaPreenchimento, DLookEmptmo, dMS, uIntegraEmptmo, DEmptmo, uDiasUteis,
   UCalcEmptmo;


procedure TfrmCalculaValorDevido.AbreQueries;
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

   qryRubricas.Open;
end;



procedure TfrmCalculaValorDevido.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
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



procedure TfrmCalculaValorDevido.FormShow(Sender: TObject);
begin
   inherited;
   ParametrosSistema;

   edtDataRef.Date := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));
   
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

   iIDBenef := -1;

   //Pendência 23554 - 17/10/2006 - Marchetti
   LimpaParametros(qryRubricas);
   qryRubricas.Open;
   //Fim Pendência 23554
end;



procedure TfrmCalculaValorDevido.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmCalculaValorDevido.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmCalculaValorDevido.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmCalculaValorDevido.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



function TfrmCalculaValorDevido.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if DBspnAno.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAno);

      if edtDataRef.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a data a considerar débitos!', edtDataRef);

      if DBcboTipoContrato.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato!', DBcboTipoContrato);

      if cboRubrica.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Rubrica!', cboRubrica);

      if (not chkFolhaPatro.Checked) and (not chkFolhaBenef.Checked) then
         raise EValidacao.CreateVal('É necessário indicar pelo ao menos um tipo de Folha a ser gerada!', chkFolhaPatro);

   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;


procedure TfrmCalculaValorDevido.DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if not dtmLookEmptmo.qryLookTipoContrIDPROVENTOVLDEV.IsNUll then
      cboRubrica.LookupValue := dtmLookEmptmo.qryLookTipoContrIDPROVENTOVLDEV.AsString;
end;

procedure TfrmCalculaValorDevido.btnContinuarClick(Sender: TObject);
var
   i        : Integer;
   sMsgErro : String;
   dDataIni : TDateTime;
begin
   if not(VerificaPreenchimento) then Exit;
   inherited;

   try
      DesabilitaBotoes;

      (* limpa os memos de resultado e erro *)
      memResult.Clear;
      memErro.Clear;

      dDataIni := Now;

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
      memResult.Lines.Add(' ');

      if rdgTipoProc.ItemIndex = 0 then
      begin

         Total.Caption  := 'Total de Participantes gerados: ';
         TotalN.Caption := 'Total de Participantes NÃO gerados: ';

      LimpaParametros(qryTipoContrato);
      qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmLookEmptmo.qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger;
      qryTipoContrato.Open;

      Repaint;
      SelecionaParticipantes(iIDBenef);
      Repaint;

      ProcessaCalculo;

      end
      else
      begin
         Total.Caption  := 'Total de Participantes desfeitos: ';
         TotalN.Caption := 'Total de Participantes NÃO desfeitos: ';

         if MsgDlg('Deseja realmente desfazer o cálculo?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNO then
         begin
            Repaint;
            Exit;
         end;

         Repaint;
         SelecionaDadosDesfazerCalculo;
         Repaint;
         
         ProcessaDesfazerCalculo;

      end;
   finally
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Final do Processo      : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      memResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));
      
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // memErro.Lines.SaveToFile(Sistema.TempDir + 'EP - ErroCalculoValorDevido ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
      memErro.Lines.SaveToFile(ftempregra + '\' + 'EP - ErroCalculoValorDevido ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
   // memResult.Lines.SaveToFile(Sistema.TempDir + 'EP - ResultCalculoValorDevido ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
      memResult.Lines.SaveToFile(ftempregra + '\' + 'EP - ResultCalculoValorDevido ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');

      HabilitaBotoes;
   end;

end;


procedure TfrmCalculaValorDevido.SelecionaParticipantes(iParticipante: Integer);
var
   sSQL  : String;
   sAno  : String;
   sMes  : String;
   sData : String;
begin

   sAno := IntToStr(Trunc(DBspnAno.Value));
   sMes := IntToStr(cboMes.ItemIndex + 1);
   if Length(sMes) = 1 then sMes := '0' + sMes;

   sData := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataRef.Date));

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +
   '   CON.IDPATRO, '                                                                        + #13 +
   '   CON.IDPLANOPREV, '                                                                    + #13 +
   '   CON.IDPESSOA, '                                                                       + #13 +
   '   CON.IDBENEF, '                                                                        + #13 +
   '   PTI.NOME AS NOME_TITULAR, '                                                           + #13 +
   '   PBF.NOME AS NOME_BENEF, '                                                             + #13 +
   '   SIT.FLGINTERNO, '                                                                     + #13 +

   //Pendência 23554 - 17/10/2006 - Marchetti
   '   PPP.INSCRICAONUMERO, '                                                                + #13 +
   '   ELP.MATRICULA, '                                                                      + #13 +
   //Fim Pendência 23554

   '   (NVL(SLD.HMESALDODEV, 0) + (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0))) AS TOTAL_DEV '    + #13 +
   'FROM '                                                                                   + #13 +
   '   PESSOA          PBF, '                                                                + #13 +
   '   PESSOA          PTI, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   DEPENTIT        DEP, '                                                                + #13 +
   '   ELEGPATRO       ELP, '                                                                + #13 +
   '   PARTPREVPLAN    PPP, '                                                                + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                + #13 +
   '   TIPOEMPTMO      TEP, '                                                                + #13 +
   '   PATRO           PTR, '                                                                + #13 +
   '   PLANPREV        PLP, '                                                                + #13 +
   '   SITPART         SIT, '                                                                + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                            + #13 +
   '      HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, HME.HMENUMPARCELAS '         + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                           + #13 +
   '      ( '                                                                                + #13 +
   '      SELECT '                                                                           + #13 +
   '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                 + #13 +
   '      FROM '                                                                             + #13 +
   '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '                                        + #13 +
   '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE '                       + #13 +
   '      WHERE '                                                                            + #13 +
   '             CON.FLGSITUACAO         <> ''C'' '                                          + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '         AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '         AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '             + #13 +
   '         AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '             + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '         AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   sSQL := sSQL +
   '         AND ITC.ITCTRATASALDODEV    <> 0 '                                              + #13 +
   '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) ) '             + #13 +
   '         AND ( HME.HMEDATAATUALIZA    <= '                                               + #13 +
   '               ( '                                                                       + #13 +
   '               SELECT '                                                                  + #13 +
   '                  DECODE(MAX(H.HMEDATAATUALIZA), NULL, TO_DATE(' + sData + ', ''DD/MM/YYYY''), '  + #13 +
   '                                                       MAX(H.HMEDATAATUALIZA)) '                  + #13 +
   '               FROM '                                                                    + #13 +
   '                  HISTMOVEMPTMO   H, '                                                   + #13 +
   '                  CONTRATOEMPTMO  C, '                                                   + #13 +
   '                  ITEMXTIPOCONTR  IT '                                                   + #13 +
   '               WHERE '                                                                   + #13 +
   '                      C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO '                     + #13 +
   '                  AND H.HMEDATAATUALIZA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '   + #13 +
   '                  AND IT.ITCTRATASALDODEV  <> 0 '                                        + #13 +
   '                  AND HME.HMEANOCOMPETENCIA = ' + sAno                                   + #13 +
   '                  AND HME.HMEMESCOMPETENCIA = ' + sMes                                   + #13 +
   '                  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNADO IS NULL ) '            + #13 +
   '                  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                       + #13 +
   '                  AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPTMO '                     + #13 +
   '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                          + #13;

   sSQL := sSQL +
   '               ) '                                                                       + #13 +
   '             ) '                                                                         + #13 +

   '         AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) ) <= ' + QuotedStr(sAno + sMes) + #13 +

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
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                             + #13;

   sSQL := sSQL +
   '   ) SLD, '                                                                              + #13 +
   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLR_DEV '                 + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          CON.FLGSITUACAO       <> ''C'' '                                               + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                     + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                  + #13 +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)   + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13 +
   '      AND HME.HMESEQCOBRANCA     = 1 '                                                   + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '             + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13 +
   '   ) PAR_DEV, '                                                                          + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      CON.IDCONTRATOEMPTMO, '                                                            + #13 +

   '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '                                     + #13 +
   '                                DECODE(FLGABONADO, 1, NVL(HME.HMEVLRPREVISTO, 0), '               + #13 +
   '                                                      NVL(HME.HMEVLREFETIVO, 0)))) AS VLR_PAG '   + #13 +

   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '                                            + #13 +
   '   WHERE '                                                                               + #13 +
   '          CON.FLGSITUACAO       <> ''C'' '                                               + #13;

   // Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '      AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                     + #13;

   // filtro por Plano e Patrocinadora
   sSQL := sSQL +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                  + #13 +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '      AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   sSQL := sSQL +
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7) '                                 + #13 +
   '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) '                      + #13 +
   '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                  + #13 +

   '      AND HME.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '             + #13 +

   '      AND ( '                                                                                              + #13 +
   '          (HME.HMEDATAEFETIVA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'')) '                              + #13 +
   '       OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '       OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO_DATE(' + sData + ',''DD/MM/YYYY'')) ) '   + #13 +
   '          ) '                                                                                              + #13 +

   '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '                              + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      CON.IDCONTRATOEMPTMO '                                                             + #13 +
   '   ) PAR_PAG '                                                                           + #13 +

   'WHERE '                                                                                  + #13 +

   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +

   // filtro por Patrocinadora
   '   AND PTR.IDPESSOA             IN (' + molListaPatro.PegaPatro + ') '                   + #13 +

   // filtro por Plano
   '   AND PLP.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                   + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)             + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13 +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;

   // filtro por Tipo de Contrato 
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;

   sSQL := sSQL +
   '   AND ( (SLD.HMESALDODEV       > 0) OR ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0) ) '  + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13;

   sSQL := sSQL +
   '   AND ( ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0) ) '                  + #13;

   sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO ) '                               + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) ) '                        + #13 +
   '   AND ( CON.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) ) '                        + #13 +
   '   AND ( CON.IDPESSOA           = PTI.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPESSOA           = ELP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPATRO            = PTR.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPATRO            = PPP.IDPESSJUR ) '                                      + #13 +
   '   AND ( ELP.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( ELP.IDPESSJUR          = PPP.IDPESSJUR ) '                                      + #13 +
   '   AND ( PTR.IDPESSOA           = ELP.IDPESSJUR ) '                                      + #13 +
   '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '                                       + #13 +
   '   AND ( PTI.IDPESSOA           = ELP.IDPESSOA ) '                                       + #13 +
   '   AND ( PTI.IDPESSOA           = PPP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPLANOPREV        = PLP.IDPLANOPREV ) '                                    + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO ) '                                   + #13 +
   '   AND ( ELP.IDPESSOA           = DEP.IDTITULAR ) '                                      + #13 +
   '   AND ( CON.IDBENEF            = DEP.IDPESSOA ) '                                       + #13 +
   '   AND ( CON.IDPESSOA           = DEP.IDTITULAR ) '                                      + #13 +
   '   AND ( PPP.IDSITPART          = SIT.IDSITPART ) '                                      + #13 +
   '   AND ( PPP.FLGDESATIVADO      = 0 )'                                                   + #13 +
   '   AND ( CON.FLGFORMAREC        = ''F'' ) '                                              + #13 +
   '   AND NOT EXISTS (SELECT 1 FROM TMPDESC T WHERE T.IDMODULO = 15 AND T.MESCOBRANCA = ' + QuotedStr(sAno + '/' + sMes) + ' AND T.IDDESCONTO = CON.IDCONTRATOEMPTMO AND T.IDPROVENTO = ' + cboRubrica.LookupValue + ')' +  #13;

   // Marchetti - Pendencia 23547
   if      (chkFolhaPatro.Checked) and (chkFolhaBenef.Checked) then sSQL := sSQL
   else if chkFolhaPatro.Checked then sSQL := sSQL + '   AND  ( SIT.FLGINTERNO = ''AT'' )'   + #13
   else if chkFolhaBenef.Checked then sSQL := sSQL + '   AND  ( SIT.FLGINTERNO <> ''AT'' )'  + #13;
   // Fim Marchetti - Pendencia 23547

   sSQL := sSQL +
   'ORDER BY CON.IDPATRO, CON.IDCONTRATOEMPTMO'                                              + #13;

   qryCalculo.Sql.Text := sSQL;
// Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
// qryCalculo.Sql.SaveToFile(Sistema.TempDir + 'EP-CalculaValorDevido.txt');
   qryCalculo.Sql.SaveToFile(ftempregra + '\' + 'EP-CalculaValorDevido.txt');
   qryCalculo.Open;
end;



procedure TfrmCalculaValorDevido.ProcessaCalculo;
var
   iNumParcelas        : Integer;
   sErro               : String;
   dDataFinalBeneficio : TDateTime;
   dDataRef            : TDateTime;
   iErro, iAcerto      : Integer;
   iIDPessoa           : Integer;
   fTxJuros            : Extended;
   rDadosTmpDesc       : TDadosTmpDesc;
   sAno                : String;
   sMes                : String;
   iLote               : Integer;
   iPatro              : Integer;
   iTotalReg           : Integer;
   fTotalPatro         : Extended;
   iContador           : Integer;
   sLinha              : String;
   iTotalRegistro      : Integer;
   iTotalRegTMP        : Integer;
begin

   sAno := IntToStr(Trunc(DBspnAno.Value));
   sMes := IntToStr(cboMes.ItemIndex + 1);
   if Length(sMes) = 1 then sMes := '0' + sMes;

   iErro   := 0;
   iAcerto := 0;

   qryCalculo.First;

   iTotalRegistro := 0;

   if qryCalculo.IsEmpty then
   begin
      memErro.Lines.Add('Não foram encontrados contratos que atendam ao filtro informado.');
      Inc(iErro);
   end;

   frmProgressoDuplo.MostraFormProgressoDuplo('Calculando Valor Devido de Empréstimo...',
                                              'Gerando dados para a Folha...',
                                              0,
                                              0,
                                              qryCalculo.RecordCount,
                                              0,
                                              True,
                                              True);


   while not qryCalculo.eof do
   begin

      iPatro        := qryCalculo.FieldByName('IDPATRO').AsInteger;
      iLote         := LeUltRegistro(nil, 'CTRLINTERFACE');
      iTotalReg     := 0;
      iTotalRegTMP  := 0;
      fTotalPatro   := 0;

      qryTmpDesc.Close;
      qryTmpDesc.Open;

      try

         while (iPatro = qryCalculo.FieldByName('IDPATRO').AsInteger) and
               (not qryCalculo.eof) do
         begin

            if frmProgressoDuplo.Cancelou then
            begin
               Repaint;
               Application.ProcessMessages;

               // Verifica se abortou processo
               if MsgDlg('Deseja realmente interromper o processamento?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               begin
                  Repaint;

                  Exit;
               end;
               Repaint;
            end;
            Repaint;

            Inc(iTotalRegistro);
            frmProgressoDuplo.AndaFormProgressoDuplo(iTotalRegistro,0);


            sErro := '';

            iIDPessoa := qryCalculo.FieldByName('IDPESSOA').AsInteger;
            iIDBenef  := qryCalculo.FieldByName('IDBENEF').AsInteger;

            Inc(iTotalReg);

            //Pendência 23554 - 17/10/2006 - Marchetti
            LimpaParametros(qryRubricas);
            qryRubricas.ParamByName('PIDPATRO').AsInteger   := qryCalculo.FieldByName('IDPATRO').AsInteger;
            qryRubricas.ParamByName('PIDRUBRICA').AsInteger := dtmLookEmptmo.qryLookTipoContrIDPROVENTOVLDEV.AsInteger;
            qryRubricas.Open;
            //Fim Pendência 23554

            qryTmpDesc.Insert;
            qryTmpDescIDTMPDesc.AsFloat         := LeUltRegistro(nil, 'TMPDESC');
            qryTmpDescMesReferencia.AsString    := sAno + sMes;
            qryTmpDescRecPag.AsString           := 'R';
            qryTmpDescIDPessoa.AsInteger        := iIDBenef;
            qryTmpDescFlgTipoDesc.AsString      := 'E';
            qryTmpDescValor.AsFloat             := 0;
            qryTmpDescIDTitular.AsInteger       := iIDPessoa;
            qryTmpDescIDDesconto.AsInteger      := qryCalculo.FieldByName('IDCONTRATOEMPTMO').AsInteger;
            qryTmpDescMesCobranca.AsString      := sAno + sMes;
            qryTmpDescIDPessjur.AsInteger       := qryCalculo.FieldByName('IDPATRO').AsInteger;

            //Pendência 23554 - 17/10/2006 - Marchetti
            qryTmpDescIDProvento.AsInteger      := qryRubricasIDPROVENTO.AsInteger;
            qryTmpDescIDPlanoprev.AsInteger     := qryCalculo.FieldByName('IDPLANOPREV').AsInteger;
            qryTmpDescFlgDesconto.AsInteger     := 2;
            qryTmpDescCodProvDesc.AsString      := qryRubricasCODPROVDESC.AsString;
            qryTmpDescMATRICULA.AsString        := qryCalculo.FieldByName('MATRICULA').AsString;
            qryTmpDescINSCRICAONUMERO.AsInteger := qryCalculo.FieldByName('INSCRICAONUMERO').AsInteger;
            //Fim Pendência 23554

            if qryCalculo.FieldByName('FLGINTERNO').AsString = 'AT' then
               qryTmpDescFlgDescFolha.AsString  := 'P'
            else
               qryTmpDescFlgDescFolha.AsString := 'B';

            dDataRef                      := StrToDate('01/' + sMes + '/' + sAno);

            qryTmpDescDataReferencia.AsDateTime  := dDataRef;
            qryTmpDescDescricao.AsString         := 'Valor Devido de Empréstimo';
            qryTmpDescReferencia.AsString        := '***';
            qryTmpDescSitEnvio.AsString          := '0';
            qryTmpDescValorInfo.AsFloat          := qryCalculo.FieldByName('TOTAL_DEV').AsFloat;

            dDataRef := CalcEmptmo.BuscaData('N', // Normal
                                             'F', // Tipo de Cobrança
                                             qryCalculo.FieldByName('FLGINTERNO').AsString,
                                             qryCalculo.FieldByName('IDPATRO').AsInteger,
                                             qryCalculo.FieldByName('IDPLANOPREV').AsInteger,
                                             2, // Parcelas, isto é mais de 1 parcela
                                             dDataRef
                                            );


            qryTmpDescDataCobranca.AsDateTime := dDataRef;
            qryTmpDescIDLote.AsInteger        := iLote;
            qryTmpDesc.Post;

            fTotalPatro := fTotalPatro + qryCalculo.FieldByName('TOTAL_DEV').AsFloat;

            sLinha := 'Contrato: ' + qryCalculo.FieldByName('IDCONTRATOEMPTMO').AsString + ' - Valor Devido: ' + FormatFloat('###,##0.00',qryCalculo.FieldByName('TOTAL_DEV').AsFloat);
            memResult.Lines.Add( sLinha );

            Inc(iAcerto);
            qryCalculo.Next;
         end;

         if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

         if not(IntegraEmptmo.InsertCtrlInterface(iLote, iTotalReg, iPatro, sAno + '/' + sMes, fTotalPatro)) then
         begin
            if (dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
            sErro := sErro + 'ERRO ao inserir na CTRLINTERFACE - ' + IntToStr(iPatro);
            Raise Exception.Create(sErro);
         end;
         if (dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;

         qryTmpDesc.First;
         frmProgressoDuplo.Max2 := qryTmpDesc.RecordCount;
         frmProgressoDuplo.Update;
         
         while not qryTmpDesc.eof do
         begin
            Inc(iTotalRegTMP);
            frmProgressoDuplo.AndaFormProgressoDuplo(iTotalRegistro,iTotalRegTMP);

            rDadosTmpDesc.IDTMPDESC          := qryTmpDescIDTMPDesc.AsFloat;
            rDadosTmpDesc.MesReferencia      := qryTmpDescMesReferencia.AsString;
            rDadosTmpDesc.RecPag             := qryTmpDescRecPag.AsString;
            rDadosTmpDesc.IDPessoa           := qryTmpDescIDPessoa.AsInteger;
            rDadosTmpDesc.FlgTipoDesc        := qryTmpDescFlgTipoDesc.AsString;
            rDadosTmpDesc.Valor              := qryTmpDescValor.AsFloat;
            rDadosTmpDesc.IDTitular          := qryTmpDescIDTitular.AsInteger;
            rDadosTmpDesc.IDDesconto         := qryTmpDescIDDesconto.AsInteger;
            rDadosTmpDesc.MesCobranca        := qryTmpDescMesCobranca.AsString;
            rDadosTmpDesc.IDPessjur          := qryTmpDescIDPessjur.AsInteger;
            rDadosTmpDesc.IDProvento         := qryTmpDescIDProvento.AsInteger;
            rDadosTmpDesc.IDPlanoprev        := qryTmpDescIDPlanoprev.AsInteger;
            rDadosTmpDesc.FlgDesconto        := qryTmpDescFlgDesconto.AsInteger;
            rDadosTmpDesc.CodProvDesc        := qryTmpDescCodProvDesc.AsString;
            rDadosTmpDesc.FlgDescFolha       := qryTmpDescFlgDescFolha.AsString;
            rDadosTmpDesc.DataReferencia     := qryTmpDescDataReferencia.AsDateTime;
            rDadosTmpDesc.Descricao          := qryTmpDescDescricao.AsString;
            rDadosTmpDesc.Referencia         := qryTmpDescReferencia.AsString;
            rDadosTmpDesc.SitEnvio           := qryTmpDescSitEnvio.AsString;
            rDadosTmpDesc.ValorInfo          := qryTmpDescValorInfo.AsFloat;
            rDadosTmpDesc.DataCobranca       := qryTmpDescDataCobranca.AsDateTime;
            rDadosTmpDesc.IDLote             := qryTmpDescIDLote.AsInteger;

            //Pendência 23554 - 17/10/2006 - Marchetti
            rDadosTmpDesc.InscricaoNumero    := qryTmpDescINSCRICAONUMERO.AsInteger;
            rDadosTmpDesc.Matricula          := qryTmpDescMATRICULA.AsString;
            //Fim Pendência 23554

            if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

            if not(IntegraEmptmo.InsertTmpDesc(rDadosTmpDesc,
                                               rDadosTmpDesc.IDTMPDesc,
                                               rDadosTmpDesc.Valor)) then
            begin
               if (dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
               sErro := sErro + 'ERRO ao inserir na TMPDESC - ' + IntToStr(iPatro);
               Raise Exception.Create(sErro);
            end;
            if (dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;
            
            qryTmpDesc.Next;
         end;
         qryTmpDesc.CancelUpdates;
      except
         if (dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
         memErro.Lines.Add(sErro);
         Inc(iErro);
         qryCalculo.Next;
      end;
   end;

   frmProgressoDuplo.EscondeFormProgressoDuplo;

   edtNumResult.Value := iAcerto;
   edtNumErro.Value   := iErro;
   Repaint;
end;



procedure TfrmCalculaValorDevido.ProcessaDesfazerCalculo;
var
   sErro               : String;
   iErro, iAcerto      : Integer;
   sLinha              : String;
   iTotalRegistro      : Integer;
   iPatro              : Integer;
begin
   iErro   := 0;
   iAcerto := 0;

   qryDesfazerCalculo.First;

   iTotalRegistro := 0;

   if qryDesfazerCalculo.IsEmpty then
   begin
      memErro.Lines.Add('Não foram encontrados contratos que atendam ao filtro informado.');
      Inc(iErro);
   end;

   frmProgresso.MostraFormProgresso('Desfazendo Cálculo do Valor Devido de Empréstimo...',
                                    True,
                                    True,
                                    True,
                                    0,
                                    qryDesfazerCalculo.RecordCount);

   while not qryDesfazerCalculo.eof do
   begin

      iPatro        := qryDesfazerCalculo.FieldByName('IDPATRO').AsInteger;

      while (iPatro = qryDesfazerCalculo.FieldByName('IDPATRO').AsInteger) and
            (not qryDesfazerCalculo.eof) do
      begin

         if frmProgresso.Cancelou then
         begin
            Repaint;
            Application.ProcessMessages;

            // Verifica se abortou processo
            if MsgDlg('Deseja realmente interromper o processamento?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               Repaint;

               Exit;
            end;
            Repaint;
         end;
         Repaint;

         Inc(iTotalRegistro);
         frmProgresso.AndaFormProgresso(iTotalRegistro);


         sErro := '';

         if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

         if IntegraEmptmo.ExcluiTMPDESCPorTmp(qryDesfazercalculo.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                              qryDesfazercalculo.FieldByName('IDTMPDESC').AsFloat,
                                              sErro,
                                              False) < 0 then
         begin
            if (dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
            Inc(iErro);
            sLinha := 'Contrato: ' + qryDesfazerCalculo.FieldByName('IDCONTRATOEMPTMO').AsString + ' - ' + sErro;
            memErro.Lines.Add(sLinha);
         end
         else
         begin
            if (dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;
            Inc(iAcerto);
            sLinha := 'Contrato: ' + qryDesfazerCalculo.FieldByName('IDCONTRATOEMPTMO').AsString + ' - Desfeito';
            memResult.Lines.Add( sLinha );
         end;

         qryDesfazerCalculo.Next;
      end;
   end;

   frmProgresso.EscondeFormProgresso;

   edtNumResult.Value := iAcerto;
   edtNumErro.Value   := iErro;
   Repaint;
end;



procedure TfrmCalculaValorDevido.SelecionaDadosDesfazerCalculo;
var
   sSQL        : String;
   sTipoFolha  : String;
   sAno        : String;
   sMes        : String;
begin

   sAno := IntToStr(Trunc(DBspnAno.Value));
   sMes := IntToStr(cboMes.ItemIndex + 1);
   if Length(sMes) = 1 then sMes := '0' + sMes;

   sTipoFolha     := '';

   if chkFolhaPatro.Checked then sTipoFolha := QuotedStr('P');

   if chkFolhaBenef.Checked then
   begin
      if sTipoFolha <> '' then
      begin
         sTipoFolha := sTipoFolha + ',' + QuotedStr('B')
      end else begin
         sTipoFolha := QuotedStr('B');
      end;
   end;

   sSQL :=
   'SELECT'                                                                                                     + #13 +
   '   CON.IDCONTRATOEMPTMO,'                                                                                   + #13 +
   '   CON.IDPATRO,'                                                                                            + #13 +
   '   CON.IDPLANOPREV,'                                                                                        + #13 +
   '   CON.IDPESSOA,'                                                                                           + #13 +
   '   CON.IDBENEF,'                                                                                            + #13 +
   '   TMP.IDTMPDESC'                                                                                           + #13 +
   'FROM'                                                                                                       + #13 +
   '   CONTRATOEMPTMO  CON,'                                                                                    + #13 +
   '   TIPOCONTREMPTMO TCE,'                                                                                    + #13 +
   '   TIPOEMPTMO      TEP,'                                                                                    + #13 +
   '   TMPDESC         TMP,'                                                                                    + #13 +
   '   PROVDESC        P'                                                                                       + #13 +

   'WHERE'                                                                                                      + #13 +

   // filtro por Empresa Proprietátia
   '       TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                                           + #13 +

   // filtro por Patrocinadora
   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                                      + #13 +

   // filtro por Plano
   '   AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                                      + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)                       + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                                           + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                                         + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' )'                                                                 + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'                                                  + #13 +
   '   AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO )'                                                       + #13 +
   '   AND ( TMP.IDMODULO           = 15 )'                                                                     + #13 +
   '   AND ( TMP.IDDESCONTO         = CON.IDCONTRATOEMPTMO )'                                                   + #13 +
   '   AND ( TMP.IDPROVENTO         = P.IDPROVENTO )'                                                           + #13 +
   '   AND TMP.IDPROVENTO           = ' + dtmLookEmptmo.qryLookTipoContrIDPROVENTOVLDEV.AsString                + #13 +
   '   AND ( TMP.MESCOBRANCA        = ' + QuotedStr(sAno + '/' + sMes) + ' )'                                   + #13; 

   if sTipoFolha <> '' then sSQL := sSQL +
   '   AND ( TMP.FLGDESCFOLHA       IN (' + sTipoFolha + ') ) '                                                 + #13;

   sSQL := sSQL +
   'ORDER BY CON.IDPATRO, CON.IDCONTRATOEMPTMO'                                                                 + #13;

   qryDesfazerCalculo.Sql.Text := sSQL;
// Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
// qryDesfazerCalculo.Sql.SaveToFile(Sistema.TempDir + 'EP-DesfazerCalculaValorDevido.txt');
   qryDesfazerCalculo.Sql.SaveToFile(ftempregra + '\' + 'EP-DesfazerCalculaValorDevido.txt');
   qryDesfazerCalculo.Open;

end;



end.
