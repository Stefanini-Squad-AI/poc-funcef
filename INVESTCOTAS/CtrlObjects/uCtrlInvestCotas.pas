unit uCtrlInvestCotas;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uDbTipoInvest, uDbTipoOPeracao, uDbTipoDespInvest, UDbRegra
     {$IFNDEF VERSAO0505} , uCMTypes {$ENDIF};

type
   TCtrlInvestCotas = Class(TCmControlObject)
   private
    FCdsTipoInvest : TClientDataSet;
    FCdsTipoOperacao : TClientDataSet;
    FCdsTipoDespInvest : TClientDataSet;
    FCdsRegra : TClientDataSet;
    FCdsCarteiraInvest : TClientDataSet;
    FCdsMercado : TClientDataSet;
    FCdsConselheiro : TClientDataSet;
    FCdsGestor : TClientDataSet;
    FCdsPlano : TClientDataSet;
    FCdsPatrocinadora : TClientDataSet;
    FCdsMoeda: TClientDataSet;

    procedure SetCdsTipoInvest(const Value: TClientDataSet);
    procedure SetCdsTipoOperacao(const Value: TClientDataSet);
    procedure SetCdsTipoDespInvest(const Value: TClientDataSet);
    procedure SetCdsRegra(const Value: TClientDataSet);
    procedure SetCdsCarteiraInvest(const Value: TClientDataSet);
    procedure SetCdsMercado(const Value: TClientDataSet);
    procedure SetCdsConselheiro(const Value: TClientDataSet);
    procedure SetCdsGestor(const Value: TClientDataSet);
    procedure SetCdsPlano(const Value: TClientDataSet);
    procedure SetCdsPatrocinadora(const Value: TClientDataSet);
    procedure SetCdsMoeda(const Value: TClientDataSet);

   public
      property CdsTipoInvest : TClientDataSet read FCdsTipoInvest write SetCdsTipoInvest;
      property CdsTipoOperacao : TClientDataSet read FCdsTipoOperacao write SetCdsTipoOperacao;
      property CdsTipoDespInvest : TClientDataSet read FCdsTipoDespInvest write SetCdsTipoDespInvest;
      property CdsRegra : TClientDataSet read FCdsRegra write SetCdsRegra;
      property CdsCarteiraInvest : TClientDataSet read FCdsCarteiraInvest write SetCdsCarteiraInvest;
      property CdsMercado : TClientDataSet read FCdsMercado write SetCdsMercado;
      property CdsConselheiro : TClientDataSet read FCdsConselheiro write SetCdsConselheiro;
      property CdsGestor : TClientDataSet read FCdsGestor write SetCdsGestor;
      property CdsPlano : TClientDataSet read FCdsPlano write SetCdsPlano;
      property CdsPatrocinadora : TClientDataSet read FCdsPatrocinadora write SetCdsPatrocinadora;
      property CdsMoeda : TClientDataSet read FCdsMoeda write SetCdsMoeda;      

      constructor Create; override;

      destructor  Destroy; override;

      procedure   OnCreateAppServer; override;

      function ListTipoInvest(iIdTipoInvest : Integer = 0) : OleVariant;

      function ListTipoOperacao(iIdTipoInvest : Integer = 0; iIdTipoOperacao : Integer = 0) : OleVariant;

      function ListDespXTipoOper(iIdTipoInvest : Integer = 0; iIdTipoOperacao : Integer = 0) : OleVariant;

      function ListRegra(iIdRegra : Integer = 0) : OleVariant;

      function ListMercado(iIdMercado : Integer = 0; iIdTipoInvest : Integer = 0) : OleVariant;

      function ListConselheiro(iIdConselhInvest : Integer = 0) : OleVariant;

      function ListGestor : OleVariant;

      function ListPlano : OleVariant;

      function ListPatrocinadora : OleVariant;

      function ListMoeda(iIdMoeda: Integer = 0): OleVariant;

      function ListLogoEmpresa : OleVariant;

      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime; overload;

      Function MontaMascara(iQtdDec : Integer = 0) : String;      

   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{ TCtrlInvestCotas }

constructor TCtrlInvestCotas.Create;
begin
  inherited;

end;

destructor TCtrlInvestCotas.Destroy;
begin
  inherited;

end;

