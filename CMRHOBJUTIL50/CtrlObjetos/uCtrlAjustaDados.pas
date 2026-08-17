{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/08/2006                                 }
{                                                       }
{*******************************************************}

unit uCtrlAjustaDados;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate,
  uCMClientDataSet, uCtrlCustomRH, uCtrlCtFolha, uCtrlFerias;

type
  TOnProgAjuste = procedure(const Processo, Msg, Descricao: WideString;
    NumRegistros: Integer; ProxRegistro: WordBool) of object;

  TCtrlAjustaDados = class(TCtrlCustomRH)
  protected
    FCtrlCtFolha: TCtrlCtFolha;
    FCtrlFerias: TCtrlFerias;
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FOnProgAjuste: TOnProgAjuste;

    FFazAjustarCAPContab: boolean;
    FFazAjustarFeriasIntegrais: boolean;

    procedure IncProgresso(const Processo, Msg, Descricao: WideString;
      NumRegistros: Integer = 0; ProxRegistro: WordBool = false);
    function  ListParametrosContabCAP: OleVariant;

    function AjustarCAPContab: boolean;
    function AjustarFeriasIntegrais: boolean;
  public
    constructor Create(const FazAjustarCAPContab, FazAjustarFeriasIntegrais: boolean); reintroduce;
    destructor  Destroy; override;

    class function Existe_ContabCAP_MesmaLinha: boolean;
    class function Existe_Ferias_Sem_IndCompleta: boolean;

    function Ajustar: boolean;
    function GetNomePessoas: string;

    property OnProgresso: TOnProgAjuste read FOnProgAjuste write FOnProgAjuste;
  end;

implementation

uses Variants, uCMTypes, uCtrlPadroes, uCtrlFuncoesRH, DateUtils;

{ TCtrlAjustaDados }

const
  MSG_PARAMCONTAB =
    'Este processo irá ajustar as parametrizações de cada Rubrica para a:1'+
    'Contabilidade/CAP. Isto faz-se necessário para que a integração:2'+
    'funcione corretamente em versões posteriores à 4.31.00.:3'+
    'Um Arquivo de Backup das parametrizações:4'+
    '(Backup_Ajuste_ContabFolha.sql) foi gerado na pasta /LogRH que se:5'+
    'encontra dentro da pasta de arquivos temporários do usuário que está:6'+
    'logado no Windows.';
  MSG_FERIAS =
    'Este processo irá identificar as Férias integrais irá sinalizá-las como:1'+
    'tanto (opção "Férias Integrais" do Registro de Férias).:2'+
    'Isto está sendo feito para que os relatórios relacionados a Férias:3'+
    'possam devidamente identificar e tratar os casos de Férias Reduzidas:4'+
    'relativos a pessoas com horário de trabalho reduzido.';
  MSG_NUM_RUB =
    'Processando Rubrica Nº :1...';

constructor TCtrlAjustaDados.Create(const FazAjustarCAPContab,
  FazAjustarFeriasIntegrais: boolean);
begin
  inherited Create;
  FCtrlCtFolha := TCtrlCtFolha.Create;
  FCtrlFerias := TCtrlFerias.Create;

  FFazAjustarCAPContab := FazAjustarCAPContab;
  FFazAjustarFeriasIntegrais := FazAjustarFeriasIntegrais;
end;

destructor TCtrlAjustaDados.Destroy;
begin
  FreeAndNil(FCtrlCtFolha);
  FreeAndNil(FCtrlFerias);
  inherited;
end;

procedure TCtrlAjustaDados.OnCreateAppServer;
begin
  inherited;
  FCtrlCtFolha.InitializeAs(Self);
  FCtrlFerias.InitializeAs(Self);
end;

procedure TCtrlAjustaDados.DoChangeDataBase;
begin
  inherited;
  FCtrlCtFolha.DataBaseName := DataBaseName;
  FCtrlFerias.DataBaseName := DataBaseName;
end;

procedure TCtrlAjustaDados.IncProgresso(const Processo, Msg, Descricao: WideString;
  NumRegistros: Integer = 0; ProxRegistro: WordBool = false);
begin
  if Assigned(FOnProgAjuste) then
    FOnProgAjuste(Processo, Msg, Descricao, NumRegistros, ProxRegistro);
end;

