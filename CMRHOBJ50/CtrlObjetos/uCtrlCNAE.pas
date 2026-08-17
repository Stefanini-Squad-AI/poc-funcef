{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/03/2002                                 }
{                                                       }
{*******************************************************}
{-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
Nº SOL............: 229878.16779
Nº PPM............: 610132
Data da Alteração.: 25/02/2015
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 229878.
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------}

unit uCtrlCNAE;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbCatCNAE, uDbItemCNAE;

type
  TCtrlCNAE = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbCatCNAE;
    FDbDet: TDbItemCNAE;
    FCds: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListMestre(IdCatCNAE: integer = 0): OleVariant;
    function ListDetalhe(IdCatCNAE: integer): OleVariant;

    function Gravar: boolean;
    function Excluir: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCNAE }

constructor TCtrlCNAE.Create;
begin
  inherited;
  FDb := TDbCatCNAE.Create(Self);
  FDbDet := TDbItemCNAE.Create(Self);
end;

destructor TCtrlCNAE.Destroy;
begin
  FDbDet.Free;
  FDb.Free;
  if (IsAppServer) then
  begin
    FCds.Free;
    FCdsDet.Free;
  end;
  inherited;
end;

procedure TCtrlCNAE.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);  
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCNAE.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlCNAE.ListMestre(IdCatCNAE: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdCatCNAE=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdCatCNAE, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  CATCNAE'+CR_LF+
    IFF(IdCatCNAE=-1, 'WHERE (1 = 2)',
      IFF(IdCatCNAE=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IdCatCNAE = '+IntToStr(IdCatCNAE)+')')));
end;

function TCtrlCNAE.ListDetalhe(IdCatCNAE: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
 //   '  IDITEMCNAE, IDCATCNAE, DESCRICAO'+CR_LF+          //William Santana - SOL 229878.16779 PPM 610132
    '  IDITEMCNAE, IDCATCNAE, DESCRICAO, ALIQUOTA'+CR_LF+  //William Santana - SOL 229878.16779 PPM 610132
    'FROM'+CR_LF+
    '  ITEMCNAE'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDCATCNAE = '+IntToStr(IdCatCNAE)+')');
end;

function TCtrlCNAE.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data, FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsDet, FDbDet, [], []);
        if not(Result) then
          raise Exception.Create(FDbDet.MessageInfo);
      end
      else
        raise Exception.Create(FDb.MessageInfo);

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

function TCtrlCNAE.Excluir: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Excluir(FCds.Data, FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCdsDet.First;
      while not(FCdsDet.EOF) do
        FCdsDet.Delete;

      StartTransaction;
      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCds, FDb, [], []);
        if not(Result) then
          raise Exception.Create(FDb.MessageInfo);
      end
      else
        raise Exception.Create(FDbDet.MessageInfo);

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

end.
