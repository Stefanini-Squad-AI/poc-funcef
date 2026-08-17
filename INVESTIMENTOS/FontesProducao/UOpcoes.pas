unit UOpcoes;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls, ComCtrls;

Type
   TOpcoes = Class(TObject)
   private

   public
      function BuscaSaldosOpcoes(dDataRef:TDateTime;iInvestimento,
                                 iCarteira,iPlanPrevCtbPatro : Integer;
                                 sLote : String):boolean;

      function VerificaVenctoOpcao(iInvestimento:Integer;dDataRef:TDateTime;
                                   bOper:boolean):boolean;

      function GeraReversaoOpcoes(dDataRef : TDateTime;iInvestimento,iEmissor,
                                  iCarteira,iPlanPrevCtbPatro : Integer;
                                  fQtdOper:Double;
                                  bOper:boolean;
                                  sLote:String):boolean;

      function GeraNumBoleta(dDataRef : TDatetime):String;

      function GravaOrdMovInv(sBoleta:String;dDataRef:TDateTime;
                              fPUOper,fQtdOper:Double):boolean;

      function GravaOperacaoInvest(iIdOperacaoInvest,iIdCorretValores:integer;
                                   dDataRef:TDateTime;
                                   fVlrOper,fQtdOper:Double;
                                   sBoleta,sLote:String):boolean;

      function GravaOpracao(iIdOperacaoInvest:Integer):boolean;

      function GravaBoleta(iIdCorretValores:Integer;
                           sBoleta:string; dDataRef : TDatetime):boolean;

      function ExluiReversaoOpcoes(dDataRef : TDateTime):Boolean;

   end;

var
  Opcoes : TOpcoes;
  iIdOperacaoInvest : Integer;

implementation

uses UOperComum, dOpcoes,DBaseDados, UDatabase,USistema, UBibliotecaInvest,
     UMensErro, UOperacaoInvest, dOperComum;

function TOpcoes.BuscaSaldosOpcoes(dDataRef:TDateTime;iInvestimento,
                                   iCarteira, iPlanPrevCtbPatro : Integer;
                                   sLote : String):boolean;
begin
   Result := False;
   OperComum.LimpaParametros(DMOpcoes.qryBuscaSaldosOpcoes);
   DMOpcoes.qryBuscaSaldosOpcoes.ParamByName('DDATAREF').AsString              := DateToStr(dDataRef);
   if iCarteira <> -1 then
      DMOpcoes.qryBuscaSaldosOpcoes.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteira;
   if iInvestimento <> -1 then
      DMOpcoes.qryBuscaSaldosOpcoes.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
   if Trim(sLote) <> '' then
      DMOpcoes.qryBuscaSaldosOpcoes.ParamByName('IDLOTE').AsString             := sLote;
   if iPlanPrevCtbPatro <> -1 then
      DMOpcoes.qryBuscaSaldosOpcoes.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   DMOpcoes.qryBuscaSaldosOpcoes.Open;

   if DMOpcoes.qryBuscaSaldosOpcoes.IsEmpty then
      Result := False;
end;

function TOpcoes.VerificaVenctoOpcao(iInvestimento:Integer;dDataRef:TDateTime;
                                     bOper:boolean):boolean;
begin
   Result := True;
   with DMOpcoes.qryVerificaVenctoOpcao do
   begin
      OperComum.LimpaParametros(DMOpcoes.qryVerificaVenctoOpcao);
      ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      ParamByName('DDATAREF').AsString := DateToStr(dDataRef);
      Open;
      if IsEmpty then
         Result := False
      else
      begin
         // Se bOper = False -> Vem do Fechamento Diário então, somente
         // será válido se for o dia do Vencimento da Opção
         if not bOper then
         begin
            if dDataRef <> DMOpcoes.qryVerificaVenctoOpcao.FieldByName('DTAVENCTO').AsDateTime then
               Result := False;
         end;
      end;
   end;
end;

function TOpcoes.GeraReversaoOpcoes(dDataRef : TDateTime;iInvestimento,iEmissor,
                                    iCarteira,iPlanPrevCtbPatro : Integer; fQtdOper:Double;
                                    bOper:boolean;
                                    sLote:String):boolean;
var
   sFlgCustodia,sBoleta,sNaturMov, sNaturOper : String;
   iIdHistCartInv , iIdCorretValores :Integer;
   fVlrOperOpc, fPuOperOpc, fQtdoperOpc : Double;

