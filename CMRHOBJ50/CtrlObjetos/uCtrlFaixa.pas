
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/02/2002                                 }
{                                                       }
{*******************************************************}

{*******************************************************
RESPONSÁVEL.: Douglas Siqueira
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/01/2012
Descrição...: Alteração do limite de faixas de 9 para 20.
*******************************************************}


unit uCtrlFaixa;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbFaixaSal,
  uDbParamRH;

type
  TCtrlFaixa = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDb: TDbFaixaSal;
    FDbParamRH: TDbParamRH;
    FCds: TCMClientDataSet;
    FTipoEmpresa: string;
    FIdEmpresa: integer;
  public
    constructor Create(IdEmpresa: integer); reintroduce;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdFaixaSalarial: integer = 0): OleVariant;
    function ListFaixaCargo(IdCargo: double): OleVariant;    

    property Cds: TCMClientDataSet read FCds write FCds;
    property DbParamRH: TDbParamRH read FDbParamRH write FDbParamRH;
    property TipoEmpresa: string read FTipoEmpresa;
  end;

implementation

uses uCMTypes, uFuncoesUteis, uIntegraPrevRH;

{ TCtrlFaixa }

constructor TCtrlFaixa.Create(IdEmpresa: integer);
begin
  inherited Create;
  FDb := TDbFaixaSal.Create(Self);
  FDbParamRH := TDbParamRH.Create(Self);

  FIdEmpresa := IdEmpresa;
end;

destructor TCtrlFaixa.Destroy;
begin
  FDbParamRH.Free;
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlFaixa.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlFaixa.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
  FDbParamRH.DatabaseName := DataBaseName;

  // Verifica a rotina de integraçao dos sistemas previdenciários com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  _Cds.Data := GetDataPacket('SELECT TIPOEMPRESA FROM EMPRESAPROP '+
    'WHERE IDPESSOA = ' + IntToStr(FIdEmpresa));
  FTipoEmpresa := _Cds.FieldByName('TIPOEMPRESA').asString;
end;

function TCtrlFaixa.ListGeral(IdFaixaSalarial: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdFaixaSalarial=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdFaixaSalarial, DataEfetiv, Step1, Step2, Step3, Step4, Step5,'+CR_LF+
    '  Step6, Step7, Step8, Step9, Step10,Step11,Step12,Step13,Step14,'+CR_LF+ //Douglas.Siqueira SOL 171426 Kintana 1537613
    '  Step15,Step16,Step17,Step18,Step19,Step20'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
    'FROM'+CR_LF+
    '  FaixaSal'+CR_LF+
    IFF(IdFaixaSalarial=-1, 'WHERE (1 = 2)',
      IFF(IdFaixaSalarial=0, 'ORDER BY'+CR_LF+'  IdFaixaSalarial', 'WHERE'+CR_LF+
      '  (IdFaixaSalarial = '+FloatToStr(IdFaixaSalarial)+')')));
end;

function TCtrlFaixa.ListFaixaCargo(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  F.*'+CR_LF+
    'FROM'+CR_LF+
    '  FAIXASAL F, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.IDCARGO         = ' +FloatToStr(IdCargo)+ ') AND'+CR_LF+
    '  (F.IDFAIXASALARIAL = C.IDFAIXASALARIAL)');
end;

function TCtrlFaixa.Gravar: boolean;
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
      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        MessageInfo := FDb.MessageInfo;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;

      // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
      // de RH e Folha de Pagamento de uma Fundação
{      if (bbtnHistFaixa.Visible) then
      begin
        frmAguarde.Mostra('Atualizando o Histórico das Faixas...');
        frmAguarde.Pos := 0;
        StartTransaction;
        if (AtualizaFaixasSalariais(Sistema.IdEmpresa)) then
        begin
          dtmBaseDados.dbBaseDados.Commit;
          qryHistFaixa.Close;
          qryHistFaixa.Open;
        end
        else
          dtmBaseDados.dbBaseDados.RollBack;
        frmAguarde.Apaga;
      end;}
  end;
end;

end.
