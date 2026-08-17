//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Unit com funcoes do Sistema
// Unit     .: UFuncoesRendaFixa
// Data     .: 30/06/2000
//------------------------------------------------------------------

unit UFuncoesRendaFixa;

interface

Uses
  USistema, UAutorizacao, UMensErro, UDatabase,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables, Wwquery;

type

   TFuncoesRendaFixa = Class(TObject)

      // Função que calcula o Correção Monetária Acumulada pela TR
      Function AcumuladoTR(dDataAtu,dDataEmissao,dDataIniTr,dDataBase,dDataVencto:TDateTime;
                           fPercentual:Double;iMoeda:longint;bSaldoIni:boolean):Double;

      // Função que calcula o Correção Monetária Acumulada ANBID
      Function AcumuladoANBID(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                              fPercentual:Double;iMoeda,iPzAnbid:longint;bSaldoIni:boolean):Double;

      // Função que calcula o Correção Monetária Acumulada TJLP
      Function AcumuladoTJLP(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                             fPercentual:Double;iMoeda,iPzTJLP:longint;bSaldoIni:boolean):Double;

      // Função que calcula por Cambial,Cotação
      Function AcumuladoPU(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                           fPercentual:Double;iMoeda:Longint;bSaldoIni:boolean):Double;

      // Função que calcula variação do DI e Selic no período
      Function AcumuladoDI(iCodMoeda :Integer;
                           sNomIndex :String;
                           dDataInicial,dDtaAtual :TDateTime;
                           fPercIndice :Double) :Real;

      // Função que calcula variação do DI e Selic no período para IR Litígio
      Function AcumuladoIRLitigio(iCodMoeda :Integer;
                                  sNomIndex :String;
                                  dDtaAtual :TDateTime;
                                  fPercIndice :Double) :Real;

      // Função que calcula variação do IGPM no período
      Function AcumuladoINPC(iCodMoeda :Integer; sNomIndex :String;
                             dDataEmiss,dDtaBase,dDataVenc,dDtaAtual :TDateTime;
                             fPercIndice :Double) :Double;

      // Função que calcula variação do IGPM no período
      Function AcumuladoIGPM(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                             fPercentual:Double;iInvestimento,iMoeda:longint;bSaldoIni:boolean;
                             var iPzIGPM,dcp,dct:Integer;var bProRataIGPM:Boolean):Double;

      // Função que calcula variação do IGPDI no período
      Function AcumuladoIGPDI(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                            fPercentual:Double;iInvestimento,iMoeda:longint;bSaldoIni:boolean;
                            var iPzIGPDI,dcp,dct:Integer;var bProRataIGPDI:Boolean):Double;

      Procedure ConsultaDataIndicePreco(dDtaIni,dDtaAtual :TDateTime;
                                        Var dDtaIndicePreco :TDateTime);

      // Função que Busca Dados Cotação de uma Moeda numa determinada data
      Function BuscaDadosCotacaoMoeda(iMoeda: longint; DataIniP,DataFimP:TDateTime;
                                      var fCotacao:double;var iPrazo:longint):boolean;

      // Função que calcula por PU Manual Sem Tratamento de Índice
      Function AcumuladoPUManual(dDataAtu,dDataBase:TDateTime;fPercentual:Double;iMoeda:Longint;
                                 sFlgProRata,sFlgInterpola:string):Double;

      //  Função que retorna o valor do Pu
      Function ValorPU(iCodMoeda :Integer; sNomIndex :String;
                     dDtaAtual :TDateTime; fPercIndice :Double) :Real;

      Procedure FatorIndicadores(dDtaInicio, dtDtaFim, dtEmiTitRenFix, dtVencTitRenFix : TDateTime;
                                 sCodTrataInd, sMoeSigla   : String;
                                 iIndexRendFix, iMoeCodigo : Integer;
                                 wPercentual               : Double;
                                 bSaldoIni                 : Boolean;
                                 Var wFator                : Double);

      // Função que calcula variação do IGPM para NTN-C no período
      Function AcumuladoNTNCIGPM(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                                 fPercentual:Double;iInvestimento,iMoeda:longint;bSaldoIni:boolean;
                                 var iPzIGPM,dcp,dct:Integer;var bProRataIGPM:Boolean;
                                 DUDC: String = 'U'):Double;

      // Função que calcula variação do IGPM para NTN-C no período com Dias Corridos
      function AcumuladoNTNCIGPMDiasCorr(dDataAtu,dDataEmissao,dDataBase,dDataVencto: TDateTime;
                                         fPercentual: Double;iInvestimento,iMoeda: longint;
                                         bSaldoIni: boolean; var iPzIGPM,dcp,dct: Integer;
                                         var bProRataIGPM: Boolean):Double;

      function AcumulaJurosNTNC(dDataAtu,dDataVenc,dDataEmissao:TDateTime; fTaxaJuros: Double; DUDC: String = 'U'): Double;

      procedure BuscaPrazosCouponNTNC(dDataAtu,dDataVenc,dDataEmissao:TDateTime; var dup,dut : Integer; DUDC: String = 'U');

   end;

var
  FuncoesRendaFixa : TFuncoesRendaFixa;

implementation

Uses
  DBaseDados, UBibliotecaInvest, UDiasUteisInv, UOperacaoInvest, UOperComum,
  dOperComum, Math, dFuncoesInvest ;

// Função que calcula o Correção Monetária Acumulada TR
function TFuncoesRendaFixa.AcumuladoTR(dDataAtu,dDataEmissao,dDataIniTr,dDataBase,dDataVencto:TDateTime;
                                       fPercentual:Double;iMoeda:longint;bSaldoIni:boolean ):Double;
var
   dup,dut : integer;   // Dias Úteis
   iPrazo : longint;
   wCotaMoeda : double;
   DataIni,DataIniP,DataFimP,DataFimTR : TDateTime;
   iAno,iMes,iDia,iDiaTR : word;
