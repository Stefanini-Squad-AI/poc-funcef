{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Rotina             : ListProcessos / ListIndicativoSusp / GetProxIdProcesso /
                      GetProxIdProcessosXIndicativoSusp /
                      ListProcessosXIndicativoSusp
 N. SIG             : 70569
 Data da Alteração: : 28/06/2018
 Alteração Form:    : fCadFilial
 Responsável:       : Everson Luiz Pereira da Cunha
 Descrição          : Melhorias no cadastro de processos para adequação a
                     versão 2.4.02 do manual do eSocial
--------------------------------------------------------------------------------
 Rotina             : GetProxIdProcesso, GetProxIdProcessosXIndicativoSusp
 N. SIG..........   : 62232
 Data da Alteração: : 06/02/2018
 Alteração Form:    : uCtrlPessoaFilialPessoa
 Responsável:       : Cássio Florêncio Rovaroto e Everson Luiz Pereira da Cunha
 Descrição.......   : Correção nas funcções que retornam o ID para a tabela
                     PROCESSOS e PROCESSOSXINIDCATIVOSUSP
--------------------------------------------------------------------------------
 Rotina             : Create, Destroy, DoChangeDataBase,
                      ListProcessosXIndicativoSusp, VerificaExistenciaProcesso,
                      VerificaExistenciaProcessoXIndicativo,
                      VerificaProcessoEstabelecimento,
                      GetProxIdProcessosXIndicativoSusp, GetProxIdProcesso,
                      ProcessaOutros, ListProcessos, ListIndicativoSusp
 N. SIG..........   : 38475.60441
 Data da Alteração: : 27/12/2017
 Alteração Form:    : uCtrlPessoaFilialPessoa
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Alteração no tratamento dos dados de possíveis processos.
--------------------------------------------------------------------------------
 Rotina             : ListDescLoctacaoTributaria
 N. SIG..........   : 38475.59823
 Data da Alteração: : 08/12/2017
 Alteração Form:    : uCtrlPessoaFilialPessoa
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Inclusão de função para recuperar a descrição da lotação
                      tributária.
--------------------------------------------------------------------------------
 Rotina:            ListTipoNatJurid, ListCodNatJurid, ListIndicativoSusp
 Nº SOL:            256943-17659
 Nº KINTANA:        1205530
 Data da Alteração: 26/01/2016
 Alteração Form:    Indicativo de suspensão de elegibilidade deve ser pesquisado
                    na tabela INDICATIVOSUSP. Criação ListTipoNatJurid e
                    ListCodNatJurid
 Responsável:       André Itiro Imakawa
 Descrição:         eSocial
--------------------------------------------------------------------------------
 Nº SOL:            256944/17800
 Nº PPM             1082911
 Data da Alteração: 27/10/2015
 Responsável:       Marcelo Cardoso
 Descrição:         Criação da aba ACT
--------------------------------------------------------------------------------
 Rotina:            ListProcessos, ProcessaOutros
 Nº SOL:            250383.17344
 Nº PPM             839025
 Data da Alteração: 25/06/2015
 Alteração Form:    eSocial, Criação e alteração dos metodos para aba processo.
 Responsável:       Higor Nayde
 Descrição:         deve ser adequada a folha de pagamento ao eSocial para
                    atendimento ao S1070 e S1299
--------------------------------------------------------------------------------
 Rotina:            ListProcessos, ProcessaOutros
 Nº SOL:            229871/16137
 Nº PPM             407073
 Data da Alteração: 20/08/2014
 Alteração Form:    eSocial, Criação e alteração dos metodos para aba processo.
 Responsável:       Felipe A. Santos
 Descrição:         deve ser adequada a folha de pagamento ao eSocial para
                    atendimento ao Ato Declaratório Executivo SUFIS nº 5,
                    de 17 de Julho de 2013 que aprova e divulga os leiautes
                    do eSocial.
--------------------------------------------------------------------------------}

{************************************************}
{                                                }
{ CM Soluções Informática                        }
{ ** Todos os Direitos Reservados                }
{ Analista Responsável: Raniere S. M. da Silva   }
{ Criado Em: 11/03/2002                          }
{                                                }
{************************************************}

unit uCtrlPessoaFilialPessoa;

interface

uses SysUtils, uSistema, CmEventosCadastro, uCMTypes, uCtrlPessoa, uCtrlCustomRH,
  uCtrlFuncoesRH, uDbFilialPessoa,
  uDbProcessos, uCMClientDataSet {Felipe A. Santos SOL 229871.16137}, uDbAcordoColetivo, {Marcelo Cardoso SOL:256944/17800 PPM:1082911}
  uDbProcessosXIndicativoSusp;

