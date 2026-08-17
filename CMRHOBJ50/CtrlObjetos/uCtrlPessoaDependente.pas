{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------

Nº SIG...........: 127819
Data da Alteração: 06/10/2022
Responsável......: Everson Cunha
Descrição........: Apresentar coluna com a situação do dependente
--------------------------------------------------------------------------------
Nº SIG...........: 20673
Data da Alteração: 08/06/2016
Responsável......: Michelle Mota
Descrição........: ER180 e ER141 - Inclusão da flag "Ativo" - exclusão lógica.
--------------------------------------------------------------------------------
Nº SOL: 229874/16589
Nº PPM: 1235881
Data da Alteração: 19/02/2016
Alteração Form: ER141 - Alteração na aba de dados pessoais e dados titular
Responsável: Michelle Suellyn Mota
Descrição: Inclusão de novos campos, alteração de leiaute e consultas.
--------------------------------------------------------------------------------
Nº SOL......: 267694
Nº PPM......: 1237783
Data........: 19/01/2016
Responsavel.: William Santana
Descrição...: Correção erro no cadastro de dependentes
--------------------------------------------------------------------------------
Nº SOL......: 211661/15807
Nº KINTANA..: 2060908
Data........: 22/09/2014
Responsavel.: William Santana
Descrição...: Padronização da nomenclatura quanto as opções de classificação de
              estado civíl.
--------------------------------------------------------------------------------
Nº SOL......: 240776
Nº KINTANA..: 544593
Data........: 15/10/2015
Responsavel.: Fernando Xavier
Descrição...: corrigir erro de desmarcação do flg deplegal e designado quando há
              alteração do dependente para fins de IRRF.
--------------------------------------------------------------------------------
Nº SOL......: 205371
Nº KINTANA..: 2013313
Data........: 31/05/2013
Responsavel.: Fernando Xavier
Descrição...: Matricula não estava sendo passada para o update na Depentit
--------------------------------------------------------------------------------
Nº SOL......: 202482
Nº KINTANA..: 1956182
Data........: 08/03/2012
Responsavel.: André Oliveira
Descrição...: Não Considerar o Titular na contagem das flags.
--------------------------------------------------------------------------------
Nº SOL......: 188203
Nº KINTANA..: 1786979
Data........: 17/12/2012
Responsavel.: André Oliveira
Descrição...: Inclusão no cadastro de dependentes a informação de participação
              no Plano Medicamento e no cadastro de pessoal um campo indicando a
              quantidade de dependentes no Plano Medicamento.
              A quantidade de dependentes cadastrados no Plano Medicamento será
              a soma dos dependentes de determinado funcionário que estejam com
              a flag marcada em seus cadastros.
--------------------------------------------------------------------------------
Nº SOL......: 184808
Nº KINTANA..: 1731587
Data........: 13/08/2012
Responsavel.: William Moreira
Descrição...: Inclusão das opções de data de inclusão e exclusão dos dependentes
              no plano de saúde e odontológico em Cadastro/Dependentes/Dados
              Pessoais.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaDependente;

interface

uses SysUtils, uSistema, uCMClientDataSet, CmEventosCadastro, uCMTypes, uCtrlPessoa,
  uCtrlCustomRH, uCtrlFuncoesRH, uDbDependente, uDbDepenTit, uDbLogcontrdepensaudodont;

type
  TCtrlPessoaDependente = class(TCtrlCustomPessoaRH)
  protected
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
  private
    FDb: TDbDependente;
    FDbDepenTit: TDbDepenTit;
    FDbLogcontrdepensaudodont : TDbLogcontrdepensaudodont; //William Moreira da Silva - SOL 184808 KINTANA - 1731587


    FFU: TCtrlFuncoesRH;

    FCdsDepenTit: TCMClientDataSet;

    //William Moreira da Silva - SOL 184808 KINTANA - 1731587
    FCdsLogcontrdepenIncsaud : TCMClientDataSet;
    FCdsLogcontrdepenExcsaud : TCMClientDataSet;

    FCdsLogcontrdepenIncodont : TCMClientDataSet;
    FCdsLogcontrdepenExcodont : TCMClientDataSet;
    //function SelLogContrDepenOdont(IdPessoa: Double): OleVariant;
    //function SelLogContrDepenSaud(IdPessoa: Double): OleVariant;
    //William Moreira da Silva - SOL 184808 KINTANA - 1731587

    // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    FCdsLogcontrdepenIncAlimen : TCMClientDataSet;
    FCdsLogcontrdepenExcAlimen : TCMClientDataSet;
    FCdsLogcontrdepenPercAlimen : TCMClientDataSet;
    // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

  public
    constructor Create;  override;
    destructor  Destroy; override;

    function SelDependente(IdPessoa: double): OleVariant;
    function SelDependentesPessoa(IdPessoa: double; ListaTipo: string = ''): OleVariant;
    function SelDepenTit(IdPessoa: double): OleVariant;
    function SelTitular(IdTitular: double): OleVariant;
    function SelQtePlanos(IdPessoa: double) : OleVariant;

    //William Moreira da Silva - SOL 184808 KINTANA - 1731587
    function SelLogContrDepenIncSaud(IdPessoa: double) : OleVariant;
    function SelLogContrDepenExcSaud(IdPessoa: double) : OleVariant;

    function SelLogContrDepenIncOdont(IdPessoa: double) : OleVariant;
    function SelLogContrDepenExcOdont(IdPessoa: double) : OleVariant;
    //William Moreira da Silva - SOL 184808 KINTANA - 1731587

    // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    function SelLogContrDepenIncAlimen(IdPessoa: double) : OleVariant;
    function SelLogContrDepenExcAlimen(IdPessoa: double) : OleVariant;
    function SelLogContrDepenPercAlimen(IdPessoa: double) : OleVariant;
    // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

    function GetProxNumSeq(IdTitular: double): integer;
    function GetListaIdTitularInconsistente(ListaIdPessoa: string): string;

    function ListEstCivil: OleVariant;                  //William Santana - SOL 211661/15807 - KIN 2060908
    function MostraEstCivil(EstCivil: string): string;  //William Santana - SOL 211661/15807 - KIN 2060908

    property CdsDepenTit: TCMClientDataSet read FCdsDepenTit write FCdsDepenTit;
    //William Moreira da Silva - SOL 184808 KINTANA - 1731587
    property CdsLogcontrdepenIncsaud: TCMClientDataSet read FCdsLogcontrdepenIncsaud write FCdsLogcontrdepenIncsaud;
    property CdsLogcontrdepenExcsaud: TCMClientDataSet read FCdsLogcontrdepenExcsaud write FCdsLogcontrdepenExcsaud;

    property CdsLogcontrdepenIncodont: TCMClientDataSet read FCdsLogcontrdepenIncodont write FCdsLogcontrdepenIncodont;
    property CdsLogcontrdepenExcodont: TCMClientDataSet read FCdsLogcontrdepenExcodont write FCdsLogcontrdepenExcodont;
    //William Moreira da Silva - SOL 184808 KINTANA - 1731587

    // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    property CdsLogContrDepenIncAlimen: TCMClientDataSet read FCdsLogcontrdepenIncAlimen write FCdsLogcontrdepenIncAlimen;
    property CdsLogContrDepenExcAlimen: TCMClientDataSet read FCdsLogcontrdepenExcAlimen write FCdsLogcontrdepenExcAlimen;
    property CdsLogContrDepenPercAlimen: TCMClientDataSet read FCdsLogcontrdepenPercAlimen write FCdsLogcontrdepenPercAlimen;
    // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  end;

implementation

uses uMidasUtil;

{ TCtrlPessoaDependente }

constructor TCtrlPessoaDependente.Create;
begin
  inherited;
  FDb := TDbDependente.Create(Self);
  FDbDepenTit := TDbDepenTit.Create(Self);
  FDbLogcontrdepensaudodont := TDbLogcontrdepensaudodont.Create(Self);
  FFU := TCtrlFuncoesRH.Create;
end;

procedure TCtrlPessoaDependente.OnCreateAppServer;
begin
  inherited;
  FCdsDepenTit := TCMClientDataSet.Create(nil);

  //William Moreira da Silva - SOL 184808 KINTANA - 1731587
  FCdsLogcontrdepenIncsaud := TCMClientDataSet.Create(nil);
  FCdsLogcontrdepenExcsaud := TCMClientDataSet.Create(nil);

  FCdsLogcontrdepenIncodont := TCMClientDataSet.Create(nil);
  FCdsLogcontrdepenExcodont := TCMClientDataSet.Create(nil);
  //William Moreira da Silva - SOL 184808 KINTANA - 1731587

  // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  FCdsLogcontrdepenIncAlimen := TCMClientDataSet.Create(nil);
  FCdsLogcontrdepenExcAlimen := TCMClientDataSet.Create(nil);
  FCdsLogcontrdepenPercAlimen := TCMClientDataSet.Create(nil);
  // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
end;

destructor TCtrlPessoaDependente.Destroy;
begin
  FDbLogcontrdepensaudodont.Free;
  FDbDepenTit.Free;
  FDb.Free;
  FFU.Free;
  if (IsAppServer) then
    FCdsDepenTit.Free;
    //William Moreira da Silva - SOL 184808 KINTANA - 1731587
    FCdsLogcontrdepenIncsaud.Free;
    FCdsLogcontrdepenExcsaud.Free;

    FCdsLogcontrdepenIncodont.Free;
    FCdsLogcontrdepenExcodont.Free;
    //William Moreira da Silva - SOL 184808 KINTANA - 1731587

  // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  FreeAndNil(FCdsLogcontrdepenIncAlimen);
  FreeAndNil(FCdsLogcontrdepenExcAlimen);
  FreeAndNil(FCdsLogcontrdepenPercAlimen);
  // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  inherited;
end;

procedure TCtrlPessoaDependente.AfterInitialize;
begin
  inherited;
  FFU.InitializeAs(Self);
end;

procedure TCtrlPessoaDependente.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDepenTit.DataBaseName               := DataBaseName;
  FDbLogcontrdepensaudodont.DataBaseName := DataBasename;
  FFU.DataBase := DataBase;
end;

function TCtrlPessoaDependente.SelDependente(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DP.IDPESSOA, DP.IDSITDEPENDENTE, DP.FLGDESIGNADO,'+CR_LF+
    '  SD.DESCRICAO AS SITUACAODEPENDENTE'+CR_LF+
    'FROM'+CR_LF+
    '  DEPENDENTE DP, SITDEPENDENTE SD'+CR_LF+
    'WHERE'+CR_LF+
    '  (DP.IDPESSOA        = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (DP.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+))');
end;

function TCtrlPessoaDependente.SelDependentesPessoa(IdPessoa: double; ListaTipo: string): OleVariant;
var
  sSQL: string;
begin
  if (ListaTipo = '') then
    sSQL := '  (DPT.IDDEPENDENCIA <> ''PRP'') AND'
  else
  begin
    if (Pos(',',ListaTipo) > 0) then
      sSQL := '  (DPT.IDDEPENDENCIA IN (' +FFU.QuotedListaString(ListaTipo, ',', true)+ ')) AND'
    else
      sSQL := '  (DPT.IDDEPENDENCIA  = ' +QuotedStr(ListaTipo)+ ') AND';
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, DP.DESCRICAO, PF.DATANASC, '+CR_LF+ // Michelle Mota - SIG 20673
    ' case DPT.FLGCONTAIMPOSTOR when 1 then ''Sim'' when 0 then ''Não'' end FLGCONTAIMPOSTOR,'+CR_LF+ // Michelle Mota - SIG 20673
    ' case DPT.FLGCONTASALARIOF when 1 then ''Sim'' when 0 then ''Não'' end FLGCONTASALARIOF,'+CR_LF+ // Michelle Mota - SIG 20673
    //'  DPT.DATACADASTRO, DPT.FIMIMPOSTOR'+CR_LF+  // Michelle Mota - SIG 20673
    '  DPT.DATACADASTRO , DPT.FIMIMPOSTOR  , CASE DPT.FLGATIVO WHEN ''S'' THEN ''Sim'' WHEN ''N'' THEN ''Não'' END Ativo '+CR_LF+ // Michelle Mota - SIG 20673
    ' ,SIT.DESCRICAO SITDEPENDENTE '+CR_LF+ //Everson Cunha - SIG127819
    'FROM'+CR_LF+
    '  PESSOA P, DEPEN DP, DEPENTIT DPT, PESSOAFISICA PF'+CR_LF+
    ' ,CM.DEPENDENTE DEP, CM.SITDEPENDENTE SIT '+CR_LF+ //Everson Cunha - SIG127819
    'WHERE'+CR_LF+
    '  (DPT.IDTITULAR      = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    sSQL+CR_LF+
    '  (DPT.IDPESSOA       = PF.IDPESSOA) AND'+CR_LF+
    '  (DPT.IDDEPENDENCIA  = DP.IDDEPENDENCIA) AND'+CR_LF+
    '  (DPT.IDPESSOA       = P.IDPESSOA) AND '+CR_LF+
    '  (DEP.IDPESSOA       = DPT.IDPESSOA) AND '+CR_LF+        //Everson Cunha - SIG127819
    '  (DEP.IDSITDEPENDENTE= SIT.IDSITDEPENDENTE) '+CR_LF+ //Everson Cunha - SIG127819
    'ORDER BY'+CR_LF+
    '  NUMSEQUENCIA');