begin
   wCotaMoeda :=0;
   Result := 1;
   if (dDataAtu <> dDataEmissao) or (dDataAtu <= dDataVencto) then // faz correção após a compra e antes do vencto
   begin
      DecodeDate(dDataVencto,iAno,iMes,iDiaTR); // Guarda o dia base para TR
      DataIni := dDataBase;
      While (DataIni < dDataAtu) or (bSaldoIni = True) do
      begin
         // Acha o último dia do período (DataIni)
         DecodeDate(DataIni,iAno,iMes,iDia);
         if (iDia >= iDiaTR) then
         begin
            DataIniP := EncodeDate(iAno,iMes,iDiaTR);
            DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaTR),1);
         end
         else
         begin
            if ((iDia = 28) and (iMes = 2)) or ((iDia = 29) and (iMes = 2)) then
            begin
               DataIniP := EncodeDate(iAno,iMes,iDia);
               DataFimP := EncodeDate(iAno,3,iDiaTR); //março
            end
            else if ((iDia=30) and (iDiaTR=31)) then
            begin
               DataIniP := EncodeDate(iAno,iMes,iDia);
               DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaTR),1);
            end
            else //iDia < iDiaTR
            begin
               iMes := iMes-1;   // passar para um funçao
               if iMes = 0 then
                  iMes := 12;
               DataIniP := EncodeDate(iAno,iMes,iDiaTR);
               DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaTR),1);
            end;
         end;
         dut := DiasUteisInv.IntervaloDiasUteis(DataIniP,DataFimP,-1,1,'',True,False,False);
         if dut <= 0 then
            dut := 1;
         BuscaDadosCotacaoMoeda(iMoeda,DataIniP,DataFimP,wCotaMoeda,iPrazo);
         // Último período de cálculo antes do vencto ou do mês atual
         if DataFimP >= dDataAtu then
         begin
            dup := DiasUteisInv.IntervaloDiasUteis(DataIniP,dDataAtu,-1,1,'',True,False,False);
            // sai o While
            DataFimP := dDataAtu + 1;
            bSaldoIni := False;
         end
         else
            dup := DiasUteisInv.IntervaloDiasUteis(DataIniP,DataFimP,-1,1,'',True,False,False);
         if dup < 0 then
            dup := 0;  // o fator do dia ficará igual ao anterior.
         If wCotaMoeda = 0 Then
         begin
            Result := Result * 1;
            MsgDlg('Verifique: TR = 0,00 para esta data : '+DateToStr(DataIni),'Mensagem do Sistema',
               MtWarning,[MbOk],0);
         end
         else
         begin
            Result := Result * Power((((wCotaMoeda/100)*(fPercentual/100))+1),(dup/dut));
            Result := StrToFloat(FormatFloat('#0.00000000',Result));
         end;
         DataIni := DataFimP;
      end;
   end;
   // calcular fator correção paro o 1º período Pro-Rata se for o caso
   DecodeDate(dDataEmissao,iAno,iMes,iDia);
   // Acha a 1ª data base do contrato
   DataIniP := EncodeDate(iAno,iMes,iDiaTR); // com mês/ano DataEmissao e dia DataTR
   if DataIniP < dDataEmissao then
      DataIniP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaTR),1);
   if dDataAtu <= DataIniP then
   begin
      // dias úteis da DataEmissao até 1ª DataBase
      dup := DiasUteisInv.IntervaloDiasUteis(dDataEmissao,DataIniP,-1,1,'',True,False,False);
      if dup < 0 then
         dup := 0;
      // Acha o último dia do período da DataIniTR
      DataFimTR := DiasUteisInv.SomaMeses(dDataIniTR,1);
      dut := DiasUteisInv.IntervaloDiasUteis(dDataIniTR,DataFimTR,-1,1,'',True,False,False);
      if dut <= 0 then
         dut := 1;
      BuscaDadosCotacaoMoeda(iMoeda,dDataIniTR,DataFimTR,wCotaMoeda,iPrazo);
      If wCotaMoeda = 0 Then
      begin
         Result := Result * 1;
         MsgDlg('Verifique: TR = 0,00 para esta data : '+DateToStr(dDataIniTR),'Mensagem do Sistema',
            MtWarning,[MbOk],0);
      end
      else
         Result := Result * Power((((wCotaMoeda/100)*(fPercentual/100))+1),(dup/dut));
         Result := StrToFloat(FormatFloat('#0.00000000',Result));
   end;
end;

// Função que calcula o Correção Monetária Acumulada ANBID
function TFuncoesRendaFixa.AcumuladoANBID(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                                          fPercentual:Double;iMoeda,iPzAnbid:Longint;bSaldoIni:boolean):Double;
var
   dcp,dct : integer;   // Dias Corridos
   wCotaMoeda : double;
   DataIni,DataIniP,DataFimP : TDateTime;
begin
   // Retirada de Warnings
   DataIni  := 0;
   DataIniP := 0;
   wCotaMoeda :=0;
   Result := 1;
   if iPzAnbid = 0 then
      iPzAnbid := 30; // Default
   if (dDataAtu <> dDataEmissao) or (dDataAtu <= dDataVencto) then // faz correção após a compra e antes do vencto
   begin
      // Procura DataIniP para o período atual de cálculo e
      if dDataEmissao <> dDataBase then   // correção a partir do saldo implantado
      begin
         DataFimP := dDataEmissao;
         While (DataIni < dDataAtu) do
         begin
            DataIniP := DataFimP;
            DataFimP := DataIniP + iPzAnbid;
            if DiasUteisInv.DiaUtil(DataFimP,-1,1,'',True,False,False) = False then
               DataFimP := DiasUteisInv.PrimeiroDiaUtilPosterior(DataFimP,-1,1,'',True,False,False);
            if DataFimP > dDataVencto then
               DataFimP := dDataVencto;
            DataIni := DataFimP;
         end;
      end;
      // Inicia os cálculos
      if dDataEmissao <> dDataBase then   // correção a partir do saldo implantado
      begin
         DataIni := dDataBase;
         DataFimP := DataIniP; // Recebe a última DataIniP que foi encontrada anteriormente
      end
      else                               // correção a partir da emissão
      begin
         DataIni := dDataEmissao;
         DataFimP := dDataEmissao;
      end;
      While (DataIni < dDataAtu) or (bSaldoIni = True) do
      begin
         DataIniP := DataFimP;
         DataFimP := DataIniP + iPzAnbid;
         if DiasUteisInv.DiaUtil(DataFimP,-1,1,'',True,False,False) = False then
            DataFimP := DiasUteisInv.PrimeiroDiaUtilPosterior(DataFimP,-1,1,'',True,False,False);
         if DataFimP > dDataVencto then
            DataFimP := dDataVencto;
         dct := DiasUteisInv.IntervaloDias(DataIniP,DataFimP);
         if dct <= 0 then
            dct := 1;  // o fator do dia ficará igual ao anterior.
         // Pro-Rata para último período (atual)
         if DataFimP > dDataAtu then
         begin
            dcp := DiasUteisInv.IntervaloDias(DataIniP,dDataAtu);
            BuscaDadosCotacaoMoeda(iMoeda,DataIniP,DataFimP,wCotaMoeda,iPzAnbid);
            // sai o While
            DataFimP := dDataAtu + 1;
            bSaldoIni := False;
         end
         else
         begin
            dcp := DiasUteisInv.IntervaloDias(DataIniP,DataFimP);
            BuscaDadosCotacaoMoeda(iMoeda,DataIniP,DataFimP,wCotaMoeda,iPzAnbid);
         end;
         if dcp < 0 then
            dcp := 0;
         If wCotaMoeda = 0 Then
         begin
            Result := Result * 1;
            MsgDlg('Verifique: ANBID = 0,00 para esta data : '+DateToStr(DataIniP),'Mensagem do Sistema',
               MtWarning,[MbOk],0);
         end
         else
         begin
            Result := Result * Power(Power((((wCotaMoeda/100)*(fPercentual/100))+1),(dct/360)),(dcp/dct));
            Result := StrToFloat(FormatFloat('#0.00000000',Result));
         end;
         DataIni := DataFimP;
      end;
   end;
end;

// Função que calcula o Correção Monetária Acumulada TJLP
function TFuncoesRendaFixa.AcumuladoTJLP(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                                         fPercentual:Double;iMoeda,iPzTJLP:Longint;bSaldoIni:boolean):Double;
var
   dcp,dct : integer;   // Dias Corridos
   wCotaMoeda : double;
   DataIni,DataIniP,DataFimP : TDateTime;