begin
   Result := True;

   // Exclui registro se já houver sido lançado (Reprocessamento)
   if not ExluiReversaoOpcoes(dDataRef) then
      Raise Exception.Create('Ocorreu um Erro ao Excluir a Baixa de Opções.');

   BuscaSaldosOpcoes(dDataRef,iInvestimento,iCarteira,iPlanPrevCtbPatro,sLote);

   while not DMOpcoes.qryBuscaSaldosOpcoes.EOF do
   begin
      if not VerificaVenctoOpcao(DMOpcoes.qryBuscaSaldosOpcoesIDINVESTIMENTO.AsInteger,
                                 dDataRef,bOper) then
      begin
         DMOpcoes.qryBuscaSaldosOpcoes.Next;
         Continue;
      end
      else
      begin
         // VER O PROCESSAMENTO COM a CARTEIRA GERENCIAL.DEVE VIR NA QRY BUSCA SALDO

         // Busca a Corretora do Lote
         sLote   := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDLOTE').AsString;

         OperComum.LimpaParametros(DMOpcoes.qryCorretoraXLote);
         DMOpcoes.qryCorretoraXLote.ParamByName('IDLOTE').AsString := sLote;
         DMOpcoes.qryCorretoraXLote.Open;
         if not DMOpcoes.qryCorretoraXLote.IsEmpty then
            iIdCorretValores := DMOpcoes.qryCorretoraXLote.FieldByName('IDCORRETVALORES').AsInteger
         else
            iIdCorretValores := -1;

         // Gera o Nr. da Boleta
         sBoleta := GeraNumBoleta(dDataRef);

         // Transfere Para Carteira 'a Vista as Baixas de Venda de Opção de Compra
         if not OperComum.TransfEntreCarteiras(
                             DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAINVEST').AsInteger,
                             pRPI.IDCARTOPC,pRPI.IDCARTAVISTA,
                             DMOpcoes.qryBuscaSaldosOpcoesIDINVESTBASE.AsInteger,
                             DMOpcoes.qryCorretoraXLote.FieldByName('IDCUSTODIANTE').AsInteger,
                             DMOpcoes.qryCorretoraXLote.FieldByName('IDCUSTODIANTE').AsInteger,
                             pRPI.IDMOTBLOQOPC,-1,3,1,
                             DMOpcoes.qryCorretoraXLote.FieldByName('IDCORRETVALORES').AsInteger,
                             Abs(DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat),
                             Abs(DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat),
                             dDataRef,False,sLote,
                             sBoleta,iIdHistCartInv) then
            Raise Exception.Create('Não foi possível fazer a Transferência para'+#13+
                                   'a Carteira de Opções.');

         if DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat > 0 then // Está Comprado a baixa deve ser o oposto
         begin
            sNaturMov  := 'O';
            sNaturOper := 'O';
         end
         else
         begin
            sNaturMov  := 'U';
            sNaturOper := 'U';
         end;

         fQtdOperOpc := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat * -1;
         fVlrOperOpc := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOVLRINVCART').AsFloat * -1;

         // Grava OPERACAOINVEST
         iIdOperacaoInvest := LeUltRegistro(nil, 'OPERACAOINVEST');
         if not GravaOperacaoInvest(iIdOperacaoInvest,
                                    iIdCorretValores,
                                    dDataRef,fVlrOperOpc,fQtdOperOpc,
                                    sBoleta,sLote) then
            Raise Exception.Create('Ocorreu um Erro ao Gravar a Operação.');

         // Grava OPRACAO
         if not GravaOpracao(iIdOperacaoInvest) then
            Raise Exception.Create('Ocorreu um Erro ao Gravar a Operação.');

         // Pesquisa se Boleta ja tem Registro na Tabela de Boletas
         OperComum.LimpaParametros(dtmOperComum.QryBoleta);
         dtmOperComum.QryBoleta.ParamByName('IDBOLETA').AsString := sBoleta;
         dtmOperComum.QryBoleta.Open;
         // Caso não tenha, cria um registro
         if dtmOperComum.QryBoleta.IsEmpty Then
         begin
            // Grava BOLETA
            if not GravaBoleta(iIdCorretValores,
                               sBoleta,dDataRef) then
               Raise Exception.Create('Ocorreu um Erro ao Gravar a Boleta.');
         end;
         
         if DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 then
            sFlgCustodia := ''
         else
            sFlgCustodia := '1';

         // Alimenta Carteira
         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDINVESTIMENTO').AsInteger,
                                           2, iIdOperacaoInvest, -1, -69,
                                           DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           -1, -1, -1, -1, -1,dDataRef, fVlrOperOpc,fQtdOperOpc,
                                           pRPI.VLRCOTAINICART, 0, 0, 0, 0, 0, 0, 0, 0, 0,sNaturMov, sNaturOper,
                                           DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDLOTE').AsString,
                                           DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('DESCINVESTIMENTO').AsString,'OPE',
                                           sFlgCustodia, '', True,
                                           iIdCorretValores,
                                           DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                           iIdHistCartInv) then
            Raise Exception.Create('Ocorreu um Erro ao Alimentar Carteira.');

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
             Raise Exception.Create('Ocorreu um Erro ao Atualizar os Saldos da Carteira.');

         DMOpcoes.qryVerificaVenctoOpcao.Close;
         DMOpcoes.qryBuscaSaldosOpcoes.Next;
      end;
   end;
   DMOpcoes.qryBuscaSaldosOpcoes.Close;
   DMOpcoes.qryCorretoraXLote.Close;
