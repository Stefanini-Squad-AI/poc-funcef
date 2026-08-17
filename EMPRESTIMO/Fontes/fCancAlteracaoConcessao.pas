{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 160941 Kintana 1355879
Responsável : Fernando Xavier
Data        : 15/07/201
Descrição   : Ao efetuar o estorno da operação o sistema deve restaurar o valores
              da concessão.
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : ExisteItemGerado e qryItemGerado
Data      : 08/02/2007
Autor     : Alberto
Pendência : 24452
Descrição : Incluida a data de alteração de concessão na query para busca de
            itens gerados somente após a mesma
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCancAlteracaoConcessao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, Mask,
   DBCtrls, fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, wwdblook,
   ComCtrls, MontaSelect, uFiario,

   uTypesEmptmo, uFuncoesEmptmo;

type
   TfrmCancAlteracaoConcessao = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
      bbtnConfirmar: TBitBtn;
      dts: TwwDataSource;
      Panel1: TPanel;
      Label15: TLabel;
      edtDataCanc: TCMDateTimePicker;
      qryItensConcessao: TwwQuery;
      Label29: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      Label3: TLabel;
      DBedtNumContrato: TDBEdit;
      btnBuscaContrato: TBitBtn;
      DBedtJuros: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtValorParcela: TDBEdit;
      DBedtParcelas: TDBEdit;
      DBedtDataPrimParcela: TCMDateTimePicker;
      Label1: TLabel;
      Label4: TLabel;
      Label6: TLabel;
      Label22: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      DBedtPatro: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSitPart: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      grpTitular: TGroupBox;
      Label9: TLabel;
      Label16: TLabel;
      Label18: TLabel;
      DBedtMtrEmpresa: TDBEdit;
      DBedtCPF: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      Label11: TLabel;
      DBedtTipoEmptmo: TDBEdit;
      DBEdit3: TDBEdit;
      Label10: TLabel;
      qryItemGerado: TwwQuery;
      qryItemGeradoIDCONTRATOEMPTMO: TFloatField;
      qryMaisDeUmContrato: TwwQuery;
      qryMaisDeUmContratoNUMEROCONTRATOS: TFloatField;
      qryConcessao: TwwQuery;
      qryConcessaoIDHISTMOVEMPTMO: TFloatField;
      qryConcessaoIDCONTRATOEMPTMO: TFloatField;
      qryConcessaoIDBENEF: TFloatField;
      qryConcessaoINSCRICAO: TFloatField;
      qryConcessaoHMEANOCOBRANCA: TFloatField;
      qryConcessaoHMEMESCOBRANCA: TFloatField;
      qryConcessaoCODDOCUMENTO: TFloatField;
      qryConcessaoHMEFORMACOBRANCA: TStringField;
      qryConcessaoSTATUS: TStringField;
      qryConcessaoEMISBLOQ: TStringField;
      qryConcessaoFLGENVIO: TFloatField;
      qryConcessaoIDPESSOA: TFloatField;
      qryConcessaoHMEVLRPREVISTO: TFloatField;
      qryConcessaoHMEVLREFETIVO: TFloatField;
      qryItensConcessaoIDHISTMOVEMPTMO: TFloatField;
      qryItensConcessaoIDCONTRATOEMPTMO: TFloatField;
      qryItensConcessaoIDBENEF: TFloatField;
      qryItensConcessaoINSCRICAO: TFloatField;
      qryItensConcessaoHMEANOCOBRANCA: TFloatField;
      qryItensConcessaoHMEMESCOBRANCA: TFloatField;
      qryItensConcessaoCODDOCUMENTO: TFloatField;
      qryItensConcessaoHMEFORMACOBRANCA: TStringField;
      qryItensConcessaoFLGENVIO: TFloatField;
      qryItensConcessaoIDPESSOA: TFloatField;
      qryItensConcessaoHMEVLRPREVISTO: TFloatField;
      qryItensConcessaoHMEVLREFETIVO: TFloatField;
      qryItensConcessaoIDLANCIRRF: TFloatField;
      qryConcessaoHMEDATAPREVISTA: TDateTimeField;
    qryHistMov: TwwQuery;       // SOL 160941 Kintana 1355879   inicio criacao da query
    qryHistMovITEDESCRICAO: TStringField;
    qryHistMovANOMESCOMP: TStringField;
    qryHistMovANOMESCOMPET: TStringField;
    qryHistMovANOMESCOBR: TStringField;
    qryHistMovANOMESCOB: TStringField;
    qryHistMovFLGENVIO: TFloatField;
    qryHistMovFLGBAIXADO: TFloatField;
    qryHistMovFLGESTORNADO: TFloatField;
    qryHistMovFLGABONADO: TFloatField;
    qryHistMovFLGQUITADO: TFloatField;
    qryHistMovHMEANOCOMPETENCIA: TFloatField;
    qryHistMovHMEMESCOMPETENCIA: TFloatField;
    qryHistMovHMESEQCOBRANCA: TFloatField;
    qryHistMovHMETIPOMOV: TFloatField;
    qryHistMovIDCONTRATOEMPTMO: TFloatField;
    qryHistMovIDITEMEMPTMO: TFloatField;
    qryHistMovHMEDATAPREVISTA: TDateTimeField;
    qryHistMovHMEVLRPREVISTO: TFloatField;
    qryHistMovHMESALDODEV: TFloatField;
    qryHistMovHMETXJUROS: TFloatField;
    qryHistMovHMEPARCELA: TFloatField;
    qryHistMovHMEDATAEFETIVA: TDateTimeField;
    qryHistMovHMEDATAATUALIZA: TDateTimeField;
    qryHistMovHMEVLREFETIVO: TFloatField;
    qryHistMovPLNCODIGO: TFloatField;
    qryHistMovPLNCODIGOESTORNO: TFloatField;
    qryHistMovCODDOCUMENTO: TFloatField;
    qryHistMovIDRUBRICA: TFloatField;
    qryHistMovEVENTO: TStringField;
    qryHistMovFORMACOBRANCA: TStringField;
    qryHistMovTIPOFOLHA: TStringField;
    qryHistMovIDHISTMOVEMPTMO: TFloatField;
    qryHistMovHMENUMPARCELAS: TFloatField;
    qryHistMovHMEMESCOBRANCA: TFloatField;
    qryHistMovHMEANOCOBRANCA: TFloatField;
    qryHistMovHMEDATAVENCTO: TDateTimeField;
    qryHistMovHMEDATAQUITABONO: TDateTimeField;
    qryHistMovFLGBAIXAMANUAL: TFloatField;
    qryHistMovFLGDIVERGPEND: TFloatField;
    qryHistMovHMECENTRALIZA: TFloatField;
    qryHistMovHMEDESTACADO: TFloatField;    // SOL 160941 Kintana 1355879   fim criacao da query


      procedure btnBuscaContratoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);


   private  // Private declarations

      memErro        : TStringList;
      // SOL 160941 Kintana 1355879
      iPais             : Integer;
      sEstado           : String;
      iCidade           : Integer;

      rContrato         : TDadosContrato;
      rConcessao        : TDadosConcessao;
      vLista            : TListaItem;
      vListaCalculo     : TListaItem;
      rSaldosAntPos     : TSaldosAntPos;
      // SOL 160941 Kintana 1355879
      sFiltroContEmp : String;

      procedure Sel(i: Extended);
      procedure PreencheDadosContrato(iNumParcela : Integer); // SOL 160941 Kintana 1355879

      function ExisteItemGerado(bAtuDia: Boolean): Boolean;
      function ExisteMaisDeUmContratoNoDocumento: Boolean;
      function VerificaPreenchimento: Boolean;

      function PegaConcessao: Boolean;


   public   // Public declarations
   iIdbenef   : integer;  // xavier

   end;



