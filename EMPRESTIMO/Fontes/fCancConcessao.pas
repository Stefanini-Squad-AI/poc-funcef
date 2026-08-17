unit FCancConcessao;

// Alterações:
{ ------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
Atender     : WO9439
Responsável : Luis Ferrari
Data        : 11/12/2024
Descrição   : No processo de cancelamento de Novação pela Política de Renegociação foi retirado o evento
              de Cobrança nos contratos que haviam sido quitados pela Novação.
----------------------------------------------------------------------------------------------------
Pendência   : SIG122045
Responsável : Ewerton Beltramini 
Data        : 27/04/2022  
Descrição   : Inclusão de opção para processamento em lote via ContratosAd.
----------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 14/07/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 03/07/2006
Autor     : Alberto
Pendência : 22740
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 04/07/2005
Autor     : André Pontes
Pendência : -
Descrição : "Proteção" do cógigo que desfaz atualização diária (flgCalcDia);
            "Proteção" do cógigo que desfaz SIAFI (flgExcepcional);
----------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 15/07/2003
Autor     : André Pontes
Pendência : 14431
Descrição : "ExisteMaisDeUmContratoNoDocumento": verifica se o Documento (CaP) de concessão possui
            mais de um Contrato. Nesse caso, houve envio de concessões em lote, e é necessário
            desfazer o envio antes de se cancelar a concessão.
----------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 23/04/2003
Autor     : André Pontes
Descrição : "ExisteItemGerado": verifica se há item gerado após a concessão, para double-check
            Todas as críticas estão agora nessa rotina
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick (ContabilizaItens)
Data      : 09/01/2003
Autor     : André Pontes
Descrição : Funçao foi reposicionada no fim do processo, pq a qryHistoricoMov não vê itens estornados
            Foi adicionada no result da função PegaContabil um update para estornar os itens caso
            não haja contabilização.
----------------------------------------------------------------------------------------------------
Rotina    : PegaContabil
Data      : 05/12/2002
Autor     : André Pontes
Descrição : Incluídos na query de contabilização os registros de quitação do(s) contrato(s) anteriores
            quitados pelo contrato cuja concessão está sendo cancelada DE MODO QUE NÃO HÁ MAIS EXCLUSÃO
            CONTÁBIL, SÓ ESTORNO
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick (ContabilizaItens)
Data      : 05/12/2002
Autor     : André Pontes
Descrição : A data da planilha de estorno do Contrato (de concessão) passa a ser a de cancelamento,
            e não mais a de concessão
----------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 05/12/2002
Autor     : André Pontes
Descrição : Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
            estorno na data de cancelamento indicada
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 11/11/2002
Autor     : Marchetti
Descrição : Colocado um loop para poder apagar os registros do finenceiro e da contabilidade quando
            reativando contrato anterior
----------------------------------------------------------------------------------------------------
Rotina    : qryHistoricoMov
Data      : 27/09/2002
Autor     : Marchetti
Descrição : Acerto na query que busca o item centralizador da quitaçào que posteriormente será passado
            para o procedimento de exclusão do histórico . Estava verificando incorretamente
            o flgbaixado e hmedataefetiva.
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, Mask,
   DBCtrls, fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, wwdblook,
   ComCtrls, MontaSelect, uFiario,

   uTypesEmptmo;

type
   TfrmCancConcessao = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
      bbtnConfirmar: TBitBtn;
      dts: TwwDataSource;
      Panel1: TPanel;
      Label15: TLabel;
      edtDataCanc: TCMDateTimePicker;
      qryConcessao: TwwQuery;
      qryConcessaoIDCONTRATOEMPTMO: TFloatField;
      qryConcessaoHMEANOCOBRANCA: TFloatField;
      qryConcessaoHMEMESCOBRANCA: TFloatField;
      qryConcessaoCODDOCUMENTO: TFloatField;
      qryConcessaoHMEFORMACOBRANCA: TStringField;
      qryConcessaoSTATUS: TStringField;
      qryConcessaoEMISBLOQ: TStringField;
      qryConcessaoFLGENVIO: TFloatField;
      qryConcessaoHMEVLRPREVISTO: TFloatField;
      qryDesContabiliza: TwwQuery;
      qryConcessaoIDPESSOA: TFloatField;
      qryContratoAnterior: TwwQuery;
      qryContratoAnteriorIDCONTRATOEMPTMO: TFloatField;
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
      qryHistoricoMov: TwwQuery;
      qryHistoricoMovIDHISTMOVEMPTMO: TFloatField;
      qryHistoricoMovIDCONTRATOEMPTMO: TFloatField;
      qryHistoricoMovCODDOCUMENTO: TFloatField;
      qryHistoricoMovHMEFORMACOBRANCA: TStringField;
      qryHistoricoMovHMECENTRALIZA: TFloatField;
      qryHistoricoMovHMEDESTACADO: TFloatField;
      qryHistoricoMovHMEVLRPREVISTO: TFloatField;
      qryHistoricoMovFLGENVIO: TFloatField;
      qryHistoricoMovPLNCODIGO: TFloatField;
      qryHistoricoMovSTATUS: TStringField;
      qryHistoricoMovHMEMESCOBRANCA: TFloatField;
      qryHistoricoMovHMEANOCOBRANCA: TFloatField;
      qryHistoricoMovHMEANOCOMPETENCIA: TFloatField;
      qryHistoricoMovHMEMESCOMPETENCIA: TFloatField;
      qryHistoricoMovHMEDATAPREVISTA: TDateTimeField;
      qryConcessaoINSCRICAO: TFloatField;
      qryItemGerado: TwwQuery;
      qryItemGeradoIDCONTRATOEMPTMO: TFloatField;
      qryConcessaoHMEVLREFETIVO: TFloatField;
      qryConcessaoIDBENEF: TFloatField;
      qryMaisDeUmContrato: TwwQuery;
      qryMaisDeUmContratoNUMEROCONTRATOS: TFloatField;
    qryConcessaoIDHISTMOVEMPTMO: TFloatField;
    qryTipoContrato: TwwQuery;
    qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
    qryTipoContratoTCEDESCRICAO: TStringField;
    qryTipoContratoIDTIPOEMPTMO: TFloatField;
    qryTipoContratoIDREGRAJURCONC: TFloatField;
    qryTipoContratoIDREGRAELEG: TFloatField;
    qryTipoContratoIDREGRALIMITES: TFloatField;
    qryTipoContratoIDREGRAPRAZOSCONC: TFloatField;
    qryTipoContratoIDREGRAMARGEM: TFloatField;
    qryTipoContratoIDREGRARESERVA: TFloatField;
    qryTipoContratoDESCTIPOEMPTMO: TStringField;
    qryTipoContratoTEPMAXCONTRATO: TFloatField;
    qryTipoContratoFLGOBRIGBENEF: TFloatField;
    qryTipoContratoIDREGRASALBAS: TFloatField;
    qryTipoContratoMOECODIGO: TFloatField;
    qryTipoContratoFLGCONCESSAOZERO: TFloatField;
    qryTipoContratoTCEMINRENOVA: TFloatField;
    qryTipoContratoIDREGRADATACRED: TFloatField;
    qryTipoContratoFLGEXCLUIALT: TFloatField;
    qryDesContabilizaIDHISTMOVEMPTMO: TFloatField;
    qryDesContabilizaIDCONTRATOEMPTMO: TFloatField;
    qryDesContabilizaIDITEMEMPTMO: TFloatField;
    qryDesContabilizaITEDESCRICAO: TStringField;
    qryDesContabilizaVLRPREVISTO: TFloatField;
    qryDesContabilizaVLREFETIVO: TFloatField;
    qryDesContabilizaFORMACOBRANCA: TStringField;
    qryDesContabilizaIDTIPOCONTREMPTMO: TFloatField;
    qryDesContabilizaIDPLANOORIGEM: TFloatField;
    qryDesContabilizaIDPLANOPREV: TFloatField;
    qryDesContabilizaIDPATRO: TFloatField;
    qryDesContabilizaTIPCODIGO: TStringField;
    chkInContratoAD: TCheckBox;
    QryContratosAD: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    Bevel1: TBevel;
    memArquivo: TMemo;
    Label2: TLabel;
    chkInscricaoEmp: TCheckBox;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkInContratoADClick(Sender: TObject);


   private  // Private declarations

      memErro        : TStringList;

      sFiltroContEmp : String;

      procedure Sel(i: Extended);

      procedure ExcFolha;

      function ExisteItemGerado(bAtuDia: Boolean): Boolean;
      function ExisteMaisDeUmContratoNoDocumento: Boolean;
      function VerificaPreenchimento: Boolean;

      function PegaConcessao: Boolean;
      function PegaContabil: Integer;


   public   // Public declarations

   bPula : Boolean;

   end;



var
   frmCancConcessao: TfrmCancConcessao;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, (* LimpaParametros *)
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




function TfrmCancConcessao.ExisteMaisDeUmContratoNoDocumento: Boolean;
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



function TfrmCancConcessao.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   if chkInContratoAD.State = cbUnchecked then
   begin
         try   

             if UFuncoesEmptmo.bBuscaMutuario then
               raise EValidacao.CreateVal('O processo não poderá ser executado.' + #13 + 'O usuário é o próprio mutuário do contrato de empréstimo!', bbtnConfirmar);

            if qryTipoContrato.FieldByName('FLGEXCLUIALT').AsInteger  = 1 then
               raise EValidacao.CreateVal('O tipo de contrato não permite cancelamento da concessão!', btnBuscaContrato);

            // data de cancelamento
            if length(trim(edtDataCanc.Text))= 0 then
               raise EValidacao.CreateVal('É necessário indicar a Data de Cancelamento!', edtDataCanc);

            // verifica a situação do contrato
            if (dtmEmptmo.qryDadosContratoDESCSITCONTRATO.AsString <> 'Ativo') and
               (dtmEmptmo.qryDadosContratoDESCSITCONTRATO.AsString <> 'Pendente') then
               raise EValidacao.CreateVal('O Contrato não está "Ativo" nem "Pendente"!', bbtnConfirmar);

            if not(PegaConcessao) then
               raise EValidacao.CreateVal('Não foi encontrado registro da Concessão!', bbtnConfirmar);

            // verifica se a concessão já foi efetivada
            if not(qryConcessaoHMEVLREFETIVO.isNULL) then
            begin
               if not ( (qryConcessaoHMEVLREFETIVO.asCurrency = 0) and (qryConcessaoHMEVLRPREVISTO.asCurrency = 0) ) then
                  raise EValidacao.CreateVal('A Concessão já foi efetivada!', bbtnConfirmar);
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

            // outro item gerado, fora concessao
            if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) and (ExisteItemGerado(True)) then
               if MsgDlg('Este Contrato já possui Atualização Diária! ' + #13 + #13 + 'Deseja realmente cancelar a Concessão?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0 ) = mrNo then Exit;

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
   end
   else if chkInContratoAD.State = cbChecked then
   begin

            bPula := False;

            if qryTipoContrato.FieldByName('FLGEXCLUIALT').AsInteger  = 1 then begin
                 memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'O tipo de contrato não permite cancelamento da concessão!'); //Ewerton Beltramini - 27/04/2022 - SIG122045
                 bPula:= True;
            end;

            if (dtmEmptmo.qryDadosContratoDESCSITCONTRATO.AsString <> 'Ativo') and (dtmEmptmo.qryDadosContratoDESCSITCONTRATO.AsString <> 'Pendente') then begin
                 memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'O Contrato não está "Ativo" nem "Pendente"!'); //Ewerton Beltramini - 27/04/2022 - SIG122045
                 bPula:= True;
            end;

            if not(PegaConcessao) then begin
                 memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'Não foi encontrado registro da Concessão!'); //Ewerton Beltramini - 27/04/2022 - SIG122045
                 bPula:= True;
            end;

            if not(qryConcessaoHMEVLREFETIVO.isNULL) then
               if not ( (qryConcessaoHMEVLREFETIVO.asCurrency = 0) and (qryConcessaoHMEVLRPREVISTO.asCurrency = 0) ) then begin
                    memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'A Concessão já foi efetivada!'); //Ewerton Beltramini - 27/04/2022 - SIG122045
                    bPula:= True;
               end;

            if not(qryConcessaoCODDOCUMENTO.IsNull) then begin
                 if qryConcessaoEMISBLOQ.AsString = 'S' then begin
                      memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'O Documento de pagamento já foi emitido!'); //Ewerton Beltramini - 27/04/2022 - SIG122045
                      bPula:= True;
                 end;
                 if qryConcessaoSTATUS.AsString   = '2' then  begin
                      memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'O Documento de pagamento já foi baixado!'); //Ewerton Beltramini - 27/04/2022 - SIG122045
                      bPula:= True;
                 end;
            end;

            if ExisteItemGerado(False) then begin
               memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'Este Contrato já possui itens gerados após a Concessão!'); //Ewerton Beltramini - 27/04/2022 - SIG122045
               bPula:= True;
            end;

            if not(qryConcessaoCODDOCUMENTO.IsNull) then
               if ExisteMaisDeUmContratoNoDocumento then begin
                  memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'No Documento (de Contas a Pagar) consta mais de um Contrato!' + #13
                                                                                                   + 'Favor executar o processo de "Desfazer Envio de Concessão por Lote" antes.'); //Ewerton Beltramini - 27/04/2022 - SIG122045
                  bPula:= True;
               end;

            if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then begin
               sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataCanc.Date);
               iEmpresa    := Sistema.idEmpresa;
               sMsgContab  := '';

               if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then begin
                  memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'Não é possível fazer o estorno contábil na data indicada:' + #13 + ' - (' + sMsgContab + ')'); //Ewerton Beltramini - 27/04/2022 - SIG122045
                  bPula:= True;
               end;
            end;

            if UFuncoesEmptmo.bBuscaMutuario then begin
               memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + ' O processo não poderá ser executado. ' + #13 + ' O usuário é o próprio mutuário do contrato de empréstimo! '); //Ewerton Beltramini - 27/04/2022 - SIG122045
               bPula:= True;
            end;
   end;

   Result := True;
