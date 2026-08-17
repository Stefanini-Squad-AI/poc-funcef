{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlGrau;

interface

uses SysUtils, Db, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uCtrlPesoFatGrp, uCtrlClasseSal, uDbGrauCargo;

type
  TCtrlGrau = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FDbGrau: TDbGrauCargo;
    FCdsCargo: TCMClientDataSet;
    FCdsGrau: TCMClientDataSet;

    FCdsAux: TCMClientDataSet;
    FCtrlPesoFatGrp: TCtrlPesoFatGrp;
    FCtrlClasseSal: TCtrlClasseSal;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGrausDoCargo(IdCargo: double): OleVariant;

    function FazerOnCalcFields(CodGrpFunc: string; IdFatorAval: double;
      var TotPontos: integer; FazEditPost: boolean = true): boolean;

    function GravarGrausDoCargo: boolean;
    function AlterarFaixaSal(CodGrpFunc: string; TotPontos: integer): boolean;

    property CdsCargo: TCMClientDataSet read FCdsCargo write FCdsCargo;
    property CdsGrau: TCMClientDataSet read FCdsGrau write FCdsGrau;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlGrau }

constructor TCtrlGrau.Create;
begin
  inherited;
  FDbGrau := TDbGrauCargo.Create(Self);
  FCdsAux := TCMClientDataSet.Create(nil);
  FCtrlPesoFatGrp := TCtrlPesoFatGrp.Create;
  FCtrlClasseSal := TCtrlClasseSal.Create;
end;

destructor TCtrlGrau.Destroy;
begin
  FDbGrau.Free;
  FCtrlPesoFatGrp.Free;
  FCtrlClasseSal.Free;
  if (IsAppServer) then
  begin
    FCdsCargo.Free;
    FCdsGrau.Free;
    FCdsAux.Free;
  end;
  inherited;
end;

procedure TCtrlGrau.OnCreateAppServer;
begin
  inherited;
  FCdsCargo := TCMClientDataSet.Create(nil);
  FCdsGrau := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGrau.DoChangeDataBase;
begin
  inherited;
  FDbGrau.DataBaseName := DataBaseName;
end;

procedure TCtrlGrau.AfterInitialize;
begin
  inherited;
  FCtrlPesoFatGrp.InitializeAs(Self);
  FCtrlClasseSal.InitializeAs(Self);
end;

function TCtrlGrau.ListGrausDoCargo(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  GC.IDCARGO, GC.IDFATORAVAL, FA.DESCRFATORAVAL, GC.GRAU, 0 AS PESO, 0 AS NOTA'+CR_LF+
    'FROM'+CR_LF+
    '  GRAUCARGO GC, FATORAVAL FA'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdCargo=0, '', '  (GC.IDCARGO     = '+FloatToStr(IdCargo)+') AND')+CR_LF+
    '  (GC.IDFATORAVAL = FA.IDFATORAVAL)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  GC.IDFATORAVAL');
end;

function TCtrlGrau.AlterarFaixaSal(CodGrpFunc: string; TotPontos: integer): boolean;
begin
  try
    FCdsAux.Data := FCtrlClasseSal.ListClasseSal(CodGrpFunc);
    while not(FCdsAux.EOF) do
    begin
      if (TotPontos >= FCdsAux.FieldByName('MINIMO').asInteger) and
         (TotPontos <= FCdsAux.FieldByName('MAXIMO').asInteger) and
         (FCdsCargo.FieldByName('IDFAIXASALARIAL').asInteger <>
          FCdsAux.FieldByName('IDFAIXASALARIAL').asInteger) then
      begin
        FCdsCargo.FieldByName('IDFAIXASALARIAL').asInteger :=
          FCdsAux.FieldByName('IDFAIXASALARIAL').asInteger;
        break;
      end;
      FCdsAux.Next;
    end;
    Result := true;
  except
    Result := false;
  end;
end;

function TCtrlGrau.FazerOnCalcFields(CodGrpFunc: string; IdFatorAval: double;
  var TotPontos: integer; FazEditPost: boolean): boolean;
begin
  if (FCdsCargo.FieldByName('CODGRPFUNC').asString <> '') then
  begin
    FCdsAux.Data := FCtrlPesoFatGrp.ListPeso(IdFatorAval, CodGrpFunc);

    if (FazEditPost) and (FCdsGrau.State <> dsEdit) then
      FCdsGrau.Edit;

    FCdsGrau.FieldByName('PESO').asInteger := FCdsAux.FieldByName('PESO').asInteger;
    FCdsGrau.FieldByName('NOTA').asInteger := FCdsAux.FieldByName('PESO').asInteger *
      FCdsGrau.FieldByName('GRAU').asInteger;

    if (FazEditPost) then
      FCdsGrau.Post;

    TotPontos := TotPontos + FCdsGrau.FieldByName('NOTA').asInteger;
    Result := true;
  end
  else
    Result := false;
end;

function TCtrlGrau.GravarGrausDoCargo: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarGrausDoCargo(FCdsCargo.Data, FCdsGrau.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsGrau, FDbGrau, [], []);
      if (Result) then
      begin
        if (FCdsCargo.FieldByName('IDFAIXASALARIAL').asString <> '') then
          if not(ExecSQL('UPDATE CARGO SET IDFAIXASALARIAL = ' +
              FCdsCargo.FieldByName('IDFAIXASALARIAL').asString+
              ' WHERE (IDCARGO = ' +FDbGrau.IdCargo.asString+ ')')) then
            raise Exception.Create(MessageInfo);
      end
      else
        raise Exception.Create(FDbGrau.MessageInfo);

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