begin
   wCotaMoeda := 0;
   // Retirada de Warnings
   DataIni  := 0;
   DataIniP := 0;
   Result := 1;
   if iPzTJLP = 0 then
      iPzTJLP := 30; // Default
   if (dDataAtu <> dDataEmissao) or (dDataAtu <= dDataVencto) then // faz correção após a compra e antes do vencto
   begin
      // Procura DataIniP para o período atual de cálculo e
      if dDataEmissao <> dDataBase then   // correção a partir do saldo implantado
      begin
         DataFimP := dDataEmissao;
         While (DataIni < dDataAtu) do
         begin
            DataIniP := DataFimP;
            DataFimP := DataIniP + iPzTJLP;
            if DiasUteisInv.DiaUtil(DataFimP,-1,1,'',True,False,False) = False then
               DataFimP := DiasUteisInv.PrimeiroDiaUtilPosterior(DataFimP,-1,1,'',True,False,False);
            if DataFimP > dDataVencto then
               DataFimP := dDataVencto;
            DataIni := DataFimP;
         end;
      end;
      // Inicia os cálculos
      if dDataEmissao <> dDataBase then   // correção a partir do saldo implantado
      begin
         DataIni := dDataBase;
         DataFimP := DataIniP; // Recebe a última DataIniP que foi encontrada anteriormente
      end
      else                               // correção a partir da emissão
      begin
         DataIni := dDataEmissao;
         DataFimP := dDataEmissao;
      end;
      While (DataIni < dDataAtu) or (bSaldoIni = True) do
      begin
         DataIniP := DataFimP;
         DataFimP := DataIniP + iPzTJLP;
         if DiasUteisInv.DiaUtil(DataFimP,-1,1,'',True,False,False) = False then
            DataFimP := DiasUteisInv.PrimeiroDiaUtilPosterior(DataFimP,-1,1,'',True,False,False);
         if DataFimP > dDataVencto then
            DataFimP := dDataVencto;
         dct := DiasUteisInv.IntervaloDias(DataIniP,DataFimP);
         if dct <= 0 then
            dct := 1;
         // Pro-Rata para último período (atual)
         if DataFimP > dDataAtu then
         begin
            dcp := DiasUteisInv.IntervaloDias(DataIniP,dDataAtu);
            BuscaDadosCotacaoMoeda(iMoeda,DataIniP,DataFimP,wCotaMoeda,iPzTJLP);
            // sai o While
            DataFimP := dDataAtu + 1;
            bSaldoIni := False;
         end
         else
         begin
            dcp := DiasUteisInv.IntervaloDias(DataIniP,DataFimP);
            BuscaDadosCotacaoMoeda(iMoeda,DataIniP,DataFimP,wCotaMoeda,iPzTJLP);
         end;
         if dcp < 0 then
            dcp := 0;
         If wCotaMoeda = 0 Then
         begin
            Result := Result * 1;
            MsgDlg('Verifique: TJLP = 0,00 para esta data : '+DateToStr(DataIniP),'Mensagem do Sistema',
               MtWarning,[MbOk],0);
         end
         else
         begin
            //Result := Result * Power(Power(((wCotaMoeda/100)+1),(dct/360)),(dcp/dct));
            Result := Result * Power(Power((((wCotaMoeda/100)*(fPercentual/100))+1),(dct/360)),(dcp/dct));
            Result := StrToFloat(FormatFloat('#0.00000000',Result));
         end;
         DataIni := DataFimP;
      end;
   end;
end;

// Função que calcula por Cambial,PU,Cotação
function TFuncoesRendaFixa.AcumuladoPU(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                                       fPercentual:Double;iMoeda:Longint;bSaldoIni:boolean):Double;
var
   wCotacao1,wCotacao2 : double;
   DataIniP,DataFimP : TDateTime;
begin
   wCotacao1  :=0;
   wCotacao2  :=0;
   DataIniP := dDataEmissao;
   DataFimP := dDataAtu;
   if dDataEmissao <> dDataBase then   // correção a partir do saldo implantado
      DataIniP := dDataBase;
   OperComum.BuscaCotacaoMoeda(iMoeda,DataIniP,'',wCotacao1,dDataBase);
   if wCotacao1 = 0 Then
      MsgDlg('Verifique: PU= 0,00 para esta data : '+DateToStr(DataIniP),'Mensagem do Sistema',
              MtWarning,[MbOk],0);
   OperComum.BuscaCotacaoMoeda(iMoeda,DataFimP,'',wCotacao2,dDataBase);
   if wCotacao2 = 0 Then
      MsgDlg('Verifique: PU= 0,00 para esta data : '+DateToStr(DataFimP),'Mensagem do Sistema',
              MtWarning,[MbOk],0);

   Result := (((wCotacao2/wCotacao1 - 1)*(fPercentual/100)) + 1);
end;

// Função que Busca Dados da Cotação de uma Moeda numa determinada data.
function TFuncoesRendaFixa.BuscaDadosCotacaoMoeda(iMoeda:longint;DataIniP,DataFimP:TDateTime;
                                                  var fCotacao:double;var iPrazo:longint): boolean;
var
   QryLocal  :TwwQuery;
