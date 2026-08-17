{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 24/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPesquisaEmpresa;

interface

uses Classes, SysUtils, Db, uCMTypes, uCmDbObject, IvDictio, uCmControlObject,
  uCMClientDataSet, uCtrlCustomRH, uDbTendPesqSal, uDbDadoPesqSal;

type
  TCtrlPesquisaEmpresa = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbPesquisaEmpresa: TDbTendPesqSal;
    FDbDadosPesquisaEmpresa: TDbDadoPesqSal;
    FCdsPesquisaEmpresa: TCMClientDataSet;
    FCdsDadosPesquisaEmpresa: TCMClientDataSet;

    FListaSalNominal: TStringList;
    FListaSalReal: TStringList;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListPesquisaEmpresa(IdPesqSalar, IdCargo, IdEmpresaParticip: double): OleVariant;
    function ListDadosPesquisaEmpresa(IdPesqSalar, IdCargo, IdEmpresaParticip: double): OleVariant;

    procedure CalcularTendencia;
    procedure InserirColetaSalarial(ListaQuantSal, ListaSalNominal, ListaSalReal: string);

    function GravarPesquisaEmpresa(GravarDados: boolean = true): boolean;
    function ExcluirPesquisaEmpresa: boolean;

    property CdsPesquisaEmpresa: TCMClientDataSet read FCdsPesquisaEmpresa write FCdsPesquisaEmpresa;
    property CdsDadosPesquisaEmpresa: TCMClientDataSet read FCdsDadosPesquisaEmpresa write FCdsDadosPesquisaEmpresa;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlPesquisaEmpresa }

constructor TCtrlPesquisaEmpresa.Create;
begin
  inherited;
  FDbPesquisaEmpresa := TDbTendPesqSal.Create(Self);
  FDbDadosPesquisaEmpresa := TDbDadoPesqSal.Create(Self);

  FListaSalNominal := TStringList.Create;
  FListaSalReal := TStringList.Create;
end;

destructor TCtrlPesquisaEmpresa.Destroy;
begin
  FDbPesquisaEmpresa.Free;
  FDbDadosPesquisaEmpresa.Free;
  FListaSalNominal.Free;
  FListaSalReal.Free;
  if (IsAppServer) then
  begin
    FCdsPesquisaEmpresa.Free;
    FCdsDadosPesquisaEmpresa.Free;    
  end;
  inherited;
end;

procedure TCtrlPesquisaEmpresa.OnCreateAppServer;
begin
  inherited;
  FCdsPesquisaEmpresa := TCMClientDataSet.Create(nil);
  FCdsDadosPesquisaEmpresa := TCMClientDataSet.Create(nil);  
end;

procedure TCtrlPesquisaEmpresa.DoChangeDataBase;
begin
  inherited;
  FDbPesquisaEmpresa.DataBaseName := DataBaseName;
  FDbDadosPesquisaEmpresa.DataBaseName := DataBaseName;
end;

function TCtrlPesquisaEmpresa.ListPesquisaEmpresa(IdPesqSalar, IdCargo,
  IdEmpresaParticip: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TD.*, PQ.DATAREFPESQ'+CR_LF+
    'FROM'+CR_LF+
    '  TENDPESQSAL TD, PESQISAL PQ'+CR_LF+
    'WHERE'+CR_LF+
    '  (TD.IDPESQSALAR     = ' +FloatToStr(IdPesqSalar)+ ') AND'+CR_LF+
    '  (TD.IDCARGO         = ' +FloatToStr(IdCargo)+ ') AND'+CR_LF+
    '  (TD.IDEMPRESAPARTIC = ' +FloatToStr(IdEmpresaParticip)+ ') AND'+CR_LF+
    '  (TD.IDPESQSALAR     = PQ.IDPESQSALAR)');
end;

function TCtrlPesquisaEmpresa.ListDadosPesquisaEmpresa(IdPesqSalar, IdCargo,
  IdEmpresaParticip: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  DADOPESQSAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESQSALAR = ' +FloatToStr(IdPesqSalar)+ ') AND'+CR_LF+
    '  (IDCARGO     = ' +FloatToStr(IdCargo)+ ') AND'+CR_LF+
    '  (IDEMPRPART  = ' +FloatToStr(IdEmpresaParticip)+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOMINAL, REAL');
