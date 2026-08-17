{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 28/11/2003
Autor     : André Pontes
Pendencia :
Descrição : Na concatenação de Ano e Mês de competência foi incluído o TO_CHAR:
            AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) ||
                  (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) ) <= ' + ...
--------------------------------------------------------------------------------
Rotina    : FiltraRelatorio
Data      : 04/08/2003
Autor     : Marchetti
Pendência : 14432
Descrição : Colocado filtro por forma de cobrança
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelCartaCobrEP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, StdCtrls, Menus, ppBands, ppClass, ppProd, ppReport, Db,
   Wwdatsrc, ppEndUsr, ppComm, ppCache, ppDB, ppDBBDE, DBTables, Wwquery,
   IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
   fcButton, fcImgBtn, fcShapeBtn, MontaSelect, TB97Ctls,
   cmseldlg, wwidlg, Mask, wwdbedit, Wwdotdot,
   Wwdbcomb, wwdblook, Pptypes, Wwdbspin, ppPrvDlg, ppforms, CRel, TREdit,
   ppRelatv, ppDBPipe, mListaPlano, mListaPatro, mContratoEmptmo,
   wwdbdatetimepicker, ComCtrls;

const
   ArqCMCartaCobrEP = 'CartaCobrEP.tmp';

type
   TcfgRelCartaCobrEP = class(TcfgRel)
    pplConsulta: TppBDEPipeline;
      rptImprime: TppReport;
      RpImprimeHeaderBand1: TppHeaderBand;
      RpImprimeDetailBand1: TppDetailBand;
      RpImprimeFooterBand1: TppFooterBand;
      dsDados: TwwDataSource;
      ds: TwwDataSource;
      qryTemplate: TwwQuery;
      qryReports: TwwQuery;
      qryReportsNAME: TStringField;
      qryReportsIDREPORTS: TFloatField;
      qryReportsORIGEMCM: TFloatField;
      qryReportsTEMPLATE: TBlobField;
      qryTemplateIDCARTACOBRANCA: TFloatField;
      qryTemplateMODELOCARTA: TStringField;
      qryTemplateIDREPORTS: TFloatField;
      qryTemplateORIGEMCM: TFloatField;
      qryTemplateFLGTIPOCARTA: TStringField;
      qryAssunto: TwwQuery;
      qryDados: TwwQuery;
      qryDadosIDCONTRATOEMPTMO: TFloatField;
      qryDadosNOME_TITULAR: TStringField;
      qryDadosNOME_BENEF: TStringField;
      qryDadosSIT_PART: TStringField;
      qryDadosMATRICULA: TStringField;
      qryDadosMATRICULA_TIT: TStringField;
      qryDadosINSCRICAONUMERO: TFloatField;
      qryDadosLOGRADOURO: TStringField;
      qryDadosCIDADE: TStringField;
      qryDadosCODESTADO: TStringField;
      qryDadosNUMERO: TStringField;
      qryDadosCOMPLEMENTO: TStringField;
      qryDadosBAIRRO: TStringField;
      qryDadosCEP: TStringField;
      qryDadosHMEDATAATUALIZA: TDateTimeField;
      qryDadosHMESALDODEV: TFloatField;
      qryDadosHMEPARCELA: TFloatField;
      qryDadosHMENUMPARCELAS: TFloatField;
      qryDadosTCEDESCRICAO: TStringField;
      qryDadosDEVE: TFloatField;
      qryDadosTOTAL_DEV: TFloatField;
      qryDadosDATA_CARTA: TDateTimeField;
      Label2: TLabel;
      qryAssuntoIDASSUNTO: TFloatField;
      qryAssuntoIDTIPOPROCESSO: TFloatField;
      qryAssuntoIDGRUPOASSUNTO: TFloatField;
      qryAssuntoIDCONFIGRUBS: TFloatField;
      qryAssuntoNOME: TStringField;
      qryAssuntoIDPLANOPREV: TFloatField;
      qryTipoAtend: TwwQuery;
      qryTipoAtendIDTIPOATEND: TFloatField;
      qryTipoAtendNOME: TStringField;
      qryGeraAtend: TwwQuery;
      qryGeraAssuntoXAtend: TwwQuery;
      pgcControle: TPageControl;
      tbsSelecao: TTabSheet;
      tbsResult: TTabSheet;
      molContratoEmptmo: TmolContratoEmptmo;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      Panel1: TPanel;
      Label5: TLabel;
      edtDataRef: TwwDBDateTimePicker;
      DBcboSitPart: TwwDBLookupCombo;
      GroupBox1: TGroupBox;
      Label6: TLabel;
      Label7: TLabel;
      DBcboModeloCarta: TwwDBLookupCombo;
      memReports: TMemo;
      edtDataCarta: TwwDBDateTimePicker;
      GroupBox2: TGroupBox;
      Label8: TLabel;
      Label9: TLabel;
      DBcboTipoAtend: TwwDBLookupCombo;
      chkAtendimento: TCheckBox;
      DBcboAssunto: TwwDBLookupCombo;
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      chkParcelasAberto: TCheckBox;
      chkSaldoDevedor: TCheckBox;
      chkSaldoZERO: TCheckBox;
      Panel3: TPanel;
      memResult: TMemo;
      Panel2: TPanel;
      memErro: TMemo;
      qryDadosIDPESSOA: TFloatField;
      qryDadosIDBENEF: TFloatField;
      qryDadosIDPATRO: TFloatField;
    chkFolha: TCheckBox;
    chkFinanceiro: TCheckBox;
    chkParcMes: TCheckBox;

      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private  // Private declarations

      function VerificaPreenchimento: boolean;

      procedure FechaQueries; override;
      procedure AbreQueries;

      procedure FiltraRelatorio;

      procedure GeraAtendimento; 


   public   // Public declarations

   end;