type
  TCtrlPessoaFilialPessoa = class(TCtrlCustomPessoaRH)
  protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
  private
    FDb: TDbFilialPessoa;
    FFU: TCtrlFuncoesRH;
    FDbProcessos: TDbProcessos; // Felipe A. Santos SOL 229871.16137 PPM 407073
    FCdsProcessos: TCMClientDataSet; // Felipe A. Santos SOL 229871.16137 PPM 407073
    FDbAcordoColetivo: TDbAcordoColetivo; // Marcelo Cardoso - SOL:256944/17800 PPM:1082911
    FCdsAcordoColetivo : TCMClientDataSet;  // Marcelo Cardoso - SOL:256944/17800 PPM:1082911
    FDbProcessosXindicativoSusp: TDbProcessosXIndicativoSusp;
    FCdsProcessosXIndicativoSusp: TCMClientDataSet;
  public

    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ListSubTipo(IdPessoa: double): OleVariant;
    function ListPessoaEstab(ListaIdEmpresa: string = ''): OleVariant;
    function ListEstabDaEmpresa(IdEmpresa: integer): OleVariant;
    function ListProcessos(IdPessoaFilial : double) : OleVariant; // Felipe A. Santos SOL 229871.16137 PPM 407073
    function ListCidades : OleVariant; // Felipe A. Santos SOL 229871.16137 PPM 407073
    function ListIndicativoSusp(tipo : Integer) : OleVariant;
    function ListAcordoColetivo(IdPessoaFilial : Double): OleVariant; //Marcelo Cardoso - SOL:256944/17800 PPM:1082911
    //function ListTipoNatJurid: OleVariant; // André Imakawa SOL 256943-17659 PPM 1205530               //Everson Cunha - SIG38475
    //function ListCodNatJurid(tipo: Integer): OleVariant; // André Imakawa SOL 256943-17659 PPM 1205530 //Everson Cunha - SIG38475

    function ListDescLoctacaoTributaria(pCodigo: string): String; //Cássio Rovaroto - SIG nº38475.59823
    //Cássio Rovaroto - SIG nº 38475.60441 - Início
    function ListProcessosXIndicativoSusp(rIdFilialPessoa: double): OleVariant;

    function VerificaExistenciaProcesso(pIdProcesso: integer): Boolean;
    function VerificaExistenciaProcessoXIndicativo(pIdProcessoxIndicativoSusp: integer): boolean;
    function VerificaProcessoEstabelecimento(pNumProcesso: string; pIdFilialPessoa: integer): Boolean;
    function GetProxIdProcessosXIndicativoSusp: integer;
    function GetProxIdProcesso: Integer;
    //Cássio Rovaroto - SIG nº 38475.60441 - Fim

    property CdsProcessos : TCMClientDataSet read FCdsProcessos write FCdsProcessos; // Felipe A. Santos SOL 229871.16137 PPM 407073
    property CdsProcessosXIndicativoSusp : TCMClientDataSet read FCdsProcessosXIndicativoSusp write FCdsProcessosXIndicativoSusp;
    property CdsAcordoColetivo : TCMClientDataSet read FCdsAcordoColetivo write FCdsAcordoColetivo;  // Marcelo Cardoso - SOL:256944/17800 PPM:1082911
  end;

implementation

{ TCtrlPessoaFilialPessoa }

constructor TCtrlPessoaFilialPessoa.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FDb := TDbFilialPessoa.Create(Self);
  FFU := TCtrlFuncoesRH.Create;

  FDbProcessos := TDbProcessos.Create(Self); // Felipe A. Santos SOL 229871.16137 PPM 407073
  FDbProcessosXindicativoSusp := TDbProcessosXIndicativoSusp.Create(Self); //Cássio Rovaroto - SIG nº 38475.6411

  FDbAcordoColetivo := TDbAcordoColetivo.Create(Self);  //Marcelo Cardoso - SOL:256944/17800 PPM:1082911
end;

destructor TCtrlPessoaFilialPessoa.Destroy;
begin
  FDb.Free;
  FFU.Free;
  FDbProcessos.Free; // Felipe A. Santos SOL 229871.16137 PPM 407073
  FreeAndNil(FDbAcordoColetivo); //INICIO - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
  FreeAndNil(FDbProcessosXindicativoSusp); //Cássio Rovaroto - SIG nº 38475.60411
  inherited;
end;

