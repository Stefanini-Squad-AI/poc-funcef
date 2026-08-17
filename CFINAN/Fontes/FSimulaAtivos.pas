{-------------------------------------------------------------------------------
Desenvolvedor: Marcus Oliveira
Data         : 31/01/2007
Pendência    : 24363
Descrição    : Removido o owner CM. 
-------------------------------------------------------------------------------}
unit FSimulaAtivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Db, DBTables, Wwquery, ComCtrls, Wwdatsrc,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmSimulaAtivos = class(TfrmSairAjuda)
    dbData: TGroupBox;
    deDataSimIni: TCMDateTimePicker;
    bbtnCalcula: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryAux: TwwQuery;
    prgBarAtuFluxo: TProgressBar;
    qryFluxoOrc: TwwQuery;
    deDataSimFim: TCMDateTimePicker;
    qryTipoAplic: TwwQuery;
    qryFluxoOrcMOEDACOTA: TFloatField;
    qryFluxoOrcAPLICRESGATEJUROS: TStringField;
    qryFluxoOrcVALOR: TFloatField;
    qryFluxoOrcCONTAAPLICACAO: TFloatField;
    qryFluxoOrcPRAZORESGATE: TFloatField;
    qryFluxoOrcJUROSPREVISTOS: TFloatField;
    qryFluxoOrcDATAPREVRESGATE: TDateTimeField;
    qryFluxoOrcDATALANCAMENTO: TDateTimeField;
    qryFluxoOrcNUMCOTAS: TFloatField;
    qryFluxoOrcVLRRESGPREV: TFloatField;
    qryFluxoOrcTIPOAPLICACAO: TFloatField;
    qryTipoAplicIDEMPRESA: TFloatField;
    qryTipoAplicCODCENTROCUSTO: TStringField;
    qryTipoAplicCODTIPRECDES: TStringField;
    qryTipoAplicRECPAG: TStringField;
    qryTipoAplicCODCENTRORESPON: TStringField;
    qryTipoAplicUNIDNEGOC: TFloatField;
    qryTipoAplicMOECODIGOD: TFloatField;
    qryTipoAplicPRAZORESGATEPREVD: TFloatField;
    qryTipoAplicTXJUROSPREVD: TFloatField;
    qryTipoAplicIDEMPRESAD: TFloatField;
    qryTipoAplicCODCENTROCUSTOD: TStringField;
    qryTipoAplicCODTIPRECDESD: TStringField;
    qryTipoAplicRECPAGD: TStringField;
    qryTipoAplicCODCENTRORESPOND: TStringField;
    qryTipoAplicUNIDNEGOCD: TFloatField;
    qryParametro: TwwQuery;
    qryParametroIDEMPRESA: TFloatField;
    qryParametroCODCENTROCUSTO: TStringField;
    qryParametroCODTIPRECDES: TStringField;
    qryParametroRECPAG: TStringField;
    qryParametroCODCENTRORESPON: TStringField;
    qryParametroUNIDNEGOC: TFloatField;
    qryCalcSaldoCaixa: TwwQuery;
    qryCalcSaldoCaixaSALDO: TFloatField;
    qryLancConta: TwwQuery;
    lblMensagem: TLabel;
    qryFluxoOrcCODLANCAPLIC: TFloatField;
    qryLancContaMOEDACOTA: TFloatField;
    qryLancContaAPLICRESGATEJUROS: TStringField;
    qryLancContaVALOR: TFloatField;
    qryLancContaCONTAAPLICACAO: TFloatField;
    qryLancContaPRAZORESGATE: TFloatField;
    qryLancContaJUROSPREVISTOS: TFloatField;
    qryLancContaDATAPREVRESGATE: TDateTimeField;
    qryLancContaDATALANCAMENTO: TDateTimeField;
    qryLancContaNUMCOTAS: TFloatField;
    qryLancContaVLRRESGPREV: TFloatField;
    qryLancContaTIPOAPLICACAO: TFloatField;
    qryLancContaCODLANCAPLIC: TFloatField;
    qryLancSimulAtivo: TwwQuery;
    qryLancSimulAtivoIDLANCSIMULAATIVO: TFloatField;
    qryLancSimulAtivoTIPOAPLICACAO: TFloatField;
    qryLancSimulAtivoDATALANC: TDateTimeField;
    qryLancSimulAtivoDATAPREVRESGATE: TDateTimeField;
    qryLancSimulAtivoFLGTIPOLANC: TStringField;
    qryLancSimulAtivoVLRAPLICRESG: TFloatField;
    qryLancSimulAtivoVLRRECEITA: TFloatField;
    qryLancSimulAtivoVLRDESPESA: TFloatField;
    qryTipoAplicFLGREAPLICA: TStringField;
    qryTipoAplicTIPOAPLICSUBST: TFloatField;
    qryFluxoOrcSALDOVALOR: TFloatField;
    qryFluxoOrcPERCUSTO: TFloatField;
    qryFluxoOrcPERCUSTOREND: TFloatField;
    qryParametroTIPOAPLICACAO: TFloatField;
    qryTipoAplicTIPOAPLICACAO: TFloatField;
    qryTipoAplicDESCRICAO: TStringField;
    qryTipoAplicFIXAVARIAVEL: TStringField;
    qryTipoAplicTIPORESGATE: TStringField;
    qryTipoAplicTRGDTINCLUSAO: TDateTimeField;
    qryTipoAplicTRGUSERINCLUSAO: TStringField;
    qryTipoAplicMOECODIGO: TFloatField;
    qryTipoAplicTXJUROSPREV: TFloatField;
    qryTipoAplicPRAZORESGATEPREV: TFloatField;
    qryTipoAplicIDPESSOA: TFloatField;
    qryTipoAplicPERCUSTO: TFloatField;
    qryTipoAplicIDCONTAORCCUS: TStringField;
    qryTipoAplicIDPLANOORCAMEN: TFloatField;
    qryTipoAplicIDCONTAORCREC: TStringField;
    qryTipoAplicPERCUSTOREND: TFloatField;
    qryEmpresaProp: TwwQuery;
    qryEmpresaPropIDPAIS: TFloatField;
    qryEmpresaPropCODESTADO: TStringField;
    qryEmpresaPropIDCIDADES: TFloatField;
    procedure bbtnCalculaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sCodTipoDocInvest : String;
    procedure LancaFluxoOrcado(sDataProgramada, sCodTipRecDes, sRecPag, sUnidNegoc, sCodCentroRespon,
                               sCodCentroCusto, sIdEmpresa, sPrazo, sCodTipDoc: String; rValor:Double);
    function CalcSaldoCaixa(sData,sPrazo : String) : Double;
    function GravaLancSimulAtivo(bContinua, bCalcula : Boolean; sLRA, sDataLanc, sDataResg : String;
                                 iTipoAplic : LongInt; rSaldoValor, rValDespAplic, rValDespResg,
                                 rValReceita : Double; sAplicResg : String): Boolean;
    function AtualizaOrcamento(sDataRef, sContaOrc : String; rValor : Double) : Boolean;
  public
    { Public declarations }
  end;