function TCtrlAjustaDados.ListParametrosContabCAP: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  *' +CR_LF+
    'FROM' +CR_LF+
    '  CONTABFOLHA' +CR_LF+
    'ORDER BY' +CR_LF+
    '  IDPROVENTO, IDCONTABFOLHA');
end;

class function TCtrlAjustaDados.Existe_ContabCAP_MesmaLinha: boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := Padroes.GetDataPacket(
      'SELECT' +CR_LF+
      '  COUNT(*) AS NUM' +CR_LF+
      'FROM' +CR_LF+
      '  CONTABFOLHA' +CR_LF+
      'WHERE' +CR_LF+
      '  (CODTIPRECDES  IS NOT NULL) AND' +CR_LF+
      '  ((CONTACREDITO IS NOT NULL) OR' +CR_LF+
      '   (CONTADEBITO  IS NOT NULL))');

    Result := (_CdsAux.FieldByName('NUM').asInteger > 0);
  except
    Result := false;
  end;
  _CdsAux.Free;
end;

class function TCtrlAjustaDados.Existe_Ferias_Sem_IndCompleta: boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := Padroes.GetDataPacket(
      'SELECT' +CR_LF+
      '  COUNT(*) AS NUM' +CR_LF+
      'FROM' +CR_LF+
      '  FERIAS' +CR_LF+
      'WHERE' +CR_LF+
      '  (INDCOMPLETA IS NULL)');

    Result := (_CdsAux.FieldByName('NUM').asInteger > 0);
  except
    Result := false;
  end;
  _CdsAux.Free;
end;

function TCtrlAjustaDados.Ajustar: boolean;
begin
  Result := AjustarCAPContab;
  if (Result) then
    Result := AjustarFeriasIntegrais;
end;

function TCtrlAjustaDados.GetNomePessoas: string;
var
  _CdsAux: TCMClientDataSet;
  sListaNome: string;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  sListaNome := '';
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  F.MATRICULA, P.NOME' +CR_LF+
      'FROM' +CR_LF+
      '  FUNCIONARIO F, PESSOA P, SITFUNC SF,' +CR_LF+
      '  (SELECT IDPESSOA' +CR_LF+
      '   FROM   (SELECT IDPESSOA,' +CR_LF+
      '             MAX(INIGOZOFERIAS) AS INIGOZOFERIAS,' +CR_LF+
      '             MAX(FIMGOZOFERIAS) AS FIMGOZOFERIAS' +CR_LF+
      '           FROM' +CR_LF+
      '             FERIAS' +CR_LF+
      '           GROUP BY' +CR_LF+
      '             IDPESSOA) GRP' +CR_LF+
      '   WHERE' +CR_LF+
      '     (TO_NUMBER(FIMGOZOFERIAS - INIGOZOFERIAS)+1 < 30)' +CR_LF+
      '  ) FE' +CR_LF+
      'WHERE' +CR_LF+
      '  (SF.TIPOSIT  <> ''D'') AND' +CR_LF+
      '  (SF.IDSITFUNC = F.IDSITFUNC) AND' +CR_LF+
      '  (F.IDPESSOA   = FE.IDPESSOA) AND' +CR_LF+
      '  (F.IDPESSOA   = P.IDPESSOA)' +CR_LF+
      'ORDER BY' +CR_LF+
      '  NOME');
    while not(_CdsAux.EOF) do
    begin
      sListaNome := sListaNome +CR_LF+
        ' * Matr: ' + Trim(_CdsAux.FieldByName('MATRICULA').asString) +#9+
        ' - ' + Trim(_CdsAux.FieldByName('NOME').asString);
      _CdsAux.Next;
    end;
    Result := sListaNome;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlAjustaDados.AjustarCAPContab: boolean;
var
  bAchou, bPrimeiraVez: boolean;
  dIdEmpresa, dIdRubrica: double;
  _CdsProvDesc: TCMClientDataSet;
  _CdsContab: TCMClientDataSet;
  _CdsCAP: TCMClientDataSet;
  _CdsContabFolha: TCMClientDataSet;
  _CdsConta_X_CC: TCMClientDataSet;