procedure TCtrlPessoaFilialPessoa.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FFU.DataBase := DataBase;
  FDbProcessos.DataBaseName := DataBaseName; // Felipe A. Santos SOL 229871.16137 PPM 407073
  FDbAcordoColetivo.DataBaseName := DataBaseName; //Marcelo Cardoso - SOL:256944/17800 PPM:1082911
  FDbProcessosXindicativoSusp.DataBaseName := DataBaseName; //Cássio Rovaroto - SIG nº 38475.60411
end;

procedure TCtrlPessoaFilialPessoa.AfterInitialize;
begin
  inherited;
  FFU.InitializeAs(Self);
end;

function TCtrlPessoaFilialPessoa.ListSubTipo(IdPessoa: double): OleVariant;
begin
  FDb.IdFilialPessoa.asFloat := Idpessoa;
  Result := GetDataPacket(FDb.sSqlSelect);
end;

function TCtrlPessoaFilialPessoa.ListPessoaEstab(ListaIdEmpresa: string): OleVariant;
var
  sSQL: string;
begin
  // Estabelecimento(s) habilitados para o usuário
  if (FUsuXFilial <> '') then
  begin
    if (Pos(',',FUsuXFilial) > 0) then
      sSQL := '  (PJ.IDPESSOA IN ' +FUsuXFilial+ ') AND'+CR_LF
    else
      sSQL := '  (PJ.IDPESSOA  = ' +FUsuXFilial+ ') AND'+CR_LF;
  end
  else
    sSQL := '';

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PJ.IDPESSOA, PJ.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PJ, FILIALPESSOA FP'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+
    FFU.IFF(ListaIdEmpresa = '', '(PJ.IDGRUPO IN (SELECT IDPESSOA FROM EMPRESAPROP)) AND',
      FFU.IFF(Pos(',', ListaIdEmpresa) > 0,
        '  (PJ.IDGRUPO       IN (' +ListaIdEmpresa+ ')) AND',
        '  (PJ.IDGRUPO        = ' +ListaIdEmpresa+ ') AND')+CR_LF)+
    '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)');
end;

function TCtrlPessoaFilialPessoa.ListEstabDaEmpresa(IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+

    FFU.IFF(FUsuXFilial<>'',
      FFU.IFF(Pos(',', FUsuXFilial)>0,
        '  (IDPESSOA IN ' + FUsuXFilial+ ') AND',
        '  (IDPESSOA  = ' + FUsuXFilial+ ') AND')+CR_LF, '')+

    '  (IDGRUPO  = ' +FloatToStr(IdEmpresa)+ ') OR'+CR_LF+
    '  (IDGRUPO IN (SELECT IDPESSOA'+CR_LF+
    '               FROM   PESSOA'+CR_LF+
    '               WHERE  (IDGRUPO = ' +FloatToStr(IdEmpresa)+ '))) OR'+CR_LF+
    '  (IDGRUPO IN (SELECT IDPESSOA'+CR_LF+
    '               FROM   PESSOA'+CR_LF+
    '               WHERE  (IDGRUPO IN (SELECT IDPESSOA'+CR_LF+
    '                                   FROM   PESSOA'+CR_LF+
    '                                   WHERE  (IDGRUPO = ' +FloatToStr(IdEmpresa)+ '))))) OR'+CR_LF+
    '  (IDGRUPO IN (SELECT IDPESSOA'+CR_LF+
    '               FROM   PESSOA'+CR_LF+
    '               WHERE  (IDGRUPO IN (SELECT IDPESSOA'+CR_LF+
    '                                   FROM   PESSOA'+CR_LF+
    '                                   WHERE  (IDGRUPO IN (SELECT IDPESSOA'+CR_LF+
    '                                                       FROM   PESSOA'+CR_LF+
    '                                                       WHERE  (IDGRUPO = ' +FloatToStr(IdEmpresa)+ ')))))))'+CR_LF+
    'ORDER BY UPPER(NOME)');
end;

