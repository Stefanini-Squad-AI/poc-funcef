//------------------------------------------------------------------------------------------------------
//Rotina..........: BuscaPrimeiroDiaIRRF
//N. Sol..........: 105489
//N. Kintana......: 472013
//Data............: 07/01/2009
//Responsável.....: Bruno Bastos
//Descrição.......: Verificar se o mês a ser subtraído é janeiro. Se for, o novo mês será 12, senão será o
//                  mês anterior.
// -----------------------------------------------------------------------------------------------------
//Rotina..........: AbreQry
//N. Sol..........: 101670
//N. Kintana......: 451499
//Data............: 27/11/2008
//Responsável.....: Bruno Bastos
//Descrição.......: Alterar o vencimento do DARF de Imposto de Renda para o último dia
//                  útil do segundo decêndio. Alterei também a pedido do Gustavo
//                  a busca do dia útil que agora é feita para os dias anteriores
//                  e não mais para dias posteriores.
//------------------------------------------------------------------------------------------------------
//Rotina..........: TDisp.OnLine
//N. Sol..........: 95319
//N. Kintana......: 409226
//Data............: 09/09/2008
//Responsável.....: Marilza Colpani
//Descrição.......: Foi colocado um if para que o sistema execute a query QryDisponibilidadeCaixa, somente
//                  quando a opção for online.
//------------------------------------------------------------------------------------------------------
//Rotina..........: TmDispTimer
//N. Sol..........: 95319
//N. Kintana......: 409226
//Data............: 09/09/2008
//Responsável.....: Marilza Colpani
//Descrição.......: Executa a consulta de acordo com as opções manual e periódica e os tempos definidos.
// --------------------------------------------------------------------------------------------------
//Data      : 19/10/2007
//Código    : AL_17
//Pendência : 26547
//Descrição : Não iniciar a disponibilidade apenas se for a CBS
// --------------------------------------------------------------------------------------------------
//Data      : 06/09/2007
//Código    : AL_16
//Pendência : 26308
//SOL       : 68503
//Descrição : Retirada do itens 1.9.2 e 4.2 de registros de INSS (GPS) que deverão vir do item 2.4 quando é
//            gerado o documento de GPS pois estava duplicando lançamentos
// --------------------------------------------------------------------------------------------------
//Data      : 31/07/2007
//Código    : AL_7
//Pendência : 25962
//Descrição : Corrigido o erro em que a busca dos alteradores de IRRF não estavam
//            sendo executados conforme nova regra da RF, ou seja, no primeiro decêndio de cada mês.
// --------------------------------------------------------------------------------------------------
//Data      : 02/07/2007
//Código    : AL_6
//Pendência : 25733
//Descrição : Alteração do Item 1.9 e 4.0 para adaptar os registros de INSS com legislação vigente a partir
//            Jan/2007 e a partir de 01/01/2007 o INSS passa a ser recolhido no dia 10 ou próximo dia
//            útil subsequente
// --------------------------------------------------------------------------------------------------
//Data      : 05/02/2007
//Código    : AL_5
//Pendência : 24415
//Descrição : Troca dos Union do Saldo Anterio para Union ALL pois estava gerando divergência no total
// --------------------------------------------------------------------------------------------------
//Data      : 30/01/2007
//Código    : AL_4
//Pendência : 24344
//Descrição : Tratamento para não permitir a geração em data anterior a data inicial de Disponibilidade
// --------------------------------------------------------------------------------------------------
//Data      : 22/12/2006
//Código    : AL_3
//Pendência : 24228
//Descrição : Em complemento à retirada dos registros estornados, deve ser retirado a crítica que não
//            trazia os lancamentos Não Identificados (RELACIONANI WHERE FLGNI = 'I') dos itens 2.1 e 2.3
//******************************************************************************
//Data	    : 03/08/2005
//Código    : AL_2
//Motivo(S) : Acerto no item 1.10 para unificação com o CFINAN
//******************************************************************************
//Data	    : 05/07/2005
//Código    : AL_1
//Motivo(S) : Acerto de parâmetros faltantes para compatibilização com CFinan
//******************************************************************************
//Data	    : 24/02/2005
//Query     : QryDisponibilidadeCaixa
//Motivo(S) : Atualização para compatibilização com CFinan
//******************************************************************************
//Data	  : 04/02/2005
//Query 	  : QryDisponibilidadeCaixa
//Motivo(S): Atualização para compatibilização com CFinan
//******************************************************************************
//Data	  : 05/01/2005
//Query 	  : QryDisponibilidadeCaixa
//Motivo(S): Atualização
//******************************************************************************
//Data	  : 23/08/2004
//Query 	  : QryDisponibilidadeCaixa
//Motivo(S): Atualização
//******************************************************************************
//Data	  : 29/06/2004
//Query 	  : seDisp
//Motivo(S): Passado o Active da qry para 'False'
//******************************************************************************