begin
  if not(FFazAjustarCAPContab) then
  begin
    Result := true;
    exit;
  end;

  _CdsProvDesc := TCMClientDataSet.Create(nil);
  _CdsContab := TCMClientDataSet.Create(nil);
  _CdsCAP := TCMClientDataSet.Create(nil);
  _CdsContabFolha := TCMClientDataSet.Create(nil);
  _CdsConta_X_CC := TCMClientDataSet.Create(nil);
  try
    IncProgresso(CMTranslate('Parâmetros de Integração Contábil/CAP'),
      CMTranslate('Selecionando Parametrizações das Rubricas...'),
      CMTranslateMsg(MSG_PARAMCONTAB, [CR_LF, CR_LF, CR_LF+CR_LF, CR_LF, CR_LF, CR_LF]));

    _CdsProvDesc.Data := GetDataPacket('SELECT 0 AS IDPROVENDO FROM DUAL');    
    _CdsConta_X_CC.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO' +CR_LF+
      'FROM' +CR_LF+
      '  CONTASXCC');

    _CdsContab.Data := ListParametrosContabCAP;
    _CdsContabFolha.Data := _CdsContab.Data;
    // Trazer os dados em branco pois este Cds deverá conter somente as
    // inserções na ContabFolha
    _CdsCAP.Data := FCtrlCtFolha.ListParametroCAP(-1, -1);

    IncProgresso('', CMTranslate('Processando Ajustes...'), '', _CdsContabFolha.RecordCount);

    _CdsContabFolha.First;
    while not(_CdsContabFolha.EOF) do
    begin
      dIdRubrica := _CdsContabFolha.FieldByName('IDPROVENTO').asFloat;
      bPrimeiraVez := true;
      IncProgresso('', CMTranslateMsg(MSG_NUM_RUB, [FloatToStr(dIdRubrica)]), '');
      while not(_CdsContabFolha.EOF) and
               (_CdsContabFolha.FieldByName('IDPROVENTO').asFloat = dIdRubrica) do
      begin
        _CdsContab.Locate('IDCONTABFOLHA',
          _CdsContabFolha.FieldByName('IDCONTABFOLHA').asFloat, []);
        bAchou := (_CdsContab.FieldByName('CODTIPRECDES').asString <> '');

        // Inserir a parametrização com o CAP somente para a primeira linha de cada Rubrica
        if (bAchou) and (bPrimeiraVez) then
        begin
          bPrimeiraVez := false;
          _CdsCAP.Insert;
          _CdsCAP.FieldByName('IDPROVENTO').asFloat := _CdsContab.FieldByName('IDPROVENTO').asFloat;
          _CdsCAP.FieldByName('UNIDNEGOC').asFloat := _CdsContab.FieldByName('UNIDNEGOC').asFloat;
          _CdsCAP.FieldByName('CODCENTRORESPON').asString := _CdsContab.FieldByName('CODCENTRORESPON').asString;
          _CdsCAP.FieldByName('CODTIPRECDES').asString := _CdsContab.FieldByName('CODTIPRECDES').asString;
          _CdsCAP.FieldByName('IDFAVORECIDO').asFloat := _CdsContab.FieldByName('IDFAVORECIDO').asFloat;

          if (_CdsContab.FieldByName('IDEMPRESAPROP').asInteger = 0) then
            _CdsCAP.FieldByName('IDEMPRESAPROP').asFloat := _CdsContab.FieldByName('IDEMPRESA').asFloat
          else
            _CdsCAP.FieldByName('IDEMPRESAPROP').asFloat := _CdsContab.FieldByName('IDEMPRESAPROP').asFloat;

          _CdsCAP.FieldByName('IDEMPRESA').asFloat := _CdsCAP.FieldByName('IDEMPRESAPROP').asFloat;
          _CdsCAP.Post;
        end;

        // A linha de parametrização atual deve ser:
        // 1) Alterada, caso exista uma conta a crédito ou a débito. Isto é, caso a
        //    linha possua parametrizações CAP e Contábeis, deve-se manter a linha Contábil
        // 2) Excluída, NÃO caso exista uma conta a crédito ou a débito. Isto é, caso a
        //    linha possua somente parametrizações CAP, esta deve ser excluída pois
        //    outra será criada
        if (_CdsContab.FieldByName('CONTADEBITO').asString = '') and
           (_CdsContab.FieldByName('CONTACREDITO').asString = '') then
          _CdsContab.Delete
        else
        begin
          _CdsContab.Edit;

          // Apagar as parametrizações CAP
          _CdsContab.FieldByName('RECPAG').Clear;
          _CdsContab.FieldByName('IDEMPRESAPROP').Clear;
          _CdsContab.FieldByName('UNIDNEGOC').Clear;
          _CdsContab.FieldByName('CODCENTRORESPON').Clear;
          _CdsContab.FieldByName('CODTIPRECDES').Clear;
          _CdsContab.FieldByName('IDFAVORECIDO').Clear;

          // Corrigir os campos que fazem referência à Empresa Proprietária
          if (_CdsContab.FieldByName('IDEMPRESA').asFloat > 0) then
            dIdEmpresa := _CdsContab.FieldByName('IDEMPRESA').asFloat
          else
          if (_CdsContab.FieldByName('IDPESSDEBITO').asFloat > 0) then
            dIdEmpresa := _CdsContab.FieldByName('IDPESSDEBITO').asFloat
          else
          if (_CdsContab.FieldByName('IDPESSCREDITO').asFloat > 0) then
            dIdEmpresa := _CdsContab.FieldByName('IDPESSCREDITO').asFloat
          else
            dIdEmpresa := 0;

          if (dIdEmpresa = 0) then
          begin
            _CdsContab.FieldByName('IDEMPRESA').Clear;
            _CdsContab.FieldByName('IDPESSDEBITO').Clear;
            _CdsContab.FieldByName('CODSUBDEBITO').Clear;
            _CdsContab.FieldByName('IDPESSCREDITO').Clear;
            _CdsContab.FieldByName('CODSUBCREDITO').Clear;
          end
          else
          begin
            _CdsContab.FieldByName('IDEMPRESA').asFloat := dIdEmpresa;

            _CdsContab.FieldByName('IDPESSDEBITO').Clear;
            if (_CdsContab.FieldByName('CODSUBDEBITO').asString <> '') then
              if (_CdsConta_X_CC.Locate('PLANO;PLACONTA;IDEMPRESA;CODCENTROCUSTO',
                  VarArrayOf([_CdsContab.FieldByName('IDPLANO1').asInteger,
                              _CdsContab.FieldByName('CONTADEBITO').asString,
                              dIdEmpresa,
                              _CdsContab.FieldByName('CODCENTROCUSTO').asString]), [])) then
              begin
                _CdsContab.FieldByName('IDPESSDEBITO').asFloat := dIdEmpresa;
              end
              else
                _CdsContab.FieldByName('CODSUBDEBITO').Clear;

            _CdsContab.FieldByName('IDPESSCREDITO').Clear;
            if (_CdsContab.FieldByName('CODSUBCREDITO').asString <> '') then
              if (_CdsConta_X_CC.Locate('PLANO;PLACONTA;IDEMPRESA;CODCENTROCUSTO',
                  VarArrayOf([_CdsContab.FieldByName('IDPLANO2').asInteger,
                              _CdsContab.FieldByName('CONTACREDITO').asString,
                              dIdEmpresa,
                              _CdsContab.FieldByName('CODCENTROCUSTO').asString]), [])) then
              begin
                _CdsContab.FieldByName('IDPESSCREDITO').asFloat := dIdEmpresa;
              end
              else
                _CdsContab.FieldByName('CODSUBCREDITO').Clear;
          end;

          _CdsContab.Post;
        end;

        _CdsContabFolha.Next;
        IncProgresso('', '', '', 0, true);
      end;
    end;

    //_CdsContab.savetofile('c:\CdsContab.cds');
    //_CdsCAP.savetofile('c:\CdsCAP.cds');

    IncProgresso('', CMTranslate('Gravando ajustes...'), '');
    FCtrlCtFolha.CdsProvDesc := _CdsProvDesc;
    FCtrlCtFolha.CdsContab := _CdsContab;
    FCtrlCtFolha.CdsCAP := _CdsCAP;
    Result := FCtrlCtFolha.GravarContabFolha;
    if not(Result) then
      MessageInfo := FCtrlCtFolha.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;

  _CdsProvDesc.Free;
  _CdsContab.Free;
  _CdsCAP.Free;
  _CdsContabFolha.Free;
  _CdsConta_X_CC.Free;
