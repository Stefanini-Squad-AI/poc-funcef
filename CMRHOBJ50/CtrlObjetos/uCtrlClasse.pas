
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/02/2002                                 }
{                                                       }
{*******************************************************}


{*******************************************************
RESPONSÁVEL.: Douglas Siqueira
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/01/2012
Descrição...: Alteração do limite de faixas de 9 para 20.
*******************************************************}


unit uCtrlClasse;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbClasseSal,
  uDbCargo;

type
  TCtrlClasse = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbClasseSal;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListMestre(CodGrpFunc: string): OleVariant;
    function ListDetalhe(CodGrpFunc: string): OleVariant;
    function ListFaixa: OleVariant;

    function Gravar: boolean;    
    function AtualizarFaixa(CodGrpFunc: string): boolean;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlClasse }

constructor TCtrlClasse.Create;
begin
  inherited;
  FDbDet := TDbClasseSal.Create(Self);
end;

destructor TCtrlClasse.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlClasse.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlClasse.DoChangeDataBase;
begin
  inherited;
  FDbDet.DatabaseName := DataBaseName;
end;

function TCtrlClasse.ListMestre(CodGrpFunc: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodGrpFunc='-1',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CodGrpFunc, DescGrpFunc'+CR_LF+
    'FROM'+CR_LF+
    '  GrupFunc'+CR_LF+
    IFF(CodGrpFunc='-1', 'WHERE (1 = 2)',
      IFF(CodGrpFunc='', '', 'WHERE'+CR_LF+
        '  (CodGrpFunc = '+QuotedStr(CodGrpFunc)+')')));
end;

function TCtrlClasse.ListDetalhe(CodGrpFunc: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodGrpFunc='-1',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdFaixaSalarial, CodGrpFunc, Minimo, Maximo'+CR_LF+
    'FROM'+CR_LF+
    '  ClasseSal'+CR_LF+
    IFF(CodGrpFunc='-1', 'WHERE (1 = 2)',
        IFF(CodGrpFunc='', '', 'WHERE'+CR_LF+
            '  (CodGrpFunc = '+QuotedStr(CodGrpFunc)+')'))+CR_LF+
    'ORDER BY'+CR_LF+
    '  IdFaixaSalarial');
end;

function TCtrlClasse.ListFaixa: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdFaixaSalarial, DataEfetiv, Step1, Step2, Step3, Step4,'+CR_LF+
    '  Step5, Step6, Step7, Step8, Step9, Step10, Step11, Step12,Step13,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
    '  Step14,Step15,Step16,Step17,Step18,Step19,Step20'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
    'FROM'+CR_LF+
    '  FaixaSal'+CR_LF+
    'ORDER BY'+CR_LF+
    '  IdFaixaSalarial');
end;

function TCtrlClasse.AtualizarFaixa(CodGrpFunc: string): boolean;
var
  iTotPontos: integer;
  CdsCargo, CdsClasse, CdsGrauCargo, CdsRelav: TCMClientDataSet;
  DbCargo: TDbCargo;

{->}procedure ProcuraGrauCargo;
    begin
      CdsGrauCargo.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  IdCargo, IdFatorAval, Grau'+CR_LF+
        'FROM'+CR_LF+
        '  GrauCargo'+CR_LF+
        'WHERE'+CR_LF+
        '  (IdCargo = '+CdsCargo.FieldByName('IdCargo').asString+')'+CR_LF+
        'ORDER BY'+CR_LF+
        '  IdCargo');
{->}end;
{->}function AplicarUpdateFaixa: boolean;
    begin
{      try
        CdsToDbObject(CdsCargo, DbCargo);

        StartTransaction;

        Result := DbCargo.Update;
        if not(Result) then
        begin
          MessageInfo := DbCargo.MessageInfo;
          Rollback;
        end
        else
          Commit;
      except
        on E: Exception do
        begin
          Result := false;
          Rollback;
          MessageInfo := E.Message;
        end;
      end;}
{->}end;
begin
  DbCargo := TDbCargo.Create(Self);
  CdsCargo := TCMClientDataSet.Create(nil);
  CdsClasse := TCMClientDataSet.Create(nil);
  CdsGrauCargo := TCMClientDataSet.Create(nil);
  CdsRelav := TCMClientDataSet.Create(nil);

  DbCargo.DatabaseName := DataBaseName;

  CdsClasse.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdFaixaSalarial, Minimo, Maximo'+CR_LF+
    'FROM'+CR_LF+
    '  ClasseSal'+CR_LF+
    'WHERE'+CR_LF+
    '  (CodGrpFunc = '+QuotedStr(CodGrpFunc)+')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  IdFaixaSalarial');

  CdsCargo.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdCargo, CodGrpFunc, IdFaixaSalarial'+CR_LF+
    'FROM'+CR_LF+
    '  Cargo'+CR_LF+
    'WHERE'+CR_LF+
    '  (CodGrpFunc = '+QuotedStr(CodGrpFunc)+')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  IdCargo');

  CdsRelav.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  CodGrpFunc, IdFatorAval, Peso'+CR_LF+
    'FROM'+CR_LF+
    '  PesoFatGrp'+CR_LF+
    'ORDER BY'+CR_LF+
    '  CodGrpFunc, IdFatorAval');

  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AtualizarFaixa(CodGrpFunc, CdsCargo.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    while not(CdsCargo.EOF) do
    begin
      // Rotina para calcular os pontos do Cargo atualmente posicionado
      iTotPontos := 0;

      // Pego o total de pontos dos graus do Cargo atualmente posicionado
      ProcuraGrauCargo;
      while not(CdsGrauCargo.EOF) do
      begin
        if (CdsRelav.Locate('CodGrpFunc;IdFatorAval',
            VarArrayOf([CdsCargo.FieldByName('CodGrpFunc').asString,
             CdsGrauCargo.FieldByName('IdFatorAval').asInteger]),[])) then
          iTotPontos := iTotPontos + CdsRelav.FieldByName('Peso').asInteger *
            CdsGrauCargo.FieldByName('Grau').asInteger;
        CdsGrauCargo.Next;
      end;

      // Altero a Faixa Salarial do Cargo atualmente posicionado, se necessário
      CdsClasse.First;
      while not(CdsClasse.EOF) do
      begin
        if (iTotPontos >= CdsClasse.FieldByName('Minimo').asInteger) and
           (iTotPontos <= CdsClasse.FieldByName('Maximo').asInteger) and
           (CdsCargo.FieldByName('IdFaixaSalarial').asInteger <>
            CdsClasse.FieldByName('IdFaixaSalarial').asInteger) then
        begin
          CdsCargo.Edit;
          CdsCargo.FieldByName('IdFaixaSalarial').asInteger :=
            CdsClasse.FieldByName('IdFaixaSalarial').asInteger;
          CdsCargo.Post;
          Result := AplicarUpdateFaixa;
          break;
        end;
        CdsClasse.Next;
      end;
      CdsCargo.Next;
    end;
  end;

  CdsClasse.Free;
  CdsGrauCargo.Free;
  CdsRelav.Free;
  CdsCargo.Free;
  DbCargo.Free;
end;

function TCtrlClasse.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if not(Result) then
        MessageInfo := FDbDet.MessageInfo;
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