var
  cfgRelCartaCobrEP: TcfgRelCartaCobrEP;


implementation
{$R *.DFM}
uses
   dBaseDados, uDataBase, uSistema, uMensErro, uModeloRelatCM, uVerificaPreenchimento,
   uModulo, uFuncoesEmptmo, dLookEmptmo, dMS, fProgresso;




procedure TcfgRelCartaCobrEP.GeraAtendimento;
var
   IDAtendimento : Int64;
begin
   // ----------------------------------------------------------------------------------------------

   // Inicia uma transação - só se não ouver transação iniciada
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   StartTransacao;

   // ----------------------------------------------------------------------------------------------

   try
      IDAtendimento := LeUltRegistro(nil, 'ATEND');

      with qryGeraAtend do
      begin
         LimpaParametros(qryGeraAtend);
         ParamByName('PIDATEND').AsInteger         := IDAtendimento;
         ParamByName('PIDTIPOATEND').AsInteger     := StrToInt(DBcboTipoAtend.LookupValue);
         ParamByName('PIDTITULAR').AsInteger       := qryDadosIDPESSOA.AsInteger;
         ParamByName('PIDBENEFICIARIO').AsInteger  := qryDadosIDBENEF.AsInteger;
         ParamByName('PIDPESSJUR').AsInteger       := qryDadosIDPATRO.AsInteger;
         ParamByName('PDATA').AsDateTime           := SysDate;
         ParamByName('PDATAINICIO').AsDateTime     := SysDate;
         ParamByName('PCODATENDENTE').AsInteger    := Sistema.IDUsuario;
         ParamByName('PCODATEND').AsInteger        := IDAtendimento;
         ParamByName('PSTATUS').AsString           := 'Pendente';
         ExecSQL;
      end;

      with qryGeraAssuntoXAtend do
      begin
         LimpaParametros(qryGeraAssuntoXAtend);
         ParamByName('PIDASSUNTOXATEND').AsInteger := LeUltRegistro(nil, 'ASSUNTOXATEND');
         ParamByName('PIDASSUNTO').AsInteger       := StrToInt(DBcboAssunto.LookupValue);
         ParamByName('PIDATEND').AsInteger         := IDAtendimento;
         ExecSQL;
      end;

      CommitTransacao;

      memResult.Lines.Add(CompletaInicio(FloatToStr(qryDadosIDCONTRATOEMPTMO.AsFloat), ' ', 12) +
                          ' ' + qryDadosNOME_BENEF.AsString);
   except
      RollbackTransacao;

      memErro.Lines.Add(CompletaInicio(FloatToStr(qryDadosIDCONTRATOEMPTMO.AsFloat), ' ', 12) +
                        ' ' + qryDadosNOME_BENEF.AsString);
   end;
end;



