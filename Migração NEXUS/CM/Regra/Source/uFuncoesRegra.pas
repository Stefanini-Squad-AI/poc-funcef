{******************************************************************************}
{  Sistema - REGRA                                                             }
{  Unit    - uFuncoesRegra                                                     }
{  Data    - 17/11/00                                                          }
{  Objetivo: Guardar as Funcoes e Procedimentos utilizados no componente Regra,}
{            diminuindo assim o tamanho da unit uREGRA                         }
{------------------------------------------------------------------------------}
{  Alterações:                                                                 }
{------------------------------------------------------------------------------}
{  Autor : Augusto                                                             }
{  Data  : 03/01/2005                                                          }
{  Descrição : Nova Formula PesquisaLista                                      }
{------------------------------------------------------------------------------}
{******************************************************************************}
unit uFuncoesRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, BDE, DB, Stdctrls, Math, finputvar, VcF1, grids, fpassoapasso,
  registry, uPilha, uCalcIrrf, fPegaTab, wwQuery, wwTable,  dsgnintf,
  uMensErro, UDataBase;

Type
  { Declaracao de Tipo de Registro Genérico }
  TRegistro = Record
                Valor1,
                Valor2  :Integer;
              End;
Var
  {----------------------------------------------------------------------------}
  { Variaveis Globais                                                          }
  VetRegrasExecutadas : Array[0..50] Of TRegistro;
  ProxRegraExec:Integer;


  {----------------------------------------------------------------------------}
  { Declaração dos Procedimentos                                               }
  Procedure IncluiRegraExecutada(IdRegra,IdAlgoritmoAtual:Integer);
  Procedure AtualizaValorReal(Var fValor: Extended; Var fReais:Currency;
                                  fFator: Extended;
                                  dDataHistorica, dDataPresente: TDateTime;
                                  sTipoConversao: string);

  {----------------------------------------------------------------------------}
  { Declaração das Funcoes                                                     }
  Function RetirarRegraExecutada(IdProxRegraExec:Integer):TRegistro;
  Function TransformaDiasTempo  (Tempo:Integer):String;

  Function AnoMesAnterior (sAnoMes : String): String;

  Function PesquisaLista  (sValor : String; sLista : String) : Boolean;

implementation

Uses URegra;

{******************************************************************************}
{ Inclui Regra na Lista de Regras Executadas                                   }
Procedure IncluiRegraExecutada(IdRegra,IdAlgoritmoAtual:Integer);
Begin
  VetRegrasExecutadas[ProxRegraExec].Valor1:=IdRegra;
  VetRegrasExecutadas[ProxRegraExec].Valor2:=IdAlgoritmoAtual;
  Inc(ProxRegraExec);
End;

{******************************************************************************}
{ Retorna e Exclui Regra na Lista de Regras Executadas                         }
Function RetirarRegraExecutada(IdProxRegraExec:Integer):TRegistro;
Begin
  { Limpa da Lista a Regra Enviada }
  VetRegrasExecutadas[ProxRegraExec].Valor1:=0;
  VetRegrasExecutadas[ProxRegraExec].Valor2:=0;
  { Decrementa Numero de Regras na Lista }
  Dec(ProxRegraExec);
  { Retorna os Dados da Regra que será executada }
  Result.Valor1:=VetRegrasExecutadas[ProxRegraExec].Valor1;
  Result.Valor2:=VetRegrasExecutadas[ProxRegraExec].Valor2;
End;


{******************************************************************************}
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

  { Primeiro aplica a correção monetária }
  {fValor := fValor * fFator;            }

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




