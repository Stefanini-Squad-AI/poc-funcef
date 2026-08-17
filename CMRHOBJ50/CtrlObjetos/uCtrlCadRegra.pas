unit uCtrlCadRegra;


// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{***************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : ListRubricasAssocTabGener (inclusão da View VW_RUBXEVENTO)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************}
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

uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
  uCtrlCustomRH, uDbRegra;

type
  TCtrlCadRegra = class(TCtrlCustomRH)
  private
    FCdsRegra: TCMClientDataSet;
    FDbRegra: TDbRegra;
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override; 
  public
    constructor Create;  override;
    destructor  Destroy; override;

    property DbRegra: TDbRegra read FDbRegra write FDbRegra;
    property CdsRegra: TCMClientDataSet read FCdsRegra write FCdsRegra;

    function ListRegra(IdRegra: double): OleVariant;
    function ListaRegra(IdGrpRegra: double = -1): OleVariant;
    function ListFormaCalc: OleVariant;
    function ListFormaCalcExpressao(Expressao: string): OleVariant;
    function ListFormaCalcAssocTabGener(CodTabela: string): OleVariant;
    function ListRubricasAssocTabGener(CodTabela: string): OleVariant;

    function ExisteRegra(IdRegra:double): boolean;

    function GravarRegra: boolean;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlCadRegra }

constructor TCtrlCadRegra.Create;
begin
  inherited;
  FDbRegra  := TDbRegra.Create(Self);
end;

destructor TCtrlCadRegra.Destroy;
begin
  FDbRegra.Free;
  if (IsAppServer) then
  FCdsRegra.Free;
  inherited;
end;

procedure TCtrlCadRegra.OnCreateAppServer;
begin
  inherited;
  FCdsRegra := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCadRegra.DoChangeDataBase;
begin
  inherited;
  FDbRegra.DataBaseName := Self.DataBaseName;
end;

function TCtrlCadRegra.ListRegra(IdRegra: double): OleVariant;
begin
//douglas.siqueira SOL108804
  if MODFOL = 21 then
     FDbRegra.IdMODULO.asFloat := MODFOL;
//douglas.siqueira SOL108804
  FDbRegra.IdRegra.asFloat := IdRegra;
  Result := GetDataPacket(FDbRegra.sSqlSelect);
end;

function TCtrlCadRegra.ExisteRegra(IdRegra: double): Boolean;
begin
  FDbRegra.IdRegra.asFloat := IdRegra;
//douglas.siqueira SOL108804
  if MODFOL = 21 then
     FDbRegra.IdMODULO.asFloat := MODFOL;  
//douglas.siqueira SOL108804
  CdsRegra.Data := GetDataPacket(FDbRegra.sSqlSelect);
  Result := not(CdsRegra.IsEmpty);
end;

function TCtrlCadRegra.ListaRegra(IdGrpRegra: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  R.IDREGRA, R.NOMEREGRA, R.IDMODULO'+CR_LF+//douglas.siqueira SOL108804
    'FROM'+CR_LF+
    '  REGRA R, TIPOREGRA TR, GRUPOREGRA GR'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdGrpRegra>0,'  (GR.IDGRUPOREGRA = ' +FloatToStr(IdGrpRegra)+ ') AND'+CR_LF,'')+
    '  (R.IDTIPOREGRA   = TR.IDTIPOREGRA) AND'+CR_LF+
    '  (TR.IDGRUPOREGRA = GR.IDGRUPOREGRA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOMEREGRA');
end;

function TCtrlCadRegra.ListFormaCalc: OleVariant;
var
  c: byte;
  _CdsAux, _CdsPrincipal: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsPrincipal := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  IDREGRA, NOMEREGRA, DESCRICAOREGRA, PUBLICADA, IDTIPOREGRA'+CR_LF+
      'FROM'+CR_LF+
      '  REGRA R'+CR_LF+
      'WHERE'+CR_LF+
      '  NOT EXISTS (SELECT DISTINCT IDREGRA'+CR_LF+
      '              FROM   ALGREGRA A'+CR_LF+
      '              WHERE  (A.IDREGRA = R.IDREGRA))'+CR_LF+
      'ORDER BY'+CR_LF+
      '  NOMEREGRA');
      
    _CdsPrincipal.Data := _CdsAux.Data;
    _CdsPrincipal.EmptyDataSet;
    repeat
      if (Trim(_CdsAux.FieldByName('DESCRICAOREGRA').asString) <> '') then
      begin
        _CdsPrincipal.Append;
        for c:=0 to _CdsAux.FieldCount-1 do
          _CdsPrincipal.Fields[c].Value := _CdsAux.Fields[c].Value;
        _CdsPrincipal.Post;
      end;
      _CdsAux.Next;
    until (_CdsAux.EOF);

    Result := _CdsPrincipal.Data;
  finally
    _CdsAux.Free;
    _CdsPrincipal.Free;
  end;
end;

function TCtrlCadRegra.ListFormaCalcExpressao(Expressao: string): OleVariant;
var
  c: byte;
  _CdsAux, _CdsPrincipal: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsPrincipal := TCMClientDataSet.Create(nil);
  try
