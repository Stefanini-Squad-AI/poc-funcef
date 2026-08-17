{-------------------------------------------------------------------------------
-------------------------- ALTERAÇÕES / IMPLEMENTAÇÕES -------------------------
--------------------------------------------------------------------------------

Pendência   : 126804
Responsável : Everson Cunha
Data        : 08/08/2022
Descrição   : Alteração no texto de observação da AP
--------------------------------------------------------------------------------
Alterações  : AbreContratosAEnviar, MontaSQLEnvio
Pendência   : 125535
Responsável : Luis Ferrari
Data        : 24/05/2022
Descrição   : casos de acerto de concessão com líquido zero não sejam
              considerados nos envios de crédito e nem no relatório de Valores
--------------------------------------------------------------------------------
Alterações  : AbreContratosAEnviar, MontaSQLEnvio
Pendência   : 101924
Responsável : Cássio Florencio Rovaroto
Data        : 03/09/2020
Descrição   : Alteração no procedimento de envio para consideração de devolução
              de parcelas para pagamento via arquivo SIACC 240
--------------------------------------------------------------------------------
Alterações  : MontaSQLEnvio
Pendência   : 62639
Responsável : Edilaine
Data        : 02/02/2018
Descrição   : inserir no rateio o plano contábil do perfil de investimento do
participante e não o plano contábil do empréstimo
--------------------------------------------------------------------------------
Pendência   : SOL 261401 PPM 1120372
Responsável : William Moreira da Silva
Data        : 20/10/2015
Descrição   : Reestruturação da HistMovEmptmo
--------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------
Pendência   : SOL 166806 Kintana 1459449
Responsável : Fanuel Junior
Data        : 18/10/2011
Descrição   : Erro na busca de itens a devolver
--------------------------------------------------------------------------------
Pendência   : SOL 155024 KINTANA 1196994
Responsável : Fanuel Junior
Data        : 22/03/2011
Descrição   : Alteração da query que busca os itens
--------------------------------------------------------------------------------
Pendência   : SOL 140061 KINTANA 873291
Responsável : Ádler Souza
Data        : 20/07/2010
Descrição   : Ao invés de utilizar a condição FLGDESATIVADO, utilizar join
              entre a contratoemptmo e a partprevplan.
--------------------------------------------------------------------------------
Pendência   : SOL 129014 KINTANA 698559
Responsável : Ádler Souza
Data        : 06/05/2010
Descrição   : Parametrização para itens que terão valores transferidos para o PGA.
--------------------------------------------------------------------------------
Pendência   : SOL 122495 KINTANA 601806
Responsável : Jéssica Lana
Data        : 31/07/2009
Descrição   : Alteração na SQL de itens de envio.SOL  KNT
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
Rotina    : qryPortForma
Data      : 12/02/2007
Autor     : Alberto
Pendência : 24149
Descrição : Incluido filtro para recuperar apenas os portadores forma que
            possuem itens a enviar.
--------------------------------------------------------------------------------
Rotina    : MontaSQLEnvio
Data      : 26/08/2004
Autor     : André Pontes
Pendência :
Descrição : Retirado o filtro por tipo de contrato, que não faz sentido se
            devoluções precisam entrar no lote. Para não prejudicar ninguém, a
            condição só foi retirada para FUNCEF.
--------------------------------------------------------------------------------
Rotina    :
Data      : 08/07/2004
Autor     : André Pontes
Pendência :
Descrição : Acerto da questão IDPLANOPREV/IDPLANOORIGEM:
            "CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS
             IDPLANOORIGEM,"
--------------------------------------------------------------------------------
Rotina    : AbreContratosAEnviar e Envia
Data      : 22/04/2004
Autor     : André Pontes
Descrição : Passa a enviar devoluções também (HMETIPOMOV 1, 3, 6, 7)
--------------------------------------------------------------------------------
Rotina    : Envia
Data      : 01/09/2003
Autor     : Marchetti
Descrição : Retirado o loop para indidualizar por tipo de contrato.
-------------------------------------------------------------------------------}

unit FExecEnvioLoteConcessao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid,
   mListaPlano, mListaPatro, wwdblook, mContratoEmptmo, wwdbdatetimepicker,
   Db, DBTables, Wwquery, Wwdatsrc;

