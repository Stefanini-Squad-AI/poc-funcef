{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Data      : 04/11/2022
Autor     : Luis Ferrari
SIG       : 130214
Descrição : trava para exclusão de lançamentos em que a contabilidade já esteja fechada. CmeCadastroDelete
--------------------------------------------------------------------------------------------------
Data      : 17/07/2019
Autor     : Taffarel Sevaybriker
SIG       : 87681
Descrição : Verificação para não atualizar saldo em dias com contabilidade bloqueada.
--------------------------------------------------------------------------------------------------
Data      : 12/12/2011
Autor     : Otacilio Aquino
Pendencia : SOL 167585 Kintana 1471765
Descrição : Atualizar o Valor Efetivo e Data Efetiva quando alterados a Data
            Prevista e Valor Previsto ** Alteração no componente upd ** .
--------------------------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
Data      : 13/03/2009
Autor     : Daniel Begnami
Pendencia : SOL 109599
Descrição : Passando True para a funcao AcertaSituacaoContratual para nao gravar o campo DATACANC
            da tabela CONTRATOEMPTMO.
--------------------------------------------------------------------------------------------------
Rotina..........: AbreQueriesHistorico
N. Sol..........: 36024 (BACKLOG)
N. Kintana......: 523138
Data............: 16/04/2009
Responsável.....: Renato Visoni
Descrição.......: Não deixar enviar itens em aberto (FLGENVIO = null), retirei esse tratamento da
qryHistMov, pois ele transformava todos os itens como não enviado (flgenvio=1).
NVL(HME.FLGENVIO, 1)          AS FLGENVIO
----------------------------------------------------------------------------------------------------
Pendência   : 26144
Responsável : Marchetti
Data        : 18/02/2008
Descrição   : Ajustes na pendencia conforme solicitação da FUNCEF
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : CmeCadastroConfirma(...), CmeCadastroDelete(...)
Data      : 07/01/2008 e 08/01/2008
Autor     : André Pontes
Pendência : 26481
Descrição : Ajuste no disparo da atualização diária após inclusão e exclusão de
            uma entrada manual, para garantir que não sobrem itens posteriores
            que deveriam ser estornados.
--------------------------------------------------------------------------------
Rotina    : CmeCadastroConfirma
Data      : 20/08/2007
Autor     : Marchetti
Pendência : 26144
Descrição : testa se está em modo de inserção para ajustar alguns campos
--------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 09/04/2007
Autor     : Marchetti
Pendência : 22159
Descrição : Somente para a FUNCEF - Se for devolução, não permite envio
            diferente de financeiro.
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 06/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecEntradaManual;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
   DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, mContratoEmptmo, DBCtrls,
   wwdbedit, wwdbdatetimepicker, CMDateTimePicker, Mask, Wwdbspin, wwdblook,
   {$IFNDEF VER0505} uCMTypes, {$ENDIF}
   uDiasUteis, ComCtrls,
   uCtrlContab, uCtrlPadroes;

type
   TfrmExecEntradaManual = class(TfrmCadastroCSImob)
      molContratoEmptmo: TmolContratoEmptmo;
      rdgTipo: TRadioGroup;
      rdgEvento: TRadioGroup;
      Label1: TLabel;
      DBcboItem: TwwDBLookupCombo;
      dbsParcela: TwwDBSpinEdit;
      Label5: TLabel;
      DBedtDataPrevista: TCMDateTimePicker;
      Label12: TLabel;
      dbeValorPrevisto: TwwDBEdit;
      Label7: TLabel;
      CMDateTimePicker1: TCMDateTimePicker;
      Label14: TLabel;
      dbsSeq: TwwDBSpinEdit;
      DBrdgFormaCobranca: TDBRadioGroup;
      qryLookItem: TwwQuery;
      qryLookItemIDITEMEMPTMO: TFloatField;
      qryLookItemITEDESCRICAO: TStringField;
      qryLookItemFLGDESTACADO: TFloatField;
      qryLookItemFLGCENTRALIZA: TFloatField;
      qryIDHISTMOVEMPTMO: TFloatField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDITEMEMPTMO: TFloatField;
      qryHMEPARCELA: TFloatField;
      qryHMETIPOMOV: TFloatField;
      qryHMEORIGEM: TFloatField;
      qryHMEFORMACOBRANCA: TStringField;
      qryHMESEQCOBRANCA: TFloatField;
      qryHMEDATA: TDateTimeField;
      qryHMEDATAPREVISTA: TDateTimeField;
      qryHMEDATAATUALIZA: TDateTimeField;
      qryHMEANOCOMPETENCIA: TFloatField;
      qryHMEMESCOMPETENCIA: TFloatField;
      qryHMEANOCOBRANCA: TFloatField;
      qryHMEMESCOBRANCA: TFloatField;
      qryHMEVLRPREVISTO: TFloatField;
      qryHMECENTRALIZA: TFloatField;
      qryHMEDESTACADO: TFloatField;
      qryHMESALDODEV: TFloatField;
      qryHMENUMPARCELAS: TFloatField;
      qryHMEDATAVENCTO: TDateTimeField;
      qryHMETIPOFOLHA: TStringField;
      qryHMERECPAG: TStringField;
      qryFLGBAIXADO: TFloatField;
      qryFLGENVIO: TFloatField;
      qryVERSAO: TStringField;
      Label2: TLabel;
      wwDBSpinEdit1: TwwDBSpinEdit;
      Label3: TLabel;
      qryFLGENTRADAMANUAL: TFloatField;
      qryLookItemITCTRATASALDODEV: TFloatField;
      qryHMEOBSERVACAO: TMemoField;
      DBmemObs: TDBRichEdit;
      Label4: TLabel;
      qryHMEVLREFETIVO: TFloatField;
      qryHMEDATAEFETIVA: TDateTimeField;
      qryHMETXJUROS: TFloatField;
      DBspnParcelaAlt: TwwDBSpinEdit;
      lblParcelaAlt: TLabel;
      qryHMEPARCELAALT: TFloatField;
      wwDBEdit1: TwwDBEdit;
      Label6: TLabel;

      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure rdgEventoClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure DBedtDataPrevistaExit(Sender: TObject);
      procedure DBedtDataPrevistaEnter(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgTipoClick(Sender: TObject);


   private  // Private declarations

      Contab   : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      dDataAnt : TDateTime;
      bStatusFormaCob : Boolean;

      procedure Sel(i: Extended);
      procedure AbreItens;
      function  VerificaPreenchimento: boolean;


   public   // Public declarations

   end;



var
  frmExecEntradaManual: TfrmExecEntradaManual;



implementation
{$R *.DFM}
uses
   dEmptmo, dBaseDados, UFuncoesEmptmo, UDataBase, dLookEmptmo, uIntegraEmptmo, uCalcEmptmo,
   uSistema, uVerificaPreenchimento, uMensErro, dAtualizacaoDiaria, dCalcEmptmo, uTypesEmptmo,
   uLancContab;




procedure TfrmExecEntradaManual.AbreItens;
begin
   with qryLookItem do
   begin
      LimpaParametros(qryLookItem);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := molContratoEmptmo.IDContrato;

      case rdgEvento.ItemIndex of
         0:    ParamByName('PITCEVENTO').AsInteger := 1;
         1:    ParamByName('PITCEVENTO').AsInteger := 4;
         2:    ParamByName('PITCEVENTO').AsInteger := 7;
         3, 4: ParamByName('PITCEVENTO').AsInteger := 8;
      end;

      case rdgEvento.ItemIndex of
         3: ParamByName('FLGSALDODEV').AsInteger   := 1;
         4: ParamByName('FLGSALDODEV').AsInteger   := 2;
      end;

      Open;
   end;
end;



function TfrmExecEntradaManual.VerificaPreenchimento: boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // Pendencia 26144 - 18/02/2008
      // if molContratoEmptmo.IDContrato <= 0 then
      if Length(Trim(molContratoEmptmo.edtIDContrato.Text)) <= 0 then
      // Fim Pendencia 26144 - 18/02/2008
         raise EValidacao.CreateVal('É necessário indicar o Contrato!', molContratoEmptmo.btnBuscaContrato);

      if DBcboItem.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Item!', DBcboItem);

      if qryHMEFORMACOBRANCA.IsNull then
         raise EValidacao.CreateVal('É necessário indicar a Forma de Cobrança!', DBrdgFormaCobranca);

      // Marchetti - Pendencia 22159
      if (Sistema.TipoCliente = 19991) then
      begin
         if (rdgTipo.ItemIndex = 1) and (qryHMEFORMACOBRANCA.AsString <> 'C') then
            raise EValidacao.CreateVal('Forma de Cobrança de Devolução só pode ser Financeiro!', DBrdgFormaCobranca);
      end;
      // Fim Marchetti - Pendencia 22159

      // André Pontes - 03/06/2005 - pendência 19404
      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', DBedtDataPrevista.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', DBedtDataPrevista);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', DBedtDataPrevista);
         end;
      end;
      // FIM André Pontes - 03/06/2005 - pendência 19404

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



procedure TfrmExecEntradaManual.Sel(i: Extended);
begin
   // abre a query principal com os parâmetros passados
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDHISTMOVEMPTMO').AsFloat := i;
      Open;
   end;
end;



procedure TfrmExecEntradaManual.CmeCadastroConfirma(Sender: TObject);
var
   fSaldoDevAnt : Currency;
   dDataAtuDia  : TDateTime;
   dDataPrevista  : TDateTime;
   rSaldoDev    : TSaldoDevAnt;
begin
   if (qry.State = dsInsert) or (CmeCadastro.Operacao = opInserir) then
   begin
      dtmEmptmo.qrySeqHistMov.Open;
      qryIDHISTMOVEMPTMO.AsFloat := dtmEmptmo.qrySeqHistMovSEQHISTMOVEMPTMO.AsFloat;
      dtmEmptmo.qrySeqHistMov.Close;
   end;

   qryIDCONTRATOEMPTMO.AsFloat := molContratoEmptmo.IDContrato;

   if qryHMEFORMACOBRANCA.AsString = 'F' then
   begin
      qryHMETIPOFOLHA.AsString := 'P';
   end
   else
   begin
      qryHMETIPOFOLHA.Clear;
   end;

   case rdgEvento.ItemIndex of
      0: qryHMETIPOMOV.AsInteger := 1;
      1: qryHMETIPOMOV.AsInteger := 4;
      2: qryHMETIPOMOV.AsInteger := 7;
      3: qryHMETIPOMOV.AsInteger := 8;
      4: qryHMETIPOMOV.AsInteger := 8;
   end;

   qryHMEORIGEM.AsInteger           := 12;

   qryHMEANOCOMPETENCIA.AsInteger   := StrToInt(FormatDateTime('yyyy', qryHMEDATAPREVISTA.AsDateTime)); // DiasUteis.ExtraiAno(qryHMEDATAPREVISTA.AsDateTime);
   qryHMEMESCOMPETENCIA.AsInteger   := StrToInt(FormatDateTime('mm', qryHMEDATAPREVISTA.AsDateTime));   // DiasUteis.ExtraiMes(qryHMEDATAPREVISTA.AsDateTime);

   qryHMEANOCOBRANCA.AsInteger      := StrToInt(FormatDateTime('yyyy', qryHMEDATAVENCTO.AsDateTime));   // DiasUteis.ExtraiAno(qryHMEDATAVENCTO.AsDateTime);
   qryHMEMESCOBRANCA.AsInteger      := StrToInt(FormatDateTime('mm', qryHMEDATAVENCTO.AsDateTime));     // DiasUteis.ExtraiMes(qryHMEDATAVENCTO.AsDateTime);

   qryHMEDATA.AsDateTime            := sysdate;
   qryHMEDATAATUALIZA.AsDateTime    := qryHMEDATAPREVISTA.AsDateTime;
   qryHMECENTRALIZA.AsInteger       := qryLookItemFLGCENTRALIZA.AsInteger;
   qryHMEDESTACADO.AsInteger        := qryLookItemFLGDESTACADO.AsInteger;

   qryFLGENTRADAMANUAL.AsInteger    := 1;

   qryVERSAO.AsString               := Sistema.Versao;

   // ----------------------------------------------------------------------------------------------

   case rdgTipo.ItemIndex of
      0: qryHMERECPAG.AsString      := 'R';
      1: qryHMERECPAG.AsString      := 'P';
   end;

   case rdgEvento.ItemIndex of
      3: qryHMERECPAG.AsString      := 'R';
      4: qryHMERECPAG.AsString      := 'P';
   end;


   // Marchetti - Pendencia 26144
   // Somente faz as linhas abaixo se for inserção
   if (qry.State = dsInsert) or (CmeCadastro.Operacao = opInserir) then
   begin

      if (rdgTipo.ItemIndex = 1) and (rdgEvento.ItemIndex <> 3) and (rdgEvento.ItemIndex <> 4) then
      begin
         qryHMEVLRPREVISTO.AsCurrency  := qryHMEVLRPREVISTO.AsCurrency * (-1);
      end;

      // ----------------------------------------------------------------------------------------------

      if (rdgEvento.ItemIndex = 3) or (rdgEvento.ItemIndex = 4) then
      begin
         qryFLGENVIO.Clear;
         qryFLGBAIXADO.Clear;
         qryHMEVLREFETIVO.AsCurrency   := qryHMEVLRPREVISTO.AsCurrency;
         qryHMEDATAEFETIVA.AsDateTime  := qryHMEDATAPREVISTA.AsDateTime;
      end
      else
      begin
         qryFLGENVIO.AsInteger         := 0;
         qryFLGBAIXADO.AsInteger       := 0;
         qryHMEVLREFETIVO.Clear;
         qryHMEDATAEFETIVA.Clear;
      end;

   end;
   // Fim Marchetti - Pendencia 26144

   // ----------------------------------------------------------------------------------------------

   // André Pontes - pendência 26481 - 08/01/2007
   dDataPrevista := qryHMEDATAPREVISTA.AsDateTime;

   // ----------------------------------------------------------------------------------------------

   // Roda atualização diária até a data da entrada manual (se for necessário...)

   if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) and
      ((rdgEvento.ItemIndex = 3) or (rdgEvento.ItemIndex = 4)) then
   begin
      dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(molContratoEmptmo.IDContrato, dDataPrevista);

      //SIG87681 - início
      if not(Contab.TestaDataBloqueadaProc(Sistema.idEmpresa, 15, DateToStr(dDataAtuDia))) then
         dDataAtuDia := Contab.DataBloqueio;
      //SIG87681 - fim

      if dDataAtuDia < qryHMEDATAPREVISTA.AsDateTime then
      begin
         //Pendência 23584 - 30/01/2007 - Marchetti
         with dtmAtualizacaoDiaria.spAtualizaDiaria do
         begin
            ParamByName('iContrato').AsFloat          := molContratoEmptmo.IDContrato;
            ParamByName('iTipoEmptmo').AsFloat        := -1;
            ParamByName('iTipoContrato').AsFloat      := -1;
            ParamByName('iPatro').AsFloat             := -1;
            ParamByName('iPlano').AsFloat             := -1;
            ParamByName('bEstorna').AsFloat           := 1;
            ParamByName('iCalculaProv').AsFloat       := 1;
            ParamByName('bAtualizaSaldo').AsFloat     := 1;
            ParamByName('bInArquivo').AsFloat         := -1;
            ParamByName('bNotInArquivo').AsFloat      := -1;

            ParamByName('dDataConsidera').AsDate      := dDataAtuDia;
            ParamByName('dDataInicial').AsDate        := dDataAtuDia + 1;
            ParamByName('dDataFinal').AsDate          := DBedtDataPrevista.Date;
            ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

            if not(Prepared) then Prepare;
            ExecProc;
         end;

         //Fim Pendência 23584
      end;  // if dDataAtuDia < qryHMEDATAPREVISTA.AsDateTime
   end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

   // ----------------------------------------------------------------------------------------------

   rSaldoDev := CalcEmptmo.SaldoDevAnt(molContratoEmptmo.IDContrato, dDataPrevista, -1, -1);

   if qryHMETXJUROS.AsCurrency <= 0 then qryHMETXJUROS.AsCurrency := rSaldoDev.fTxJurosAnt;

   // ----------------------------------------------------------------------------------------------

   case qryLookItemITCTRATASALDODEV.AsInteger of
      0 : qryHMESALDODEV.AsCurrency := rSaldoDev.fSaldoDevAnt;
      1 : qryHMESALDODEV.AsCurrency := rSaldoDev.fSaldoDevAnt - qryHMEVLRPREVISTO.AsCurrency;
      2 : qryHMESALDODEV.AsCurrency := rSaldoDev.fSaldoDevAnt + qryHMEVLRPREVISTO.AsCurrency;
   end;

   inherited;

   //Pendência 23584 - 30/01/2007 - Alberto
   AplicaAlteracoes([qry]);

   // ----------------------------------------------------------------------------------------------

   // André Pontes - pendência 26481 - 08/01/2008
   // Acerta o saldo do contrato (para corrigir em caso de mais de uma entrada manual no mesmo dia,
   // situação em que o cálculo do saldo acima é simplista demais)

   //Pendência 27425 - 15/02/2008
   if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) then
   begin
      dtmAtualizacaoDiaria.ExecutaAjusteSaldo(molContratoEmptmo.IDContrato,
                                              dDataPrevista - 1,
                                              -1 // O saldo deve ser buscado
                                             );
   end;
   //Fim Pendência 27425

   // ----------------------------------------------------------------------------------------------

   // Roda atualização diária da data da entrada manual até a última data com lançamento

   dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(molContratoEmptmo.IDContrato, -1);

   if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) and
      ((rdgEvento.ItemIndex = 3) or (rdgEvento.ItemIndex = 4)) then
   begin
      //Pendência 23584 - 30/01/2007 - Marchetti
      with dtmAtualizacaoDiaria.spAtualizaDiaria do
      begin
         ParamByName('iContrato').AsFloat          := molContratoEmptmo.IDContrato;
         ParamByName('iTipoEmptmo').AsFloat        := -1;
         ParamByName('iTipoContrato').AsFloat      := -1;
         ParamByName('iPatro').AsFloat             := -1;
         ParamByName('iPlano').AsFloat             := -1;
         ParamByName('bEstorna').AsFloat           := 1;
         ParamByName('iCalculaProv').AsFloat       := 1;
         ParamByName('bAtualizaSaldo').AsFloat  := 1;
         ParamByName('bInArquivo').AsFloat      := -1;
         ParamByName('bNotInArquivo').AsFloat   := -1;
         ParamByName('dDataConsidera').AsDate      := dDataPrevista;
         ParamByName('dDataInicial').AsDate        := dDataPrevista + 1;
         ParamByName('dDataFinal').AsDate          := dDataAtuDia;
         ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

         if not(Prepared) then Prepare;
         ExecProc;
      end;

      dtmAtualizacaoDiaria.ExecutaAjusteSaldo(qryIDCONTRATOEMPTMO.AsFloat,
                                              dDataPrevista - 1,
                                              -1 // O saldo deve ser buscado
                                             );

   end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
   // ----------------------------------------------------------------------------------------------

   // André Pontes - pendência 26481 - 08/01/2008
   // Se, após todo o processo, o saldo do dia ficar ZERO, estorna a atualização diária posterior

   rSaldoDev := CalcEmptmo.SaldoDevAnt(molContratoEmptmo.IDContrato, dDataPrevista, -1, -1);

   if rSaldoDev.fSaldoDevAnt = 0 then
   begin
     with dtmAtualizacaoDiaria.spUpdateEstornado do
     begin
        ParamByName('IIDCONTRATOEMPTMO').AsFloat  := molContratoEmptmo.IDContrato;
        ParamByName('DDATAINI').AsDateTime        := dDataPrevista + 1;
        ParamByName('DDATAFIM').AsDateTime        := dDataPrevista + 180;
        ParamByName('IHMETIPOMOV').AsFloat        := 5;
        if not(Prepared) then Prepare;
        ExecProc;
     end;
   end;

   // ----------------------------------------------------------------------------------------------
   CalcEmptmo.AcertaSituacaoContratual(qryIDCONTRATOEMPTMO.AsFloat, 15, true); // SOL 109599 Daniel Begnami
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecEntradaManual.CmeCadastroFind(Sender: TObject);
var
iIdBenef : integer;
begin
   inherited;
   // Marchetti - Pendencia 26144 - 18/02/2008
   AbreItens;
   // Fim Marchetti - Pendencia 26144 - 18/02/2008

   if MontaSelect.RetornouValor then
   begin
      LimpaParametros(qry);
      qry.ParamByName('PIDHISTMOVEMPTMO').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
      qry.Open;

      iIdBenef   := StrToInt(MontaSelect.ValoresChave[8]);
      UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);


      molContratoEmptmo.edtIDContrato.Text   := MontaSelect.ValoresChave[1];
      molContratoEmptmo.edtMatricula.Text    := MontaSelect.ValoresChave[2];
      molContratoEmptmo.edtNome.Text         := MontaSelect.ValoresChave[7];

      DBcboItem.Text                         := MontaSelect.ValoresChave[6];
   end;
