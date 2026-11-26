{
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
Pendencia : SIG126442
Descrição : Desfazer ajuste do SIG 115390
Data      : 24/06/2022
------------------------------------------------------------------------------------
Autor     : Ewerton Beltramini
Pendencia : SIG115390
Descrição : Correção do desconto de IR por idade.
Data      : 06/07/2021
------------------------------------------------------------------------------------
}
unit UCalcIrrfMT;

interface

uses
  SysUtils, Classes, uCtrlRegra, uTiposRegraMT, uCmClientDataSet,
  uCmControlObject, wwQuery;

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
      FaixasL      : TStringS;
      FaixaIRRF    : ObjFaixa;
      FaixaReducao : ObjReducao;    //edilaine WO29025
      FaixasRed    : TStrings;      //edilaine WO29025

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
      procedure CarregaFaixasIRRF(Objeto: TCmControlObject; qryAux:TCMClientDataSet;
                                  aEmpresa:Integer; DataRef : String = '');
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

Uses uFuncoesRegraMT;


constructor TIrrf.Create;
begin
  inherited Create;
  FaixasL   := TStringList.Create;
  FaixasRed := TStringList.Create;           //edilaine WO29025

end;

destructor TIrrf.destroy;
begin
  LiberaFaixasIRRF;          // Andre Imakawa - SIG 99651
  LiberaFaixasReducao;       //edilaine WO29025

  FaixasL.Free;
  FaixasRed.Free;            //edilaine WO29025

  //FreeAndNil( FaixaIRRF ); // Andre Imakawa - SIG 99651
  inherited Destroy;
end;


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


procedure TIrrf.CarregaFaixasIRRF(Objeto: TCmControlObject;
                                  qryAux:TCMClientDataSet;
                                  aEmpresa:Integer; DataRef : String);
Var
  SSQL : String;
