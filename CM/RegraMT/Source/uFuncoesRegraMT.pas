{==============================================================================}
{  REGRA                                                                       }
{  Unit    - uFuncoesRegraMT                                                   }
{  Data    - 17/11/00                                                          }
{  Objetivo: Guardar as Funcoes e Procedimentos utilizados no componente Regra,}
{            diminuindo assim o tamanho da unit uREGRAMT                       }
{------------------------------------------------------------------------------}
{  Alterações:                                                                 }
{------------------------------------------------------------------------------}
{  Autor : Augusto                                                             }
{  Data  : 03/01/2005                                                          }
{  Descrição : Nova Formula PesquisaLista                                      }
{------------------------------------------------------------------------------}
{==============================================================================}
unit uFuncoesRegraMT;

interface

uses
  SysUtils, DB, uCMClientDataSet, Classes, wwQuery, ADODb, Provider,
  uCMTypes,
  uTiposRegraMT, uCtrlRegra;

Var
  {----------------------------------------------------------------------------}
  { Variaveis Globais                                                          }
  VetRegrasExecutadas : Array[0..50] Of TRegraExecutada;
  ProxRegraExec:Integer;

  {----------------------------------------------------------------------------}
  { Declaração dos Procedimentos                                               }
  Procedure IncluiRegraExecutada( lRuleNumber : string;
                                  lDataSet : OleVariant;
                                  liContRegQryIn,
                                  liAlgorAtual : integer );
  Procedure AtualizaValorReal(Var fValor: Extended; Var fReais:Currency;
                                  fFator: Extended;
                                  dDataHistorica, dDataPresente: TDateTime;
                                  sTipoConversao: string);
  Procedure LimpaVetRegrasExecutadas;

  {----------------------------------------------------------------------------}
  { Declaração das Funcoes                                                     }
  Function RetirarRegraExecutada : TRegraExecutada;

  Function RetornaRegra        ( i : integer ) : TRegraExecutada;
  Function LeUltimoRegistro    ( Regra : TCtrlRegra; NomeTbl : String ) : Integer;
  Function FazQuery            (Regra : TCtrlRegra; Var CdsLocal : TCMClientDataSet; SQLText : String ) : Boolean;
  Function PreencheVariaveis   (RegraOrigem, RegraDestino : TCtrlRegra) : Integer;
  Function OrdenaLista         (Lista : TStringList) : TStringList;
  Function TransformaDiasTempo (Tempo:Integer): String;
  Function AnoMesAnterior      (sAnoMes : String): String;

  Function PesquisaLista  (sValor : String; sLista : String) : Boolean;

implementation

{------------------------------------------------------------------------------}
{ Inclui Regra na Lista de Regras Executadas                                   }
Procedure IncluiRegraExecutada( lRuleNumber : string;
                                lDataSet : OleVariant;
                                liContRegQryIn,
                                liAlgorAtual : integer );
Begin
  if ProxRegraExec > 0 then
    VetRegrasExecutadas[ProxRegraExec - 1].RegraChamada := lRuleNumber;

  VetRegrasExecutadas[ProxRegraExec].RuleNumber    := lRuleNumber;
  VetRegrasExecutadas[ProxRegraExec].DataSet       := lDataSet;
  VetRegrasExecutadas[ProxRegraExec].iContRegQryIn := liContRegQryIn;
  VetRegrasExecutadas[ProxRegraExec].iAlgorAtual   := liAlgorAtual;
  Inc( ProxRegraExec );
End;

{------------------------------------------------------------------------------}
{ Retorna e Exclui Regra na Lista de Regras Executadas                         }
Function RetirarRegraExecutada : TRegraExecutada;
Begin
  { Decrementa Numero de Regras na Lista }
  Dec( ProxRegraExec );
  
  if ProxRegraExec > 0 then
    VetRegrasExecutadas[ProxRegraExec - 1].RegraChamada := '';

  { Limpa da Lista a Regra Enviada }
  VetRegrasExecutadas[ProxRegraExec].RegraChamada  := '';
  VetRegrasExecutadas[ProxRegraExec].RuleNumber    := '';
  VetRegrasExecutadas[ProxRegraExec].DataSet       := 0;
  VetRegrasExecutadas[ProxRegraExec].iContRegQryIn := 0;
  VetRegrasExecutadas[ProxRegraExec].iAlgorAtual   := 0;
End;

Function RetornaRegra( i : integer ) : TRegraExecutada;
begin
  Result.RegraChamada    := VetRegrasExecutadas[i].RegraChamada;
  Result.RuleNumber      := VetRegrasExecutadas[i].RuleNumber;
  Result.DataSet         := VetRegrasExecutadas[i].DataSet;
  Result.iContRegQryIn   := VetRegrasExecutadas[i].iContRegQryIn;
  Result.iAlgorAtual     := VetRegrasExecutadas[i].iAlgorAtual;
