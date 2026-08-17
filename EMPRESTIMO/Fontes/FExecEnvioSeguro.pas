{---------------------------Alteração-------------------------------------------
//Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
Pendência   : SOL 253185 PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
-------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit FExecEnvioSeguro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, mListaPlano,
   mListaPatro, mContratoEmptmo, wwdblook, wwdbdatetimepicker, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Db, Wwdatsrc,
   DBTables, Wwquery, IvDictio, IvMulti, IvEMulti;

type
   TfrmExecEnvioSeguro = class(TfrmWizardMTEP)
      Label1: TLabel;
      Label2: TLabel;
      GroupBox3: TGroupBox;
      Label5: TLabel;
      Label6: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      Panel3: TPanel;
      DBgrdHistMov: TwwDBGrid;
      lblTotContrato: TLabel;
      TabSheet3: TTabSheet;
      memResult: TMemo;
      Panel2: TPanel;
      qryContratosAEnviar: TwwQuery;
      dtsContratosAEnviar: TwwDataSource;
      qryContratosAEnviarIDHISTMOVEMPTMO: TFloatField;
      qryContratosAEnviarIDCONTRATOEMPTMO: TFloatField;
      qryContratosAEnviarIDITEMEMPTMO: TFloatField;
      qryContratosAEnviarHMEFORMACOBRANCA: TStringField;
      qryContratosAEnviarIDITEMCENTRALIZA: TFloatField;
      qryContratosAEnviarHMEVLRPREVISTO: TFloatField;
      qryContratosAEnviarHMERECPAG: TStringField;
      qryContratosAEnviarHMEDATAPREVISTA: TDateTimeField;
      qryContratosAEnviarHMEDATAVENCTO: TDateTimeField;
      qryContratosAEnviarHMEPARCELA: TFloatField;
      qryContratosAEnviarHMENUMPARCELAS: TFloatField;
      qryContratosAEnviarHMESALDODEV: TFloatField;
      qryContratosAEnviarHMETIPOMOV: TFloatField;
      qryContratosAEnviarANOMESCOMPETENCIA: TStringField;
      qryContratosAEnviarCONTABAIXA: TStringField;
      qryContratosAEnviarTIPCODIGO: TStringField;
      qryContratosAEnviarITCTRATASALDODEV: TFloatField;
      qryContratosAEnviarIDPLANOPREV: TFloatField;
      qryContratosAEnviarIDPATRO: TFloatField;
      qryContratosAEnviarIDBENEF: TFloatField;
      qryContratosAEnviarIDPESSOA: TFloatField;
      qryContratosAEnviarCODFORMAPAG: TFloatField;
      qryContratosAEnviarPORTFORMAPAG: TFloatField;
      qryContratosAEnviarPORTFORMAREC: TFloatField;
      qryContratosAEnviarIDCBANCARIA: TFloatField;
      qryContratosAEnviarIDCBANCARIADEB: TFloatField;
      qryContratosAEnviarIDTIPOCONTREMPTMO: TFloatField;
      qryContratosAEnviarITEDESCRICAO: TStringField;
      qryContratosAEnviarFLGINTERNO: TStringField;
      qryContratosAEnviarFLGATUALSALDOENV: TFloatField;
      qryContratosAEnviarIDREGRAENVIOPARC: TFloatField;
      qryContratosAEnviarIDTIPOSUSPEMPTMO: TFloatField;
      btnGeraArquivo: TBitBtn;
      qryMatricula: TwwQuery;
      qryMatriculaMATRICULA: TStringField;
      qryMatriculaNOME: TStringField;
      qryMatriculaNUMDOCUMENTO: TStringField;
      qryContratosAEnviarDATACREDITO: TDateTimeField;
      qryContratosAEnviarVLRCONTRATO: TFloatField;
      qryContratosAEnviarNUMPARCELAS: TFloatField;
      qryContratosAEnviarDATAPRIMPARC: TDateTimeField;

      procedure btnContinuarClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovTopRowChanged(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnGeraArquivoClick(Sender: TObject);



   private  // Private declarations

      procedure AbreQueries;

      function  VerificaPreenchimento: Boolean;

      function  AbreContratosAEnviar: boolean;

      procedure Envia;


   public // Public declarations

   end;



var
   frmExecEnvioSeguro: TfrmExecEnvioSeguro;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, dLookEmptmo, uVerificaPreenchimento, dEmptmo,
   uMensErro, dBaseDados, uIntegraEmptmo, uDatabase, uModulo,
   UTypesEmptmo;



procedure TfrmExecEnvioSeguro.AbreQueries;
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

   // PortadorForma
   with dtmLookEmptmo.qryLookPortadorFormaP do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



function TfrmExecEnvioSeguro.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      // data inicial
      if length(trim(edtDataIni.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);

      // data final
      if length(trim(edtDataFim.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



function TfrmExecEnvioSeguro.AbreContratosAEnviar: boolean;
var
   sSQL            : String;
   sDataIni        : String;
   sDataFim        : String;
   iIDItemSegConc  : Int64;
   iIDItemSegCompl : Int64;
   iIDItemSegMens  : Int64;
   iIDItemDevSeg   : Int64;
begin
   Result := False;
   ParametrosSistema;

   iIDItemSegConc  := dtmEmptmo.qryParamEmptmoIDITEMSEGCONC.AsInteger;
   iIDItemSegCompl := dtmEmptmo.qryParamEmptmoIDITEMSEGCOMPL.AsInteger;
   iIDItemSegMens  := dtmEmptmo.qryParamEmptmoIDITEMSEGESPECIAL.AsInteger;
   iIDItemDevSeg   := dtmEmptmo.qryParamEmptmoIDITEMDEVSEGQUIT.AsInteger;

   sDataIni        := FormatDateTime('dd/mm/yyyy', edtDataIni.Date);
   sDataFim        := FormatDateTime('dd/mm/yyyy', edtDataFim.Date);


   // Monta o SQL do item de seguro da concessão
   sSQL :=
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                                                        + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                           + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                            + #13 +
   '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                     + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                                 + #13 +
   '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                   + #13 +
   '  HME.HMETIPOMOV, '                                                                        + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                                 + #13 +
   '  || ''/'' || '                                                                            + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '         + #13 +
   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                   + #13 +
   '  CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, '                               + #13 +
   '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '                  + #13 +
   '  CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO, '           + #13 +
   '  CON.VLRCONTRATO, CON.NUMPARCELAS, CON.DATAPRIMPARC, CON.DATACREDITO, '                   + #13 +
   '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                    + #13 +
   'FROM '                                                                                     + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                   + #13 +
   '  ( '                                                                                      + #13 +
   '  SELECT '                                                                                 + #13 +
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '       + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                         + #13 +
   '     CON.NUMPARCELAS               AS PRAZO, '                                             + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '               + #13 +
   '     TEP.IDEMPRESAPROP,         CON.IDPATRO,                  CON.IDPLANOPREV, '           + #13 +
   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                        + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                      + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF, '                                             + #13 +
   '     CON.MOECODIGO, CON.IDCBANCARIADEB, '                                                  + #13 +
   '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '               + #13 +
   '     ELP.MATRICULA                 AS MATRICULA_TIT, '                                     + #13 +
   '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                    + #13 +
   '     PPP.INSCRICAONUMERO, '                                                                + #13 +
   '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                   + #13 +
   '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                        + #13 +
   '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                      + #13 +
   '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                          + #13 +
   '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                       + #13 +
   '     CON.NUMPARCELAS, CON.DATAPRIMPARC, CON.DATACREDITO, '                                 + #13 +
   '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''PENSIONISTA'') AS SITDESCRICAO '   + #13 +
   '  FROM '                                                                                   + #13 +
   '     CONTRATOEMPTMO  CON, '                                                                + #13 +
   '     PARTPREVPLAN    PPP, '                                                                + #13 +
   '     ELEGPATRO       ELP, '                                                                + #13 +
   '     PATRO           PTR, '                                                                + #13 +
   '     PLANPREV        PLP, '                                                                + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                                + #13 +
   '     TIPOEMPTMO      TEP, '                                                                + #13 +
   '     SITPART         SIT, '                                                                + #13 +
   '     SITPLANOPREV    SPP '                                                                 + #13 +
   '  WHERE '                                                                                  + #13 +
   '     TEP.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +
   '     AND CON.FLGSITUACAO       <> ''C'' '                                                  + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27205 - 09/01/2007
   //'     AND CON.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13;
   '     AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13;
   //Fim Pendência 27205
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '     AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                        + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '     AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                      + #13 +
   '     AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                      + #13 +

   '     AND CON.IDPATRO           = PTR.IDPESSOA '                                            + #13 +
   '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                         + #13 +
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                            + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                            + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                           + #13 +
   '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                           + #13 +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                        + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                           + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                      + #13 +

   '     AND PPP.FLGDESATIVADO     = 0 '                                                       + #13 +

   '  ) CON, '                                                                                 + #13 +

   '  ITEMXTIPOCONTR  ITC, '                                                                   + #13 +
   '  ITEMEMPTMO      IRC, '                                                                   + #13 +

   '   ( '                                                                                     + #13 +
   '   SELECT '                                                                                + #13 +
   '      IDCONTRATOEMPTMO, HMEDATAPREVISTA, IDHISTMOVEMPTMO '                                 + #13 +
   '   FROM '                                                                                  + #13 +
   '      HISTMOVEMPTMO '                                                                      + #13 +
   '   WHERE '                                                                                 + #13 +
   '           IDITEMEMPTMO = ' + IntToStr(iIDItemSegConc)                                     + #13 +
   '       AND (FLGESTORNADO IS NULL OR FLGESTORNADO = 0) '                                    + #13 +
   '       AND HMEDATAPREVISTA >= ' + OraData(edtDataIni.Date)                                 + #13 +
   '       AND HMEDATAPREVISTA <= ' + OraData(edtDataFim.Date)                                 + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '       AND IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

   sSQL := sSQL +
   '   ) HCB '                                                                                 + #13 +
   'WHERE '                                                                                    + #13 +
   '       ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO ) '                                  + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                      + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                      + #13 +
   '   AND (HME.IDHISTMOVEMPTMO    = HCB.IDHISTMOVEMPTMO) '                                    + #13;

   // Monta o SQL do item de seguro complementar
   if not dtmEmptmo.qryParamEmptmoIDITEMSEGCOMPL.IsNull then
   begin
      sSQL := sSQL +
      'UNION SELECT '                                                                                   + #13 +
      '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                           + #13 +
      '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                            + #13 +
      '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                     + #13 +
      '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                                 + #13 +
      '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                   + #13 +
      '  HME.HMETIPOMOV, '                                                                        + #13 +
      '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                                 + #13 +
      '  || ''/'' || '                                                                            + #13 +
      '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '         + #13 +
      '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                   + #13 +
      '  CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, '                               + #13 +
      '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '                  + #13 +
      '  CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO, '           + #13 +
      '  CON.VLRCONTRATO, CON.NUMPARCELAS, CON.DATAPRIMPARC, CON.DATACREDITO, '                   + #13 +
      '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                    + #13 +
      'FROM '                                                                                     + #13 +
      '  HISTMOVEMPTMO   HME, '                                                                   + #13 +
      '  ( '                                                                                      + #13 +
      '  SELECT '                                                                                 + #13 +
      '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '       + #13 +
      '     CON.IDVERBA,               CON.FLGSITUACAO, '                                         + #13 +
      '     CON.NUMPARCELAS               AS PRAZO, '                                             + #13 +
      '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '               + #13 +
      '     TEP.IDEMPRESAPROP,         CON.IDPATRO,                  CON.IDPLANOPREV, '           + #13 +
      '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                        + #13 +
      '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                      + #13 +
      '     CON.IDPESSOA,              CON.IDBENEF, '                                             + #13 +
      '     CON.MOECODIGO, CON.IDCBANCARIADEB, '                                                  + #13 +
      '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '               + #13 +
      '     ELP.MATRICULA                 AS MATRICULA_TIT, '                                     + #13 +
      '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                    + #13 +
      '     PPP.INSCRICAONUMERO, '                                                                + #13 +
      '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                   + #13 +
      '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                        + #13 +
      '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                      + #13 +
      '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                          + #13 +
      '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                       + #13 +
      '     CON.NUMPARCELAS, CON.DATAPRIMPARC, CON.DATACREDITO, '                                 + #13 +
      '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''PENSIONISTA'') AS SITDESCRICAO '   + #13 +
      '  FROM '                                                                                   + #13 +
      '     CONTRATOEMPTMO  CON, '                                                                + #13 +
      '     PARTPREVPLAN    PPP, '                                                                + #13 +
      '     ELEGPATRO       ELP, '                                                                + #13 +
      '     PATRO           PTR, '                                                                + #13 +
      '     PLANPREV        PLP, '                                                                + #13 +
      '     TIPOCONTREMPTMO TCE, '                                                                + #13 +
      '     TIPOEMPTMO      TEP, '                                                                + #13 +
      '     SITPART         SIT, '                                                                + #13 +
      '     SITPLANOPREV    SPP '                                                                 + #13 +
      '  WHERE '                                                                                  + #13 +
      '     TEP.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +
      '     AND CON.FLGSITUACAO       <> ''C'' '                                                  + #13;

      if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
      '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
      //Pendência 27205 - 09/01/2007
      //'     AND CON.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13;
      '     AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13;
      //Fim Pendência 27205
      if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
      '     AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                        + #13;

      // ----------------------------------------------------------------------------------------------

      sSQL := sSQL +
      '     AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                      + #13 +
      '     AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                      + #13 +

      '     AND CON.IDPATRO           = PTR.IDPESSOA '                                            + #13 +
      '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                         + #13 +
      '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                            + #13 +
      '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                            + #13 +
      '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                           + #13 +
      '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                           + #13 +
      '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
      '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                        + #13 +
      '     AND PPP.IDSITPART         = SIT.IDSITPART '                                           + #13 +
      '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                      + #13 +

      '     AND PPP.FLGDESATIVADO     = 0 '                                                       + #13 +

      '  ) CON, '                                                                                 + #13 +

      '  ITEMXTIPOCONTR  ITC, '                                                                   + #13 +
      '  ITEMEMPTMO      IRC, '                                                                   + #13 +
      '   ( '                                                                                     + #13 +
      '   SELECT '                                                                                + #13 +
      '      IDCONTRATOEMPTMO, HMEDATAPREVISTA, IDHISTMOVEMPTMO '                                 + #13 +
      '   FROM '                                                                                  + #13 +
      '      HISTMOVEMPTMO '                                                                      + #13 +
      '   WHERE '                                                                                 + #13 +
      '           IDITEMEMPTMO = ' + IntToStr(iIDItemSegCompl)                                    + #13 +
      '       AND (FLGESTORNADO IS NULL OR FLGESTORNADO = 0) '                                    + #13 +
      '       AND HMEDATAPREVISTA >= ' + OraData(edtDataIni.Date)                                 + #13 +
      '       AND HMEDATAPREVISTA <= ' + OraData(edtDataFim.Date)                                 + #13;

      if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
      '       AND IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

      sSQL := sSQL +
      '   ) HCB '                                                                                 + #13 +
      'WHERE '                                                                                    + #13 +
      '       ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO ) '                                  + #13 +
      '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
      '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                      + #13 +
      '   AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                      + #13 +
      '   AND (HME.IDHISTMOVEMPTMO    = HCB.IDHISTMOVEMPTMO) '                                    + #13;
   end;


   // Monta o SQL do item de seguro especial
   if not dtmEmptmo.qryParamEmptmoIDITEMSEGESPECIAL.IsNull then
   begin
      sSQL := sSQL +
      'UNION SELECT '                                                                                   + #13 +
      '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                           + #13 +
      '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                            + #13 +
      '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                     + #13 +
      '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                                 + #13 +
      '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                   + #13 +
      '  HME.HMETIPOMOV, '                                                                        + #13 +
      '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                                 + #13 +
      '  || ''/'' || '                                                                            + #13 +
      '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '         + #13 +
      '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                   + #13 +
      '  CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, '                               + #13 +
      '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '                  + #13 +
      '  CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO, '           + #13 +
      '  CON.VLRCONTRATO, CON.NUMPARCELAS, CON.DATAPRIMPARC, CON.DATACREDITO, '                   + #13 +
      '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                    + #13 +
      'FROM '                                                                                     + #13 +
      '  HISTMOVEMPTMO   HME, '                                                                   + #13 +
      '  ( '                                                                                      + #13 +
      '  SELECT '                                                                                 + #13 +
      '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '       + #13 +
      '     CON.IDVERBA,               CON.FLGSITUACAO, '                                         + #13 +
      '     CON.NUMPARCELAS               AS PRAZO, '                                             + #13 +
      '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '               + #13 +
      '     TEP.IDEMPRESAPROP,         CON.IDPATRO,                  CON.IDPLANOPREV, '           + #13 +
      '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                        + #13 +
      '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                      + #13 +
      '     CON.IDPESSOA,              CON.IDBENEF, '                                             + #13 +
      '     CON.MOECODIGO, CON.IDCBANCARIADEB, '                                                  + #13 +
      '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '               + #13 +
      '     ELP.MATRICULA                 AS MATRICULA_TIT, '                                     + #13 +
      '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                    + #13 +
      '     PPP.INSCRICAONUMERO, '                                                                + #13 +
      '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                   + #13 +
      '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                        + #13 +
      '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                      + #13 +
      '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                          + #13 +
      '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                       + #13 +
      '     CON.NUMPARCELAS, CON.DATAPRIMPARC, CON.DATACREDITO, '                                 + #13 +
      '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''PENSIONISTA'') AS SITDESCRICAO '   + #13 +
      '  FROM '                                                                                   + #13 +
      '     CONTRATOEMPTMO  CON, '                                                                + #13 +
      '     PARTPREVPLAN    PPP, '                                                                + #13 +
      '     ELEGPATRO       ELP, '                                                                + #13 +
      '     PATRO           PTR, '                                                                + #13 +
      '     PLANPREV        PLP, '                                                                + #13 +
      '     TIPOCONTREMPTMO TCE, '                                                                + #13 +
      '     TIPOEMPTMO      TEP, '                                                                + #13 +
      '     SITPART         SIT, '                                                                + #13 +
      '     SITPLANOPREV    SPP '                                                                 + #13 +
      '  WHERE '                                                                                  + #13 +
      '     TEP.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +
      '     AND CON.FLGSITUACAO       <> ''C'' '                                                  + #13;

      if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
      '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
      //Pendência 27205 - 09/01/2007
      //'     AND CON.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13;
      '     AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13;
      //Fim Pendência 27205
      if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
      '     AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                        + #13;

      // ----------------------------------------------------------------------------------------------

      sSQL := sSQL +
      '     AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                      + #13 +
      '     AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                      + #13 +

      '     AND CON.IDPATRO           = PTR.IDPESSOA '                                            + #13 +
      '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                         + #13 +
      '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                            + #13 +
      '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                            + #13 +
      '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                           + #13 +
      '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                           + #13 +
      '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
      '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                        + #13 +
      '     AND PPP.IDSITPART         = SIT.IDSITPART '                                           + #13 +
      '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                      + #13 +
      '     AND PPP.FLGDESATIVADO     = 0 '                                                       + #13 +
      '  ) CON, '                                                                                 + #13 +
      '  ITEMXTIPOCONTR  ITC, '                                                                   + #13 +
      '  ITEMEMPTMO      IRC, '                                                                   + #13 +
      '   ( '                                                                                     + #13 +
      '   SELECT '                                                                                + #13 +
      '      IDCONTRATOEMPTMO, HMEDATAPREVISTA, IDHISTMOVEMPTMO '                                 + #13 +
      '   FROM '                                                                                  + #13 +
      '      HISTMOVEMPTMO '                                                                      + #13 +
      '   WHERE '                                                                                 + #13 +
      '           IDITEMEMPTMO = ' + IntToStr(iIDItemSegMens)                                     + #13 +
      '       AND (FLGESTORNADO IS NULL OR FLGESTORNADO = 0) '                                    + #13 +
      '       AND HMEDATAPREVISTA >= ' + OraData(edtDataIni.Date)                                 + #13 +
      '       AND HMEDATAPREVISTA <= ' + OraData(edtDataFim.Date)                                 + #13;

      if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
      '       AND IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

      sSQL := sSQL +
      '   ) HCB '                                                                                 + #13 +
      'WHERE '                                                                                    + #13 +
      '       ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO ) '                                  + #13 +
      '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
      '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                      + #13 +
      '   AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                      + #13 +
      '   AND (HME.IDHISTMOVEMPTMO    = HCB.IDHISTMOVEMPTMO) '                                    + #13;
   end;

   // Monta o SQL do item de devolucao de seguro
   if not dtmEmptmo.qryParamEmptmoIDITEMDEVSEGQUIT.IsNull then
   begin
      sSQL := sSQL +
      'UNION SELECT '                                                                                   + #13 +
      '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                           + #13 +
      '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                            + #13 +
      '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                     + #13 +
      '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                                 + #13 +
      '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                   + #13 +
      '  HME.HMETIPOMOV, '                                                                        + #13 +
      '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                                 + #13 +
      '  || ''/'' || '                                                                            + #13 +
      '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '         + #13 +
      '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                   + #13 +
      '  CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, '                               + #13 +
      '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '                  + #13 +
      '  CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO, '           + #13 +
      '  CON.VLRCONTRATO, CON.NUMPARCELAS, CON.DATAPRIMPARC, CON.DATACREDITO, '                   + #13 +
      '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                    + #13 +
      'FROM '                                                                                     + #13 +
      '  HISTMOVEMPTMO   HME, '                                                                   + #13 +
      '  ( '                                                                                      + #13 +
      '  SELECT '                                                                                 + #13 +
      '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '       + #13 +
      '     CON.IDVERBA,               CON.FLGSITUACAO, '                                         + #13 +
      '     CON.NUMPARCELAS               AS PRAZO, '                                             + #13 +
      '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '               + #13 +
      '     TEP.IDEMPRESAPROP,         CON.IDPATRO,                  CON.IDPLANOPREV, '           + #13 +
      '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                        + #13 +
      '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                      + #13 +
      '     CON.IDPESSOA,              CON.IDBENEF, '                                             + #13 +
      '     CON.MOECODIGO, CON.IDCBANCARIADEB, '                                                  + #13 +
      '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '               + #13 +
      '     ELP.MATRICULA                 AS MATRICULA_TIT, '                                     + #13 +
      '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                    + #13 +
      '     PPP.INSCRICAONUMERO, '                                                                + #13 +
      '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                   + #13 +
      '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                        + #13 +
      '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                      + #13 +
      '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                          + #13 +
      '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                       + #13 +
      '     CON.NUMPARCELAS, CON.DATAPRIMPARC, CON.DATACREDITO, '                                 + #13 +
      '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''PENSIONISTA'') AS SITDESCRICAO '   + #13 +
      '  FROM '                                                                                   + #13 +
      '     CONTRATOEMPTMO  CON, '                                                                + #13 +
      '     PARTPREVPLAN    PPP, '                                                                + #13 +
      '     ELEGPATRO       ELP, '                                                                + #13 +
      '     PATRO           PTR, '                                                                + #13 +
      '     PLANPREV        PLP, '                                                                + #13 +
      '     TIPOCONTREMPTMO TCE, '                                                                + #13 +
      '     TIPOEMPTMO      TEP, '                                                                + #13 +
      '     SITPART         SIT, '                                                                + #13 +
      '     SITPLANOPREV    SPP '                                                                 + #13 +
      '  WHERE '                                                                                  + #13 +
      '     TEP.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +
      '     AND CON.FLGSITUACAO       <> ''C'' '                                                  + #13;

      if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
      '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
      //Pendência 27205 - 09/01/2007
      //'     AND CON.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13;
      '     AND TEP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                           + #13;
      //Fim Pendência 27205
      if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
      '     AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                        + #13;

      // ----------------------------------------------------------------------------------------------

      sSQL := sSQL +
      '     AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                      + #13 +
      '     AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                      + #13 +

      '     AND CON.IDPATRO           = PTR.IDPESSOA '                                            + #13 +
      '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                         + #13 +
      '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                            + #13 +
      '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                            + #13 +
      '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                           + #13 +
      '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                           + #13 +
      '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
      '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                        + #13 +
      '     AND PPP.IDSITPART         = SIT.IDSITPART '                                           + #13 +
      '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                      + #13 +
      '     AND PPP.FLGDESATIVADO     = 0 '                                                       + #13 +
      '  ) CON, '                                                                                 + #13 +
      '  ITEMXTIPOCONTR  ITC, '                                                                   + #13 +
      '  ITEMEMPTMO      IRC, '                                                                   + #13 +
      '   ( '                                                                                     + #13 +
      '   SELECT '                                                                                + #13 +
      '      IDCONTRATOEMPTMO, HMEDATAPREVISTA, IDHISTMOVEMPTMO '                                 + #13 +
      '   FROM '                                                                                  + #13 +
      '      HISTMOVEMPTMO '                                                                      + #13 +
      '   WHERE '                                                                                 + #13 +
      '           IDITEMEMPTMO = ' + IntToStr(iIDItemDevSeg)                                      + #13 +
      '       AND (FLGESTORNADO IS NULL OR FLGESTORNADO = 0) '                                    + #13 +
      '       AND HMEDATAPREVISTA >= ' + OraData(edtDataIni.Date)                                 + #13 +
      '       AND HMEDATAPREVISTA <= ' + OraData(edtDataFim.Date)                                 + #13;

      if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
      '       AND IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)         + #13;

      sSQL := sSQL +
      '   ) HCB '                                                                                 + #13 +
      'WHERE '                                                                                    + #13 +
      '       ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO ) '                                  + #13 +
      '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                 + #13 +
      '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                      + #13 +
      '   AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                      + #13 +
      '   AND (HME.IDHISTMOVEMPTMO    = HCB.IDHISTMOVEMPTMO) '                                    + #13;
   end;

   sSQL := sSQL +
   'ORDER BY '                                                                                 + #13 +
   '   IDCONTRATOEMPTMO, HMEPARCELA, HMEDATAVENCTO '                                           + #13;

   try
      with qryContratosAEnviar do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
       //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
       //sql.SaveToFile(Sistema.TempDir + 'EP-ContratosEnvioSeguro.txt');
         sql.SaveToFile(ftempregra + '\' + 'EP-ContratosEnvioSeguro.txt');
         Open;

         lblTotContrato.Visible := False;

         if not(isEmpty) then
         begin
            lblTotContrato.Caption := FormatFloat('#,#0', qryContratosAEnviar.RecordCount) + ' Contratos';
            lblTotContrato.Visible := True;
            btnGeraArquivo.Enabled := True;

            Result := True;
         end
         else
         begin
            MsgDlg('Não foram encontrados Contratos com itens de Seguro a Enviar no período de datas selecionado!',
                   'Empréstimo', mtInformation, [mbOK], 0);
            btnGeraArquivo.Enabled := False;
            Repaint;
         end;
      end;
   except
      Raise;
      Repaint;
   end;
end;



procedure TfrmExecEnvioSeguro.Envia;
var
   iPlanilha   : Integer;
   iResult     : Integer;
   iContador   : Integer;
   sResult     : TStringList;
   sErro       : TStringList;
   sSQLEnvio   : String;
   sHistorico  : String;
   sDataEnvio  : String;
   sTipoContr  : String;
begin
   try
      // limpa os memos de resultado e erro
      memResult.Clear;

      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      sSQLEnvio   := qryContratosAEnviar.Sql.GetText;

      sHistorico  := 'Repasse de Seguro de Emprestimos: ' + sDataEnvio;
      iPlanilha   := 0;

      EscondeEspera;

      // -------------------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // -------------------------------------------------------------------------------------------

      sResult.Clear;
      sErro.Clear;

      iResult := IntegraEmptmo.EnviaLoteConcessao(sSQLEnvio,
                                                  sHistorico,
                                                  SysDate,
                                                  -1,
                                                  Modulo.iMoedaCorrente,
                                                  Modulo.sCentroCusto,
                                                  Modulo.iPrograma,
                                                  iPlanilha,
                                                  sResult,
                                                  sErro
                                                 );

      if iResult = 0 then
      begin
         memResult.Lines.Add(trim(sResult.Text));
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
      end
      else
      begin
         memResult.Lines.Add(trim(sErro.Text));
         if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
      end;

   finally
      sResult.Free;
      sErro.Free;

      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
   end;
end;



procedure TfrmExecEnvioSeguro.btnContinuarClick(Sender: TObject);
begin
   case pgcControle.ActivePageIndex of
      0:
      if VerificaPreenchimento then
      begin
         if AbreContratosAEnviar then inherited;
      end;

      1: begin Envia; inherited; end;
   end;

end;



procedure TfrmExecEnvioSeguro.bbtnConfirmarClick(Sender: TObject);
begin
   qryContratosAEnviar.Close;

   inherited;
end;



procedure TfrmExecEnvioSeguro.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmExecEnvioSeguro.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmExecEnvioSeguro.DBgrdHistMovCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWindow;
         end;
      end;

      // Mostra o campo do evento em azul se for quitação
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;



procedure TfrmExecEnvioSeguro.DBgrdHistMovTopRowChanged(Sender: TObject);
begin
  inherited;
   (Sender as TwwDBGrid).Invalidate;

end;



procedure TfrmExecEnvioSeguro.FormShow(Sender: TObject);
var
   dDataHoje : TDateTime;
   dDataIni  : TDateTime;
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   (* preenche as datas - período sempre de Domingo a Sábado*)
   dDataHoje         :=  Sysdate;

   case DayOfWeek(dDataHoje) of
      1, 2, 3, 4: dDataIni := dDataHoje - (DayOfWeek(dDataHoje) + 6);
      5, 6, 7:    dDataIni := dDataHoje - (DayOfWeek(dDataHoje) - 1);
   end;

   edtDataIni.Date   := dDataIni;
   edtDataFim.Date   := dDataIni + 6;

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



procedure TfrmExecEnvioSeguro.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);

end;



procedure TfrmExecEnvioSeguro.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecEnvioSeguro.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecEnvioSeguro.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmExecEnvioSeguro.btnGeraArquivoClick(Sender: TObject);
var
   aArquivo         : TextFile;
   iIDItemSegConc   : Int64;
   iIDItemSegCompl  : Int64;
   iIDItemSegMens   : Int64;
   iIDItemDevSeg    : Int64;
   sLinha           : String;

   iDiaI, iMesI, iAnoI : Word;
   iDiaU, iMesU, iAnoU : Word;
   sMatricula       : String;
   sNome            : String;
   sCPF             : String;
   sDataConc        : String;
   sDataParc        : String;
   sValorEmpr       : String;
   sValorSeguro     : String;
   sComissao        : String;
   sDevolucao       : String;
   sValorBruto      : String;
   dDataUltParcela  : TDateTime;
begin
   inherited;

   ParametrosSistema;

   iIDItemDevSeg   := dtmEmptmo.qryParamEmptmoIDITEMDEVSEGQUIT.AsInteger;

   AssignFile(aArquivo,'EP-RepasseSeguro.txt');
   ReWrite(aArquivo);
   qryContratosAEnviar.DisableControls;
   qryContratosAEnviar.First;

   while not qryContratosAEnviar.Eof do
   begin
      LimpaParametros(qryMatricula);
      qryMatricula.ParamByName('PIDPESSOA').AsInteger  := qryContratosAEnviarIDBENEF.AsInteger;
      qryMatricula.ParamByName('PIDTITULAR').AsInteger := qryContratosAEnviarIDPESSOA.AsInteger;
      qryMatricula.Open;

      sMatricula := CompletaFim(qryMatriculaMATRICULA.AsString,' ',7);
      sNome      := CompletaFim(Copy(qryMatriculaNOME.AsString,1,40),' ',40);
      sCPF       := CompletaFim(qryMatriculaNUMDOCUMENTO.AsString,' ',11);

      DecodeDate(qryContratosAEnviarDATAPRIMPARC.AsDateTime, iAnoI, iMesI, iDiaI);

      dDataUltParcela := qryContratosAEnviarDATAPRIMPARC.AsDateTime + (qryContratosAEnviarNUMPARCELAS.AsInteger * 30);

      DecodeDate(dDataUltParcela,iAnoU, iMesU, iDiaU);

      dDataUltParcela := StrToDate(IntToStr(iDiaI) + '/' + IntToStr(iMesU) + '/' + IntToStr(iAnoU));

      sDataConc  := FormatDateTime('yymmdd', qryContratosAEnviarDATACREDITO.AsDateTime);
      sDataParc  := FormatDateTime('yymmdd', dDataUltParcela );

      if qryContratosAEnviarIDITEMEMPTMO.AsInteger = iIDItemDevSeg then
      begin
         sValorEmpr    := '000000000000000';
         sValorSeguro  := '000000000000000';
         sDevolucao    := FormatFloat('000000000000000',qryContratosAEnviarHMEVLRPREVISTO.AsFloat);
         sValorBruto   := FormatFloat('000000000000000', qryContratosAEnviarVLRCONTRATO.AsFloat);
      end
      else
      begin
         sValorEmpr    := FormatFloat('000000000000000', qryContratosAEnviarVLRCONTRATO.AsFloat);
         sValorSeguro  := FormatFloat('000000000000000',qryContratosAEnviarHMEVLRPREVISTO.AsFloat);
         sDevolucao    := '000000000000000';
         sValorBruto   := '000000000000000';
      end;

      sComissao := '000000000000000';

      sLinha := sMatricula + sNome + sCPF + sDataConc + sDataParc + sValorEmpr + sValorSeguro + sDevolucao + sValorBruto;
      WriteLn(aArquivo,sLinha);

      qryContratosAEnviar.Next;
   end;

   CloseFile(aArquivo);
   qryContratosAEnviar.First;

   qryContratosAEnviar.EnableControls;
   btnGeraArquivo.Enabled := False;
end;



end.
