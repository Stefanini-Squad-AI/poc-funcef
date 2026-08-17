{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/08/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlParamFichaReg;

interface

uses SysUtils, Classes, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH;

type
  TCtrlParamFichaReg = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FSQL: TStringList;

    function ListFichaReg(ListaIdEstab, ListaIdFunc: string): OleVariant;
    function ListConjuge(IdTitular: double): OleVariant;
    function ListFilhos(IdTitular: double): OleVariant;
    function FormatCTPS(Ini, Tam: byte; Campo: string): string;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; 
    destructor  Destroy; override;

    function GerarDadosImpressao(ListaIdEstab, ListaIdFunc: string;
      ImprimeNomeEmpresa: boolean): string;

    property SQL: TStringList read FSQL;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlParamFichaReg }

constructor TCtrlParamFichaReg.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FSQL := TStringList.Create;
end;

destructor TCtrlParamFichaReg.Destroy;
begin
  FSQL.Free;
  inherited;
end;

procedure TCtrlParamFichaReg.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamFichaReg.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlParamFichaReg.ListFichaReg(ListaIdEstab, ListaIdFunc: string): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS ESTAB,');
    Add('  F.IDPESSOA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  PF.NUMDOCUMENTO AS CPF,');
    Add('  RTRIM(E.LOGRADOURO) ||');
    Add('    TO_CHAR(DECODE(E.NUMERO,NULL,'''','', ''|| TO_CHAR(E.NUMERO))) ||');
    Add('    TO_CHAR(DECODE(E.BAIRRO,NULL,'''','', ''|| RTRIM(E.BAIRRO))) AS ENDERECO,');
    Add('  RTRIM(E.COMPLEMENTO) AS COMPLEMENTO,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||'' ''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
    Add('  ES.CODESTADO AS UF,');
    Add('  PEFIS.CODESTADO AS UFNASC,');
    Add('  CIDADES.NOME AS CIDADE,');
    Add('  PAIS.NOMENACIONALIDADE AS NACIONALIDADE,');
    Add('  PAIS.NOMEPAIS AS PAIS,');
    Add('  TO_CHAR(DECODE(PEFIS.ESTCIVIL,');
    Add('    ''S'',''Solteir'',');
    Add('    ''C'',''Casad'',');
    Add('    ''D'',''Separad'',');
    Add('    ''J'',''Separad'',');
    Add('    ''E'',''Desquitad'',');
    Add('    ''V'',''Viúv'',');
    Add('    ''O'',''Outro'')) ||');
    Add('    TO_CHAR(DECODE(PEFIS.SEXO,''F'',''a'',''o'')) ||');
    Add('    TO_CHAR(DECODE(PEFIS.ESTCIVIL,');
    Add('      ''J'','' Judicialmente'','''')) AS ESTCIVIL,');
    Add('  CC.NOME AS C_CUSTO,');
    Add('  F.SALARIOATUAL,');
    Add('  TO_CHAR(DECODE(F.TIPOPAGAMENTO,');
    Add('    ''H'',''Horista'',');
    Add('    ''D'',''Diarista'',');
    Add('    ''M'',''Mensalista'',');
    Add('    ''T'',''Tarefa'')) AS TIPOPAGAMENTO,');
    Add('  RTRIM(PEFIS.NOMEMAE) AS MAE,');
    Add('  RTRIM(PEFIS.NOMEPAI) AS PAI,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  RTRIM(EJ.LOGRADOURO) ||');
    Add('    TO_CHAR(DECODE(EJ.NUMERO,NULL,'''','', ''|| TO_CHAR(EJ.NUMERO))) ||');
    Add('    TO_CHAR(DECODE(EJ.BAIRRO,NULL,'''','', ''|| RTRIM(EJ.BAIRRO))) AS ENDEMPRESA,');
    Add('  PIS.NUM AS PIS,');
    Add('  RG.NUM AS RG, RG.ORGAORG,');
    Add('  RTRIM(CTPS.NUM) AS CTPS,');
    Add('  RTRIM(CTPS.UF) AS CTPS_UF,');
    Add('  C.CBO2002 AS CBO,');
    Add('  RTRIM(C.TITULO) AS OCUPACAO,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS ADMISSAO,');
    Add('  DECODE(PEFIS.SEXO,''M'',1,''F'',2) AS SEXO,');
    Add('  RTRIM(GI.DESCRICAO) AS GRAUINSTRU,');
    Add('  TO_CHAR(PEFIS.DATANASC,''DD/MM/YYYY'') AS NASCIMENTO,');
    Add('  F.DATAOPCAOFGTS,');
    Add('  ''Caixa Economica Federal'' AS N_BANCO,');
    // Agência  do Funcionário
    Add('  SUBSTR(AG.NUMAGENCIA,1,4) ||'' ''|| SUBSTR(AG.NUMAGENCIA,5,1) AS N_AGENCIA,');
    Add('  RTRIM(AGENC.NOME) AS AGENCIA,');
    Add('  TRUNC(TO_NUMBER(SYSDATE - 1 - DATANASC)/365.25) AS IDADE');
    Add('FROM');
    // -------------------------------------------------------------------------------- //
    // Se imprime Agência do FGTS do Funcionário...
    Add('  PESSOA PJ, PESSOA PF, PESSOA AGENC, PESSOAFISICA PEFIS, ENDPESS E, ENDPESS EJ,');
    Add('  FUNCIONARIO F, FILIALPESSOA FP, CARGO C, AGENCIABANCARIA AG,');
    Add('  CIDADES, ESTADO ES, GRINSTR GI, HORATRAB HT, PAIS, CENTCUST CC,');
    // -------------------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------------------- //
    // Cart. Ident. do Funcionário
    Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, DP.ORGAO AS ORGAORG');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''RG:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) RG,');
    // -------------------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO, TIPODOCPESSOA TDP,');
    Add('          ESTADO ES, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (F.IDPESSOA         = DP.IDPESSOA) AND');
    Add('         (DP.IDPAIS          = PA.IDPAIS) AND');
    Add('         (ES.IDPAIS          = PA.IDPAIS) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS');
    // -------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (FP.IDFILIALPESSOA    IN (' +ListaIdEstab+ ')) AND');

    if (ListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('  (F.IDPESSOA', ListaIdFunc, 8));

    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND');
    Add('  (FP.IDFILIALPESSOA = F.IDESTAB) AND');
    Add('  (F.IDHORARIO       = HT.IDHORARIO) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PEFIS.IDPESSOA) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (F.IDAGENCIAFGTS     = AG.IDPESSOA) AND');
    Add('  (F.IDAGENCIAFGTS     = AGENC.IDPESSOA) AND');
    Add('  (PEFIS.IDGRINSTR   = GI.IDGRINSTR) AND');
    Add('  (PJ.IDENDCOMERCIAL = EJ.IDENDERECO) AND');
    Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = PIS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = RG.IDPESSOA(+)) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND');
    Add('  (PEFIS.IDPAIS      = PAIS.IDPAIS(+))');
    Add('ORDER BY');
    Add('  EMPREGADO');
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamFichaReg.ListConjuge(IdTitular: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  PF.IDPESSOA, PF.NOME AS CONJUGE, D.NUMSEQUENCIA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PF, DEPENTIT D'+CR_LF+
    'WHERE'+CR_LF+
    '  (D.IDTITULAR     = ' +FloatToStr(IdTitular)+ ') AND'+CR_LF+
    '  (D.IDDEPENDENCIA = ''COM'') AND'+CR_LF+
    '  (PF.IDPESSOA     = D.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NUMSEQUENCIA');
end;

function TCtrlParamFichaReg.ListFilhos(IdTitular: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  PF.IDPESSOA, PF.NOME AS FILHO, D.NUMSEQUENCIA,'+CR_LF+
    '  PFIS.DATANASC AS NASCFILHO,'+CR_LF+
    '  DECODE(PFIS.SEXO,''M'',''Filho'',''F'',''Filha'',''Filho(a)'') AS SEXOFIL'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PF, PESSOAFISICA PFIS, DEPENTIT D'+CR_LF+
    'WHERE'+CR_LF+
    '  (D.IDTITULAR     = ' +FloatToStr(IdTitular)+ ') AND'+CR_LF+
    '  (D.IDDEPENDENCIA = ''FIL'') AND'+CR_LF+
    '  (D.IDPESSOA      = PF.IDPESSOA) AND'+CR_LF+
    '  (PF.IDPESSOA     = PFIS.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NUMSEQUENCIA');
end;

function TCtrlParamFichaReg.FormatCTPS(Ini,Tam:byte; Campo:string): string;
var
  c: byte;
  sAux: string;
begin
  for c:=1 to length(Campo) do
    if (Campo[c] in ['0'..'9']) then
      sAux := sAux + Campo[c];

  Result := Replicate('0',Abs(Tam-Length(Copy(sAux,Ini,Tam)))) + Copy(sAux,Ini,Tam);
end;

function TCtrlParamFichaReg.GerarDadosImpressao(ListaIdEstab, ListaIdFunc: string;
  ImprimeNomeEmpresa: boolean): string;
var
  c: byte;
  Arquivo: TStringList;
  CdsFichaReg, CdsConjuge, CdsFilhos: TCMClientDataSet;
begin
  Arquivo := TStringList.Create;

  CdsFichaReg := TCMClientDataSet.Create(nil);
  CdsConjuge := TCMClientDataSet.Create(nil);
  CdsFilhos := TCMClientDataSet.Create(nil);

  CdsFichaReg.Data := ListFichaReg(ListaIdEstab, ListaIdFunc);
  CdsConjuge.Data := ListConjuge(CdsFichaReg.FieldByName('IDPESSOA').asFloat);
  CdsFilhos.Data := ListFilhos(CdsFichaReg.FieldByName('IDPESSOA').asFloat);
  DoProgresso([CdsFichaReg.RecordCount]);

  // ------------------------------------------------------------------
  // Geração do Relatório para a Pessoa atualmente posicionada na Query
  // ------------------------------------------------------------------
  // Imprimo cada linha Funcionário
  while not(CdsFichaReg.EOF) do
  begin
    // Espaço do Cabeçalho
    for c:=1 to 4 do
      Arquivo.Add(' ');

    // (01) - Nome e Endereço da Empresa
    Arquivo.Add(Replicate(' ',30)+ IFF(ImprimeNomeEmpresa,
      Alinha(CdsFichaReg.FieldByName('ESTAB').asString,70,'C',' '),Replicate(' ',70)) +
      Replicate(' ',7) + Alinha(CdsFichaReg.FieldByName('ENDEMPRESA').asString,70,'C',' '));

    Arquivo.Add(' ');
    Arquivo.Add(' ');
    // (02) - Nome do Funcionário
    Arquivo.Add(Replicate(' ',67)+
      Alinha(CdsFichaReg.FieldByName('EMPREGADO').asString,68,'E',' '));

    // (03) - Idade, Data de Nascimento Nacion. e País
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',35)+
      Alinha(CdsFichaReg.FieldByName('IDADE').asString,9,'D',' ')+' '+
      Alinha(CdsFichaReg.FieldByName('NASCIMENTO').asString,18,'C',' ')+'  '+
      Alinha(CdsFichaReg.FieldByName('NACIONALIDADE').asString,18,'E',' ')+
      Alinha(CdsFichaReg.FieldByName('PAIS').asString,29,'C',' '));

    // (04) - UF de Nascimento, Est. Civil e CPF
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',35)+
      Alinha(CdsFichaReg.FieldByName('UFNASC').asString,7,'D',' ')+
      Alinha(CdsFichaReg.FieldByName('ESTCIVIL').asString,42,'C',' ')+
      Alinha(CdsFichaReg.FieldByName('CPF').asString,37,'C',' '));

    // (05) - Carteira Profissional e Identidade
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',37)+
      // Número da CTPS
      Alinha(FormatCTPS(1,7,Trim(CdsFichaReg.FieldByName('CTPS').asString)),21,'C',' ')+
      // Série da CTPS
      Alinha(FormatCTPS(8,5,Trim(CdsFichaReg.FieldByName('CTPS').asString))+
        '/'+CdsFichaReg.FieldByName('CTPS_UF').asString,12,'D',' ')+
      Replicate(' ',49)+
      Alinha(CdsFichaReg.FieldByName('RG').asString,33,'C',' '));

    // (06) - Emitente Carteira de Identidade e Grau Instrução
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',39)+
      Alinha(CdsFichaReg.FieldByName('ORGAORG').asString,18,'E',' ')+Replicate(' ',55)+
      Alinha(CdsFichaReg.FieldByName('GRAUINSTRU').asString,40,'E',' '));

    // (07) - Nome do Pai e da Mãe do Funcionário
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',59)+
      Alinha(CdsFichaReg.FieldByName('PAI').asString,53,'E',' '));
    Arquivo.Add(Replicate(' ',59)+
      Alinha(CdsFichaReg.FieldByName('MAE').asString,53,'E',' '));

    // (08) - Nome do Cônjuge do Funcionário
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',98)+
      Alinha(CdsConjuge.FieldByName('CONJUGE').asString,75,'E',' '));

    // (09) - Endereço do Funcionário e Filhos
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',9)+
      Alinha(CdsFichaReg.FieldByName('ENDERECO').asString,75,'E',' ')+
      IFF(not CdsFilhos.EOF,
          Alinha(CdsFilhos.FieldByName('SEXOFIL').asString,12,'E',' ')+
          Replicate(' ',01)+
          Alinha(CdsFilhos.FieldByName('FILHO').asString,58,'E',' ')+
          Replicate(' ',01)+
          Alinha(CdsFilhos.FieldByName('NASCFILHO').asString,17,'C',' '),
          Replicate(' ',01)));
    CdsFilhos.Next;

    for c:=1 to 4 do
      if (CdsFilhos.EOF) then
        Arquivo.Add(' ')
      else
      begin
        Arquivo.Add(Replicate(' ',84)+
          Alinha(CdsFilhos.FieldByName('SEXOFIL').asString,12,'E',' ')+
          Replicate(' ',1)+
          Alinha(CdsFilhos.FieldByName('FILHO').asString,58,'E',' ')+
          Replicate(' ',1)+
          Alinha(CdsFilhos.FieldByName('NASCFILHO').asString,17,'C',' '));
        CdsFilhos.Next;
      end;

    // (10) - FGTS
    Arquivo.Add(Replicate(' ',5)+
      Alinha(CdsFichaReg.FieldByName('DATAOPCAOFGTS').asString,20,'C',' ')+Replicate(' ',17)+
      // Nome do banco RANIERE e não número
      Alinha(CdsFichaReg.FieldByName('N_BANCO').asString,32,'C',' ')+
      IFF(not CdsFilhos.EOF,Replicate(' ',26)+
          Alinha(CdsFilhos.FieldByName('SEXOFIL').asString,12,'E',' ')+
          Replicate(' ',01)+
          Alinha(CdsFilhos.FieldByName('FILHO').asString,58,'E',' ')+
          Replicate(' ',01)+
          Alinha(CdsFilhos.FieldByName('NASCFILHO').asString,17,'C',' '),
          Replicate(' ',01)));

    // (11) - Admissão, CBO e PIS
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',40)+
      Replicate(' ',4)+Alinha(CdsFichaReg.FieldByName('ADMISSAO').asString,21,'C',' ')+
      Alinha(CdsFichaReg.FieldByName('CBO').asString,21,'C',' ')+Replicate(' ',20)+
      Alinha(CdsFichaReg.FieldByName('PIS').asString,29,'C',' '));

    // (12) - Forma de Pagamento
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',40)+
      Alinha(CdsFichaReg.FieldByName('TIPOPAGAMENTO').asString,42,'C',' '));

    // (13) - Salário, Cargo e C.Custo
    Arquivo.Add(' ');
    Arquivo.Add(Replicate(' ',35)+
      Replicate(' ',08)+RightPad(FormatFloat('###,###,##0.00',CdsFichaReg.FieldByName('SALARIOATUAL').asFloat),20)+
      Replicate(' ',33)+Alinha(CdsFichaReg.FieldByName('OCUPACAO').asString,34,'C',' ') +
      Replicate(' ',02)+Alinha(CdsFichaReg.FieldByName('C_CUSTO').asString,37,'C',' '));

    // Imprimo o final da página
    for c:=1 to 9 do
      Arquivo.Add(' ');

    // Próximo funcionário
    CdsFichaReg.Next;
    CdsConjuge.Data := ListConjuge(CdsFichaReg.FieldByName('IDPESSOA').asFloat);
    CdsFilhos.Data := ListFilhos(CdsFichaReg.FieldByName('IDPESSOA').asFloat);
    DoProgresso([0]);
  end;

  Result := Arquivo.Text;

  CdsFichaReg.Free;
  CdsConjuge.Free;
  CdsFilhos.Free;
  Arquivo.Free;
end;

end.
