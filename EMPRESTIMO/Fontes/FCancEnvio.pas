{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Alterações  : DesfazParcelaTmpDesc1
Pendência   : 101022
Responsável : Helen
Data        : 11/03/2024
Descrição   : Eliminar registros negativos da TMPDESC abatendo de registros
              positivos.
--------------------------------------------------------------------------------
Alterações  : (.dfm qryItensCapCar), AbreCaPCaR, DesfazDocumentoCapCar
Pendência   : 113052
Responsável : Edilaine
Data        : 12/02/2021
Descrição   : Exclusão da tabela HISTENVIOEMPTMO ao desfazer envio - adicionado parâmetro.
--------------------------------------------------------------------------------
Alterações  : DesfazDocumentoCapCar
Pendência   : 102325
Responsável : Taffarel Sevaybriker
Data        : 13/11/2020
Descrição   : Exclusão da tabela HISTENVIOEMPTMO ao desfazer envio - adicionado parâmetro.
//------------------------------------------------------------------------------
Pendência   : Sol: 253185 PPM: 2040335
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------
Pendência   : SOL 194460 Kintana 1861972
Responsável : Fernando Xavier
Data        : 22/11/2012
Descrição   : Ao fazer e desfazer o envio dos itens para a Folha de Benefícios a
             funcionalidade não está considerando a data de vencimento informada
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : SOL 141516 Kintana 897025
Responsável : Fernando Xavier
Data        : 04/01/2011
Descrição : Ao desfazer o envio a rubrica informativa deverá ser apagada, 
                 da mesma forma como ocorre com a rubrica normal.
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
Rotina    : qryTmpDesc
Data      : 19/12/2007
Autor     : Alberto
Pendência : 27120
Descrição : Coluna SISTORIGEM é numérica na tabela TMPDESC
            qryTmpDescSISTORIGEM alterado de TStringField para TFloatField
--------------------------------------------------------------------------------
Rotina    :
Data      : 27/09/2005
Autor     : André Pontes
Pendência : 20306
Descrição : Não desfazer documentos criados pelo envio de concessões em lote
            (ie, que conté + de 1 Contrato)
--------------------------------------------------------------------------------
Rotina    : AbreCapCar
Data      : 26/09/2005
Autor     : Marchetti
Pendência : 20028
Descrição : Colocado filtro por usuário na tabela DOCUMENTO
--------------------------------------------------------------------------------
Rotina    :
Data      : 19/07/2004 a 22/07/2004
Autor     : André Pontes
Pendencia :
Descrição : Form completamente reescrito, em função do envio agrupado e do
            péssimo desempenho apresentado.
            Novo form baseado no conceito do Recebimento, ie, partindo da
            TMPDESC e da DOCUMENTO para a HistMovEmptmo, e não o contrário, como
            era anteriormente.
            Passa a existir uma restrição adicional: se o registro (TMPDESC
            apenas, claro) já houver sido processado em alguma PRÉVIA das
            folhas, não poderá ter seu envio desfeito.
--------------------------------------------------------------------------------
Rotina    :
Data      : 15/06/2004
Autor     : André Pontes
Pendência :
Descrição :
--------------------------------------------------------------------------------
Rotina    : MontaHistoricoMov
Data      : 04/08/2003
Autor     : Marchetti
Pendencia : 14763
Descrição : Filtro por Patro/Plano e gravação no LogTotalPrev
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCancEnvio;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, StdCtrls, Mask, wwdbedit, Wwdbspin, mListaPatro, wwdblook,
   mContratoEmptmo, mMutuario, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Db, DBTables,
   Wwquery, mUsuario, wwdbdatetimepicker, mListaPlano, UFuncoesEmptmo,

   uTypesEmptmo;

type
   TfrmCancEnvio = class(TfrmWizardMTEP)
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      Label3: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      molListaPatro: TmolListaPatro;
      grpRecebimento: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      chkCaP: TCheckBox;
      chkCaR: TCheckBox;
      Panel2: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      Panel3: TPanel;
      memResult: TMemo;
      qryHistMov: TwwQuery;
      qryTmpDesc: TwwQuery;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEORIGEM: TFloatField;
      qryHistMovHMERECPAG: TStringField;
      qryHistMovHMEFORMACOBRANCA: TStringField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovIDRUBRICA: TFloatField;
      qryHistMovHMEPRIORIDADE: TFloatField;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovIDREGRA: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
      qryHistMovIDITEMCENTRALIZA: TFloatField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      qryHistMovHMEDATAEFETIVA: TDateTimeField;
      qryHistMovFLGBAIXADO: TFloatField;
      qryHistMovFLGDIVERGPEND: TFloatField;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      qryHistMovFLGESTORNADO: TFloatField;
      qryHistMovFLGQUITADO: TFloatField;
      qryHistMovFLGABONADO: TFloatField;
      qryHistMovHMETIPOFOLHA: TStringField;
      qryTmpDescMESCOBRANCA: TStringField;
      qryTmpDescMESREFERENCIA: TStringField;
      qryTmpDescFLGDESCFOLHA: TStringField;
      qryTmpDescSITENVIO: TStringField;
      qryTmpDescIDDESCONTO: TFloatField;
      qryTmpDescORDEM: TFloatField;
      qryTmpDescVALOR: TFloatField;
      qryTmpDescVALORRECEBIDO: TFloatField;
      qryTmpDescDATARECEBIMENTO: TDateTimeField;
      qryTmpDescFLGTIPODESC: TStringField;
      qryTmpDescFLGATRASODEVOL: TStringField;
      qryTmpDescIDPROVENTO: TFloatField;
      qryTmpDescCODPROVDESC: TStringField;
      qryTmpDescMATRICULA: TStringField;
      qryTmpDescINSCRICAONUMERO: TFloatField;
      qryTmpDescIDTITULAR: TFloatField;
      qryTmpDescIDPESSOA: TFloatField;
      qryTmpDescIDPESSJUR: TFloatField;
      qryTmpDescIDPLANOPREV: TFloatField;
      qryTmpDescIDLOTE: TFloatField;
      qryTmpDescLOTEPREVIA: TFloatField;
      qryTmpDescNUMPRIORIDADE: TFloatField;
      qryTmpDescDESCRICAO: TStringField;
      qryTmpDescDATAREFERENCIA: TDateTimeField;
      qryTmpDescREFERENCIA: TStringField;
      qryTmpDescDATACOBRANCA: TDateTimeField;
      qryTmpDescFLGDESCONTO: TFloatField;
      qryTmpDescRECPAG: TStringField;
      qryTmpDescIDMODULO: TFloatField;
      qryTmpDescIDMOTIVO: TFloatField;
      qryTmpDescIDEMPRESAPROP: TFloatField;
      qryTmpDescIDEMPRESA: TFloatField;
      qryTmpDescIDFUNDACAO: TFloatField;
      qryTmpDescSEQPROPOSTA: TFloatField;
      qryTmpDescNODOCUMENTO: TFloatField;
      qryTmpDescCOMPLDOCUMENTO: TStringField;
      qryTmpDescFLGSITUACAO: TStringField;
      qryTmpDescIDTIPOCONTREMPTMO: TFloatField;
      qryItensCaPCaR: TwwQuery;
      grpDataEfetiva: TGroupBox;
      Label4: TLabel;
      edtDataVenctoIni: TwwDBDateTimePicker;
      edtDataVenctoFim: TwwDBDateTimePicker;
      qryTmpDescIDHISTMOVEMPTMO: TFloatField;
      qryTmpDescIDTMPDESC: TFloatField;
      Panel4: TPanel;
      memErro: TMemo;
      molListaPlano: TmolListaPlano;
      GroupBox1: TGroupBox;
      Label2: TLabel;
      edtDataEnvioIni: TwwDBDateTimePicker;
      edtDataEnvioFim: TwwDBDateTimePicker;
      qryItensCaPCaRIDCONTRATOEMPTMO: TFloatField;
      qryItensCaPCaRCODDOCUMENTO: TFloatField;
      qryItensCaPCaRHMETIPOMOV: TFloatField;
      qryItensCaPCaRVLR_PREVISTO_DOC: TFloatField;
      qryItensCaPCaRHMEDATAVENCTO: TDateTimeField;
      qryItensCaPCaRIDPATRO: TFloatField;
      qryItensCaPCaRIDPLANOPREV: TFloatField;
      qryItensCaPCaRFLGAPAGA: TStringField;
      molUsuario: TmolUsuario;
      qryContratoUnico: TwwQuery;
      qryContratoUnicoQUANT: TFloatField;
      Label7: TLabel;
      edtCodDocumento: TEdit;
    qryTmpDescSISTORIGEM: TFloatField;

      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure pgcControleChange(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molUsuariobtnBuscaUsuarioClick(Sender: TObject);
    procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


   private // Private declarations

      // -------------------------------------------------------------------------------------------

      procedure AbreQueries;
      function  VerificaPreenchimento: Boolean;

      // -------------------------------------------------------------------------------------------

      function  AbreCaPCaR(const sRecPag: String): Integer;
      function  DesfazCaPCar(const sRecPag: String): Currency;
      function  DesfazDocumentoCaPCar: Boolean;

      // -------------------------------------------------------------------------------------------

      function  AbreTmpDesc: Integer;
      function  DesfazTmpDesc: Currency;
      function  DesfazParcelaTmpDesc: Boolean;
      function  ContratoUnico(IDDocumento: Extended): Boolean;

      // -------------------------------------------------------------------------------------------

   public // Public declarations

   end;



var
  frmCancEnvio: TfrmCancEnvio;



implementation
{$R *.DFM}
uses
   USistema,
   UDataBase,
   UMensErro,
   FProgresso,
   dBaseDados,
   uModulo,
   uVerificaPreenchimento,
   DLookEmptmo,
   dMS,
   uIntegraEmptmo,
   dIntegraEmptmo,
   DEmptmo,
   uDiasUteis,
   UCalcEmptmo;




procedure TfrmCancEnvio.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

end;



function  TfrmCancEnvio.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try
      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Cobrança!', cboMes);

      if DBspnAno.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de Cobrança!', DBspnAno);

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



procedure TfrmCancEnvio.btnContinuarClick(Sender: TObject);
var
   i              : Integer;
   iContador      : Integer;
   dHoraIni       : TDateTime;
   dHoraFim       : TDateTime;
begin
   inherited;

   ParametrosSistema;

   if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;

   if not(VerificaPreenchimento) then Exit;

   try
      // vai para página de Resultados
      Repaint;
      Application.ProcessMessages;

      dHoraIni := Now;

      // -------------------------------------------------------------------------------------------
      // limpa os memos de resultado e erro
      memErro.Clear;
      memResult.Clear;

      memResult.Lines.Add(FormatDateTime('hh:nn:ss', dHoraIni) + ' - Início do Processo');
      memResult.Lines.Add(' ');
      // -------------------------------------------------------------------------------------------

      Repaint;
      Application.ProcessMessages;

      // -------------------------------------------------------------------------------------------
      DesfazCaPCar('P');
      DesfazCaPCar('R');
      DesfazTMPDESC;
      // -------------------------------------------------------------------------------------------

      Repaint;

      dHoraFim := Now;

      memResult.Lines.Add(' ');
      memResult.Lines.Add(FormatDateTime('hh:nn:ss', dHoraFim) + ' - Final do Processo');

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Tempo total do processo: ' + FormatDateTime('hh:nn:ss', dHoraFim - dHoraIni));

   finally
   end; // try
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



function  TfrmCancEnvio.AbreCaPCaR(const sRecPag: String): Integer;
var
   sSQL           : String;
   sDataEnvioIni  : String;
   sDataEnvioFim  : String;
   sDataVenctoIni : String;
   sDataVenctoFim : String;
begin
   // Pendência 26440 - 27/09/2007 - Marchetti
   if length(trim(edtDataEnvioIni.Text)) <> 0    then sDataEnvioIni   := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataEnvioIni.Date));
   if length(trim(edtDataEnvioFim.Text)) <> 0    then sDataEnvioFim   := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataEnvioFim.Date));
   if length(trim(edtDataVenctoIni.Text)) <> 0   then sDataVenctoIni  := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataVenctoIni.Date));
   if length(trim(edtDataVenctoFim.Text)) <> 0   then sDataVenctoFim  := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataVenctoFim.Date));
   //Fim Pendência 26440

   //Pendência 27720 - 24/04/2008
   if molContratoEmptmo.IDContrato > 0 then
      sSQL := 'SELECT '                                                                            + #13
   else
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
      sSQL := 'SELECT '                                        + #13;
      //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
      
   sSQL := sSQL +
   //'SELECT  '                                                   + #13 +
   //Fim Pendência 27720
   '   HME.IDCONTRATOEMPTMO, HME.CODDOCUMENTO, HME.HMETIPOMOV, '                                   + #13 +
   '   ROUND(SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))), 2) AS VLR_PREVISTO_DOC, '                       + #13 +
   '   HME.HMEDATAVENCTO,  '                                                                       + #13 +
   '   CON.IDPATRO, CON.IDPLANOPREV '                                                              + #13 +

   '   ,DECODE(LEAD(HME.CODDOCUMENTO, 1,0) OVER    '                                               + #13 +    //edilaine SIG113052
   '               (PARTITION BY HME.CODDOCUMENTO  '                                               + #13 +    //edilaine SIG113052
   '                    ORDER BY HME.CODDOCUMENTO), 0, ''S'', ''N'') AS FLGAPAGA '                 + #13 +    //edilaine SIG113052

   'FROM '                                                                                         + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                      + #13 +
   '   DOCUMENTO       DOC, '                                                                      + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +
   '   TIPOEMPTMO      TEP '                                                                       + #13 +

   'WHERE '                                                                                        + #13 +
   '       TEP.IDEMPRESAPROP           = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +

   '   AND CON.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '   AND CON.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                      + #13 +

   '   AND DOC.RECPAG                  = ' + QuotedStr(sRecPag)                                    + #13 +

   // Pendência 25305 - 16/05/2007 - Alberto
   '   AND ( (LTRIM(RTRIM(DOC.STATUS))   <> ''2'') '                                               + #13 +
   '   OR    (LTRIM(RTRIM(DOC.STATUS))   =  ''2''  '                                               + #13 +
   '   AND    NOT EXISTS(SELECT * FROM LANCTODOCUM '                                               + #13 +
   '                     WHERE  CODDOCUMENTO = DOC.CODDOCUMENTO '                                  + #13 +
   '                     AND    ESTORNO IS NULL)) ) '                                              + #13 +
   //Fim Pendência 25305

   '   AND HME.HMEANOCOBRANCA          = ' + FormatFloat('0000', DBspnAno.Value)                   + #13 +
   '   AND HME.HMEMESCOBRANCA          = ' + FormatFloat('00', cboMes.ItemIndex + 1)               + #13 +

   '   AND NVL(HME.FLGBAIXADO, 0)      = 0 '                                                       + #13 +
   '   AND HME.FLGENVIO                IS NULL '                                                   + #13 +
   '   AND HME.HMETIPOMOV              NOT IN (5, 8) '                                             + #13 +

   '   AND HME.HMEVLREFETIVO           IS NULL '                                                   + #13 +
   '   AND HME.HMEDATAEFETIVA          IS NULL '                                                   + #13 +

   '   AND (HME.HMECENTRALIZA          = 1 OR HME.HMEDESTACADO        = 1) '                       + #13;

   // ----------------------------------------------------------------------------------------------

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND HME.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   if length(trim(edtCodDocumento.Text)) <> 0 then sSQL := sSQL +
   '   AND HME.CODDOCUMENTO            = ' + edtCodDocumento.Text                                  + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO       = ' + DBcboTipoContrato.LookupValue                         + #13;

   // Pendência 26440 - 27/09/2007 - Marchetti
   if length(trim(edtDataEnvioIni.Text)) <> 0 then sSQL := sSQL +
   //Pendência 27720 - 24/04/2008
   //'   AND HME.HMEDATAENVIO           >= TO_DATE(' + sDataEnvioIni + ', ''DD/MM/YYYY'') '          + #13;
   '   AND TRUNC(HME.HMEDATAENVIO)    >= TO_DATE(' + sDataEnvioIni + ', ''DD/MM/YYYY'') '          + #13;

   if length(trim(edtDataEnvioFim.Text)) <> 0 then sSQL := sSQL +
   //Pendência 27720 - 24/04/2008
   //'   AND HME.HMEDATAENVIO           <= TO_DATE(' + sDataEnvioFim + ', ''DD/MM/YYYY'') '          + #13;
   '   AND TRUNC(HME.HMEDATAENVIO)    <= TO_DATE(' + sDataEnvioFim + ', ''DD/MM/YYYY'') '          + #13;

   if length(trim(edtDataVenctoIni.Text)) <> 0 then sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO          >= TO_DATE(' + sDataVenctoIni + ', ''DD/MM/YYYY'') '         + #13;

   if length(trim(edtDataVenctoFim.Text)) <> 0 then sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO          <= TO_DATE(' + sDataVenctoFim + ', ''DD/MM/YYYY'') '         + #13;
   //Fim Pendência 26440

   // ----------------------------------------------------------------------------------------------

   // Marchetti - Pendencia 20028
   if molUsuario.iUsuario > 0 then sSQL := sSQL +
   '   AND DOC.IDUSUARIOINCLUSAO       = ' + IntToStr(molUsuario.iUsuario)                         + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '                                      + #13 +
   '   AND HME.CODDOCUMENTO          = DOC.CODDOCUMENTO '                                          + #13 +
   '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '                                     + #13 +
   '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO '                                          + #13 +

   'GROUP BY '                                                                                     + #13 +
   '   HME.IDCONTRATOEMPTMO, HME.CODDOCUMENTO, HME.HMETIPOMOV, HME.HMEDATAVENCTO, '                + #13 +
   '   CON.IDPATRO, CON.IDPLANOPREV ' + #13 +

   ' ORDER BY HME.CODDOCUMENTO ';  //edilaine SIG113052

   with qryItensCaPCaR do
   begin
      qryItensCaPCaR.Close;
      qryItensCaPCaR.SQL.Clear;
      qryItensCaPCaR.SQL.Text := sSQL;
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // qryItensCaPCaR.SQL.SaveToFile(Sistema.TempDir + 'EP-CancEnvioCapCar-' + sRecPag + '.TXT');
      qryItensCaPCaR.SQL.SaveToFile(ftempregra + '\' + 'EP-CancEnvioCapCar-' + sRecPag + '.TXT');

      try
         qryItensCaPCaR.Open;

         Result := 0;
         Result := qryItensCaPCaR.RecordCount;
         if not(qryItensCaPCaR.IsEmpty) then Result := 1;
      except
         Result := -1;
         Exit;
      end;
   end;
end;



function TfrmCancEnvio.DesfazCaPCar(const sRecPag: String): Currency;
var
   iContador      : Integer;
   iRegistros     : Integer;
   sTextoRecPag   : String;
begin
   try
      if ((chkCaP.Checked) and (sRecPag = 'P')) or ((chkCaR.Checked) and (sRecPag = 'R')) then
      begin
         case sRecPag[1] of
            'P': sTextoRecPag := 'a Pagar';
            'R': sTextoRecPag := 'a Receber';
         end;

         MostraEspera('Buscando itens a desfazer - Financeiro ' + sTextoRecPag + '...');

         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                             'Buscando itens a desfazer - Financeiro ' + sTextoRecPag + '...'
                            );

         iRegistros := AbreCaPCar(sRecPag);

         if iRegistros = -1 then
         begin
            memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                              'ERRO ao buscar itens a desfazer - Financeiro ' + sTextoRecPag + '...'
                             );
            Exit;
         end
         else
         if iRegistros = 0 then
         begin
            memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                              'Não foram encontrados itens a desfazer - Financeiro ' + sTextoRecPag + '...'
                             );
            Exit;
         end
         else
         if iRegistros > 0 then
         begin
            // -------------------------------------------------------------------------------------
            memResult.Lines.Add(' ');
            memResult.Lines.Add('           Nº Contrato     Matrícula       Plano Patro Parc Valor');
            memResult.Lines.Add('           --------------- --------------- ----- ----- ---- ---------------');

            memErro.Lines.Add  (' ');
            memErro.Lines.Add  (' ');
            memErro.Lines.Add  (' Financeiro ' + sTextoRecPag);
            memErro.Lines.Add  (' ');
            memErro.Lines.Add  ('           Nº Contrato     Matrícula       Plano Patro Parc Valor');
            memErro.Lines.Add  ('           --------------- --------------- ----- ----- ---- ---------------');

            frmProgresso.MostraFormProgresso('Desfazendo Itens - Financeiro ' + sTextoRecPag + '...',
                                             True,
                                             True,
                                             True,
                                             0,
                                             iRegistros
                                            );

            iContador   := 0;
            // -------------------------------------------------------------------------------------

            // -------------------------------------------------------------------------------------
            while not(qryItensCaPCaR.EOF) do
            begin
               if frmProgresso.Cancelou then Break; // interrompeu o processo

               DesfazDocumentoCaPCar;

               qryItensCaPCaR.Next;

               inc(iContador);
               frmProgresso.AndaFormProgresso(iContador);
            end; // while not(EOF)
            // -------------------------------------------------------------------------------------
         end;
         // ----------------------------------------------------------------------------------------
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
   finally
      EscondeEspera;
      frmProgresso.EscondeFormProgresso;

      qryItensCaPCaR.Close;
   end;
