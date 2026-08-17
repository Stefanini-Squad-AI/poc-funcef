{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/09/2002                                 }
{                                                       }
{*******************************************************}
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************
//******************************************************************************
//Rotina             : ListPortadorXContaXFolha
//N. SIG..........   : 61776
//Data da Alteração: : 27/07/2020
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Adequação da funcionalidade para recuperação de convênio
//                     bancário na utilização da remessa eletrônica, modelo SIACC
//********************************************************************************
unit uCtrlBancoPortFolha;

interface

uses SysUtils, uSistema, uCMTypes, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbBancoPortFolha;

type
  TCtrlBancoPortFolha = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbBancoPortFolha: TDbBancoPortFolha;
    FCdsBancoPortFolha: TCMClientDataSet;

    FCodPortFormaPadrao: integer;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListBanco: OleVariant;
    function ListBancoPortFolha(RecPag: string = '-1'): OleVariant;
    function ListPortBanco: OleVariant;
    function ListPortadorXConta: OleVariant;
    function ListPortadorXContaXFolha: OleVariant;
    function ListContasEmpresa(IdEmpresa: double): OleVariant;

    function GetCodPortFormaPadrao: integer;
    function GetCodPortForma(IdBanco: integer): integer;
    function GetBancoEmpresa(CodPortForma: integer): integer;

    function GravarBancoPortFolha(ExcluirCodPortFormaPadrao: boolean): boolean;

    property CdsBancoPortFolha: TCMClientDataSet read FCdsBancoPortFolha write FCdsBancoPortFolha;
    property CodPortFormaPadrao: integer read FCodPortFormaPadrao write FCodPortFormaPadrao;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlBancoPortFolha }

constructor TCtrlBancoPortFolha.Create;
begin
  inherited;
  FDbBancoPortFolha := TDbBancoPortFolha.Create(Self);
end;

destructor TCtrlBancoPortFolha.Destroy;
begin
  FDbBancoPortFolha.Free;
  if (IsAppServer) then
    FCdsBancoPortFolha.Free;
  inherited;
end;

procedure TCtrlBancoPortFolha.OnCreateAppServer;
begin
  inherited;
  FCdsBancoPortFolha := TCMClientDataSet.Create(nil);
end;

procedure TCtrlBancoPortFolha.DoChangeDataBase;
begin
  inherited;
  FDbBancoPortFolha.DataBaseName := DataBaseName;
end;

function TCtrlBancoPortFolha.ListBanco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PB.IDPESSOA, PB.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PB, BANCO B'+CR_LF+
    'WHERE'+CR_LF+
    '  (B.IDPESSOA       = PB.IDPESSOA) AND'+CR_LF+
    '  (PB.IDPESSOA NOT IN (SELECT IDBANCO'+CR_LF+
    '                       FROM   BANCOPORTFOLHA'+CR_LF+
    '                       WHERE  (IDBANCO IS NOT NULL)))');
end;

function TCtrlBancoPortFolha.ListBancoPortFolha(RecPag: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  PORTADORFORMA'+CR_LF+
    IFF(RecPag='-1', '', 'WHERE (RECPAG = ' +QuotedStr(RecPag)+ ')')+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlBancoPortFolha.ListPortBanco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  BPF.IDBANCOPORTFORMA, BPF.IDBANCO, BPF.CODPORTFORMA,'+CR_LF+
    '  PB.NOME AS NOMEBANCO, PF.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PB, BANCOPORTFOLHA BPF, PORTADORFORMA PF'+CR_LF+
    'WHERE'+CR_LF+
    '  (BPF.IDBANCO IS NOT NULL) AND'+CR_LF+
    '  (BPF.IDBANCO      = PB.IDPESSOA(+)) AND'+CR_LF+
    '  (BPF.CODPORTFORMA = PF.CODPORTFORMA(+))');
end;