end;



procedure TfrmCancConcessao.Sel(i: Extended);
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
end;



procedure TfrmCancConcessao.btnBuscaContratoClick(Sender: TObject);
var
   iIdContratoEmptmo : Extended;
   iIdBenef          : Integer;
begin
   inherited;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);

      frmExecBuscaContrato.Tabelas := ', HISTMOVEMPTMO HME '                                                                           + #13;
      frmExecBuscaContrato.Filtro  := 'AND CON.FLGSITUACAO       = ''A'' '                                                             + #13 +
                                      'AND (HME.FLGBAIXADO       = 0 OR HME.HMEVLREFETIVO = 0) '                                       + #13 +
                                      'AND HME.HMETIPOMOV        = 0 '                                                                 + #13 +
                                      'AND HME.HMECENTRALIZA     = 1 '                                                                 + #13 +
                                      'AND ((HME.HMEVLREFETIVO   IS NULL AND HME.HMEDATAEFETIVA IS NULL) OR HME.HMEVLREFETIVO = 0) '   + #13 +
                                      'AND ((HME.FLGESTORNADO    IS NULL)  OR (HME.FLGESTORNADO   = 0)) '                              + #13 +
                                      'AND HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO '                                              + #13;
      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         iIdContratoEmptmo := StrToFloat(frmExecBuscaContrato.ValoresChave[0]);
         // abre a query principal com o participante escolhido
         iIdBenef := StrToInt(frmExecBuscaContrato.ValoresChave[4]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);
         Sel(iIdContratoEmptmo);
         DBEdit1.Text  := frmExecBuscaContrato.ValoresChave[1];
         frmExecBuscaContrato.Free;

         LimpaParametros(qryTipoContrato);
         qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;
         qryTipoContrato.Open;


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
         iIdBenef := StrToInt(dtmMS.MS_ContrCancConc.ValoresChave[2]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);
         LimpaParametros(qryTipoContrato);
         qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;
         qryTipoContrato.Open;


         Application.ProcessMessages;

         Screen.Cursor := crDefault;
      end;  // if MontaSelect.RetornouValor
   end;
