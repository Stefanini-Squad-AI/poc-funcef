unit uCtrlAlcadas;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina..........: uCtrlAlcadas
N. Sol..........: 142171
N. Kintana......: 913629
Data............: 12/08/2011
Responsável.....: Vinicius Eduardo Nascimento Maciel
Descrição.......: Criação da classe de controle para o cadastro de Alçadas.
-------------------------------------------------------------------------------}
interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMTypes, uCMClientDataSet, uDbAlcadas;

type
     TCtrlAlcadas = Class(TCmControlObject)

private
    fDBAlcadas : TDbAlcadas;
    procedure setDtAtualizacaoValores(IdAlcadas : String);
    procedure DoChangeDataBase;
public
    function verificaExistenciaAlcadas(sFlag :String): Boolean;
    function verificaValorLimite(sDtInicio: TDateTime): Currency;
    function verificaValorMenor(sDtInicio: TDateTime): Currency;
    function verificaFlagLimite: boolean;
    function verificaAlcadaAcimaDe(sData : string; sIdAlcadas: String = ''; bAlterar : boolean=false): Boolean;
    function verificaAlcadaAte(sData,sCargo: string; sIdAlcadas: String=''; bAlterar: boolean =false): Boolean;
    function verificaAlcadaAteGeral(sData : String) : Boolean;
    function Gravar(Cds: TCMCLientDataSet) :Boolean;
    constructor Create; reintroduce;
    destructor Destroy; override;
    function listaAlcadas (iIdContrato : String) :OleVariant;
    function listaCargos: OleVariant;
end;
implementation

{ TCtrlContratos }

constructor TCtrlAlcadas.Create;
    begin
    inherited Create;
    fDBAlcadas := TDBAlcadas.Create(self);
end;

destructor TCtrlAlcadas.Destroy;
    begin
    inherited;
    fDBAlcadas.Free;
end;

function TCtrlAlcadas.listaAlcadas(iIdContrato : String) :OleVariant;
    var
    sSQL : String;
    begin
    sSQL := ' SELECT ALC.* FROM ALCADAS ALC';
    sSQL := sSQL + ' where IDALCADAS = '+QuotedStr(iIdContrato);
    result := GetDataPacket( sSql );
end;

function TCtrlAlcadas.listaCargos :OleVariant;
    var
    sSQL : String;
    begin
    sSQL := 'SELECT CG.IDCARGO, CG.TITULO from CARGO CG ORDER BY CG.TITULO';
    result := GetDataPacket( sSql );
end;