var
  frmSimulaAtivos: TfrmSimulaAtivos;
  rValorCotas, rValorResgate, rValorRendimento, rValorCustoAplic, rValorCustoResgate : Double;
  iTipoAplicSub : LongInt;
  bCont : Boolean;

implementation

{$R *.DFM}

Uses uSistema, uFuncaoGeral, uDataBase, uMensErro, Math, UdATA, uModulo, uDiasUteis, uOrcamento;

procedure TfrmSimulaAtivos.FormCreate(Sender: TObject);
begin
   inherited;
   //Busca Código de Documento dos Investimentos
   qryAux.Close;
   qryAux.SQL.Text:='SELECT CODTIPDOCINVEST FROM PARAMFINANC WHERE (IDPESSOA='+
                    IntToStr(Sistema.IdEmpresa)+')';
   qryAux.Open;
   if qryAux.FieldByName('CODTIPDOCINVEST').AsFloat<>0 then
      sCodTipoDocInvest:=qryAux.FieldByName('CODTIPDOCINVEST').AsString
   else
      sCodTipoDocInvest:='-1';
   qryAux.Close;

   qryParametro.Close;
   qryParametro.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
   qryParametro.Open;
   if qryParametro.IsEmpty then
    begin
       MsgDlg('Obrigatório preencher no parâmetro do sistema o tipo de aplicação para sobras/faltas no caixa','Erro',mtError,[mbOk],0);
       bbtnSair.Click;
       Exit;
    end;
   //
   qryEmpresaProp.Close;
   qryEmpresaProp.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
   qryEmpresaProp.Open;
end;

