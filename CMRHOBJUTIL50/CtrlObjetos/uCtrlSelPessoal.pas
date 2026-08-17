{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/02/2004                                 }
{                                                       }
{*******************************************************}

unit uCtrlSelPessoal;

interface

uses SysUtils, Classes, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uCtrlListTerceirosRH, uCtrlCargo;

type
  TTitulo_Sequencia = array[0..15] of string;

  TCtrlSelPessoal = class(TCtrlCustomRH)
  private
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlCargo: TCtrlCargo;

    FCdsPrincipal: TCMClientDataSet;
    FSQL: TStringList;

    FUsaCargoAlternativo: boolean;
    FCEPInicial, FCEPFinal: integer;

    FTitulo_Sequencia: TTitulo_Sequencia;

    procedure SelRegistros;
  protected
    procedure AfterInitialize; override;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor Destroy; override;

    procedure SelDadosPessoal(AbrirCds, MarcouFuncionario,
      UsaCargoAlternativo, SelDemitidos: boolean; ListaIdEmpresa: string;
      DataAdmissaoInicial, DataAdmissaoFinal, DataDemissaoInicial,
      DataDemissaoFinal: TDate; ListaTipoContrato, ListaIdEstab,
      ListaIdCargo, ListaIdSindicato, ListaIdCidade, ListaIdAtivProj, ListaIdMotivo,
      ListaSexo, ListaEstadoCivil, ListaTipoPagamento, ListaSitFunc,
      CodCentroCusto: string; IdGrauInstr, SinalGrauInstr, IdProfissao,
      TipoDeficiente, NumTotDependentes, SinalTotDependentes, NumDependentesIRRF,
      SinalDependentesIRRF, NumDependentesSalFam, SinalDependentesSalFam,
      FaixaEtariaInicial, FaixaEtariaFinal, MesAniversario,
      TempoDeCasaInicial, TempoDeCasaFinal, TempoDeLotacaoInicial,
      TempoDeLotacaoFinal, TempoDeCargoInicial, TempoDeCargoFinal,
      FaixaSalarialInicial, FaixaSalarialFinal, CEPInicial, CEPFinal,
      OrdemDados: integer);

    procedure AbrirCdsPrincipal;

    property SQL: TStringList read FSQL;
    property CdsPrincipal: TCMClientDataSet read FCdsPrincipal write FCdsPrincipal;
    property Titulo_Sequencia: TTitulo_Sequencia read FTitulo_Sequencia;
  end;

implementation

uses  uCtrlFuncoesRH, DBClient;

const
  ORDEM_DADOS_FUNC: array[0..15] of string =
    ('P.NOME',
     'F.MATRICULA',
     'F.IDCARGO, P.NOME',
     'F.IDCARGO, MATRICULA',
     'F.IDEMPRESA, F.CODCENTROCUSTO, P.NOME',
     'F.IDEMPRESA, F.CODCENTROCUSTO, MATRICULA',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, P.NOME',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, MATRICULA',
     'F.UNIDNEGOC, F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, P.NOME',
     'F.UNIDNEGOC, F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, MATRICULA',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.IDCARGO, P.NOME',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.IDCARGO, MATRICULA',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, P.NOME',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, MATRICULA',
     'F.UNIDNEGOC, F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, P.NOME',
     'F.UNIDNEGOC, F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, MATRICULA');

  ORDEM_DADOS_CAND: array[0..3] of string =
    ('P.NOME',
     'CD.IDPESSOA',
     'CD.IDCARGO, P.NOME',
     'CD.IDCARGO, CD.IDPESSOA');

{ TCtrlCargo }