end;



function TfrmCancEnvio.DesfazDocumentoCaPCar: Boolean;
var
   sMsg           : String;
   rLogTotalPrev  : TLogTotalPrev;
   bApagaDoc      : boolean;   //edilaine SIG113052
begin
   // ----------------------------------------------------------------------------------------------

   // André Pontes - 26/09/2005 - Pendencia 20306
   // Não permite desfazer envio de documentos criados pelo envio de concessões em lote
   if not(ContratoUnico(qryItensCaPCaRCODDOCUMENTO.AsFloat)) then
   begin
      memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                        CompletaInicio(FormatFloat('#0', qryItensCapCarIDCONTRATOEMPTMO.AsFloat), ' ', 15) + ' ' +
                        CompletaFim(' ', ' ', 15) + ' ' +
                        CompletaFim(FormatFloat('#0', qryItensCapCarIDPLANOPREV.AsFloat), ' ', 5) + ' ' +
                        CompletaFim(FormatFloat('#0', qryItensCapCarIDPATRO.AsFloat), ' ', 5) + ' ' +
                        'Enviado em lote'
                       );
      Exit;
   end;
   // FIM André Pontes - 26/09/2005 - Pendencia 20306

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
      // -------------------------------------------------------------------------------------------

      bApagaDoc := qryItensCaPCaRFLGAPAGA.AsString = 'S';   //edilaine SIG113052


      //if IntegraEmptmo.DesfazEnvioPorDocumento(qryItensCaPCaRCODDOCUMENTO.AsFloat, False, qryItensCaPCaRHMETIPOMOV.AsInteger) then //TAES - SIG102325
      if IntegraEmptmo.DesfazEnvioPorDocumento(qryItensCaPCaRCODDOCUMENTO.AsFloat, False, qryItensCaPCaRHMETIPOMOV.AsInteger, bApagaDoc) then //edilaine SIG113052
      begin
         // ----------------------------------------------------------------------------------------
         // André Pontes - 11/01/2006 - LogDocumento - OK

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := qryItensCapCarIDCONTRATOEMPTMO.AsFloat;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.CodPlanDoc := qryItensCaPCaRCODDOCUMENTO.AsFloat;
         rLogTotalPrev.Origem     := 61;
         rLogTotalPrev.Operacao   := 'DesfazEnvioPorDocumento';
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------

         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         memResult.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                             CompletaInicio(FormatFloat('#0', qryItensCapCarIDCONTRATOEMPTMO.AsFloat), ' ', 15) + ' ' +
                             CompletaFim(' ', ' ', 15) + ' ' +
                             CompletaFim(FormatFloat('#0', qryItensCapCarIDPLANOPREV.AsFloat), ' ', 5) + ' ' +
                             CompletaFim(FormatFloat('#0', qryItensCapCarIDPATRO.AsFloat), ' ', 5) + ' ' +
                             CompletaInicio(FormatFloat('#,#0.00', qryItensCapCarVLR_PREVISTO_DOC.AsFloat), ' ', 15)
                            );
      end
      else
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

         memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                           CompletaInicio(FormatFloat('#0', qryItensCapCarIDCONTRATOEMPTMO.AsFloat), ' ', 15) + ' ' +
                           CompletaFim(' ', ' ', 15) + ' ' +
                           CompletaFim(FormatFloat('#0', qryItensCapCarIDPLANOPREV.AsFloat), ' ', 5) + ' ' +
                           CompletaFim(FormatFloat('#0', qryItensCapCarIDPATRO.AsFloat), ' ', 5) + ' ' +
                           CompletaInicio(FormatFloat('#,#0.00', qryItensCapCarVLR_PREVISTO_DOC.AsFloat), ' ', 15)
                          );
      end;

      // -------------------------------------------------------------------------------------------

   except
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

      memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                        CompletaInicio(FormatFloat('#0', qryItensCapCarIDCONTRATOEMPTMO.AsFloat), ' ', 15) + ' ' +
                        CompletaFim(' ', ' ', 15) + ' ' +
                        CompletaFim(FormatFloat('#0', qryItensCapCarIDPLANOPREV.AsFloat), ' ', 5) + ' ' +
                        CompletaFim(FormatFloat('#0', qryItensCapCarIDPATRO.AsFloat), ' ', 5) + ' ' +
                        CompletaInicio(FormatFloat('#,#0.00', qryItensCapCarVLR_PREVISTO_DOC.AsFloat), ' ', 15)
                       );
   end;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



