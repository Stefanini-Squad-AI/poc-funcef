unit UModulo;

interface

type TModulo = Class
   private
          FExemplo : string;

   public
         iPlano,iHotel:Integer;
         sConfirmaRecPag,sMascDocFis,sMascDocJur,sisrecpag,sLancFinanc,sEstorna,ObrigaAbc,ObrigaCrespon,sMascaraDesemb,sPRO,sPrazoFluxoOrc,sNaoIdent,sMascaraPlano,sIntegraContab:String;
         bTipoOper:Boolean;
         property Exemplo : string read FExemplo write FExemplo;
         function Arredonda(rValor:Real;iNumDecimais: Integer):Real;
         function CalcValorPrev(bCalcVP,bMostraMensagem : Boolean;sAplicRegateJuros : String; rNumCotas, rJurosPrev, rPrazoResgate, rValor, rPercCustoAplic, rPercCustoResg : Double;
                                dDataResgate, dDataLanc : TDateTime; iMoedaCota : LongInt;
                                var rValorResgate, rValorRendimento, rValorCustoAplic, rValorCustoResgate, rValorCotas : Double) : Boolean;
   end;

var Modulo : TModulo;

implementation

Uses Math, SysUtils, uFuncaoGeral, uMensErro, Dialogs;

function TModulo.Arredonda(rValor:Real;iNumDecimais: Integer):Real;
Var
  sMascara, sAuxValor:String;
Begin
   If iNumDecimais < 0 then
      sMascara := '%17.0f'
   Else
      sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

   sAuxValor := trim(Format(sMascara,[rValor]));

   While Pos('.',sAuxValor) <> 0 Do
      Delete(sAuxValor,Pos('.',sAuxValor),1);

   Result := StrToFloat(sAuxValor)
End;

function TModulo.CalcValorPrev(bCalcVP,bMostraMensagem : Boolean;sAplicRegateJuros : String; rNumCotas, rJurosPrev, rPrazoResgate, rValor, rPercCustoAplic, rPercCustoResg : Double;
                                dDataResgate, dDataLanc : TDateTime; iMoedaCota : LongInt;
                                var rValorResgate, rValorRendimento, rValorCustoAplic, rValorCustoResgate, rValorCotas : Double) : Boolean;
var rPrazo, rValorBase, rValorCotacao : Double;
begin
  Result := true;
  if sAplicRegateJuros = 'A' then
   begin
      if bMostraMensagem and (dDataResgate <= dDataLanc) then
       begin
          MsgDlg('Data Prevista de Resgate não pode ser Menor ou Igual a data da Aplicação','Erro',mtError,[mbOk],0);
          rValorResgate      := 0;
          rValorRendimento   := 0;
          rValorCustoAplic   := 0;
          rValorCustoResgate := 0;
          Result := false;
       end;
      //
      if rPrazoResgate <> 0 then
         rPrazo := (dDataResgate - dDataLanc) / rPrazoResgate
      else
         rPrazo := 0;

      if iMoedaCota = 0 then
       begin
          rValorBase := rValor;
       end
      else
       begin
          if rNumCotas = 0 then
           begin
              rValorCotacao := FuncaoGeral.TestaCotacaoMoeda(iMoedaCota,DateToStr(dDataLanc),'N');
              rNumCotas     := rValor / rValorCotacao;
              rValorCotacao := FuncaoGeral.TestaCotacaoMoeda(iMoedaCota,DateToStr(dDataResgate),'N');
              rValorBase    := rNumCotas * rValorCotacao;
           end
          else
           begin
              rValorCotacao := FuncaoGeral.TestaCotacaoMoeda(iMoedaCota,DateToStr(dDataResgate),'N');
              rValorBase    := rNumCotas * rValorCotacao;
           end;
       end;

      if bCalcVP then
       begin
          rValorResgate          := Arredonda(rValorBase/Power((1+(rJurosPrev/100)),rPrazo),2);
          rValorRendimento       := rValor - rValorResgate;
          rValorCustoAplic       := Arredonda((rValorResgate* (rPercCustoAplic/100)),2);
          rValorCustoResgate     := Arredonda((rValorRendimento * (rPercCustoResg/100)),2);
          rValorResgate          := rValor - rValorCustoResgate;
       end
      else
       begin
          rValorResgate          := Arredonda(rValorBase*Power((1+(rJurosPrev/100)),rPrazo),2);
          rValorRendimento       := rValorResgate - rValor;
          rValorCustoAplic       := Arredonda((rValor* (rPercCustoAplic/100)),2);
          rValorCustoResgate     := Arredonda((rValorRendimento * (rPercCustoResg/100)),2);
          rValorResgate          := rValorResgate - rValorCustoResgate;
       end;
      rValorCotas            := rNumCotas;
   end;
end;

end.