procedure TCtrlInvestCotas.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlInvestCotas.ListRegra(iIdRegra: Integer): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDREGRA, NOMEREGRA, IDTIPOREGRA, DESCRICAOREGRA, PUBLICADA ';
   sSql := sSql + 'FROM  REGRA ';
   if iIdRegra > 0 then
      sSql := sSql + 'WHERE IDREGRA = '+IntToStr(iIdRegra);
   sSql := sSql + ' ORDER BY NOMEREGRA ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestCotas.ListDespXTipoOper(iIdTipoInvest, iIdTipoOperacao : Integer) : OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT T.IDTIPODESPINVEST, T.MOECODIGO, T.IDFORCLI, T.DESCTIPODESPINV, ';
   sSql := sSql + '       T.EMPRESAPROP, T.TIPCREDOR, T.NATUREZAOPERACAO, T.PERCDIVVLRAUT ';
   sSql := sSql + 'FROM  TIPODESPINVEST T, DESPESASXTIPOOPER D ';
   sSql := sSql + 'WHERE T.IDTIPODESPINVEST = D.IDTIPODESPINVEST ';
   if iIdTipoInvest > 0 then
      sSql := sSql + 'AND D.IDTIPOINVEST = '+IntToStr(iIdTipoInvest);
   if iIdTipoOperacao > 0 then
      sSql := sSql + 'AND D.IDTIPOOPERACAO = '+IntToStr(iIdTipoOperacao);
   sSql := sSql + ' ORDER BY T.DESCTIPODESPINV ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestCotas.ListTipoInvest(iIdTipoInvest : Integer): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDTIPOINVEST, DESCTIPOINVEST, CODSEGDAIEA, DTATRAVACTB ';
   sSql := sSql + 'FROM  TIPOINVEST ';
   if iIdTipoInvest > 0 then
      sSql := sSql + 'WHERE IDTIPOINVEST = '+IntToStr(iIdTipoInvest);
   sSql := sSql + ' ORDER BY DESCTIPOINVEST ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestCotas.ListTipoOperacao(iIdTipoInvest, iIdTipoOperacao : Integer): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDTIPOINVEST, IDTIPOOPERACAO, DESCTIPOOPERACAO ';
   sSql := sSql + 'FROM  TIPOOPERACAO ';
   if (iIdTipoInvest > 0) or (iIdTipoOperacao > 0) then
      sSql := sSql + 'WHERE ';
   if iIdTipoInvest > 0 then
      sSql := sSql + '  IDTIPOINVEST   = '+IntToStr(iIdTipoInvest);
   if iIdTipoOperacao > 0 then
      sSql := sSql + '  IDTIPOOPERACAO = '+IntToStr(iIdTipoOperacao);
   sSql := sSql + ' ORDER BY DESCTIPOOPERACAO ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlInvestCotas.OnCreateAppServer;
begin
  inherited;

end;

procedure TCtrlInvestCotas.SetCdsTipoInvest(const Value: TClientDataSet);
begin
  FCdsTipoInvest := Value;
end;

procedure TCtrlInvestCotas.SetCdsTipoOperacao(const Value: TClientDataSet);
begin
  FCdsTipoOperacao := Value;
end;

procedure TCtrlInvestCotas.SetCdsTipoDespInvest(
  const Value: TClientDataSet);
begin
  FCdsTipoDespInvest := Value;
end;

procedure TCtrlInvestCotas.SetCdsRegra(const Value: TClientDataSet);
begin
  FCdsRegra := Value;
end;

procedure TCtrlInvestCotas.SetCdsCarteiraInvest(
  const Value: TClientDataSet);
begin
  FCdsCarteiraInvest := Value;
end;

procedure TCtrlInvestCotas.SetCdsMercado(const Value: TClientDataSet);
begin
  FCdsMercado := Value;
end;

function TCtrlInvestCotas.ListMercado(iIdMercado, iIdTipoInvest : Integer): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDMERCADO, IDTIPOINVEST, DESCMERCADO, DTATRAVACTB ';
   sSql := sSql + 'FROM  MERCADO ';
   if (iIdMercado > 0) or (iIdTipoInvest > 0) then
      sSql := sSql + 'WHERE ';
   if iIdMercado > 0 then
      sSql := sSql + '  IDMERCADO   = '+IntToStr(iIdTipoInvest);
   if iIdTipoInvest > 0 then
      sSql := sSql + '  IDTIPOINVEST = '+IntToStr(iIdTipoInvest);
   sSql := sSql + ' ORDER BY DESCMERCADO ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlInvestCotas.SetCdsConselheiro(const Value: TClientDataSet);
begin
  FCdsConselheiro := Value;
end;