procedure TcfgRelCartaCobrEP.AbreQueries;
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

   qryAssunto.Open;
   qryAssunto.First;
   DBcboAssunto.LookupValue      := IntToStr(qryAssuntoIDASSUNTO.AsInteger);

   qryTipoAtend.Open;
   qryTipoAtend.First;
   DBcboTipoAtend.LookupValue    := IntToStr(qryTipoAtendIDTIPOATEND.AsInteger);

   qryTemplate.Open;
   qryTemplate.First;
   DBcboModeloCarta.LookupValue  := IntToStr(qryTemplate.FieldByName('IDCARTACOBRANCA').AsInteger);
end;





function TcfgRelCartaCobrEP.VerificaPreenchimento: boolean;
begin
	Result := False;

	try
      if length(trim(edtDataRef.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Referência', edtDataRef);

      if length(trim(edtDataCarta.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Carta', edtDataCarta);

      if DBcboModeloCarta.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Modelo de Carta!', DBcboModeloCarta);

      if chkAtendimento.Checked then
      begin
         if DBcboTipoAtend.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Atendimento!', DBcboTipoAtend);

         if DBcboAssunto.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar o Assunto!', DBcboAssunto);

      end;

	except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TcfgRelCartaCobrEP.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do
   begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then
      begin
         TwwQuery(Components[i]).Close;
      end;
   end;
end;



procedure TcfgRelCartaCobrEP.FiltraRelatorio;
var
   sSQL        : String;
   sMes        : String;
   sAno        : String;
   sData       : String;
   sDataCarta  : String;
   sForma      : String;
begin
   sData       := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataRef.Date));
   sDataCarta  := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataCarta.Date));

   sAno  := FormatDateTime('YYYY', edtDataRef.Date);
   sMes  := FormatDateTime('MM', edtDataRef.Date);

   sForma := '';

   if chkFolha.Checked then sForma := sForma + QuotedStr('F');

   if chkFinanceiro.Checked then
   begin
      if sForma <> '' then
      begin
         sForma := sForma + ',' + QuotedStr('C')
      end else begin
         sForma := QuotedStr('C');
      end;
   end;


   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +
   '   PTI.NOME AS NOME_TITULAR, '                                                           + #13 +
   '   PBF.NOME AS NOME_BENEF, '                                                             + #13 +
   '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SIT_PART, '      + #13 +
   '   DEP.MATRICULA AS MATRICULA, '                                                         + #13 +
   '   ELP.MATRICULA AS MATRICULA_TIT, '                                                     + #13 +

   '   CON.IDPESSOA, '                                                                       + #13 +
   '   CON.IDBENEF, '                                                                        + #13 +
   '   CON.IDPATRO, '                                                                        + #13 +

   '   PPP.INSCRICAONUMERO, '                                                                + #13 +

   '   TO_DATE(' + sDataCarta + ', ''DD/MM/YYYY'') AS DATA_CARTA, '                          + #13 +

   '   EDP.LOGRADOURO, '                                                                     + #13 +
   '   CID.NOME AS CIDADE, '                                                                 + #13 +
   '   EST.CODESTADO, '                                                                      + #13 +
   '   EDP.NUMERO, '                                                                         + #13 +
   '   EDP.COMPLEMENTO, '                                                                    + #13 +
   '   EDP.BAIRRO, '                                                                         + #13 +
   '   EDP.CEP, '                                                                            + #13 +

   '   SLD.HMEDATAATUALIZA, SLD.HMESALDODEV, SLD.HMEPARCELA, SLD.HMENUMPARCELAS, '           + #13 +
   '   TCE.TCEDESCRICAO, '                                                                   + #13 +
   '   (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEVE, '                        + #13 +
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
   '   ENDPESS         EDP, '                                                                + #13 +
   '   CIDADES         CID, '                                                                + #13 +
   '   ESTADO          EST, '                                                                + #13 +

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

   if sForma <> '' then sSQL := sSQL +
   '         AND HME.HMEFORMACOBRANCA    IN (' + sForma + ') '                               + #13;

   // filtro por Plano e Patrocinadora
   sSql := sSql +
   '         AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '             + #13 +
   '         AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '             + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '         AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   sSql := sSql +
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
   '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO '                          + #13 +
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
   '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '                             + #13 +
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
   sSql := sSql +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                  + #13 +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)   + #13;

   sSql := sSql +
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7) '                                    + #13 +
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
   sSql := sSql +
   '      AND CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') '                  + #13 +
   '      AND CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') '                  + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '      AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   sSql := sSql +
   '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7) '                                    + #13 +
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
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)             + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13 +
   '   AND TEP.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                        + #13;

   (* filtro por Tipo de Contrato *)
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13 +
   '   AND TCE.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                      + #13;

   // filtro por saldo devedor do contrato
   if chkSaldoZERO.Checked then
   begin
      sSQL := sSQL +
   '   AND ( SLD.HMESALDODEV        = 0 ) '                                                  + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   AND ( (SLD.HMESALDODEV       > 0) OR ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0) ) '  + #13;
   end;

   // ainda filtro por saldo devedor do contrato
   if chkSaldoZERO.Checked then sSQL := sSQL +
   '   AND ( SLD.HMESALDODEV        > 0 ) '                                                  + #13;

   (* filtro por SitPArt *)
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND SIT.IDSITPART            = ' + DBcboSitPart.LookupValue                           + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13;

   (* filtro por saldo parcelas vencidas em aberto *)
   if chkParcelasAberto.Checked then sSQL := sSQL +
   '   AND ( ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0) ) '                   + #13;

   sSQL := sSQL +
   '   AND EXISTS '                                                                          + #13 +
   '       ( '                                                                               + #13 +
   '       SELECT '                                                                          + #13 +
   '          HE.HMEDATAPREVISTA '                                                           + #13 +
   '       FROM '                                                                            + #13 +
   '          HISTMOVEMPTMO HE '                                                             + #13 +
   '       WHERE '                                                                           + #13 +
   '              HE.HMETIPOMOV        IN (1, 2, 3, 4, 7) '                                  + #13 +
   '          AND ( HE.HMECENTRALIZA   = 1 OR HE.HMEDESTACADO = 1 ) '                        + #13 +
   '          AND ( HE.FLGESTORNADO    = 0 OR HE.FLGESTORNADO IS NULL ) '                    + #13;

   // filtro por Contrato
   if molContratoEmptmo.IDContrato > 0 then sSql := sSql +
   '          AND HE.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)   + #13;

   sSql := sSql +
   '          AND HE.HMEDATAPREVISTA    <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '          + #13 +

   '          AND ( (HE.HMEDATAEFETIVA  IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +
   '          AND ( (HE.HMEVLREFETIVO   IS NULL) OR (HE.HMEDATAEFETIVA > TO_DATE(' + sData + ', ''DD/MM/YYYY'')) ) '                                                 + #13 +

   '          AND ( (HE.FLGQUITADO      IS NULL OR HE.FLGQUITADO = 0) OR ((HE.FLGQUITADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +
   '          AND ( (HE.FLGABONADO      IS NULL OR HE.FLGABONADO = 0) OR ((HE.FLGABONADO = 1) AND (HE.HMEDATAQUITABONO > TO_DATE(' + sData + ',''DD/MM/YYYY''))) ) ' + #13 +

   '          AND HE.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO '                             + #13 +
   '       ) '                                                                               + #13 +

   '   AND CON.IDCONTRATOEMPTMO     = SLD.IDCONTRATOEMPTMO'                                  + #13 +
   '   AND CON.IDCONTRATOEMPTMO     = PAR_DEV.IDCONTRATOEMPTMO(+)'                           + #13 +
   '   AND CON.IDCONTRATOEMPTMO     = PAR_PAG.IDCONTRATOEMPTMO(+)'                           + #13 +
   '   AND CON.IDPESSOA             = PTI.IDPESSOA'                                          + #13 +
   '   AND CON.IDPESSOA             = ELP.IDPESSOA'                                          + #13 +
   '   AND CON.IDPATRO              = PTR.IDPESSOA'                                          + #13 +
   '   AND CON.IDBENEF              = PBF.IDPESSOA'                                          + #13 +
   '   AND CON.IDPESSOA             = PPP.IDPESSOA'                                          + #13 +
   '   AND CON.IDPATRO              = PPP.IDPESSJUR'                                         + #13 +
   '   AND ELP.IDPESSOA             = PPP.IDPESSOA'                                          + #13 +
   '   AND ELP.IDPESSJUR            = PPP.IDPESSJUR'                                         + #13 +
   '   AND PTR.IDPESSOA             = ELP.IDPESSJUR'                                         + #13 +
   '   AND CON.IDBENEF              = PBF.IDPESSOA'                                          + #13 +
   '   AND PTI.IDPESSOA             = ELP.IDPESSOA'                                          + #13 +
   '   AND PTI.IDPESSOA             = PPP.IDPESSOA'                                          + #13 +
   '   AND CON.IDPLANOPREV          = PLP.IDPLANOPREV'                                       + #13 +
   '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO'                                 + #13 +
   '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO'                                      + #13 +
   '   AND ELP.IDPESSOA             = DEP.IDTITULAR'                                         + #13 +
   '   AND CON.IDBENEF              = DEP.IDPESSOA'                                          + #13 +
   '   AND CON.IDPESSOA             = DEP.IDTITULAR'                                         + #13 +
   '   AND PPP.IDSITPART            = SIT.IDSITPART'                                         + #13 +
   '   AND CON.IDBENEF              = EDP.IDPESSOA(+)'                                       + #13 +
   '   AND EDP.IDCIDADES            = CID.IDCIDADES(+)'                                      + #13 +
   '   AND CID.IDESTADO             = EST.IDESTADO(+)'                                       + #13 +
   '   AND PPP.FLGDESATIVADO        = 0 '                                                    + #13 +
   'ORDER BY '                                                                               + #13 +
   '   CON.IDCONTRATOEMPTMO';

   with qryDados do
   begin
      Close;
      SQL.Text := sSQL;
      Sql.SaveToFile('EP-CARTA COBRANÇA.TXT');
      Open;
   end;