function TCtrlPessoaFilialPessoa.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  if (Operacao = opApagar) then
  begin
    CdsSubTipo.Delete;
    Result := ApplyCds(CdsSubTipo, FDb, [_DbPessoa.IdPessoa], [FDb.IdFilialPessoa]); // Felipe A. Santos SOL 229871.16137 PPM 407073

    //Cássio Rovaroto - SIG nº 38745.60441 - Início
    Result := ApplyCds(CdsProcessosXIndicativoSusp, FDbProcessosXIndicativoSusp, [FDbProcessos.IdProcesso], [] );
    if not Result then Raise Exception.Create(FDbProcessosXIndicativoSusp.MessageInfo);

    // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
    //FCdsProcessos.First;
    //while not FCdsProcessos.Eof do FCdsProcessos.Delete;
    //Result := ApplyCds(FCdsProcessos, FDbProcessos, [FDb.IdFilialPessoa], [FDbProcessos.IdFilialPessoa]);
    // Felipe A. Santos SOL 229871.16137 PPM 407073 - Fim
    Result := ApplyCds(CdsProcessos, FDbProcessos, [], [] );
    if not Result then Raise Exception.Create(FDbProcessos.MessageInfo);
    //Cássio Rovaroto - SIG nº38475.60441 - Fim

    //INICIO - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
    FCdsAcordoColetivo.First;
    while not FCdsAcordoColetivo.Eof do FCdsAcordoColetivo.Delete;
    Result := ApplyCds(FCdsAcordoColetivo, FDbAcordoColetivo, [FDb.IdFilialPessoa], [FDbAcordoColetivo.IdFilialPessoa]);
    //FIM - Marcelo Cardoso - SOL:256944/17800 PPM:1082911

  end
  else
  begin
    Result := ApplyCds(CdsSubTipo, FDb, [_DbPessoa.IdPessoa], [FDb.IdFilialPessoa]);

    if not(Result) then
      Mensagem := FDb.MessageInfo;

    //Cássio Rovaroto - SIG nº 38475.60441 - Início
    // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
    //Result := ApplyCds(FCdsProcessos, FDbProcessos, [FDb.IdFilialPessoa], [FDbProcessos.IdFilialPessoa]);
    //if not(Result) then
    //   Mensagem := FDbProcessos.MessageInfo;

    // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim
    Result :=  ApplyCds(CdsProcessos, FDbProcessos, [FDb.Idfilialpessoa], [FDbProcessos.IdFilialPessoa] );
    if not Result then Raise Exception.Create(FDbProcessos.MessageInfo);

    Result :=  ApplyCds(CdsProcessosXIndicativoSusp, FDbProcessosXIndicativoSusp, [], [] );
    if not Result then Raise Exception.Create(FDbProcessos.MessageInfo);
    //Cássio Rovaroto - SIG nº 38475.60441 - Fim

    //INICIO - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
    Result := ApplyCds(FCdsAcordoColetivo, FDbAcordoColetivo, [FDb.IdFilialPessoa], [FDbAcordoColetivo.IdFilialPessoa]);

    if not(Result) then
       Mensagem := FDbAcordoColetivo.MessageInfo;
    // FIM - Marcelo Cardoso - SOL:256944/17800 PPM:1082911

    // gravação do novo cds
  end;

end;

// Felipe A. Santos SOL 229871.16137 PPM 407073 - início
function TCtrlPessoaFilialPessoa.ListProcessos(
  IdPessoaFilial: double): OleVariant;
var
   sSQL : String;
begin
   sSQL := 'SELECT P.IDPROCESSO, ' +
           '       P.IDFILIALPESSOA, ' +
           '       P.TIPO,           ' +
           '       P.NUMERO,         ' +
           //'       P.INDICATDECISAO, ' + Everson Cunha - SIG70569
           //'       P.INDICATDEPOSITO, ' +
           '       P.CODIDENTVARA, ' +
           '       P.CONTRIABRANDECISAO, ' +
           '       P.EXTENDECISAO, ' +
           '       P.PROCADMJUD, ' + // Felipe A. Santos - SOL229871.16624 PPM 557813
           '       P.DATAINICIO, ' + //Marcelo Cardoso - SOL:256944/17800 PPM:1082911
           '       P.DATAFIM,    ' + //Marcelo Cardoso - SOL:256944/17800 PPM:1082911
           '       P.CODMATPROC, ' + //Cássio Rovaroto - SIG nº 38475.60441