function  TfrmCancEnvio.AbreTMPDESC: Integer;
var
   sSQL           : String;
   sMesCobranca   : String;
   sTipoFolha     : String;
   sDataEnvioIni  : String;
   sDataEnvioFim  : String;
   sDataVenctoIni : String;
   sDataVenctoFim : String;
begin
   // SOL 194460 Kintana 1861972 - William Moreira da Silva
   if length(trim(edtDataEnvioIni.Text)) <> 0    then sDataEnvioIni   := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataEnvioIni.Date));
   if length(trim(edtDataEnvioFim.Text)) <> 0    then sDataEnvioFim   := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataEnvioFim.Date));
   if length(trim(edtDataVenctoIni.Text)) <> 0   then sDataVenctoIni  := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataVenctoIni.Date));
   if length(trim(edtDataVenctoFim.Text)) <> 0   then sDataVenctoFim  := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataVenctoFim.Date));
   // SOL 194460 Kintana 1861972 - William Moreira da Silva

   sMesCobranca := QuotedStr(FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1));

   // Filtro por tipo de Folha (Benefícios / Patrocinadora) ----------------------------------------

   sTipoFolha := '';

   if chkFolhaPatro.Checked then
   begin
      if chkFolhaBenef.Checked then
      begin
         sTipoFolha := QuotedStr('B') + ',' + QuotedStr('P');
      end
      else
      begin
         sTipoFolha := QuotedStr('P');
      end;
   end
   else
   begin
      if chkFolhaBenef.Checked then sTipoFolha := QuotedStr('B');
   end;

   // ----------------------------------------------------------------------------------------------

   sSQL :=
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                                                            + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '   TMP.IDTMPDESC, '                                                                            + #13 +

   '   TMP.MESCOBRANCA, TMP.MESREFERENCIA, '                                                       + #13 +
   '   TMP.FLGDESCFOLHA, '                                                                         + #13 +
   '   TMP.SITENVIO, '                                                                             + #13 +
   '   TMP.IDDESCONTO, '                                                                           + #13 +
   '   TMP.ORDEM, TMP.IDHISTMOVEMPTMO, '                                                           + #13 +

   '   ROUND(NVL(TMP.VALOR, 0), 2)         AS VALOR, '                                             + #13 +
   '   ROUND(NVL(TMP.VALORRECEBIDO, 0), 2) AS VALORRECEBIDO, '                                     + #13 +
   '   TMP.DATARECEBIMENTO, '                                                                      + #13 +

   '   TMP.FLGTIPODESC, '                                                                          + #13 +
   '   TMP.FLGATRASODEVOL, '                                                                       + #13 +

   '   TMP.IDPROVENTO, TMP.CODPROVDESC, '                                                          + #13 +

   '   TMP.MATRICULA, TMP.INSCRICAONUMERO, '                                                       + #13 +
   '   TMP.IDTITULAR, TMP.IDPESSOA, '                                                              + #13 +

   '   TMP.IDPESSJUR, TMP.IDPLANOPREV, '                                                           + #13 +
   '   TMP.IDLOTE, '                                                                               + #13 +
   '   TMP.LOTEPREVIA, '                                                                           + #13 +

   '   TMP.NUMPRIORIDADE, '                                                                        + #13 +
   '   TMP.DESCRICAO, '                                                                            + #13 +

   '   TMP.DATAREFERENCIA, TMP.REFERENCIA, '                                                       + #13 +
   '   TMP.DATACOBRANCA, '                                                                         + #13 +
   '   TMP.FLGDESCONTO, '                                                                          + #13 +

   '   TMP.RECPAG, '                                                                               + #13 +
   '   TMP.IDMODULO, '                                                                             + #13 +
   '   TMP.SISTORIGEM, '                                                                           + #13 +
   '   TMP.IDMOTIVO, '                                                                             + #13 +
   '   TMP.IDEMPRESAPROP, '                                                                        + #13 +
   '   TMP.IDEMPRESA, '                                                                            + #13 +
   '   TMP.IDFUNDACAO, '                                                                           + #13 +

   '   TMP.SEQPROPOSTA, '                                                                          + #13 +
   '   TMP.NODOCUMENTO, TMP.COMPLDOCUMENTO, '                                                      + #13 +

   '   CON.FLGSITUACAO, '                                                                          + #13 +
   '   CON.IDTIPOCONTREMPTMO '                                                                     + #13 +

   'FROM '                                                                                         + #13 +
   '   TMPDESC         TMP, '                                                                      + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +// SOL 194460 Kintana 1861972 - William Moreira da Silva
   '   HISTMOVEMPTMO HME    '                                                                      + #13 +// SOL 194460 Kintana 1861972 - William Moreira da Silva

   'WHERE '                                                                                        + #13 +
   '       TMP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                              + #13 +

   '   AND TMP.IDMODULO             IN (15, 32) '                                                  + #13 +
   '   AND RTRIM(TMP.MESCOBRANCA)   = ' + sMesCobranca                                             + #13 +

   '   AND TMP.VALORRECEBIDO        IS NULL '                                                      + #13 +
   '   AND TMP.SITENVIO             = ''0'' '                                                      + #13 +
   '   AND TMP.LOTEPREVIA           IS NULL '                                                      + #13 +

   '   AND TMP.IDPESSJUR            IN (' + molListaPatro.PegaPatro + ') '                         + #13 +
   '   AND TMP.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                         + #13 +

   '   AND TMP.FLGTIPODESC          IN (''E'', ''K'' )'                                            + #13 + //SOL 141516 Kintana 897025
   '   AND TMP.FLGDESCFOLHA         IN (' + sTipoFolha + ') '                                      + #13;

   // ----------------------------------------------------------------------------------------------

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO       = ' + DBcboTipoContrato.LookupValue                         + #13;

   if length(trim(edtDataEnvioIni.Text)) < 0 then sSQL := sSQL +
   '   AND TRUNC(TMP.TRGDTINCLUSAO) >= TO_DATE(' + sDataEnvioIni + ', ''DD/MM/YYYY'') '            + #13;

   if length(trim(edtDataEnvioFim.Text)) < 0 then sSQL := sSQL +
   '   AND TRUNC(TMP.TRGDTINCLUSAO) <= TO_DATE(' + sDataEnvioIni + ', ''DD/MM/YYYY'') '            + #13;

   // SOL 194460 Kintana 1861972 - William Moreira da Silva
   if edtDataVenctoIni.Text <> '' then sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO       >= TO_DATE(' +sDataVenctoIni+', ''dd/mm/yyyy'') '            + #13;

   if edtDataVenctoFim.Text <> '' then sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO       <= TO_DATE(' +sDataVenctoFim+ ', ''dd/mm/yyyy'') '            + #13;
   // SOL 194460 Kintana 1861972 - William Moreira da Silva
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND TMP.IDDESCONTO           = CON.IDCONTRATOEMPTMO '                                       + #13 +
   '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
   '   AND HME.IDHISTMOVEMPTMO = TMP.IDHISTMOVEMPTMO '                                             + #13 +// SOL 194460 Kintana 1861972 - William Moreira da Silva

   'ORDER BY '                                                                                     + #13 +
   '   TMP.IDDESCONTO, TMP.MESREFERENCIA, TMP.IDPROVENTO ';

   // ----------------------------------------------------------------------------------------------

   with qryTmpDesc do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
    // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    // Sql.SaveToFile(Sistema.TempDir + 'EP-CancEnvioFolha.TXT');
       Sql.SaveToFile(ftempregra + '\' + 'EP-CancEnvioFolha.TXT');

      //Pendência 27120 - 19/12/2007
      Result := 0;

      try
         Open;
      except
         Result := -1;
      end;

      //Result := 0;
      //Fim Pendência 27120
      if not(qryTmpDesc.IsEmpty) then Result := 1;
   end;
end;



function TfrmCancEnvio.DesfazTMPDESC: Currency;
var
   iRegistros  : Integer;
   iContador   : Integer;
begin
   try
      if (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) then
      begin
         MostraEspera('Buscando itens a desfazer - Folha(s)...');

         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Buscando Itens a desfazer - Folha(s)...');

         iRegistros := AbreTMPDESC;

         if iRegistros = -1 then
         begin
            memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'ERRO ao buscar Itens a desfazer - Folha(s)...');
            Exit;
         end
         else
         if iRegistros = 0 then
         begin
            memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Não foram encontrados Itens a desfazer - Folha(s)...');
            Exit;
         end
         else
         if iRegistros > 0 then
         begin
            // -------------------------------------------------------------------------------------
            memResult.Lines.Add(' ');
            memResult.Lines.Add('           Nº Contrato     Matrícula       Plano Patro Parc Valor');
            memResult.Lines.Add('           --------------- --------------- ----- ----- ---- ---------------');

            memErro.Lines.Add  (' ');
            memErro.Lines.Add  (' ');
            memErro.Lines.Add  (' Folha(s)...');
            memErro.Lines.Add  (' ');
            memErro.Lines.Add  ('           Nº Contrato     Matrícula       Plano Patro Parc Valor');
            memErro.Lines.Add  ('           --------------- --------------- ----- ----- ---- ---------------');

            frmProgresso.MostraFormProgresso('Desfazendo Itens - Folha(s)... ',
                                             True,
                                             True,
                                             True,
                                             0,
                                             iRegistros
                                            );

            iContador   := 0;
            // -------------------------------------------------------------------------------------

            // -------------------------------------------------------------------------------------
            while not(qryTmpDesc.EOF) do
            begin
               if frmProgresso.Cancelou then Break; // interrompeu o processo

               DesfazParcelaTmpDesc;

               qryTmpDesc.Next;

               inc(iContador);
               frmProgresso.AndaFormProgresso(iContador);
            end; // while not(EOF)
            // -------------------------------------------------------------------------------------
         end;
         // ----------------------------------------------------------------------------------------
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
   finally
      EscondeEspera;
      frmProgresso.EscondeFormProgresso;

      qryTmpDesc.Close;
   end;