unit dDisponibilidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

Const
  WM_DelayNormal = 90000000;
  WM_DelayLento  = 180000000;
  WM_DelayRapido = 45000000;
  // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
  WM_DelayTimer = 1;

type

  TDispThread = Class(TThread)
    Private
      I : Integer;
      Painel: TPanel;
      FbOnLine: Boolean;
      procedure AbreQry;
      procedure SetOnLine(bOnLine: Boolean);
    Protected
      Procedure Execute; OverRide;
    Public
      // AL_17
      Constructor CreateT(pnlDisp: TPanel; bInicia: boolean = True); // Fim AL_17
      Procedure Suspender;
      Procedure Continuar;
    Published
      Property OnLine : Boolean read FbOnLine write SetOnLine;

  End;

  TdmDisponibilidade = class(TDataModule)
    QryDisponibilidadeCaixa: TwwQuery;
    DsDisponibilidadeCaixa: TwwDataSource;
    seDisp: TSession;
    dbDisp: TDatabase;
    QryDisponibilidadeCaixaIDPATRO: TFloatField;
    QryDisponibilidadeCaixaIDPLANO: TFloatField;
    QryDisponibilidadeCaixaNOMEPLANOPATRO: TStringField;
    QryDisponibilidadeCaixaSALDOANT: TFloatField;
    QryDisponibilidadeCaixaRECEBIMENTOS: TFloatField;
    QryDisponibilidadeCaixaDESEMBOLSOS: TFloatField;
    QryDisponibilidadeCaixaSALDODIA: TFloatField;
    QryAuxiliar: TwwQuery;
    // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
    TmDisp: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
    procedure TmDispTimer(Sender: TObject);
  private
    { Private declarations }
    FdData: TDateTime;
    // AL_17
    FInicia: Boolean;
    procedure Setdata(dData: TDateTime);
    //AL_1
    function BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
    // AL_17
    procedure SetInicia(const Value: Boolean);
  published
    Property DataRef : TDateTime read FdData write SetData;
  public
    { Public declarations }
    WM_Delay: Integer;
    //AL_17
    Property Inicia : Boolean read FInicia write SetInicia;
  end;

var
  dmDisponibilidade: TdmDisponibilidade;

implementation

uses FCadLancamentoFundo, UDiasUteisInv, uSistema, UOperComum,
     UBibliotecaInvest, dBaseDados;

{$R *.DFM}

{ TDispThread }
// AL_17 
Constructor TDispThread.CreateT(pnlDisp: TPanel; bInicia: boolean = True);
Begin
   { Executa Heranca Criando a Thread Suspença }
   Inherited Create(True);
   Priority := tpNormal;
   FreeOnTerminate := True;
   OnLine := True;
   Painel := pnlDisp;
   dmDisponibilidade.WM_Delay := WM_DelayNormal;
   // AL_17
   dmDisponibilidade.Inicia := bInicia;
   { Inicia a thread }
   If dmDisponibilidade.Inicia then  // Fim AL_17
   Suspended := False;