end;

function TCtrlPessoaDependente.SelDepenTit(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DP.IDTITULAR, DP.IDPESSOA, DP.IDDEPENDENCIA,'+CR_LF+
    '  DP.NUMSEQUENCIA, DP.FLGCONTAIMPOSTOR, DP.FLGCONTASALARIOF,'+CR_LF+
    '  DP.FLGBENEFICIARIO, P.NOME AS TITULAR,'+CR_LF+
    '  DP.DATACADASTRO, DP.FIMIMPOSTOR,'+CR_LF+
    '  D.DESCRICAO AS TIPODEPENDENCIA,'+CR_LF+
    '  substr(DL.DESCRICAO,0,223) AS TIPODEPENDENTELEGAL,'+CR_LF+ //Michelle Mota - SOL: 229874.16589 PPM: 1235881
    '  DP.FLGPENSAOALIMENT, DP.PERCALIMENTIC, '+CR_LF+//Michelle Mota - SOL: 229874.16589 PPM: 1235881
    '  DP.FLGPLSAUDE,'+CR_LF+
    '  DP.FLGPLODONTO,'+CR_LF+ //André Oliveira SOL188203 KINTANA 1786979
    '  DP.FLGPLMEDIC, '+CR_LF+ // SOL 205371 KINTANA 2013313
    '  DP.MATRICULA '+CR_LF+  // SOL 205371 KINTANA 2013313
    '  , DP.FLGDESIGNADO, DP.FLGDEPLEGAL, DL.IDDEPENDENTELEGALESOCIAL '+CR_LF+    // SOL 240776 KINTANA 544593
    '  , DP.FLGATIVO ' +CR_LF+ // Michelle Mota - SIG 20673
    'FROM'+CR_LF+
    '  PESSOA P, DEPENTIT DP, DEPEN D, DEPENDENTELEGALESOCIAL DL'+CR_LF+ //Michelle Mota - SOL: 229874.16589 PPM: 1235881
    'WHERE'+CR_LF+
    '  (DP.IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (DP.IDTITULAR     = P.IDPESSOA) AND'+CR_LF+
    '  (DP.IDDEPENDENCIA = D.IDDEPENDENCIA) AND' +CR_LF+
    '  (DL.IDDEPENDENTELEGALESOCIAL(+) = DP.IDDEPENDENTELEGALESOCIAL)'); //Michelle Mota - SOL: 229874.16589 PPM: 1235881