end;



procedure TfrmCancConcessao.bbtnConfirmarClick(Sender: TObject);
var
   qryAux            : TwwQuery;
   sContrato         : String;
   sDataCanc         : String;
   sSql, sMsg        : String;
   sHistoricoContab  : String;
   sResult, sErro    : TStringList;
   iPlanilhaResult   : Integer;
   rLogTotalPrev     : TLogTotalPrev;
begin
   inherited;

//Ewerton Beltramini - 27/04/2022 - SIG122045 - Inicio...
   memArquivo.Clear;

    // data de cancelamento
    if length(trim(edtDataCanc.Text))= 0 then
    begin
         MessageBox(handle,'É necessário indicar a Data de Cancelamento! Não é possivel continuar.','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
    end;  

   //Para carregar lista...
   if chkInContratoAD.State = cbChecked then
   begin
        QryContratosAD.Close;
        QryContratosAD.Open;
        if QryContratosAD.RecordCount < 1 then begin
             QryContratosAD.Close;
             MessageBox(handle,'Nenhum contrato AD localizado! Não é possivel continuar.','Atenção',MB_ICONWARNING + MB_OK);
             Abort;
        end
        else begin
             memArquivo.lines.Add('Selecionado(s) (' + IntTostr(QryContratosAD.RecordCount) + ') Contrato(s) AD'); //Ewerton Beltramini - 27/04/2022 - SIG122045
             memArquivo.lines.Add('--> Processando...'); //Ewerton Beltramini - 27/04/2022 - SIG122045
        end;
   end;

 //Para executar ao menos uma vez, para os casos indivuduais... ou repetir para casos diversos.
 repeat

   if chkInContratoAD.State = cbChecked then
   begin
        UFuncoesEmptmo.buscaUsuarioMutuario(QryContratosAD.FieldByName('IDBENEF').AsInteger);
        Sel(QryContratosAD.FieldByName('IDCONTRATOEMPTMO').AsFloat);
        LimpaParametros(qryTipoContrato);
        qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsInteger;
        qryTipoContrato.Close;
        qryTipoContrato.Open;
        Application.ProcessMessages;
   end;
//Ewerton Beltramini - 27/04/2022 - SIG122045 - Fim

   bPula := False;

   // Verifica preenchimento
   if not(VerificaPreenchimento) then exit;

   if bPula then
   begin
       QryContratosAD.Next;
       Continue;
   end;

   // última chance...
   //if MsgDlg('Deseja realmente CANCELAR a Concessão?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

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
      //Pendência 19929 - 26/06/2006 - Alberto Carvalho
      sErro := TStringList.Create;

      try
         try
            // -------------------------------------------------------------------------------------
            if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
            begin
               // Desfaz Atualização Diária
               sSql:=
               'UPDATE '                                                                                    + #13 +
               '   HISTMOVEMPTMO '                                                                          + #13 +
               'SET '                                                                                       + #13 +
               '   FLGESTORNADO              = 1, '                                                         + #13 +
               '   HMEDATAESTORNOALT         = SYSDATE, '                                                   + #13 +

               // No caso da atualização diária, deve-se fazer isso mesmo
               '   HMEDATAESTORNO            = HMEDATAPREVISTA, '                                           + #13 +
               '   IDUSUARIOESTORNO          = ' + IntToStr(Sistema.IDUsuario)                              + #13 +
               'WHERE '                                                                                     + #13 +
               '       IDCONTRATOEMPTMO      = ' + FormatFloat('#0', qryConcessaoIDCONTRATOEMPTMO.AsFloat)  + #13 +
               '   AND HMETIPOMOV            = 5 '                                                          + #13 +
               '   AND NVL(FLGESTORNADO, 0)  = 0 ';

               qryAux.SQL.Clear;
               qryAux.SQL.Text := sSql;
               qryAux.ExecSQL;
            end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
            // -------------------------------------------------------------------------------------


            // -------------------------------------------------------------------------------------
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               // Desfaz SIAFI
               dtmDividaEP.DesfazQuitacaoSIAFI(qryConcessaoIDBENEF.AsInteger,
                                               'EP-' + qryConcessaoIDCONTRATOEMPTMO.AsString
                                              );
            end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
            // -------------------------------------------------------------------------------------


            // -------------------------------------------------------------------------------------
            // Verificar se já foi enviado
            qryConcessao.First;
            while not(qryConcessao.EOF) do
            begin
               if qryConcessaoFLGENVIO.IsNull then
               begin
                  if not(qryConcessaoHMEFORMACOBRANCA.IsNull) then
                  begin
                     case qryConcessaoHMEFORMACOBRANCA.AsString[1] of

                        'C':
                        begin
                           if not(qryConcessaoCODDOCUMENTO.IsNull) then
                           begin
                              if IntegraEmptmo.ExcluiFinanceiro(qryConcessaoCODDOCUMENTO.AsInteger, sMsg) < 0 then
                              begin
                                 MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
                                 Repaint;
                                 RollbackTransacao;
                                 Exit;
                              end;

                              // -------------------------------------------------------------------
                              // André Pontes - 11/01/2006 - LogDocumento - OK

                              LimpaRegistroLog(rLogTotalPrev);

                              rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                              rLogTotalPrev.IDContrato := qryConcessaoIDCONTRATOEMPTMO.AsFloat;
                              rLogTotalPrev.IDHistMov  := qryConcessaoIDHISTMOVEMPTMO.AsFloat;
                              rLogTotalPrev.CodPlanDoc := qryConcessaoCODDOCUMENTO.AsFloat;
                              rLogTotalPrev.Origem     := 16;
                              rLogTotalPrev.Operacao   := 'Exclusão de Documento';
                              rLogTotalPrev.Data       := SysDate;
                              rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                              rLogTotalPrev.Versao     := Sistema.Versao;

                              GravaLogTotalPrev(rLogTotalPrev);

                              // -------------------------------------------------------------------
                           end;
                        end;  // 'C'

                        'F':
                        begin
                           IntegraEmptmo.ExcluiTMPDESCPorMes(qryConcessaoIDCONTRATOEMPTMO.AsFloat,
                                                             -1,
                                                             FormatFloat('0000',qryConcessaoHMEANOCOBRANCA.AsFloat) + '/' +
                                                             FormatFloat('00', qryConcessaoHMEMESCOBRANCA.AsFloat),
                                                             False
                                                            );
                        end;  // 'F'
                     end;  // case qryConcessaoHMEFORMACOBRANCA.AsString[1]
                  end;  // if not(qryConcessaoHMEFORMACOBRANCA.IsNull)
               end;  // if qryConcessaoFLGENVIO.IsNull
               qryConcessao.Next;
            end;  // while not(qryConcessao.EOF)
            // -------------------------------------------------------------------------------------

         except
            Raise;
            Exit;
         end;

         // Registra na tabela de contrato a data do Cancelamento
         sSql:=
         'UPDATE '                                                                  + #13 +
         '  CONTRATOEMPTMO '                                                        + #13 +
         'SET '                                                                     + #13 +
         '  DATACANC          = TO_DATE(''' + sDataCanc + ''',''DD/MM/YYYY''), '    + #13 +
         '  FLGSITUACAO       = ''C'''                                              + #13 +
         'WHERE '                                                                   + #13 +
         '  IDCONTRATOEMPTMO = ' + FloatToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat);

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSql;
         qryAux.ExecSQL;

         // Desfaz a Quitação do Contrato Anterior
         LimpaParametros(qryContratoAnterior);
         qryContratoAnterior.ParamByName('PIDCONTRATOEMPTMO').AsFloat := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         qryContratoAnterior.Open;

         while not(qryContratoAnterior.EOF) do
         begin
            // Pega o contrato no historico de contrato e verifica se ta vazio
            LimpaParametros(qryHistoricoMov);
            qryHistoricoMov.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratoAnteriorIDCONTRATOEMPTMO.AsFloat;
            qryHistoricoMov.ParamByName('PHMETIPOMOV').AsInteger     := 3;
            qryHistoricoMov.Open;

            // Exclui Folha se necessario
            ExcFolha;

            qryHistoricoMov.First;
            while not(qryHistoricoMov.EOF) do
            begin
               if not(qryHistoricoMovCODDOCUMENTO.IsNull) then
               begin
                  if IntegraEmptmo.ExcluiFinanceiro(qryHistoricoMovCODDOCUMENTO.AsInteger, sMsg) < 0 then
                  begin
                     MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
                     Repaint;
                     RollbackTransacao;
                     Exit;
                  end;

                  // -------------------------------------------------------------------------------
                  // André Pontes - 11/01/2006 - LogDocumento - OK

                  LimpaRegistroLog(rLogTotalPrev);

                  rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                  rLogTotalPrev.IDContrato := qryHistoricoMovIDCONTRATOEMPTMO.AsFloat;
                  rLogTotalPrev.IDHistMov  := qryHistoricoMovIDHISTMOVEMPTMO.AsFloat;
                  rLogTotalPrev.CodPlanDoc := qryHistoricoMovCODDOCUMENTO.AsFloat;
                  rLogTotalPrev.Origem     := 16;
                  rLogTotalPrev.Operacao   := 'Exclusão de Documento';
                  rLogTotalPrev.Data       := SysDate;
                  rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                  rLogTotalPrev.Versao     := Sistema.Versao;

                  GravaLogTotalPrev(rLogTotalPrev);

                  // -------------------------------------------------------------------------------
               end
               else
               begin

               end;
               qryHistoricoMov.Next;
            end;

            // Desmarca os itens quitados dos contrato(s) anterior(es)
            CalcEmptmo.DesmarcaItensQuitados(qryHistoricoMovIDCONTRATOEMPTMO.AsFloat,
                                             dtmEmptmo.qryDadosContratoDATACREDITO.AsDateTime,
                                             16
                                            );

            // Grava LogTotalPrev do contrato gravado
            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := 15;
            rLogTotalPrev.IDContrato := qryHistoricoMovIDCONTRATOEMPTMO.AsFloat;
            rLogTotalPrev.IDHistMov  := -1;
            rLogTotalPrev.Origem     := 16;
            rLogTotalPrev.Operacao   := 'Cancelamento de Renovação';
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            qryContratoAnterior.Next;
         end;
         qryContratoAnterior.Close;

         // ----------------------------------------------------------------------------------------

         // Abre e Verifica a Query de estorno Contábil
         case PegaContabil of

            1:
            begin
               // Estorno dos itens (pq não houve contabilização)
               sSql:=
               'UPDATE '                                                               + #13 +
               '  HISTMOVEMPTMO '                                                      + #13 +
               'SET '                                                                  + #13 +
               '  FLGESTORNADO      = 1, '                                             + #13 +
               '  IDUSUARIOESTORNO  = ' + IntToStr(Sistema.IDUsuario) + ', '           + #13 +
               '  HMEDATAESTORNOALT = SYSDATE, '                                       + #13 +
               '  HMEDATAESTORNO    = TO_DATE(''' + sDataCanc + ''', ''dd/mm/yyyy'') ' + #13 +
               'WHERE '                                                                + #13 +
               '      HMETIPOMOV       = 0 '                                           + #13 +
               '  AND IDCONTRATOEMPTMO = ' + sContrato;

               qryAux.SQL.Clear;
               qryAux.SQL.Text := sSql;
               qryAux.ExecSQL;

               //William Moreira da Silva - SOL 253185 PPM 771995 - Inicio
               sSql:=
               ' UPDATE                                                                ' + #13 +
               '   HMEQUITACAO                                                         ' + #13 +
               ' SET                                                                   ' + #13 +
               '   FLGESTORNADO      = 1,                                              ' + #13 +
               '   IDUSUARIOESTORNO  = ' + IntToStr(Sistema.IDUsuario) + ', '           + #13 +
               '   DATAESTORNOALT = SYSDATE,                                           ' + #13 +
               '   DATAESTORNO    = TO_DATE(''' + sDataCanc + ''', ''dd/mm/yyyy'') ' + #13 +
               ' WHERE IDCONTRATOEMPTMO IN ( SELECT IDCONTRATOEMPTMO               ' + #13 +
               '                             FROM CONTRATOEMPTMO                   ' + #13 +
               '                             WHERE IDCONTRQUITACAO = ' + sContrato                               + #13 +
               '                           )                                  ' + #13;

               //William Moreira da Silva - SOL 253185 PPM 771995 - Fim

               qryAux.SQL.Clear;
               qryAux.SQL.Text := sSql;
               qryAux.ExecSQL;

               // MsgDlg('Não há Itens a serem estornados na Contabilidade para este Contrato.', 'Empréstimo', mtInformation, [mbOK], 0);
            end;

            2:
            begin
               MsgDlg('Erro na busca dos Itens a serem estornados na Contabilidade para este contrato.', 'Empréstimo', mtError, [mbOK], 0);
               Repaint;
               RollBackTransacao;
               Exit;
            end;

            else
            begin // 0
               // Retornou 0 (Possui registros a serem estornados na contabilidade)
               // Verificar o parametro de sistema Contabiliza(Sim/Não)
               if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
               begin
                  // Estornar a contabilidade
                  sHistoricoContab := 'Emprestimo - Cancelamento de Concessao - Contrato nº ' +
                                      FloatToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat);

                  if IntegraEmptmo.ContabilizaItens('C',
                                                    'E',
                                                    qryDesContabiliza.SQL.Text,
                                                    sHistoricoContab,
                                                    edtDataCanc.Date,
                                                    sResult,
                                                    sErro,
                                                    iPlanilhaResult
                                                   ) < 0 then
                  begin
                     //Pendência 24899 - 26/03/2007 - Alberto
                     RollBackTransacao;
                     //Fim Pendência 24899
                     MsgDlg('Erro no estorno Contábil dos Itens deste Contrato.', 'Empréstimo', mtInformation, [mbOK], 0);
                     Repaint;

                     Exit;
                  end;

               end
               else
               begin
                  //Pendência 24899 - 26/03/2007 - Alberto
                  RollBackTransacao;
                  //Fim Pendência 24899
                  sMsg := 'Já houve contabilização da Concessão do Contrato selecionado. '  + #13 +
                          'É necessário habilitar a integração contábil nos Parâmetros do ' +
                          'Sistema para permitir o estorno dos lançamentos anteriores e o ' +
                          'cancelamento da concessão.';

                  MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOK], 0);

                  Repaint;
                  Exit;
               end;  // if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1
            end;  // case PegaContabil (else)
         end;  // case PegaContabil

         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Acerta situação contratual do contrato anterior
         // ----------------------------------------------------------------------------------------
         //Inicio WO9439 Ferrari  (aqui deletar o evento 32 e deletar a suspensão de bloqueio)
         sSql:= ' DELETE FROM HISTEVENTOCOBEMPTMO WHERE IDTIPOEVENTOCOBEMPTMO = 32 ' + #13 +
                ' AND IDCONTRATOEMPTMO IN (SELECT IDCONTRATOEMPTMO FROM CONTRATOEMPTMO WHERE IDCONTRQUITACAO =' + sContrato + ')' ;
         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Text := sSql;;
         QryAux.ExecSQL;

         sSql:= ' DELETE FROM SUSPCONCESSAO where IDCONTRATOEMPTMO = ' + sContrato + ' AND IDMOTIVOSUSPCONCESSAO in(21,22)' ;
         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Text := sSql;;
         QryAux.ExecSQL;

         //Fim WO9439 Ferrari

         sSql:=
         'UPDATE '                              + #13 +
         '  CONTRATOEMPTMO '                    + #13 +
         'SET '                                 + #13 +
         '  FLGSITUACAO       = ''A'','         + #13 +

         //Pendência 22740 - 03/07/2006 - Alberto
         '  DATACANC          = NULL,'          + #13 +

         '  IDCONTRQUITACAO   = NULL '          + #13 +
         'WHERE '                               + #13 +
         '  IDCONTRQUITACAO   = ' + sContrato;

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSql;
         qryAux.ExecSQL;

         // ----------------------------------------------------------------------------------------

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := 15;
         rLogTotalPrev.IDContrato := StrToFloat(sContrato);
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := 16;
         rLogTotalPrev.Operacao   := 'Cancelamento de Concessão';
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         //Pendência 24899 - 26/03/2007 - Alberto
         CommitTransacao;

         // ----------------------------------------------------------------------------------------
         //    Cancelamento da Inscrição
         // ----------------------------------------------------------------------------------------
         //Ewerton Beltramini - SIG 122045/125356 - 17/05/2022 - Inicio...
         if chkInContratoAD.State = cbUnchecked then
         begin
               if MsgDlg('Deseja cancelar também a Inscrição do Empréstimo?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
               begin
                  sSql:=  'UPDATE ' + #13 + '  INSCRICAOEMPTMO ' + #13 + 'SET ' + #13 + '  FLGSITUACAO = ''C''' + #13 + 'WHERE ' + #13 +
                  '      ( IDINSCRICAOEMPTMO = ' + FormatFloat('#0', dtmEmptmo.qryDadosContratoIDINSCRICAOEMPTMO.AsFloat) + ' ) ';
               end
               else // if MsgDlg('Deseja cancelar também a Inscrição
               begin
                  sSql:=  'UPDATE ' + #13 + '  INSCRICAOEMPTMO ' + #13 +  'SET ' + #13 + '  FLGSITUACAO = ''A''' + #13 + 'WHERE '  + #13 +
                  '      ( IDINSCRICAOEMPTMO = ' + dtmEmptmo.qryDadosContratoIDINSCRICAOEMPTMO.AsString + ' ) ';
               end; // if MsgDlg('Deseja cancelar também a Inscrição
         end
         else if chkInContratoAD.State = cbChecked then
         begin
               if chkInscricaoEmp.State =  cbChecked then
               begin
                    sSql:=  'UPDATE ' + #13 + '  INSCRICAOEMPTMO ' + #13 + 'SET ' + #13 + '  FLGSITUACAO = ''C''' + #13 + 'WHERE ' + #13 +
                    '      ( IDINSCRICAOEMPTMO = ' + FormatFloat('#0', dtmEmptmo.qryDadosContratoIDINSCRICAOEMPTMO.AsFloat) + ' ) ';
               end
               else if chkInscricaoEmp.State =  cbChecked then
               begin
                  sSql:=  'UPDATE ' + #13 + '  INSCRICAOEMPTMO ' + #13 +  'SET ' + #13 + '  FLGSITUACAO = ''A''' + #13 + 'WHERE '  + #13 +
                  '      ( IDINSCRICAOEMPTMO = ' + dtmEmptmo.qryDadosContratoIDINSCRICAOEMPTMO.AsString + ' ) ';
               end;
         end;

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSql;
         qryAux.ExecSQL;
         //Ewerton Beltramini - SIG 122045/125356 - 17/05/2022 - Fim.
         // ----------------------------------------------------------------------------------------
         //    FIM Cancelamento da Inscrição
         // ----------------------------------------------------------------------------------------

         // Fiario
         if dtmEmptmo.qryParamEmptmoFLGUSAFIARIO.AsInteger = 1 then
         begin
            Fiario.IDPessoa      := dtmEmptmo.qryDadosContratoIDBENEF.AsInteger;
            Fiario.IDTitular     := dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger;
            Fiario.IDUsuario     := Sistema.IdUsuario;
            Fiario.IDModulo      := Sistema.IDModulo;
            Fiario.IDRubs        := 0;
            Fiario.IDGrupo       := 1;
            Fiario.DataInclusao  := SysDate;
            Fiario.Descricao     := 'Cancelamento de Concessão de Empréstimo';

            if not(Fiario.Inserir) then
            begin
               MsgDlg('ERRO ao incluir o Protocolo.', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;
         end;

         // ----------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Cancelamento da concessão do Contrato ' +
                                          FloatToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat))) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
            Repaint;
         end;
         // ----------------------------------------------------------------------------------------

         
         //MsgDlg('Processo finalizado.' + #13 + 'Concessão cancelada.', 'Empréstimo', mtInformation, [mbOk], 0);    //Ewerton Beltramini - 27/04/2022 - SIG122045 
         memArquivo.lines.Add(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString + ' - ' + 'Concessão cancelada.'); //Ewerton Beltramini - 27/04/2022 - SIG122045
         Repaint;

         Sel(-1);

      except
         RollBackTransacao;
         Raise;

         MsgDlg('Processo interrompido.' + #13 + 'Não foi possível cancelar esta concessão.',
                'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
      end;

   finally
      qryAux.Free;

      //Pendência 19929 - 26/06/2006 - Alberto Carvalho
      sErro.Free;
   end;

   QryContratosAD.next;

//Ewerton Beltramini - 27/04/2022 - SIG122045 - Inicio...
 until (QryContratosAD.Eof);

 MsgDlg('Processo finalizado.' + #13 + 'Concessão cancelada.', 'Empréstimo', mtInformation, [mbOk], 0);
 Repaint;
 Sel(-1);
 chkInContratoAD.State := cbUnchecked;
 chkInscricaoEmp.State := cbUnchecked;

//Ewerton Beltramini - 27/04/2022 - SIG122045 - Fim.

   if memErro.Count > 2 then MsgDlg(memErro.Text, 'Empréstimo', mtInformation, [mbOk], 0);

end;



procedure TfrmCancConcessao.FormShow(Sender: TObject);
begin
   inherited;

   memErro            := TStringList.Create;
   edtDataCanc.Date   := sysdate;

   ParametrosSistema;

   grpTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);
end;



function TfrmCancConcessao.PegaConcessao: Boolean;
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
end;



function TfrmCancConcessao.PegaContabil: Integer;
var
   sSql        : String;
   sContrato   : String;
begin
   Result      := 0;
   sContrato   := FloatTostr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat);

   //William Moreira da Silva - SOL 253185 PPM 771995 - Inicio
   sSql :=
   '               SELECT                                                             ' + #13 +
   '  H.IDHISTMOVEMPTMO,                                                              ' + #13 +
   '  H.IDCONTRATOEMPTMO,                                                             ' + #13 +
   '  H.IDITEMEMPTMO,                                                                 ' + #13 +
   '  ITE.ITEDESCRICAO,                                                               ' + #13 +
   '  H.VLRPREVISTO,                                                                  ' + #13 +
   '  H.VLREFETIVO,                                                                   ' + #13 +
   '  H.FORMACOBRANCA,                                                                ' + #13 +
   '  TC.IDTIPOCONTREMPTMO,                                                           ' + #13 +
   '  C.IDPLANOORIGEM,                                                                 ' + #13 +
   '  DECODE(C.IDPLANOORIGEM, NULL, C.IDPLANOPREV, C.IDPLANOORIGEM) AS IDPLANOPREV,   ' + #13 +
   '  C.IDPATRO,                                                                      ' + #13 +
   '  ITC.TIPCODIGO                                                                   ' + #13 +
   ' FROM HMECONCESSAO H                                                              ' + #13 +
   ' INNER JOIN CONTRATOEMPTMO C ON C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO           ' + #13 +
   ' INNER JOIN HMECONTABILIZACAO HC ON HC.IDHISTMOVEMPTMO = H.IDHISTMOVEMPTMO         ' + #13 +
   ' INNER JOIN TIPOCONTREMPTMO TC ON TC.IDTIPOCONTREMPTMO = C.IDTIPOCONTREMPTMO      ' + #13 +
   ' INNER JOIN TIPOEMPTMO TE ON TE.IDTIPOEMPTMO = TC.IDTIPOEMPTMO                    ' + #13 +
   ' INNER JOIN ITEMEMPTMO ITE ON ITE.IDITEMEMPTMO = H.IDITEMEMPTMO                    ' + #13 +
   ' INNER JOIN ITEMXTIPOCONTR  ITC ON ITC.IDITEMEMPTMO = H.IDITEMEMPTMO AND           ' + #13 +
   '                                 ITC.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO AND  ' + #13 +
   '                                 ITC.IDITEMEMPTMO = ITE.IDITEMEMPTMO               ' + #13 +
   ' WHERE H.IDCONTRATOEMPTMO = ' + sContrato                                  + #13 +
   '     AND H.FLGESTORNADO = 0                                                         ' + #13 +
   '     AND H.NATUREZAITEM < 2                                                        ' + #13 +
   '     AND HC.PLNCODIGO IS NOT NULL                                                   ' + #13 +
   '     AND TE.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa)               + #13 +
   ' UNION                                                                             ' + #13 +
   ' SELECT                                                                            ' + #13 +
   '   H.IDHISTMOVEMPTMO,                                                              ' + #13 +
   '  H.IDCONTRATOEMPTMO,                                                              ' + #13 +
   '  H.IDITEMEMPTMO,                                                                   ' + #13 +
   ' ITE.ITEDESCRICAO,                                                                 ' + #13 +
   '  H.VLRPREVISTO,                                                                   ' + #13 +
   ' H.VLREFETIVO,                                                                     ' + #13 +
   '  H.FORMACOBRANCA,                                                                 ' + #13 +
   '  TC.IDTIPOCONTREMPTMO,                                                            ' + #13 +
   '  C.IDPLANOORIGEM,                                                                 ' + #13 +
   '  DECODE(C.IDPLANOORIGEM, NULL, C.IDPLANOPREV, C.IDPLANOORIGEM) AS IDPLANOPREV,     ' + #13 +
   '  C.IDPATRO,                                                                       ' + #13 +
   '  ITC.TIPCODIGO                                                                    ' + #13 +
   ' FROM HMEQUITACAO H                                                                ' + #13 +
   ' INNER JOIN CONTRATOEMPTMO C ON C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO            ' + #13 +
   ' INNER JOIN HMECONTABILIZACAO HC ON HC.IDHISTMOVEMPTMO = H.IDHISTMOVEMPTMO         ' + #13 +
   ' INNER JOIN TIPOCONTREMPTMO TC ON TC.IDTIPOCONTREMPTMO = C.IDTIPOCONTREMPTMO       ' + #13 +
   ' INNER JOIN TIPOEMPTMO TE ON TE.IDTIPOEMPTMO = TC.IDTIPOEMPTMO                      ' + #13 +
   ' INNER JOIN ITEMEMPTMO ITE ON ITE.IDITEMEMPTMO = H.IDITEMEMPTMO                     ' + #13 +
   ' INNER JOIN ITEMXTIPOCONTR  ITC ON ITC.IDITEMEMPTMO = H.IDITEMEMPTMO AND            ' + #13 +
   '                                 ITC.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO AND    ' + #13 +
   '                                 ITC.IDITEMEMPTMO = ITE.IDITEMEMPTMo              ' + #13 +
   ' WHERE C.IDCONTRQUITACAO = ' + sContrato                          + #13 +
   '     AND H.FLGESTORNADO = 0                                                       ' + #13 +
   '     AND H.NATUREZAITEM < 2                                                        ' + #13 +
   '     AND HC.PLNCODIGO IS NOT NULL                                                 ' + #13 +
   '     AND TE.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa) + #13;
   //William Moreira da Silva - SOL 253185 PPM 771995 - Fim

   try
      qryDesContabiliza.Close;
      qryDesContabiliza.SQL.Clear;
      qryDesContabiliza.SQL.Text := sSql;
      qryDesContabiliza.Open;

      if qryDesContabiliza.IsEmpty then Result := 1;

   except
      Result := 2
   end;