procedure TfrmSimulaAtivos.bbtnCalculaClick(Sender: TObject);
var sSql, sDataResg : String;
    iTipoAplic : LongInt;
    rCodLancAplic, rContaAplic, rSaldoValor, rSaldoCotas : Double;
    rValorOri, rTotRend, rTotDespAplic, rTotDespRend : Double;
    dDataIni, dDataFim, dDataResg, dDataLanc : TDateTime;
    rSaldoCaixa : Double;
    bPodeSair : Boolean;
begin
  inherited;
  if trim(deDataSimIni.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data Início','Erro',mtError,[mbOk],0);
     deDataSimIni.SetFocus;
     Exit;
  end;
  //
  if trim(deDataSimFim.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data Final','Erro',mtError,[mbOk],0);
     deDataSimFim.SetFocus;
     Exit;
  end;
  //
  if deDataSimFim.Date < deDataSimIni.Date then begin
     MsgDlg('Data Inicial não pode ser maior que data Final','Erro',mtError,[mbOk],0);
     deDataSimFim.SetFocus;
     Exit;
  end;
  Try
     lblMensagem.Caption     := 'Excluindo a Simulação já lançada';
     lblMensagem.Visible     := True;
     prgBarAtuFluxo.Visible  := True;
     Application.ProcessMessages;
     StartTransacao;
     with qryAux do begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE SALDOORCADO  SET VLRORCADO = 0  WHERE (FLGSIMULAATIVO = ''S'') AND ');
        SQL.Add('(IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND ');
        SQL.Add('(DATAREFERENCIA >= TO_DATE('''+deDataSimIni.Text+''',''DD/MM/YYYY'')) AND  ');
        SQL.Add('(DATAREFERENCIA <= TO_DATE('''+deDataSimFim.Text+''',''DD/MM/YYYY''))');
        ExecSQL;
     end;
     sSql:='DELETE FLUXOORCADO WHERE (FLGSIMULAATIVO = ''S'') AND (PRAZO = ''L'') AND '+
           '(IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND '+
           '(DATAPROGRAMADA >= TO_DATE('''+deDataSimIni.Text+''',''DD/MM/YYYY'')) AND  '+
           '(DATAPROGRAMADA <= TO_DATE('''+deDataSimFim.Text+''',''DD/MM/YYYY''))';
     If not ExecutarQuery(qryAux,sSql) then Abort;
     sSql:='DELETE LANCSIMULAATIVO WHERE  '+
           '(IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND '+
           '(DATALANC >= TO_DATE('''+deDataSimIni.Text+''',''DD/MM/YYYY'')) AND  '+
           '(DATALANC <= TO_DATE('''+deDataSimFim.Text+''',''DD/MM/YYYY''))';
     If not ExecutarQuery(qryAux,sSql) then Abort;
     qryFluxoOrc.Close;
     qryFluxoOrc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     qryFluxoOrc.ParamByName('DATAINI').AsString   := deDataSimIni.Text;
     qryFluxoOrc.ParamByName('DATAFIM').AsString   := deDataSimFim.Text;
     qryFluxoOrc.Open;
     lblMensagem.Caption     := 'Calculando os Valores de Aplicações e Resgates Previstos';
     prgBarAtuFluxo.Max      := qryFluxoOrc.RecordCount;
     prgBarAtuFluxo.Position := 0;
     Application.ProcessMessages;
     qryFluxoOrc.First;
     While not qryFluxoOrc.EOF do begin
        prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
        rContaAplic    := qryFluxoOrcCONTAAPLICACAO.AsFloat;
        iTipoAplic     := qryFluxoOrcTIPOAPLICACAO.AsInteger;
        rSaldoValor    := qryFluxoOrcVALOR.AsFloat;
        rValorOri      := qryFluxoOrcVALOR.AsFloat;
        rSaldoCotas    := qryFluxoOrcNUMCOTAS.AsFloat;
        dDataResg      := DiasUteis.PrimeiroDiaUtilPosterior(qryFluxoOrcDATAPREVRESGATE.AsDateTime,qryEmpresaPropIDCIDADES.AsInteger, qryEmpresaPropIDPAIS.AsInteger, qryEmpresaPropCODESTADO.AsString,true,true,false);
        sDataResg      := DateToStr(dDataResg);
        dDataLanc      := qryFluxoOrcDATALANCAMENTO.AsDateTime;
        dDataIni       := qryFluxoOrcDATALANCAMENTO.AsDateTime;
        dDataFim       := qryFluxoOrcDATAPREVRESGATE.AsDateTime;
        rCodLancAplic  := qryFluxoOrcCODLANCAPLIC.AsFloat;
        rTotRend       := 0;
        rTotDespAplic  := 0;
        rTotDespRend   := 0;
        If (qryFluxoOrcJUROSPREVISTOS.AsInteger = 0) and (qryFluxoOrcMOEDACOTA.IsNull) then begin
           rSaldoValor := qryFluxoOrcVLRRESGPREV.AsFloat;
           rTotRend    := qryFluxoOrcVLRRESGPREV.AsFloat - qryFluxoOrcVALOR.AsFloat;
        end else begin
           qryLancConta.Close;
           qryLancConta.ParamByName('IDPESSOA').AsInteger     := Sistema.IdEmpresa;
           qryLancConta.ParamByName('CONTAAPLICACAO').AsFloat := rContaAplic;
           qryLancConta.ParamByName('CODLANCAPLIC').AsFloat   := rCodLancAplic;
           qryLancConta.Open;
           bPodeSair := False;
           While not bPodeSair do begin
              If (not qryLancConta.IsEmpty) and
                 (qryLancContaCODLANCAPLIC.AsFloat < rCodLancAplic) then begin
                 qryLancConta.Next;
                 If qryLancConta.EOF then bPodeSair := True;
              end else begin
                 If (qryLancConta.IsEmpty) or (qryLancConta.EOF) or
                    (qryLancContaAPLICRESGATEJUROS.AsString = 'A') then begin
                    dDataFim  := dDataResg;
                    Modulo.CalcValorPrev(false,false,qryFluxoOrcAPLICRESGATEJUROS.AsString,rSaldoCotas,
                                         qryFluxoOrcJUROSPREVISTOS.AsFloat,qryFluxoOrcPRAZORESGATE.AsFloat,
                                         rSaldoValor, qryFluxoOrcPERCUSTO.AsFloat, qryFluxoOrcPERCUSTOREND.AsFloat,
                                         dDataFim, dDataIni, qryFluxoOrcMOEDACOTA.AsInteger,rValorResgate,
                                         rValorRendimento, rValorCustoAplic, rValorCustoResgate, rValorCotas);
                    rSaldoValor    := rValorResgate;
                    rSaldoCotas    := rValorCotas;
                    rTotRend       := rTotRend + rValorRendimento;
                    rTotDespAplic  := rTotDespAplic + rValorCustoAplic;
                    rTotDespRend   := rTotDespRend  + rValorCustoResgate;
                    bPodeSair      := True;
                 end else begin
                    If (qryLancContaDATALANCAMENTO.AsDateTime < dDataFim) then begin
                       dDataFim:=qryLancContaDATALANCAMENTO.AsDateTime;
                    end else begin
                       dDataFim  := dDataResg;
                       bPodeSair := True;
                    end;
                    Modulo.CalcValorPrev(false,false,qryFluxoOrcAPLICRESGATEJUROS.AsString,rSaldoCotas,
                                         qryFluxoOrcJUROSPREVISTOS.AsFloat,qryFluxoOrcPRAZORESGATE.AsFloat,
                                         rSaldoValor, qryFluxoOrcPERCUSTO.AsFloat, qryFluxoOrcPERCUSTOREND.AsFloat,
                                         dDataFim, dDataIni, qryFluxoOrcMOEDACOTA.AsInteger,rValorResgate,
                                         rValorRendimento, rValorCustoAplic, rValorCustoResgate, rValorCotas);
                    rSaldoValor := rValorResgate;
                    rSaldoCotas := rValorCotas;
                    rTotRend    := rTotRend + rValorRendimento;
                    rTotDespAplic  := rTotDespAplic + rValorCustoAplic;
                    rTotDespRend   := rTotDespRend  + rValorCustoResgate;
                    //
                    If (qryLancContaAPLICRESGATEJUROS.AsString = 'R') and (not qryLancConta.EOF) then begin
                       rSaldoValor := rSaldoValor - qryLancContaVALOR.AsFloat;
                       rSaldoCotas := rSaldoCotas - qryLancContaNUMCOTAS.AsFloat;
                    end;
                    dDataIni := dDataFim + 1;
                    If dDataIni >= dDataResg then bPodeSair := True;
                    qryLancConta.Next;
                 end;
              end;
           end;
        end;
        If (dDataLanc >= deDataSimIni.Date) and (dDataLanc <= deDataSimFim.Date) then begin
           if not GravaLancSimulAtivo(False, False,'A',DateToStr(dDataLanc),DateToStr(dDataResg),iTipoAplic,
                               rValorOri, rTotDespAplic, rTotDespRend, rTotRend, 'A') then Abort;
        end;
        If (dDataResg >= deDataSimIni.Date) and (dDataResg <= deDataSimFim.Date) and
           (iTipoAplic <> qryParametroTIPOAPLICACAO.AsInteger) then begin
           qryTipoAplic.Close;
           qryTipoAplic.ParamByName('TIPOAPLICACAO').AsInteger := iTipoAplic;
           qryTipoAplic.Open;
           LancaFluxoOrcado(sDataResg, qryTipoAplicCODTIPRECDES.AsString, qryTipoAplicRECPAG.AsString,
                            FloatToStr(qryTipoAplicUNIDNEGOC.AsFloat), qryTipoAplicCODCENTRORESPON.AsString,qryTipoAplicCODCENTROCUSTO.AsString,
                            qryTipoAplicIDEMPRESA.AsString, 'L',sCodTipoDocInvest,rSaldoValor);
           if not GravaLancSimulAtivo(true, False,'R', DateToStr(dDataResg), DateToStr(dDataResg), iTipoAplic,
                               rSaldoValor, rTotDespAplic, rTotDespRend, rTotRend, 'R') then Abort;
        end;

        qryFluxoOrc.Next;
     end;
     //Verifica Saldo de caixa diário para resgate ou aplicação
     dDataIni := deDataSimIni.Date;
     dDataFim := deDataSimFim.Date;
     lblMensagem.Caption := 'Calculando Saldos de Caixa';
     prgBarAtuFluxo.Max  := StrToInt(FloatToStr(dDataFim - dDataIni + 1));
     prgBarAtuFluxo.Position := 0;
     Application.ProcessMessages;
     while dDataIni <= dDataFim do
     begin
        prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
        rSaldoCaixa    := CalcSaldoCaixa(DateToStr(dDataIni),'L');
        if rSaldoCaixa > 0 then
         begin
            //Aplica
            LancaFluxoOrcado(DateToStr(dDataIni), qryParametroCODTIPRECDES.AsString, qryParametroRECPAG.AsString,
                             FloatToStr(qryParametroUNIDNEGOC.AsFloat), qryParametroCODCENTRORESPON.AsString, qryParametroCODCENTROCUSTO.AsString,
                             qryParametroIDEMPRESA.AsString, 'L',sCodTipoDocInvest, (rSaldoCaixa*(-1)));
            if not GravaLancSimulAtivo(False,True,'L', DateToStr(dDataIni), DateToStr(dDataIni), qryParametroTIPOAPLICACAO.AsInteger,
                                       rSaldoCaixa, 0, 0, 0, 'A') then Abort;
         end
        else
         begin
            if rSaldoCaixa < 0 then
             begin
                //Resgata
                LancaFluxoOrcado(DateToStr(dDataIni), qryParametroCODTIPRECDES.AsString, qryParametroRECPAG.AsString,
                                 FloatToStr(qryParametroUNIDNEGOC.AsFloat), qryParametroCODCENTRORESPON.AsString, qryParametroCODCENTROCUSTO.AsString,
                                 qryParametroIDEMPRESA.AsString, 'L',sCodTipoDocInvest, (rSaldoCaixa*(-1)));
                if not GravaLancSimulAtivo(False,True, 'L', DateToStr(dDataIni), DateToStr(dDataIni), qryParametroTIPOAPLICACAO.AsInteger,
                                      (rSaldoCaixa*(-1)), 0, 0, 0, 'R') then Abort;
             end;
         end;
        dDataIni := dDataIni + 1;
     end;
     CommitTransacao;
     MsgDlg('Simulação de Ativo Terminada com Sucesso','Aviso',mtWarning,[mbOk],0);
  Except
     RollBackTransacao;
     MsgDlg('Simulação de Ativo NÃO Terminada','Erro',mtError,[mbOk],0);
     Raise;
  End;
end;

procedure TfrmSimulaAtivos.LancaFluxoOrcado(sDataProgramada, sCodTipRecDes, sRecPag,
                                            sUnidNegoc, sCodCentroRespon, sCodCentroCusto,
                                            sIdEmpresa, sPrazo, sCodTipDoc: String; rValor:Double);
var iIdFluxoOrcado : LongInt;
    sValorCorrente, sSql : String;
begin
   sValorCorrente := FuncaoGeral.OraNumero(rValor);
   iIdFluxoOrcado := LeUltRegistro(Nil,'FLUXOORCADO');
   sSql := 'INSERT INTO FLUXOORCADO(IDFLUXOORCADO,IDPESSOA,DATAPROGRAMADA,CODTIPRECDES,RECPAG,UNIDNEGOC,'+
           'CODCENTRORESPON,CODCENTROCUSTO,IDEMPRESA,PRAZO,FLGSIMULAATIVO,VALOR) VALUES ('+IntToStr(iIdFluxoOrcado)+','+IntToStr(Sistema.IdEmpresa);
   sSql := sSql+', TO_DATE (''' +sDataProgramada+ ''',''DD/MM/YYYY'')';
   sSql := sSql+',''' +sCodTipRecDes+ '''';
   sSql := sSql+',''' +sRecPag+ '''';
   sSql := sSql+','+sUnidNegoc;
   sSql := sSql+',''' +sCodCentroRespon+ '''';
   if trim(sCodCentroCusto) = '' then
    begin
       sSql := sSql+',NULL';
       sSql := sSql+',NULL';
    end
   else
    begin
       sSql := sSql+','''+sCodCentroCusto+ '''';
       sSql := sSql+','+sIdEmpresa;
    end;
   sSql := sSql+','''+sPrazo+'''';
   sSql := sSql+',''S''';
   sSql := sSql+','+sValorCorrente+')';
   If not ExecutarQuery(qryAux,sSql) then Abort;
end;

function TfrmSimulaAtivos.CalcSaldoCaixa(sData,sPrazo : String) : Double;
begin
   Result := 0;
   qryCalcSaldoCaixa.Close;
   qryCalcSaldoCaixa.ParamByName('DATAPROGRAMADA').AsString := sData;
   qryCalcSaldoCaixa.ParamByName('PRAZO').AsString          := sPrazo;
   qryCalcSaldoCaixa.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
   qryCalcSaldoCaixa.Open;
   If not qryCalcSaldoCaixa.IsEmpty then
      Result := qryCalcSaldoCaixaSALDO.AsFloat;
end;

function TfrmSimulaAtivos.GravaLancSimulAtivo(bContinua, bCalcula : Boolean; sLRA, sDataLanc, sDataResg : String;
                                              iTipoAplic : LongInt; rSaldoValor, rValDespAplic, rValDespResg,
                                              rValReceita : Double; sAplicResg : String): Boolean;
Var iIdLancAtivo : LongInt;
    rVlrAplicResg, rVlrReceita, rVlrDespesa : Double;
    sVlrAplicResg, sVlrReceita, sVlrDespesa : String;
begin
   Result := True;
   Try
      qryTipoAplic.Close;
      qryTipoAplic.ParamByName('TIPOAPLICACAO').AsInteger := iTipoAplic;
      qryTipoAplic.Open;
      rVlrAplicResg := rSaldoValor;
      if bCalcula then begin
         if sLRA = 'L' then
            sDataResg   := DateToStr(DiasUteis.PrimeiroDiaUtilPosterior((StrToDate(sDataLanc)+qryTipoAplicPRAZORESGATEPREV.AsInteger),qryEmpresaPropIDCIDADES.AsInteger, qryEmpresaPropIDPAIS.AsInteger, qryEmpresaPropCODESTADO.AsString,true,true,false))
         else
            if sLRA = 'R' then
               sDataLanc  := DateToStr(StrToDate(sDataResg)-qryTipoAplicPRAZORESGATEPREV.AsInteger);
         if sAplicResg = 'A' then begin
            rVlrReceita := 0;
            rVlrDespesa := Modulo.Arredonda(rSaldoValor * (qryTipoAplicPERCUSTO.AsFloat/100),2);
         end else begin
            Modulo.CalcValorPrev(true,false,'A',0,qryTipoAplicTXJUROSPREV.AsFloat,
                                 qryTipoAplicPRAZORESGATEPREV.AsFloat, rVlrAplicResg,
                                 qryTipoAplicPERCUSTO.AsFloat, qryTipoAplicPERCUSTOREND.AsFloat,
                                 StrToDate(sDataResg), StrToDate(sDataLanc), qryTipoAplicMOECODIGO.AsInteger,rValorResgate,
                                 rValorRendimento, rValorCustoAplic, rValorCustoResgate, rValorCotas);
            rVlrReceita := rValorRendimento;
            rVlrDespesa := rValorCustoResgate;
         end;
      end else begin
         if sAplicResg = 'A' then begin
            rVlrDespesa := rValDespAplic;
            rVlrReceita := 0;
         end else begin
            rVlrReceita := rValReceita;
            rVlrDespesa := rValDespResg;
         end;
      end;
      sVlrAplicResg := FuncaoGeral.OraNumero(rVlrAplicResg);
      sVlrReceita   := FuncaoGeral.OraNumero(rVlrReceita);
      sVlrDespesa   := FuncaoGeral.OraNumero(rVlrDespesa);
      iIdLancAtivo  := LeUltRegistro(Nil,'LANCSIMULAATIVO');
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('INSERT INTO LANCSIMULAATIVO(IDLANCSIMULAATIVO,IDPESSOA,TIPOAPLICACAO,DATALANC,DATAPREVRESGATE,FLGTIPOLANC,VLRAPLICRESG,');
      qryAux.SQL.Add('VLRRECEITA,VLRDESPESA) VALUES ('+IntToStr(iIdLancAtivo)+','+IntToStr(Sistema.IdEmpresa));
      qryAux.SQL.Add(','+IntToStr(iTipoAplic));
      qryAux.SQL.Add(', TO_DATE (''' +sDataLanc+ ''',''DD/MM/YYYY'')');
      qryAux.SQL.Add(', TO_DATE (''' +sDataResg+ ''',''DD/MM/YYYY'')');
      qryAux.SQL.Add(','''+sAplicResg+ '''');
      qryAux.SQL.Add(','+sVlrAplicResg);
      qryAux.SQL.Add(','+sVlrReceita);
      qryAux.SQL.Add(','+sVlrDespesa+')');
      qryAux.ExecSQL;
      //
      if not AtualizaOrcamento(sDataLanc,qryTipoAplicIDCONTAORCREC.AsString, rVlrReceita) then abort;
      if not AtualizaOrcamento(sDataLanc,qryTipoAplicIDCONTAORCCUS.AsString, rVlrDespesa) then abort;
      //
      if (StrToDate(sDataResg) <= deDataSimFim.Date) and bContinua then begin
         if sAplicResg = 'A' then begin
            //Lança o Resgate no fluxo orçado e na simulação de ativo.
            Modulo.CalcValorPrev(false,false,'A',0,qryTipoAplicTXJUROSPREV.AsFloat,
                                 qryTipoAplicPRAZORESGATEPREV.AsFloat, rVlrAplicResg,
                                 qryTipoAplicPERCUSTO.AsFloat, qryTipoAplicPERCUSTOREND.AsFloat,
                                 StrToDate(sDataResg), StrToDate(sDataLanc), qryTipoAplicMOECODIGO.AsInteger,rValorResgate,
                                 rValorRendimento, rValorCustoAplic, rValorCustoResgate, rValorCotas);
            //
            LancaFluxoOrcado(sDataResg, qryTipoAplicCODTIPRECDES.AsString, qryTipoAplicRECPAG.AsString,
                             FloatToStr(qryTipoAplicUNIDNEGOC.AsFloat), qryTipoAplicCODCENTRORESPON.AsString,qryTipoAplicCODCENTROCUSTO.AsString,
                             qryTipoAplicIDEMPRESA.AsString, 'L',sCodTipoDocInvest, rValorResgate);
            //
            bCont := iTipoAplic <> qryParametroTIPOAPLICACAO.AsInteger;
            if not GravaLancSimulAtivo(bCont, True, 'L', sDataResg, sDataResg, iTipoAplic,
                                rValorResgate, 0, 0, 0, 'R') then Abort;
         end;
      end;
      if (StrToDate(sDataLanc) <= deDataSimFim.Date) and bContinua then begin
         if sAplicResg = 'R' then begin
            //Lança a Reaplicação no fluxo orçado e na simulação de ativo.
            if qryTipoAplicFLGREAPLICA.AsString = 'S' then begin
               if qryTipoAplicTIPOAPLICSUBST.isNull then
                  iTipoAplicSub := iTipoAplic
               else
                  iTipoAplicSub := qryTipoAplicTIPOAPLICSUBST.AsInteger;
               qryTipoAplic.Close;
               qryTipoAplic.ParamByName('TIPOAPLICACAO').AsInteger := iTipoAplicSub;
               qryTipoAplic.Open;

               LancaFluxoOrcado(sDataLanc, qryTipoAplicCODTIPRECDES.AsString, qryTipoAplicRECPAG.AsString,
                                FloatToStr(qryTipoAplicUNIDNEGOC.AsFloat), qryTipoAplicCODCENTRORESPON.AsString,qryTipoAplicCODCENTROCUSTO.AsString,
                                qryTipoAplicIDEMPRESA.AsString,'L',sCodTipoDocInvest, rVlrAplicResg*-1);
               //
               bCont := iTipoAplicSub <> qryParametroTIPOAPLICACAO.AsInteger;
               if not GravaLancSimulAtivo(bCont, True, 'L', sDataLanc, sDataLanc, iTipoAplicSub,
                                   rVlrAplicResg, 0, 0, 0, 'A') then Abort;
            end;
         end;
      end;
   Except
      Result := False;
   end;
end;

function TfrmSimulaAtivos.AtualizaOrcamento(sDataRef, sContaOrc : String; rValor : Double) : Boolean;
var iExercicio, iPeriodo : integer;
begin
   Result := True;
   Try
      if (not qryTipoAplicIDPLANOORCAMEN.isNull) and (sContaOrc <> '') and (rValor <> 0) then begin
         if OrcamentoBack.VerificaSaldo(qryTipoAplicIDPLANOORCAMEN.AsInteger, sContaOrc, sDataRef) then begin
            with qryAux do begin
               Close;
               SQL.Clear;
               SQL.Add('UPDATE SALDOORCADO SET VLRORCADO = VLRORCADO + :VALOR, FLGSIMULAATIVO = ''S'' ');
               SQL.Add('WHERE  IDPLANOORCAMEN =:IDPLANOORCAMEN AND ');
               SQL.Add('       IDCONTAORCAMEN =:IDCONTAORCAMEN AND ');
               SQL.Add('       IDPESSOA       =:IDPESSOA AND ');
               SQL.Add('       DATAREFERENCIA = TO_DATE(:DATAREFERENCIA, ''DD/MM/YYYY'') ');
               Prepare;
               ParamByName('IDPLANOORCAMEN').asInteger := qryTipoAplicIDPLANOORCAMEN.AsInteger;
               ParamByName('IDCONTAORCAMEN').asString  := sContaOrc;
               ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
               ParamByName('DATAREFERENCIA').asString  := sDataRef;
               ParamByName('VALOR').asFloat            := rValor;
               ExecSQL;
            end;
         end else begin
            iExercicio     := StrToInt(copy(sDataRef,7,4));
            iPeriodo       := OrcamentoBack.EncontraPeriodo(sDataRef);
            with qryAux do begin
               SQL.Clear;
               SQL.Add('INSERT INTO SALDOORCADO                         ');
               SQL.Add('   (IDCONTAORCAMEN, IDPESSOA,                   ');
               SQL.Add('    IDPLANOORCAMEN, DATAREFERENCIA,             ');
               SQL.Add('    EXERCICIO, PERIODO,                         ');
               SQL.Add('    VLRREALIZADO, VLRORCADO,                    ');
               SQL.Add('    VLRRESERVADO, VLRCOMPROMETIDO,              ');
               SQL.Add('    VLRORCACUM, VLRREALACUM, FLGSIMULAATIVO)    ');
               SQL.Add('VALUES                                          ');
               SQL.Add('   (:IDCONTAORCAMEN, :IDPESSOA,                 ');
               SQL.Add('    :IDPLANOORCAMEN, :DATAREFERENCIA,           ');
               SQL.Add('    :EXERCICIO, :PERIODO,                       ');
               SQL.Add('    :VLRREALIZADO, :VLRORCADO,                  ');
               SQL.Add('    :VLRRESERVADO, :VLRCOMPROMETIDO,            ');
               SQL.Add('    :VLRORCACUM, :VLRREALACUM, :FLGSIMULAATIVO) ');
               Prepare;
               ParamByName('EXERCICIO').asInteger      := iExercicio;
               ParamByName('PERIODO').asInteger        := iPeriodo;
               ParamByName('IDPLANOORCAMEN').asInteger := qryTipoAplicIDPLANOORCAMEN.AsInteger;
               ParamByName('IDCONTAORCAMEN').asString  := sContaOrc;
               ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
               ParamByName('DATAREFERENCIA').asDateTime:= StrToDate(sDataRef);
               ParamByName('VLRORCADO').asFloat        := rValor;
               ParamByName('VLRREALIZADO').asFloat     := 0;
               ParamByName('VLRRESERVADO').asFloat     := 0;
               ParamByName('VLRCOMPROMETIDO').asFloat  := 0;
               ParamByName('VLRORCACUM').asFloat       := 0;
               ParamByName('VLRREALACUM').asFloat      := 0;
               ParamByName('FLGSIMULAATIVO').asString  := 'S';
               ExecSQL;
            end;
         end;
      end;
   Except
      Result := False;
   end;
end;
   
end.