end;


{------------------------------------------------------------------------------}
{ Atualiza Valor atravéz das várias conversões de Moeda até a Real             }
{ Obs .: Caso o parametros Reais estaja preenchido, este passa a ser o valor a }
{        ser processado                                                        }
Procedure AtualizaValorReal(Var fValor: Extended; Var fReais:Currency;
                                fFator: Extended;
                                dDataHistorica, dDataPresente: TDateTime;
                                sTipoConversao: string);
Begin
  { Historico das Conversões de Moeda              }
  { Mar/1970 --> Cruzeiro       (Cr$)              }
  { Fev/1986 --> Cruzado        (Cz$)  = / 1000    }
  { Jan/1989 --> Cruzado Novo   (NCz$) = / 1000    }
  { Mar/1990 --> Cruzeiro       (Cr$)  =           }
  { Ago/1993 --> Cruzeiro Real  (CR$)  = / 1000    }
  { Jul/1994 --> Real           (R$)   = / 2750    }

  { Acerta o valor a processar }
  If fReais <> 0 Then Begin
    fValor := fReais;
  End;

  { Converte o Valor de acordo com as datas das conversões das moedas até a   }
  { Real                                                                      }
  Case sTipoConversao[1] Of

    { Fixo, não leva em conta a tabela de moedas, apenas as datas            }
    { o valor histórico necessita estar na moeda corrente do Brasil à época  }
    'F':Begin

        { Converte de acordo com o tempo a ser convertido e sai fora }
        if dDataHistorica < StrToDate('01/02/1986') then begin
          if dDataPresente >= StrToDate('01/02/1986') then fValor := fValor / 1000;
          if dDataPresente >= StrToDate('01/01/1989') then fValor := fValor / 1000;
          if dDataPresente >= StrToDate('01/08/1993') then fValor := fValor / 1000;
          if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
          fReais := fValor;
          Exit;
        end;

        if dDataHistorica < StrToDate('01/01/1989') then begin
          if dDataPresente >= StrToDate('01/01/1989') then fValor := fValor / 1000;
          if dDataPresente >= StrToDate('01/08/1993') then fValor := fValor / 1000;
          if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
          fReais := fValor;
          Exit;
        end;

        if dDataHistorica < StrToDate('01/08/1993') then begin
          if dDataPresente >= StrToDate('01/08/1993') then fValor := fValor / 1000;
          if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
          fReais := fValor;
          Exit;
        end;

        if dDataHistorica < StrToDate('01/07/1994') then begin
          if dDataPresente >= StrToDate('01/07/1994') then fValor := fValor / 2750;
          fReais := fValor;
          Exit;
        end;

    End; { 'F': begin }

    { Por enquanto só converte com um Tipo 'F', somente usando as datas e os }
    { fatores de conversão oficiais                                          }
  End;
End;

{------------------------------------------------------------------------------}
function LeUltimoRegistro( Regra : TCtrlRegra; NomeTbl : String ) : Integer;
var
  cdsLocal : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := Regra.GetDataPacket( 'SELECT SEQ' + Trim( NomeTbl ) + '.NEXTVAL AS PROX ' +
                                          'FROM DUAL ' );
    Result := cdsLocal.FieldByName('PROX').AsInteger;
  finally
    cdsLocal.Free;
  end;
end;

{------------------------------------------------------------------------------}
Function FazQuery(Regra : TCtrlRegra; Var CdsLocal : TCMClientDataSet; SQLText : String ):Boolean;
Begin
  With CdsLocal Do Begin
    Data := Regra.GetDataPacket(SQLText);
    Result := (EOF <> BOF);
  End;
End;

{------------------------------------------------------------------------------}
{ Ordenar uma lista alfabéticamente                                            }
Function OrdenaLista(Lista : TStringList): TStringList;
Var
 I, Z : Integer;
 GuardaItem : String;
Begin
  { Inicia Ordenacao }
  For I := 0 To (Lista.Count-1) Do Begin
    For Z := 0 To ((Lista.Count-(I+1))-1) Do Begin
      { Caso o Proximo Item maior que o atual }
      If Lista.Strings[Z] > Lista.Strings[Z+1] Then Begin
        { Guarda o Item }
        GuardaItem         := Lista.Strings[Z];
        { Puxa o Proximo }
        Lista.Strings[Z]   := Lista.Strings[Z+1];
        { Adianta o Atual }
        Lista.Strings[Z+1] := GuardaItem;
      End;
    End;
  End;
  { Gera Resultado }
  Result := Lista;
End;