var
   frmCancAlteracaoConcessao: TfrmCancAlteracaoConcessao;



implementation
{$R *.DFM}
uses
   UMensErro,      (* MsgDlg *)
   USistema,       (* Sistema *)
   UDatabase,      (* StartTransacao *)
   DLookEmptmo,    (* qryLookPortadorFormaR *)
   ULancContab,
   dMS,
   uIntegraEmptmo,
   uCalcEmptmo,
   uVerificaPreenchimento,
   DBaseDados,
   dEmptmo,
   FExecBuscaContrato, DDividaEP;




function TfrmCancAlteracaoConcessao.ExisteMaisDeUmContratoNoDocumento: Boolean;
begin
   Result := True;

   try
      with qryMaisDeUmContrato do
      begin
         LimpaParametros(qryMaisDeUmContrato);
         ParamByName('PCODDOCUMENTO').AsFloat := qryConcessaoCODDOCUMENTO.AsFloat;
         Open;

         if (qryMaisDeUmContrato.IsEmpty) or (qryMaisDeUmContratoNUMEROCONTRATOS.AsInteger <= 1) then Result := False;

         Close;
      end;
   except
      Raise;
      Repaint;
   end;
end;


   // SOL 160941 Kintana 1355879 criacao da proc
procedure TfrmCancAlteracaoConcessao.PreencheDadosContrato(iNumParcela : Integer);
var
   iContador   : Integer;
   qryAux      : TwwQuery;
   sSQL        : String;