end;



procedure TfrmExecEntradaManual.CmeCadastroInsert(Sender: TObject);
begin
   Sel(-1);

   if molContratoEmptmo.CanFocus then molContratoEmptmo.SetFocus;

   AbreItens;

   inherited;

   qryHMEFORMACOBRANCA.AsString := 'C';
end;



procedure TfrmExecEntradaManual.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   
   if UFuncoesEmptmo.bBuscaMutuario then
      begin                          
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;


   Accept := VerificaPreenchimento;
end;



procedure TfrmExecEntradaManual.rdgEventoClick(Sender: TObject);
begin
   inherited;
   AbreItens;
end;



procedure TfrmExecEntradaManual.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnBuscaContratoClick(Sender);

   AbreItens;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      if qry.State = dsInsert then
      begin
         qryHMEFORMACOBRANCA.AsString := 'C';
      end;
   end;
end;



procedure TfrmExecEntradaManual.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmExecEntradaManual.FormShow(Sender: TObject);
begin
   inherited;
   ParametrosSistema;

   DBspnParcelaAlt.Visible := dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1;
   lblParcelaAlt.Visible   := dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1;
   bStatusFormaCob         := DBrdgFormaCobranca.Enabled;
end;



procedure TfrmExecEntradaManual.CmeCadastroDelete(Sender: TObject);
var
   qryAux         : TwwQuery;
   sSQL           : String;
   sDataCanc      : String;
   dDataCanc      : TDateTime;
   dDataAtuDia    : TDateTime;
   rSaldoDev      : TSaldoDevAnt;
   rLogTotalPrev  : TLogTotalPrev;