end;

function TCtrlAjustaDados.AjustarFeriasIntegrais: boolean;
var
  _CdsFerias: TCMClientDataSet;
  _Cds: TCMClientDataSet;
  dtInicial, dtFinal: TDate;
  iDiasFerias: integer;

{->}procedure AlterarFerias(const Completa: boolean);
    begin
      _CdsFerias.Edit;
      if (Completa) then
        _CdsFerias.FieldByName('INDCOMPLETA').asInteger := 1
      else
        _CdsFerias.FieldByName('INDCOMPLETA').asInteger := 0;  
{->}end;

{->}function GetDiasFerias: integer;
    begin
      Result := FCtrlFerias.GetDiasFerias(
        _CdsFerias.FieldByName('FIMGOZOFERIAS').asDateTime,
        _CdsFerias.FieldByName('INIGOZOFERIAS').asDateTime,
        (_CdsFerias.FieldByName('FLGABONO').asInteger = 1),
        _CdsFerias.FieldByName('QTDIASABONO').asInteger);
{->}end;

{->}function MesmoPeriodoAquisitivo(const DataInicial, DataFinal: TDate): boolean;
    begin
      Result := (DataInicial = _CdsFerias.FieldByName('INIPERIODOFERIAS').asDateTime) and
                (DataFinal   = IncData(_CdsFerias.FieldByName('INIPERIODOFERIAS').asDateTime,-1,12,0));
{->}end;

