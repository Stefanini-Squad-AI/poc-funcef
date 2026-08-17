unit UModulo;

interface

uses graphics, SysUtils, uMensErro, Dialogs, dBaseDados, uDataBase;

type TModulo = Class
   private
          FLinhaAcima,FLinhaAbaixo,FSiglaMoedaCorr  : string;
          FExcluiuBloqueados : Boolean;
   public
         sMascaraContas : string;
         sMascaraCCusto : string;
         sMascaraUnidNegoc : string;
         clCorMestre : string;
         clCorMestreEsp : TColor;
         iUnidGlobal : integer;
         iExercicioAtual : integer;
         iPlano : integer;
         property bExcluiuBloqueados : Boolean read FExcluiuBloqueados write FExcluiuBloqueados;
         property sLinhaAcima   : String read FLinhaAcima write FLinhaAcima;
         property sLinhaAbaixo  : String read FLinhaAbaixo write FLinhaAbaixo;
         property sSiglaMoedaCorr : String read FSiglaMoedaCorr write FSiglaMoedaCorr;
         function TestaNatureza(sDemNat, sFlagNat:string; rVal:double):boolean;
        { function TestaPeriodo( bMostramsg : boolean; sDataBase : string;
                                sDataLanc : string; cSistOri  : string;
                                var liExercicio, liPeriodo, liEmpresa : LongInt;
                                var sMensagem : String ): Boolean; }
   end;

var Modulo : TModulo;

implementation

                 {
function TModulo.TestaPeriodo( bMostramsg : boolean;
                       sDataBase : string;
                       sDataLanc : string;
                       cSistOri  : string;
                   var liExercicio,
                       liPeriodo,
                       liEmpresa : LongInt; var sMensagem : String ): Boolean;
Begin
   Result      := true;
   sMensagem   := '';
   with dtmDemonstrativo.qryTestaPer do begin
      Close;
      if not Prepared then Prepare;
      ParamByName('IDPESSOA').AsInteger  := liEmpresa;
      ParamByName('DATALANC').AsDateTime := StrToDate(sDataLanc);
      Open;
      if isEmpty then begin
         Result    := false;
         sMensagem :='A Data ' + sDataLanc + ' não pertence a nenhum período cadastrado.';
         if bMostramsg then
            MsgDlg(sMensagem,'Aviso',mtWarning,[mbOk],0);
         exit;
      end;
      if dtmDemonstrativo.qryTestaPer.RecordCount > 1 then begin
         Result    := false;
         sMensagem :='A Data ' + sDataLanc + ' pertence a mais de um período. Verifique.';
         if bMostramsg then
            MsgDlg(sMensagem,'Aviso',mtWarning,[mbOk],0);
         exit;
      end;
      liExercicio := FieldByName('PEREXERCICIO').AsInteger;
      liPeriodo   := FieldByName('PERNUMERO').AsInteger;
      Close;
   end;
end;
          }
function TModulo.TestaNatureza(sDemNat, sFlagNat:string; rVal:double):boolean;
begin
   if ((sDemNat = 'C') and
      (sFlagNat = 'C') and
      (rVal < 0)) or
      ((sDemNat = 'D') and
      (sFlagNat = 'D') and
      (rVal < 0)) or
      ((sDemNat = 'C') and
      (sFlagNat = 'D') and
      (rVal > 0)) or
      ((sDemNat = 'D') and
      (sFlagNat = 'C') and
      (rVal > 0)) then begin
      Result := true;
   end else begin
      Result := false;
   end;
end;

end.