//           '       DECODE(P.TIPO, ''A'', ''Administrativo'', ''J'',''Judicial'', ''Núm. Benefício'') AS TIPO2, ' +    //Everson Luiz SIG70569
           '       DECODE(P.TIPO, ''A'', ''Administrativo'', ''J'',''Judicial'', ''N'', ''Número de Benefício (NB) do INSS'', ''F'', ''Processo FAP de exercício anterior a 2019'', P.TIPO) AS TIPO2, ' + //Everson Luiz SIG70569

           //Everson Cunha - SIG70569 - Início
           {'       DECODE(P.INDICATDECISAO, 1, ''Definitiva (Transitada em Julgado)'', ' +
           '                              	2, ''Decisão não Transitada em Julgado com Efeito Suspensivo'', ' +
           '	                          		3, ''Liminar em Mandado de Segurança'', ' +
				   '                              	4, ''Liminar ou tutela antecipada, em outras espécies de ação judicial'', ' +
	   			 '                              	5, ''Contestação Administrativa'', ' +
           '                              	9, ''Outros'') AS INDICATDECISAO2, ' +    }
           //Everson Cunha - SIG70569 - Fim

           '       DECODE(P.CONTRIABRANDECISAO, 1, ''IRRF'', ' +
           '                                  	2, ''Contribuição Previdenciária do Trabalhador'',' +
           '                                  	3,''FGTS'','+                    // André Imakawa SOL 256943-17659 PPM 1205530
           '                                  	4,''Contribuição Sindical'''+    // André Imakawa SOL 256943-17659 PPM 1205530
           '             ) AS CONTRIABRANDECISAO2, ' +
           //'       DECODE(P.EXTENDECISAO, 1, ''Contrib. Patronais'', ' +
           //'	                        		2, ''Contrib. Patronais + Segurados'') AS EXTENDECISAO2, ' +
           //'       DECODE(P.INDICATDEPOSITO, 1, ''Sim'', ''Não'') AS INDICATDEPOSITO2, ' +
           '       DECODE(P.PROCADMJUD, 1, ''RAT'',  ' +
           '                            2, ''FAP'') AS PROCADMJUD2, ' +  // Felipe A. Santos - SOL229871.16624 PPM 557813
           '       P.IDCIDADES, ' +
           '       C.NOME AS NOMECIDADE, ' +
           '       C.CODESTADO AS UF, ' +
           '       C.CODMUNICIPIO,'+
           '       P.AUTORACAO, '+    //Higor Nayde SOL 250383.17344 Nº PPM             839025
           //'       P.IDINDICATIVOSUSP, '+      // André Imakawa SOL 256943-17659 PPM 1205530
           //'       I.DESCRICAO AS IDINDICATIVOSUSP2, '+  // André Imakawa SOL 256943-17659 PPM 1205530
           '       DECODE(P.EXTENDECISAO, 1, ''Contribuição Previdenciária Patronal'',                     '+  // André Imakawa SOL 256943-17659 PPM 1205530
           '                              2, ''Contribuição Previdenciária Patronal + Descontada dos Segurados'',         '+  // André Imakawa SOL 256943-17659 PPM 1205530
           '                               '''') AS EXTENDECISAO2,                       '+  // André Imakawa SOL 256943-17659 PPM 1205530

           //Everson Luiz SIG70569 - Início
           {'       P.APURFAP, '+       //Higor Nayde SOL 250383.17344 Nº PPM 839025
           '       DECODE(P.APURFAP, 1, ''FAP atribuído à Empresa	'',              '+  // André Imakawa SOL 256943-17659 PPM 1205530
           '                         2, ''FAP atribuído a cada Estabelecimento'',   '+  // André Imakawa SOL 256943-17659 PPM 1205530
           '                         '''') AS APURFAP2,                            '+  // André Imakawa SOL 256943-17659 PPM 1205530
           }//Everson Luiz SIG70569 - Fim


           '       DECODE(P.AUTORACAO, ''S'', ''Sim'',''N'', ''Não'', '''') AS AUTORACAO2, '+  // André Imakawa SOL 256943-17659 PPM 1205530
           //Cássio Rovaroto - SIG nº 38475.60441 - Início
           '       CASE P.CODMATPROC '+
					 '  				  WHEN 1  THEN ''Exclusivamente tributária ou tributária e FGTS'' '+
           ' 					  WHEN 2  THEN ''Autorização de trabalho de menor'' '+
           '  					WHEN 3  THEN ''Dispensa, ainda que parcial, de contratação de pessoa com deficiência (PCD)'' '+
           '  					WHEN 4  THEN ''Dispensa, ainda que parcial, de contratação de aprendiz'' '+
					 '  					WHEN 5  THEN ''Segurança e Saúde do Trabalho'' '+
					 '  					WHEN 6  THEN ''Conversão de Licença Saúde em Acidente de Trabalho'' '+
					 '  					WHEN 7  THEN ''Exclusivamente FGTS e/ou Contribuição Social Rescisória (Lei Complementar 110/2001)'' '+
					 '  					WHEN 8  THEN ''Contribuição Sindical'' '+
					 '  					WHEN 99 THEN ''Outros assuntos'' '+
					 '				END AS CODMATPROCDESC2 '+
           '  FROM PROCESSOS P, CIDADES C '+ //, INDICATIVOSUSP I ' +   // André Imakawa SOL 256943-17659 PPM 1205530
           ' WHERE P.IDFILIALPESSOA = ' + FloatToStr(IdPessoaFilial) +
           //'   AND P.IDINDICATIVOSUSP = I.IDINDICATIVOSUSP (+) '+  // André Imakawa SOL 256943-17659 PPM 1205530
           '   AND P.IDCIDADES = C.IDCIDADES';
           //Cássio Rovaroto - SIG nº 38475.60441 - Fim
   Result := GetDataPacket(sSQL);
end;
// Felipe A. Santos SOL 229871.16137 PPM 407073 - fim

// INICIO - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
function TCtrlPessoaFilialPessoa.ListAcordoColetivo(IdPessoaFilial : Double): OleVariant;
var
    sSQL : String;
begin
    sSQL := 'SELECT A.IDACORDOCOLETIVO,' + #13#10 +
            ' A.IDFILIALPESSOA,' + #13#10 +
            //' A.DTCOMPETENCIA, ' + #13#10 + //Everson Cunha - SIG38475
            ' A.DTASSINATURA,' + #13#10 +
            '       DECODE(A.TIPOACORDO,''A'', ''Acordo Coletivo de Trabalho'',' + #13#10 +
            '                           ''B'', ''Legislação federal, estadual, municipal ou distrital'',' + #13#10 +
            '                           ''C'', ''Convenção Coletiva de Trabalho'',' + #13#10 +
            '                           ''D'', ''Sentença normativa - Dissídio'',' + #13#10 +
            '                           ''E'', ''Conversão de licença saúde em acidente de trabalho'',' + #13#10 +
            '                           ''G'', ''Antecipação de diferenças de acordo, convenção ou dissídio coletivo'',' + #13#10 + //Everson Cunha - SIG38475
            '                           ''H'', ''Recolhimento mensal de FGTS anterior ao início de obrigatoriedade dos eventos periódicos'')' + #13#10 + //Everson Cunha - SIG38475
            '                            TIPOACORDODESC' + #13#10 +
            ' , A.TIPOACORDO ' + #13#10 +
            '  FROM FILIALPESSOA F, ACORDOCOLETIVO A' + #13#10 +
            ' WHERE A.IDFILIALPESSOA = F.IDFILIALPESSOA' + #13#10 +
            '   AND F.IDFILIALPESSOA =' + FloatToStr(IdPessoaFilial) + #13#10 +
            //' ORDER BY A.DTCOMPETENCIA DESC'; //Everson Cunha - SIG38475
            ' ORDER BY A.DTASSINATURA DESC';    //Everson Cunha - SIG38475

     Result := GetDataPacket(sSQL);
end;
// FIM - Marcelo Cardoso - SOL:256944/17800 PPM:1082911

// Felipe A. Santos SOL 229871.16137 PPM 407073 - início
function TCtrlPessoaFilialPessoa.ListCidades: OleVariant;
var
   sSQL : string;
begin
   sSQL := 'SELECT * FROM CIDADES ORDER BY NOME';

   Result := GetDataPacket(sSQL);
end;
// Felipe A. Santos SOL 229871.16137 PPM 407073 - fim

function TCtrlPessoaFilialPessoa.ListIndicativoSusp(
  tipo: Integer): OleVariant;
  var
   sSQL : string;
begin
  //Higor Nayde SOL 250383.17344 Nº PPM             839025
  sSQL :=    'SELECT IDINDICATIVOSUSP, INDSUSP, TIPO, DESCRICAO FROM INDICATIVOSUSP WHERE 1 = 1 '; // André Imakawa SOL 256943-17659 PPM 1205530

  //Cássio Rovaroto -  SIG nº38475.60441 - Início
  //if tipo then begin

  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  //sSQL := sSQL + ' AND TIPO = ''A''';

  {
   sSQL := ('select 5 as  cod,''Depósito Administrativo no Montante Integral'' as nome from dual union             '+
            'select 14 as cod,''Contestação Administrativa FAP'' as nome from dual union                          '+
            'select 90 as cod,''Decisão Definitiva a favor do contribuinte (Transitada em Julgado)'' as nome from dual union   '+
            'select 91 as cod,''Solução de Consulta Interna da RFB'' as nome from dual union                      '+
            'select 92 as cod,''Sem suspensão da exigibilidade'' as nome from dual');
  }

  //end else begin

  //sSQL := sSQL + ' AND TIPO = ''J''';
  {
   sSQL := ('select 01 as  cod,''Liminar em Mandado de Segurança'' as nome from dual union             '+
           'select 02 as  cod,''Depósito Judicial no montante integral'' as nome from dual union             '+
           'select 03 as  cod,''Antecipação de Tutela'' as nome from dual union             '+
           'select 04 as  cod,''Liminar em Medida Cautelar'' as nome from dual union             '+
           'select 08 as  cod,''Sentença em Mandado de Segurança Favorável ao Contribuinte'' as nome from dual union             '+
           'select 09 as  cod,''Sentença em Ação Ordinária Favorável ao Contribuinte e Confirmada pelo TRF'' as nome from dual union             '+
           'select 10 as  cod,''Acórdão do TRF Favorável ao Contribuinte'' as nome from dual union             '+
           'select 11 as  cod,''Acórdão do STJ em Recurso Especial Favorável ao Contribuinte'' as nome from dual union             '+
           'select 12 as  cod,''Acórdão do STF em Recurso Extraordinário Favorável ao Contribuinte'' as nome from dual union             '+
           'select 13 as  cod,''Sentença 1ª instância não transitada em julgado com efeito suspensivo'' as nome from dual union             '+
           'select 90 as  cod,''Decisão Definitiva a favor do contribuinte (Transitada em Julgado)'' as nome from dual union             '+
           'select 92 as  cod,''Sem suspensão da exigibilidade'' as nome from dual              ');
  }
  // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
  //end;
  case tipo of
  	0: sSQL := sSQL + ' AND TIPO = ''A''';
  	1: sSQL := sSQL + ' AND TIPO = ''J''';
  	//2: sSQL := sSQL + ' AND TIPO = ''N'''; //Everson Cunha - SIG38475
   	2: sSQL := sSQL + ' AND TIPO = ''F'''; //Everson Luiz SIG70569
  end;
  //Cássio Rovaroto -  SIG nº38475.60441 - Fim

   Result := GetDataPacket(sSQL);
   //Higor Nayde SOL 250383.17344 Nº PPM             839025