begin
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    FazQuery(QryLocal,
      'SELECT MO.MOECODIGO, MO.COTDATA,MO.COTVALOR,MO.COTDATAFIM,MO.NUMDIASPRAZO '+
      'FROM COTACAOMOEDA MO '+
      'WHERE 	(MO.MOECODIGO = '+InttoStr(iMoeda)+') AND '+
      '      	(MO.COTDATA = (TO_DATE('''+DateToStr(DataIniP)+''',''DD/MM/YYYY''))) AND'+
      '      	(MO.COTDATAFIM = (TO_DATE('''+DateToStr(DataFimP)+''',''DD/MM/YYYY''))) ');

    fCotacao :=QryLocal.FieldByName('COTVALOR').AsFloat;
    iPrazo   :=QryLocal.FieldByName('NUMDIASPRAZO').AsInteger;
    QryLocal.Free;
    Result := True;
end;



// Função que calcula variação do INPC no período
Function TFuncoesRendaFixa.AcumuladoINPC(iCodMoeda :Integer; sNomIndex :String;
                                         dDataEmiss,dDtaBase,dDataVenc,dDtaAtual :TDateTime;
                                         fPercIndice :Double) :Double;
Var
   dDtaIndPreRet,dDtaIndPre,wDataCotacao :TDatetime;
   fValCotacao : Double;
Begin
   Result := 1;
   ConsultaDataIndicePreco(dDataEmiss,dDtaAtual,dDtaIndPreRet);
   ConsultaDataIndicePreco(dDataVenc,dDtaAtual,dDtaIndPre);
   OperComum.BuscaCotacaoMoeda(iCodMoeda,dDtaIndPreRet,'=',fValCotacao,wDataCotacao);
   If fValCotacao=0 Then
      MsgDlg('Indice '+sNomIndex+'não encontrado nesta data : '+DateToStr(dDtaIndPreRet),'Mensagem do Sistema',MtWarning,[MbOk],0);
   While (dDtaIndPreRet < dDtaAtual) do
   begin
      OperComum.BuscaCotacaoMoeda(iCodMoeda,dDtaIndPreRet,'=',fValCotacao,WDataCotacao);
      If fValCotacao = 0 Then
      begin
         MsgDlg('Indice '+sNomIndex+'não encontrado nesta data : '+DateToStr(dDtaIndPreRet),'Mensagem do Sistema',MtWarning,[MbOk],0);
         Break;
      end;
      Result := Result * Power(((fValCotacao/100)+1),(dDtaAtual-dDtaIndPreRet/30));
   end;
End;

// Função que calcula variação do IGPM no período
Function TFuncoesRendaFixa.AcumuladoIGPM(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                                         fPercentual:Double;iInvestimento,iMoeda:longint;bSaldoIni:boolean;
                                         var iPzIGPM,dcp,dct:Integer;var bProRataIGPM:Boolean):Double;
Var
   fProRata,NIn,NIe : double;
   DataIniP,DataFimP,DataIniProRata,DataFimProRata,DataFimPerProRata : TDateTime;
   iAno,iMes,iDia,iDiaIGPM,iDiaAtu : word;
Begin
   // Retirada de Warnings
   DataFimP := 0;
   DataIniP := 0;
   NIn := 0;
   NIe := 0;
   Result := 1;
   iDiaIGPM := 1;
   bProRataIGPM := False;
   if (dDataAtu <> dDataEmissao) or (dDataAtu <= dDataVencto) then // faz correção após a compra e antes do vencto
   begin
      DecodeDate(dDataBase,iAno,iMes,iDia);
      DataIniP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);

      DecodeDate(dDataAtu,iAno,iMes,iDiaAtu);
      if iDiaAtu < 1 then  // IGPM acrua C.Monetária a cada dia 1
      begin
         DecodeDate(dDataAtu,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);
         DecodeDate(DataFimP,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);
         if DataFimP <= DataIniP then
            DataFimP := DataIniP;
      end
      else
      begin
         DecodeDate(dDataAtu,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);
      end;
      iPzIGPM := DiasUteisInv.IntervaloMeses(DataIniP,DataFimP);
      OperComum.BuscaCotacaoMoeda(iMoeda,DataIniP,'',NIe,dDataBase);
      If NIe = 0 Then
         MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataIniP),'Mensagem do Sistema',
                 MtWarning,[MbOk],0);
      OperComum.BuscaCotacaoMoeda(iMoeda,DataFimP,'',NIn,dDataBase);
      If NIn = 0 Then
         MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataFimP),'Mensagem do Sistema',
                 MtWarning,[MbOk],0);
      Result := ((OperComum.DivValorZero(NIn,NIe)-1) * OperComum.DivValorZero(fPercentual, 100))+1;
      Result := StrToFloat(FormatFloat('#0.00000000',Result-0.0000000049));
      if NIn = NIe then // está em período de Pro-Rata
      begin
         iPzIGPM := 0; // Para que o fator de juros no período fique = 1
         bProRataIGPM := True;
      end;
   end;

   // Pró-Rata mês atual
   // -> VER NO FUTURO : CRIAR FLG PARA TESTAR SE IRA TER PRO-RATA NO TITULO

   NIe := 0;
   NIn := 0;
   DataIniProRata := DataFimP;
   DecodeDate(DataIniProRata,iAno,iMes,iDia);
   DataFimProRata    := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),1);
   DataFimPerProRata := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),2);

   with dtmFuncoesInvest.QryBuscaDataFluxoTitulo do
   begin
      Close;
      ParamByName('dDATAREF').AsString := DateToStr(dDataAtu);
      ParamByName('pIDINVESTIMENTO').AsInteger := iInvestimento;
      Open;

      if dDataAtu <> FieldByName('DATAFLUXO').AsDateTime then // Se igual, não deve fazer pro-rata pois é o dia de geração do FLUXO DO TITULO
      begin
         OperComum.BuscaCotacaoMoeda(iMoeda,DataIniProRata,'',NIe,dDataBase);
         If NIe = 0 Then
            MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataIniProRata),'Mensagem do Sistema',
                    MtWarning,[MbOk],0);
         OperComum.BuscaCotacaoMoeda(iMoeda,DataFimProRata,'',NIn,dDataBase);
         If NIn = 0 Then
            MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataFimProRata),'Mensagem do Sistema',
                    MtWarning,[MbOk],0);
               dct := DiasUteisInv.IntervaloDias(DataIniP,DataFimP);
         dct := DiasUteisInv.IntervaloDias(DataFimProRata,DataFimPerProRata);
         dcp := ( DiasUteisInv.IntervaloDias(DataFimProRata,DataFimPerProRata) -
                  DiasUteisInv.IntervaloDias(dDataAtu,DataFimPerProRata) );

         fProRata := ((OperComum.DivValorZero(NIn,NIe)-1)*OperComum.DivValorZero(fPercentual,100))+1;
         fProRata := Power(fProRata,OperComum.DivValorZero(dcp,dct));
         fProRata := StrToFloat(FormatFloat('#0.00000000',fProRata-0.0000000049));

         Result := Result * fProRata;
      end;
   end;
end;


// Função que calcula variação do IGPDI no período
Function TFuncoesRendaFixa.AcumuladoIGPDI(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                                          fPercentual:Double;iInvestimento,iMoeda:longint;bSaldoIni:boolean;
                                          var iPzIGPDI,dcp,dct:Integer;var bProRataIGPDI:Boolean):Double;
Var
   fProRata,NIn,NIe : double;
   DataIniP,DataFimP,DataIniProRata,DataFimProRata,DataFimPerProRata : TDateTime;
   iAno,iMes,iDia,iDiaIGPDI,iDiaAtu : word;
Begin
   // Retirada de Warnings
   DataFimP := 0;
   NIn := 0;
   NIe := 0;
   Result := 1;
   iDiaIGPDI := 15;
   bProRataIGPDI := False;
   if (dDataAtu <> dDataEmissao) or (dDataAtu <= dDataVencto) then // faz correção após a compra e antes do vencto
   begin
      DecodeDate(dDataBase,iAno,iMes,iDia);
      DataIniP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPDI),-1);

      DecodeDate(dDataAtu,iAno,iMes,iDiaAtu);
      if iDiaAtu < 15 then  // IGPDI acrua C.Monetária a cada dia 15
      begin
         DecodeDate(dDataAtu,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPDI),-1);
         DecodeDate(DataFimP,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPDI),-1);
         if DataFimP <= DataIniP then
            DataFimP := DataIniP;
      end
      else
      begin
         DecodeDate(dDataAtu,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPDI),-1);
      end;
      iPzIGPDI := DiasUteisInv.IntervaloMeses(DataIniP,DataFimP);
      OperComum.BuscaCotacaoMoeda(iMoeda,DataIniP,'',NIe,dDataBase);
      If NIe = 0 Then
         MsgDlg('Verifique: IGPDI = 0,00 para esta data : '+DateToStr(DataIniP),'Mensagem do Sistema',
                 MtWarning,[MbOk],0);
      OperComum.BuscaCotacaoMoeda(iMoeda,DataFimP,'',NIn,dDataBase);
      If NIn = 0 Then
         MsgDlg('Verifique: IGPDI = 0,00 para esta data : '+DateToStr(DataFimP),'Mensagem do Sistema',
                 MtWarning,[MbOk],0);
      Result := ((OperComum.DivValorZero(NIn,NIe)-1) * OperComum.DivValorZero(fPercentual, 100))+1;
      Result := StrToFloat(FormatFloat('#0.00000000',Result-0.0000000049));
      if NIn = NIe then // está em período de Pro-Rata
      begin
         iPzIGPDI := 0; // Para que o fator de juros no período fique = 1
         bProRataIGPDI := True;
      end;
   end;

   // Pró-Rata mês atual
   // -> VER NO FUTURO : CRIAR FLG PARA TESTAR SE IRA TER PRO-RATA NO TITULO

   NIe := 0;
   NIn := 0;
   DataIniProRata := DataFimP;
   DecodeDate(DataIniProRata,iAno,iMes,iDia);
   DataFimProRata    := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPDI),1);
   DataFimPerProRata := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPDI),2);

   with dtmFuncoesInvest.QryBuscaDataFluxoTitulo do
   begin
      Close;
      ParamByName('dDATAREF').AsString := DateToStr(dDataAtu);
      ParamByName('pIDINVESTIMENTO').AsInteger := iInvestimento;
      Open;

      if dDataAtu <> FieldByName('DATAFLUXO').AsDateTime then // Se igual, não deve fazer pro-rata pois é o dia de geração do FLUXO DO TITULO
      begin
         OperComum.BuscaCotacaoMoeda(iMoeda,DataIniProRata,'',NIe,dDataBase);
         If NIe = 0 Then
            MsgDlg('Verifique: IGPDI = 0,00 para esta data : '+DateToStr(DataIniProRata),'Mensagem do Sistema',
                    MtWarning,[MbOk],0);
         OperComum.BuscaCotacaoMoeda(iMoeda,DataFimProRata,'',NIn,dDataBase);
         If NIn = 0 Then
            MsgDlg('Verifique: IGPDI = 0,00 para esta data : '+DateToStr(DataFimProRata),'Mensagem do Sistema',
                    MtWarning,[MbOk],0);

         dct := DiasUteisInv.IntervaloDias(DataFimProRata,DataFimPerProRata);
         dcp := ( DiasUteisInv.IntervaloDias(DataFimProRata,DataFimPerProRata) -
                  DiasUteisInv.IntervaloDias(dDataAtu,DataFimPerProRata) );

         fProRata := ((OperComum.DivValorZero(NIn,NIe)-1)*OperComum.DivValorZero(fPercentual,100))+1;
         fProRata := Power(fProRata,OperComum.DivValorZero(dcp,dct));
         fProRata := StrToFloat(FormatFloat('#0.00000000',fProRata-0.0000000049));

         Result := Result * fProRata;
      end;
   end;
end;

Procedure TFuncoesRendaFixa.ConsultaDataIndicePreco(dDtaIni,dDtaAtual :TDateTime;Var dDtaIndicePreco :TDateTime);
var
   iAno, iMes, iDia, iRefAno, iRefDia, iRefMes : Word;
Begin
   DecodeDate(dDtaIni,iAno,iMes,iDia);
   DecodeDate(dDtaAtual,iRefAno,iRefMes,iRefDia);
   If (iDia = 31) Then
      iDia := 30
   Else If iDia <> 30 Then    // Verifica data inicial p/cotação do IGPM
   Begin
      If (iRefDia <> 30) Or (iRefMes <> iMes) Then
      Begin
         If (((iMes = iRefMes) Or (iMes = iRefMes+1)) And (iAno = iRefAno)) Or
             ((iAno > iRefAno) And (iMes = 1)) Then
         Begin
            If imes = 1 Then
            Begin
               imes := 12;
               iAno := iAno - 1;
            End
            Else
               imes := imes - 1;
         End;
      End;
      iDia := 30;
      If imes = 2 Then
         iDia := 28;
   End;
   dDtaIndicePreco := StrToDate(IntToStr(IDia)+'/'+IntToStr(IMes)+'/'+IntToStr(IAno));
End;

// Função que calcula por PU Manual Sem Tratamento de Índice
Function TFuncoesRendaFixa.AcumuladoPUManual(dDataAtu,dDataBase:TDateTime;fPercentual:Double;iMoeda:Longint;
                                             sFlgProRata,sFlgInterpola:string):Double;
var wCotacao1,wCotacao2 : double;
begin
   Result := 1;
   // Retirada de Warnings
//   wCotacao1 := 1;
//   wCotacao2 := 1;
   wCotacao1 := OperComum.LeMoeda(iMoeda,
                                       dDataBase,
                                       sFlgProRata,
                                       sFlgInterpola);
   wCotacao2 := OperComum.LeMoeda(iMoeda,
                                       dDataAtu,
                                       sFlgProRata,
                                       sFlgInterpola);
   if wCotacao1 <> 0 then
   begin
      if fPercentual = 0  then
         Result := ((Result*wCotacao2)/wCotacao1)
      else
         Result := (Result *((((wCotacao2/wCotacao1)-1)*(fPercentual/100))+1));
   end;
end;

Function TFuncoesRendaFixa.AcumuladoIRLitigio(iCodMoeda :Integer; sNomIndex :String;
                                              dDtaAtual :TDateTime; fPercIndice :Double) :Real;
Var
   fValCotacao,fValAux,taxa :Double;
   wDataCotacao : TDateTime;
Begin
   // Se não informou o percentual do índice , Calculo 100%
   If fPercIndice = 0 Then fPercIndice:=100;
   // Calcular apartir do próximo dia útil
   Result :=1;
   // Só atualizar dias úteis
   While not DiasUteisInv.DiaUtil(dDtaAtual,-1,1,'',True,False,False) Do
   Begin           // Achar o próximo dia útil
      dDtaAtual  := dDtaAtual+1;
   End;
   OperComum.BuscaCotacaoMoeda(iCodMoeda,dDtaAtual,'=',fValCotacao,wDataCotacao);
   If fValCotacao = 0 Then
   Begin
      MsgDlg('Cotação não encontrada '+sNomIndex+' em '+DateToStr(dDtaAtual)
            ,'Mensagem do Sistema ', mtError, [mbOk], 0);
      Exit;
   End;
   // Quando a data for menor que o dia 01/01/98, vamos informar a taxa over e não anual
   If fValCotacao < 8.00 Then
   Begin
      // Uso FormatFloat para arredondamento de 8 casas decimais    (Conforme CETIP)
      fValAux := StrToFloat(FormatFloat('#0.00000000',(fValCotacao*(fPercIndice/100))/3000+1));
      Result  :=StrToFloat(FormatFloat('#0.00000000',Result*fValAux));
   End
   Else
   Begin
      If sNomIndex='DI' Then
      Begin
         // Uso FormatFloat para arredondamento de 8 casas decimais  (Conforme CETIP)
         taxa:=StrToFloat(FormatFloat('#0.00000000',(Power(1+(fValCotacao/100),1/252)-1)));
         fValAux :=StrToFloat(FormatFloat('#0.0000000000000000',(taxa*(fPercIndice/100))+1));
         Result  :=(Result*fValAux);
         Result  :=StrToFloat(FormatFloat('#0.00000000',Result));
      End
      Else If sNomIndex='SELIC' Then
      Begin
         // Uso FormatFloat para arredondamento de 9 casas decimais  (Conforme REFER)
         taxa:=StrToFloat(FormatFloat('#0.000000000',(Power(1+(fValCotacao/100),1/252)-1)));
         fValAux :=StrToFloat(FormatFloat('#0.0000000000000000',(taxa*(fPercIndice/100))+1));
         Result  :=(Result*fValAux);
         Result  :=StrToFloat(FormatFloat('#0.000000000',Result));
      End;
   End;
End;


Function TFuncoesRendaFixa.AcumuladoDI(iCodMoeda :Integer; sNomIndex :String;
                     dDataInicial,dDtaAtual :TDateTime; fPercIndice :Double) :Real;
Var
   fValCotacao,fValAux,taxa :Double;
   dDtaIni,wDataCotacao : TDateTime;
Begin
   // Se não informou o percentual do índice , Calculo 100%
   If fPercIndice = 0 Then fPercIndice:=100;
   // Calcular apartir do próximo dia útil
   dDtaIni:=(dDataInicial+1);
   While not DiasUteisInv.DiaUtil(dDtaIni,-1,1,'',True,False,False) Do
      dDtaIni  := dDtaIni+1;   // Achar o próximo dia útil

   //dDtaIni:=DiasUteisInv.PrimeiroDiaUtilPosterior(dDataInicial,-1,-1,'',True,False,False);
   Result :=1;
   While dDtaIni <= dDtaAtual Do
   Begin
      OperComum.BuscaCotacaoMoeda(iCodMoeda,dDtaIni,'=',fValCotacao,wDataCotacao);
      If fValCotacao = 0 Then
      Begin
         MsgDlg('Cotação não encontrada '+sNomIndex+' em '+DateToStr(dDtaIni)
               ,'Mensagem do Sistema ', mtError, [mbOk], 0);
         Break;
      End;
      // Quando a data for menor que o dia 01/01/98, vamos informar a taxa over e não anual
      If fValCotacao < 8.00 Then
      Begin
         // Uso FormatFloat para arredondamento de 8 casas decimais    (Conforme CETIP)
         fValAux := StrToFloat(FormatFloat('#0.00000000',(fValCotacao*(fPercIndice/100))/3000+1));
         Result  :=StrToFloat(FormatFloat('#0.00000000',Result*fValAux));
      End
      Else
      Begin
         If sNomIndex='DI' Then
         Begin
            // Uso FormatFloat para arredondamento de 8 casas decimais  (Conforme CETIP)
            taxa:=StrToFloat(FormatFloat('#0.00000000',(Power(1+(fValCotacao/100),1/252)-1)));
            fValAux :=StrToFloat(FormatFloat('#0.0000000000000000',(taxa*(fPercIndice/100))+1));
            Result  :=(Result*fValAux);
            Result  :=StrToFloat(FormatFloat('#0.00000000',Result));
         End
         Else If sNomIndex='SELIC' Then
         Begin
            // Uso FormatFloat para arredondamento de 9 casas decimais  (Conforme REFER)
            taxa:=StrToFloat(FormatFloat('#0.000000000',(Power(1+(fValCotacao/100),1/252)-1)));
            fValAux :=StrToFloat(FormatFloat('#0.0000000000000000',(taxa*(fPercIndice/100))+1));
            Result  :=(Result*fValAux);
            Result  :=StrToFloat(FormatFloat('#0.000000000',Result));
         End;
      End;
      dDtaIni := dDtaIni+1;
      While not DiasUteisInv.DiaUtil(dDtaIni,-1,1,'',True,False,False) Do
         dDtaIni  := dDtaIni+1;   // Achar o próximo dia útil
   End;
End;

Function TFuncoesRendaFixa.ValorPU(iCodMoeda :Integer; sNomIndex :String;
                                   dDtaAtual :TDateTime; fPercIndice :Double) :Real;
Var
   fValCotacao :Double;
   wDataCotacao :TDateTime;
Begin
   OperComum.BuscaCotacaoMoeda(iCodMoeda,dDtaAtual,'<=',fValCotacao,wDataCotacao);
   If fValCotacao = 0 Then
   Begin
      MsgDlg('Cotação não encontrada '+sNomIndex+' em '+DateToStr(dDtaAtual)
            ,'Mensagem do Sistema ', mtError, [mbOk], 0);
   End;
   fValCotacao:=(fValCotacao*(fPercIndice/100));
   Result:=fValCotacao;
End;

procedure TFuncoesRendaFixa.FatorIndicadores(dDtaInicio, dtDtaFim, dtEmiTitRenFix, dtVencTitRenFix : TDateTime;
                                             sCodTrataInd, sMoeSigla   : String;
                                             iIndexRendFix, iMoeCodigo : Integer;
                                             wPercentual               : Double;
                                             bSaldoIni                 : Boolean;
                                             Var wFator                : Double);
Var
   dDataAnt, dDataFim : TDateTime;
begin

   If (sCodTrataInd <> 'MOEDA') And (sCodTrataInd <> 'DI') then
   Begin
      dDataAnt := DiasUteisInv.UltDiaUtilAnterior(dDtaInicio,-1,1,'',True,False,False);
      dDataFim := DiasUteisInv.UltDiaUtilAnterior(dtDtaFim,-1,1,'',True,False,False);
   End
   Else
   Begin
      dDataAnt := DiasUteisInv.UltDiaUtilAnterior(dDtaInicio,-1,1,'',True,False,False);
      dDataFim := dtDtaFim;
   End;

   If (sCodTrataInd = 'PU') then
      // PU Manual (Qtd X PU)
      wFator := ValorPU(iMoeCodigo,sMoeSigla,dDtaInicio,wPercentual)
   Else If (sCodTrataInd = 'TR') then
{      wFator := AcumuladoTR(dDataAtu,
                            QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                            QryLocal.FieldByName('DATAINITR').AsDateTime,
                            dDataBase,
                            QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                            QryLocal.FieldByName('PERCINDEX').asFloat,
                            QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                            bSaldoIni)  }

   Else If (sCodTrataInd = 'ANBID') then
{      wFator := AcumuladoANBID(dDataAtu,
                               QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                               dDataBase,
                               QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                               QryLocal.FieldByName('PERCINDEX').asFloat,
                               QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                               QryLocal.FieldByName('DIASPRAZOANBID').AsInteger,
                               bSaldoIni)}

   Else If sCodTrataInd = 'TJLP' then
{      wFator := AcumuladoTJLP(dDataAtu,
                              QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                              dDataBase,
                              QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                              QryLocal.FieldByName('PERCINDEX').asFloat,
                              QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                              QryLocal.FieldByName('DIASPRAZOANBID2').AsInteger,
                              bSaldoIni)}

   Else If (sCodTrataInd = 'MOEDA') then
      wFator := AcumuladoPU(dDataFim, dtEmiTitRenFix, dDtaInicio, dtVencTitRenFix,
                            wPercentual, iMoeCodigo, bSaldoIni)

   Else If ((sCodTrataInd = 'DI') Or (sCodTrataInd = 'SELIC')) Then

      wFator := AcumuladoDI(iMoeCodigo,sCodTrataInd,dDataAnt,dDataFim,wPercentual)

   Else If (sCodTrataInd = 'IGPM') Or (sCodTrataInd = 'INPC') then
{      wFator := AcumuladoIGPM(QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                              QryLocal.FieldByName('CODTRATAIND').AsString,
                              QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                              dDataBase,
                              QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                              dDataAtu,
                              QryLocal.FieldByName('PERCINDEX').AsFloat) }

   Else If sCodTrataInd = 'IGPDI' then
{      wFator := AcumuladoIGPDI(dDataAtu,
                               QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                               dDataBase,
                               QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                               QryLocal.FieldByName('PERCINDEX').asFloat,
                               QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                               bSaldoIni,iPzIGPDI,dcp,dct,bProRataIGPDI) }

   Else If (sCodTrataInd = '') And
           (iIndexRendFix > 0) Then
{      wFator := AcumuladoPUManual(dDataAtu,
                                  dDataBase,
                                  QryLocal.FieldByName('PERCINDEX').AsFloat,
                                  QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                                  QryLocal.FieldByName('FLLGPRORATA').AsString,
                                  QryLocal.FieldByName('FLGINTERPOLA').AsString) };


end;

// Função que calcula variação do IGPM para NTN-C no período
Function TFuncoesRendaFixa.AcumuladoNTNCIGPM(dDataAtu,dDataEmissao,dDataBase,dDataVencto:TDateTime;
                                         fPercentual:Double;iInvestimento,iMoeda:longint;bSaldoIni:boolean;
                                         var iPzIGPM,dcp,dct:Integer;var bProRataIGPM:Boolean;
                                         DUDC: String = 'U'):Double;
Var
   fProRata,NIn,NIe : double;
   DataIniP,DataFimP,DataIniProRata,DataFimProRata,DataFimPerProRata : TDateTime;
   iAno,iMes,iDia,iDiaIGPM,iDiaAtu : word;
Begin
   DataFimP := 0;
   NIn := 0;
   NIe := 0;
   Result := 1;
   iDiaIGPM := 1;
   bProRataIGPM := False;
   if (dDataAtu <> dDataEmissao) or (dDataAtu <= dDataVencto) then // faz correção após a compra e antes do vencto
   begin
      DecodeDate(dDataBase,iAno,iMes,iDia);
      DataIniP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);

      DecodeDate(dDataAtu,iAno,iMes,iDiaAtu);
      if iDiaAtu < 1 then  // IGPM acura C.Monetária a cada dia 1
      begin
         DecodeDate(dDataAtu,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);
         DecodeDate(DataFimP,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);
         if DataFimP <= DataIniP then
            DataFimP := DataIniP;
      end
      else
      begin
         DecodeDate(dDataAtu,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);
      end;
      iPzIGPM := DiasUteisInv.IntervaloMeses(DataIniP,DataFimP);
      OperComum.BuscaCotacaoMoeda(iMoeda,DataIniP,'',NIe,dDataBase);
      If NIe = 0 Then
         MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataIniP),'Mensagem do Sistema',
                 MtWarning,[MbOk],0);
      OperComum.BuscaCotacaoMoeda(iMoeda,DataFimP,'',NIn,dDataBase);
      If NIn = 0 Then
         MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataFimP),'Mensagem do Sistema',
                 MtWarning,[MbOk],0);
      Result := ((OperComum.DivValorZero(NIn,NIe)-1) * OperComum.DivValorZero(fPercentual, 100))+1;
      Result := StrToFloat(FormatFloat('#0.000000000',Result-0.00000000049));
      if NIn = NIe then // está em período de Pro-Rata
      begin
         iPzIGPM := 0; // Para que o fator de juros no período fique = 1
         bProRataIGPM := True;
      end;
   end;

   // Pró-Rata mês atual
   // -> VER NO FUTURO : CRIAR FLG PARA TESTAR SE IRA TER PRO-RATA NO TITULO

   NIe := 0;
   NIn := 0;
   DataIniProRata := DataFimP;
   DecodeDate(DataIniProRata,iAno,iMes,iDia);
   DataFimProRata    := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),1);
   DataFimPerProRata := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),2);

   with dtmFuncoesInvest.QryBuscaDataFluxoTitulo do
   begin
      Close;
      ParamByName('dDATAREF').AsString := DateToStr(dDataAtu);
      ParamByName('pIDINVESTIMENTO').AsInteger := iInvestimento;
      Open;

      if dDataAtu <> FieldByName('DATAFLUXO').AsDateTime then // Se igual, não deve fazer pro-rata pois é o dia de geração do FLUXO DO TITULO
      begin
         OperComum.BuscaCotacaoMoeda(iMoeda,DataIniProRata,'',NIe,dDataBase);
         If NIe = 0 Then
            MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataIniProRata),'Mensagem do Sistema',
                    MtWarning,[MbOk],0);
         OperComum.BuscaCotacaoMoeda(iMoeda,DataFimProRata,'',NIn,dDataBase);
         If NIn = 0 Then
            MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataFimProRata),'Mensagem do Sistema',
                    MtWarning,[MbOk],0);

         if DUDC = 'U' then
            dct := DiasUteisInv.IntervaloDiasUteis(DataFimProRata,DataFimPerProRata,-1,1,'',True,False,False)
         else
            dct := DiasUteisInv.IntervaloDias(DataFimProRata,DataFimPerProRata);

         if DUDC = 'U' then
         begin
            dcp := DiasUteisInv.IntervaloDiasUteis(dDataAtu,DataFimPerProRata,-1,1,'',True,False,False);
            dcp := dct - dcp;
         end
         else
            dcp := ( DiasUteisInv.IntervaloDias(DataFimProRata,DataFimPerProRata) -
                     DiasUteisInv.IntervaloDias(dDataAtu,DataFimPerProRata) );

         fProRata := ((OperComum.DivValorZero(NIn,NIe)-1)*OperComum.DivValorZero(fPercentual,100))+1;
         fProRata := Power(fProRata,OperComum.DivValorZero(dcp,dct));
         fProRata := StrToFloat(FormatFloat('#0.000000000',fProRata-0.00000000049));

         Result := Result * fProRata;
      end;
   end;
end;

function TFuncoesRendaFixa.AcumuladoNTNCIGPMDiasCorr(dDataAtu, dDataEmissao, dDataBase,
                                                     dDataVencto: TDateTime;
                                                     fPercentual: Double;
                                                     iInvestimento, iMoeda: Integer;
                                                     bSaldoIni: boolean; var iPzIGPM, dcp,
                                                     dct: Integer; var bProRataIGPM: Boolean): Double;
Var
   fProRata,NIn,NIe : double;
   DataIniP,DataFimP,DataIniProRata,DataFimProRata,DataFimPerProRata : TDateTime;
   iAno,iMes,iDia,iDiaIGPM,iDiaAtu : word;
Begin
   DataFimP := 0;
   DataIniP := 0;
   NIn := 0;
   NIe := 0;
   Result := 1;
   iDiaIGPM := 1;
   bProRataIGPM := False;
   if (dDataAtu <> dDataEmissao) or (dDataAtu <= dDataVencto) then // faz correção após a compra e antes do vencto
   begin
      DecodeDate(dDataBase,iAno,iMes,iDia);
      DataIniP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);

      DecodeDate(dDataAtu,iAno,iMes,iDiaAtu);
      if iDiaAtu < 1 then  // IGPM apura C.Monetária a cada dia 1
      begin
         DecodeDate(dDataAtu,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);
         DecodeDate(DataFimP,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);
         if DataFimP <= DataIniP then
            DataFimP := DataIniP;
      end
      else
      begin
         DecodeDate(dDataAtu,iAno,iMes,iDia);
         DataFimP := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),-1);
      end;
      iPzIGPM := DiasUteisInv.IntervaloMeses(DataIniP,DataFimP);
      OperComum.BuscaCotacaoMoeda(iMoeda,DataIniP,'',NIe,dDataBase);
      If NIe = 0 Then
         MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataIniP),'Mensagem do Sistema',
                 MtWarning,[MbOk],0);
      OperComum.BuscaCotacaoMoeda(iMoeda,DataFimP,'',NIn,dDataBase);
      If NIn = 0 Then
         MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataFimP),'Mensagem do Sistema',
                 MtWarning,[MbOk],0);
      Result := ((OperComum.DivValorZero(NIn,NIe)-1) * OperComum.DivValorZero(fPercentual, 100))+1;
      Result := StrToFloat(FormatFloat('#0.00000000',Result-0.0000000049));
      if NIn = NIe then // está em período de Pro-Rata
      begin
         iPzIGPM := 0; // Para que o fator de juros no período fique = 1
         bProRataIGPM := True;
      end;
   end;

   // Pró-Rata mês atual
   // -> VER NO FUTURO : CRIAR FLG PARA TESTAR SE IRA TER PRO-RATA NO TITULO

   NIe := 0;
   NIn := 0;
   DataIniProRata := DataFimP;
   DecodeDate(DataIniProRata,iAno,iMes,iDia);
   DataFimProRata    := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),1);
   DataFimPerProRata := DiasUteisInv.SomaMeses(EncodeDate(iAno,iMes,iDiaIGPM),2);

   with dtmFuncoesInvest.QryBuscaDataFluxoTitulo do
   begin
      Close;
      ParamByName('dDATAREF').AsString := DateToStr(dDataAtu);
      ParamByName('pIDINVESTIMENTO').AsInteger := iInvestimento;
      Open;

      if dDataAtu <> FieldByName('DATAFLUXO').AsDateTime then // Se igual, não deve fazer pro-rata pois é o dia de geração do FLUXO DO TITULO
      begin
         OperComum.BuscaCotacaoMoeda(iMoeda,DataIniProRata,'',NIe,dDataBase);
         If NIe = 0 Then
            MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataIniProRata),'Mensagem do Sistema',
                    MtWarning,[MbOk],0);

         OperComum.BuscaCotacaoMoeda(iMoeda,DataFimProRata,'',NIn,dDataBase);
         If NIn = 0 Then
            MsgDlg('Verifique: IGPM = 0,00 para esta data : '+DateToStr(DataFimProRata),'Mensagem do Sistema',
                    MtWarning,[MbOk],0);

         dct := DiasUteisInv.IntervaloDiasUteis(DataIniP,DataFimP,-1,1,'',True,False,False);

         dct := DiasUteisInv.IntervaloDiasUteis(DataFimProRata,DataFimPerProRata,-1,1,'',True,False,False);

         dcp := DiasUteisInv.IntervaloDiasUteis(dDataAtu,DataFimPerProRata,-1,1,'',True,False,False);
         dcp := dct - dcp;

         fProRata := ((OperComum.DivValorZero(NIn,NIe)-1)*OperComum.DivValorZero(fPercentual,100))+1;
         fProRata := Power(fProRata,OperComum.DivValorZero(dcp,dct));
         fProRata := StrToFloat(FormatFloat('#0.00000000',fProRata-0.0000000049));

         Result := Result * fProRata;
      end;
   end;
end;

function TFuncoesRendaFixa.AcumulaJurosNTNC(dDataAtu, dDataVenc, dDataEmissao: TDateTime; fTaxaJuros: Double; DUDC: String): Double;
var
   dDataIniP, dDataFimP, DataIniProRata, dDataTemp : TDateTime;
   dup, dut, nMeses: Integer;
   fFatInt, fFatPro, fFatTot: Double;
   iAno, iMes, iDia: word;

begin
   dDataIniP := dDataVenc;
   repeat
      dDataIniP := DiasUteisInv.SomaMeses(dDataIniP,-6);
   until dDataIniP < dDataAtu;

   if dDataEmissao > dDataIniP then
      dDataIniP := dDataEmissao;

   // Numero de Meses entre o Ultimo Pag. Juros e a data de Processamento
//   nMeses := DiasUteisInv.MesesEntre(dDataIniP, dDataAtu);

   nMeses := 0;
   repeat
      Inc(nMeses);
      dDataTemp := DiasUteisInv.SomaMeses(dDataIniP,nMeses);
   until dDataTemp >= dDataAtu;
   Dec(nMeses);

   // Capta o Fator Cheio arredondado em 8 casas decimais
   fFatInt := OperComum.Round(Power((fTaxaJuros/100)+1,(nMeses/12)),8);

   // Monta Data Inicio do ProRata
   DataIniProRata := DiasUteisInv.SomaMeses(dDataIniP,nMeses);

   // Capta Numero de Dias para o ProRata
   if DUDC = 'U' then
   begin
      // Dias Uteis
      dup := DiasUteisInv.IntervaloDiasUteis(DataIniProRata, dDataAtu,-1,1,'',True,False,False);
      dDataFimP := DiasUteisInv.SomaMeses(DataIniProRata,1);
      DecodeDate(dDataFimP, iAno, iMes, iDia);
      dDataFimP := EncodeDate(iAno, iMes, 1);
      dut := DiasUteisInv.IntervaloDiasUteis(DataIniProRata, dDataFimP,-1,1,'',True,False,False);
   end
   else
   begin
      // Dias Corridos
      dup := DiasUteisInv.IntervaloDias(DataIniProRata, dDataAtu);
      dDataFimP := DiasUteisInv.SomaMeses(DataIniProRata,1);
      DecodeDate(dDataFimP, iAno, iMes, iDia);
      dDataFimP := EncodeDate(iAno, iMes, 1);
      dut := DiasUteisInv.IntervaloDias(DataIniProRata, dDataFimP);
   end;

   // Capta o Fator ProRata arredondado em 8 casas decimais
   fFatPro := OperComum.Round(Power((fTaxaJuros/100)+1,((1/12)*(OperComum.DivValorZero(dup, dut)))),8);

   // Capta o Fator Total arredondado em 8 casas decimais
   fFatTot := OperComum.Round((fFatInt * fFatPro), 8);

   Result := StrToFloat(FormatFloat('#0.00000000',fFatTot))
end;

procedure TFuncoesRendaFixa.BuscaPrazosCouponNTNC(dDataAtu,dDataVenc,dDataEmissao:TDateTime; var dup,dut : Integer; DUDC: String = 'U');
var
   dDataIniP,dDataFimP : TDateTime;
begin
   dDataIniP := dDataVenc;
   repeat
      dDataFimP := dDataIniP;
      dDataIniP := DiasUteisInv.SomaMeses(dDataIniP,-6);
   until dDataIniP < dDataAtu;

   if dDataEmissao > dDataIniP then
      dDataIniP := dDataEmissao;

   if DUDC = 'U' then
   begin
      // Dias Uteis
      dup := DiasUteisInv.IntervaloDiasUteis(dDataIniP,dDataAtu,-1,1,'',True,False,False);
      dut := DiasUteisInv.IntervaloDiasUteis(dDataIniP,dDataFimP,-1,1,'',True,False,False);
   end
   else
   begin
      // Dias Corridos
      dup := DiasUteisInv.IntervaloDias(dDataIniP,dDataAtu);
      dut := DiasUteisInv.IntervaloDias(dDataIniP,dDataFimP);
   end;
end;

end.