end;



// Executa o recebimento de uma Parcela de Emprestimo enviada para TMPDESC
function TfrmCancEnvio.DesfazParcelaTmpDesc: Boolean;
var
   IDTmpDesc, IDHistMov, IDContrato : Extended;
   IDMutuario, IDRubrica            : Int64;

   iPlanilha, iDocumento            : Int64;

   fVlrPrevisto, fVlrEfetivo        : Currency;
   fVlrPrevistoHist                 : Currency;
   fDiferenca                       : Currency;

   bInesperado, bNaoProgramado      : Boolean;
   bBaixado                         : Boolean;
   bDivergente, bDivergTrat         : Boolean;

   iEvento, iTipoDiverg             : Integer;

   dDataEfetiva, dDataRecebimento   : TDateTime;

   sMsg                             : String;
   sSituacaoContrato                : String;
   sMesCobranca, sMesReferencia     : String;
   sTipoFolha                       : String;

   iAnoCobranca, iAnoCompetencia    : Integer;
   iMescobranca, iMesCompetencia    : Integer;

   qryRemarcaEnvio                  : TwwQuery;
   qryDeleteTmpDesc                 : TwwQuery;
   qryAux                           : TwwQuery;  //SIG101022 - Helen
   qryAtuHistMov                    : TwwQuery;  //SIG101022 - Helen
   sValor                           : String;  //SIG101022 - Helen
   sSQL                             : String;

   rLogTotalPrev                    : TLogTotalPrev;
   // inicio SOL 194460 Kintana 1861972
   sDataEnvioIni  : String;
   sDataEnvioFim  : String;
   sDataVenctoIni : String;
   sDataVenctoFim : String;
