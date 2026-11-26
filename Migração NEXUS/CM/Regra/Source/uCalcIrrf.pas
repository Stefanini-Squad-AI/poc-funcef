{
------------------------------------------------------------------------------------
Autor(a)..: Edilaine
Data      : 14/01/2026
Pendencia : WO32316
Alteração : Novo cálculo do IR - calculo IR Total
------------------------------------------------------------------------------------
Autor(a)..: Edilaine
Data      : 14/01/2026
Pendencia : WO31036
Alteração : Novo cálculo do IR - regra de acao judicial
------------------------------------------------------------------------------------
Autor(a)..: Edilaine
Data      : 19/12/2025
Pendencia : WO29025
Alteração : Novo cálculo do IR
------------------------------------------------------------------------------------
Autor     : André Imakawa
Pendencia : SIG1136844
Descrição : Refazer o SIG 99651
Data      : 22/06/2023
------------------------------------------------------------------------------------
Autor     : André Imakawa
Pendencia : SIG1135653
Descrição : Desfazer o SIG 99651
Data      : 10/05/2023
------------------------------------------------------------------------------------
Autor     : André Imakawa
Pendencia : SIG199651
Descrição : Inserir na tabela Temporaria os valores gerados na regra
Data      : 24/02/2023
------------------------------------------------------------------------------------
Autor     : André Imakawa
Pendencia : SIG126442
Descrição : Desfazer ajuste do SIG 115390
Data      : 24/06/2022
------------------------------------------------------------------------------------
Autor     : Ewerton Beltramini
Pendencia : SIG115390
Descrição : Correção do desconto de IR por idade (65 anos).
Data      : 06/07/2021
------------------------------------------------------------------------------------
}


unit UCalcIrrf;

interface

uses
  SysUtils, Classes, StdCtrls, WinTypes,dbtables, wwQuery, dialogs ;


Type
  ObjFaixa = Class(TObject)
               Faixa_IRRF,
               Aliquota_IRRF,
               ParcDeduzIRRF : double;
              End;

  //edilaine WO29025 : inicio
  ObjReducao = class(TObject)
               Faixa_Trib_Ini,
               Faixa_Trib_Fim,
               ReducaoIRRF   : double;
               FatorIRRF     : double;
             End;
  //edilaine WO29025 : fim

  TIRRF = Class(TObject)
    Private
      FaixasL       : TStringS;
      FaixaIRRF     : ObjFaixa;
      FaixaReducao  : ObjReducao;    //edilaine WO29025
      FaixasRed     : TStrings;      //edilaine WO29025

      iIdadeIdoso   : Integer;
      dVlrIdosos    : Double;
      dVlrDependente: Double;

      AliqIRRFExterior : Double;

      function CalcIdade(dataref:string;dDataNasc:TDateTime):integer;  
      function BuscaFaixa(pBase:Double):boolean;
    public
      Property IdadeIdoso : Integer     Read iIdadeIdoso;
      Property ValorIdoso : Double      Read dVlrIdosos;
      Property ValorDependente : Double Read dVlrDependente;

      procedure LiberaFaixasIRRF;
      procedure CarregaFaixasIRRF(QryAux:TwwQuery; aEmpresa:Integer; DataRef : String = '');
      function CalculaIRRF(pNumDepen:integer;dtDataNasc:TDateTime;
                           Var pBase,pPercentual:Double; DataRef:String;
                           Tipo:LongInt):double;
      function CalculaIRRF_Ext(pBase:double):double;

      //edilaine WO29025 : inicio
      function  BuscaFaixaReducao(pBaseTrib: Double): boolean;
      procedure LiberaFaixasReducao;
      //edilaine WO29025 : fim

      constructor Create;
      destructor Destroy; override;

  End;


implementation




constructor TIrrf.Create;
begin
  inherited Create;
  FaixasL   := TStringList.Create;
  FaixasRed := TStringList.Create;           //edilaine WO29025
end;

destructor TIrrf.destroy;
begin
  LiberaFaixasIRRF;             // Andre Imakawa - SIG 99651
  LiberaFaixasReducao;          //edilaine WO29025

  FaixasL.Free;
  FaixasRed.Free;               //edilaine WO29025

  //FreeAndNil( FaixaIRRF );    // Andre Imakawa - SIG 99651
  
  inherited Destroy;
end;