begin
   // Procedimento que armazena os dados da Inscrição num registro
   LimpaRegistroContrato(rContrato);
   LimpaRegistroConcessao(rConcessao);

   // É nulo na Concessão
   rContrato.IdContratoEmptmo  := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
   rContrato.IDContrQuitacao   := dtmEmptmo.qryDadosContratoIDCONTRQUITACAO.AsFloat;

   rContrato.IdPessoa          := dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger;
   rContrato.IDTipoContrEmptmo := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;
   rContrato.IDTipoEmptmo      := dtmEmptmo.qryDadosContratoIDTIPOEMPTMO.AsInteger;
   rContrato.IdPlanoPrev       := dtmEmptmo.qryDadosContratoIDPLANOPREV.AsInteger;
   rContrato.IDPlanoOrigem     := dtmEmptmo.qryDadosContratoIDPLANOORIGEM.AsInteger;
   rContrato.IdPatro           := dtmEmptmo.qryDadosContratoIDPATRO.AsInteger;
   rContrato.Indexador         := dtmEmptmo.qryDadosContratoMOECODIGO.AsInteger;
   rContrato.IdSitPart         := dtmEmptmo.qryDadosContratoIDSITPART.ASInteger;

   try
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BASEDADOS';

      sSQL := 'SELECT MOESIGLA FROM MOEDA WHERE MOECODIGO = ' + IntToStr(rContrato.Indexador);

      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      rContrato.SiglaIndexador := qryAux.FieldByName('MOESIGLA').AsString;
   finally
      qryAux.Close;
      qryAux.Free;
   end;

   // Número da Inscrição
   rContrato.IDInscricaoEmptmo := dtmEmptmo.qryDadosContratoIDInscricaoEmptmo.AsFloat;

   // É nulo
   rContrato.IDVerba := -1;

   // Beneficiário do Contrato
   //   IDBENEF = IDPESSOA -> do Titular no caso de estar vivo
   //   e do Beneficiário no caso de Pensionista
   rContrato.IdBenef          := dtmEmptmo.qryDadosContratoIDBENEF.AsInteger;

   rContrato.FlgSuspensaoAuto := dtmEmptmo.qryDadosContratoFLGSUSPENSAOAUTO.AsInteger;

   if not(dtmEmptmo.qryDadosContratoIDCBANCARIA.IsNull) then begin
      rContrato.IDCBancaria   := dtmEmptmo.qryDadosContratoIDCBANCARIA.AsInteger;
   end else begin
      // É nulo
      rContrato.IDCBancaria   := -1;
   end;

   // É nulo
   if dtmEmptmo.qryDadosContratoCODFORMAPAG.AsString <> '' then
   begin
      rContrato.CodFormaPag   := dtmEmptmo.qryDadosContratoCODFORMAPAG.AsInteger;
   end
   else
   begin
      rContrato.CodFormaPag   := -1;
   end;

   if dtmEmptmo.qryDadosContratoPORTFORMAPAG.AsString <> '' then
   begin
      rContrato.PortFormaPag  := dtmEmptmo.qryDadosContratoPORTFORMAPAG.AsInteger;
   end
   else
   begin
      rContrato.PortFormaPag  := -1;
   end;

   if dtmEmptmo.qryDadosContratoPORTFORMAREC.AsString <> '' then
   begin
      rContrato.PortFormaRec  := dtmEmptmo.qryDadosContratoPORTFORMAREC.AsInteger;
   end
   else
   begin
      rContrato.PortFormaRec  := -1;
   end;

   rContrato.NumParcelas      := iNumParcela;                                     // Número de Parcelas
   rContrato.DataCredito      := DBedtDataCredito.Date;                             // Data em que o empréstimo será creditado
   rContrato.DataSituacao     := trunc(SysDate);                                  // Data da Situação do Contrato como data do Sistema
   rContrato.DataAssinatura   := StrToDate(DBedtDataInsc.Text);                   // Data de Assinatura do Contrato como data do Sistema
   rContrato.DataPrimParc     := StrToDate(DBedtDataPrimParcela.Text);            // Data do pagamento da Primeira Parcela do Contrato
   rContrato.DataInscricao    := StrToDate(DBedtDataInsc.Text);                   // Data da Solicitação - Inscrição
   rContrato.DataCanc         := -1;                                              // Data nula


   //rContrato.VlrContrato      := dtmEmptmo.qryDadosContratoVLRCONTRATO.AsFloat;   // Valor do Contrato
   try
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BASEDADOS';

      sSQL := 'SELECT HME.HMEVLRPREVISTO AS VLRCONTRATO FROM HISTMOVEMPTMO  HME '+
              'WHERE HME.IDCONTRATOEMPTMO  = '+dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString+'  '+
              'AND   HME.IDITEMEMPTMO  = 22 '+
              'AND   HME.HMEORIGEM  = 0 ';


      qryAux.SQL.Text := sSQL;
      qryAux.Open;
      rConcessao.ValorSolic      := qryAux.FieldByName('VLRCONTRATO').AsCurrency;
      rContrato.VlrContrato      := qryAux.FieldByName('VLRCONTRATO').AsCurrency;
   finally
      qryAux.Close;
      qryAux.Free;
   end;


   rContrato.VlrParcela       := dtmEmptmo.qryDadosContratoVLRPARCELA.AsFloat;    // Valor da Parcela
   rContrato.Txjuros          := dtmEmptmo.qryDadosContratoTXJUROS.AsFloat;       // Taxa de Juros do Contrato

   rContrato.VlrSalBase       := dtmEmptmo.qryDadosContratoVLRSALBASE.AsCurrency;
   rContrato.VlrMargem        := dtmEmptmo.qryDadosContratoVLRMARGEM.AsCurrency;
   rContrato.VlrMaxPermit     := dtmEmptmo.qryDadosContratoVLRMAXPERMIT.AsCurrency;

   rContrato.VlrParcelaMes    := 0;
   rContrato.VlrParcelaAtraso := 0;
   rContrato.VlrReserva       := dtmEmptmo.qryDadosContratoVLRRESERVA.AsCurrency;
   rContrato.VlrDebito        := 0;

   rContrato.FlgSituacao      := 'A';

   // FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
   //               F -> indicando que o Débito é pela Folha
   rContrato.flgFormaRec      := dtmEmptmo.qryDadosContratoFLGFORMAREC.AsString;


   // FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
   //               F -> indicando que o Crédito é pela Folha
   rContrato.flgFormaPag      := dtmEmptmo.qryDadosContratoFLGFORMAPAG.AsString;

   // Carrega os dados da concessão
   rConcessao.DataCredito     := dtmEmptmo.qryDadosContrato.FieldByName('DATACREDITO').AsDateTime;
   //rConcessao.ValorSolic      := dtmEmptmo.qryDadosContrato.FieldByName('VLRCONTRATO').AsCurrency;
   rConcessao.Prazo           := dtmEmptmo.qryDadosContrato.FieldByName('PRAZO').AsInteger;