end;

function TOpcoes.GravaOrdMovInv(sBoleta:String;dDataRef:TDateTime;
                                fPUOper,fQtdOper:Double):boolean;
begin
   Result := True;
   with DMOpcoes.qryInsOrdMovInv do
   begin
      Try
         OperComum.LimpaParametros(DMOpcoes.qryInsOrdMovInv);
         ParamByName('IDORDMOVINV').AsInteger       := LeUltRegistro(nil, 'ORDMOVINV');
         ParamByName('IDCORRETVALORES').AsInteger   := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCORRETVALORES').AsInteger;
         ParamByName('IDINVESTIMENTO').AsInteger    := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDINVESTIMENTO').AsInteger;
         ParamByName('PUORDMOVINV').AsFloat         := fPUOper;
         ParamByName('OBSMOVINV').AsString          := '';
         ParamByName('DATAORDMOVINV').AsString      := DateToStr(dDataRef);
         ParamByName('QTDEORDMOVINV').AsFloat       := fQtdOper;
         ParamByName('NUMDOCMOVINV').AsString       := sBoleta;
         ParamByName('STATMOVINV').AsString         := 'L';
         ParamByName('IDUSUARIO').AsInteger         := Sistema.IdUsuario;
         ParamByName('IDTIPOINVEST').AsInteger      := 2;
         ParamByName('IDTIPOOPERACAO').AsInteger    := -1;
         ParamByName('OBSAUTMOV').AsString          := '';
         ParamByName('IDCARTEIRAINVEST').AsInteger  := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAINVEST').AsInteger;
         if DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAGERENC').IsNull then
            ParamByName('IDCARTEIRAGERENC').Clear
         else
            ParamByName('IDCARTEIRAGERENC').AsInteger  := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAGERENC').AsInteger;
         ParamByName('IDLOTE').AsString             := '';
         ParamByName('IDBOLSAVALORES').AsInteger    := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDBOLSAVALORES').AsInteger;
         ParamByName('QTDEORDENADA').AsFloat        := fQtdOper;
         ParamByName('IDPLANPREVCTBPATR').AsInteger := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDPLANPREVCTBPATR').AsInteger;
         ExecSQL;
         Close;
      except
         Result := False;
      end;
   end;
end;

function TOpcoes.GeraNumBoleta(dDataRef : TDatetime):String;
begin
   Result :=  'RV-'+Copy(DateToStr(dDataRef),9,2)+'/'+FormatFloat('0000',
              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(dDataRef),9,2)));
end;


function TOpcoes.GravaOperacaoInvest(iIdOperacaoInvest, iIdCorretValores :integer;
                                     dDataRef:TDateTime;
                                     fVlrOper,fQtdOper:Double;
                                     sBoleta,sLote:String):boolean;
begin
   Result := True;
   Try
      with DMOpcoes.QryInsOperacaoInvest do
      begin
         OperComum.LimpaParametros(DMOpcoes.QryInsOperacaoInvest);