end;

procedure TCtrlPesquisaEmpresa.CalcularTendencia;
var
  TotFreq, c, ModaFreq, Tamanho: integer;
  TotNom, TotReal, ModaNom, ModaReal: real;
  sVinteZeros: string;
begin
  if not(FCdsDadosPesquisaEmpresa.IsEmpty) then
  begin
    FCdsDadosPesquisaEmpresa.DisableControls;
    FCdsDadosPesquisaEmpresa.First;

    FListaSalNominal.Clear;
    FListaSalReal.Clear;

    sVinteZeros := '00000000000000000000';
    TotFreq := 0;
    ModaFreq := 0;
    TotNom := 0;
    TotReal := 0;
    ModaNom := 0;
    ModaReal := 0;

    while not(FCdsDadosPesquisaEmpresa.EOF) do
    begin
       TotFreq := TotFreq + FCdsDadosPesquisaEmpresa.FieldByName('FREQ').asInteger;

       for c:=1 to FCdsDadosPesquisaEmpresa.FieldByName('FREQ').asInteger do
       begin
          // Criar Listas Classificadas para Sal. Nominal e Real
          Tamanho := Length(FloatToStrF
            (FCdsDadosPesquisaEmpresa.FieldByName('NOMINAL').asFloat, ffFixed,12,2));
          FListaSalNominal.Add(Copy(sVinteZeros,1,20-Tamanho) + FloatToStrF
            (FCdsDadosPesquisaEmpresa.FieldByName('NOMINAL').asFloat, ffFixed,12,2));

          Tamanho := Length(FloatToStrF
            (FCdsDadosPesquisaEmpresa.FieldByName('REAL').asFloat, ffFixed,12,2));
          FListaSalReal.Add(Copy(sVinteZeros,1,20-Tamanho) + FloatToStrF
            (FCdsDadosPesquisaEmpresa.FieldByName('REAL').asFloat, ffFixed,12,2));
       end;

       TotNom := TotNom + FCdsDadosPesquisaEmpresa.FieldByName('FREQ').asInteger *
         FCdsDadosPesquisaEmpresa.FieldByName('NOMINAL').asFloat;
       TotReal := TotReal + FCdsDadosPesquisaEmpresa.FieldByName('FREQ').asInteger *
         FCdsDadosPesquisaEmpresa.FieldByName('REAL').asFloat;

       if (FCdsDadosPesquisaEmpresa.FieldByName('FREQ').asInteger >= ModaFreq) then
       begin
         ModaNom := FCdsDadosPesquisaEmpresa.FieldByName('NOMINAL').asFloat;
         ModaReal := FCdsDadosPesquisaEmpresa.FieldByName('REAL').asFloat;
         ModaFreq := FCdsDadosPesquisaEmpresa.FieldByName('FREQ').asInteger;
       end;
       FCdsDadosPesquisaEmpresa.Next;
    end;
    FCdsDadosPesquisaEmpresa.First;

    if (FListaSalNominal.Count = 0) then
      exit;

    FCdsPesquisaEmpresa.FieldByName('FREQ').asInteger := TotFreq;
    FCdsPesquisaEmpresa.FieldByName('MENOR').asString := FListaSalNominal[0];

    c := Round(FListaSalNominal.Count / 4) - 1;
    if (c < 0) then
      c := 0;
    FCdsPesquisaEmpresa.FieldByName('PRIMQUA').asString := FListaSalNominal[c];

    c := Round(FListaSalNominal.Count / 2) - 1;
    if (c < 0) then
      c := 0;
    FCdsPesquisaEmpresa.FieldByName('MEDIANA').asString := FListaSalNominal[c];

    c := Round(3 * FListaSalNominal.Count / 4) - 1;
    if (c < 0) then
      c := 0;
    FCdsPesquisaEmpresa.FieldByName('TERCQUA').asString := FListaSalNominal[c];

    FCdsPesquisaEmpresa.FieldByName('MEDIA').asFloat := TotNom / TotFreq;
    FCdsPesquisaEmpresa.FieldByName('MODA').asFloat := ModaNom;
    FCdsPesquisaEmpresa.FieldByName('MAIOR').asString :=
      FListaSalNominal[FListaSalNominal.Count-1];
    FCdsPesquisaEmpresa.FieldByName('MENOR_R').asString := FListaSalReal[0];

    c := Round(FListaSalReal.Count / 4) - 1;
    if (c < 0) then
      c := 0;
    FCdsPesquisaEmpresa.FieldByName('PRIMQUA_R').asString := FListaSalReal[c];

    c := Round(FListaSalReal.Count / 2) - 1;
    if (c < 0) then
      c := 0;
    FCdsPesquisaEmpresa.FieldByName('MEDIANA_R').asString := FListaSalReal[c];

    c := Round(3 * FListaSalReal.Count / 4) - 1;
    if (c < 0) then
      c := 0;
    FCdsPesquisaEmpresa.FieldByName('TERCQUA_R').asString := FListaSalReal[c];

    FCdsPesquisaEmpresa.FieldByName('MEDIA_R').asFloat := TotReal / TotFreq;
    FCdsPesquisaEmpresa.FieldByName('MODA_R').asFloat := ModaReal;
    FCdsPesquisaEmpresa.FieldByName('MAIOR_R').asString :=
      FListaSalReal[FListaSalReal.Count-1];

    FCdsDadosPesquisaEmpresa.EnableControls;
  end;