function TCtrlBancoPortFolha.ListPortadorXConta: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PFR.CODPORTFORMA, PFR.CODPORTADOR, PFR.DESCRICAO, PFR.CODARQUIVOREMESSA,'+CR_LF+
    '  PFR.CONTROLEREMESSA, PFR.CODFORMAPAGTO, PFR.FLGEMITEAVISO,'+CR_LF+
    '  PFR.CODTIPOPAGTO, PFR.NUMEMPRESABANCO,'+CR_LF+
    '  PCT.IDBANCO, PCT.NOCONTACORR'+CR_LF+
    'FROM'+CR_LF+
    '  PORTADORFORMA PFR, PORTADORCONTA PCT'+CR_LF+
    'WHERE'+CR_LF+
    '  (PCT.CODPORTADOR = PFR.CODPORTADOR)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  PFR.DESCRICAO');
end;

function TCtrlBancoPortFolha.ListPortadorXContaXFolha: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  BPF.CODPORTFORMA, PFR.CODARQUIVOREMESSA, PFR.CONTROLEREMESSA, PTB.IDBANCO'+CR_LF+
    'FROM'+CR_LF+
    '  PORTADORFORMA PFR, PORTADORCONTA PTB, BANCOPORTFOLHA BPF'+CR_LF+
    'WHERE'+CR_LF+
    '  (PFR.CODPORTFORMA = BPF.CODPORTFORMA) AND'+CR_LF+
    //Cássio Rovaroto - SIG 61776 - Início
    //'  (PTB.CODPORTADOR  = PFR.CODPORTADOR)');
    '  (PTB.CODPORTADOR  = PFR.CODPORTADOR)'+CR_LF+
    'GROUP BY BPF.CODPORTFORMA, '+CR_LF+
	  '   PFR.CODARQUIVOREMESSA, '+CR_LF+
    '   PFR.CONTROLEREMESSA,'+CR_LF+
	  '   PTB.IDBANCO');
    //Cássio Rovaroto - SIG 61776 - Fim
end;

function TCtrlBancoPortFolha.ListContasEmpresa(IdEmpresa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PC.IDAGENCIA, AB.NUMAGENCIA, PA.NOME AS NOMEAGENCIA, B.NUMBANCO, PB.NOME AS NOMEBANCO,'+CR_LF+
    '  PC.NOCONTACORR, DECODE(BF.IDBANCO,NULL,1,0) AS PADRAO,'+CR_LF+
    '  TO_CHAR(DECODE(EP.LOGRADOURO,NULL,'+CR_LF+
    '    '''','+CR_LF+
    '    RTRIM(EP.LOGRADOURO) ||'', ''|| TO_CHAR(EP.NUMERO) ||'+CR_LF+
    '    TO_CHAR(DECODE(RTRIM(EP.COMPLEMENTO),NULL,'+CR_LF+
    '      '''','+CR_LF+
    '      '' - '' || RTRIM(EP.COMPLEMENTO)'+CR_LF+
    '    )) ||'' - ''||'+CR_LF+
    '    RTRIM(EP.BAIRRO) ||'' - ''|| RTRIM(CI.NOME) ||'' - CEP:''||'+CR_LF+
    '      RTRIM(SUBSTR(EP.CEP,1,5))'+CR_LF+
    '  )) ||''-''|| RTRIM(SUBSTR(EP.CEP,6,3)) AS ENDERECOAGENCIA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PB, PESSOA PA, ENDPESS EP, AGENCIABANCARIA AB, BANCOPORTFOLHA BF,'+CR_LF+
    '  PORTADORFORMA PF, PORTADORCONTA PC, BANCO B, CIDADES CI'+CR_LF+
    'WHERE'+CR_LF+
    '  (BF.CODPORTFORMA   = PF.CODPORTFORMA) AND'+CR_LF+
    '  (PF.CODPORTADOR    = PC.CODPORTADOR) AND'+CR_LF+
    '  (PC.IDBANCO        = PB.IDPESSOA) AND'+CR_LF+
    '  (PC.IDBANCO        = B.IDPESSOA) AND'+CR_LF+
    '  (PC.IDAGENCIA      = AB.IDPESSOA) AND'+CR_LF+
    '  (PC.IDAGENCIA      = PA.IDPESSOA) AND'+CR_LF+
    '  (PA.IDPESSOA       = EP.IDPESSOA(+)) AND'+CR_LF+
    '  (PA.IDENDCOMERCIAL = EP.IDENDERECO(+)) AND'+CR_LF+
    '  (EP.IDCIDADES      = CI.IDCIDADES(+))');