constructor TCtrlSelPessoal.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlCargo := TCtrlCargo.Create;

  FSQL := TStringList.Create;

  FTitulo_Sequencia[00] := ('Nome');
  FTitulo_Sequencia[01] := ('Matrícula');
  FTitulo_Sequencia[02] := ('Cargo, Nome');
  FTitulo_Sequencia[03] := ('Cargo, Matrícula');
  FTitulo_Sequencia[04] := ('Centro de Custo, Nome');
  FTitulo_Sequencia[05] := ('Centro de Custo, Matrícula');
  FTitulo_Sequencia[06] := ('Lotação, Nome');
  FTitulo_Sequencia[07] := ('Lotação, Matrícula');
  FTitulo_Sequencia[08] := ('Atividade/Projeto, Lotação, Nome');
  FTitulo_Sequencia[09] := ('Atividade/Projeto, Lotação, Matrícula');
  FTitulo_Sequencia[10] := ('C.Custo, Cargo, Nome');
  FTitulo_Sequencia[11] := ('C.Custo, Cargo, Matrícula');
  FTitulo_Sequencia[12] := ('Lotação, Cargo, Nome');
  FTitulo_Sequencia[13] := ('Lotação, Cargo, Matrícula');
  FTitulo_Sequencia[14] := ('Atividade/Projeto, Lotação, Cargo, Nome');
  FTitulo_Sequencia[15] := ('Atividade/Projeto, Lotação, Cargo, Matrícula');
end;

destructor TCtrlSelPessoal.Destroy;
begin
  FCtrlListTerceirosRH.Free;
  FCtrlCargo.Free;
  FSQL.Free;
  inherited;
end;

procedure TCtrlSelPessoal.AfterInitialize;
begin
  inherited;
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlCargo.InitializeAs(Self);
end;

procedure TCtrlSelPessoal.SelDadosPessoal(AbrirCds, MarcouFuncionario, UsaCargoAlternativo,
  SelDemitidos: boolean; ListaIdEmpresa: string; DataAdmissaoInicial, DataAdmissaoFinal,
  DataDemissaoInicial, DataDemissaoFinal: TDate; ListaTipoContrato, ListaIdEstab,
  ListaIdCargo, ListaIdSindicato, ListaIdCidade, ListaIdAtivProj, ListaIdMotivo, ListaSexo,
  ListaEstadoCivil, ListaTipoPagamento, ListaSitFunc, CodCentroCusto: string; IdGrauInstr,
  SinalGrauInstr, IdProfissao, TipoDeficiente, NumTotDependentes, SinalTotDependentes,
  NumDependentesIRRF, SinalDependentesIRRF, NumDependentesSalFam, SinalDependentesSalFam,
  FaixaEtariaInicial, FaixaEtariaFinal, MesAniversario, TempoDeCasaInicial, TempoDeCasaFinal,
  TempoDeLotacaoInicial, TempoDeLotacaoFinal, TempoDeCargoInicial, TempoDeCargoFinal,
  FaixaSalarialInicial, FaixaSalarialFinal, CEPInicial, CEPFinal, OrdemDados: integer);
var
  sAux: string;
  c: byte;  
