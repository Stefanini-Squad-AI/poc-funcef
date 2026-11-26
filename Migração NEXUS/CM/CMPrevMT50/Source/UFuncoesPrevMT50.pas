unit UFuncoesPrevMT50;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables, BDE, checklst, uCMClientDataSet, uCmControlObject, Math;


  Function GravaLogOperacao  (TextoOperacao : String): Boolean;

  Function Trunca            ( pdValor: Double; piDecimais: Integer ): Double;
  
  { Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle }
  Function OraNumero         (sNumero : String): String;
  Function ClienteNumero     (sNumero : String): String;

  { Rotinas para tratamento de datas }                            
  Function RetornaAnoMesAnterior    ( psAnoMes : String;
                                      pbIncluiAbono : Boolean = False ) : String;
implementation

Uses
  DBaseDados, USistema, UMensErro, UDataBase, uCtrlPadroes;

{------------------------------------------------------------------------------}
{ Grava o log de uma operação feita no Sistema                                 }
Function GravaLogOperacao (TextoOperacao : String): Boolean;
Begin
  { Grava Log da operação - 19/12/2002 }
  Result := Padroes.GravaLogOperacoes(Sistema.idEmpresa,Sistema.idModulo,
                                      Sistema.idUsuario,
                                      TextoOperacao,False);
End;

function OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin

  if Trim(sNumero)  = '' then begin
    Result := '0';
    exit;
  end;

  sOra := '';
  bPrimPonto := False;
  For i := length(Trim(sNumero)) downto 1 do begin
    if (sNumero[i] = ',') or (sNumero[i] = '@') then begin
      if sNumero[i] = '@' then
        DecimalSeparator := ',';

      if not bPrimPonto then begin
        sOra := sOra + '.';
        bPrimPonto := True;
      end else
        sOra := sOra;
    end else begin
      if sNumero[i] <> '.' then
        sOra := sOra + sNumero[i]
      else begin
        if not bPrimPonto then begin
          sOra := sOra+'.';
          bPrimPonto := True;
        end else
          sOra := sOra;
      end;
    end;
  end;

  sResult := '';

  for i := length(sOra) downto 1 do begin
    sResult := sResult + sOra[i];
  end;

  Result := sResult;
   
end;

function ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
  if Trim(sNumero)  = '' then begin
    Result := '0';
    exit;
  end;

  sCliente := '';
  bPrimPonto := False;

  For i := length(Trim(sNumero)) downto 1 do begin
    if sNumero[i] = '.' then begin
      if not bPrimPonto then begin
        sCliente := sCliente + DecimalSeparator;
        bPrimPonto := True;
      end else
        sCliente := sCliente;
    end else begin
      if sNumero[i] <> DecimalSeparator then
        sCliente := sCliente + sNumero[i]
      else begin
        if not bPrimPonto then begin
          sCliente := sCliente+DecimalSeparator;
          bPrimPonto := True;
        end else
          sCliente := sCliente;
      end;
    end;

  End; { For i := length(Trim(sNumero)) downto 1 do begin }

   sResult := '';

   For i := length(sCliente) downto 1 do begin
     sResult := sResult + sCliente[i];
   end;

   Result := sResult;

end;

Function RetornaAnoMesAnterior( psAnoMes : String;
                                pbIncluiAbono : Boolean = False ) : String;
Var
  iAno, iMes : Integer;
Begin
  Result := '';

  iAno := StrToInt( Copy( psAnoMes, 1, 4 ) );
  iMes := StrToInt( Copy( psAnoMes, 6, 2 ) );

  If iMes = 1 Then
  Begin

    psAnoMes := IntToStr( iAno-1 )+'/';

    If ( pbIncluiAbono = True )
    Then psAnoMes := psAnoMes + '13'
    Else psAnoMes := psAnoMes + '12';

  End
  Else
  Begin

    psAnoMes := IntToStr(iAno)+'/';
    iMes := iMes - 1;

    If iMes <= 9
    Then psAnoMes := psAnoMes + '0'+ IntToStr( iMes )
    Else psAnoMes := psAnoMes + IntToStr( iMes );

  End;

  Result := psAnoMes;

End;

Function Trunca(pdValor: Double; piDecimais: Integer): Double;
Begin
   Result := (Trunc( pdValor * Power (10, piDecimais))) / Power(10, piDecimais);
End;

End.
