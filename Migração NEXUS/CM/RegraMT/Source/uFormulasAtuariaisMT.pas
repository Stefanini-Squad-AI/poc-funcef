{==============================================================================}
{  Sistema - REGRA                                                             }
{  Unit    - uFormulasAtuariaisMT                                              }
{  Data    - 06/11/2001                                                        }
{  Objetivo: Organizar as formulas utilizadas apenas pelo Calculo Atuarial     }
{------------------------------------------------------------------------------}
{  Alterações:                                                                 }
{------------------------------------------------------------------------------}
// Autor - Data : ClaudioR - 26/05/2006
// Descricao    : Inclusão da fórmula TABSERV, TABPENSAO

unit uFormulasAtuariaisMT;

interface

uses
  SysUtils, Controls, uCtrlRegra, uCmTypes, classes, uCmControlObject, uCMClientDataSet,
  uTiposRegraMT, uSistema, wwQuery;

  Function Retorna_Seq( Regra : TCtrlRegra ):Integer;

  Function TABSERV         ( Regra : TCtrlRegra;formula:string ): String;
  Function TABPENSAO       ( Regra : TCtrlRegra;formula:string ): String;
  Function GRAVAMEMATUARIAL( Regra : TCtrlRegra; Formula : String ) : String;

  Procedure Grava_Memoria_Calculo( Regra : TCtrlRegra; sVariavel, sResultado:String );

implementation

Function Retorna_Seq( Regra : TCtrlRegra ):Integer;
Var
  CdsLocal : TCMClientDataSet;
  sSQL : String;
Begin
  Try

    CdsLocal  := TCMClientDataSet.Create( nil );

    sSQL := 'SELECT MAX(SQ_OCOR_CALCULO) AS SEQ FROM FI_OCOR_CALCULO_ATUARIAL '+
            'WHERE DT_GERACAO = TO_DATE(' + QuotedStr( Regra.ClientDataSetIn.FieldByName('DT_GERACAO').AsString ) + ', ' +
                                            QuotedStr( 'DD/MM/YYYY HH24:MI:SS')                     + ') AND '+

            'CD_VERSAO        = ' + Regra.ClientDataSetIn.FieldByName('CD_VERSAO').AsString         + ' AND '+
            'CD_PESSOA_ENTID  = ' + Regra.ClientDataSetIn.FieldByName('CD_PESSOA_ENTID').AsString   + ' AND '+
            'CD_PESSOA_PATROC = ' + Regra.ClientDataSetIn.FieldByName('CD_PESSOA_PATROC').AsString  + ' AND '+
            'CD_PLANO         = ' + Regra.ClientDataSetIn.FieldByName('CD_PLANO').AsString          + ' ';


    CdsLocal.Data := Regra.GetDataPacket( sSQL );

    Result := ( CdsLocal.FieldByName('SEQ').AsInteger + 1 );

  Finally

    FreeAndNil( CdsLocal );

  End;
End;

Procedure Grava_Memoria_Calculo(Regra : TCtrlRegra; sVariavel, sResultado:String );
Var
  sSQL : String;
  sData, sTipo_Benef: String;
  iSeq : Integer;
  nValor: Real;
