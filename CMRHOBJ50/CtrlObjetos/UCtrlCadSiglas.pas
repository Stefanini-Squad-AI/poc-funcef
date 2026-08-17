{--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: alteração layout e inclusão valorteto
Rotinas.....: ListGeral
{--------------------------------------------------------------------------------------------------
Nº SOL......: 185805
Nº KINTANA..: 1763461
Data........: 08/01/2013
Responsável.: Thiago Melo
Descrição...: Alteração de layout e inclusão de flags (email de cobrança)
--------------------------------------------------------------------------------------------------
Nº SOL......: 177768
Nº KINTANA..: 1635450
Data........: 19/11/2012
Responsável.: Thiago Melo
Descrição...: Alteração na forma de Registro Individual de Treinamento.
--------------------------------------------------------------------------------------------------
Nº SOL......: 116914
Nº KINTANA..: 558952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação da Ctrl para cadastro de Siglas de Cursos
--------------------------------------------------------------------------------------------------}
unit UCtrlCadSiglas;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
     uCtrlCustomRH, uDbSiglaCurso;
type
  TCtrlCadSiglas = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbSiglaCurso;
    FCds: TCMClientDataSet;
    
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdSiglaCurso: double): OleVariant;
    function ListSiglas(IdSiglaCurso: double): OleVariant;

    function Gravar: boolean;

    function BuscaSigla(IdSiglaCurso: double): OleVariant;

    function BuscarRelacaoCursos(idCurso: Integer): OleVariant;
    function PossuiSigla(Sigla: String): Boolean;
    
    property Cds: TCMClientDataSet read FCds write FCds;

  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCadSiglas }

constructor TCtrlCadSiglas.Create;
begin
  inherited;
  FDb := TDbSiglaCurso.Create(Self);
end;

destructor TCtrlCadSiglas.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
  begin
    FCds.Free;
  end;
  inherited;
end;

procedure TCtrlCadSiglas.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlCadSiglas.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
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

function TCtrlCadSiglas.ListGeral(IdSiglaCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdSiglaCurso=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    //  Thiago Melo SOL 177768 Kintana 1635450 INI
    '  IDSIGLACURSO, SIGLA, DESCRICAO, TEMPO, FLGFIDELIZA, FLGPROJFINAL, flgproporcionaliza ' + CR_LF +
    //  Thiago Melo SOL 177768 Kintana 1635450 FIM

    // Thiago Melo SOL 185805 Kintana 1763461 INI
    '  ,emailcomprovante ' + CR_LF +
    // Thiago Melo SOL 185805 Kintana 1763461 FIM

    '  ,valorteto  ' + CR_LF +  // Edilaine - SOL 137268-7062 / KTN 1497173
    'FROM'+CR_LF+
    '  SIGLACURSO'+CR_LF+
    IFF(IdSiglaCurso=-1, 'WHERE (1 = 2)',
      IFF(IdSiglaCurso=0, '', 'WHERE'+CR_LF+
        '  (IDSIGLACURSO = ' +FloatToStr(IdSiglaCurso)+ ')')));
end;

function TCtrlCadSiglas.ListSiglas(IdSiglaCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDSIGLACURSO, SIGLA, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  SIGLA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDSIGLACURSO = '+FloatToStr(IdSiglaCurso)+')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  SIGLA');
end;

procedure TCtrlCadSiglas.OnCreateAppServer;
begin
  inherited;
  FCds    := TCMClientDataSet.Create(nil);
end;

function TCtrlCadSiglas.BuscaSigla(IdSiglaCurso: double): OleVariant;
begin
  Result := GetDataPacket('SELECT DISTINCT IDSIGLACURSO FROM CURSO ' +
                          ' WHERE IDSIGLACURSO = ' + FloatToStr(IdSiglaCurso));
end;


function TCtrlCadSiglas.BuscarRelacaoCursos(idCurso: Integer): OleVariant;
begin
  Result := GetDataPacket('SELECT C.IDCURSO, C.DESCRICAO, SC.SIGLA ' +
                          ' FROM CURSO C, SIGLACURSO SC ' +
                          '  WHERE C.IDSIGLACURSO = SC.IDSIGLACURSO ' + 
                          '  AND C.IDSIGLACURSO = ' +  InttoStr(idCurso));
end;

function TCtrlCadSiglas.PossuiSigla(Sigla: String): Boolean;
var
  _CdsSigla: TCMClientDataSet;
begin
  _CdsSigla := TCMClientDataSet.Create(nil);

  _CdsSigla.Data := GetDataPacket('SELECT SIGLA FROM SIGLACURSO ' +
                                  'WHERE SIGLA = ' + QuotedStr(Sigla));

  Result:= not _CdsSigla.IsEmpty;

  _CdsSigla.Free;
end;

end.