begin
   // Pendência 26440 - 27/09/2007 - Marchetti
   if length(trim(edtDataEnvioIni.Text)) <> 0    then sDataEnvioIni   := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataEnvioIni.Date));
   if length(trim(edtDataEnvioFim.Text)) <> 0    then sDataEnvioFim   := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataEnvioFim.Date));
   if length(trim(edtDataVenctoIni.Text)) <> 0   then sDataVenctoIni  := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataVenctoIni.Date));
   if length(trim(edtDataVenctoFim.Text)) <> 0   then sDataVenctoFim  := QuotedStr(FormatDateTime('DD/MM/YYYY', edtDataVenctoFim.Date));
   //Fim Pendência 26440
   // Final SOL 194460 Kintana 1861972
   // ----------------------------------------------------------------------------------------------

   // Guarda os dados
   IDTmpDesc         := qryTmpDescIDTMPDESC.AsFloat;

   if qryTmpDescIDHISTMOVEMPTMO.IsNULL then
   begin
      IDHistMov      := qryTmpDescORDEM.AsFloat;
   end
   else
   begin
      IDHistMov      := qryTmpDescIDHISTMOVEMPTMO.AsFloat;
   end;

   IDContrato        := qryTmpDescIDDESCONTO.AsFloat;
   IDMutuario        := qryTmpDescIDPESSOA.AsInteger;

   sMesCobranca      := qryTmpDescMESCOBRANCA.AsString;
   iAnoCobranca      := StrToInt(Copy(sMesCobranca, 1, 4));
   iMesCobranca      := StrToInt(Copy(sMesCobranca, 6, 2));

   sMesReferencia    := qryTmpDescMESREFERENCIA.AsString;
   iAnoCompetencia   := StrToInt(Copy(sMesReferencia, 1, 4));
   iMesCompetencia   := StrToInt(Copy(sMesReferencia, 6, 2));

   IDRubrica         := qryTmpDescIDPROVENTO.AsInteger;

   fVlrPrevisto      := Arredonda(qryTmpDescVALOR.AsCurrency, 2);
   fVlrEfetivo       := Arredonda(qryTmpDescVALORRECEBIDO.AsCurrency, 2);

   dDataRecebimento  := qryTmpDescDATARECEBIMENTO.AsDateTime;

   sSituacaoContrato := qryTmpDescFLGSITUACAO.AsString;

   sTipoFolha        := qryTmpDescFLGDESCFOLHA.AsString;

   iTipoDiverg       := -1;
   bDivergente       := False;
   bDivergTrat       := False;

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
      qryRemarcaEnvio               := TwwQuery.Create(Application);
      qryRemarcaEnvio.DatabaseName  := 'BaseDados';

      qryDeleteTmpDesc              := TwwQuery.Create(Application);
      qryDeleteTmpDesc.DatabaseName := 'BaseDados';

      //SIG101022 - Helen - Ini
      qryaux                        := TwwQuery.Create(Application);
      qryaux.DatabaseName           := 'BaseDados';
      qryAtuHistMov                 := TwwQuery.Create(Application);
      qryAtuHistMov.DatabaseName    := 'BaseDados';
      //SIG101022 - Helen - Fim

      try
        //SIG101022 - Helen - Ini
        //Busca para encontrar os valores negativos abatidos na Prestação da Parcela
        sSql := 'SELECT H.HMEPARCELA, SUM(H.HMEVLREFETIVO) as HMEVLREFETIVO     '   + #13 +
              ' FROM  HISTMOVEMPTMO H                                         '   + #13 +
              'WHERE                                                          '   + #13 +
              ' H.HMEVLRPREVISTO < 0 AND                                      '   + #13 +
              ' H.HMEVLREFETIVO IS NOT NULL  AND                              '   + #13 +
              //' H.FLGBAIXADO     = 1  AND                                     '   + #13 +
              ' H.IDCONTRATOEMPTMO = ' + FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat) + #13 +
              '   AND H.HMEANOCOBRANCA       = ' + IntToStr(Trunc(DBspnAno.Value))+ #13 +
              '   AND H.HMEMESCOBRANCA       = ' + IntToStr(cboMes.ItemIndex + 1) + #13 +
              '   AND EXISTS (SELECT 1 FROM HISTMOVEMPTMO HME '            + #13 +
              '              WHERE  '                                      + #13 +
              '               HME.IDCONTRATOEMPTMO = ' + FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat) + #13 +
              ' AND           HME.IDCONTRATOEMPTMO =  H.IDCONTRATOEMPTMO  '                              + #13+
              ' AND           HME.HMEPARCELA= H.HMEPARCELA    '            + #13 ;
        if edtDataVenctoIni.Text <> '' then sSQL := sSQL +
             '  AND HME.HMEDATAVENCTO       >= TO_DATE(' + sDataVenctoIni + ', ''dd/mm/yyyy'') '         + #13;

        if edtDataVenctoFim.Text <> '' then sSQL := sSQL +
             '  AND HME.HMEDATAVENCTO       <= TO_DATE(' + sDataVenctoFim + ', ''dd/mm/yyyy'') '         + #13;
         sSQL := sSQL +
         '   AND HMETIPOMOV               NOT IN (5, 8) '                                                + #13 +
         '   AND HME.FLGBAIXADO           = 0 '                                                          + #13 +
         '   AND HME.HMEVLREFETIVO        IS NULL '                                                      + #13 +
         '   AND HME.HMEDATAEFETIVA       IS NULL '                                                      + #13 +
         '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
         '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                          + #13 +
         '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                          + #13 +
         '   AND HME.HMEDATAQUITABONO     IS NULL '                                                      + #13 +
         '   AND HME.HMEANOCOBRANCA       = ' + IntToStr(Trunc(DBspnAno.Value))                          + #13 +
         '   AND HME.HMEMESCOBRANCA       = ' + IntToStr(cboMes.ItemIndex + 1) +')'                      + #13 +
         '   GROUP BY H.HMEPARCELA '  + #13;

        qryAux.close;
        qryAux.Sql.Add(sSql);
        qryAux.open;

        if not qryAux.eof then
        begin
           qryAux.First;
           while not qryAux.eof do
           begin
               sValor := OraNumero(FloatToStr(qryAux.FieldByName('HMEVLREFETIVO').AsFloat));
               //Atualiza o valor da Prestação com o Valor Original
               sSQL := 'UPDATE '                                                    + #13 +
                        '    HISTMOVEMPTMO HME'                                     + #13 +
                        'SET '                                                      + #13 +
                        '    HME.HMEVLRPREVISTO = HME.HMEVLRPREVISTO + ' + sValor + #13 +
                        'WHERE '                                                    + #13 +
                        '       HME.IDCONTRATOEMPTMO = ' + FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat) + #13 +
                        '   AND HME.HMEPARCELA       = ' + qryAux.FieldByName('HMEPARCELA').AsString       + #13 +
                        '   AND HME.IDITEMEMPTMO =  13                              ' + #13 ;
               if edtDataVenctoIni.Text <> '' then sSQL := sSQL +
                        '   AND HME.HMEDATAVENCTO       >= TO_DATE(' + sDataVenctoIni + ', ''dd/mm/yyyy'') '+ #13;
               if edtDataVenctoFim.Text <> '' then sSQL := sSQL +
                       '   AND HME.HMEDATAVENCTO       <= TO_DATE(' + sDataVenctoFim + ', ''dd/mm/yyyy'') ' + #13;
               sSQL := sSQL +
                       '  AND  HME.HMETIPOMOV               NOT IN (5, 8) '                                 + #13 +
                       '   AND HME.FLGBAIXADO           = 0 '                                               + #13 +
                       '   AND HME.HMEVLREFETIVO        IS NULL '                                           + #13 +
                       '   AND HME.HMEDATAEFETIVA       IS NULL '                                           + #13 +
                       '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                               + #13 +
                       '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                               + #13 +
                       '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                               + #13 +
                       '   AND HME.HMEDATAQUITABONO     IS NULL '                                           + #13 +
                       '   AND HME.HMEANOCOBRANCA       = ' + IntToStr(Trunc(DBspnAno.Value))               + #13 +
                       '   AND HME.HMEMESCOBRANCA       = ' + IntToStr(cboMes.ItemIndex + 1) ;

               qryAtuHistMov.Close;
               qryAtuHistMov.Sql.Clear;
               qryAtuHistMov.SQL.Text :=  sSQL;
               qryAtuHistMov.ExecSQL;
               //Atualiza os encargos negativos utilizados para abater na prestação, desfazendo a Baixa
               sSQL := '';
               sSQL := 'UPDATE '                                           + #13 +
                        '    HISTMOVEMPTMO HME'                            + #13 +
                        'SET '                                             + #13 +
                        '    HME.FLGBAIXADO     = 0  ,   '                 + #13 +
                        '    HME.HMEVLREFETIVO  = NULL ,'                 + #13 +
                        '    HME.HMEDATAEFETIVA = NULL ,'                 + #13 +
                        '    HME.HMEDATARECEB   = NULL  '                 + #13 +
                        ' WHERE '                                          + #13 +
                        '       HME.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat) + #13 +
                        '   AND HME.HMEPARCELA       = ' + qryAux.FieldByName('HMEPARCELA').AsString           + #13 +
                        '   AND HME.HMEANOCOBRANCA       = ' + IntToStr(Trunc(DBspnAno.Value))                 + #13 +
                        '   AND HME.HMEMESCOBRANCA       = ' + IntToStr(cboMes.ItemIndex + 1)                  + #13 +
                        '   AND HME.HMEVLRPREVISTO  =  HMEVLREFETIVO*-1  '                                     + #13 +
                       // '   AND HME.FLGBAIXADO     = 1  '                                                      + #13 +
                        '   AND HME.HMEDATARECEB IS NOT NULL '                                                 + #13;

               if edtDataVenctoIni.Text <> '' then sSQL := sSQL +
                        '   AND HME.HMEDATAVENCTO       >= TO_DATE(' + sDataVenctoIni + ', ''dd/mm/yyyy'') '   + #13;

              if edtDataVenctoFim.Text <> '' then sSQL := sSQL +
                        '   AND HME.HMEDATAVENCTO       <= TO_DATE(' + sDataVenctoFim + ', ''dd/mm/yyyy'') '   + #13;

               qryAtuHistMov.Close;
               qryAtuHistMov.Sql.Clear;
               qryAtuHistMov.SQL.Text :=  sSQL;
               qryAtuHistMov.ExecSQL;

               qryAux.next;
           end;
        end;
        //SIG101022 - Helen - Fim

         // -------------------------------------------------------------------------------------------

         sSQL :=
         'UPDATE '                                                                                       + #13 +
         '   HISTMOVEMPTMO HME '                                                                         + #13 +
         'SET '                                                                                          + #13 +
         '   HME.FLGENVIO      = 0,    '                                                                 + #13 +
         '   HME.HMEDATAENVIO  = NULL, '                                                                 + #13 +
         '   HME.CODDOCUMENTO  = NULL, '                                                                 + #13 +
         '   HME.IDTMPDESC     = NULL  '                                                                 + #13 +
         'WHERE '                                                                                        + #13 +
         '       HME.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat)          + #13 +
         '   AND HME.IDTMPDESC            = ' + FormatFloat('#0', qryTmpDescIDTMPDESC.AsFloat) ;
         // SOL 194460 Kintana 1861972
         if edtDataVenctoIni.Text <> '' then sSQL := sSQL +
            '   AND HME.HMEDATAVENCTO       >= TO_DATE(' + sDataVenctoIni + ', ''dd/mm/yyyy'') '            + #13;

         if edtDataVenctoFim.Text <> '' then sSQL := sSQL +
            '   AND HME.HMEDATAVENCTO       <= TO_DATE(' + sDataVenctoFim + ', ''dd/mm/yyyy'') '            + #13;
         // SOL 194460 Kintana 1861972
         sSQL := sSQL +
         '   AND HMETIPOMOV               NOT IN (5, 8) '                                                + #13 +
         '   AND HME.FLGBAIXADO           = 0 '                                                          + #13 +
         '   AND HME.HMEVLREFETIVO        IS NULL '                                                      + #13 +
         '   AND HME.HMEDATAEFETIVA       IS NULL '                                                      + #13 +
         '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
         '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                          + #13 +
         '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                          + #13 +
         '   AND HME.HMEDATAQUITABONO     IS NULL '                                                      + #13 +
         '   AND HME.HMEANOCOBRANCA       = ' + IntToStr(Trunc(DBspnAno.Value))                          + #13 +
         '   AND HME.HMEMESCOBRANCA       = ' + IntToStr(cboMes.ItemIndex + 1) ;


         qryRemarcaEnvio.SQL.Text := sSQL;
         qryRemarcaEnvio.ExecSQL;

         // ----------------------------------------------------------------------------------------
         // André Pontes - 11/01/2006 - LogDocumento - OK

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := qryTmpDescIDDESCONTO.AsFloat;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.CodPlanDoc := -1;
         rLogTotalPrev.Origem     := 61;
         rLogTotalPrev.Operacao   := 'Limpa CodDocumento de IDTmpDesc ' + FormatFloat('#0', qryTmpDescIDTMPDESC.AsFloat);
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------

         sSQL :=
         'DELETE FROM '                                                                            + #13 +
         '   TMPDESC TMP '                                                                         + #13 +
         'WHERE '                                                                                  + #13 +
         '       TMP.IDMODULO       = 15 '                                                         + #13 +
         '   AND IDTMPDESC          = ' + FormatFloat('#0', qryTmpDescIDTMPDESC.AsFloat) ;

         // SOL 194460 Kintana 1861972
         if edtDataEnvioIni.Text <> '' then sSQL := sSQL +
            '   AND trunc(TMP.TRGDTINCLUSAO)       >= TO_DATE(' + sDataEnvioIni + ', ''dd/mm/yyyy'') '            + #13;

         if edtDataEnvioFim.Text <> '' then sSQL := sSQL +
            '   AND trunc(TMP.TRGDTINCLUSAO)       <= TO_DATE(' + sDataEnvioFim + ', ''dd/mm/yyyy'') '            + #13;
         // SOL 194460 Kintana 1861972

         sSQL := sSQL +
         '   AND IDDESCONTO         = ' + FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat)          + #13 +
         '   AND MESCOBRANCA        = ' + QuotedStr(FormatFloat('0000', DBspnAno.Value) + '/' +
                                                    FormatFloat('00', cboMes.ItemIndex + 1) );

         qryDeleteTmpDesc.SQL.Text := sSQL;
         qryDeleteTmpDesc.ExecSQL;

         // -------------------------------------------------------------------------------------------

         if qryDeleteTmpDesc.RowsAffected = 1 then
         begin
            memResult.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                CompletaInicio(FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat), ' ', 15) + ' ' +
                                CompletaFim(qryTmpDescMATRICULA.AsString, ' ', 15) + ' ' +
                                CompletaFim(FormatFloat('#0', qryTmpDescIDPLANOPREV.AsFloat), ' ', 5) + ' ' +
                                CompletaFim(FormatFloat('#0', qryTmpDescIDPESSJUR.AsFloat), ' ', 5) + ' ' +
                                CompletaInicio(FormatFloat('#,#0.00', qryTmpDescVALOR.AsFloat), ' ', 15)
                               );
         end
         else
         begin
            memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                              CompletaInicio(FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat), ' ', 15) + ' ' +
                              CompletaFim(qryTmpDescMATRICULA.AsString, ' ', 15) + ' ' +
                              CompletaFim(FormatFloat('#0', qryTmpDescIDPLANOPREV.AsFloat), ' ', 5) + ' ' +
                              CompletaFim(FormatFloat('#0', qryTmpDescIDPESSJUR.AsFloat), ' ', 5) + ' ' +
                              CompletaInicio(FormatFloat('#,#0.00', qryTmpDescVALOR.AsFloat), ' ', 15)
                             );
         end;

         // -------------------------------------------------------------------------------------------

         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
      except
         if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

         memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                           CompletaInicio(FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat), ' ', 15) + ' ' +
                           CompletaFim(qryTmpDescMATRICULA.AsString, ' ', 15) + ' ' +
                           CompletaFim(FormatFloat('#0', qryTmpDescIDPLANOPREV.AsFloat), ' ', 5) + ' ' +
                           CompletaFim(FormatFloat('#0', qryTmpDescIDPESSJUR.AsFloat), ' ', 5) + ' ' +
                           CompletaInicio(FormatFloat('#,#0.00', qryTmpDescVALOR.AsFloat), ' ', 15)
                          );
      end;
      // ----------------------------------------------------------------------------------------------

   finally
      qryRemarcaEnvio.Free;
      qryDeleteTmpDesc.Free;
   end;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



procedure TfrmCancEnvio.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmCancEnvio.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmCancEnvio.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   AbreQueries;

   molContratoEmptmo.btnLimpaContrato.Click;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatro.btnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlano.btnMarcaTodosPlanoClick(self);

   cboMes.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   dbspnAno.Value   := DiasUteis.ExtraiAno(SysDate);
end;



procedure TfrmCancEnvio.pgcControleChange(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
end;



procedure TfrmCancEnvio.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



function TfrmCancEnvio.ContratoUnico(IDDocumento: Extended): Boolean;
begin
   with qryContratoUnico do
   begin
      LimpaParametros(qryContratoUnico);
      ParamByName('PCODDOCUMENTO').AsFloat := IDDocumento;
      Open;

      Result := (qryContratoUnicoQUANT.AsInteger = 1);

      Close;
   end;
end;


procedure TfrmCancEnvio.molUsuariobtnBuscaUsuarioClick(Sender: TObject);
begin
   inherited;
   molUsuario.btnBuscaUsuarioClick(Sender);
end;


//Pendência 27104 - 17/12/2007
procedure TfrmCancEnvio.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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
//Fim Pendência 27104
procedure TfrmCancEnvio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   UFuncoesEmptmo.bBuscaMutuario := false;
end;

end.