Begin

  sData := ' TO_DATE(';
  sData := sData + QuotedStr(Regra.ClientDataSetIn.FieldByName('DT_GERACAO').AsString);
  sData := sData + ', ' + QuotedStr('DD/MM/YYYY HH24:MI:SS') + ') ';

  sTipo_Benef := Regra.ClientDataSetIn.FieldByName('CD_TIPO_BENEF').AsString;

  If Regra.ClientDataSetIn.FieldByName('CD_TIPO_BENEF').AsString = '' Then
    sTipo_Benef := 'NULL';

  iSEQ := Retorna_Seq(Regra);

  Try
    nValor := StrToFloat(sResultado)
  Except
    sResultado := '0'
  End;

  sSQL :=  'INSERT INTO FI_OCOR_CALCULO_ATUARIAL '+
           ' (DT_GERACAO, CD_VERSAO, CD_PESSOA_ENTID, CD_PESSOA_PATROC, '+
           '  CD_PLANO,  CD_PARTIC, CD_TIPO_BENEF, CD_GRUPO_PARTIC, '+
           '  SQ_OCOR_CALCULO, CD_FORMULA, NO_VARIAVEL,VL_CALCULO_ATUARIAL) '+
           'VALUES '+
           ' ( ' + sData + ', ' +
           Regra.ClientDataSetIn.FieldByName('CD_VERSAO').AsString            + ', ' +
           Regra.ClientDataSetIn.FieldByName('CD_PESSOA_ENTID').AsString      + ', ' +
           Regra.ClientDataSetIn.FieldByName('CD_PESSOA_PATROC').AsString     + ', ' +
           Regra.ClientDataSetIn.FieldByName('CD_PLANO').AsString             + ', ' +
           Regra.ClientDataSetIn.FieldByName('CD_PARTIC').AsString            + ', ' +
           sTipo_Benef                                                        + ', ' +
           Regra.ClientDataSetIn.FieldByName('CD_GRUPO_PARTIC').AsString      + ', ' +
           IntToStr(iSEQ)                                                     + ', ' +
           IntToStr(Regra.RegraAtual)                                         + ', ' +
           QuotedStr(sVariavel)                                               + ', ' +
           sResultado                                                         + ') ';

  { Caso não deseje gravar na memória de Calculo sai fora }
  If (Regra.FGravaCalculo = False) Then Exit;
    Regra.ExecutarQuery( sSQL );

End;


{==============================================================================}
{ Formula, TABSERV                                                             }
{   Retorna o valor de uma variavel da tábua de servico.                       }
{ SINTAXE:                                                                     }
{    TABSERV(IDADE, VARIAVEL, SEXO, GRAVA)                                     }
Function TABSERV( Regra : TCtrlRegra; Formula : String ) : String;
Var
  sFormulaAux,
  sIdade, sParametroVariavel, sParametroSexo, sGrava, sResultado,
  sSQL, sAnoMesCob, sIdPessoa, sIdRubrica : String;
  I :Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula, 9,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega Idade }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdade := Copy(sFormulaAux,1,I-1);
  sIdade := Regra.PegaValor(sIdade);

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Pega parameto variavel  }
  I := Pos(',', sFormulaAux);
  If Trim(sFormulaAux) <> ''  Then Begin
    sParametroVariavel := Copy(sFormulaAux,1,I-1);
   // sParametroVariavel := Regra.PegaValor(sParametroVariavel);
  End;

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Pega parameto sexo }
  I := Pos(',', sFormulaAux);
  If Trim(sFormulaAux) <> ''  Then Begin
    sParametroSexo := Copy(sFormulaAux,1,I-1);
    sParametroSexo := Regra.PegaValor(sParametroSexo);
  End;

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Pega parameto GRAVA }
  I := Pos(',', sFormulaAux);
  If Trim(sFormulaAux) <> ''  Then Begin
    sGrava := Copy(sFormulaAux,1,Length(sFormulaAux));
    sGrava := Regra.PegaValor(sGrava);
  End;

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  If Regra.CdsTabuasServico.Locate('IDADE;PENSAO;VARIAVEL',
                                   VarArrayOf([sIdade, '0', sParametroVariavel]), []) Then

  If sParametroSexo = 'M' Then
     sResultado := Regra.CdsTabuasServico.FieldByName('VL_MASCULINO').AsString
  Else
     sResultado := Regra.CdsTabuasServico.FieldByName('VL_FEMININO').AsString;

  If Trim(sResultado) = '' Then sResultado := '0';

  If sGrava = 'S' Then Grava_Memoria_Calculo(Regra, sParametroVariavel, sResultado);

  { Seta Resultado }
  Result := sResultado;

End; { TABSERV }