type
   TfrmExecEnvioLoteConcessao = class(TfrmWizardMTEP)
      Panel3: TPanel;
      GroupBox3: TGroupBox;
      Label5: TLabel;
      Label6: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      qryContratosAEnviar: TwwQuery;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      Label2: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      dtsContratosAEnviar: TwwDataSource;
      DBgrdHistMov: TwwDBGrid;
      TabSheet3: TTabSheet;
      memResult: TMemo;
      Panel2: TPanel;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      Label3: TLabel;
      DBcboPortadorForma: TwwDBLookupCombo;
      qryContratosAEnviarIDCONTRATOEMPTMO: TFloatField;
      qryContratosAEnviarDESC_EVENTO: TStringField;
      qryContratosAEnviarNOME: TStringField;
      qryContratosAEnviarHMEVLRPREVISTO: TFloatField;
      qryContratosAEnviarHMEDATAPREVISTA: TDateTimeField;
      qryPortForma: TwwQuery;
      qryPortFormaPORTFORMAPAG: TFloatField;
      qryPortFormaDESCRICAO: TStringField;
      qryTipoContr: TwwQuery;
      qryTipoContrIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContrTCEDESCRICAO: TStringField;
      lblTotContrato: TLabel;
      qryContratosAEnviarDESCRICAO: TStringField;
      qryContratosAEnviarIDPESSOA: TFloatField;
      qryContratosAEnviarIDBENEF: TFloatField;
      qryContratosAEnviarIDPLANOPREV: TFloatField;
      qryContratosAEnviarIDPLANOORIGEM: TFloatField;
      qryContratosAEnviarHMETIPOMOV: TFloatField;
      qryContratosAEnviarMATRICULA: TStringField;
      rdgEnvio: TRadioGroup;
      // QryReceber: TwwQuery;

      procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovTopRowChanged(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure DBcboPortadorFormaExit(Sender: TObject);



   private // Private declarations

      procedure AbreQueries;

      function  VerificaPreenchimento: Boolean;

      function  AbreContratosAEnviar: boolean;

      function  MontaSQLEnvio(const sData      : String;
                              const iPortForma : Integer;
                              const sTipoContr : String
                             ): String;


      function  MontaSQLTaxaPga(const sData      : String;
                                const iPortForma : Integer;
                                const sTipoContr : String;
                                RecPag           : String // Teste renato visoni
                               ): String;
      procedure Envia;
      procedure EnviaFUNCEF;


   public // Public declarations
     lstDocumentosCapCar : TStringList;
   end;



var
  frmExecEnvioLoteConcessao: TfrmExecEnvioLoteConcessao;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, dLookEmptmo, uVerificaPreenchimento, dEmptmo,
   uMensErro, dBaseDados, uIntegraEmptmo, uDatabase, uModulo,
   UTypesEmptmo,dIntegraEmptmo;




procedure TfrmExecEnvioLoteConcessao.AbreQueries;
begin
   ParametrosSistema;

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



function TfrmExecEnvioLoteConcessao.VerificaPreenchimento: Boolean;
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



function TfrmExecEnvioLoteConcessao.AbreContratosAEnviar: boolean;
var
   sSQL       : String;
   sDataIni   : String;
   sDataFim   : String;
   sAno, sMes : String;
begin
   Result := False;

   sDataIni := FormatDateTime('dd/mm/yyyy', edtDataIni.Date);
   sDataFim := FormatDateTime('dd/mm/yyyy', edtDataFim.Date);

   sAno := Copy(sDataIni, 7, 4);   //Fanuel Junior  SOL 155024 KINTANA 1196994
   sMes := Copy(sDataIni, 4, 2);   //Fanuel Junior  SOL 155024 KINTANA 1196994

   //Fanuel Junior  SOL 155024 KINTANA 1196994
  { if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL :=

   'SELECT /*+ INDEX(HME XIE26HISTMOVEMPTMO) INDEX(CON XPKCONTRATOEMPTMO) */ '            + #13
   else sSQL :=
   'SELECT /*+RULE */ '                                                                            + #13; }
  //Fanuel Junior  SOL 155024 KINTANA 1196994

   // Pendência 23251 - 31/01/2007 - Alberto
   // Ajustes na query pois o Oracle 9.0.2.4 ou superior não aceita subquery em outer join

   sSQL := sSQL +
   '   SELECT                '                                                               + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                               + #13 +
   '   DEP.MATRICULA, '                                                                      + #13 +
   '   CON.IDPESSOA, CON.IDBENEF, '                                                          + #13 +
   '   CON.IDPLANOPREV,  '                                                                   + #13 +
   '   HME.IDPLANOCONTANT AS IDPLANOORIGEM, '                                                + #13 +
   '   HME.HMETIPOMOV, '                                                                     + #13 +
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
   '   PES.NOME, '                                                                           + #13 +
   '   HME.HMEVLRPREVISTO, '                                                                 + #13 +
   '   HME.HMEDATAPREVISTA, '                                                                + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Início
   //'   PFO.DESCRICAO '                                                                       + #13 +
   '   CASE WHEN HME.HMETIPOMOV = 0 THEN PFO.DESCRICAO                                     ' + #13 +
   '        ELSE PFP.DESCRICAO                                                             ' + #13 +
   '    END AS DESCRICAO                                                                   ' + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Fim
   'FROM '                                                                                   + #13 +
   '   PESSOA          PES, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   DEPENTIT        DEP, '                                                                + #13 +
   '   PORTADORFORMA   PFO, '                                                                + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                + #13 +
   '   TIPOEMPTMO      TEP, '                                                                + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Início
   '   PARAMEMPTMO     PRE,                                                                ' + #13 +
   '   PORTADORFORMA   PFP,                                                                ' + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Fim
   '  ( '                                                                                    + #13 +
   '      SELECT M.IDPATROANT, M.IDPLANOCONTANT, H.HMETIPOMOV, H.HMEVLRPREVISTO,  '          + #13 +
//   '      H.HMEDATAPREVISTA, H.IDCONTRATOEMPTMO                                   '          + #13 +
   '      H.HMEDATAPREVISTA, H.IDCONTRATOEMPTMO, H.HMESEQCOBRANCA                 '          + #13 +     //Sig 125535 Ferrari
   '      FROM   HISTMOVEMPTMO H, MIGRACONTRATOEP M '                                        + #13 +
   '      WHERE  M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    M.DATAMIGRA        = (SELECT MIN(DATAMIGRA) '                               + #13 +
   '                                   FROM   MIGRACONTRATOEP '                              + #13 +
   '                                   WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '        + #13 +
   '                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '               + #13;

   // Só faz envio de devoluções se for FUNCEF
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
   '      AND    H.HMETIPOMOV         = 0 '                                                  + #13 +
   '      AND    H.HMEPARCELA         = 0 '                                                  + #13;

   //Fanuel Junior SOL166806 Kintana1459449
   case rdgEnvio.ItemIndex of
      0: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        = 0 '                                                   + #13;
      1: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        <> 0 '                                                  + #13;
    end;

   sSQL := sSQL +
   '      AND    H.FLGENVIO           = 0 '                                                  + #13 +
   '      AND    H.FLGBAIXADO         = 0 '                                                  + #13 +
   '      AND    H.HMEFORMACOBRANCA   = ''C'' '                                              + #13 +
   '      AND    H.HMERECPAG          = ''P'' '                                              + #13 +
   '      AND    H.HMEVLREFETIVO      IS NULL '                                              + #13 +
   '      AND    H.HMEDATAEFETIVA     IS NULL '                                              + #13 +
   '      AND    H.CODDOCUMENTO       IS NULL '                                              + #13 +
   '      AND    H.HMEDATAPREVISTA    BETWEEN TO_DATE(''' + sDataIni + ''', ''dd/mm/yyyy'') AND ' +
                                             'TO_DATE(''' + sDataFim + ''', ''dd/mm/yyyy'') '+ #13 +
   '      AND    (H.HMECENTRALIZA     = 1 OR H.HMEDESTACADO = 1) '                           + #13 +
   '      AND    h.hmemescobranca =  '+sMes+' '                                              + #13 + // Fanuel Junior SOL 155024 KINTANA 1196994
   '      AND    h.hmeanocobranca =  '+sAno+' '                                              + #13 + // Fanuel Junior SOL 155024 KINTANA 1196994
   '      AND    NVL(H.FLGESTORNADO,0)= 0 '                                                  + #13 +
   '      AND    NVL(H.FLGQUITADO, 0) = 0 '                                                  + #13 +
   '      AND    NVL(H.FLGABONADO, 0) = 0 '                                                  + #13 +

   '      UNION  ALL '                                                                       + #13 +
   '      SELECT C.IDPATRO as IDPATROANT, '                                                  + #13 +
   '             NVL(C.IDPLANOORIGEM, C.IDPLANOPREV) as IDPLANOCONTANT, H.HMETIPOMOV, '      + #13 + // Fanuel Junior SOL 155024 KINTANA 1196994
//   '      H.HMEVLRPREVISTO, H.HMEDATAPREVISTA, H.IDCONTRATOEMPTMO            '               + #13 + // Fanuel Junior SOL 155024 KINTANA 1196994
   '      H.HMEVLRPREVISTO, H.HMEDATAPREVISTA, H.IDCONTRATOEMPTMO, H.HMESEQCOBRANCA '        + #13 + // Sig 125535 Ferrari
   '      FROM   CONTRATOEMPTMO C, HISTMOVEMPTMO H '                                         + #13 +
   '      WHERE  C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    NOT EXISTS( SELECT 1 '                                                      + #13 +
   '                         FROM   MIGRACONTRATOEP '                                        + #13 +
   '                         WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                  + #13 +
   '                         AND    DATAMIGRA > H.HMEDATAPREVISTA) '                         + #13;

   // Só faz envio de devoluções se for FUNCEF
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
   '      AND    H.HMETIPOMOV         = 0 '                                                  + #13 +
   '      AND    H.HMEPARCELA         = 0 '                                                  + #13;

   //Fanuel Junior SOL166806 Kintana1459449
   case rdgEnvio.ItemIndex of
      0: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        = 0 '                                                   + #13;
      1: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        <> 0 '                                                  + #13;
    end;

   sSQL := sSQL +
   '      AND    H.FLGENVIO           = 0 '                                                  + #13 +
   '      AND    H.FLGBAIXADO         = 0 '                                                  + #13 +
   '      AND    H.HMEFORMACOBRANCA   = ''C'' '                                              + #13 +
   '      AND    H.HMERECPAG          = ''P'' '                                              + #13 +
   '      AND    H.HMEVLREFETIVO      IS NULL '                                              + #13 +
   '      AND    H.HMEDATAEFETIVA     IS NULL '                                              + #13 +
   '      AND    H.CODDOCUMENTO       IS NULL '                                              + #13 +
   '      AND    H.HMEDATAPREVISTA    BETWEEN TO_DATE(''' + sDataIni + ''', ''dd/mm/yyyy'') AND '  +
                                             'TO_DATE(''' + sDataFim + ''', ''dd/mm/yyyy'') '+ #13 +
   '      AND    (H.HMECENTRALIZA     = 1 OR H.HMEDESTACADO = 1) '                           + #13 +
   '      AND    h.hmemescobranca = '+sMes+'  '                                              + #13 + // Fanuel Junior SOL 155024 KINTANA 1196994
   '      AND    h.hmeanocobranca = '+sAno+'  '                                              + #13 + // Fanuel Junior SOL 155024 KINTANA 1196994
   '      AND    NVL(H.FLGESTORNADO,0)= 0 '                                                  + #13 +
   '      AND    NVL(H.FLGQUITADO, 0) = 0 '                                                  + #13 +
   '      AND    NVL(H.FLGABONADO, 0) = 0 '                                                  + #13 +
   '  ) HME '                                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '       TEP.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                       + #13;

   if DBcboPortadorForma.LookupValue <> '' then sSQL := sSQL +
   //Cássio Rovaroto Nº 101924 - Início
   //'   AND CON.PORTFORMAPAG          = ' + DBcboPortadorForma.LookupValue                    + #13;
   '   AND DECODE(HME.HMETIPOMOV, 0, CON.PORTFORMAPAG, PRE.PORTFORMAPAGTO) = ' + DBcboPortadorForma.LookupValue + #13;
   //Cássio Rovaroto Nº 101924 - Fim

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IdContrato)   + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO          = ' + DBcboTipoEmptmo.LookupValue                       + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO     = ' + DBcboTipoContrato.LookupValue                     + #13;

   sSQL := sSQL +
   '   AND CON.IDPATRO               IN (' + molListaPatro.PegaPatro + ') '                  + #13 +
   '   AND CON.IDPLANOPREV           IN (' + molListaPlano.PegaPlano + ') '                  + #13 +
   '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '                                + #13 +
   '   AND CON.IDBENEF               = PES.IDPESSOA '                                        + #13 +
   '   AND CON.IDPESSOA              = DEP.IDTITULAR '                                       + #13 +
   '   AND CON.IDBENEF               = DEP.IDPESSOA '                                        + #13 +
   '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '                               + #13 +
   '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO '                                    + #13 +
   '   AND CON.PORTFORMAPAG          = PFO.CODPORTFORMA '                                    + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Início
   '   AND PRE.PORTFORMAPAGTO        = PFP.CODPORTFORMA                                    ' + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Fim
   // Inicio SIG 125535  Ferrari
   '   AND (HME.HMEVLRPREVISTO <> 0 or HME.HMESEQCOBRANCA <> 2)                            ' + #13 +
   // Fim
   'ORDER BY '                                                                               + #13 +
   '   HME.HMEDATAPREVISTA, CON.IDCONTRATOEMPTMO ';
   //Fim Pendência 23251

   try
      with qryContratosAEnviar do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
       //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
       //SQL.SaveToFile(Sistema.TempDir + 'EP-EnvioLote-Contratos.txt');
         SQL.SaveToFile(ftempregra + '\' + 'EP-EnvioLote-Contratos.txt');
         Open;

         lblTotContrato.Visible := False;

         if not(isEmpty) then
         begin
            lblTotContrato.Caption := FormatFloat('#,#0', qryContratosAEnviar.RecordCount) + ' Contratos';
            lblTotContrato.Visible := True;

            Result := True;
         end
         else
         begin
            MsgDlg('Não foram encontrados Contratos com itens a Enviar no período de datas selecionado!',
                   'Empréstimo', mtInformation, [mbOK], 0);
            Repaint;
         end;
      end;
   except
      Raise;
      Repaint;
   end;
end;



function TfrmExecEnvioLoteConcessao.MontaSQLEnvio(const sData      : String;
                                                  const iPortForma : Integer;
                                                  const sTipoContr : String
                                                 ): String;
var
   sSQL : String;
begin
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL :=
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                                                                 + #13
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   else sSQL :=
   'SELECT '                                                                                 + #13;

   // Pendência 23251 - 01/02/2007 - Alberto
   // Ajustes na query pois o Oracle 9.0.2.4 ou superior não aceita subquery em outer join

   sSQL := sSQL +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                          + #13 +
   '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                   + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
   '  HME.HMEPARCELA, NVL(HME.HMENUMPARCELAS, 0) AS HMENUMPARCELAS, HME.HMESALDODEV, '       + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +
   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +
   '  CON.IDPLANOPREV,  '                                                                    + #13 +
   //edilaine - SIG62639 - inicio
   //'  HME.IDPLANOCONTANT AS IDPLANOORIGEM, '                                                 + #13 +
   '  NVL(CASE                                                                            '+ #13 +
   '       WHEN EXISTS (SELECT 1                                                          '+ #13 +
   '                      FROM TRANSPERFILINVEST T                                        '+ #13 +
   '                     WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(' + sData + ',''DD/MM/YYYY''),''YYYY/MM'') AND '+ #13 +
   '                           T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) THEN            '+ #13 +
   '         (SELECT MAX(PI.IDPLANPREVCONTAB)                                           '+ #13 +
   '            FROM CM.TRANSPERFILINVEST T                                               '+ #13 +
   '                 JOIN PERFILINVEST PI ON T.IDPERFILINVESTANT = PI.IDPERFILINVEST      '+ #13 +
   '           WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(' + sData + ',''DD/MM/YYYY''),''YYYY/MM'') AND '+ #13 +
   '                 T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO)                           '+ #13 +
   '       ELSE                                                                           '+ #13 +
   '         (SELECT MAX(PI.IDPLANPREVCONTAB)                                             '+ #13 +
   '            FROM PERFILINVXELEG PIE                                                   '+ #13 +
   '                 JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST       '+ #13 +
   '           WHERE PIE.IDPESSOA = CON.IDPESSOA AND                                      '+ #13 +
   '                 PIE.IDPLANOPREV = CON.IDPLANOPREV AND                                '+ #13 +
   '                 PIE.IDPESSJUR = CON.IDPATRO AND                                      '+ #13 +
   '                 PIE.DTFIM IS NULL)                                                   '+ #13 +
   '     END, -1) AS IDPLANOORIGEM,                                                       '+ #13 +
   //edilaine - SIG62639 - fim

   '  CON.IDBENEF, CON.IDPESSOA, CON.IDPATRO, CON.MATRICULA_TIT AS MATRICULA, '              + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Início
   //'  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIA,HME.IDCBANCARIA) AS IDCBANCARIA, '                + #13 +
   '  DECODE(HME.HMETIPOMOV, 0, CON.CODFORMAPAG, CON.CODFORMAPAGTO) AS CODFORMAPAG,       ' + #13 +
   '  DECODE(HME.HMETIPOMOV, 0, CON.PORTFORMAPAG, CON.PORTFORMAPAGTO) AS PORTFORMAPAG,    ' + #13 +
   '  CON.PORTFORMAREC, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIA,HME.IDCBANCARIA) AS IDCBANCARIA, '                + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Fim
   '  CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO, '         + #13 +
   '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                  + #13 +
   'FROM '                                                                                   + #13 +
   '  ( '                                                                                    + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                                                                 + #13
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   else sSQL := sSQL +
   'SELECT '                                                                                 + #13;

   sSQL := sSQL +
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
   '     CON.NUMPARCELAS            AS PRAZO, '                                              + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +
   '     TEP.IDEMPRESAPROP, '                                                                + #13 +
   '     CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM, '        + #13 +
   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                      + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF, '                                           + #13 +
   '     CON.MOECODIGO,             CON.IDCBANCARIADEB, '                                    + #13 +
   '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '             + #13 +
   '     ELP.MATRICULA                 AS MATRICULA_TIT, '                                   + #13 +
   '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                  + #13 +
   '     PPP.INSCRICAONUMERO, '                                                              + #13 +
   '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                 + #13 +
   '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                      + #13 +
   '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                    + #13 +
   '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                        + #13 +
   '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                     + #13 +
   '     CON.IDPATRO, '                                                                      + #13 +
   '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO ' + #13 +
   '     , PRE.PORTFORMAPAGTO, PRE.CODFORMAPAGTO                                           ' + #13 + //Cássio Rovaroto - SIG nº 101924 
   '  FROM '                                                                                 + #13 +
   '     CONTRATOEMPTMO  CON, '                                                              + #13 +
   '     PARTPREVPLAN    PPP, '                                                              + #13 +
   '     ELEGPATRO       ELP, '                                                              + #13 +
   '     PATRO           PTR, '                                                              + #13 +
   '     PLANPREV        PLP, '                                                              + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '     TIPOEMPTMO      TEP, '                                                              + #13 +
   '     SITPART         SIT, '                                                              + #13 +
   '     SITPLANOPREV    SPP '                                                               + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Início
   '     , PARAMEMPTMO PRE    '                                                              + #13 +
   //Cássio Rovaroto - SIG nº 101924 - Fim
   '  WHERE '                                                                                + #13 +
   '         TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                         + #13 +
   '     AND CON.FLGSITUACAO       <> ''C'' '                                                + #13;

   if iPortForma > 0 then sSQL := sSQL +
   //Cássio Rovaroto - SIG nº 101924 - Início
   //'     AND CON.PORTFORMAPAG      = ' + IntToStr(iPortForma)                                + #13;
   '     AND PRE.PORTFORMAPAGTO = ' + IntToStr(iPortForma)                                + #13;
   //Cássio Rovaroto - SIG nº 101924 - fIM


   if  (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) and (sTipoContr <> '') then sSQL := sSQL +
   '     AND CON.IDTIPOCONTREMPTMO IN (' + sTipoContr + ')'                                  + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)     + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '     AND TCE.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                         + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '     AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue                       + #13;

   sSQL := sSQL +
   '     AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                    + #13 +
   '     AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                    + #13 +
   '     AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                       + #13 +
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
   '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                         + #13 +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +
   //'   AND PPP.FLGDESATIVADO     = 0 '                                                   + #13 +
   //    Jéssica Lana SOL 122495 KNT 601806
{   '     AND (PPP.FLGDESATIVADO = 0 OR (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1 WHERE ppp1.idpessoa = ppp.idpessoa '  + #13 +
   '     AND ppp1.flgdesativado = 0)'                                                                                                               + #13 +
   '     AND (ppp.idsitplanoprev = 25 OR (ppp.idplanoprev = (select max(ppp1.idplanoprev) from partprevplan ppp1 where ppp1.idpessoa = ppp.idpessoa'+ #13 +
   '     AND ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento) FROM partprevplan ppp2 WHERE ppp2.idpessoa = ppp1.idpessoa)'                + #13 +
   '     AND NOT exists (select 1 from partprevplan ppp2 where ppp2.idpessoa = ppp1.idpessoa and ppp2.idsitplanoprev = 25))))))'                    + #13 +}
  //    Jéssica Fim ...
//Ádler Souza - SOL 140061 KINTANA 873291
   '          AND (ppp.idplanoprev = '                                                       + #13 +
   '        (SELECT MAX(ppp2.idplanoprev) '                                                  + #13 +
   '          FROM partprevplan ppp2 '                                                       + #13 +
   '         WHERE ppp2.flgdesativado = 0 '                                                  + #13 +
   '           AND ppp2.idpessoa = ppp.idpessoa) OR '                                        + #13 +
   '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS '                                          + #13 +
   '        (SELECT 1 '                                                                      + #13 +
   '           FROM partprevplan ppp1 '                                                      + #13 +
   '          WHERE ppp1.idpessoa = ppp.idpessoa '                                           + #13 +
   '            AND ppp1.flgdesativado = 0) AND '                                            + #13 +
   '        (ppp.idsitplanoprev = 25 OR '                                                    + #13 +
   '        (ppp.idplanoprev = '                                                             + #13 +
   '        (SELECT MAX(ppp1.idplanoprev)'                                                   + #13 +
   '             FROM partprevplan ppp1 '                                                    + #13 +
   '            WHERE ppp1.idpessoa = ppp.idpessoa '                                         + #13 +
   '              AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = '                          + #13 +
   '                  (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) '               + #13 +
   '                     FROM partprevplan ppp2 '                                            + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa) '                               + #13 +
   '              AND NOT EXISTS (SELECT 1 '                                                 + #13 +
   '                     FROM partprevplan ppp2 '                                            + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa '                                + #13 +
   '                      AND ppp2.idsitplanoprev = 25)))))) '                               + #13 +
//   '           AND CON.IDPLANOCOB IS NULL)  '                                                + #13 +
//   '           OR  (PPP.IDPLANOPREV       = CON.IDPLANOCOB) '                                + #13 +
//Fim - Ádler Souza - SOL 140061 KINTANA 873291
   '  ) CON, '                                                                               + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC, '                                                                 + #13 +
   '  ( '                                                                                    + #13 +
   '      SELECT M.IDPATROANT, M.IDPLANOCONTANT, H.* '                                       + #13 +
   '      FROM   HISTMOVEMPTMO H, MIGRACONTRATOEP M '                                        + #13 +
   '      WHERE  M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    M.DATAMIGRA        = (SELECT MIN(DATAMIGRA) '                               + #13 +
   '                                   FROM   MIGRACONTRATOEP '                              + #13 +
   '                                   WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '        + #13 +
   //Pendência 27641 - 25/03/2008
   //'                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '               + #13 +
   '                                   AND    DATAMIGRA > H.HMEDATAVENCTO) '                 + #13 +
   '      AND    H.HMEFORMACOBRANCA  = ''C'' '                                               + #13 +
   '      AND    H.HMERECPAG         = ''P'' '                                               + #13 +
   '      AND    H.FLGENVIO          = 0 '                                                   + #13 +
   '      AND    H.FLGBAIXADO        = 0 '                                                   + #13;

   case rdgEnvio.ItemIndex of
      0: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        = 0 '                                                   + #13;
      1: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        <> 0 '                                                  + #13;
   end;

   sSQL := sSQL +
   '      AND    H.HMEVLREFETIVO     IS NULL '                                               + #13 +
   '      AND    H.HMEDATAEFETIVA    IS NULL '                                               + #13 +
   '      AND    H.CODDOCUMENTO      IS NULL '                                               + #13 +
   '      AND    H.HMEDATAVENCTO     = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '              + #13 +
   '      AND    (H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO       = 1 ) '                     + #13 +
   '      AND    (H.FLGESTORNADO     IS NULL OR H.FLGESTORNADO   = 0 ) '                     + #13 +
   '      AND    (H.FLGABONADO       IS NULL OR H.FLGABONADO     = 0 ) '                     + #13 +
   '      AND    (H.FLGQUITADO       IS NULL OR H.FLGQUITADO     = 0 ) '                     + #13 +
   '      AND    (H.FLGSUSPENSAO     IS NULL OR H.FLGSUSPENSAO   = 0 ) '                     + #13 +
   '      UNION  ALL '                                                                       + #13 +
   '      SELECT C.IDPATRO as IDPATROANT, '                                                  + #13 +
   '             NVL(C.IDPLANOORIGEM, C.IDPLANOPREV) as IDPLANOCONTANT, H.* '                + #13 +
   '      FROM   CONTRATOEMPTMO C, HISTMOVEMPTMO H '                                         + #13 +
   '      WHERE  C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    NOT EXISTS( SELECT * '                                                      + #13 +
   '                         FROM   MIGRACONTRATOEP '                                        + #13 +
   '                         WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                  + #13 +
   //Pendência 27641 - 25/03/2008
   //'                         AND    DATAMIGRA > H.HMEDATAPREVISTA) '                         + #13 +
   '                         AND    DATAMIGRA > H.HMEDATAVENCTO) '                           + #13 +
   '      AND    H.HMEFORMACOBRANCA  = ''C'' '                                               + #13 +
   '      AND    H.HMERECPAG         = ''P'' '                                               + #13 +
   '      AND    H.FLGENVIO          = 0 '                                                   + #13 +
   '      AND    H.FLGBAIXADO        = 0 '                                                   + #13;

   case rdgEnvio.ItemIndex of
      0: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        = 0 '                                                   + #13;
      1: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        <> 0 '                                                  + #13;
   end;

   sSQL := sSQL +
   '      AND    H.HMEVLREFETIVO     IS NULL '                                               + #13 +
   '      AND    H.HMEDATAEFETIVA    IS NULL '                                               + #13 +
   '      AND    H.CODDOCUMENTO      IS NULL '                                               + #13 +
   '      AND    H.HMEDATAVENCTO     = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '              + #13 +
   '      AND    (H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO       = 1 ) '                     + #13 +
   '      AND    (H.FLGESTORNADO     IS NULL OR H.FLGESTORNADO   = 0 ) '                     + #13 +
   '      AND    (H.FLGABONADO       IS NULL OR H.FLGABONADO     = 0 ) '                     + #13 +
   '      AND    (H.FLGQUITADO       IS NULL OR H.FLGQUITADO     = 0 ) '                     + #13 +
   '      AND    (H.FLGSUSPENSAO     IS NULL OR H.FLGSUSPENSAO   = 0 ) '                     + #13 +
   '  ) HME '                                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '       ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO  ) '                               + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                    + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                    + #13 +
   // Inicio SIG 125535 Ferrari
   '   AND (HME.HMEVLRPREVISTO <> 0 or HME.HMESEQCOBRANCA <> 2)                            ' + #13 +
   // Fim
   'ORDER BY '                                                                               + #13 +
   '   CON.IDCONTRATOEMPTMO, HME.HMEPARCELA, HME.HMEDATAVENCTO ';

   Result := sSQL;
end;


//Pendência 24149 - 25/01/2007 - Alberto

procedure TfrmExecEnvioLoteConcessao.Envia;
var
   iPlanilha   : Integer;
   iResult     : Integer;
   iResultPGA  : Integer;//Ádler Souza - SOL 129014 Kintana 698559
   iContador   : Integer;
   sResult     : TStringList;
   sErro       : TStringList;
   sSQLEnvio   : String;
   sHistorico  : String;
   sDataEnvio  : String;
   sTipoContr  : String;
   iPortForma  : Integer;
   iDocumentoPai : INteger; //Teste Renato Visoni
begin
   iPortForma := 0;
   sTipoContr := '';

   if DBcboPortadorForma.LookupValue <> '' then
      iPortForma := StrToInt(DBcboPortadorForma.LookupValue);

   if DBcboTipoContrato.LookupValue <> '' then
      sTipoContr := DBcboTipoContrato.LookupValue;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      with qryContratosAEnviar do
      begin
         DisableControls;

         First;
         iContador := 0;
         MostraFormProgresso('Atualizando Plano de Origem...',
                             0,
                             qryContratosAEnviar.RecordCount,
                             True,
                             False
                            );

         while not(EOF) do
         begin
            // só faz o update do planoorigem se for concessão
            if qryContratosAEnviarHMETIPOMOV.AsInteger = 0 then
            begin
               IntegraEmptmo.AcertaPlanoOrigem(qryContratosAEnviarIDCONTRATOEMPTMO.AsFloat,
                                               qryContratosAEnviarIDBENEF.AsFloat,
                                               qryContratosAEnviarIDPLANOPREV.AsInteger,
                                               True
                                              );
            end;

            Next;
            inc(iContador);
            AndaFormProgresso(iContador);
         end;

         EnableControls;

         Repaint;
         Application.ProcessMessages;
      end;  // with qryContratosAEnviar
   end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1

   EscondeFormProgresso;

   Repaint;
   Application.ProcessMessages;

   try
      // limpa os memos de resultado e erro
      memResult.Clear;

      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      if not qryContratosAEnviar.IsEmpty then
      begin
         // Loop por data de Crédito ---------------------------------------------------------------------
         for iContador := trunc(edtDataIni.Date) to trunc(edtDataFim.Date) do
         begin
            sDataEnvio := FormatDateTime('dd/mm/yyyy', iContador);

            memResult.Lines.Add('- ' + sDataEnvio + ':');

            with qryPortForma do
            begin
               LimpaParametros(qryPortForma);
               ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
               ParamByName('PDATACREDITO').AsDate           := iContador;

               if molContratoEmptmo.IDContrato > 0    then ParamByName('PIDCONTRATOEMPTMO').AsFloat      := molContratoEmptmo.IDContrato;
               if DBcboTipoEmptmo.LookupValue <> ''   then ParamByName('PIDTIPOEMPTMO').AsInteger        := StrToInt(DBcboTipoEmptmo.LookupValue);
               if DBcboTipoContrato.LookupValue <> '' then ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := StrToInt(DBcboTipoContrato.LookupValue);

               Open;
               First;
            end;

            // Loop por PortadorForma --------------------------------------------------------------------
            while not(qryPortForma.EOF) do
            begin

               with qryTipoContr do
               begin
                  LimpaParametros(qryTipoContr);
                  ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                  ParamByName('PDATACREDITO').AsDate           := iContador;

                  if molContratoEmptmo.IDContrato > 0    then ParamByName('PIDCONTRATOEMPTMO').AsFloat      := molContratoEmptmo.IDContrato;
                  if DBcboTipoEmptmo.LookupValue <> ''   then ParamByName('PIDTIPOEMPTMO').AsInteger        := StrToInt(DBcboTipoEmptmo.LookupValue);
                  if DBcboTipoContrato.LookupValue <> '' then ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := StrToInt(DBcboTipoContrato.LookupValue);

                  Open;
                  First;
               end;

               sTipoContr := '';
               // Loop por Tipo de Contrato --------------------------------------------------------------
               while not(qryTipoContr.EOF) do
               begin
                  if   sTipoContr = '' then sTipoContr := sTipoContr + qryTipoContrIDTIPOCONTREMPTMO.AsString
                  else sTipoContr                      := sTipoContr + ',' + qryTipoContrIDTIPOCONTREMPTMO.AsString;

                  qryTipoContr.Next;
               end;

               MostraEspera('Selecionando Itens a Enviar em ' + sDataEnvio + ' para: ' +
                            qryPortFormaDESCRICAO.AsString + '...');

               sSQLEnvio   := MontaSQLEnvio(QuotedStr(sDataEnvio),
                                            //Pendência 24149 - 09/02/2007 - Alberto
                                            //iPortForma,
                                            qryPortFormaPORTFORMAPAG.AsInteger,
                                            //Fim Pendência 24149
                                            sTipoContr
                                           );

               //sHistorico  := 'Concessao/Renovacao de Emprestimos: ' + sDataEnvio; //Everson Cunha - SIG126804
               sHistorico  := 'Concessão/Renovação de Empréstimos: ' + sDataEnvio;   //Everson Cunha - SIG126804
               iPlanilha   := 0;

               EscondeEspera;

               // ----------------------------------------------------------------------------------

               // Inicia uma transação - só se não ouver transação iniciada
               if dtmBaseDados.dbBaseDados.InTransaction then
               begin
                  MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
                  Repaint;
                  Exit;
               end;

               StartTransacao;

               // ----------------------------------------------------------------------------------

               sResult.Clear;
               sErro.Clear;

               iDocumentoPai := -1; //Teste Renato Visoni

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

               if iResult <> 0 then
               begin
                  memResult.Lines.Add('  ' +
                                      CompletaFim(qryPortFormaDESCRICAO.AsString, ' ', 50) +
                                      ': ' +
                                      trim(sErro.Text)
                                     );
                  if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
               end;

               //teste renato visoni
               sSQLenvio :='';
               sSQLEnvio   := MontaSQLTaxaPga(QuotedStr(sDataEnvio),
                                            qryPortFormaPORTFORMAPAG.AsInteger,
                                            sTipoContr
                                            ,'');

               //Ádler Souza - SOL 129014 Kintana 698559
               iResultPGA := IntegraEmptmo.EnviaTaxaPGA(sSQLEnvio,
                                                           sHistorico,
                                                           SysDate,
                                                           -1,
                                                           Modulo.iMoedaCorrente,
                                                           Modulo.sCentroCusto,
                                                           Modulo.iPrograma,
                                                           iPlanilha,
                                                           sResult,
                                                           sErro,
                                                           iDocumentoPai // Teste Renato Visoni
                                                          );

               //Ádler Souza - SOL 129014 Kintana 698559
               if ((iResult = 0) or (iResultPGA = 0)) then
               begin
                  memResult.Lines.Add('  ' +
                                      CompletaFim(qryPortFormaDESCRICAO.AsString, ' ', 50) +
                                      ': ' +
                                      trim(sResult.Text)
                                     );

                  if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
               end
               else
               begin
                  memResult.Lines.Add('  ' +
                                      CompletaFim(qryPortFormaDESCRICAO.AsString, ' ', 50) +
                                      ': ' +
                                      trim(sErro.Text)
                                     );
                  if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
               end;

               //teste renato visoni


               qryPortForma.Next;
            end;  // while not(qryPortForma.EOF)
            // FIM Loop por PortadorForma ----------------------------------------------------------------
         end;  // for iContador := trunc(edtDataIni.Date) to trunc(edtDataFim.Date)
         // FIM Loop por data de Crédito -----------------------------------------------------------------
      end;

   finally
      sResult.Free;
      sErro.Free;

      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
   end;
end;



procedure TfrmExecEnvioLoteConcessao.EnviaFUNCEF;
var
   iPlanilha   : Integer;
   iResult     : Integer;
   iResultPGA  : Integer; //Ádler Souza - SOL 129014 Kintana 698559
   iContador   : Integer;
   sResult     : TStringList;
   sErro       : TStringList;
   sSQLEnvio   : String;
   sHistorico  : String;
   sDataEnvio  : String;
   sTipoContr  : String;
   iPortForma  : Integer;
   iDocumentoPai : Integer;// teste renato visoni
   recPag      : String;
   i : integer;
begin
   iPortForma := 0;
   sTipoContr := '';

   if DBcboPortadorForma.LookupValue <> '' then
      iPortForma := StrToInt(DBcboPortadorForma.LookupValue);

   if DBcboTipoContrato.LookupValue <> '' then
      sTipoContr := DBcboTipoContrato.LookupValue;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      with qryContratosAEnviar do
      begin
         DisableControls;

         First;
         iContador := 0;
         MostraFormProgresso('Atualizando Plano de Origem...',
                             0,
                             qryContratosAEnviar.RecordCount,
                             True,
                             False
                            );

         while not(EOF) do
         begin
            // só faz o update do planoorigem se for concessão
            if qryContratosAEnviarHMETIPOMOV.AsInteger = 0 then
            begin
               IntegraEmptmo.AcertaPlanoOrigem(qryContratosAEnviarIDCONTRATOEMPTMO.AsFloat,
                                               qryContratosAEnviarIDBENEF.AsFloat,
                                               qryContratosAEnviarIDPLANOPREV.AsInteger,
                                               True
                                              );
            end;

            Next;
            inc(iContador);
            AndaFormProgresso(iContador);
         end;

         EnableControls;

         Repaint;
         Application.ProcessMessages;
      end;  // with qryContratosAEnviar
   end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1

   EscondeFormProgresso;

   Repaint;
   Application.ProcessMessages;

   try
      // limpa os memos de resultado e erro
      memResult.Clear;

      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      if not qryContratosAEnviar.IsEmpty then
      begin
         // Loop por data de Crédito ---------------------------------------------------------------------
         for iContador := trunc(edtDataIni.Date) to trunc(edtDataFim.Date) do
         begin
            sDataEnvio := FormatDateTime('dd/mm/yyyy', iContador);

            memResult.Lines.Add('- ' + sDataEnvio + ':');

            sTipoContr := '';

            MostraEspera('Selecionando Itens a Enviar em ' + sDataEnvio + ' para: ' +
                         qryPortFormaDESCRICAO.AsString + '...');

            sSQLEnvio   := MontaSQLEnvio(QuotedStr(sDataEnvio),
                                         iPortForma,
                                         sTipoContr
                                        );


            //sHistorico  := 'Concessao/Renovacao de Emprestimos: ' + sDataEnvio; //Everson Cunha - SIG126804
            sHistorico  := 'Concessão/Renovação de Empréstimos: ' + sDataEnvio;   //Everson Cunha - SIG126804
            iPlanilha   := 0;

            EscondeEspera;

            // ----------------------------------------------------------------------------------

            
            // Inicia uma transação - só se não ouver transação iniciada
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
               MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;

            StartTransacao;

            // ----------------------------------------------------------------------------------

            sResult.Clear;
            sErro.Clear;

            
            UIntegraEmptmo.iDocumentoPai := -1; //teste renato visoni
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


            //teste renato visoni
            if iResult <> 0 then
            begin
               memResult.Lines.Add('  ' +
                                   CompletaFim(qryPortFormaDESCRICAO.AsString, ' ', 50) +
                                   ': ' +
                                   trim(sErro.Text)
                                  );
               if dtmBaseDados.dbBaseDados.InTransaction then begin
                 RollbackTransacao;
                 Exit;
               end;
            end;





            lstDocumentosCapCar := TstringList.Create();

            for i := 0 to 1 do begin

               sSQLenvio   :='';

               if i = 0 then begin
                 sSQLEnvio   := MontaSQLTaxaPga(QuotedStr(sDataEnvio),
                                                qryPortFormaPORTFORMAPAG.AsInteger,
                                                sTipoContr,
                                                'P') ;
                 recPag :='P';
               end else begin
                 sSQLEnvio   := MontaSQLTaxaPga(QuotedStr(sDataEnvio),
                                              qryPortFormaPORTFORMAPAG.AsInteger,
                                              sTipoContr,
                                              'R');
                 recPag :='R';
               end;

               sSQLEnvio := sSQLEnvio +  'ORDER BY 1,3,10,9 ';



               iResultPGA := IntegraEmptmo.EnviaTaxaPGA(sSQLEnvio,
                                                             sHistorico,
                                                             SysDate,
                                                             -1,
                                                             Modulo.iMoedaCorrente,
                                                             Modulo.sCentroCusto,
                                                             Modulo.iPrograma,
                                                             iPlanilha,
                                                             sResult,
                                                             sErro,
                                                             UIntegraEmptmo.iDocumentoPai,// Teste Renato Visoni
                                                             lstDocumentosCapCar, // Teste Renato Visoni
                                                             recPag
                                                            );

//            if iResult <> 0 then break; //Ádler Souza - SOL 129014 Kintana 698559 
            end;

            if ((iResult = 0) or (iResultPGA = 0)) then
            begin
               memResult.Lines.Add('  ' +
                                   CompletaFim(qryPortFormaDESCRICAO.AsString, ' ', 50) +
                                   ': ' +
                                   trim(sResult.Text)
                                  );

               for i := 0 to lstDocumentosCapCar.count -1 do begin
                 with dtmIntegraEmptmo.qryUpdateDocumento do
                 begin
                    ParamByName('PIDHISTMOVEMPTMO').asString   := Copy(lstDocumentosCapCar[i],1,pos(';',lstDocumentosCapCar[i])-1);
                    ParamByName('PCODDOCUMENTO').asString    := Copy(lstDocumentosCapCar[i],pos(';',lstDocumentosCapCar[i])+1, Length(lstDocumentosCapCar[i]));
                                 ExecSQL;
                 end;
               end;

                            if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
            end
            else
            begin

               MsgDlg('Ocorreu erro no momento da transferência da taxa administrativa.',
                'Empréstimo', mtInformation, [mbOK], 0);

               memResult.Lines.Add('  ' +
                                   CompletaFim(qryPortFormaDESCRICAO.AsString, ' ', 50) +
                                   ': ' +
                                   trim(sErro.Text)
                                  );
               if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
            end;
            //teste renato visoni

         end;  // for iContador := trunc(edtDataIni.Date) to trunc(edtDataFim.Date)
         // FIM Loop por data de Crédito -----------------------------------------------------------------
      end;

   finally
      sResult.Free;
      sErro.Free;
      lstDocumentosCapCar.Free;
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
   end;
end;



procedure TfrmExecEnvioLoteConcessao.DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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
      if Field = qryContratosAEnviarDESC_EVENTO then
      begin
         if qryContratosAEnviarDESC_EVENTO.AsString = 'Quitação' then

         begin
            ABrush.Color := clHighLight;
            AFont.Color  := clHighLightText;
         end
         else
         begin
            ABrush.Color := clWindow;
            AFont.Color  := clWindowText;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecEnvioLoteConcessao.DBgrdHistMovTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecEnvioLoteConcessao.FormShow(Sender: TObject);
begin
   inherited;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   edtDataIni.Date   := Date;
   edtDataFim.Date   := Date;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);


   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      rdgEnvio.ItemIndex := 2;
   end
   else
   begin
      rdgEnvio.ItemIndex := 0;
   end;
end;



procedure TfrmExecEnvioLoteConcessao.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecEnvioLoteConcessao.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecEnvioLoteConcessao.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecEnvioLoteConcessao.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmExecEnvioLoteConcessao.btnContinuarClick(Sender: TObject);
begin
   ParametrosSistema;

   case pgcControle.ActivePageIndex of

      0:
      if VerificaPreenchimento then
      begin
         if AbreContratosAEnviar then inherited;
      end;

      1: begin
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
                 EnviaFUNCEF
            else Envia;
            
            inherited;
         end;
   end;
end;



procedure TfrmExecEnvioLoteConcessao.bbtnConfirmarClick(Sender: TObject);
begin
   qryContratosAEnviar.Close;

   inherited;
end;



procedure TfrmExecEnvioLoteConcessao.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmExecEnvioLoteConcessao.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmExecEnvioLoteConcessao.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   //Pendência 23388 - 26/09/2006
   with dtmLookEmptmo.qryLookTipoContrato do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);
   //Fim Pendência 23388

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TfrmExecEnvioLoteConcessao.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   //Pendência 23388 - 26/09/2006
   //with dtmLookEmptmo.qryLookTipoContr do
   //begin
   //   LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

   with dtmLookEmptmo.qryLookTipoContrato do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);
   //Fim Pendência 23388

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



//Pendência 24149 - 25/01/2007 - Alberto
procedure TfrmExecEnvioLoteConcessao.DBcboPortadorFormaExit(Sender: TObject);
begin
  inherited;

  if trim(DBcboPortadorForma.Text) = '' then
    DBcboPortadorForma.LookupValue := '';

end;
//Fim Pendência 24149



function TfrmExecEnvioLoteConcessao.MontaSQLTaxaPga(const sData: String;
  const iPortForma: Integer; const sTipoContr: String;
  RecPag: String ): String; // Teste renato visoni
var
   sSQL : String;
begin
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL :=
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                             + #13
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   else sSQL :=
   'SELECT '                                                                                 + #13;

   // Pendência 23251 - 01/02/2007 - Alberto
   // Ajustes na query pois o Oracle 9.0.2.4 ou superior não aceita subquery em outer join

   if  RecPag <> 'R' then begin
     //William Moreira da Silva - SOL 261401 PPM 1120372
     //sSQL := sSQL + ' HME.HMERECPAG,CON.IDPLANOPREV,CON.IDPATRO ,HME.IDPLANOCONTANT AS IDPLANOORIGEM , ';
     sSQL := sSQL + ' HME.RECPAG, CON.IDPLANOPREV,CON.IDPATRO ,HME.IDPLANOCONTANT AS IDPLANOORIGEM , ';
     //William Moreira da Silva - SOL 261401 PPM 1120372
   end else begin
     sSQL := sSQL + ' ''R'' as HMERECPAG, '+

     ' (select pp.idpatro    '                                                               + #13 +
     '  from planprevcontabpatro pp, pessoa pe, planprevcontabil pl  '                       + #13 +
     ' where pp.idpatro = pe.idpessoa '                                                      + #13 +
     '   and pp.idplanoprev = pl.idplanoprev '                                               + #13 +
     '   and pl.flgusopga = ''S'' '                                                          + #13 +
     '   and rownum = 1) as idpatro, '                                                       + #13 +

     ' (select pp.idplanoprev    '                                                           + #13 +
     '  from planprevcontabpatro pp, pessoa pe, planprevcontabil pl  '                       + #13 +
     ' where pp.idpatro = pe.idpessoa '                                                      + #13 +
     '   and pp.idplanoprev = pl.idplanoprev '                                               + #13 +
     '   and pl.flgusopga = ''S'' '                                                          + #13 +
     '   and rownum = 1) as idplanoprev, '                                                   + #13 +

     ' (select pp.idplanoprev    '                                                           + #13 +
     '  from planprevcontabpatro pp, pessoa pe, planprevcontabil pl  '                       + #13 +
     ' where pp.idpatro = pe.idpessoa '                                                      + #13 +
     '   and pp.idplanoprev = pl.idplanoprev '                                               + #13 +
     '   and pl.flgusopga = ''S'' '                                                          + #13 +
     '   and rownum = 1) as IDPLANOORIGEM, '                                                 + #13;


   end;


   sSQL := sSQL +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +

   //William Moreira da Silva - SOL 261401 PPM 1120372
   {'  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                          + #13 +
   '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                   + #13 +
   '  HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
   '  HME.HMEPARCELA, NVL(HME.HMENUMPARCELAS, 0) AS HMENUMPARCELAS, HME.HMESALDODEV, '       + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +
   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +}
   ' HME.FORMACOBRANCA AS HMEFORMACOBRANCA,                                                 ' + #13 +
   '    ABS(NVL(HME.VLRPREVISTO, 0)) AS HMEVLRPREVISTO,                                     ' + #13 +
   '    HME.DATAPREVISTA HMEDATAPREVISTA,                                                   ' + #13 +
   '    HME.DATAVENCTO AS  HMEDATAVENCTO,                                                   ' + #13 +
   '    HME.PARCELA AS HMEPARCELA,                                                          ' + #13 +
   '    NVL(HME.NUMPARCELAS, 0) AS NUMPARCELAS,                                             ' + #13 +
   '    HME.SALDODEV AS HMESALDODEV,                                                        ' + #13 +
   '   (LTRIM(RTRIM(to_number(to_char(HME.dataprevista,''YYYY'')))))|| ''/'' ||                 ' + #13 +
   '   (LTRIM(RTRIM( to_number(to_char(HME.dataprevista,''MM''))))) AS ANOMESCOMPETENCIA,     ' + #13 +
   //William Moreira da Silva - SOL 261401 PPM 1120372

   '  CON.IDBENEF, CON.IDPESSOA, CON.MATRICULA_TIT AS MATRICULA, '                           + #13 +
   '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC,       '                           + #13 +
   //William Moreira da Silva - SOL 261401 PPM 1120372
   //'  DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIA,HME.IDCBANCARIA) AS IDCBANCARIA, '         + #13 +
   ' CON.IDCBANCARIA, '                                                                      + #13 +
   //William Moreira da Silva - SOL 261401 PPM 1120372
   '  CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO, '         + #13 +
   '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                  + #13 +
   'FROM '                                                                                   + #13 +
   '  ( '                                                                                    + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                               + #13
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   else sSQL := sSQL +
   'SELECT '                                                                                 + #13;

   sSQL := sSQL +
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
   '     CON.NUMPARCELAS            AS PRAZO, '                                              + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +
   '     TEP.IDEMPRESAPROP, '                                                                + #13 +
   '     CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM, '        + #13 +
   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                      + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF, '                                           + #13 +
   '     CON.MOECODIGO,             CON.IDCBANCARIADEB, '                                    + #13 +
   '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '             + #13 +
   '     ELP.MATRICULA                 AS MATRICULA_TIT, '                                   + #13 +
   '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                  + #13 +
   '     PPP.INSCRICAONUMERO, '                                                              + #13 +
   '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                 + #13 +
   '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                      + #13 +
   '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                    + #13 +
   '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                        + #13 +
   '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                     + #13 +
   '     CON.IDPATRO, '                                                                      + #13 +
   '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO ' + #13 +
   '  FROM '                                                                                 + #13 +
   '     CONTRATOEMPTMO  CON, '                                                              + #13 +
   '     PARTPREVPLAN    PPP, '                                                              + #13 +
   '     ELEGPATRO       ELP, '                                                              + #13 +
   '     PATRO           PTR, '                                                              + #13 +
   '     PLANPREV        PLP, '                                                              + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '     TIPOEMPTMO      TEP, '                                                              + #13 +
   '     SITPART         SIT, '                                                              + #13 +
   '     SITPLANOPREV    SPP '                                                               + #13 +
   '  WHERE '                                                                                + #13 +
   '         TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                         + #13 +
   '     AND CON.FLGSITUACAO       <> ''C'' '                                                + #13;

   if iPortForma > 0 then sSQL := sSQL +
   '     AND CON.PORTFORMAPAG      = ' + IntToStr(iPortForma)                                + #13;

   if  (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) and (sTipoContr <> '') then sSQL := sSQL +
   '     AND CON.IDTIPOCONTREMPTMO IN (' + sTipoContr + ')'                                  + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)     + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '     AND TCE.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                         + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '     AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue                       + #13;

   sSQL := sSQL +
   '     AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                    + #13 +
   '     AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                    + #13 +
   '     AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                       + #13 +
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
   '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                         + #13 +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +
   //'   AND PPP.FLGDESATIVADO     = 0 '                                                       + #13 +
   //    Jéssica Lana SOL 122495 KNT 601806
{   '     AND (PPP.FLGDESATIVADO = 0 OR (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1 WHERE ppp1.idpessoa = ppp.idpessoa '  + #13 +
   '     AND ppp1.flgdesativado = 0)'                                                                                                               + #13 +
   '     AND (ppp.idsitplanoprev = 25 OR (ppp.idplanoprev = (select max(ppp1.idplanoprev) from partprevplan ppp1 where ppp1.idpessoa = ppp.idpessoa'+ #13 +
   '     AND ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento) FROM partprevplan ppp2 WHERE ppp2.idpessoa = ppp1.idpessoa)'                + #13 +
   '     AND NOT exists (select 1 from partprevplan ppp2 where ppp2.idpessoa = ppp1.idpessoa and ppp2.idsitplanoprev = 25))))))'                    + #13 +}
   //    Jéssica Fim ...

//Ádler Souza - SOL 140061 KINTANA 873291
   '          AND (ppp.idplanoprev = '                                           + #13 +
   '        (SELECT MAX(ppp2.idplanoprev) '                                      + #13 +
   '          FROM partprevplan ppp2 '                                           + #13 +
   '         WHERE ppp2.flgdesativado = 0 '                                      + #13 +
   '           AND ppp2.idpessoa = ppp.idpessoa) OR '                            + #13 +
   '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS '                              + #13 +
   '        (SELECT 1 '                                                          + #13 +
   '           FROM partprevplan ppp1 '                                          + #13 +
   '          WHERE ppp1.idpessoa = ppp.idpessoa '                               + #13 +
   '            AND ppp1.flgdesativado = 0) AND '                                + #13 +
   '        (ppp.idsitplanoprev = 25 OR '                                        + #13 +
   '        (ppp.idplanoprev = '                                                 + #13 +
   '        (SELECT MAX(ppp1.idplanoprev)'                                       + #13 +
   '             FROM partprevplan ppp1 '                                        + #13 +
   '            WHERE ppp1.idpessoa = ppp.idpessoa '                             + #13 +
   '              AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = '              + #13 +
   '                  (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) '   + #13 +
   '                     FROM partprevplan ppp2 '                                + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa) '                   + #13 +
   '              AND NOT EXISTS (SELECT 1 '                                     + #13 +
   '                     FROM partprevplan ppp2 '                                + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa '                    + #13 +
   '                      AND ppp2.idsitplanoprev = 25)))))) '                   + #13 +

   //Fim - Ádler Souza - SOL 140061 KINTANA 873291
   '  ) CON, '                                                                               + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC, '                                                                 + #13 +

   //William Moreira da Silva - SOL 261401 PPM 1120372 - Inicio
   {'  ( '                                                                                    + #13 +
   '      SELECT M.IDPATROANT, M.IDPLANOCONTANT, H.* '                                       + #13 +
   '      FROM   MIGRACONTRATOEP M, HISTMOVEMPTMO H '                                        + #13 +
   ' JOIN histmovemptmo hcentralizador ON hcentralizador.iditememptmo = h.iditemcentraliza ' + #13 +
   '                                            AND hcentralizador.idcontratoemptmo = h.idcontratoemptmo '  + #13 +
   '                                            AND hcentralizador.hmedataprevista = h.hmedataprevista   '  + #13 +}
   '    (SELECT   M.IDPATROANT, M.IDPLANOCONTANT, H.* FROM MIGRACONTRATOEP M, HMECONCESSAO H  '+ #13 +
   '  JOIN HMECONCESSAO HH ON HH.IDITEMEMPTMO=H.IDITEMEMPTMO                                  '+ #13 +
   '  AND HH.IDCONTRATOEMPTMO=H.IDCONTRATOEMPTMO                                              '+ #13 +
   '   AND HH.DATAPREVISTA=H.DATAPREVISTA                                                     '+ #13 +
   //William Moreira da Silva - SOL 261401 PPM 1120372 - FIM

   '      WHERE  M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    M.DATAMIGRA        = (SELECT MIN(DATAMIGRA) '                               + #13 +
   '                                   FROM   MIGRACONTRATOEP '                              + #13 +
   '                                   WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '        + #13 +

   //William Moreira da Silva - SOL 261401 PPM 1120372 - Inicio
   {//Pendência 27641 - 25/03/2008
   //'                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '               + #13 +
   '                                   AND    DATAMIGRA > H.HMEDATAVENCTO) '                 + #13 +
   '      AND    H.HMEFORMACOBRANCA  = ''C'' '                                               + #13 +
   '      AND    H.HMERECPAG         = ''P'' '                                               + #13 +
   '      AND    H.FLGENVIO          = 0 '                                                   + #13 ;
   //'      AND    H.FLGBAIXADO        = 0 '                                                   + #13;
   case rdgEnvio.ItemIndex of
      0: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        = 0 '                                                   + #13;
      1: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        <> 0 '                                                  + #13;
   end;
   sSQL := sSQL +
   //'      AND    H.HMEVLREFETIVO     IS NULL '                                               + #13 +
   //'      AND    H.HMEDATAEFETIVA    IS NULL '                                               + #13 +
   '      AND    H.CODDOCUMENTO      IS NULL '                                               + #13 +
   '      AND    H.HMEDATAVENCTO     = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '              + #13 +
   //'      AND    (H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO       = 1 ) '                     + #13 +
    //Ádler Souza - SOL 129014 Kintana 698559
    //' AND (H.IDITEMEMPTMO = 60) '
    'AND (H.IDITEMEMPTMO IN (SELECT ixt.iditememptmo FROM itemxtipocontr ixt ' + #13 +
    '                    WHERE ixt.flgenviapga = 1))                         ' + #13 +
    //Fim - Ádler Souza - SOL 129014 Kintana 698559
    ' AND    hcentralizador.HMEVLREFETIVO     IS NULL ' + #13 +
    ' AND    hcentralizador.HMEDATAEFETIVA    IS NULL ' + #13 +
    ' AND    hcentralizador.FLGBAIXADO        = 0 '     + #13 +
   '  AND    (H.FLGESTORNADO     IS NULL OR H.FLGESTORNADO   = 0 ) '                         + #13 +
   '  AND    (H.FLGABONADO       IS NULL OR H.FLGABONADO     = 0 ) '                         + #13 +
   '  AND    (H.FLGQUITADO       IS NULL OR H.FLGQUITADO     = 0 ) '                         + #13 +
   '  AND    (H.FLGSUSPENSAO     IS NULL OR H.FLGSUSPENSAO   = 0 ) '                         + #13 +}

   ' AND DATAMIGRA > H.DATAVENCTO)                                                                                     '+ #13 +
   '                AND H.FORMACOBRANCA=''C''                                                                            '+ #13 +
   '                AND H.RECPAG=''P''                                                                                   '+ #13 +
   '                AND H.FLGENVIO=0                                                                                   '+ #13 ;
    case rdgEnvio.ItemIndex of
      0: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        = 0 '                                                   + #13;
      1: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        <> 0 '                                                  + #13;
   end;
   sSQL := sSQL + '           AND h.idhistmovemptmo IN  (SELECT he.idhistmovemptmo FROM HMEENVIO HE WHERE  HE.CODDOCUMENTO IS NULL)   '+ #13 +
   '               AND H.DATAVENCTO = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '              + #13 +
   '             AND (H.IDITEMEMPTMO IN                                                     '+ #13 +
   '                (SELECT IXT.IDITEMEMPTMO FROM ITEMXTIPOCONTR IXT                        '+ #13 +
   '                 WHERE IXT.FLGENVIAPGA = 1                                              '+ #13 +
   '                 AND IXT.FLGCENTRALIZA=1))                                              '+ #13 +
   '                 AND HH.VLRPREVISTO IS NULL                                             '+ #13 +
   '                 AND HH.DATAEFETIVA IS NULL                                             '+ #13 +
   '                 AND HH.FLGBAIXADO=0                                                    '+ #13 +
   '                 AND H.FLGESTORNADO =0                                                  '+ #13 +
   //William Moreira da Silva - SOL 261401 PPM 1120372 - Fim

   '  UNION  ALL '                                                                           + #13 +
   '  SELECT C.IDPATRO as IDPATROANT, '                                                      + #13 +
   '        NVL(C.IDPLANOORIGEM, C.IDPLANOPREV) as IDPLANOCONTANT, H.* '                     + #13 +

   //William Moreira da Silva - SOL 261401 PPM 1120372 - Inicio
   {'    FROM   CONTRATOEMPTMO C, HISTMOVEMPTMO H '                                           + #13 +
   '                          JOIN histmovemptmo hcentralizador ON hcentralizador.iditememptmo = h.iditemcentraliza '+ #13 +
   '                                            AND hcentralizador.idcontratoemptmo = h.idcontratoemptmo '+ #13 +
   '                                            AND hcentralizador.hmedataprevista = h.hmedataprevista   '+ #13 +}
   ' FROM CONTRATOEMPTMO C,HMECONCESSAO H                                '+ #13 +
   '             JOIN HMECONCESSAO HH ON HH.IDITEMEMPTMO=H.IDITEMEMPTMO  '+ #13 +
   '             AND HH.IDCONTRATOEMPTMO=H.IDCONTRATOEMPTMO              '+ #13 +
   '             AND HH.DATAPREVISTA=H.DATAPREVISTA                      '+ #13 +
   //William Moreira da Silva - SOL 261401 PPM 1120372 - Fim


   '      WHERE  C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +

   '      AND    NOT EXISTS( SELECT * '                                                      + #13 +
   '                         FROM   MIGRACONTRATOEP '                                        + #13 +
   '                         WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                  + #13 +

   //William Moreira da Silva - SOL 261401 PPM 1120372 - Inicio
   {//Pendência 27641 - 25/03/2008
   //'                         AND    DATAMIGRA > H.HMEDATAPREVISTA) '                         + #13 +
   '                         AND    DATAMIGRA > H.HMEDATAVENCTO) '                           + #13 +

   '      AND    H.HMEFORMACOBRANCA  = ''C'' '                                               + #13 +
   '      AND    H.HMERECPAG         = ''P'' '                                               + #13 +
   '      AND    H.FLGENVIO          = 0 '                                                   + #13 ;
   //'      AND    H.FLGBAIXADO        = 0 '                                                   + #13;
   case rdgEnvio.ItemIndex of
      0: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        = 0 '                                                   + #13;
      1: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        <> 0 '                                                  + #13;
   end;
   sSQL := sSQL +
   //'      AND    H.HMEVLREFETIVO     IS NULL '                                               + #13 +
   //'      AND    H.HMEDATAEFETIVA    IS NULL '                                               + #13 +
   '      AND    H.CODDOCUMENTO      IS NULL '                                               + #13 +
   '      AND    H.HMEDATAVENCTO     = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '              + #13 +
   //'      AND    (H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO       = 1 ) '                     + #13 +
      //Ádler Souza - SOL 129014 Kintana 698559
   //'      AND (H.IDITEMEMPTMO = 60) '+ #13 +
   '      AND (H.IDITEMEMPTMO IN (SELECT ixt.iditememptmo FROM itemxtipocontr ixt '          + #13 + //Se necessitar relacionamento com a CONTRATOEMPTMO
   '                               WHERE ixt.idtipocontremptmo = c.idtipocontremptmo '       + #13 +
   '                                 AND ixt.flgenviapga = 1)) '                             + #13 +
   //Fim - Ádler Souza - SOL 129014 Kintana 698559


   '      AND    hcentralizador.HMEVLREFETIVO     IS NULL '+ #13 +
   '      AND    hcentralizador.HMEDATAEFETIVA    IS NULL '+ #13 +
   '      AND    hcentralizador.FLGBAIXADO        = 0     '+ #13 +


   '      AND    (H.FLGESTORNADO     IS NULL OR H.FLGESTORNADO   = 0 ) '                     + #13 +
   '      AND    (H.FLGABONADO       IS NULL OR H.FLGABONADO     = 0 ) '                     + #13 +
   '      AND    (H.FLGQUITADO       IS NULL OR H.FLGQUITADO     = 0 ) '                     + #13 +
   '      AND    (H.FLGSUSPENSAO     IS NULL OR H.FLGSUSPENSAO   = 0 ) '                     + #13 +
   '  ) HME '                                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '       ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO  ) '                               + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                    + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                    + #13 ;}
   '             AND DATAMIGRA > H.DATAVENCTO)                                                ' + #13 +
   '               AND H.FORMACOBRANCA = ''C''                                                  ' + #13 +
   '        AND H.RECPAG = ''P''                                                                ' + #13 +
   '        AND H.FLGENVIO = 0                                                                '+ #13 ;

   case rdgEnvio.ItemIndex of
      0: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        = 0 '                                                   + #13;
      1: sSQL := sSQL +
   '      AND    H.HMETIPOMOV        <> 0 '                                                  + #13;
   end;

   sSQL := sSQL + 
   '           AND h.idhistmovemptmo IN  (SELECT he.idhistmovemptmo FROM HMEENVIO HE WHERE    ' + #13 +
   '              HE.CODDOCUMENTO IS NULL)                                                    ' + #13 +
   '                 AND H.DATAVENCTO = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '              + #13 +
   '   AND (H.IDITEMEMPTMO IN                                                                 ' + #13 +
   '            (SELECT IXT.IDITEMEMPTMO                                                      ' + #13 +
   '                FROM ITEMXTIPOCONTR IXT                                                   ' + #13 +
   '               WHERE IXT.IDTIPOCONTREMPTMO = C.IDTIPOCONTREMPTMO                          ' + #13 +
   '                 AND IXT.FLGENVIAPGA = 1                                                  ' + #13 +
   '                   AND IXT.FLGCENTRALIZA=1))                                              ' + #13 +
   '                AND HH.VLREFETIVO IS NULL                                                 ' + #13 +
   '                AND HH.DATAEFETIVA IS NULL                                                ' + #13 +
   '                AND HH.FLGBAIXADO=0 AND H.FLGESTORNADO =0) HME                            ' + #13 +
   '                                WHERE HME.IDCONTRATOEMPTMO=CON.IDCONTRATOEMPTMO           ' + #13 +
   '              AND CON.IDTIPOCONTREMPTMO=ITC.IDTIPOCONTREMPTMO                             ' + #13 +
   '              AND ITC.IDITEMEMPTMO=IRC.IDITEMEMPTMO                                       ' + #13 +
   '              AND ITC.IDITEMEMPTMO=HME.IDITEMEMPTMO                                       ' + #13;
   //William Moreira da Silva - SOL 261401 PPM 1120372 - Fim

   Result := sSQL;
end;

end.