end;
// SOL 160941 Kintana 1355879 fim criacao da proc

function TfrmCancAlteracaoConcessao.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
   bIofRetido  : Boolean;
begin
   Result := False;

   try
      // data de cancelamento
      if length(trim(edtDataCanc.Text))= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Cancelamento!', edtDataCanc);

      // verifica a situação do contrato
      if (dtmEmptmo.qryDadosContratoDESCSITCONTRATO.AsString <> 'Ativo') and
         (dtmEmptmo.qryDadosContratoDESCSITCONTRATO.AsString <> 'Pendente') then
         raise EValidacao.CreateVal('O Contrato não está "Ativo" nem "Pendente"!', bbtnConfirmar);

      if not(PegaConcessao) then
         raise EValidacao.CreateVal('Não foi encontrado registro da Alteração da Concessão!', bbtnConfirmar);

      // verifica se a IOF já foi retido
      bIofRetido  := False;
      qryItensConcessao.First;
      while not qryItensConcessao.eof do
      begin
         if not qryItensConcessao.FieldByName('IDLANCIRRF').IsNull then bIofRetido := True;
         qryItensConcessao.Next;
      end;

      if bIofRetido then
         raise EValidacao.CreateVal('Essa alteração já teve o IOF retido!', bbtnConfirmar);

      // verifica se a concessão já foi efetivada
      if (qryConcessaoFLGENVIO.isNULL) then
      begin
         raise EValidacao.CreateVal('A Alteração da Concessão já foi enviada!', bbtnConfirmar);
      end;

      // verifica se a concessão já foi efetivada
      if not(qryConcessaoHMEVLREFETIVO.isNULL) then
      begin
         if not ( (qryConcessaoHMEVLREFETIVO.asCurrency = 0) and (qryConcessaoHMEVLRPREVISTO.asCurrency = 0) ) then
            raise EValidacao.CreateVal('A Alteração da Concessão já foi efetivada!', bbtnConfirmar);
      end;

      // se houve documento, verifica
      if not(qryConcessaoCODDOCUMENTO.IsNull) then
      begin
         if qryConcessaoEMISBLOQ.AsString = 'S' then
            raise EValidacao.CreateVal('O Documento de pagamento já foi emitido!', bbtnConfirmar);

         if qryConcessaoSTATUS.AsString = '2' then
            raise EValidacao.CreateVal('O Documento de pagamento já foi baixado!', bbtnConfirmar);
      end;

      // outro item gerado, fora concessao
      if ExisteItemGerado(False) then
         raise EValidacao.CreateVal('Este Contrato já possui itens gerados após a Concessão! ' + #13 + 'Não pode ser cancelado!', bbtnConfirmar);

      // existe mais de um contrato no documento de concessão (envio em lote)
      if not(qryConcessaoCODDOCUMENTO.IsNull) then
      begin
         if ExisteMaisDeUmContratoNoDocumento then
            raise EValidacao.CreateVal('No Documento (de Contas a Pagar) consta mais de um Contrato! ' + #13 +
                                       'Favor executar o processo de "Desfazer Envio de Concessão por Lote" antes.', bbtnConfirmar);
      end;

      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataCanc.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', edtDataCanc);
      end;

   except
      on ev: EValidacao do
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



procedure TfrmCancAlteracaoConcessao.Sel(i: Extended);
begin
   with dtmEmptmo.qryDadosContrato do
   begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;

      // por defaul, a data do cancelamento será a data do crédito
      edtDataCanc.Date := dtmEmptmo.qryDadosContratoDATACREDITO.AsDateTime;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then edtDataCanc.Date := Date;
   end;
   // SOL 160941 Kintana 1355879
   qryHistMov.Close;
   qryHistMov.SQL.Clear;

   qryHistMov.SQL.ADD('SELECT');
   qryHistMov.SQL.ADD('IRC.ITEDESCRICAO,');

   qryHistMov.SQL.ADD('TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'') || ''/'' || HME.HMEANOCOMPETENCIA AS ANOMESCOMP,');
   qryHistMov.SQL.ADD('TO_CHAR(HME.HMEMESCOBRANCA, ''00'')    || ''/'' || HME.HMEANOCOBRANCA    AS ANOMESCOBR,');

   qryHistMov.SQL.ADD('(LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) AS ANOMESCOMPET,');
   qryHistMov.SQL.ADD('(LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, ''0000'')))) || (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, ''00'')))) AS ANOMESCOB,');

   qryHistMov.SQL.ADD('NVL(HME.FLGENVIO, 1)        AS FLGENVIO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGBAIXADO, 1)      AS FLGBAIXADO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGESTORNADO, 0)    AS FLGESTORNADO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGABONADO, 0)      AS FLGABONADO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGQUITADO, 0)      AS FLGQUITADO,');
   qryHistMov.SQL.ADD('NVL(HME.FLGBAIXAMANUAL, 0)  AS FLGBAIXAMANUAL,');
   qryHistMov.SQL.ADD('NVL(HME.FLGDIVERGPEND, 0)   AS FLGDIVERGPEND,');

   qryHistMov.SQL.ADD('HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRANCA,');
   qryHistMov.SQL.ADD('HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO,');
   qryHistMov.SQL.ADD('HME.HMEDATAPREVISTA  , HME.HMECENTRALIZA    , HME.HMEDESTACADO,');

   qryHistMov.SQL.ADD('NVL(HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO,');
   qryHistMov.SQL.ADD('NVL(HME.HMESALDODEV, 0) AS HMESALDODEV,');

   qryHistMov.SQL.ADD('HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEDATAEFETIVA ,');
   qryHistMov.SQL.ADD('HME.HMEDATAATUALIZA  , HME.HMEVLREFETIVO    , HME.PLNCODIGO      ,');
   qryHistMov.SQL.ADD('HME.PLNCODIGOESTORNO , HME.CODDOCUMENTO     ,');
   qryHistMov.SQL.ADD('HME.IDRUBRICA        , HME.HMEDATAVENCTO,');

   qryHistMov.SQL.ADD('DECODE(HME.HMETIPOMOV, 0, ''Concessão'',');
   qryHistMov.SQL.ADD('                       1, ''Parcela'',');
   qryHistMov.SQL.ADD('                       2, ''Amortização'',');
   qryHistMov.SQL.ADD('                       3, ''Quitação'',');
   qryHistMov.SQL.ADD('                       4, ''Atualização Débito'',');
   qryHistMov.SQL.ADD('                       5, ''Atualização Saldo'') AS EVENTO,');

   qryHistMov.SQL.ADD('DECODE(HME.HMEFORMACOBRANCA,''C'',''Financeiro'',''Folha'') AS FORMACOBRANCA,');
   qryHistMov.SQL.ADD('DECODE(HME.HMETIPOFOLHA,''B'',''Benefício'',''P'',''Patrocinadora'', NULL, '' '') AS TIPOFOLHA,');

   qryHistMov.SQL.ADD('HME.HMEDATAQUITABONO,');

   qryHistMov.SQL.ADD('HME.IDHISTMOVEMPTMO, HME.HMENUMPARCELAS, HME.HMEMESCOBRANCA, HME.HMEANOCOBRANCA');
   qryHistMov.SQL.ADD('FROM');
   qryHistMov.SQL.ADD('HISTMOVEMPTMO  HME,');
   qryHistMov.SQL.ADD('CONTRATOEMPTMO CON,');
   qryHistMov.SQL.ADD('ITEMXTIPOCONTR ITC,');
   qryHistMov.SQL.ADD('ITEMEMPTMO IRC,');
   qryHistMov.SQL.ADD('(SELECT SEQ.IDITEMEMPTMO, SEQ.IDTIPOCONTREMPTMO, MIN(SEQ.ITCSEQCALCULO) AS MINSEQCALCONC FROM ITEMXTIPOCONTR SEQ');
   qryHistMov.SQL.ADD('WHERE ( SEQ.ITCEVENTO         = 0 )');
   qryHistMov.SQL.ADD('GROUP BY SEQ.IDITEMEMPTMO, SEQ.IDTIPOCONTREMPTMO) MIN');

   qryHistMov.SQL.ADD('WHERE');
   qryHistMov.SQL.ADD('    ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO )');
   qryHistMov.SQL.ADD('AND ( HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO )');
   qryHistMov.SQL.ADD('AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )');
   qryHistMov.SQL.ADD('AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO )');
   qryHistMov.SQL.ADD('AND ( ITC.IDTIPOCONTREMPTMO = MIN.IDTIPOCONTREMPTMO )');
   qryHistMov.SQL.ADD('AND ( ITC.IDITEMEMPTMO      = MIN.IDITEMEMPTMO )');

   qryHistMov.SQL.ADD('AND ( HME.IDCONTRATOEMPTMO  ='+ floatTostr(i)+ ')' );
   qryHistMov.SQL.ADD('AND ( CON.IDCONTRATOEMPTMO  ='+ floatTostr(i)+ ')' );
   qryHistMov.SQL.ADD('AND ( HME.HMETIPOMOV        = 0 )');
   qryHistMov.SQL.ADD('AND ( HME.HMEPARCELA        = 0 )');
   qryHistMov.SQL.ADD('AND ( HME.HMESEQCOBRANCA    = 1 )');

   qryHistMov.SQL.ADD('ORDER BY');
   qryHistMov.SQL.ADD('ITC.ITCSEQCALCULO');

   qryHistMov.Open;
   //SOL 160941 Kintana 1355879

end;



procedure TfrmCancAlteracaoConcessao.btnBuscaContratoClick(Sender: TObject);
var
   iIdContratoEmptmo : Extended;
begin
   inherited;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);

      frmExecBuscaContrato.Tabelas := ', HISTMOVEMPTMO HME '                                                                           + #13;

      frmExecBuscaContrato.Filtro  := 'AND CON.FLGSITUACAO       = ''A'' '                                                             + #13 +
                                      'AND HME.HMETIPOMOV        = 0 '                                                                 + #13 +
                                      'AND HME.HMEORIGEM         = 13 '                                                                + #13 +
                                      'AND HME.HMECENTRALIZA     = 1 '                                                                 + #13 +
                                      'AND ((HME.FLGESTORNADO    IS NULL)  OR (HME.FLGESTORNADO   = 0)) '                              + #13 +
                                      'AND HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO '                                              + #13;
      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         iIdContratoEmptmo := StrToFloat(frmExecBuscaContrato.ValoresChave[0]);
         iIdbenef      := StrToint(frmExecBuscaContrato.ValoresChave[4]);
         // abre a query principal com o participante escolhido
         Sel(iIdContratoEmptmo);
         DBEdit1.Text  := frmExecBuscaContrato.ValoresChave[1];
         frmExecBuscaContrato.Free;

         Application.ProcessMessages;
      end;
   end
   else
   begin
      dtmMS.MS_ContrCancConc.Executar;
      Repaint;

      if dtmMS.MS_ContrCancConc.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         // abre a query principal com o participante escolhido
         Sel(StrToFloat(dtmMS.MS_ContrCancConc.ValoresChave[0]));

         Application.ProcessMessages;

         Screen.Cursor := crDefault;
      end;  // if MontaSelect.RetornouValor
   end;