{==============================================================================}
{ Formula, TABPENSAO                                                           }
{   Retorna o valor de uma variavel da tábua de pensão.                        }
{ SINTAXE:                                                                     }
{    TABPENSAO(IDADE, IDADEPENSIONISTA, VARIAVEL, GRAVA)                       }
Function TABPENSAO( Regra : TCtrlRegra; Formula : String ) : String;
Var
  sFormulaAux,
  sIdade, sIdadePensionista, sParametroVariavel, sGrava, sResultado,
  sSQL, sAnoMesCob, sIdPessoa, sIdRubrica : String;
  I :Integer;
Begin
  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,11,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega Idade }
  I := Pos(',', sFormulaAux);
  If I <= 0 Then I := (Length(sFormulaAux)+1);
  sIdade := Copy(sFormulaAux,1,I-1);
  sIdade := Regra.PegaValor(sIdade);

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Pega Idade do pensionista }
  I := Pos(',', sFormulaAux);
  If Trim(sFormulaAux) <> ''  Then Begin
    sIdadePensionista := Copy(sFormulaAux,1,I-1);
    sIdadePensionista := Regra.PegaValor(sIdadePensionista);
  End;

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Pega parameto variavel  }
  I := Pos(',', sFormulaAux);
  If Trim(sFormulaAux) <> ''  Then Begin
    sParametroVariavel := Copy(sFormulaAux,1,I-1);
    //sParametroVariavel := Regra.PegaValor(sParametroVariavel);
  End;

  sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

  { Pega parameto variavel  }
  I := Pos(',', sFormulaAux);
  If Trim(sFormulaAux) <> ''  Then Begin
    sGrava := Copy(sFormulaAux,1,Length(sFormulaAux));
    sGrava := Regra.PegaValor(sGrava);
  End;
  
  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Processamento }
   If Regra.CdsTabuasServico.Locate('IDADE;PENSAO;VARIAVEL',
                                    VarArrayOf([sIdade, sIdadePensionista, sParametroVariavel]), []) Then
   Begin
      sResultado := Regra.CdsTabuasServico.FieldByName('Vl_Pensao').AsString;
   End;

   If Trim(sResultado) = '' Then sResultado := '0';

   If sGrava = 'S' Then
      Grava_Memoria_Calculo(Regra, sParametroVariavel, sResultado);

  { Seta Resultado }
  Result := sResultado;

End; { TABPENSAO }


{==============================================================================}
{ Formula, GRAVAMEMATUARIAL                                                    }
{   Grava na memória do cálculo atuarial o valor de uma variável.              }
{ SINTAXE:                                                                     }
{    GRAVAMEMORIA(Variavel)                                                    }
Function GRAVAMEMATUARIAL( Regra : TCtrlRegra; Formula : String ) : String;
Var
  sFormulaAux,
  sTemp, sResultado:String;
  lstVariavel:TStringList;
  sSQL, sAnoMesCob, sIdPessoa, sIdRubrica : String;
  I, N :Integer;
Begin
  lstVariavel := TStringList.Create;

  {----------------------------------------------------------------------------}
  { Decodifica Fórmula                                                         }

  { Retira Nome da Formula }
  sFormulaAux := Copy(Formula,18,Length(Formula));
  sFormulaAux := Copy(sFormulaAux,1,Length(sFormulaAux)-1);

  { Pega Variaveis }
  While I > 0 do Begin

    I := Pos(',', sFormulaAux);
    If I <= 0 Then I := (Length(sFormulaAux)+1);
    sTemp  := Copy(sFormulaAux,1,I-1);

    sFormulaAux := Copy(sFormulaAux, I + 1, Length(sFormulaAux));

    lstVariavel.Add(sTemp);

    If sFormulaAux = '' Then Break;

  End;

  { Fim da decodificação da Fórmula                                            }
  {----------------------------------------------------------------------------}

  { Processamento }
  For N:= 0 To lstVariavel.Count -1 do Begin
    { Limpa a variavel }
    sTemp := lstVariavel[N];

    If Copy(sTemp, 1, 1) = '@' Then sTemp := Copy(sTemp, 2, Length(sTemp));

    Grava_Memoria_Calculo(Regra, sTemp, Regra.PegaValor(lstVariavel[N]));
  End;

  { Seta Resultado }
  Result := '';

End; { GRAVAMEMORIA }



end.