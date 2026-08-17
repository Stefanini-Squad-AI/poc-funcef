{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPesoFatGrp;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbPesoFatGrp;

type
  TCtrlPesoFatGrp = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbPesoFatGrp;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListPeso(IdFatorAval: double = 0; CodGrpFunc: string = ''): OleVariant;    
    function ListPesoXFator(CodGrpFunc: string): OleVariant;

    function GravarPesoXFator: boolean;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPesoFatGrp }

constructor TCtrlPesoFatGrp.Create;
begin
  inherited;
  FDbDet := TDbPesoFatGrp.Create(Self);
end;

destructor TCtrlPesoFatGrp.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlPesoFatGrp.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPesoFatGrp.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlPesoFatGrp.ListPeso(IdFatorAval: double; CodGrpFunc: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdFatorAval = -1) then
    sSQL := CR_LF+ 'WHERE' +CR_LF+ '  (1 = 2)'
  else
  if (IdFatorAval > 0) or (CodGrpFunc <> '') then
  begin
    sSQL := CR_LF+ 'WHERE' +CR_LF;

    if (IdFatorAval > 0) then
      sSQL := sSQL + '  (IDFATORAVAL = ' +FloatToStr(IdFatorAval)+ ')'+
        IFF(CodGrpFunc<>'', ' AND' +CR_LF, '');

    if (CodGrpFunc <> '') then
      sSQL := sSQL + '  (CODGRPFUNC  = ' +QuotedStr(CodGrpFunc)+ ')';
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODGRPFUNC, IDFATORAVAL, PESO'+CR_LF+
    'FROM'+CR_LF+
    '  PESOFATGRP'+
    sSQL);
end;

function TCtrlPesoFatGrp.ListPesoXFator(CodGrpFunc: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PG.CODGRPFUNC, PG.IDFATORAVAL, FA.DESCRFATORAVAL, PG.PESO'+CR_LF+
    'FROM'+CR_LF+
    '  PESOFATGRP PG, FATORAVAL FA'+CR_LF+
    'WHERE'+CR_LF+
    IFF(CodGrpFunc='', '', '  (PG.CODGRPFUNC  = '+QuotedStr(CodGrpFunc)+') AND')+CR_LF+
    '  (PG.IDFATORAVAL = FA.IDFATORAVAL)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  PG.IDFATORAVAL');
end;

function TCtrlPesoFatGrp.GravarPesoXFator: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPesoXFator(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if not(Result) then
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