//         Close;
         ParamByName('IDOPERACAOINVEST').AsInteger := iIdOperacaoInvest;
         if iIdCorretValores <> -1 then
            ParamByName('IDCORRETVALORES').AsInteger  := iIdCorretValores;
         ParamByName('MOECODIGO').AsInteger        := pRPI.MOECODIGO;
         ParamByName('IDMODULO').AsInteger         := Sistema.IdModulo;
         ParamByName('EMPRESAPROP').AsInteger      := Sistema.IdEmpresa;
         ParamByName('IDINVESTIMENTO').AsInteger   := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDINVESTIMENTO').AsInteger;
         ParamByName('IDCARTEIRAINVEST').AsInteger := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAINVEST').AsInteger;
         if not DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAGERENC').IsNull then
            ParamByName('IDCARTEIRAGERENC').AsInteger  := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDCARTEIRAGERENC').AsInteger;
         ParamByName('IDTIPOINVEST').AsInteger     := 2;
         ParamByName('IDTIPOOPERACAO').AsInteger   := -69;
         ParamByName('DATAOPERACAO').AsDateTime    := dDataRef;
         ParamByName('NUMDOCUMENTO').AsString      := sBoleta;
         ParamByName('QTDEOPERACAO').AsFloat       := fQtdOper;
         ParamByName('PRECOUNITOPERACAO').AsFloat  := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('VLRPRECOEX').AsFloat;
         ParamByName('VLROPERACAO').AsFloat        := fVlrOper;
         ParamByName('DATAVENCOPER').AsDateTime    := dDataRef;
         if iIdCorretValores <> -1 then
            ParamByName('IDFORCLI').AsInteger      := iIdCorretValores;
         ParamByName('IDLOTE').AsString            := sLote;
         ParamByName('IDCUSTODIANTE').Clear;
         ParamByName('VLRIR').AsFloat              := 0;
         ParamByName('FLGSTATUSFECHBOL').AsString  := 'F';
         ParamByName('FLGSTATUSORDMOV').AsString   := 'L';
         ParamByName('IDPLANPREVCTBPATR').AsInteger := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDPLANPREVCTBPATR').AsInteger;

         if not(Prepared) then Prepare;
         ExecSQL;
         Close;
      end;
   except
      Result := False;
   end;
end;

function TOpcoes.GravaOpracao(iIdOperacaoInvest:Integer):boolean;
begin
   Result := True;
   Try
      with DMOpcoes.QryInsOpracao do
      begin
         OperComum.LimpaParametros(DMOpcoes.QryInsOpracao);
         ParamByName('IDOPERACAOINVEST').AsInteger := iIdOperacaoInvest;
         ParamByName('IDBOLSAVALORES').AsInteger   := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDBOLSAVALORES').AsInteger;
         ParamByName('IDACAO').AsInteger           := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDINVESTIMENTO').AsInteger;
         ParamByName('IDEMISSOR').AsInteger        := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('IDEMISSOR').AsInteger;
         ExecSQL;
         Close;
      end;
   except
      Result := False;
   end;
end;

function TOpcoes.GravaBoleta(iIdCorretValores:Integer;
                             sBoleta:string; dDataRef : TDatetime):boolean;
begin
   Result := True;
   Try
      with DMOpcoes.QryInsBoleta do
      begin
         OperComum.LimpaParametros(DMOpcoes.QryInsBoleta);
         ParamByName('IDBOLETA').AsString     := SBoleta;
         ParamByName('DATABOLETA').AsDateTime := dDataRef;
         ParamByName('STATUS').AsString       := 'F';
         if iIdCorretValores <> -1 then
            ParamByName('IDFORCLI').AsInteger   := iIdCorretValores;
         ExecSQL;
         Close;
      end;
   except
      Result := False;
   end;
end;

function TOpcoes.ExluiReversaoOpcoes(dDataRef : TDateTime):Boolean;
begin
   Result := True;
   try
      OperComum.LimpaParametros(DMOpcoes.qryBuscaBaixaOpc);
      with DMOpcoes.qryBuscaBaixaOpc do
      begin
         ParamByName('DDATAREF').AsString := DateToStr(dDataRef);
         Open;
         while not DMOpcoes.qryBuscaBaixaOpc.EOF do
         begin
            with DMOpcoes.qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDOPERACAOINVEST = ' +
                               DMOpcoes.qryBuscaBaixaOpc.FieldByName('IDOPERACAOINVEST').AsString;
               ExecSQL;
               Close;
            end;
            with DMOpcoes.qryAux do begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM OPERACAOINVEST WHERE IDOPERACAOINVEST = ' +
                               DMOpcoes.qryBuscaBaixaOpc.FieldByName('IDOPERACAOINVEST').AsString;
               ExecSQL;
               Close;
            end;
            // OprAcao
            with DMOpcoes.qryAux do begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM OPRACAO WHERE IDOPERACAOINVEST = ' +
                               DMOpcoes.qryBuscaBaixaOpc.FieldByName('IDOPERACAOINVEST').AsString;
               ExecSQL;
               Close;
            end;
            // Boleta
            with DMOpcoes.qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM BOLETA WHERE IDBOLETA = ' +
                               QuotedStr(DMOpcoes.qryBuscaBaixaOpc.FieldByName('NUMDOCUMENTO').AsString);
               ExecSQL;
               Close;
            end;

            Next;
         end;
      end;
   except
      Result := False;
   end;
   DMOpcoes.qryBuscaBaixaOpc.Close;
end;

end.