End;

Procedure TDispThread.Execute;
Begin

   // AL_17
   if dmDisponibilidade.Inicia then
   begin  // Fim AL_17
   Synchronize(AbreQry);
   Application.ProcessMessages;
   end;

   if not OnLine then
      Self.Suspend;

   while not Terminated do
   begin
      Inc(I);
      if I >= dmDisponibilidade.WM_Delay then
      begin
         I := 1;
         Synchronize(AbreQry);
      end;
      Application.ProcessMessages;
      // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
      if ((not OnLine) and (not Self.Suspended)) or (dmDisponibilidade.WM_Delay = WM_DelayTimer) then
         Self.Suspend;

   end;
End;

procedure TDispThread.Suspender;
begin
   Self.Suspend;
end;

procedure TDispThread.Continuar;
begin
   if Self.Suspended then
   begin
      Self.I := dmDisponibilidade.WM_Delay;
      Self.Resume;
   end;
end;

procedure TDispThread.AbreQry;
var
   iAno, iMes, iDia                                    : word;
   dDataIniIRRF, dDataFimIRRF, dDataIniMes, dDataINSS,
   dDataIniMesAnt, dDataFimMesAnt                      : TDateTime;
   //AL_1
   iSaldoAntIRRF, iSaldoAntINSS: Integer;