end;



procedure TcfgRelCartaCobrEP.bbtnConfirmarClick(Sender: TObject);
var
   iContador   : Integer;
   sMensagem   : String;
begin
   if VerificaPreenchimento then
   begin
      qryReports.Close;
      qryReports.ParamByName('PIDREPORTS').asInteger  := qryTemplate.FieldByName('IDREPORTS').asInteger;
      qryReports.ParamByName('PORIGEMCM').asInteger   := qryTemplate.FieldByName('ORIGEMCM').asInteger;
      qryReports.Open;

      memReports.Lines.Clear;
      memReports.Lines.Text := qryReports.FieldByName('TEMPLATE').asString;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //memReports.Lines.SaveToFile(Sistema.TempDir + ArqCMCartaCobrEP);
      memReports.Lines.SaveToFile(ftempregra + '\' + ArqCMCartaCobrEP);

    //carrega o template e imprime o relatório

    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //rptImprime.Template.FileName := Sistema.TempDir + ArqCMCartaCobrEP;
      rptImprime.Template.FileName := ftempregra + '\' + ArqCMCartaCobrEP;
      rptImprime.Template.LoadFromFile;

      ModeloRelatCM.SetaDadosRpt(rptImprime, pplConsulta, ArqCMCartaCobrEP);

      MostraEspera('Selecionando Mutuários...');
      FiltraRelatorio;
      EscondeEspera;

      qryDados.First;

      // não pode haver ModalResult aqui
      // inherited;

      DesabilitaBotoes;

      // mostra o relatório
      rptImprime.Device := dvScreen;
      rptImprime.Print;

      Repaint;

      if chkAtendimento.Checked then
      begin
         memResult.Clear;
         memErro.Clear;

         memResult.Lines.Add('Nº Contrato  Mutuário                                               ');
         memResult.Lines.Add('------------ -------------------------------------------------------');

         memErro.Lines.Add('Nº Contrato  Mutuário                                               ');
         memErro.Lines.Add('------------ -------------------------------------------------------');

         qryDados.First;

         iContador := 0;
         frmProgresso.MostraFormProgresso('Registrando Atendimentos...',
                                          False,
                                          False,
                                          True,
                                          iContador,
                                          qryDados.RecordCount
                                         );

         while not(qryDados.EOF) do
         begin
            GeraAtendimento;

            inc(iContador);
            frmProgresso.AndaFormProgresso(iContador);

            qryDados.Next;
         end;

         frmProgresso.EscondeFormProgresso;
      end;

      HabilitaBotoes;
   end;
end;



procedure TcfgRelCartaCobrEP.FormCreate(Sender: TObject);
begin
   inherited;
   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;



procedure TcfgRelCartaCobrEP.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche as datas
   edtDataRef.Date   := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));
   edtDataCarta.Date := Sysdate;

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



procedure TcfgRelCartaCobrEP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // inherited;
   FechaQueries;
   Release;
end;






procedure TcfgRelCartaCobrEP.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelCartaCobrEP.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelCartaCobrEP.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelCartaCobrEP.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelCartaCobrEP.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
