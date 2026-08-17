{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugenio Frioli                  }
{ Criado Em: 29/03/2004                                 }
{                                                       }
{*******************************************************}

unit uCtrlPlanAss;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbPlanAss, uDbServPlanAss;

type
  TCtrlPlanAss = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbPlanAss: TDbPlanAss;
    FDbDet: TDbServPlanAss;
    
    FCdsPlanAss: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListPlanAss(IdPlanAss: double = 0): OleVariant;
    function ListDetalhe(IdPlanAss: double): OleVariant;

    function GravarPlanAss: boolean;
    function ExcluirPlanAss: boolean;

    property CdsPlanAss: TCMClientDataSet read FCdsPlanAss write FCdsPlanAss;
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPlanAss }

constructor TCtrlPlanAss.Create;
begin
  inherited;
  FDbPlanAss := TDbPlanAss.Create(Self);
  FDbDet := TDbServPlanAss.Create(Self);
end;

destructor TCtrlPlanAss.Destroy;
begin
  FDbDet.Free;
  FDbPlanAss.Free;
  if (IsAppServer) then
  begin
    FCdsPlanAss.Free;
    FCdsDet.Free;
  end;
  inherited;
end;

procedure TCtrlPlanAss.OnCreateAppServer;
begin
  inherited;
  FCdsPlanAss := TCMClientDataSet.Create(nil);
  FCdsDet := TCMClientDataSet.Create(nil);  
end;

procedure TCtrlPlanAss.DoChangeDataBase;
begin
  inherited;
  FDbPlanAss.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlPlanAss.ListPlanAss(IdPlanAss: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdPlanAss=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  PLANASS'+CR_LF+
    IFF(IdPlanAss=-1, 'WHERE (1 = 2)',
      IFF(IdPlanAss=0, 'ORDER BY'+CR_LF+'  NOME', 'WHERE'+CR_LF+
        '  (IDPLANASS = '+FloatToStr(IdPlanAss)+')')));
end;

function TCtrlPlanAss.ListDetalhe(IdPlanAss: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  S.IDPLANASS, S.IDSERVASS, T.NOME, S.PRECO, S.CODIGO'+CR_LF+
    'FROM'+CR_LF+
    '  SERVPLANASS S, TPSERVASS T'+CR_LF+
    'WHERE'+CR_LF+
    '  (S.IDPLANASS = ' +FloatToStr(IdPlanAss)+ ') AND'+CR_LF+
    '  (S.IDSERVASS = T.IDSERVASS)');
end;

function TCtrlPlanAss.GravarPlanAss: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPlanAss(FCdsPlanAss.Data, FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      
      Result := ApplyCds(FCdsPlanAss, FDbPlanAss, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsDet, FDbDet, [FDbPlanAss.Idplanass], [FDbDet.Idplanass]);
        if not(Result) then
          raise Exception.Create(FDbDet.MessageInfo);
      end
      else
        raise Exception.Create(FDbPlanAss.MessageInfo);

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

function TCtrlPlanAss.ExcluirPlanAss: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirPlanAss(FCdsPlanAss.Data, FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      FCdsDet.First;
      while not(FCdsDet.EOF) do
        FCdsDet.Delete;

      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsPlanAss, FDbPlanAss, [], []);
        if not(Result) then
          MessageInfo := FDbPlanAss.MessageInfo;
      end
      else
        MessageInfo := FDbDet.MessageInfo;

      Commit;  
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