//douglas.siqueira SOL108804
    if MODFOL = 21 then
       begin
       _CdsAux.Data := GetDataPacket(
         'SELECT'+CR_LF+
         '  IDREGRA, NOMEREGRA, DESCRICAOREGRA'+CR_LF+
         'FROM'+CR_LF+
          '  REGRA WHERE IDMODULO = 21');
        end
     else
       begin
       _CdsAux.Data := GetDataPacket(
         'SELECT'+CR_LF+
         '  IDREGRA, NOMEREGRA, DESCRICAOREGRA'+CR_LF+
         'FROM'+CR_LF+
          '  REGRA ');
        end;

//douglas.siqueira SOL108804

    _CdsPrincipal.Data := _CdsAux.Data;
    if (Expressao <> '') and not(_CdsAux.IsEmpty) then
    begin
      _CdsPrincipal.EmptyDataSet;
      repeat
        if (Pos(Expressao,_CdsAux.FieldByName('DESCRICAOREGRA').asString) > 0) then
        begin
          _CdsPrincipal.Append;
          for c:=0 to _CdsAux.FieldCount-1 do
            _CdsPrincipal.Fields[c].Value := _CdsAux.Fields[c].Value;
          _CdsPrincipal.Post;
        end;
        _CdsAux.Next;
      until (_CdsAux.EOF);
  end;

    Result := _CdsPrincipal.Data;
  finally
    _CdsAux.Free;
    _CdsPrincipal.Free;
  end;
end;

function TCtrlCadRegra.ListFormaCalcAssocTabGener(CodTabela: string): OleVariant;
var
  c: byte;
  _CdsAux, _CdsPrincipal: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsPrincipal := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +IFF(CodTabela='-1',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
      '  IDREGRA, NOMEREGRA, DESCRICAOREGRA'+CR_LF+
      'FROM'+CR_LF+
      '  REGRA'+
      IFF(CodTabela='-1',CR_LF+ 'WHERE' +CR_LF+ '  (1 = 2)',''));

    _CdsPrincipal.Data := _CdsAux.Data;
    if (CodTabela <> '-1') and (CodTabela <> '') and not(_CdsAux.IsEmpty) then
    begin
      _CdsPrincipal.EmptyDataSet;
      repeat
        if (Pos('F%TABGENERICA('+CodTabela,_CdsAux.FieldByName('DESCRICAOREGRA').asString) > 0) then
        begin
          _CdsPrincipal.Append;
          for c:=0 to _CdsAux.FieldCount-1 do
            _CdsPrincipal.Fields[c].Value := _CdsAux.Fields[c].Value;
          _CdsPrincipal.Post;
        end;
        _CdsAux.Next;
      until (_CdsAux.EOF);
    end;

    Result := _CdsPrincipal.Data;
  finally
    _CdsAux.Free;
    _CdsPrincipal.Free;
  end;
end;

function TCtrlCadRegra.ListRubricasAssocTabGener(CodTabela: string): OleVariant;
var
  sListaFormaCalc: string;
  _CdsFormaCalc: TCMClientDataSet;
begin
  _CdsFormaCalc := TCMClientDataSet.Create(nil);
  try
    sListaFormaCalc := '';
    if (CodTabela <> '-1') and (CodTabela <> '') then
  begin
      _CdsFormaCalc.Data := ListFormaCalcAssocTabGener(CodTabela);
      while not(_CdsFormaCalc.EOF) do
      begin
        if (sListaFormaCalc = '') then
          sListaFormaCalc := _CdsFormaCalc.FieldByName('IDREGRA').asString
  else
          sListaFormaCalc := sListaFormaCalc +','+ _CdsFormaCalc.FieldByName('IDREGRA').asString;
        _CdsFormaCalc.Next;
      end;

      if (sListaFormaCalc <> '') then
      begin
        if (Pos(',',sListaFormaCalc) = 0) then
          sListaFormaCalc := '  = '+ sListaFormaCalc
  else
          sListaFormaCalc := ' IN ('+ sListaFormaCalc +')';
      end;
    end;

    Result := GetDataPacket(
      'SELECT' +IFF((CodTabela='-1') or (sListaFormaCalc=''),' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
      '  PD.IDPROVENTO, PD.DESCRICAO'+CR_LF+             // edilaine - SOL 191668 / KTN 1820235
      'FROM'+CR_LF+
      '  PROVDESC PD, VW_RUBXEVENTO RXE '+CR_LF+         // edilaine - SOL 191668 / KTN 1820235
      'WHERE'+CR_LF+
      '  PD.IDPROVENTO = RXE.IDPROVENTO(+) AND '+CR_LF+  // edilaine - SOL 191668 / KTN 1820235
      IFF((CodTabela='-1') or (sListaFormaCalc=''),
        '  (1 = 2)',
        // inicio - edilaine - SOL 191668 / KTN 1820235
        '  (PD.FLGTPRUBRICA  LIKE ''%F%'') AND'+CR_LF+
        '  ((PD.IDREGRA        ' +sListaFormaCalc+ ') OR'+CR_LF+
        '   (RXE.IDREGRA13      ' +sListaFormaCalc+ ') OR'+CR_LF+
        '   (RXE.IDREGRAFERIAS  ' +sListaFormaCalc+ ') OR'+CR_LF+
        '   (RXE.IDREGRARESCISAO' +sListaFormaCalc+ '))'));
        // fim - edilaine - SOL 191668 / KTN 1820235
  finally
    _CdsFormaCalc.Free;
  end;
end;

function TCtrlCadRegra.GravarRegra: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFormaCalc(FCdsRegra.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsRegra, FDbRegra, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbRegra.MessageInfo);
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