begin
  with frmCadLancamentoFundo, dmDisponibilidade do
  begin
     // INSS - Todo dia 2 útil ou 1º útil subsequente
     DecodeDate(dmDisponibilidade.DataRef, iAno, iMes, iDia);

     // Primeiro dia do mes da DATAREF
     dDataIniMes := EncodeDate(iAno, iMes, 1);

     //AL_6
     if dmDisponibilidade.DataRef < StrToDate('01/02/2007') then
        // INSS - Todo dia 2 (útil) ou 1º útil subsequente
        dDataINSS := EncodeDate(iAno, iMes, 2)
     else
        // INSS - Todo dia 10 (útil) ou 1º útil subsequente
        //dDataINSS := EncodeDate(iAno, iMes, 10); //Bruno Bastos - SOL: 101670 Kintana: 451499
        dDataINSS := EncodeDate(iAno, iMes, 20); //Bruno Bastos - SOL: 101670 Kintana: 451499

     if not DiasUteis.DiaUtil(dDataINSS,-1,1,'',True,True,False) then
        //dDataINSS := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dDataINSS,True,True,False); //Bruno Bastos - SOL: 101670 Kintana: 451499
        dDataINSS := DiasUteis.UltDiaUtilAnterior(Sistema.IdEmpresa,dDataINSS,True,True,False); //Bruno Bastos - SOL: 101670 Kintana: 451499

     // Primeiro dia do mes Anterior da DATAREF
     dDataIniMesAnt := DiasUteis.SomaMeses(dDataIniMes, -1);
     DecodeDate(dDataIniMesAnt, iAno, iMes, iDia);

     // Último dia do mes Anterior da DATAREF
     dDataFimMesAnt := DiasUteis.UltDiaMes(iAno, iMes);

     // Quarta-feira - Dia para o IRFF (DARF)
     //AL_1 Ini
     dDataIniIRRF := BuscaPrimeiroDiaIRRF(DataRef);
     //AL_7
     if dDataIniIRRF = 1 then
        dDataFImIRRF := 1
     else
        //dDataFImIRRF := DataRef; //Bruno Bastos - Sol: 101670 kintana: 451499
      dDataFimIRRF := DiasUteisInv.UltDiaMes(DiasUteisInv.ExtraiAno(dDataIniIRRF), DiasUteisInv.ExtraiMes(dDataIniIRRF));//Bruno Bastos - SOL: 101670 Kintana: 451499

     iSaldoAntIRRF := 0;
     if ((DayOfWeek(DataRef) = 5) or
         (DayOfWeek(DataRef) = 6)) then
        iSaldoAntIRRF := 1;
     //AL_1 Fim

     QryAuxiliar.Close;
     QryAuxiliar.Open;

     OperComum.LimpaParametros(QryDisponibilidadeCaixa);

     QryDisponibilidadeCaixa.ParamByName('DATAREF').AsString := DateToStr(DataRef);
     QryDisponibilidadeCaixa.ParamByName('DATAANT').AsString := DateToStr(DataRef - 1);
     QryDisponibilidadeCaixa.ParamByName('IDPESSOA').AsInteger     := Sistema.IdEmpresa;

     QryDisponibilidadeCaixa.ParamByName('DATASALDOANT').AsString  :=
                             QryAuxiliar.FieldByName('DATAINIDISPFINANC').AsString;

     //AL_6
     QryDisponibilidadeCaixa.ParamByName('DATAINIMESANT').AsString := DateToStr(dDataIniMesAnt);
     QryDisponibilidadeCaixa.ParamByName('DATAFIMMESANT').AsString := DateToStr(dDataFimMesAnt);
     QryDisponibilidadeCaixa.ParamByName('IDPLANOPREV').AsInteger  := iPlanoPrevContab;
     QryDisponibilidadeCaixa.ParamByName('IDPATRO').AsInteger      := iPatrocinadora;

     // INSS
     if DataRef = dDataINSS then
        QryDisponibilidadeCaixa.ParamByName('DATAINSS').AsString := DateToStr(DataRef)
     else
        QryDisponibilidadeCaixa.ParamByName('DATAINSS').AsString := DateToStr(dDataINSS);
     //AL_1 Ini
     iSaldoAntINSS := 0;
     // Somente registros de INSS para o mês subsequente ao de início de Disponibilidade (PARAMFINANC.DATAINIDISPFINANC)
     if ((DataRef > dDataINSS) and
         (DataRef > StrToDate('01/02/2005'))) then
        iSaldoAntINSS := 1;
     QryDisponibilidadeCaixa.ParamByName('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
     // AL_1 Fim

     // IRFF (DARF)
     //AL_1
     QryDisponibilidadeCaixa.ParamByName('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;
     //if DayOfWeek(DataRef) = 4 then //Bruno Bastos - Sol: 101670 Kintana: 451499
     //begin //Bruno Bastos - Sol: 101670 Kintana: 451499
     QryDisponibilidadeCaixa.ParamByName('DATAINIIRRF').AsString := DateToStr(dDataIniIRRF);
     QryDisponibilidadeCaixa.ParamByName('DATAFIMIRRF').AsString := DateToStr(dDataFimIRRF);
     //end; //Bruno Bastos - Sol: 101670 Kintana: 451499

     // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
     if TDisp.OnLine then   
     begin
       QryDisponibilidadeCaixa.Open;
     
       if QryDisponibilidadeCaixaSALDODIA.AsFloat < 0 then
          Painel.Font.Color := clRed
       else
          Painel.Font.Color := clNavy;

       Painel.Caption := FormatFloat('###,###,###,###,##0.00 ', QryDisponibilidadeCaixaSALDODIA.AsFloat);
     end;

     QryAuxiliar.Close;

  end;
end;

procedure TDispThread.SetOnLine(bOnLine: Boolean);
begin
   FbOnLine := bOnLine;
end;

{ TdmDisponibilidade }

procedure TdmDisponibilidade.Setdata(dData: TDateTime);
begin
   FdData := dData;
end;

procedure TdmDisponibilidade.DataModuleCreate(Sender: TObject);
begin
   dbDisp.Connected := False;
   dbDisp.Params := dtmBaseDados.dbBaseDados.Params;
   dbDisp.Connected := True;
end;

//AL_1
function TdmDisponibilidade.BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
var dData : TDateTime;
    iDia, iMes, iAno : word;
begin
   //AL_7
   DecodeDate(dDataRef, iAno, iMes, iDia);

   //if ((DiasUteisInv.ExtraiDia(dDataRef) = 10) or //Bruno Bastos - Sol: 101670 Kintana: 451499
   //    (DiasUteisInv.ExtraiDia(DiasUteisInv.UltDiaUtilAnterior(EncodeDate(iAno,iMes,10),-1,1,'',true,false,false)) = DiasUteisInv.ExtraiDia(dDataRef))) then //Bruno Bastos - Sol: 101670 Kintana: 451499
   //Bruno Bastos - Sol: 101670 Kintana: 451499 - Início
   if ((DiasUteisInv.ExtraiDia(dDataRef) = 20) or
       (DiasUteisInv.ExtraiDia(DiasUteisInv.UltDiaUtilAnterior(EncodeDate(iAno,iMes,20),-1,1,'',true,false,false)) = DiasUteisInv.ExtraiDia(dDataRef))) then
   //Bruno Bastos - Sol: 101670 Kintana: 451499 - Fim
   begin
      if DiasUteisInv.DiaUtil(dDataRef,-1,1,'',true,false,false) then
      begin
         //while not (DiasUteisInv.ExtraiDia(dDataRef) = 11) do //Bruno Bastos - Sol: 101670 kintana: 451499
         //   dDataRef := dDataRef - 1; //Bruno Bastos - Sol: 101670 kintana: 451499

         //Bruno Bastos - Sol: 105489 Kintana: 472013 - Início
         if iMes > 1 then
           iMes := iMes - 1
         else
           iMes := 12;
         //Bruno Bastos - Sol: 105489 Kintana: 472013 - Fim

         result := EncodeDate(iAno,iMes,1); //Bruno Bastos - Sol: 105489 Kintana: 472013
         //Bruno Bastos - Sol: 105489 Kintana: 472013 - result := EncodeDate(iAno,iMes - 1,1); //Bruno Bastos - Sol: 101670 Kintana: 451499
         //Result := dDataRef; //Bruno Bastos - SOL: 101670 Kintana: 451499
      end
      else
         Result := 1;
   end
   else
      Result := 1;
end;
//AL_17
procedure TdmDisponibilidade.SetInicia(const Value: Boolean);
begin
  FInicia := Value;
end;

// Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
procedure TdmDisponibilidade.TmDispTimer(Sender: TObject);
begin
  TDisp.Continuar;
  dmDisponibilidade.WM_Delay := WM_DelayTimer;

  if TDisp <> nil then
    TDisp.Continuar;

  // Opção Manual e Primeira Execução do Automático
  if tmdisp.Interval = 500 then
     TmDisp.Enabled := false;
     FrmCadLancamentoFundo.lblMsg.Visible := True;
     FrmCadLancamentoFundo.lblMsg.Caption := 'Atualizado as: ' + FormatDateTime('hh:mm',now);


  // Opção Automática
  if FrmCadLancamentoFundo.RGAtualizaSaldo.ItemIndex = 1 then
  begin
    if FrmCadLancamentoFundo.cboOpcao.ItemIndex = 0 then
      tmdisp.Interval := 300000
    else
    if FrmCadLancamentoFundo.cboOpcao.ItemIndex = 1 then
      tmdisp.Interval := 600000
    else if FrmCadLancamentoFundo.cboOpcao.ItemIndex = 2 then
      tmdisp.Interval := 900000;
    if FrmCadLancamentoFundo.cboOpcao.ItemIndex <> -1 then
      tmdisp.Enabled := true;
      FrmCadLancamentoFundo.lblMsg.Visible := True;
      FrmCadLancamentoFundo.lblMsg.Caption := 'Atualizado as: ' + FormatDateTime('hh:mm',now);
  end;

end;

end.