{------------------------------------------------------------------------------}
{ Transfere Variaveis de um instancia do Regra para outra                      }
Function PreencheVariaveis(RegraOrigem, RegraDestino : TCtrlRegra) :Integer;
Var
  I : Integer;
  bVariavelExiste : Boolean;
begin
  I := 1;
  bVariavelExiste := False;

  { Transfere todas as variaveis }
  For I := I To RegraOrigem.iTotVariaveis Do Begin

    RegraDestino.aTabVariaveis[I,1] := RegraOrigem.aTabVariaveis[I,1];
    RegraDestino.aTabVariaveis[I,2] := RegraOrigem.aTabVariaveis[I,2];

  End; { (I <= RegraOrigem. }

  Result := RegraOrigem.iTotVariaveis;

end; { PreencheVariaveis }

{******************************************************************************}
{ Transforma numero de Dias em Anos Meses e Dias no formato Float.             }
Function TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='0';
  { Calcula quantos anos meses e dias possui o Tempo (numero de dias) }
  wAnoF := (Tempo/360);
  wMesF := (Frac(wAnoF)*12);
  wDiaF := ((wMesF-Int(wMesF))*30);

  { Separa Tempos }
  wAno := FloatToStr( Int( wAnoF ) );
  wMes := FloatToStr( Int( wMesF ) );
  wDia := FloatToStr( Int( wDiaF ) );
  { Acerta os tempo }
  If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
  If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
  If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

  { Caso Dias = 30 Aumenta Mes }
  If wDia = '30' Then Begin
    wMes:= IntToStr((StrToInt(wMes)+1));
    If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
    wDia:= '00';
  End;

  { Caso Meses = 12 Aumenta Ano }
  If wMes = '12' Then Begin
    wAno:= IntToStr((StrToInt(wAno)+1));
    wMes:= '00';
  End;

  wStrTempo:=wAno+wMes+wDia;

  I := Length(wStrTempo);
  Result := StringOfChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
End;

{******************************************************************************}
{ Lima vetor de regras executadas                                              }
Procedure LimpaVetRegrasExecutadas;
var
  i : integer;
begin
  for i := 0 to 50 do
  begin
    VetRegrasExecutadas[i].RegraChamada  := '';
    VetRegrasExecutadas[i].RuleNumber    := '';
    VetRegrasExecutadas[i].DataSet       := 0;
    VetRegrasExecutadas[i].iContRegQryIn := 0;
    VetRegrasExecutadas[i].iAlgorAtual   := 0;
  end;
end;

{******************************************************************************}
{ Retorna ANOMES Anterior ao ANOMES passado                                    }
Function AnoMesAnterior (sAnoMes : String) : String;
Var
  iAno, iMes : integer;
  sAnoMesLocal : string;
Begin
  Result := '';

  iAno := StrToInt(Copy(sAnoMes,1,4));
  iMes := StrToInt(Copy(sAnoMes,5,2));

  If iMes = 1 Then Begin
     sAnoMesLocal := IntToStr(iAno-1);
     sAnoMesLocal := sAnoMesLocal+'12';
  End Else Begin
    sAnoMesLocal := IntToStr(iAno);
    iMes := iMes - 1;
    If iMes <= 9  Then
      sAnoMesLocal := sAnoMesLocal+'0'+IntToStr(iMes)
    Else
      sAnoMesLocal := sAnoMesLocal+IntToStr(iMes);
  End;
  Result := sAnoMesLocal;

End; { AnoMesAnterior }

{******************************************************************************}
{ Verifica se um valor existe em uma lista (ex: (10,0,15,220,30,5) )           }
Function PesquisaLista  (sValor : String; sLista : String) : Boolean;
Var
  aArrayValores : Array [0..20] of String;
  I, iPosicaoVirgula : Integer;
  sAtomo, sListaLocal  : String;
Begin
  sListaLocal := Trim(sLista);
  sListaLocal := Copy(sListaLocal,2,(Length(sListaLocal)-1));
  sListaLocal := Copy(sListaLocal,1,(Length(sListaLocal)-1));

  For I := 0 To 20 Do Begin
    iPosicaoVirgula := (Pos(',',sListaLocal));
    If iPosicaoVirgula <= 0 Then iPosicaoVirgula := (Length(sListaLocal)+1);
    sAtomo := Copy( sListaLocal, 1, (iPosicaoVirgula - 1) );
    aArrayValores[I] := sAtomo;
    sListaLocal := Copy(sListaLocal, (iPosicaoVirgula + 1) ,(Length(sListaLocal)-1));
    If sAtomo = '' Then Break;
  End;
  
  Result := False;
  For I := 0 To 20 Do Begin
    If aArrayValores[I] = sValor Then Result := True;
    If aArrayValores[I] = '' Then Break;
  End;

End;



end.