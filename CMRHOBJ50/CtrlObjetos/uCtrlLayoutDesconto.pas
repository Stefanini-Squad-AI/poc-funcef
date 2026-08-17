{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 25/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlLayoutDesconto;


// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Autor(a)   : Douglas Siqueira
//Data       : 21/12/2012
//Pendência  : SOL 108804 KTN 494141	
//Descricao  : Retirar visualização na Folha de Pagamento de dados de outros módulos, 
//tais como: layout de arquivos TXT, tabelas genéricas, rubricas, formas de cálculo etc.
// Menus: * Cadastro / Tabelas Auxiliares / Tabela REGRA/Forma de Cálculo - Forma de Cálculo
// e Tabela Genérica * Sistema / Utilitários / Layout de Arquivos TXT * Cadastros / Rubricas
// por Empresa * Cadastros / Rubricas Salariais * Cadastros / Motivos e Ações Impedir o mesmo
//acesso aos dados da folha por outros módulos.

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbLayoutDesconto, uDbLayoutXColunas;

type
  TCtrlLayoutDesconto = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbLayoutDesconto;
    FDbDet: TDbLayoutXColunas;
    FCds: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListMestre(IdLayout: double): OleVariant;
    function ListDetalhe(IdLayout: double): OleVariant;
    function ListLayoutDescontoXColunas: OleVariant;

    function Gravar: boolean;
    function Excluir: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlLayoutDesconto }

constructor TCtrlLayoutDesconto.Create;
begin
  inherited;
  FDb := TDbLayoutDesconto.Create(Self);
  FDbDet := TDbLayoutXColunas.Create(Self);
end;

destructor TCtrlLayoutDesconto.Destroy;
begin
  FDbDet.Free;
  FDb.Free;
  if (IsAppServer) then
  begin
    FCdsDet.Free;
    FCds.Free;
  end;
  inherited;
end;

procedure TCtrlLayoutDesconto.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlLayoutDesconto.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlLayoutDesconto.ListMestre(IdLayout: double): OleVariant;
begin
///douglas.siqueira SOL108804
  if MODFOL = 21 then
     begin
     Result := GetDataPacket(
    'SELECT'+IFF(IdLayout=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDLAYOUT, Descricao, ColCodigo, TamCodigo,'+CR_LF+
    '  ColCodFavorecido, TamCodFavorecido, ColCodigoDep, IDMODULO'+CR_LF+
    'FROM'+CR_LF+
    '  LayoutDesconto'+CR_LF+
      IFF(IdLayout=-1, 'WHERE (1 = 2)',
      IFF(IdLayout=0, '', 'WHERE'+CR_LF+
          ' (IDMODULO = ' +IntToStr(MODFOL)+ ')'+CR_LF+///DOUGLAS.SIQUEIRA SOL 108804
        '  AND (IDLAYOUT = '+FloatToStr(IdLayout)+')')));///DOUGLAS.SIQUEIRA SOL 108804
      end
   else
       begin
       Result := GetDataPacket(
       'SELECT'+IFF(IdLayout=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
       '  IDLAYOUT, Descricao, ColCodigo, TamCodigo,'+CR_LF+
       '  ColCodFavorecido, TamCodFavorecido, ColCodigoDep, IDMODULO'+CR_LF+
       'FROM'+CR_LF+
       '  LayoutDesconto'+CR_LF+
       IFF(IdLayout=-1, 'WHERE (1 = 2)',
       IFF(IdLayout=0, '', 'WHERE'+CR_LF+
//          ' (IDMODULO = ' +IntToStr(MODFOL)+ ')'+CR_LF+///DOUGLAS.SIQUEIRA SOL 108804
          ' (IDLAYOUT = '+FloatToStr(IdLayout)+')')));///DOUGLAS.SIQUEIRA SOL 108804
       end;
///douglas.siqueira SOL108804
end;

function TCtrlLayoutDesconto.ListDetalhe(IdLayout: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT *'+IFF(IdLayout=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    'FROM'+CR_LF+
    '  LAYOUTXCOLUNAS'+CR_LF+
    IFF(IdLayout=-1, 'WHERE (1 = 2)',
      IFF(IdLayout=0, '', 'WHERE'+CR_LF+
        '  (IDLAYOUT = '+FloatToStr(IdLayout)+')')));
end;

function TCtrlLayoutDesconto.ListLayoutDescontoXColunas: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  LD.IdLayout, LD.DESCRICAO, LD.ColCodigo, LD.TamCodigo,'+CR_LF+
    '  LD.ColCodFavorecido, LD.TamCodFavorecido, LD.ColCodigoDep,'+CR_LF+
    '  LC.ColValor, LC.TamValor, LC.CodCentroRespon,'+CR_LF+
    '  LC.NumDecimais, LC.CaracDecimal, LC.ColParcelas, LC.TamParcelas,'+CR_LF+
    '  LC.ColOcorrencias, LC.TamOcorrencias, LC.IdRubrica'+CR_LF+
    'FROM'+CR_LF+
    '  LayoutDesconto LD, LayoutXColunas LC'+CR_LF+
    'WHERE'+CR_LF+
    '  (LD.IdLayout = LC.IdLayout)');
end;

function TCtrlLayoutDesconto.Gravar: boolean;
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
        Result := ApplyCds(FCdsDet, FDbDet, [FDb.IdLayout], [FDbDet.IdLayout]);
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

function TCtrlLayoutDesconto.Excluir: boolean;
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