begin
  FUsaCargoAlternativo := UsaCargoAlternativo;
  FCEPInicial := CEPInicial;
  FCEPFinal := CEPFinal;

  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  P.NOME,');
    Add('  P.RAZAOSOCIAL,');
    Add('  P.TIPO,');
    Add('  P.NUMDOCUMENTO,');
    Add('  P.IDPESSOA,');
    Add('  PF.IDSINDICATO, PF.IDCIDADES, PF.CODESTADO, PF.IDPAIS,');
    Add('  PF.IDFONTRECR, PF.IDGRINSTR, PF.IDPROFISS, PF.NOMEPAI, PF.NOMEMAE,');
    Add('  PF.DATANASC, PF.SEXO, PF.TIPOSANG, PF.ESTCIVIL, PF.NUMDEPIRRF,');
    Add('  PF.NUMDEPSALF, PF.NUMDEPTOT, PF.FLGISENTOIRRF, PF.CORPESSOA,');
    Add('  PF.FLGDEFICIENTE,');
    Add('  E.LOGRADOURO,');
    Add('  E.BAIRRO,');
    Add('  E.CEP,');
    Add('  E.NUMERO,');
    Add('  E.IDCIDADES AS IDCIDADE_ENDERECO,');
    Add('  LPAD('' '',50,'' '') AS CIDADE,');
    Add('  LPAD('' '',03,'' '') AS UF,');
    Add('  E.COMPLEMENTO,');
    Add('  E.IDCIDADES,');
    Add('  LPAD('' '',40,'' '') AS TITULO,');

    if (MarcouFuncionario) then
    begin
      Add('  F.IDCARGO, F.IDFUNCAO, F.IDPROCESSODEM, F.IDSITRISCO, F.IDCATEMPRGRE,');
      Add('  F.IDFAIXACARGO, F.IDAFASTRAIS, F.IDMOVCONTRCAGED, F.IDHORARIO,');
      Add('  F.IDCHEFE, F.IDVINCEMPREG, F.IDFORMARESC, F.CODCENTROCUSTO,');
      Add('  F.IDEMPRESA, F.IDSITFUNC, F.IDTIPOTRAB, F.MATRICULA, F.DATAADMISSAO,');
      Add('  F.TIPOCONTRATO, F.TIPOPAGAMENTO, F.SALARIOATUAL, F.SALARIOTIPO,');
      Add('  F.DATAOPCAOFGTS, F.DATAOPCAOFGTS, F.DATASALARIO, F.DATACARGO,');
      Add('  F.DATALOTACAO, F.DATADESLIGAMENTO, F.IDMOTIVODESLIGRAIS,');
      Add('  F.IDMOTIVODESLIGGERENCIAL, F.HOMOLOGACAONUMERO, F.DATAAVISO,');
      Add('  F.DATARETORNO, F.IDESTAB, F.DATAFIMCONTRATO, F.IDAGENCIASALARIO,');
      Add('  F.NUMCONTASALARIO, F.IDAGENCIAFGTS, F.NUMCONTAFGTS, F.DURACAOCONTRATO,');
      Add('  F.PRORROGCONTRATO, F.FLGTIPOFGTS, F.QUANTIDADEFGTS, F.VALORFGTS,');
      Add('  F.NIVELINDIV1, F.IDFAIXAFUNCAO, F.NIVELINDIV2, F.DATACARGO2, F.TIPOMAODEOBRA,');
      Add('  F.DATAREFHORARIO, F.IDDEPOSGRE, F.FLGMARCAPONTO, F.DATBANCOHORAS,');
      Add('  ST.DESCRICAO, ST.TIPOSIT, ST.FLGUSO, ST.FLGINTERNO, ST.CODCAGED, ST.CODMOVFGTS,');
      Add('  HT.JORNADAMENSAL,');
      Add('  F.UNIDNEGOC,');
      Add('  CC.NOME AS CENTROCUSTO');
      Add('FROM');
      Add('  PESSOA P, ENDPESS E, PESSOAFISICA PF, FUNCIONARIO F,');
      Add('  SITFUNC ST, HORATRAB HT, FILIALPESSOA FP, CENTCUST CC');
    end
    else
    begin
      Add('  CD.IDCARGO, 0 AS IDFUNCAO, CD.SALARIO, CD.TIPOPAGAMENTO, CD.TIPOCONTRATO,');
      Add('  CD.DAT_ADMIS, CD.SITUACAO, CD.DATULTATU, CD.DATINCLU,');
      Add('  '' '' AS MATRICULA,');
      Add('  ' +QuotedStr(('Candidato a'))+ ' AS DESCRICAO,');
      Add('  '' '' AS CENTROCUSTO');
      Add('FROM');
      Add('  PESSOA P, ENDPESS E, PESSOAFISICA PF, CANDIDAT CD');
    end;

    Add('WHERE');

    if (ListaSexo <> '') then
      Add('  (PF.SEXO           ' +ListaSexo+ ') AND');

    if (ListaEstadoCivil <> '') then
      Add('  (PF.ESTCIVIL       ' +ListaEstadoCivil+ ') AND');

    if (ListaTipoPagamento <> '') then
      Add('  (TIPOPAGAMENTO     ' +ListaTipoPagamento+ ') AND');

    if (IdGrauInstr > -1) and (IdGrauInstr > -1) then // Grau de Instrução
    begin
      case (SinalGrauInstr) of
        0 : sAux := ' <= ';
        1 : sAux := '  = ';
        2 : sAux := ' >= ';
      end;
      Add('  (PF.IDGRINSTR' + sAux +IntToStr(IdGrauInstr)+ ') AND');
    end;

    if (IdProfissao > -1) then // Profissão
      Add('  (PF.IDPROFISS = ' +IntToStr(IdProfissao)+ ') AND');

    if (TipoDeficiente = 0) then
      Add('  (NVL(PF.FLGDEFICIENTE,0) = 1) AND')
    else
    if (TipoDeficiente = 1) then
      Add('  (NVL(PF.FLGDEFICIENTE,0) <> 1) AND');

    if (SinalTotDependentes < 2) or (NumTotDependentes > 0) then // Total Dependentes
    begin
      case (SinalTotDependentes) of
        0 : sAux := ' <= ';
        1 : sAux := '  = ';
        2 : sAux := ' >= ';
      end;
      Add('  (NVL(PF.NUMDEPTOT,0)' + sAux + IntToStr(NumTotDependentes)+ ') AND');
    end;

    if (SinalDependentesIRRF < 2) or (NumDependentesIRRF > 0) then // Dependentes IRRF
    begin
      case (SinalDependentesIRRF) of
        0 : sAux := ' <= ';
        1 : sAux := '  = ';
        2 : sAux := ' >= ';
      end;
      Add('  (NVL(PF.NUMDEPIRRF,0)' + sAux + IntToStr(NumDependentesIRRF)+ ') AND');
    end;

    if (SinalDependentesSalFam < 2) or (NumDependentesSalFam > 0) then // Dependentes Sal. Fam.
    begin
      case (SinalDependentesSalFam) of
        0 : sAux := ' <= ';
        1 : sAux := '  = ';
        2 : sAux := ' >= ';
      end;
      Add('  (NVL(PF.NUMDEPSALF,0)' + sAux + IntToStr(NumDependentesSalFam)+ ') AND');
    end;

    if (ListaIdSindicato <> '') then
      Add('  (PF.IDSINDICATO ' +ListaIdSindicato+ ') AND');

    if (ListaIdCidade <> '') then
      Add('  (E.IDCIDADES ' +ListaIdCidade+ ') AND');

    if (FaixaEtariaInicial > 0) then  // Faixa Etária Inicial
      Add('  (TRUNC(TO_NUMBER(SYSDATE - 1 - DATANASC)/365.25) >= ' +IntToStr(FaixaEtariaInicial)+ ') AND');

    if (FaixaEtariaFinal < 99) then  // Faixa Etária Final
      Add('  (TRUNC(TO_NUMBER(SYSDATE - 1 - DATANASC)/365.25) <= ' +IntToStr(FaixaEtariaFinal)+ ') AND');

    if (MesAniversario > 0) then // Mês do Aniversário
      Add('  (TO_NUMBER(TO_CHAR(PF.DATANASC,''MM'')) = ' +IntToStr(MesAniversario)+ ') AND');

    if (MarcouFuncionario) then
    begin
      if (FIdUsuarioGeral <> '') then
        Add('  (F.IDPESSOA         = ' +FIdUsuarioGeral+ ') AND');

      if (FUsuXCCusto <> '') then
        Add(MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FUsuXCCusto,2));

      if (FUsuXFilial <> '') then
        Add(MontaLinhaSelSQL('  (F.IDESTAB',FUsuXFilial,9));

      if (DataAdmissaoInicial > 0) then
        Add('  (F.DATAADMISSAO    >= TO_DATE(' +QuotedStr(DateToStr(DataAdmissaoInicial))+ ',''DD/MM/YYYY'')) AND');

      if (DataAdmissaoFinal > 0) then
        Add('  (F.DATAADMISSAO    <= TO_DATE(' +QuotedStr(DateToStr(DataAdmissaoFinal))+ ',''DD/MM/YYYY'')) AND');

      if (ListaSitFunc <> '') then
        Add('  (ST.TIPOSIT        ' +ListaSitFunc+ ') AND');

      if (ListaTipoContrato <> '') then
        Add('  (F.TIPOCONTRATO    ' +ListaTipoContrato+ ') AND');

      if (ListaIdEstab <> '') then
        Add('  (F.IDESTAB         ' +ListaIdEstab+ ') AND');

      Add('  (F.IDEMPRESA        IN (' +ListaIdEmpresa+ ')) AND');

      if (ListaIdAtivProj <> '') then
        Add('  (F.UNIDNEGOC ' +ListaIdAtivProj+ ') AND');

      if (CodCentroCusto <> '**********') then // Máscara do Centro de Custo
      begin
        if (Pos('*',CodCentroCusto) = 0) then
          Add('  (F.CODCENTROCUSTO = ' +QuotedStr(CodCentroCusto)+ ') AND')
        else
        begin
          for c:=1 to Length(CodCentroCusto) do
            if (Copy(CodCentroCusto,c,1) <> '*')  then
              Add('  (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
                  ', 1) = ' +QuotedStr(Copy(CodCentroCusto,c,1))+ ') AND');
        end;
      end;

      if (SelDemitidos) then
      begin
        if (ListaIdMotivo <> '') then
        begin
          Add('  ((ST.TIPOSIT           <> ''D'') OR');
          Add('   (F.IDMOTIVODESLIGRAIS ' +ListaIdMotivo+ ')) AND');
        end;

        Add('  ((ST.TIPOSIT           <> ''D'') OR');
        Add('   (F.DATADESLIGAMENTO   IS NULL) OR');
        Add('   ((F.DATADESLIGAMENTO  >= TO_DATE(' +
          QuotedStr(DateToStr(DataDemissaoInicial))+ ',''DD/MM/YYYY'')) AND');
        Add('    (F.DATADESLIGAMENTO  <= TO_DATE(' +
          QuotedStr(DateToStr(DataDemissaoFinal))+ ',''DD/MM/YYYY'')))) AND');
      end;

      if (ListaIdCargo <> '') then
        Add('  (F.IDCARGO         ' +ListaIdCargo+ ') AND');

      Add('  (F.IDSITFUNC        = ST.IDSITFUNC) AND');
      Add('  (F.IDESTAB          = FP.IDFILIALPESSOA) AND');
      Add('  (F.IDHORARIO        = HT.IDHORARIO) AND');
      Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
      Add('  (F.IDPESSOA         = P.IDPESSOA) AND');

      if (TempoDeCasaInicial > 0) then // Tempo de Casa Inicial
      begin
        // Anos
        Add('  (');
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''YYYY'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATAADMISSAO,''YYYY''))');
        Add('    ) * 12 +');
        // Meses
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''MM'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATAADMISSAO,''MM''))');
        Add('    ) +');
        // Dias
        Add('    TO_NUMBER(DECODE((TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                          ''D'',DATADESLIGAMENTO,');
        Add('                                          SYSDATE),''DD'')) -');
        Add('                      TO_NUMBER(TO_CHAR(DATAADMISSAO,''DD''))');
        Add('                     ) /');
        Add('                     TO_NUMBER(DECODE(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                ''D'',DATADESLIGAMENTO,');
        Add('                                                SYSDATE),''DD''),');
        Add('                                      TO_CHAR(DATAADMISSAO,''DD''),1,');
        Add('                                      ABS(');
        Add('                                        TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                            ''D'',DATADESLIGAMENTO,');
        Add('                                                            SYSDATE),''DD'')) -');
        Add('                                        TO_NUMBER(TO_CHAR(DATAADMISSAO,''DD''))');
        Add('                                      )');
        Add('                     )),');
        Add('              -1,-1,');
        Add('              0');
        Add('    )) >= ' +IntToStr(TempoDeCasaInicial)+ ') AND');
      end;

      if (TempoDeCasaFinal < 999) then // Tempo de Casa Final
      begin
        // Anos
        Add('  (');
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''YYYY'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATAADMISSAO,''YYYY''))');
        Add('    ) * 12 +');
        // Meses
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''MM'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATAADMISSAO,''MM''))');
        Add('    ) +');
        // Dias
        Add('    TO_NUMBER(DECODE((TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                          ''D'',DATADESLIGAMENTO,');
        Add('                                          SYSDATE),''DD'')) -');
        Add('                      TO_NUMBER(TO_CHAR(DATAADMISSAO,''DD''))');
        Add('                     ) /');
        Add('                     TO_NUMBER(DECODE(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                ''D'',DATADESLIGAMENTO,');
        Add('                                                SYSDATE),''DD''),');
        Add('                                      TO_CHAR(DATAADMISSAO,''DD''),1,');
        Add('                                      ABS(');
        Add('                                        TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                            ''D'',DATADESLIGAMENTO,');
        Add('                                                            SYSDATE),''DD'')) -');
        Add('                                        TO_NUMBER(TO_CHAR(DATAADMISSAO,''DD''))');
        Add('                                      )');
        Add('                     )),');
        Add('              -1,-1,');
        Add('              0');
        Add('    )) <= ' +IntToStr(TempoDeCasaFinal)+ ') AND');
      end;

      if (TempoDeLotacaoInicial > 0) then // Tempo na Lotação Inicial
      begin
        // Anos
        Add('  (');
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''YYYY'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATALOTACAO,''YYYY''))');
        Add('    ) * 12 +');
        // Meses
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''MM'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATALOTACAO,''MM''))');
        Add('    ) +');
        // Dias
        Add('    TO_NUMBER(DECODE((TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                          ''D'',DATADESLIGAMENTO,');
        Add('                                          SYSDATE),''DD'')) -');
        Add('                      TO_NUMBER(TO_CHAR(DATALOTACAO,''DD''))');
        Add('                     ) /');
        Add('                     TO_NUMBER(DECODE(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                ''D'',DATADESLIGAMENTO,');
        Add('                                                SYSDATE),''DD''),');
        Add('                                      TO_CHAR(DATALOTACAO,''DD''),1,');
        Add('                                      ABS(');
        Add('                                        TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                            ''D'',DATADESLIGAMENTO,');
        Add('                                                            SYSDATE),''DD'')) -');
        Add('                                        TO_NUMBER(TO_CHAR(DATALOTACAO,''DD''))');
        Add('                                      )');
        Add('                     )),');
        Add('              -1,-1,');
        Add('              0');
        Add('    )) >= ' +IntToStr(TempoDeLotacaoInicial)+ ') AND');
      end;

      if (TempoDeLotacaoFinal < 999) then // Tempo na Lotação Final
      begin
        // Anos
        Add('  (');
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''YYYY'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATALOTACAO,''YYYY''))');
        Add('    ) * 12 +');
        // Meses
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''MM'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATALOTACAO,''MM''))');
        Add('    ) +');
        // Dias
        Add('    TO_NUMBER(DECODE((TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                          ''D'',DATADESLIGAMENTO,');
        Add('                                          SYSDATE),''DD'')) -');
        Add('                      TO_NUMBER(TO_CHAR(DATALOTACAO,''DD''))');
        Add('                     ) /');
        Add('                     TO_NUMBER(DECODE(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                ''D'',DATADESLIGAMENTO,');
        Add('                                                SYSDATE),''DD''),');
        Add('                                      TO_CHAR(DATALOTACAO,''DD''),1,');
        Add('                                      ABS(');
        Add('                                        TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                            ''D'',DATADESLIGAMENTO,');
        Add('                                                            SYSDATE),''DD'')) -');
        Add('                                        TO_NUMBER(TO_CHAR(DATALOTACAO,''DD''))');
        Add('                                      )');
        Add('                     )),');
        Add('              -1,-1,');
        Add('              0');
        Add('    )) <= ' +IntToStr(TempoDeLotacaoFinal)+ ') AND');
      end;

      if (TempoDeCargoInicial > 0) then // Tempo no Cargo Inicial
      begin
        // Anos
        Add('  (');
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''YYYY'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATACARGO,''YYYY''))');
        Add('    ) * 12 +');
        // Meses
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''MM'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATACARGO,''MM''))');
        Add('    ) +');
        // Dias
        Add('    TO_NUMBER(DECODE((TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                          ''D'',DATADESLIGAMENTO,');
        Add('                                          SYSDATE),''DD'')) -');
        Add('                      TO_NUMBER(TO_CHAR(DATACARGO,''DD''))');
        Add('                     ) /');
        Add('                     TO_NUMBER(DECODE(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                ''D'',DATADESLIGAMENTO,');
        Add('                                                SYSDATE),''DD''),');
        Add('                                      TO_CHAR(DATACARGO,''DD''),1,');
        Add('                                      ABS(');
        Add('                                        TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                            ''D'',DATADESLIGAMENTO,');
        Add('                                                            SYSDATE),''DD'')) -');
        Add('                                        TO_NUMBER(TO_CHAR(DATACARGO,''DD''))');
        Add('                                      )');
        Add('                     )),');
        Add('              -1,-1,');
        Add('              0');
        Add('    )) >= ' +IntToStr(TempoDeCargoInicial)+ ') AND');
      end;

      if (TempoDeCargoFinal < 999) then //Tempo no Cargo Final
      begin
        // Anos
        Add('  (');
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''YYYY'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATACARGO,''YYYY''))');
        Add('    ) * 12 +');
        // Meses
        Add('    (');
        Add('      TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                          ''D'',DATADESLIGAMENTO,');
        Add('                          SYSDATE),''MM'')) -');
        Add('      TO_NUMBER(TO_CHAR(DATACARGO,''MM''))');
        Add('    ) +');
        // Dias
        Add('    TO_NUMBER(DECODE((TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                          ''D'',DATADESLIGAMENTO,');
        Add('                                          SYSDATE),''DD'')) -');
        Add('                      TO_NUMBER(TO_CHAR(DATACARGO,''DD''))');
        Add('                     ) /');
        Add('                     TO_NUMBER(DECODE(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                ''D'',DATADESLIGAMENTO,');
        Add('                                                SYSDATE),''DD''),');
        Add('                                      TO_CHAR(DATACARGO,''DD''),1,');
        Add('                                      ABS(');
        Add('                                        TO_NUMBER(TO_CHAR(DECODE(TIPOSIT,');
        Add('                                                            ''D'',DATADESLIGAMENTO,');
        Add('                                                            SYSDATE),''DD'')) -');
        Add('                                        TO_NUMBER(TO_CHAR(DATACARGO,''DD''))');
        Add('                                      )');
        Add('                     )),');
        Add('              -1,-1,');
        Add('              0');
        Add('    )) <= ' +IntToStr(TempoDeCargoFinal)+ ') AND');
      end;

      if (FaixaSalarialInicial > 0) then // Faixa de Salário Inicial
      begin
        Add('  ((F.SALARIOATUAL * TO_NUMBER(DECODE(F.TIPOPAGAMENTO,');
        Add('                                 ''M'',1,');
        Add('                                 ''H'',JORNADAMENSAL,');
        Add('                                 30))');
        Add('   ) >= ' +IntToStr(FaixaSalarialInicial)+ ') AND');
      end;

      if (FaixaSalarialFinal < 99999999) then // Faixa de Salário Final
      begin
        Add('  ((F.SALARIOATUAL * TO_NUMBER(DECODE(F.TIPOPAGAMENTO,');
        Add('                                 ''M'',1,');
        Add('                                 ''H'',JORNADAMENSAL,');
        Add('                                 30))');
        Add('   ) <= ' +IntToStr(FaixaSalarialFinal)+ ') AND');
      end;

      Add('  (F.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+)) AND');
      Add('  (F.IDEMPRESA        = CC.IDEMPRESA(+)) AND');
    end
    else
    begin
      if (ListaIdCargo <> '') then
        Add('  (CD.IDCARGO ' +ListaIdCargo+ ') AND');

      if (FaixaSalarialInicial > 0) then // Faixa de Salário Inicial
      begin
        Add('  ((CD.SALARIO * TO_NUMBER(DECODE(CD.TIPOPAGAMENTO,');
        Add('                             ''M'',1,');
        Add('                             ''H'',220,');
        Add('                             30))');
        Add('   ) >= ' +IntToStr(FaixaSalarialInicial)+ ') AND');
      end;

      if (FaixaSalarialFinal < 99999999) then //Faixa de Salário Final
      begin
        Add('  ((CD.SALARIO * TO_NUMBER(DECODE(CD.TIPOPAGAMENTO,');
        Add('                             ''M'',1,');
        Add('                             ''H'',220,');
        Add('                             30))');
        Add('   ) <= ' +IntToStr(FaixaSalarialFinal)+ ') AND');
      end;

      Add('  (CD.IDPESSOA        = PF.IDPESSOA) AND');
      Add('  (CD.IDPESSOA        = P.IDPESSOA) AND');
    end;

    Add('  (P.IDPESSOA         = E.IDPESSOA(+)) AND');
    Add('  (P.IDENDRESIDENCIAL = E.IDENDERECO(+))');
    // Ordem da seleção
    Add('ORDER BY');
    if (MarcouFuncionario) then
      Add('  '+ORDEM_DADOS_FUNC[OrdemDados])
    else
      Add('  '+ORDEM_DADOS_CAND[OrdemDados]);
  end;

  if (AbrirCds) then
    AbrirCdsPrincipal
  else
  begin
    FCdsPrincipal.Data := GetDataPacket('SELECT '' '' AS EMPRESA FROM DUAL WHERE (1=2)');
    FCdsPrincipal.EmptyDataSet;
  end;  