//edilaine WO32316 : inicio
function iif(bCondicao : boolean; sVerdade,sFalso : string) : string;
begin
  if bCondicao then result := sVerdade
               else result := sFalso;
end;

function Arred(pNumero : double;pCasas : byte) : double;
var
  fator : double;
begin
  fator := exp(pCasas * ln(10));
  Result := Round(pNumero * fator)/fator;
end;
//edilaine WO32316 : fim

//edilaine WO29025 : inicio
procedure TIrrf.LiberaFaixasReducao;
var
  Item : Integer;
begin
  For Item := 0 to FaixasRed.Count-1 do
     FaixasRed.Objects[Item].Free;
  FaixasRed.Clear;
end;

function TIrrf.BuscaFaixaReducao(pBaseTrib: Double): boolean;
Var
  Item  : Integer;
  Achou : Boolean;
begin
  Item  := 0;
  Achou := False;
  While Not Achou And (Item < FaixasRed.Count) Do
  Begin
    FaixaReducao := ObjReducao(FaixasRed.Objects[Item]);
    Achou     := ((FaixaReducao.Faixa_Trib_Fim) > pBaseTrib);
    Inc(Item);
  End;
  Result := Achou
end;
//edilaine WO29025 : fim


procedure TIrrf.LiberaFaixasIRRF;
var
  Item:Integer;
begin
  for Item:=0 to FaixasL.Count-1 do
    FaixasL.Objects[Item].Free;
  FaixasL.Clear;
end;


procedure TIrrf.CarregaFaixasIRRF(qryAux:TwwQuery; aEmpresa:Integer; DataRef : String);
Var
 sSql : String;
begin
  If DataRef = '' Then DataRef := DateToStr(Date);
  With QryAux Do Begin
    LiberaFaixasIRRF;
    LiberaFaixasReducao;                   //edilaine WO29025

  sSql := 'SELECT H.IDADEIDOSO, H.VLRIDOSO, H.VLRDEPENDENTE, H.PERCIRRFEXTERIOR '+
          'FROM HSTPARAMIRRF H, '+
               '(SELECT DISTINCT FAIXA_IRRF, MAX(DATAINIVIGENCIA) AS DATA '+
                'FROM IRRF '+
                'WHERE DATAINIVIGENCIA <= TO_DATE('+
                       QuotedStr(dataRef)+',''DD/MM/YYYY'') '+
                'GROUP BY FAIXA_IRRF) T '+
          'WHERE H.DATAINIVIGENCIA = T.DATA '+
          'ORDER BY DATAINIVIGENCIA DESC ';

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSql);
    qryAux.Open;


    iIdadeIdoso   := FieldByName('IDADEIDOSO').AsInteger;
    dVlrIdosos    := FieldByName('VLRIDOSO').AsFloat;
    dVlrDependente:= FieldByName('VLRDEPENDENTE').AsFloat;

    AliqIRRFExterior := FieldByName('PERCIRRFEXTERIOR').AsFloat;

  sSql := ' SELECT '+
    ' I.IDIRRF, I.FAIXA_IRRF, I.ALIQUOTA_IRRF, I.PARCDEDUZIRRF, I.DATAINIVIGENCIA '+
  ' FROM IRRF I, (SELECT DISTINCT FAIXA_IRRF, MAX(DATAINIVIGENCIA) AS DATA '+
                 'FROM IRRF WHERE DATAINIVIGENCIA <= TO_DATE('+
                                  QuotedStr(DataRef)+',''DD/MM/YYYY'') '+
                ' GROUP BY FAIXA_IRRF) T '+
  ' WHERE '+
    ' T.FAIXA_IRRF = I.FAIXA_IRRF AND '+
    ' T.DATA = I.DATAINIVIGENCIA '+
    { Augusto 22/02/2006 }
    'ORDER BY I.DATAINIVIGENCIA DESC , I.FAIXA_IRRF ';

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSql);
    qryAux.Open;

    while not Eof do begin
      FaixaIRRF := ObjFaixa.Create;
      FaixaIRRF.Faixa_Irrf    := FieldByName('FAIXA_IRRF').AsFloat;
      FaixaIRRF.Aliquota_Irrf := FieldByName('ALIQUOTA_IRRF').AsFloat;
      FaixaIRRF.ParcDeduzIrrf := FieldByName('PARCDEDUZIRRF').AsFloat;
      FaixasL.AddObject('',FaixaIRRF);
      Next;
    end;
    Close;

    //edilaine WO29025 : inicio
    sSql := 'SELECT I.FAIXA_TRIBUTAVEL, I.REDUCAO, I.FATOR, '+
            '       CASE                                    '+
            '         WHEN LAG(I.FAIXA_TRIBUTAVEL) OVER (ORDER BY I.FAIXA_TRIBUTAVEL) IS NULL THEN 0  '+
            '         ELSE LAG(I.FAIXA_TRIBUTAVEL) OVER (ORDER BY I.FAIXA_TRIBUTAVEL) + 0.01          '+
            '       END AS FAIXA_TRIBUTAVEL_LINHA_ANTERIOR '+
            '  FROM IRRF_REDUCAO I,                        '+
            '       (SELECT MAX(M.DATAINIVIGENCIA) AS DATA '+
            '          FROM IRRF_REDUCAO M                 '+
            '         WHERE M.DATAINIVIGENCIA <= TO_DATE('+QuotedStr(dataRef) +',''DD/MM/YYYY'') '+
            '       ) T '+
            ' WHERE '+
            '   T.DATA = I.DATAINIVIGENCIA '+
            'ORDER BY I.FAIXA_TRIBUTAVEL   ';

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSql);
    qryAux.Open;

    while not Eof do begin
      FaixaReducao := ObjReducao.Create;
      FaixaReducao.Faixa_Trib_Ini := FieldByName('FAIXA_TRIBUTAVEL_LINHA_ANTERIOR').AsFloat;
      FaixaReducao.Faixa_Trib_Fim := FieldByName('FAIXA_TRIBUTAVEL').AsFloat;
      FaixaReducao.ReducaoIrrf    := FieldByName('REDUCAO').AsFloat;
      FaixaReducao.FatorIrrf      := FieldByName('FATOR').AsFloat;

      FaixasRed.AddObject('',FaixaReducao);

      Next;
    end;
    Close;
    //edilaine WO29025 : fim

  end; { With QryAux Do Begin }