end;



procedure TfrmCancConcessao.FormCreate(Sender: TObject);
begin
   inherited;

   sFiltroContEmp := dtmMS.MS_ContratoEmptmo.Filtro.Text;

   // Faz o MontaSelect mostrar somente os Contratos que estao ativos ou pendentes
   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO IN (''A'', ''P'') ');
end;



procedure TfrmCancConcessao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmMS.MS_ContratoEmptmo.Filtro.Clear;
   UFuncoesEmptmo.bBuscaMutuario := false;
   dtmMS.MS_ContratoEmptmo.Filtro.Text    := sFiltroContEmp;

   dtmEmptmo.qryDadosContrato.Close;

   inherited;
end;



procedure TfrmCancConcessao.ExcFolha;
begin
   qryHistoricoMov.First;

   (* Exclui Folha verificando se é folha         *)
   (* Verica se o historico ja foi enviado folha  *)
   while not(qryHistoricoMov.EOF) do
   begin
      if ( (qryHistoricoMovHMEFORMACOBRANCA.AsString = 'F') and (qryHistoricoMovFLGENVIO.IsNull) ) then
      begin
         IntegraEmptmo.ExcluiTMPDESCPorMes(qryHistoricoMovIDCONTRATOEMPTMO.AsFloat, -1,
                                           qryHistoricoMovHMEANOCOBRANCA.AsString + '/' +
                                           FormatFloat('00', qryHistoricoMovHMEMESCOBRANCA.AsInteger),
                                           False
                                          );
      end;
      qryHistoricoMov.Next;
   end;
end;



function TfrmCancConcessao.ExisteItemGerado(bAtuDia: Boolean): Boolean;
begin
   try
      with qryItemGerado do
      begin
         LimpaParametros(qryItemGerado);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat           := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         if bAtuDia then ParamByName('PATUDIA').AsInteger   := 1;
         Open;

         Result := not(isEmpty);
      end;
   finally
      qryItemGerado.Close;
   end;
end;


procedure TfrmCancConcessao.chkInContratoADClick(Sender: TObject);
begin
  inherited;
      if chkInContratoAD.State = cbChecked then
         chkInscricaoEmp.Enabled := true
      else
      begin
          chkInscricaoEmp.Enabled := false;
          chkInscricaoEmp.State := cbUnchecked;
      end;
end;

end.