end;

function TCtrlPessoaDependente.SelTitular(IdTitular: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA, P.NOME, P.NUMDOCUMENTO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, DEPENTIT DP'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA = ' +FloatToStr(IdTitular)+ ') AND'+CR_LF+
    '  (P.IDPESSOA = DP.IDTITULAR)');
end;

function TCtrlPessoaDependente.GetProxNumSeq(IdTitular: double): integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  MAX(NUMSEQUENCIA) AS MAX_NUM'+CR_LF+
    'FROM'+CR_LF+
    '  DEPENTIT'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDTITULAR = ' +FloatToStr(IdTitular)+ ')');

  Result := _Cds.FieldByName('MAX_NUM').asInteger + 1;

  _Cds.Free;
end;

function TCtrlPessoaDependente.GetListaIdTitularInconsistente(ListaIdPessoa: string): string;
var
  K: integer;
  sListaIdTitular, sSQL: string;
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  sSQL :=
    'SELECT'+CR_LF+
    '  F.IDPESSOA,'+CR_LF+
    '  NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, DEPENDENTE.NUM_IRRF,'+CR_LF+
    '  NVL(PF.NUMDEPSALF,0) AS NUMDEPSALF, DEPENDENTE.NUM_SAL_FAM'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA PF, FUNCIONARIO F,'+CR_LF+
    '  (SELECT'+CR_LF+
    '     DP.IDTITULAR, SUM(DP.FLGCONTAIMPOSTOR) NUM_IRRF,'+CR_LF+
    '     SUM(DP.FLGCONTASALARIOF) NUM_SAL_FAM'+CR_LF+
    '   FROM'+CR_LF+
    '     DEPENTIT DP, DEPEN D'+CR_LF+
    '   WHERE'+CR_LF;

  if (Pos(',',ListaIdPessoa) > 0) then
    sSQL := sSQL + '      (DP.IDTITULAR    IN (' +ListaIdPessoa+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '      (DP.IDTITULAR     = ' +ListaIdPessoa+ ') AND'+CR_LF;

  sSQL := sSQL +
    '     (DP.IDDEPENDENCIA <> ''PRP'') AND'+CR_LF+
    '     (DP.IDDEPENDENCIA  = D.IDDEPENDENCIA)'+CR_LF+
    '   GROUP BY'+CR_LF+
    '     DP.IDTITULAR) DEPENDENTE'+CR_LF+
    'WHERE'+CR_LF;

  if (Pos(',',ListaIdPessoa) > 0) then
    sSQL := sSQL + '  (F.IDPESSOA IN (' +ListaIdPessoa+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '  (F.IDPESSOA  = ' +ListaIdPessoa+ ') AND'+CR_LF;

  sSQL := sSQL +
    '  (F.IDPESSOA  = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA  = DEPENDENTE.IDTITULAR)';

  _Cds.Data := GetDataPacket(sSQL);

  sListaIdTitular := '';
  K := 1;
  while not(_Cds.EOF) do
  begin
    if (_Cds.FieldByName('NUMDEPIRRF').asInteger <> _Cds.FieldByName('NUM_IRRF').asInteger) or
       (_Cds.FieldByName('NUMDEPSALF').asInteger <> _Cds.FieldByName('NUM_SAL_FAM').asInteger) then
      if (K = 1) then
      begin
        sListaIdTitular := sListaIdTitular + _Cds.FieldByName('IDPESSOA').asString;
        Inc(K);
      end
      else
        sListaIdTitular := sListaIdTitular +','+ _Cds.FieldByName('IDPESSOA').asString;

    _Cds.Next;
  end;

  _Cds.Free;

  Result := sListaIdTitular;