end;


function TIrrf.BuscaFaixa(pBase:Double):boolean;
var
  Item:Integer;
  Achou:boolean;
begin
  Item:=0;
  Achou:=false;
  while not Achou and (Item<FaixasL.Count) do
  begin
    FaixaIRRF:=ObjFaixa(FaixasL.Objects[Item]);
    Achou:=((FaixaIRRF.Faixa_Irrf)>pBase);
    inc(Item);
  end;
  BuscaFaixa:=Achou
end;


// Atenção: Rotina Alterada a divisão era por 365 agora é ´por 365.25 devido ao ano bissexto.
function TIrrf.CalcIdade(dataref:string;dDataNasc:TDateTime):integer;
begin
 if Trim(DateToStr(dDataNasc)) = '' then
   Result := 0
 else
   Result := Trunc((strtodate(dataref) - dDataNasc) / 365.25);
end;



Function TIrrf.CalculaIRRF(pNumDepen:integer;dtDataNasc:TDateTime;
                           var pBase,pPercentual:double;dataref:string;
                           Tipo : LongInt):double;

var
  //edilaine WO29025 : inicio
  pVlrTribut, pVlrReducao : double;
  pTemDadosReducao : boolean;
  prSuplMes, prINSSMes, prContMes, prContEqua : double;
  pIRTotal : integer;
  iFontePagadora, iSeq : integer;
  //edilaine WO29025 : fim
  prPercAcao : double;            //edilaine WO31036
  prBaseIR   : double;            //edilaine WO31036
  prVlrPaINSS: double;            //edilaine WO32316
  prVlrPaFUND: double;            //edilaine WO32316

  function Insere_Regra_Irrf_Valores(pValorBase, pValorDeduzir, pPercentual,pValorImposto: double): Boolean;
  var
    qry: TwwQuery;
    sSql: string;
  begin
    try
      qry := TwwQuery.Create(nil);
      qry.DataBaseName       :='BaseDados';

      sSQL := 'INSERT INTO CM.REGRA_IRRF_VALORES(SEQ, VALOR_BASE, VALOR_PARCELA_DEDUZIR, VALOR_PERCENTUAL, VALOR_IMPOSTO)' + #13#10 +
              'VALUES( '+ #13#10 +
              '(SELECT COUNT(1) + 1 FROM CM.REGRA_IRRF_VALORES), ' + #13#10 +
              StringReplace((FloatToStr(pValorBase)), ',', '.', []) + ', ' +  #13#10 +
              StringReplace((FloatToStr(pValorDeduzir)), ',', '.', []) + ', ' +  #13#10 +
              StringReplace((FloatToStr(pPercentual)), ',', '.', []) + ', ' +  #13#10 +
              StringReplace((FloatToStr(pValorImposto)), ',', '.', []) + ' ' +  #13#10 +
              ')';
      qry.close;
      qry.SQL.Clear;
      qry.SQL.Text := sSQL;
      try
        qry.ExecSQL;
      except

      end;
    finally
      FreeAndNil(qry);
    end;
  end;

  //edilaine WO29025 : inicio
  function BuscaDadosReducao : boolean;
  var
    qry: TwwQuery;
    sSql: string;
    sParam : TStringList;  //edilaine WO32316
    sTexto : string;       //edilaine WO32316
    iInd   : integer;      //edilaine WO32316
  begin
    try
      qry := TwwQuery.Create(nil);
      qry.DataBaseName :='BaseDados';

      //edilaine WO32316 : inicio
      sParam := TStringList.create;

      //sSQL := 'SELECT SEQ, VALOR_FUNCEF, VALOR_INSS, SOMA_FONTES, DEDUCOES, DEDUCOES_EQUA, '+
      //        '       PERCACAO, BASEIRRF '+ //edilaine WO31036
      sSQL := 'SELECT SEQ, PARAMETROS_IN  FROM CM.REGRA_IRRF_REDUCAO ';
      //edilaine WO32316 : inicio

      // para teste no Regra
      //sSQL := 'SELECT 1 as SEQ, ''8392.02,4889.66,1,46.16,814.09,100,12427.57,0,0'' PARAMETROS_IN  FROM dual ';

      qry.close;
      qry.SQL.Clear;
      qry.SQL.Text := sSQL;
      try
        qry.Open;
        result := not qry.isEmpty;
        if not qry.isEmpty then
        begin
          //edilaine WO32316 : inicio
          sParam.CommaText := qry.FieldByName('PARAMETROS_IN').AsString;

          for iInd := 0 to sParam.Count-1 do
          begin
            case iInd of
              0 : prSuplMes   := StrToFloat(iif(sParam.Strings[iInd] = '', '0', sParam.Strings[iInd]));   //VALOR_FUNCEF
              1 : prINSSMes   := StrToFloat(iif(sParam.Strings[iInd] = '', '0', sParam.Strings[iInd]));   //VALOR_INSS
              2 : pIRTotal    := StrToInt(  iif(sParam.Strings[iInd] = '', '0', sParam.Strings[iInd]));   //SOMA_FONTE
              3 : prContMes   := StrToFloat(iif(sParam.Strings[iInd] = '', '0', sParam.Strings[iInd]));   //DEDUCOES
              4 : prContEqua  := StrToFloat(iif(sParam.Strings[iInd] = '', '0', sParam.Strings[iInd]));   //DEDUCOES_EQUA
              5 : prPercAcao  := StrToFloat(iif(sParam.Strings[iInd] = '', '0', sParam.Strings[iInd]));   //PERCACAO
              6 : prBaseIR    := StrToFloat(iif(sParam.Strings[iInd] = '', '0', sParam.Strings[iInd]));   //BASEIRRF
              7 : prVlrPaINSS := StrToFloat(iif(sParam.Strings[iInd] = '', '0', sParam.Strings[iInd]));   //PAINSS
              8 : prVlrPaFUND := StrToFloat(iif(sParam.Strings[iInd] = '', '0', sParam.Strings[iInd]));   //PAFUND
            end;
          end;
          iSeq := qry.FieldByName('SEQ').AsInteger;

          //prSuplMes  := qry.FieldByName('VALOR_FUNCEF').AsFloat;
          //prINSSMes  := qry.FieldByName('VALOR_INSS').AsFloat;
          //prContMes  := qry.FieldByName('DEDUCOES').AsFloat;
          //prContEqua := qry.FieldByName('DEDUCOES_EQUA').AsFloat;
          //pIRTotal   := qry.FieldByName('SOMA_FONTES').AsInteger;
          //prPercAcao := qry.FieldByName('PERCACAO').AsFloat;    //edilaine WO31036
          //prBaseIR   := qry.FieldByName('BASEIRRF').AsFloat;    //edilaine WO31036
          //edilaine WO32316 : fim
        end;
      except

      end;
    finally
      FreeAndNil(qry);
      FreeAndNil(sParam);    //edilaine WO32316
    end;
  end;

  function Insere_Regra_Irrf_Reducao(pSeq, pFonte : integer; pTributavel, pVlrIrrf, pVlrReducao : double) : Boolean;
  var
    qry: TwwQuery;
    sSql: string;
    sVlrReduz, sTributavel : string;
  begin
    try
      qry := TwwQuery.Create(nil);
      qry.DataBaseName :='BaseDados';

      case pFonte of
        1 : sVlrReduz := 'VALOR_REDUCAO';
        2 : sVlrReduz := 'VALOR_REDUCAOINSS';
        3 : sVlrReduz := 'VALOR_REDUCAOTOT';
      end;
      case pFonte of
        1 : sTributavel := 'VALOR_TRIBUTAVEL';
        2 : sTributavel := 'VALOR_TRIBUTINSS';
        3 : sTributavel := 'VALOR_TRIBUTTOTAL';
      end;

      //edilaine WO31036 : inicio
      if (sVlrReduz <> '') and (sTributavel <> '') then
      begin
        sSQL := 'UPDATE CM.REGRA_IRRF_REDUCAO SET ' + #13#10 +
                ' VALOR_IMPOSTO = '+StringReplace((FloatToStr(pVlrIrrf)), ',', '.', [])     + ', ' + #13#10 +
                ' '+sVlrReduz+ '= '+StringReplace((FloatToStr(pVlrReducao)), ',', '.', [])  + ', ' + #13#10 +
                ' '+sTributavel+ '= '+StringReplace((FloatToStr(pTributavel)), ',', '.', [])+ '  ' + #13#10 +
                ' WHERE SEQ = '+IntToStr(pSeq);

        qry.close;
        qry.SQL.Clear;
        qry.SQL.Text := sSQL;
        try
          qry.ExecSQL;
        except
        end;
      end;
      //edilaine WO31036 : fim
    finally
      FreeAndNil(qry);
    end;
  end;
  //edilaine WO29025 : fim