function TCtrlAlcadas.Gravar(Cds : TCMCLientDataSet) : Boolean;
var
   sSQL :String;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
   begin
       Result := Connection.AppServer.Gravar(Cds.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
       StartTransaction;
       try
       FDbAlcadas.DataBaseName:=DataBaseName;
       Result := ApplyCds (Cds,FDbAlcadas,[],[]);
       if not Result then raise Exception.create( FDbAlcadas.MessageInfo );
       setDtAtualizacaoValores(FDbAlcadas.IdAlcadas.AsString);
       commit;
       except
       on E:Exception do
       begin
           MessageInfo := E.Message;
           Rollback;
           Result := False;
       end;
   end;

   end;
end;


procedure TCtrlAlcadas.setDtAtualizacaoValores(IdAlcadas : String);
var
sSQL: String;
begin
sSQL := 'UPDATE ALCADAS SET DTATUALIZACAOVALORES = SYSDATE ' +
        ' WHERE IDALCADAS = '+QuotedStr(IdAlcadas);
ExecSQL(sSQL);
end;

function TCtrlAlcadas.verificaFlagLimite : boolean;
var
    sSQL : String;
    cdsVerificaFlag : TCMClientDataSet;
begin
    cdsVerificaFlag := TCMClientDataSet.Create( nil );
    sSQL := 'SELECT * FROM ALCADAS WHERE FLGLIMITE = '+QuotedStr('> ');
    cdsVerificaFlag.Data := GetDataPacket (sSQL);
    Result :=  cdsVerificaFlag.isEmpty;
    cdsVerificaFlag.Free;
end;

function TCtrlAlcadas.verificaValorLimite(sDtInicio: TDateTime) : Currency;
var
    sSQL : String;
    cdsValor : TCMClientDataSet;
begin
    cdsValor := TCMClientDataSet.Create( nil );
    sSQL := sSQL + ' SELECT MAX(VALOR) AS VALOR FROM (SELECT MAX(DTINICIOVIGENCIA) DATA, IDCARGO FROM ALCADAS  ';
    sSQL := sSQL +  ' WHERE (DTINICIOVIGENCIA <= TO_DATE('+QuotedStr(DateToStr(sDtInicio))+') ) ';
    sSQL := sSQL +  ' AND FLGLIMITE = '+QuotedStr('> ');
    sSQL := sSQL +  ' GROUP BY IDCARGO)ALCI, ALCADAS ALC ';
    sSQL := sSQL +  ' WHERE ALCI.DATA = ALC.DTINICIOVIGENCIA ';
    cdsValor.Data := GetDataPacket (sSQL);
    Result :=  cdsValor.FieldByName('VALOR').AsFloat;
    cdsValor.Free;
end;


procedure TCtrlAlcadas.DoChangeDataBase;
begin
     fDBAlcadas.DataBaseName := DataBaseName;
end;

function TCtrlAlcadas.verificaExistenciaAlcadas(sFlag :String) : Boolean;
var
    sSQL : String;
    cdsValor : TCMClientDataSet;
begin
    cdsValor := TCMClientDataSet.Create( nil );
    sSQL := 'SELECT VALOR FROM ALCADAS WHERE FLGLIMITE = '+QuotedStr(sFlag);
    cdsValor.Data := GetDataPacket (sSQL);
    Result :=  not (cdsValor.isEmpty);
    cdsValor.Free;
end;



function TCtrlAlcadas.verificaValorMenor(sDtInicio: TDateTime): Currency;
var
    sSQL : String;
    cdsMenor : TCMClientDataSet;
begin
    cdsMenor := TCMClientDataSet.Create( nil );
    sSQL := sSQL + ' SELECT MAX(VALOR) AS VALOR FROM (SELECT MAX(DTINICIOVIGENCIA) DATA FROM ALCADAS  ';
    sSQL := sSQL +  ' WHERE (DTINICIOVIGENCIA <= TO_DATE('+QuotedStr(DateToStr(sDtInicio))+') ) ';
    sSQL := sSQL +  ' AND FLGLIMITE = '+QuotedStr('<=');
    sSQL := sSQL +  ' )ALCI, ALCADAS ALC ';
    sSQL := sSQL +  ' WHERE ALCI.DATA = ALC.DTINICIOVIGENCIA ';
    cdsMenor.Data := GetDataPacket (sSQL);
    Result :=  cdsMenor.FieldByName('VALOR').AsFloat;
    cdsMenor.Free;
end;

function TCtrlAlcadas.verificaAlcadaAcimaDe(sData,sIdAlcadas: String; bAlterar : boolean): Boolean;
var
    sSQL : String;
    cdsAux : TCMClientDataSet;
begin
    cdsAux := TCMClientDataSet.Create( nil );
    sSQL := 'SELECT VALOR FROM ALCADAS WHERE FLGLIMITE = '+QuotedStr('> ');
    sSQL := sSQL + 'AND DTINICIOVIGENCIA = TO_DATE('+quotedStr(sData)+')';
    if (bAlterar) then
    sSQL := sSQL + ' AND IDALCADAS <> '+QuotedStr(sIdAlcadas);
    cdsAux.Data := GetDataPacket (sSQL);
    Result :=  not (cdsAux.isEmpty);
    cdsAux.Free;
end;


function TCtrlAlcadas.verificaAlcadaAte(sData,sCargo,sIdAlcadas: String; bAlterar: boolean): Boolean;
var
    sSQL : String;
    cdsAux : TCMClientDataSet;
begin
    cdsAux := TCMClientDataSet.Create( nil );
    sSQL := 'SELECT VALOR FROM ALCADAS WHERE FLGLIMITE = '+QuotedStr('<=');
    sSQL := sSQL + 'AND DTINICIOVIGENCIA = TO_DATE('+quotedStr(sData)+')';
    if (sCargo <> '') then
    sSQL := sSQL + 'AND IDCARGO = '+sCargo
    else
    sSQL := sSQL + 'AND IDCARGO IS NULL';
    if (bAlterar) then
    sSQL := sSQL + ' AND IDALCADAS <> '+QuotedStr(sIdAlcadas);
    cdsAux.Data := GetDataPacket (sSQL);
    Result :=  not (cdsAux.isEmpty);
    cdsAux.Free;
end;

function TCtrlAlcadas.verificaAlcadaAteGeral(sData: String): Boolean;
var
    sSQL : String;
    cdsAux : TCMClientDataSet;
begin
    cdsAux := TCMClientDataSet.Create( nil );
    sSQL := 'SELECT VALOR FROM ALCADAS WHERE FLGLIMITE = '+QuotedStr('<=');
    sSQL := sSQL + 'AND DTINICIOVIGENCIA = TO_DATE('+quotedStr(sData)+')';
    cdsAux.Data := GetDataPacket (sSQL);
    Result :=  not (cdsAux.isEmpty);
    cdsAux.Free;
end;

end.
