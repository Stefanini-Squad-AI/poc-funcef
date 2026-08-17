{
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

{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
         
unit UCalcIrrf2;

interface

uses
  SysUtils, Classes, StdCtrls, WinTypes,dbtables, wwQuery ;


Type
  ObjFaixa = Class(TObject)
               Faixa_IRRF,
               Aliquota_IRRF,
               ParcDeduzIRRF : double;
              End;


  TIRRF = Class(TObject)
    Private
      FaixasL      : TStringS;
      FaixaIRRF    : ObjFaixa;
      IdadeIdoso   : integer;
      VlrIdosos    : Double;
      VlrDependente: Double;
      // Fernando - Funcef - 11/10/2001
      AliqIRRFExterior : Double;
      function CalcIdade(dataref:string;dDataNasc:TDateTime):integer;
      {Atenção: Rever esta rotina, pois os Anos Bisextos não estão sendo considerados}
      function BuscaFaixa(pBase:Double):boolean;
    public
      procedure LiberaFaixasIRRF;
      procedure CarregaFaixasIRRF(qryAux:TwwQuery;aEmpresa:Integer);
      function CalculaIRRF(pNumDepen:integer;dtDataNasc:TDateTime;
                           Var pBase,pPercentual:Double; DataRef:String;
                           Tipo:LongInt):double;
      // Fernando - Funcef - 11/10/2001
      function CalculaIRRF_Ext(pBase:double):double;
      
//   CRIACAO E LIBERAÇAO DO OBJETO PRINCIPAL
      constructor Create;
      destructor Destroy; override;
  End;


implementation

//   CRIACAO E LIBERAÇAO DO OBJETO PRINCIPAL
constructor TIrrf.Create;
begin
  inherited Create;
  FaixasL:=TStringList.Create;
end;

destructor TIrrf.destroy;
begin
  FaixasL.Free;
  inherited Destroy;
end;



//   PROCEDIMENTO PARA UTILIZACAO DA LISTA

procedure TIrrf.LiberaFaixasIRRF;
var
  Item:Integer;
begin
  for Item:=0 to FaixasL.Count-1 do
    FaixasL.Objects[Item].Free;
  FaixasL.Clear;
end;


procedure TIrrf.CarregaFaixasIRRF(qryAux:TwwQuery;aEmpresa:Integer);
begin
  with qryAux do
  begin
    LiberaFaixasIRRF;
    Close;
    SQL.Clear;
    SQL.Add('select idadeidoso,vlridosos,vlrdependente');
    // Fernando - Funcef - 11/10/2001
    SQL.Add(',PERCIRRFEXTERIOR ');
    SQL.Add('from   PARAMIRRF                         ');
    SQL.Add('where  idpessoa='+IntToStr(aEmpresa)      );
    Open;
    IdadeIdoso   := FieldByName('idadeidoso').AsInteger;
    VlrIdosos    := FieldByName('vlridosos').AsFloat;
    VlrDependente:= FieldByName('vlrdependente').AsFloat;
    // Fernando - Funcef - 11/10/2001
    AliqIRRFExterior := FieldByName('PERCIRRFEXTERIOR').AsFloat;
    Close;
    Sql.Clear;
    Sql.Add('select faixa_irrf,aliquota_irrf,parcdeduzirrf ');
    Sql.Add('from IRRF                                     ');
    Sql.Add('order by faixa_irrf                           ');
    Open;
    while not Eof do
    begin
      FaixaIRRF := ObjFaixa.Create;
      with FaixaIRRF do
      begin
        Faixa_Irrf    := FieldByName('faixa_irrf').AsFloat;
        Aliquota_Irrf := FieldByName('aliquota_irrf').AsFloat;
        ParcDeduzIrrf := FieldByName('parcdeduzirrf').AsFloat;
      end;
      FaixasL.AddObject('',FaixaIRRF);
      Next;
    end;
    Close;
  end;
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


//  PROCEDIMENTOS AUXILIARES

// Atenção: Rotina Alterada a divisão era por 365 agora é ´por 365.25 devido ao ano bissexto.

function TIrrf.CalcIdade(dataref:string;dDataNasc:TDateTime):integer;
 var dt: tdatetime;
     r: real;
     d1,m1,a1,d2,m2,a2: word;
     diffa: integer;
begin
 if (Trim(DateToStr(dDataNasc)) = '') then
    Result := 0
 else
   try
     decodedate(ddatanasc, a1, m1, d1);
     decodedate(strtodate(dataref), a2, m2, d2);
     diffa:=a2-a1-1;
     if diffa > 0 then
     begin
       if m2 > m1 then
         inc(diffa)
       else
         if m2 = m1 then
         begin
           if d2 >= d1 then
             inc(diffa);
         end;
       result:=diffa;
     end
     else
       diffa:=0;
   except
     result:=0;
   end;
end;


//  PROCEDIEMENTO PRINCIPAL - CHAMADA EXTERNA

Function TIrrf.CalculaIRRF(pNumDepen:integer;dtDataNasc:TDateTime;
                           var pBase,pPercentual:double;dataref:string;
                           Tipo : LongInt):double;
begin
  pBase := pBase - VlrDependente * pNumDepen;
  // Andre Imakawa - SIG 126442 - Inicio
  if CalcIdade(dataref,dtDataNasc) >= IdadeIdoso then   //Ewerton Beltramini - 06/07/2021 - SIG115390
  //if (CalcIdade(dataref,dtDataNasc) >= IdadeIdoso)
  //  or ((CalcIdade(dataref,dtDataNasc) < IdadeIdoso) AND (trunc((strtodate(dataref) - dtDataNasc) / 365) = 65 )) then   //Ewerton Beltramini - 06/07/2021 - SIG115390
    pBase := pBase - VlrIdosos;
  // Andre Imakawa - SIG 126442 - Fim
  
  if BuscaFaixa(pBase) then
    begin
      pPercentual:= FaixaIRRF.Aliquota_Irrf;
      //Caso seja 0 - Imposto Devido;
      Result     := pPercentual/100 * pBase - FaixaIRRF.ParcDeduzIrrf;
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

// Fernando - Funcef - 11/10/2001
function TIrrf.CalculaIRRF_Ext(pBase:double):double;
begin
     result := (AliqIRRFExterior/100 * pBase);
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