end;


// André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
//Everson Cunha - SIG38475 - Ini
{
function TCtrlPessoaFilialPessoa.ListTipoNatJurid: OleVariant;
Var
   sSql: String;
Begin
   sSql := ' SELECT DISTINCT TIPO, DESCTIPO FROM NATJURIDICA  '+
           ' ORDER BY DESCTIPO ';
   Result := GetDataPacket(sSql);
end;

function TCtrlPessoaFilialPessoa.ListCodNatJurid(tipo: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := ' SELECT IDNATJURIDICA, CODIGO, SUBSTR(DESCRICAO, 0,150) AS DESCRICAO, ' +
           ' TIPO, DESCTIPO        '+
           ' FROM NATJURIDICA  '+
           ' WHERE 1 = 1 ';
   if tipo <> 0 then
   begin
        sSql := sSql + ' AND (TIPO = ' + IntToStr(tipo) + ' )';
   end;
   Result := GetDataPacket(sSql);
end;}
//Everson Cunha - SIG38475 - Fim
// André Imakawa SOL 256943-17659 PPM 1205530 - Fim

function TCtrlPessoaFilialPessoa.GetProxIdProcesso: Integer;
var
  _cds: TCMClientDataSet;
begin
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
  _cds := TCMClientDataSet.Create(nil);
  try
    //Cássio Rovaroto - SIG 62232 - Início
		//_cds.Data:= GetDataPacket('SELECT MAX(IDPROCESSO)+1 AS IDPROCESSO FROM PROCESSOS');
//    _cds.Data:= GetDataPacket('SELECT NVL(MAX(IDPROCESSO),0)+1 AS IDPROCESSO FROM PROCESSOS'); //Everson Luiz SIG70569
    _cds.Data:= GetDataPacket('SELECT CM.SEQPROCESSOS.NEXTVAL IDPROCESSO FROM DUAL');            //Everson Luiz SIG70569
    //Cássio Rovaroto - SIG 62232 - Fim
  	Result:= _cds.FieldByName('IDPROCESSO').asInteger;
  finally
  	FreeAndNil(_cds);
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

function TCtrlPessoaFilialPessoa.GetProxIdProcessosXIndicativoSusp: integer;
var
  _Cds: TCMClientDataSet;
begin
	//Cássio Rovaroto - SIG nº 38475.60441 - Início
  _Cds := TCMClientDataSet.Create(nil);
   try
    //Cássio Rovaroto - SIG 62232 - Início
		//_Cds.Data := GetDataPacket('SELECT MAX(IDPROCESSOSXINDICATIVOSUSP)+1 AS IDPROCESSOSXINDICATIVOSUSP FROM PROCESSOSXINDICATIVOSUSP');
//    _Cds.Data := GetDataPacket('SELECT NVL(MAX(IDPROCESSOSXINDICATIVOSUSP),0)+1 AS IDPROCESSOSXINDICATIVOSUSP FROM PROCESSOSXINDICATIVOSUSP'); //Everson Luiz SIG70569
    _Cds.Data := GetDataPacket('SELECT CM.SEQPROCESSOSXINDICATIVOSUSP.NEXTVAL IDPROCESSOSXINDICATIVOSUSP FROM DUAL');                            //Everson Luiz SIG70569
    //Cássio Rovaroto - SIG 62232 - Fim
  	Result := _Cds.FieldByName('IDPROCESSOSXINDICATIVOSUSP').asInteger;
  finally
  	FreeAndNil(_Cds);
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

function TCtrlPessoaFilialPessoa.ListProcessosXIndicativoSusp(
  rIdFilialPessoa: Double): OleVariant;
begin
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
	Result:= GetDataPacket('SELECT PI.IDPROCESSOSXINDICATIVOSUSP, ' +
    										 '       PI.IDPROCESSO,                 ' +
    										 '		   PI.IDINDICATIVOSUSP, 	   			' +
                         '       IV.DESCRICAO AS INDICATIVO,    ' +
       					   			 '		   PI.DATADECISAO, 			   				' +
       					   			 '		   PI.INDICATDEPOSITO, 		   			' +
//                         '	     DECODE(PI.INDICATDEPOSITO, 0, ''Sim'', ''Não'') AS DEPOSITO ' + //Everson Luiz - SIG70569
                         '	     DECODE(PI.INDICATDEPOSITO, 1, ''Sim'', ''Não'') AS DEPOSITO ' +   //Everson Luiz - SIG70569
  						   				 '  FROM PROCESSOSXINDICATIVOSUSP PI 		'+
                         '  JOIN INDICATIVOSUSP IV ON IV.IDINDICATIVOSUSP = PI.IDINDICATIVOSUSP ' +
                         '  JOIN PROCESSOS PS ON PS.IDPROCESSO = PI.IDPROCESSO AND PS.IDFILIALPESSOA = ' + FloatToStr(rIdFilialPessoa));
	//Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

function TCtrlPessoaFilialPessoa.VerificaExistenciaProcesso(
  pIdProcesso: integer): Boolean;
var
  cdsAux: TCMClientDataSet;
begin
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
  cdsAux:= TCMClientDataSet.Create(nil);
  try
		cdsAux.Data:= GetDataPacket('SELECT IDPROCESSO FROM PROCESSOS ' +
                              'WHERE IDPROCESSO = ' + IntToStr(pIdProcesso));
  	Result:= not cdsAux.IsEmpty;
  finally
  	FreeAndNil(cdsAux);
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim

end;

function TCtrlPessoaFilialPessoa.VerificaExistenciaProcessoXIndicativo(
  pIdProcessoxIndicativoSusp: integer): boolean;
var
  cdsAux: TCMClientDataSet;
begin
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
  cdsAux:= TCMClientDataSet.Create(nil);
  try
		cdsAux.Data:= GetDataPacket('SELECT IDPROCESSO FROM PROCESSOSXINDICATIVOSUSP ' +
                              'WHERE IDPROCESSOSXINDICATIVOSUSP = ' + IntToStr(pIdProcessoxIndicativoSusp));
  	Result:= not cdsAux.IsEmpty;
  finally
  	FreeAndNil(cdsAux);
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
  
end;

function TCtrlPessoaFilialPessoa.VerificaProcessoEstabelecimento(
  pNumProcesso: string; pIdFilialPessoa: integer): Boolean;
var
	cdsProcessosEstabelecimento : TCMClientDataSet;
begin
   //Cássio Rovaroto - SIG nº 38475.60441 - Início
   cdsProcessosEstabelecimento := TCMClientDataSet.Create(nil);
   try
    cdsProcessosEstabelecimento.Data := GetDataPacket('SELECT COUNT(IDPROCESSO) AS COUNT_ID FROM PROCESSOS WHERE NUMERO = ' + QuotedStr(pNumProcesso) +
    						      //' AND IDFUNCIONARIO = ' + IntToStr(pIdFilialPessoa));  //Everson Cunha - SIG70569
                                                      ' AND IDFILIALPESSOA = ' + IntToStr(pIdFilialPessoa));   //Everson Cunha - SIG70569
    Result := cdsProcessosEstabelecimento.FieldByName('COUNT_ID').asInteger > 0;
   finally
    FreeAndNil(cdsProcessosEstabelecimento);
   end;
   //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

function TCtrlPessoaFilialPessoa.ListDescLoctacaoTributaria(
  pCodigo: string): String;
var
	cdsAux: TCMClientDataSet;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  Result := '';

  try
    cdsAux.Data := GetDataPacket('SELECT CODLOTACAOESOCIAL, DESCRICAO FROM LOTACAOESOCIAL WHERE CODLOTACAOESOCIAL = ' + pCodigo) ;
    Result := cdsAux.FieldByName('DESCRICAO').AsString;
  finally
    FreeAndNil(cdsAux);
  end;
           
end;

end.