end;



procedure TfrmCancAlteracaoConcessao.bbtnConfirmarClick(Sender: TObject);
var
   qryAux            : TwwQuery;
   sContrato         : String;
   sDataCanc         : String;
   sSql, sMsg        : String;
   sHistoricoContab  : String;
   sResult, sErro    : TStringList;
   iPlanilhaResult,
   i                 : Integer; // SOL 160941 Kintana 1355879
   rLogTotalPrev     : TLogTotalPrev;
   dDataUltAtuDia    : TDateTime;
   sAnoMesCompet     : String;     // SOL 160941 Kintana 1355879
   fSaldoEPAnt, fValorParcela    : extended; //SOL 160941 Kintana 1355879

begin
   inherited;

   // Verifica preenchimento
   if not(VerificaPreenchimento) then exit;

   // última chance...
   if MsgDlg('Deseja realmente CANCELAR a Alteração de Concessão?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

      // xavier
   uFuncoesEmptmo.buscaUsuarioMutuario(iIdbenef);

   if uFuncoesEmptmo.bBuscaMutuario then
   begin
      MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                        'O usuário é o próprio mutuário do contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
      Abort;
   end;
   // xavier

   ParametrosSistema;

   memErro.Clear;
   memErro.Add('Forma   Contrato      Titular                                                         Valor Previsto');
   memErro.Add('--------------------------------------------------------------------------------------------');

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sDataCanc            := FormatDateTime('dd/mm/yyyy', edtDataCanc.Date);
   sContrato            := FloatToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat);

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
      try
         if CalcEmptmo.CancelaAlteracaoConcessao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                                 qryConcessaoHMEDATAPREVISTA.AsDateTime,
                                                 edtDataCanc.Date,
                                                 True
                                                ) = 0 then
         begin
            //SOL 160941 Kintana 1355879

            sAnoMesCompet  := FormatDateTime('YYYYMM', edtDataCanc.Date);

            // Efetua o cálculo dos itens conforme os novos dados
            PreencheDadosContrato(dtmEmptmo.qryDadosContratoPRAZO.AsInteger);


            qryHistMov.First;
            while not(qryHistMov.EOF) do
            begin
               if (qryHistMovIDITEMEMPTMO.AsInteger = 18) and (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
               begin
                  fSaldoEPAnt := qryHistMovHMEVLRPREVISTO.AsCurrency;
               end;
               //Pendência 23078 - 15/08/2006 - Alberto
               if (qryHistMovIDITEMEMPTMO.AsInteger = 2) and (Sistema.TipoCliente = 19971) then
               begin
                  fSaldoEPAnt := qryHistMovHMEVLRPREVISTO.AsCurrency;
               end;
               //Fim Pendência 23078
               qryHistMov.Next;
            end;

            iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
            iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
            sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

            try
               CalcEmptmo.CalculaItens(rContrato,
                                       rConcessao,
                                       0,    // Tipo do item - É parcela 0 na Concessão
                                       13,   // Alteração de concessão
                                       iPais,
                                       sEstado,
                                       iCidade,
                                       rSaldosAntPos.iParcelaPos,
                                       dtmEmptmo.qryDadosContratoIDSITPART.AsInteger,
                                       rContrato.FlgFormaPag,
                                       dtmEmptmo.qryDadosContratoTXJUROS.AsFloat,   // rSaldosAntPos.fTxJurosPos,
                                       rContrato.VlrContrato,
                                       rContrato.VlrContrato,
                                       fSaldoEPAnt,                                 // saldo devedor do contrato anterior (já quitado)
                                       rContrato.VlrMargem,
                                       0, 0, 0, 0, 0, 0,
                                       dtmEmptmo.qryDadosContratoVLRMAXPERMIT.AsFloat,//0,//edtMaximo.Value,
                                       0, 0, 0,
                                       edtDataCanc.Date,
                                       edtDataCanc.Date,
                                       sAnoMesCompet,
                                       False,
                                       True,
                                       True,
                                       //Pendência 22913 - 28/07/2006 - Alberto
                                       // vLista
                                       //);
                                       vLista,
                                       0, 0, 0,
                                       True,
                                       0, 0, -1,
                                       False,
                                       0, 0, 0, 0, 0,
                                       True,
                                       dtmEmptmo.qryDadosContratoFLGFINANCIAMENTO.AsInteger
                                       //Pendência 22836 - 03/10/2006 - Alberto
                                       ,false
                                       //Fim Pendência 22836
                                       );
                                       //Fim Pendência 22913
            except
               MsgDlg('Erro ao calcular itens!', 'Empréstimo', mtError, [mbOk], 0);
               Exit;
            end;

            // Laço verificando se o item é parcela ou se é o Líquido concedido
            fValorParcela := 0;
            for i := 0 to High(vLista) do
            begin
               // é a Parcela
               if ( (vLista[i].iEvento = 1) and (vLista[i].FlgCentraliza = 1) ) then
               begin
                  if vLista[i].Valor > 0 then
                  begin
                     fValorParcela  := vLista[i].Valor;
                  end;
               end;
            end;  // for


            //BRUNO AZEVEDO SOL 153818 KINTANA 1163513
            sSQL:=
            'UPDATE CONTRATOEMPTMO SET '       + #13 +
            '   VLRPARCELA = '  + QuotedStr(FloatToStr(fValorParcela)) + #13 +
            '  ,VLRCONTRATO = ' + QuotedStr(StringReplace(FloatToStr(rContrato.VlrContrato),'.','',[])) + #13 +
            'WHERE IDCONTRATOEMPTMO = ' + dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString;

            qryAux.SQL.Clear;
            qryAux.SQL.Add(sSQL);
            qryAux.ExecSQL;
            //BRUNO AZEVEDO SOL 153818 KINTANA 1163513




            // SOL 160941 Kintana 1355879
            CommitTransacao;

            MsgDlg('Processo finalizado.' + #13 + 'Alteração de Concessão cancelada.', 'Empréstimo', mtInformation, [mbOk], 0);
            Repaint;

            Sel(-1);
         end
         else
            RollBackTransacao;
      except
         RollBackTransacao;
         Raise;

         MsgDlg('Processo interrompido.' + #13 + 'Não foi possível cancelar esta alteração de concessão.',
                'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
      end;

   finally
      qryAux.Free;
   end;

   if memErro.Count > 2 then MsgDlg(memErro.Text, 'Empréstimo', mtInformation, [mbOk], 0);
end;



procedure TfrmCancAlteracaoConcessao.FormShow(Sender: TObject);
begin
   inherited;

   memErro            := TStringList.Create;
   edtDataCanc.Date   := sysdate;

   ParametrosSistema;

   grpTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);
end;



function TfrmCancAlteracaoConcessao.PegaConcessao: Boolean;
begin
   with qryConcessao do
   begin
      LimpaParametros(qryConcessao);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
   end;

   try
      qryConcessao.Open;
      Result := not(qryConcessao.IsEmpty);
   except
   end;

   if Result then
   begin
      with qryItensConcessao do
      begin
         LimpaParametros(qryItensConcessao);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         Open;
      end;
   end;
end;


                        
procedure TfrmCancAlteracaoConcessao.FormCreate(Sender: TObject);
begin
   inherited;
   sFiltroContEmp := dtmMS.MS_ContratoEmptmo.Filtro.Text;

   // Faz o MontaSelect mostrar somente os Contratos que estao ativos ou pendentes 
   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO IN (''A'', ''P'') ');
end;



procedure TfrmCancAlteracaoConcessao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmMS.MS_ContratoEmptmo.Filtro.Clear;
   UFuncoesEmptmo.bBuscaMutuario := false;
   dtmMS.MS_ContratoEmptmo.Filtro.Text    := sFiltroContEmp;

   dtmEmptmo.qryDadosContrato.Close;

   inherited;
end;



function TfrmCancAlteracaoConcessao.ExisteItemGerado(bAtuDia: Boolean): Boolean;
begin
   try
      with qryItemGerado do
      begin
         LimpaParametros(qryItemGerado);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat           := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;

         //Pendência 24452 - 08/02/2007 - Alberto
         ParamByName('PHMEDATAPREVISTA').AsDate             := qryConcessaoHMEDATAPREVISTA.AsDateTime; //DBedtDataCredito.Date;

         if bAtuDia then ParamByName('PATUDIA').AsInteger   := 1;
         Open;

         Result := not(isEmpty);
      end;
   finally
      qryItemGerado.Close;
   end;
end;



end.
