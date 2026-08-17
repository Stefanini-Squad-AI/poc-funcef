{-----------------------------------------------------------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
Rotina...........: _
Nº SOL...........: 198886.18334
Data da Alteração: 10/01/2017
Responsável......: Darivaldo Alencar
Descrição........: Criação deste fonte.
-----------------------------------------------------------------------------------------------------------------------------------}
unit uCtrlClasseTaxaDep;
interface
uses
     DB,  uCmDbObject, uCmControlObject,  SysUtils, Math, uCMMath, Wwquery,
     dbclient, Provider, uMidasUtil,   uCMTypes, dMTBem,uDiasUteis,uCmfileUtils, USistema;
Type
   TCtrlClasseTaxaDep = class(TCmControlObject)
   private
     FcdsTaxaDep : TClientDataSet;
     procedure SetcdsTaxaDep(const Value: TClientDataSet);
   public
     Constructor Create;
     Destructor  Destroy; Override;
     function  TxDepreciacaoClasseHerdada(nIdClasse: Extended): OleVariant;
     property  cdsTaxaDep : TClientDataSet read FcdsTaxaDep write SetcdsTaxaDep;
end;

implementation

Constructor TCtrlClasseTaxaDep.Create;
 begin
    inherited;
 end;

Destructor  TCtrlClasseTaxaDep.Destroy;
 begin
   inherited Destroy;
 end;

function TCtrlClasseTaxaDep.TxDepreciacaoClasseHerdada(nIdClasse: Extended): OleVariant;
   var sSQL: String;
begin
  sSQL:= ' SELECT IDCLASSEBEM, TAXADEP, VIDAUTIL, ''Brasil'' AS DESCTAXADEP, 1 as IDTAXADEP  FROM CLASSETAXADEP ';
   if (nIdClasse <> -1) then
      sSql := sSql + ' WHERE (IDCLASSEBEM = ' + floattostr(nIdClasse) + ') ' + #13;

  Result := GetDataPacket(sSql);
end;

procedure TCtrlClasseTaxaDep.SetcdsTaxaDep(const Value: TClientDataSet);
begin
   FcdsTaxaDep := Value;
end;

end.