begin
  //edilaine WO29025 : inicio
  prSuplMes  := 0;
  prINSSMes  := 0;
  prContMes  := 0;
  prContEqua := 0;
  pIRTotal   := 0;
  pVlrTribut := 0;
  prPercAcao := 0;        //edilaine WO31036
  prBaseIR   := 0;        //edilaine WO31036
  prVlrPaINSS:= 0;        //edilaine WO32316
  prVlrPaFUND:= 0;        //edilaine WO32316

  iFontePagadora   := 0;
  pTemDadosReducao := BuscaDadosReducao;
  if pTemDadosReducao then
  begin

  //descomentar em caso de debug de IR via Folha
  //
  {showmessage('pbase:' +floattostr(pBase) +char(13)+
              'pbase+contmes: '+FloatToStr(pBase + prContMes) + char(13)+
              'pbase+contmes+equa: '+FloatToStr(pBase + prContMes + prContEqua) + char(13)+
              'pbase+Pa INSS: '+FloatToStr(pBase + prVlrPaINSS) + char(13)+
              'pbase+Pas: '+FloatToStr(pBase + prVlrPaINSS + prVlrPaFUND) + char(13)+
              'INSS+PA-pbase: '+FloatToStr(Arred(Abs(pBase + prVlrPaINSS - prINSSMes),2)) + char(13)+
              'percacao: '+FloatToStr(prPercAcao) + char(13)+
              'PA Inss: '+FloatToStr(prVlrPaINSS) + char(13)+
              'PA FUND: '+FloatToStr(prVlrPaFUND) + char(13)+
              ' TOTAL ' +char(13)+
              '  Funcef + INSS: '+FloatToStr(prSuplMes + prINSSMes)+ char(13)+
              ' INSS ' +char(13)+
              '   INSS: '+FloatToStr(prINSSMes)+ char(13)+
              '   INSS-PA: '+FloatToStr(prINSSMes - prVlrPaINSS) + char(13)+
              ' FUNCEF ' +char(13)+
              '  Funcef: '+FloatToStr(prSuplMes)+ char(13) +
              '  Funcef+acao: '+FloatTostr(prBaseIR) + char(13)+
              '  Funcef - acao: '+FloatToStr(prSuplMes * (1-(prPercAcao/100)) )+ char(13)
  );  }


     if (FloatToStr(pBase + prContMes) = FloatToStr(prSuplMes)) or
        (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prSuplMes)) or     //funcef
        (FloatToStr(pBase + prContMes + prVlrPaFUND) = FloatToStr(prSuplMes)) or                     //edilaine WO32316
        (FloatToStr(pBase + prContMes + + prContEqua + prVlrPaFUND) = FloatToStr(prSuplMes)) then    //edilaine WO32316
     begin
       pVlrTribut     := prSuplMes;
       iFontePagadora := 1;
     end
     //edilaine WO31036 : inicio
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prBaseIR)) or
             (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prBaseIR)) or   //funcef
             (FloatToStr(pBase + prContMes + prVlrPaFUND) = FloatToStr(prBaseIR)) or                   //edilaine WO32316
             (FloatToStr(pBase + prContMes + prContEqua + prVlrPaFUND) = FloatToStr(prBaseIR)) then    //edilaine WO32316
     begin
       pVlrTribut     := prBaseIR;
       //edilaine WO32316 : inicio
       if pIRTotal = 0 then
          iFontePagadora := 1
       else
          iFontePagadora := 3;
       //edilaine WO32316 : fim
     end
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prSuplMes * (1-(prPercAcao/100)) )) or
             (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prSuplMes * (1-(prPercAcao/100)))) or   //funcef
             (FloatToStr(pBase + prContMes + prVlrPaFUND) = FloatToStr(prSuplMes * (1-(prPercAcao/100)))) or                  //edilaine WO32316
             (FloatToStr(pBase + prContMes + prContEqua + prVlrPaFUND) = FloatToStr(prSuplMes * (1-(prPercAcao/100)))) then   //edilaine WO32316
     begin
       pVlrTribut     := prSuplMes;
       iFontePagadora := 1;
     end
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prBaseIR * (1-(prPercAcao/100)) )) or
             (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prBaseIR * (1-(prPercAcao/100)))) or        //funcef
             (FloatToStr(pBase + prContMes + prVlrPaFUND) = FloatToStr(prBaseIR * (1-(prPercAcao/100)))) or                   //edilaine WO32316
             (FloatToStr(pBase + prContMes + prContEqua + prVlrPaFUND) = FloatToStr(prBaseIR * (1-(prPercAcao/100)))) then    //edilaine WO32316
     begin
       pVlrTribut     := prBaseIR;
       iFontePagadora := 1;
     end
     //edilaine WO31036 : fim
     else if (FloatToStr(pBase) = FloatToStr(prINSSMes)) or                   //inss
             (FloatToStr(pBase + prContMes) = FloatToStr(prINSSMes)) or
             (FloatToStr(pBase + prContMes + prVlrPaINSS) = FloatToStr(prINSSMes)) or      //edilaine WO32316
             (FloatToStr(pBase + prVlrPaINSS) = FloatToStr(prINSSMes)) then                //edilaine WO32316
     begin
       pVlrTribut     := prINSSMes;
       iFontePagadora := 2;
     end
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prSuplMes + prINSSMes)) or
             (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prSuplMes + prINSSMes)) or  //soma fontes
             (FloatToStr(pBase + prContMes + prVlrPaINSS) = FloatToStr(prSuplMes + prINSSMes)) or                     //edilaine WO32316
             (FloatToStr(pBase + prContMes + prContEqua + prVlrPaINSS) = FloatToStr(prSuplMes + prINSSMes)) then      //edilaine WO32316
     begin
       pVlrTribut     := prSuplMes + prINSSMes;
       iFontePagadora := 3;
     end
     //edilaine WO32316 : inicio
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prBaseIR-prINSSMes)) or
             (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prBaseIR-prINSSMes)) then   //funcef
     begin
       pVlrTribut     := prBaseIR-prINSSMes;
       iFontePagadora := 1;
     end
     else if (FloatToStr(pBase + prVlrPaINSS) = FloatToStr(prINSSMes)) or
             (FloatToStr(Arred(Abs(pBase + prVlrPaINSS - prINSSMes),2)) = '0.01') then
     begin
       pVlrTribut     := prINSSMes;
       iFontePagadora := 2;
     end
     else if (FloatToStr(pBase) = FloatToStr((prSuplMes + prINSSMes - prVlrPaINSS - prVlrPaFUND - prContMes) - (prINSSMes - prVlrPaINSS))) or
             (FloatToStr(pBase) = FloatToStr((prSuplMes + prINSSMes - prVlrPaINSS - prVlrPaFUND - prContMes - prContEqua) - (prINSSMes - prVlrPaINSS))) or
             (FloatToStr(pBase + prVlrPaINSS + prVlrPaFUND + prContMes) = FloatToStr((prSuplMes + prINSSMes))) or
             (FloatToStr(Arred(Abs(pBase + prVlrPaINSS + prVlrPaFUND + prContMes - (prSuplMes + prINSSMes)),2)) = '0.01') then
     begin
       pVlrTribut     := prSuplMes + prINSSMes;
       iFontePagadora := 3;
     end
     //edilaine WO32316 : fim
     //edilaine WO31036 : inicio
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prBaseIR + prINSSMes)) or
             (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prBaseIR + prINSSMes)) or  //soma fontes
             (FloatToStr(pBase + prContMes + prVlrPaINSS) = FloatToStr(prBaseIR + prINSSMes)) or                     //edilaine WO32316
             (FloatToStr(pBase + prContMes + prContEqua + prVlrPaINSS) = FloatToStr(prBaseIR + prINSSMes)) then      //edilaine WO32316
     begin
       pVlrTribut     := prSuplMes + prINSSMes;
       iFontePagadora := 3;
     end;
     //edilaine WO31036 : fim
  end;
  //edilaine WO29025 : fim

  //descomentar em caso de debug de IR via Folha
  //
  //showmessage('FONTE: '+INTTOSTR(iFontePagadora) + '  TRIB: '+FLOATTOSTR(pVlrTribut) );

  // Andre Imakawa - SIG 126442 - Inicio
  if CalcIdade(dataref,dtDataNasc) >= IdadeIdoso then   //Ewerton Beltramini - 06/07/2021 - SIG115390
