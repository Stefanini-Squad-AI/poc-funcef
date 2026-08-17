{--------------------------------------------------------------------------------------------------
Nº SIG......: 78744
Data........: 23/11/2018
Responsável.: Everson Cunha
Descrição...: Alterar a forma de gravação, para primeiro gravar o registro pai (curso) e depois
              o registro filho (turma). fCadCursoMT. Tibero
---------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descricao...: reestruturação da tela de registro coletivo de treinamento
Rotina......: GetCodigo, Gravar, Excluir
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 163982/7081
Nº KINTANA..: 1499847
Data........: 29/11/2011
Responsável.: Monica da Silva Gonzaga
Descrição...: Filtrar os "selects" Atividade/projeto para considerar apenas as ativas e analiticas
-----------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina......: ListSiglas
Nº SOL......: 116914
Nº KINTANA..: 558952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Lista siglas para colocar no Curso.
--------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCurso;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbCurso, uDbCursoxAvalDes, uDbCursoxFatorAval;

type
  TCtrlCurso = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb           : TDbCurso;
    FCds: TCMClientDataSet;
    FDbDet: TDbCursoxAvalDes;
    FCdsDet: TCMClientDataSet;
    FDbDet2: TDbCursoxFatorAval;
    FCdsDet2: TCMClientDataSet;

  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdCurso: double = 0): OleVariant;
    function ListGrupoTr: OleVariant;
    function ListPacote: OleVariant;
    function ListSiglas: OleVariant;
    function ListTipCurso: OleVariant;
    //Cássio - SOL116916 KINTANA 558985
    function ListUnidNegoc: OleVAriant;


//    function Gravar : boolean;                  //Everson Cunha - SIG78744
    function Gravar(bCommit : boolean) : boolean; //Everson Cunha - SIG78744
    function Excluir: boolean;
    function GetCodigo : integer;         // Edilaine - SOL 137268-7062 / KTN 1497173

    property Cds: TCMClientDataSet read FCds write FCds;                // curso
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;       // TDbCursoxAvalDes
    property CdsDet2: TCMClientDataSet read FCdsDet2 write FCdsDet2;    // TDbCursoxFatorAval
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCurso }

constructor TCtrlCurso.Create;
begin
  inherited;
  FDb := TDbCurso.Create(Self);
  FDbDet := TDbCursoxAvalDes.Create(Self);
  FDbDet2 := TDbCursoxFatorAval.Create(Self);
end;

destructor TCtrlCurso.Destroy;
begin
  FDbDet2.Free;
  FDbDet.Free;
  FDb.Free;
  if (IsAppServer) then
  begin
    FCds.Free;
    FCdsDet.Free;
    FCdsDet2.Free;
  end;
  inherited;
end;

procedure TCtrlCurso.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsDet := TCMClientDataSet.Create(nil);
  FCdsDet2 := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCurso.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
  FDbDet2.DataBaseName := DataBaseName;
end;

function TCtrlCurso.ListGeral(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdCurso=0,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+              // Edilaine - SOL 137268-7062 / KTN 1497173
    '  C.IDCURSO, C.DESCRICAO, C.ABREV, C.DUR_TEOR, C.DUR_PRAT, C.CODGRPTREIN,'+CR_LF+
    '  C.AVALPRAT, C.AVALIACAO, C.VALOR, C.OBSERVACAO, C.TEMAVPR, C.TEMAVAL, S.DESCRICAO AS SIGLA, '+CR_LF+   // Edilaine - SOL 137268-7062 / KTN 1497173
    '  C.IDTIPOCURSO, C.IDPACOTE, C.IDENTIDINSTR, C.OBSERVACAO2, C.UNIDNEGOC, C.IDSIGLACURSO '+CR_LF+ //Cássio - SOL116916 KINTANA 558985
    'FROM'+CR_LF+
    '  CURSO C, SIGLACURSO S '+CR_LF+
    IFF(IdCurso=-1, 'WHERE (1 = 2)', 'WHERE (IDCURSO = ' +FloatToStr(IdCurso)+ ')'));  // Edilaine - SOL 137268-7062 / KTN 1497173
    { // Edilaine - SOL 137268-7062 / KTN 1497173
      IFF(IdCurso=0, 'ORDER BY DESCRICAO', 'WHERE'+CR_LF+
        '  (IDCURSO = ' +FloatToStr(IdCurso)+ ')')));
    } // Edilaine - SOL 137268-7062 / KTN 1497173   