end;

function TCtrlBancoPortFolha.GetCodPortFormaPadrao: integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Close;
  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  NVL(CODPORTFORMA,-1) AS CODPORTFORMA'+CR_LF+
    'FROM'+CR_LF+
    '  BANCOPORTFOLHA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDBANCO IS NULL)');

  Result := _CdsAux.FieldByName('CODPORTFORMA').asInteger;

  _CdsAux.Free;
end;

function TCtrlBancoPortFolha.GetCodPortForma(IdBanco: integer): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Close;
  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  NVL(CODPORTFORMA,0) AS CODPORTFORMA'+CR_LF+
    'FROM'+CR_LF+
    '  BANCOPORTFOLHA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDBANCO = ' +IntToStr(IdBanco)+ ')');

  Result := _CdsAux.FieldByName('CODPORTFORMA').asInteger;

  _CdsAux.Free;
end;

function TCtrlBancoPortFolha.GetBancoEmpresa(CodPortForma: integer): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Close;
  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  PC.IDBANCO'+CR_LF+
    'FROM'+CR_LF+
    '  PORTADORFORMA PF, PORTADORCONTA PC'+CR_LF+
    'WHERE'+CR_LF+
    '  (PF.CODPORTFORMA = ' +IntToStr(CodPortForma)+ ') AND'+CR_LF+
    '  (PF.CODPORTADOR  = PC.CODPORTADOR)');

  Result := _CdsAux.FieldByName('IDBANCO').asInteger;

  _CdsAux.Free;
end;

function TCtrlBancoPortFolha.GravarBancoPortFolha(ExcluirCodPortFormaPadrao: boolean): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarBancoPortFolha(FCdsBancoPortFolha.Data,
      FCodPortFormaPadrao, ExcluirCodPortFormaPadrao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    try
      StartTransaction;
      if (FCodPortFormaPadrao > 0) or (ExcluirCodPortFormaPadrao) then
      begin
        _CdsAux := TCMClientDataSet.Create(nil);

        // Inserir primeiro o Portador Forma Padrão
        _CdsAux.Close;
        _CdsAux.Data := GetDataPacket(
          'SELECT'+CR_LF+
          '  IDBANCOPORTFORMA, IDBANCO, CODPORTFORMA'+CR_LF+
          'FROM'+CR_LF+
          '  BANCOPORTFOLHA'+CR_LF+
          'WHERE'+CR_LF+
          '  (IDBANCO IS NULL)');

        if not(ExcluirCodPortFormaPadrao) then
        begin
          if (_CdsAux.IsEmpty) then
          begin
            _CdsAux.Insert;
            _CdsAux.FieldByName('IDBANCO').Clear;
          end
          else
            _CdsAux.Edit;

          _CdsAux.FieldByName('CODPORTFORMA').asInteger := FCodPortFormaPadrao;
          _CdsAux.Post;
        end
        else
          _CdsAux.Delete;

        Result := ApplyCds(_CdsAux, FDbBancoPortFolha, [], []);

        _CdsAux.Free;
      end;

      if (Result) then
      begin
        Result := ApplyCds(FCdsBancoPortFolha, FDbBancoPortFolha, [], []);
        if (Result) then
          Commit
        else
          raise Exception.Create(FDbBancoPortFolha.MessageInfo);
      end
      else
        raise Exception.Create(FDbBancoPortFolha.MessageInfo);
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