// SIG 130214 Ferrari
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
// FIM   
begin
   // inherited;

   //Renato Visoni SOL 36024 Kintana 523138
   if qry.FieldByname('FlgEnvio').isNUll then begin
     MsgDlg('Esse item não pode ser excluido.','Aviso',mtwarning,[mbok],0);
     Exit;
   end;
   //Renato Visoni SOL 36024 Kintana 523138
// Inicio SIG 130214   Ferrari
   if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
   begin
      // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
      // estorno na data de cancelamento indicada
      sDataLanc   := FormatDateTime('dd/mm/yyyy', DBedtDataPrevista.Date);
      iEmpresa    := Sistema.idEmpresa;
      sMsgContab  := '';

      if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
        Begin
        MsgDlg('Não é possível Excluir lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"' ,'Aviso',mtwarning,[mbok],0);
        Exit;

        end;

   end;
// Fim Sig 130214

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      try
         // A exclusao de uma entrada manual é, na realidade, o estorno do valor.
         // Dessa forma, basta marcar o item como "estornado" e atualizar o saldo de acordo.

         // ----------------------------------------------------------------------------------------

         dDataCanc   := qryHMEDATAPREVISTA.AsDateTime;

         rSaldoDev   := CalcEmptmo.SaldoDevAnt(molContratoEmptmo.IDContrato,
                                               dDataCanc,
                                               -1,
                                               -1
                                              );

         sDataCanc   := FormatDateTime('dd/mm/yyyy', dDataCanc);

         // ----------------------------------------------------------------------------------------------

         sSql:=
         'UPDATE '                                                                     + #13 +
         '   HISTMOVEMPTMO '                                                           + #13 +
         'SET '                                                                        + #13 +
         '   FLGESTORNADO        = 1, '                                                + #13 +
         '   HMEDATAESTORNO      = HMEDATAPREVISTA, '                                  + #13 +
         '   HMEDATAESTORNOALT   = SYSDATE, '                                          + #13 +
         '   IDUSUARIOESTORNO    = ' + IntToStr(Sistema.IDUsuario)                     + #13 +
         'WHERE '                                                                      + #13 +
         '      IDHISTMOVEMPTMO  = ' + FormatFloat('#0', qryIDHISTMOVEMPTMO.AsFloat)   + #13 +
         '  AND IDCONTRATOEMPTMO = ' + FormatFloat('#0', qryIDCONTRATOEMPTMO.AsFloat);

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSql;
         qryAux.ExecSQL;

         // ----------------------------------------------------------------------------------------------

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := 15;
         rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
         rLogTotalPrev.IDHistMov  := qryIDHISTMOVEMPTMO.AsFloat;
         rLogTotalPrev.Origem     := 12;
         rLogTotalPrev.Operacao   := 'Cancelamento de Entrada Manual';
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------------

         dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(qryIDCONTRATOEMPTMO.AsFloat, -1);

         if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) then
            // André Pontes - pendência 26481 - 08/01/2008 - retirada abaixo
            // and ((rdgEvento.ItemIndex = 3) or (rdgEvento.ItemIndex = 4))
         begin
            //Pendência 23584 - 30/01/2007 - Marchetti
            with dtmAtualizacaoDiaria.spAtualizaDiaria do
            begin
               ParamByName('iContrato').AsFloat          := qryIDCONTRATOEMPTMO.AsFloat; // André Pontes - pendência 26481 - 08/01/2008
               ParamByName('iTipoEmptmo').AsFloat        := -1;
               ParamByName('iTipoContrato').AsFloat      := -1;
               ParamByName('iPatro').AsFloat             := -1;
               ParamByName('iPlano').AsFloat             := -1;
               ParamByName('bEstorna').AsFloat           := 1;
               ParamByName('iCalculaProv').AsFloat       := 1;
               ParamByName('bAtualizaSaldo').AsFloat  := 1;
               ParamByName('bInArquivo').AsFloat      := -1;
               ParamByName('bNotInArquivo').AsFloat   := -1;

               ParamByName('dDataConsidera').AsDate      := dDataCanc - 1;
               ParamByName('dDataInicial').AsDate        := dDataCanc;
               ParamByName('dDataFinal').AsDate          := dDataAtuDia;
               ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

               if not(Prepared) then Prepare;
               ExecProc;
            end;
            //Fim Pendência 23584
         end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1

         // ----------------------------------------------------------------------------------------------

      except
         Showmessage('Erro');
         Repaint;
      end;

   finally
      qry.Close;
      qryAux.Free;
   end;