end;

function TCtrlCurso.ListGrupoTr: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODGRPTREIN, DESCGRPTREIN'+CR_LF+
    'FROM'+CR_LF+
    '  GRPTREIN'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCGRPTREIN');
end;

function TCtrlCurso.ListPacote: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPACOTE, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PACOTE'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlCurso.ListTipCurso: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDTIPOCURSO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPCURSO'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

//function TCtrlCurso.Gravar: boolean;                  //Everson Cunha - SIG78744
function TCtrlCurso.Gravar(bCommit : boolean): boolean; //Everson Cunha - SIG78744
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data, FCdsDet.Data, FCdsDet2.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if not InTransaction then   // Edilaine - SOL 137268-7062 / KTN 1497173
         StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);  // grava curso
      if (Result) then
      begin
        Result := ApplyCds(FCdsDet, FDbDet, [FDb.IdCurso], [FDbDet.IdCurso]);
        if (Result) then
        begin
          Result := ApplyCds(FCdsDet2, FDbDet2, [FDb.IdCurso], [FDbDet2.IdCurso]);
          if not(Result) then
             raise Exception.Create(FDbDet2.MessageInfo);
        end
        else
          raise Exception.Create(FDbDet.MessageInfo);
      end
      else
        raise Exception.Create(FDb.MessageInfo);

      if bCommit then //Everson Cunha - SIG78744
        Commit;

    except
      on E: Exception do
      begin
        if bCommit then //Everson Cunha - SIG78744
          Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlCurso.Excluir: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Excluir(FCds.Data, FCdsDet.Data, FCdsDet2.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if not InTransaction then     // Edilaine - SOL 137268-7062 / KTN 1497173
         StartTransaction;

      FCdsDet2.First;
      while not(FCdsDet2.EOF) do
        FCdsDet2.Delete;

      Result := ApplyCds(FCdsDet2, FDbDet2, [], []);
      if (Result) then
      begin
        FCdsDet.First;
        while not(FCdsDet.EOF) do
          FCdsDet.Delete;

        Result := ApplyCds(FCdsDet, FDbDet, [], []);
        if (Result) then
        begin
          Result := ApplyCds(FCds, FDb, [], []);
          if not(Result) then
            MessageInfo := FDb.MessageInfo;
        end
        else
          MessageInfo := FDbDet.MessageInfo;
      end
      else
        MessageInfo := FDbDet2.MessageInfo;

      Commit;  
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;
//Cássio - SOL116916 KINTANA 558985
//Busca Atividades/Projetos
function TCtrlCurso.ListUnidNegoc: OleVAriant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  UNIDNEGOC, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  UNIDNEGOCIO'+CR_LF+
    ' WHERE (UNETIPO = ''A'')'+CR_LF+
    ' AND (ATIVO = ''S'')' +CR_LF+
    'ORDER BY'+CR_LF+
    '  NOME');

end;

//Thaise SOL 116914 - Listas as siglas para consulta
function TCtrlCurso.ListSiglas: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDSIGLACURSO, SIGLA'+CR_LF+
    'FROM'+CR_LF+
    '  SIGLACURSO'+CR_LF+
    'ORDER BY'+CR_LF+
    '  SIGLA');
end;


function TCtrlCurso.GetCodigo: integer;
begin
  Result := FDb.GetCodigo();
end;



end.