begin
  If DataRef = '' Then DataRef := DateToStr(Date);
  With qryAux Do Begin
    LiberaFaixasIRRF;
    LiberaFaixasReducao;                   //edilaine WO29025

    Close;

    sSql := 'SELECT H.IDADEIDOSO, H.VLRIDOSO, H.VLRDEPENDENTE, H.PERCIRRFEXTERIOR '+
            'FROM HSTPARAMIRRF H, '+
            '(SELECT DISTINCT FAIXA_IRRF, MAX(DATAINIVIGENCIA) AS DATA '+
            ' FROM IRRF '+
            ' WHERE DATAINIVIGENCIA <= TO_DATE('+ QuotedStr(DataRef) +',''DD/MM/YYYY'') '+
            ' GROUP BY FAIXA_IRRF) T '+
            'WHERE H.DATAINIVIGENCIA = T.DATA '+
            'ORDER BY DATAINIVIGENCIA DESC ';

    Data := Objeto.GetDataPacket(sSQL);

    iIdadeIdoso   := FieldByName('idadeidoso').AsInteger;
    dVlrIdosos    := FieldByName('vlridoso').AsFloat;
    dVlrDependente:= FieldByName('vlrdependente').AsFloat;

    AliqIRRFExterior := FieldByName('PERCIRRFEXTERIOR').AsFloat;

    Close;

    sSql := ' SELECT '+
            ' I.IDIRRF, I.FAIXA_IRRF, I.ALIQUOTA_IRRF, I.PARCDEDUZIRRF, I.DATAINIVIGENCIA '+
            ' FROM IRRF I, (SELECT DISTINCT FAIXA_IRRF, MAX(DATAINIVIGENCIA) AS DATA '+
            '               FROM IRRF WHERE DATAINIVIGENCIA <= TO_DATE('+ QuotedStr(dataRef) +',''DD/MM/YYYY'') '+
            '               GROUP BY FAIXA_IRRF) T '+
            ' WHERE '+
            ' T.FAIXA_IRRF = I.FAIXA_IRRF AND '+
            ' T.DATA = I.DATAINIVIGENCIA '+
            'ORDER BY I.DATAINIVIGENCIA DESC , I.FAIXA_IRRF ';

    Data := Objeto.GetDataPacket(sSQL);

    while not Eof do begin
      FaixaIRRF := ObjFaixa.Create;
      FaixaIRRF.Faixa_Irrf    := FieldByName('faixa_irrf').AsFloat;
      FaixaIRRF.Aliquota_Irrf := FieldByName('aliquota_irrf').AsFloat;
      FaixaIRRF.ParcDeduzIrrf := FieldByName('parcdeduzirrf').AsFloat;
      FaixasL.AddObject('',FaixaIRRF);
      Next;
    end;
    Close;

    //edilaine WO29025 : inicio
    sSql := 'SELECT FAIXA_TRIBUTAVEL, REDUCAO, FATOR,     '+
            '       CASE                                  '+
            '         WHEN LAG(I.FAIXA_TRIBUTAVEL) OVER (ORDER BY I.FAIXA_TRIBUTAVEL) IS NULL THEN 0  '+
            '         ELSE LAG(I.FAIXA_TRIBUTAVEL) OVER (ORDER BY I.FAIXA_TRIBUTAVEL) + 0.01          '+
            '       END AS FAIXA_TRIBUTAVEL_LINHA_ANTERIOR '+
            '  FROM IRRF_REDUCAO I,                      '+
            '       (SELECT MAX(DATAINIVIGENCIA) AS DATA '+
            '          FROM IRRF_REDUCAO                 '+
            '         WHERE DATAINIVIGENCIA <= TO_DATE('+QuotedStr(dataRef) +',''DD/MM/YYYY'') '+
            '       ) T '+
            ' WHERE '+
            '   T.DATA = I.DATAINIVIGENCIA '+
            'ORDER BY I.FAIXA_TRIBUTAVEL   ';

    Data := Objeto.GetDataPacket(sSQL);

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

  end; { With qryAux Do Begin }
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

  function Insere_Regra_Irrf_Valores(pValorBase, pValorDeduzir, pPercentual, pValorImposto : double): Boolean;
  var
    qry: TwwQuery;
    sSql: string;
  begin
    try
      qry := TwwQuery.Create(nil);
      qry.DataBaseName       :='BaseDados';

      sSQL := 'INSERT INTO CM.REGRA_IRRF_VALORES(SEQ, VALOR_BASE, VALOR_PARCELA_DEDUZIR, VALOR_PERCENTUAL, VALOR_IMPOSTO' + #13#10 +
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
  begin
    try
      qry := TwwQuery.Create(nil);
      qry.DataBaseName :='BaseDados';

      sSQL := 'SELECT SEQ, VALOR_FUNCEF, VALOR_INSS, SOMA_FONTES, DEDUCOES, DEDUCOES_EQUA, '+
              '       PERCACAO, BASEIRRF '+ //edilaine WO31036
              '  FROM CM.REGRA_IRRF_REDUCAO ';
      qry.close;
      qry.SQL.Clear;
      qry.SQL.Text := sSQL;
      try
        qry.Open;
        result := not qry.isEmpty;
        if not qry.isEmpty then
        begin
          prSuplMes  := qry.FieldByName('VALOR_FUNCEF').AsFloat;
          prINSSMes  := qry.FieldByName('VALOR_INSS').AsFloat;
          prContMes  := qry.FieldByName('DEDUCOES').AsFloat;
          prContEqua := qry.FieldByName('DEDUCOES_EQUA').AsFloat;
          pIRTotal   := qry.FieldByName('SOMA_FONTES').AsInteger;
          iSeq       := qry.FieldByName('SEQ').AsInteger;
          prPercAcao := qry.FieldByName('PERCACAO').AsFloat;    //edilaine WO31036
          prBaseIR   := qry.FieldByName('BASEIRRF').AsFloat;    //edilaine WO31036
        end;
      except

      end;
    finally
      FreeAndNil(qry);
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
  prPercAcao := 0;   //edilaine WO31036
  prBaseIR   := 0;   //edilaine WO31036

  iFontePagadora := 0;
  pTemDadosReducao := BuscaDadosReducao;
  if pTemDadosReducao then
  begin
     if (FloatToStr(pBase + prContMes) = FloatToStr(prSuplMes)) or
        (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prSuplMes)) then   //funcef
     begin
       pVlrTribut     := prSuplMes;
       iFontePagadora := 1;
     end
     //edilaine WO31036 : inicio
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prBaseIR)) or
             (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prBaseIR)) then   //funcef
     begin
       pVlrTribut     := prBaseIR;
       iFontePagadora := 1;
     end
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prSuplMes * (1-(prPercAcao/100)) )) or
             (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prSuplMes * (1-(prPercAcao/100)))) then   //funcef
     begin
       pVlrTribut     := prSuplMes;
       iFontePagadora := 1;
     end
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prBaseIR * (1-(prPercAcao/100)) )) or
             (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prBaseIR * (1-(prPercAcao/100)))) then   //funcef
     begin
       pVlrTribut     := prBaseIR;
       iFontePagadora := 1;
     end
     //edilaine WO31036 : fim
     else if (FloatToStr(pBase) = FloatToStr(prINSSMes)) or                //inss
             (FloatToStr(pBase + prContMes) = FloatToStr(prINSSMes)) then  //edilaine WO31036
     begin
       pVlrTribut     := prINSSMes;
       iFontePagadora := 2;
     end
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prSuplMes + prINSSMes)) or
        (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prSuplMes + prINSSMes)) then  //soma fontes
     begin
       pVlrTribut     := prSuplMes + prINSSMes;
       iFontePagadora := 3;
     end
     //edilaine WO31036 : inicio
     else if (FloatToStr(pBase + prContMes) = FloatToStr(prBaseIR + prINSSMes)) or
        (FloatToStr(pBase + prContMes + prContEqua) = FloatToStr(prBaseIR + prINSSMes)) then  //soma fontes
     begin
       pVlrTribut     := prBaseIR + prINSSMes;
       iFontePagadora := 3;
     end;
     //edilaine WO31036 : fim
  end;
  //edilaine WO29025 : fim

  // Andre Imakawa - SIG 126442 - Inicio
  if CalcIdade(dataref,dtDataNasc) >= IdadeIdoso then   //Ewerton Beltramini - 06/07/2021 - SIG115390
  //if (CalcIdade(dataref,dtDataNasc) >= iIdadeIdoso)
  //  or ((CalcIdade(dataref,dtDataNasc) < iIdadeIdoso) AND (trunc((strtodate(dataref) - dtDataNasc) / 365) = 65 )) then   //Ewerton Beltramini - 06/07/2021 - SIG115390
  begin
    pBase := pBase - dVlrIdosos;
    pVlrTribut := pVlrTribut - dVlrIdosos;  //edilaine WO29025
  end;
  // Andre Imakawa - SIG 126442 - Fim

  pBase := pBase - (dVlrDependente * pNumDepen);

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