begin
  if not(FFazAjustarFeriasIntegrais) then
  begin
    Result := true;
    exit;
  end;

  _CdsFerias := TCMClientDataSet.Create(nil);
  _Cds := TCMClientDataSet.Create(nil);
  try
    // -1 para reiniciar a posição da barra de progresso
    IncProgresso(CMTranslate('Ajustando Férias Integrais'),
      CMTranslate('Selecionando Férias...'),
      CMTranslateMsg(MSG_FERIAS, [CR_LF, CR_LF+CR_LF, CR_LF, CR_LF]), -1);

    _CdsFerias.Data := FCtrlFerias.ListFeriasSemIndCompleta;
    _CdsFerias.Filtered := true;
    IncProgresso('', CMTranslate('Processando Ajustes...'), '', _CdsFerias.RecordCount);

    _Cds.Data := _CdsFerias.Data;
    _Cds.First;
    while not(_Cds.EOF) do
    begin
      _CdsFerias.Filter := 'IDPESSOA = ' + _Cds.FieldByName('IDPESSOA').asString;
      _CdsFerias.First;
      while not(_CdsFerias.EOF) do
      begin
        // Caso uma das duas datas esteja em branco, informar que as férias não estão completas
        if (_CdsFerias.FieldByName('INIGOZOFERIAS').asDateTime = 0) or
           (_CdsFerias.FieldByName('FIMGOZOFERIAS').asDateTime = 0) then
          AlterarFerias(false)
        else
        // Alterar o registro de férias atual caso tenham 30 dias
        if (GetDiasFerias >= 30) then
          AlterarFerias(true)
        else
        // Alterar o registro de férias caso o período não tenha sido dividido em duas partes
        begin
          dtInicial := _CdsFerias.FieldByName('INIPERIODOFERIAS').asDateTime;
          dtFinal := IncData(_CdsFerias.FieldByName('INIPERIODOFERIAS').asDateTime,-1,0,1);
          iDiasFerias := GetDiasFerias;

          if (_CdsFerias.RecNo < _CdsFerias.RecordCount) then
          begin
            AlterarFerias(false);
            _CdsFerias.Next;

            if not(MesmoPeriodoAquisitivo(dtInicial, dtFinal)) then
            begin
              if (iDiasFerias < 30) then
                _CdsFerias.Prior;
            end;
          end;

          AlterarFerias(true);
        end;
        _CdsFerias.Next;
      end;

      repeat
        _Cds.Next;
        IncProgresso('', '', '', 0, true);
      until (_Cds.EOF) or
            (_Cds.FieldByName('IDPESSOA').asFloat <> _CdsFerias.FieldByName('IDPESSOA').asFloat);
    end;

    IncProgresso('', CMTranslate('Gravando ajustes...'), '');
    FCtrlFerias.CdsFerias := _CdsFerias;
    Result := FCtrlFerias.Gravar;
    if not(Result) then
      MessageInfo := FCtrlFerias.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;

  _CdsFerias.Free;
  _Cds.Free;
end;

end.