end;



procedure TfrmExecEntradaManual.DBedtDataPrevistaExit(Sender: TObject);
var
   rSaldo : TSaldoDevAnt;
begin
   inherited;

   // ----------------------------------------------------------------------------------------------
   if (length(trim(DBedtDataPrevista.Text)) > 0) and (DBedtDataPrevista.Date <> dDataAnt) then
   begin
      rSaldo := CalcEmptmo.SaldoDevAnt(molContratoEmptmo.IDContrato,
                                       DBedtDataPrevista.Date,
                                       -1,
                                       -1,
                                       True
                                      );

      if qry.State = dsInsert then
      begin
         qryHMEPARCELAALT.AsInteger     := rSaldo.iParcelaAltAnt;
         qryHMEPARCELA.AsInteger        := rSaldo.iParcelaAnt;
         qryHMENUMPARCELAS.AsInteger    := rSaldo.iParcRestaAnt;
         qryHMETXJUROS.AsFloat          := rSaldo.fTxJurosAnt;
      end;
   end;

   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecEntradaManual.DBedtDataPrevistaEnter(Sender: TObject);
begin
   inherited;

   dDataAnt := DBedtDataPrevista.Date;
end;



procedure TfrmExecEntradaManual.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404
end;



procedure TfrmExecEntradaManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   UFuncoesEmptmo.bBuscaMutuario := false;
   inherited;
end;



procedure TfrmExecEntradaManual.rdgTipoClick(Sender: TObject);
begin
   inherited;
   if qry.State in dsEditModes then
   begin
      if rdgTipo.ItemIndex = 1 then
      begin
         qryHMEFORMACOBRANCA.AsString := 'C';
         DBrdgFormaCobranca.Enabled := bStatusFormaCob;
      end;
      if rdgTipo.ItemIndex = 0 then
      begin
         DBrdgFormaCobranca.Enabled := True;
      end;
   end;
end;



end.