// if (CalcIdade(dataref,dtDataNasc) >= IdadeIdoso)
//    or ((CalcIdade(dataref,dtDataNasc) < IdadeIdoso) AND (trunc((strtodate(dataref) - dtDataNasc) / 365) = 65 )) then   //Ewerton Beltramini - 06/07/2021 - SIG115390
  begin
    pBase := pBase - dVlrIdosos;
    pVlrTribut := pVlrTribut - dVlrIdosos;  //edilaine WO29025
  end;
  // Andre Imakawa - SIG 126442 - Fim

  pBase := pBase - dVlrDependente * pNumDepen;

  if BuscaFaixa(pBase) then
    begin
      pPercentual:= FaixaIRRF.Aliquota_Irrf;
      //Caso seja 0 - Imposto Devido;
      Result     := pPercentual/100 * pBase - FaixaIRRF.ParcDeduzIrrf;

      //edilaine WO29025 : inicio
      pVlrReducao := 0;
      if pVlrTribut > 0 then
      begin
        If BuscaFaixaReducao(pVlrTribut) Then
        begin
          //se for a 1a faixa de reducao entao a renda é isenta de imposto
          if FaixaReducao.Faixa_Trib_Ini = 0 then
             Result := 0
          else if FaixaReducao.FatorIRRF > 0 then
             pVlrReducao := (FaixaReducao.ReducaoIRRF - (FaixaReducao.FatorIRRF * pVlrTribut))
          else
             pVlrReducao := FaixaReducao.ReducaoIRRF;
        end;
      end;

      Result := Result - pVlrReducao;

      if Result < 0 then
         Result := 0;
      //edilaine WO29025 : fim

      Insere_Regra_Irrf_Valores(pBase, FaixaIRRF.ParcDeduzIrrf, pPercentual, Result); // Andre Imakawa - SIG 99651

      //edilaine WO29025 : inicio
      if pTemDadosReducao then
         Insere_Regra_Irrf_Reducao(iSeq, iFontePagadora, pVlrTribut, Result, pVlrReducao);
      //edilaine WO29025 : fim

      Case Tipo of
           1 : Result := pPercentual; //Caso seja Aliquota IRRF
           2 : Result := FaixaIRRF.ParcDeduzIrrf; //Caso seja PARCDEDUZIRRF
      end;

    end
  else
    begin
      pPercentual:=0;
      Result     :=0;
    end;
end;


function TIrrf.CalculaIRRF_Ext(pBase:double):double;
begin
     result := (AliqIRRFExterior/100 * pBase);
end;


end.