end;

procedure TCtrlSelPessoal.AbrirCdsPrincipal;
begin
  FCdsPrincipal.Data := GetDataPacket(FSQL);
  SelRegistros;
end;

procedure TCtrlSelPessoal.SelRegistros;
var
  c: integer;
  sCEP: string;
  _CdsAux, _CdsCid_Est, _CdsCargo: TCMClientDataSet;
begin
  if (FCdsPrincipal.IsEmpty) then
    exit;

  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsCid_Est := TCMClientDataSet.Create(nil);
  _CdsCargo := TCMClientDataSet.Create(nil);

  try
    _CdsCid_Est.Data := FCtrlListTerceirosRH.ListCidadeEstado;
    _CdsCargo.Data := FCtrlCargo.ListCargo;

    _CdsAux.Data := FCdsPrincipal.Data;
    _CdsAux.First;
    FCdsPrincipal.EmptyDataSet;
    repeat
      // Comparar faixas de CEP
      if (FCEPInicial > 0) or (FCEPFinal < 99999) then
      begin
        sCEP := IntToStr(StrToIntDef(ValidaCaracteres(
          _CdsAux.FieldByName('CEP').asString,'N',''),0) div 1000);

        if ((FCEPInicial > 0) and (sCEP < IntToStr(FCEPInicial))) or
           ((FCEPFinal < 99999) and (sCEP > IntToStr(FCEPFinal))) then
        begin
          _CdsAux.Next;
          continue;
        end;
      end;

      FCdsPrincipal.Append;
      for c:=0 to _CdsAux.FieldCount-1 do
        FCdsPrincipal.Fields[c].Value := _CdsAux.Fields[c].Value;

      // Atualização da Cidade e UF
      if (_CdsAux.FieldByName('IDCIDADE_ENDERECO').asString <> '') then
      begin
        if (_CdsCid_Est.Locate('IDCIDADES',_CdsAux.FieldByName('IDCIDADE_ENDERECO').asString,[])) then
        begin
          FCdsPrincipal.FieldByName('CIDADE').asString := _CdsCid_Est.FieldByName('CIDADE').asString;
          FCdsPrincipal.FieldByName('UF').asString := _CdsCid_Est.FieldByName('CODESTADO').asString;
        end;
      end;

      // Atualização do Cargo
      if not(FUsaCargoAlternativo) or (_CdsAux.FieldByName('IDFUNCAO').IsNull) then
      begin
        if (_CdsCargo.Locate('IDCARGO', _CdsAux.FieldByName('IDCARGO').asFloat, [])) then
          FCdsPrincipal.FieldByName('TITULO').asString := _CdsCargo.FieldByName('TITULO').asString;
      end
      else
      if (_CdsCargo.Locate('IDCARGO', _CdsAux.FieldByName('IDFUNCAO').asFloat, [])) then
        FCdsPrincipal.FieldByName('TITULO').asString := _CdsCargo.FieldByName('TITULO').asString;

      FCdsPrincipal.Post;

      _CdsAux.Next;
    until (_CdsAux.EOF);
    FCdsPrincipal.First;
  finally
    _CdsAux.Free;
    _CdsCid_Est.Free;
    _CdsCargo.Free;
  end;
end;

end.