end;

procedure TCtrlPesquisaEmpresa.InserirColetaSalarial(ListaQuantSal, ListaSalNominal,
  ListaSalReal: string);
var
  c: integer;
  _ListaQuantSal: TStringList;
begin
  _ListaQuantSal := TStringList.Create;

  _ListaQuantSal.Text := ListaQuantSal;
  FListaSalNominal.Text := ListaSalNominal;
  FListaSalReal.Text := ListaSalReal;

  FCdsDadosPesquisaEmpresa.First;
  while not(FCdsDadosPesquisaEmpresa.EOF) do
    FCdsDadosPesquisaEmpresa.Delete;

  if (_ListaQuantSal.Count > 0) and (FListaSalNominal.Count > 0) and
     (FListaSalReal.Count > 0) then
    for c:=0 to FListaSalNominal.Count-1 do
    begin
      FCdsDadosPesquisaEmpresa.Insert;
      FCdsDadosPesquisaEmpresa.FieldByName('FREQ').asString := _ListaQuantSal[c];
      FCdsDadosPesquisaEmpresa.FieldByName('NOMINAL').asString := FListaSalNominal[c];
      FCdsDadosPesquisaEmpresa.FieldByName('REAL').asString := FListaSalReal[c];
      FCdsDadosPesquisaEmpresa.Post;
    end;

  _ListaQuantSal.Free;
end;

function TCtrlPesquisaEmpresa.GravarPesquisaEmpresa(GravarDados: boolean): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPesquisaEmpresa(GravarDados,
      FCdsPesquisaEmpresa.Data, FCdsDadosPesquisaEmpresa.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsPesquisaEmpresa, FDbPesquisaEmpresa, [], []);
      if (Result) then
      begin
        if (GravarDados) then
        begin
          Result := ApplyCds(FCdsDadosPesquisaEmpresa, FDbDadosPesquisaEmpresa, [], []);
          if not(Result) then
            raise Exception.Create(FDbDadosPesquisaEmpresa.MessageInfo);
        end;
      end
      else
        raise Exception.Create(FDbPesquisaEmpresa.MessageInfo);

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

function TCtrlPesquisaEmpresa.ExcluirPesquisaEmpresa: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirPesquisaEmpresa(FCdsPesquisaEmpresa.Data,
      FCdsDadosPesquisaEmpresa.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsDadosPesquisaEmpresa, FDbDadosPesquisaEmpresa, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsPesquisaEmpresa, FDbPesquisaEmpresa, [], []);
        if not(Result) then
          raise Exception.Create(FDbPesquisaEmpresa.MessageInfo);
      end
      else
        raise Exception.Create(FDbDadosPesquisaEmpresa.MessageInfo);

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