function TCtrlInvestCotas.ListConselheiro(iIdConselhInvest: Integer): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDCONSELHINVEST, DESCONSELINVEST ';
   sSql := sSql + 'FROM  CONSELHINVEST ';
   if iIdConselhInvest > 0 then
      sSql := sSql + 'WHERE IDCONSELHINVEST   = '+IntToStr(iIdConselhInvest);
   sSql := sSql + ' ORDER BY DESCONSELINVEST ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlInvestCotas.SetCdsGestor(const Value: TClientDataSet);
begin
  FCdsGestor := Value;
end;

function TCtrlInvestCotas.ListGestor: OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT G.IDGESTORCARTEIRA, P.IDPESSOA, P.NOME ';
   sSql := sSql + 'FROM   PESSOA P, GESTORCARTEIRA G ';
   sSql := sSql + 'WHERE P.IDPESSOA = G.IDGESTORCARTEIRA ';
   sSql := sSql + 'ORDER BY P.NOME ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlInvestCotas.SetCdsPlano(const Value: TClientDataSet);
begin
  FCdsPlano := Value;
end;

function TCtrlInvestCotas.ListPlano: OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT NOME, IDPLANOPREV ';
   sSql := sSql + 'FROM PLANPREV ';
   sSql := sSql + 'ORDER BY NOME ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlInvestCotas.SetCdsPatrocinadora(
  const Value: TClientDataSet);
begin
  FCdsPatrocinadora := Value;
end;

function TCtrlInvestCotas.ListPatrocinadora: OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT PE.NOME, PA.IDPESSOA FROM PESSOA PE, PATRO PA ';
   sSql := sSql + 'WHERE (PE.IDPESSOA = PA.IDPESSOA) ';
   sSql := sSql + 'ORDER BY PE.NOME ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestCotas.ListMoeda(iIdMoeda: Integer): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT MOECODIGO, MOEDESC, MOESIGLA, MOEPERIODICIDADE, MOEINATIVO, FLGPERCVALOR, DATAINICIO, '+#13+
                  '       DATAFIM, MOEDAREFERENCIA, FLGTIPOPRAZO, FLGPERIODO, DESCUNIDADETAXA, FLGTESTADATASCOT '+#13+
                  'FROM  MOEDA '+#13+
                  'WHERE MOEINATIVO = ''A'' ';
   if iIdMoeda > 0 then
      sSql := sSql + 'AND MOECODIGO = '+IntToStr(iIdMoeda);
   sSql := sSql + ' ORDER BY MOEDESC ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlInvestCotas.SetCdsMoeda(const Value: TClientDataSet);
begin
  FCdsMoeda := Value;
end;

function TCtrlInvestCotas.ListLogoEmpresa: OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT EP.IDPESSOA, EP.NOMEEMPRESA, PE.RAZAOSOCIAL, '+#13+
                  '       EN.IDENDERECO, EN.CEP, IM.IMAGEM '+#13+
                  'FROM PESSOA PE, ENDPESS EN, CIDADES CI, ESTADO ES, IMAGENS IM, EMPRESAPROP EP '+#13+
                  'WHERE (EP.IDPESSOA = PE.IDPESSOA) AND '+#13+
                  '      (PE.IDIMAGEM = IM.IDIMAGEM(+)) AND '+#13+
                  '      (EN.IDENDERECO(+) = PE.IDENDCOMERCIAL) AND '+#13+
                  '      (CI.IDCIDADES(+) = EN.IDCIDADES) AND '+#13+
                  '      (ES.IDESTADO(+) = CI.IDESTADO) ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestCotas.IIF(BooleanExpr: Boolean; IfTrue,
  IfFalse: Integer): Integer;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TCtrlInvestCotas.IIF(BooleanExpr: Boolean; IfTrue,
  IfFalse: String): String;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TCtrlInvestCotas.IIF(BooleanExpr: Boolean; IfTrue,
  IfFalse: TDateTime): TDateTime;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TCtrlInvestCotas.IIF(BooleanExpr: Boolean; IfTrue,
  IfFalse: Extended): Extended;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TCtrlInvestCotas.MontaMascara(iQtdDec: Integer): String;
Var
   sMascara : String;
   i        : Integer;
begin
   if iQtdDec <= 0 Then
      sMascara := '###,#0.000000000'
   else
   Begin
      sMascara := '###,#0.';
      For i := 1 To iQtdDec Do
          sMascara := sMascara + '0';
   end;
   Result := sMascara;
end;

end.
