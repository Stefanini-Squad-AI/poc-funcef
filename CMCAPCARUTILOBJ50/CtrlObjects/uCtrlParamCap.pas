{ --------------------------------------------------------------------------------------------------
Rotina......: ListParamCAP
Nº SOL......: 136242
Nº KINTANA..: 813941
Data........: 31/08/2011
Responsável.: José Roberto Marque - JRM6
Descrição...: Implementação dos campos : VLRMINIRRF P.VLRMINCS e P.VLRBASEINSS
--------------------------------------------------------------------------------------------------
Rotina ......: carregaAtividade e recuperaAtividadePerd
SOL..........: 163982
Kintana......: 1404974
Data.........: 23/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi adicionado estas rotinas para trabalhar com o from
               frmLancDocCapCarMt para que eles retornem uma atividade buscando
               pelo código.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListParamCAP
Nº SOL......: 124570/3781 e 124570/3782
Nº KINTANA..: 1136318 e 1136319
Data........: 08/02/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação dos campos PathEtlHom e PathEtlProducao
---------------------------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
 Rotinas   : ListParamCAP
 Data      : 30/07/2007
 Autor     : Marcus Oliveira
 Pendência : 25312
 Descrição : Criado 2 parametros na paramcap: IdPlanoPrev e IdPatro.
{------------------------------------------------------------------------------
 Rotinas   : ListParamCAP
 Data      : 02/06/2006
 Autor     : Alex Pereira
 Pendência : 22515
 Descrição : Modificar parametrização contábil tabela aranha
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
 Rotinas   : procure pelo número da pendência
 Data      : 27/04/2005
 Autor     : André Tavares
 Pendência : 19097
 Descrição : retirar os parâmetros FLGEXCLUIPLANIL e FLGEXCLUICONTAB
------------------------------------------------------------------------------}
// andre tavares - pendência 16971 - 18/10/2004 - inclusão da coluna FLGINTEGRAORC
unit uCtrlParamCap;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbFormaRecPag, uSistema, DB, uDataBase,
     DbClient, Classes, uCmTypes, uDBParamCap, uDBParamRelats;

type

  TCtrlParamCap = class(TCmControlObject)
  Protected
    procedure OnCreateAppServer; override;

  private
    _DbParamCAP    : TDbParamCAP;
    _DbParamRelats : TDbParamRelats;
    function carregaAtividade(sCodAtividade: String): OleVariant; //VINICIUS MACIEL - SOL 163982 KTN 1404974
  Public
    _Cds           : TClientDataSet;
    _CdsRel        : TClientDataSet;
    constructor Create; Override;
    destructor  Destroy; Override;
    function ListParamCAP(pRecPag : String; pIDPessoa : Integer) : Olevariant;
    function ListParamREL(pIDModulo : Integer; pIDPessoa : Integer) : Olevariant;
    function recuperaAtividadePerd(sCodAtividade: String): String; //VINICIUS MACIEL - SOL 163982 KTN 1404974

    function GravaRelatorio : Boolean;
    function GravaParamCap : Boolean;
end;


implementation

{ TCtrlParacamCap }

function TCtrlParamCap.GravaRelatorio : Boolean;
var Msg : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaRelatorio(_CdsRel.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(_CdsRel,_DbParamRelats,[],[]);
      Msg    := _DbParamRelats.MessageInfo;
      if not Result then raise Exception.create(Msg);
      Commit;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

constructor TCtrlParamCap.Create;
begin
  inherited;
  _DbParamCAP    := TDbParamCAP.Create(self);
  _DbParamRelats := TDbParamRelats.Create(self);
end;

destructor TCtrlParamCap.Destroy;
begin
  if isAppServer then _Cds.Free;
  if isAppServer then _CdsRel.Free;
  _DbParamCAP.Free;
  _DbParamRelats.Free;
  inherited;
end;

function TCtrlParamCap.ListParamCAP(pRecPag: String;
  pIDPessoa: Integer): Olevariant;
var sListSQL : TStrings;
begin
  sListSQL := TStringList.Create;
  with sListSQL do
  begin
    Append('SELECT');
    //Marcus Oliveira P.25312 30/07/2007
    Append('  P.IDPLANOPREV, P.IDPATRO,                                  ');

    Append('  P.RECPAG, P.IDPESSOA, P.MASCARADESEMB, P.CODALTERADORJUROS,');
    Append('  P.CODADFORNE, P.HISTPADFINAN, P.DD30, P.DD60, P.DD90, P.DD120,');
    Append('  P.DD150, P.DD180, P.LOCALEMISCHEQUE, P.LANCAFINANC, P.INTEGRACONTAB,');
    Append('  P.IDUSUARIOINCLUSAO, P.CODALTERADORABAT, P.CODALTERADORDESC,');
    Append('  P.CODALTERADORTARIF, P.IMPGENERICA, P.IDTIPOCLIADIANTO, P.NUMDIASVENCTO, P.IDIMPRESSORA, P.FLGESTEXCFINANC, P.FLGEMITELANCBAIX, P.FLGOBRIGFORMAPGTO,');
    //catia - p: 19394 - 16/06/2006
    Append('  P.FLGOBRIGAUSUARIO ,');
     //catia - p: 18951 - 16/06/2006
    Append('  P.FLGOBRIGAPROG ,');
    // início andre tavares - pendencia 19097 - 26/04/2005
    Append('  P.FLGCORRIGEDOCAUTO, P.CODAltJurosSimples, P.CODAltJurosComposto, P.CODAltCorrecao, P.CODAltMulta, ');
    Append('  P.IDRAMOFORNECEDOR, P.FLGCONTROLACHEQUE, P.MASCARANODOCUM, P.FLGCOMPLTIPOFAT, P.FLGLANCAFLOAT,');
    // fim andre tavares - pendencia 19097 - 26/04/2005

    Append('  P.IDREPORTS, P.ORIGEMCM, R.NAME, P.FLGTRDXCCXCONTA, P.FLGTRDXIMPOSTOS, P.FLGSTATUSFINANC, P.CODTIPDOCCPMF,');
    Append('  P.CODPORTFORMA, P.FLGMODADDOCPG, P.FLGSLIPAUTO, P.FLGBAIXACHQ, P.FLGOPAUTO, P.FLGRADLOTE, ');
    Append('  P.FLGACESSLANCDOC, P.FLGFLOATDIAUTIL, P.FLGINTEGRAORC, ');
    // Alex 22515 05/06/2006
    Append('  P.FLGPCPCCUSTO, P.FLGPCPPRG, P.FLGPCPPATRO, P.FLGPCPCONTA, P.FLGPCPCONTAPASS, ');
    Append('  P.FLGPCPDECCPRPA, P.FLGPCPDECCPR, P.FLGPCPDECC, P.FLGPCPDEPR, P.FLGPCPDECCPA, ');
    Append('  P.FLGPCPDEPRPA, P.FLGPCPDEPA, P.FLGPCPDE, ');
    // Alex 22515 05/06/2006

    Append('  P.FLGOBRIGAMESMOPP, ');

    //andré tavares - pendência 26515 - 05/10/2007
    Append('  NVL(P.FLGDESVINCCC, ''N'') AS FLGDESVINCCC, ');

    // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
    Append('  P.PathEtlHom, P.PathEtlProducao, ');

    //pendência 27101 - 14/01/2008
    Append('  NVL(FLGGERALOGFINAN, ''N'') AS FLGGERALOGFINAN, ');
    // Inicio sol 136242 / Kintana 813941
    Append('  P.VLRMINIRRF, P.VLRMINCS, P.VLRBASEINSS' );
    // Término sol 136242 / Kintana 813941

    //Bruno Bastos - Pend. 14399 e 14400 - 13/08/2003
    Append('FROM');
    // ANDRE TAVARES - PENDÊNCIA 16954 - 13/09/2004 - inclui o campo FLGFLOATDIAUTIL
    //andre tavares - pendência 16971 - 18/10/2004 - inclusão da coluna FLGINTEGRAORC
    Append('  PARAMCAP P, REPORTS R');
    Append('WHERE');
    Append('  P.IDPESSOA = ' + IntToStr(pIDPessoa) + ' AND');
    Append('  P.RECPAG = ' + QuotedStr(pRecPag) + ' AND');
    Append('  P.IDREPORTS = R.IDREPORTS(+) AND');
    Append('  P.ORIGEMCM = R.ORIGEMCM(+)');
  end;
  Result := GetDataPacket(sListSQL);
  sListSQL.Free;
end;

function TCtrlParamCap.GravaParamCap: Boolean;
var Msg : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaParamCap(_Cds.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Msg := 'Inclusão/Alteração Não Efetuada. ';
      StartTransaction;
      Result := ApplyCds(_Cds, _DbParamCAP,[],[]);
      Msg    := Msg + _DbParamCAP.MessageInfo;
      if not Result then raise Exception.Create(Msg);
      Commit;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;
function TCtrlParamCap.ListParamREL(pIDModulo,
  pIDPessoa: Integer): Olevariant;
var sListSQL : TStrings;
begin
  sListSQL := TStringList.Create;
  with sListSQL do
  begin
    Append('SELECT');
    Append('  IDPARAMRELATS,');
    Append('  IDMODULO,');
    Append('  IDPESSOA,');
    Append('  NOMECOMPO,');
    Append('  DESCRICAO,');
    Append('  VALOR,');
    Append('  NOMERELATORIO');
    Append('FROM');
    Append('  PARAMRELATS');
    Append('WHERE');
    Append(' (IDMODULO = ' + IntToStr(pIDModulo) + ') AND');
    Append(' (IDPESSOA = ' + IntToStr(pIDPessoa) + ')');
    Append('ORDER BY NOMERELATORIO, DESCRICAO, VALOR');
  end;
  Result := GetDataPacket(sListSQL);
  sListSQL.Free;
end;

procedure TCtrlParamCap.OnCreateAppServer; //andre tavares - 13/12/2005
begin
  inherited;
  _Cds           := TClientDataSet.Create(nil);
  _CdsRel        := TClientDataSet.Create(nil);
end;

//Vinicius Maciel - SOL 163982 KTN 1404974
function TCtrlParamCap.recuperaAtividadePerd(sCodAtividade : String) : String;
var
    CdsAux : TClientDataSet;
begin
    CdsAux := TClientDataSet.create(nil);
    CdsAux.Data := carregaAtividade(sCodAtividade);
    Result := CdsAux.FieldByName('Nome').asString;
    CdsAux.Free;
end;


function TCtrlParamCap.carregaAtividade(sCodAtividade : String) :OleVariant;
var
    sSQl : String;
begin
    sSQL := 'SELECT NOME FROM UNIDNEGOCIO WHERE UNIDNEGOC = '+sCodAtividade;
    result := GetDataPacket(sSQL);
end;

//Vinicius Maciel - SOL 163982 KTN 1404974 - Fim


end.