end;

function TCtrlPessoaDependente.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  try
    if (Operacao = opApagar) then
    begin
      EmptyCds([CdsSubTipo, FCdsDepenTit]);

      Result := ApplyCds(FCdsDepenTit, FDbDepenTit, [], []);
      if not(Result) then
        raise Exception.Create(FDbDepenTit.MessageInfo);

      Result := ApplyCds(CdsSubTipo, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);
    end
    else
    begin
      Result := ApplyCds(CdsSubTipo, FDb, [_DbPessoa.IdPessoa], [FDb.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

      Result := ApplyCds(FCdsDepenTit, FDbDepenTit, [_DbPessoa.IdPessoa], [FDbDepenTit.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbDepenTit.MessageInfo);

      //William Moreira da Silva - SOL 184808 KINTANA - 1731587
      // Result := ApplyCds(FCdsLogcontrdepenIncsaud, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbDepenTit.IdPessoa]);    // William Santana - SOL 267694 PPM 1237783
      Result := ApplyCds(FCdsLogcontrdepenIncsaud, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbLogcontrdepensaudodont.IdPessoa]); // William Santana - SOL 267694 PPM 1237783
      if not(Result) then
        raise Exception.Create(FDbLogcontrdepensaudodont.MessageInfo);

      //  Result := ApplyCds(FCdsLogcontrdepenExcsaud, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbDepenTit.IdPessoa]);  // William Santana - SOL 267694 PPM 1237783
      Result := ApplyCds(FCdsLogcontrdepenExcsaud, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbLogcontrdepensaudodont.IdPessoa]); // William Santana - SOL 267694 PPM 1237783
      if not(Result) then
        raise Exception.Create(FDbLogcontrdepensaudodont.MessageInfo);

      //Result := ApplyCds(FCdsLogcontrdepenIncodont, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbDepenTit.IdPessoa]); // William Santana - SOL 267694 PPM 1237783
      Result := ApplyCds(FCdsLogcontrdepenIncodont, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbLogcontrdepensaudodont.IdPessoa]); // William Santana - SOL 267694 PPM 1237783
      if not(Result) then
        raise Exception.Create(FDbLogcontrdepensaudodont.MessageInfo);

      //Result := ApplyCds(FCdsLogcontrdepenExcodont, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbDepenTit.IdPessoa]);  // William Santana - SOL 267694 PPM 1237783
      Result := ApplyCds(FCdsLogcontrdepenExcodont, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbLogcontrdepensaudodont.IdPessoa]); // William Santana - SOL 267694 PPM 1237783
      if not(Result) then
        raise Exception.Create(FDbLogcontrdepensaudodont.MessageInfo);

      //William Moreira da Silva - SOL 184808 KINTANA - 1731587

      // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
      Result := ApplyCds(CdsLogContrDepenIncAlimen, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbLogcontrdepensaudodont.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbLogcontrdepensaudodont.MessageInfo);

      Result := ApplyCds(CdsLogContrDepenExcAlimen, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbLogcontrdepensaudodont.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbLogcontrdepensaudodont.MessageInfo);

      Result := ApplyCds(CdsLogContrDepenPercAlimen, FDbLogcontrdepensaudodont, [_DbPessoa.IdPessoa], [FDbLogcontrdepensaudodont.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbLogcontrdepensaudodont.MessageInfo);

      // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
      end;
  except
    on E:Exception do
    begin
      Result := false;
      Mensagem := E.Message;
    end;
  end;
end;

function TCtrlPessoaDependente.SelQtePlanos(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket('SELECT DP.IDTITULAR,' + #13#10 +
                          '       SUM(DP.FLGPLSAUDE)  as QtePlanoSaude,' + #13#10 +
                          //Inicio - SOL 182203  KINTANA 1786979
                          '       SUM(DP.FLGPLODONTO) as QtePlanoOdonto,' + #13#10 +
                           '      SUM(DP.FLGPLMEDIC) as QtePlanoMedic' + #13#10 +
                          //Fim - SOL 182203  KINTANA 1786979
                          'FROM PESSOA P, DEPENTIT DP, DEPEN D' + #13#10 +
                          'WHERE (DP.IDTITULAR     = ' +FloatToStr(IdPessoa)+ ')' + #13#10 +
                          '  AND (DP.IDTITULAR     = P.IDPESSOA)' + #13#10 +
                          '  AND (DP.IDTITULAR     <> DP.IDPESSOA)' + #13#10 +           //SOL 202482 KINTANA 1956182
                          '  AND (DP.IDDEPENDENCIA = D.IDDEPENDENCIA)' + #13#10 +
                          'GROUP BY DP.IDTITULAR');
end;

//William Moreira da Silva - SOL 184808 KINTANA - 1731587
//Begin
function TCtrlPessoaDependente.SelLogContrDepenIncSaud(IdPessoa: double): OleVariant;
begin
     Result := GetDataPacket(' SELECT *  ' + #13#10 +
                             ' FROM logContrDepenSaudOdont ' + #13#10 +
                             ' WHERE TIPO = ''SAUDE''' + #13#10 +
                             ' AND IDPESSOA = '+FloatToStr(IdPessoa)+' ' + #13#10 +
                             ' AND CAMPO = ''INCLUSAO'' ' + #13#10 +
                             ' AND TRGDTINCLUSAO in (SELECT MAX(TRGDTINCLUSAO) ' + #13#10 +
                             '                              FROM logContrDepenSaudOdont ' + #13#10 +
                             '                              WHERE TIPO = ''SAUDE''' + #13#10 +
                             '                              AND CAMPO = ''INCLUSAO''' + #13#10 +
                             '                              AND IDPESSOA = '+FloatToStr(IdPessoa)+')');
end;

function TCtrlPessoaDependente.SelLogContrDepenExcSaud(IdPessoa: double): OleVariant;
begin
     Result := GetDataPacket(' SELECT *  ' + #13#10 +
                             ' FROM logContrDepenSaudOdont ' + #13#10 +
                             ' WHERE TIPO = ''SAUDE''' + #13#10 +
                             ' AND IDPESSOA = '+FloatToStr(IdPessoa)+' ' + #13#10 +
                             ' AND CAMPO = ''EXCLUSAO'' ' + #13#10 +
                             ' AND TRGDTINCLUSAO in (SELECT MAX(TRGDTINCLUSAO) ' + #13#10 +
                             '                              FROM logContrDepenSaudOdont ' + #13#10 +
                             '                              WHERE TIPO = ''SAUDE''' + #13#10 +
                             '                              AND CAMPO = ''EXCLUSAO''' + #13#10 +
                             '                              AND IDPESSOA =  '+FloatToStr(IdPessoa)+')');
end;

function TCtrlPessoaDependente.SelLogContrDepenIncOdont(IdPessoa: double): OleVariant;
begin
     Result := GetDataPacket(' SELECT *  ' + #13#10 +
                             ' FROM logContrDepenSaudOdont ' + #13#10 +
                             ' WHERE TIPO = ''ODONT''' + #13#10 +
                             ' AND IDPESSOA = '+FloatToStr(IdPessoa)+' ' + #13#10 +
                             ' AND CAMPO = ''INCLUSAO'' ' + #13#10 +
                             ' AND TRGDTINCLUSAO in (SELECT MAX(TRGDTINCLUSAO) ' + #13#10 +
                             '                              FROM logContrDepenSaudOdont ' + #13#10 +
                             '                              WHERE TIPO = ''ODONT''' + #13#10 +
                             '                              AND CAMPO = ''INCLUSAO''' + #13#10 +
                             '                              AND IDPESSOA =  '+FloatToStr(IdPessoa)+')');
end;

function TCtrlPessoaDependente.SelLogContrDepenExcOdont(IdPessoa: double): OleVariant;
begin
     Result := GetDataPacket(' SELECT *  ' + #13#10 +
                             ' FROM logContrDepenSaudOdont ' + #13#10 +
                             ' WHERE TIPO = ''ODONT''' + #13#10 +
                             ' AND IDPESSOA = '+FloatToStr(IdPessoa)+' ' + #13#10 +
                             ' AND CAMPO = ''EXCLUSAO'' ' + #13#10 +
                             ' AND TRGDTINCLUSAO in (SELECT MAX(TRGDTINCLUSAO) ' + #13#10 +
                             '                              FROM logContrDepenSaudOdont ' + #13#10 +
                             '                              WHERE TIPO = ''ODONT''' + #13#10 +
                             '                              AND CAMPO = ''EXCLUSAO''' + #13#10 +
                             '                              AND IDPESSOA =  '+FloatToStr(IdPessoa)+')');
end;
//William Moreira da Silva - SOL 184808 KINTANA - 1731587
//End

// Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
function TCtrlPessoaDependente.SelLogContrDepenIncAlimen(IdPessoa: double): OleVariant;
begin
     Result := GetDataPacket(' SELECT *  ' + #13#10 +
                             ' FROM logContrDepenSaudOdont ' + #13#10 +
                             ' WHERE TIPO = ''ALIME''' + #13#10 +
                             ' AND IDPESSOA = '+FloatToStr(IdPessoa)+' ' + #13#10 +
                             ' AND CAMPO = ''INCLUSAO'' ' + #13#10 +
                             ' AND TRGDTINCLUSAO in (SELECT MAX(TRGDTINCLUSAO) ' + #13#10 +
                             '                              FROM logContrDepenSaudOdont ' + #13#10 +
                             '                              WHERE TIPO = ''ALIME''' + #13#10 +
                             '                              AND CAMPO = ''INCLUSAO''' + #13#10 +
                             '                              AND IDPESSOA =  '+FloatToStr(IdPessoa)+')');
end;

function TCtrlPessoaDependente.SelLogContrDepenExcAlimen(IdPessoa: double): OleVariant;
begin
     Result := GetDataPacket(' SELECT *  ' + #13#10 +
                             ' FROM logContrDepenSaudOdont ' + #13#10 +
                             ' WHERE TIPO = ''ALIME''' + #13#10 +
                             ' AND IDPESSOA = '+FloatToStr(IdPessoa)+' ' + #13#10 +
                             ' AND CAMPO = ''EXCLUSAO'' ' + #13#10 +
                             ' AND TRGDTINCLUSAO in (SELECT MAX(TRGDTINCLUSAO) ' + #13#10 +
                             '                              FROM logContrDepenSaudOdont ' + #13#10 +
                             '                              WHERE TIPO = ''ALIME''' + #13#10 +
                             '                              AND CAMPO = ''EXCLUSAO''' + #13#10 +
                             '                              AND IDPESSOA =  '+FloatToStr(IdPessoa)+')');
end;

function TCtrlPessoaDependente.SelLogContrDepenPercAlimen(IdPessoa: double): OleVariant;
begin
     Result := GetDataPacket(' SELECT *  ' + #13#10 +
                             ' FROM logContrDepenSaudOdont ' + #13#10 +
                             ' WHERE TIPO = ''ALIME''' + #13#10 +
                             ' AND IDPESSOA = '+FloatToStr(IdPessoa)+' ' + #13#10 +
                             ' AND CAMPO = ''PERCENT'' ' + #13#10 +
                             ' AND TRGDTINCLUSAO in (SELECT MAX(TRGDTINCLUSAO) ' + #13#10 +
                             '                              FROM logContrDepenSaudOdont ' + #13#10 +
                             '                              WHERE TIPO = ''ALIME''' + #13#10 +
                             '                              AND CAMPO = ''PERCENT''' + #13#10 +
                             '                              AND IDPESSOA =  '+FloatToStr(IdPessoa)+')');
end;
// Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

//Início - William Santana - SOL 211661/15807 - KIN 2060908
function TCtrlPessoaDependente.ListEstCivil: OleVariant;
begin
  Result := GetDataPacket(
        'SELECT'+CR_LF+
        ' T.ESTCIVIL, T.DESCRICAO'+CR_LF+
        ' FROM ESTADOCIVIL T WHERE FLGATIVO = 1 ');
end;

function TCtrlPessoaDependente.MostraEstCivil(EstCivil: string): String;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCmClientDataSet.Create(nil);

  _CdsAux.data := GetDataPacket(
        'SELECT'+CR_LF+
        ' T.ESTCIVIL, T.DESCRICAO'+CR_LF+
        ' FROM ESTADOCIVIL T WHERE ESTCIVIL = '+QuotedStr(EstCivil));

  result := _CdsAux.FieldByName('DESCRICAO').AsString;

  FreeAndNil(_CdsAux);        
end;   
//Término - William Santana - SOL 211661/15807 - KIN 2060908

end.
