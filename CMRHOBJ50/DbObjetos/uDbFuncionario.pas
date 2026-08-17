{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
Rotina             : frmResciContr
N. SIG..........   : 38475.84907
Data da Alteração: : 16/04/2019
Alteração Form:    : uDbFuncionario
Responsável:       : Everson Cunha
Descrição.......   : Inclusão dos campos TIPOAVISOPREV, DATACANCEL_AVISOPREV e
                     MOTIVOCANCEL_AVISOPREV. Migrados da tabela CM.AVISOPREV,
                     que terá sua funcionalidade descontinuada.
                     Criado o campo PERCPENSAORESC
--------------------------------------------------------------------------------
Rotina             : Create
N. SIG..........   : 38475.60440
Data da Alteração: : 20/12/2017
Alteração Form:    : uDbFuncionario
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Inclusão do tratamento para os campos FLGPENSAORESC
                     e VLRPENSAORESC.
--------------------------------------------------------------------------------
Rotina             : Create
N. SIG..........   : 38475.59780
Data da Alteração: : 13/12/2017
Alteração Form:    : uDbFuncionario
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Alteração das propriedades do campo PERCENTUAL.
--------------------------------------------------------------------------------
Nº SOL............: 250387/17326
Nº PPM............: 832518
Data da Alteração.: 01/07/2015
Alteração Form....: Incluir campo "DTFIMQUAR".
Responsável.......: Felipe A. Santos
Descrição.........: Desenvolvimento do produto referente ao SOL 250387.
--------------------------------------------------------------------------------
Nº SOL............: 229881.16648
Nº PPM............: 565999
Data da Alteração.: 20/02/2015
Alteração Form....: Incluir campos "ATESTADOOBITO", "PROCESSOTRAB"
                    e "DATATERMINOAVISO";
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 229881.
--------------------------------------------------------------------------------
Nº SOL............: 211502.16259
Nº PPM............: 442499
Data da Alteração.: 28/10/2014
Alteração Form....: Incluir campos "SITRECISAO", "FLGRESSALVA", "DESCRESSALVA"
                    e "IDIMGRECISAO";
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 211502.
--------------------------------------------------------------------------------
Nº SOL:            229871/16137
Nº PPM:            407073
Data da Alteração: 02/10/2014
Alteração Form:    Inclusão dos campos IdEstagiario, IdGrauExpAgenteSocial,
                   IdDadosCessao, IdCategTrabaeSocial.
Responsável:       Felipe A. Santos
Descrição:         Inclusão dos campos IdEstagiario, IdGrauExpAgenteSocial,
                   IdDadosCessao, IdCategTrabaeSocial
--------------------------------------------------------------------------------
Nº SOL......: 201365
Nº KINTANA..: 1965590
Data........: 23/07/2013
Responsável.: William Gonçalves de Santana
Descrição...: Incluir campos "PERCRATALIMENTACAO" e "PERCRATREFEICAO";
--------------------------------------------------------------------------------
Nº SOL......: 188194
Nº KINTANA..: 1779198
Data........: 08/04/2013
Responsável.: Higor Nayde Ferreira
Descrição...: Incluir novos campos das telas de Registro de Alteração Funcional
              e Cadastro de Pessoal
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 144594
Nº KINTANA..: 954455
Data........: 08/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Incluir campos "FLGPENSAO" e "PERCENTUAL";
--------------------------------------------------------------------------------}

// ATUALIZAÇÕES

//Rotina............: Create
//N. Sol.............: 103661
//N. Kintana......: 472575
//Data...............: 20/02/2009
//Responsável...: Ricardo Alves
//Descrição........: Adicionado campo NUMCRACHA
//

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 02/08/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFuncionario;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbFuncionario = class(TCmDbObject)
  private
    FNivelindiv1: TCmDbField;
    FIdagenciafgts: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FDatacargo: TCmDbField;
    FTipoMaoDeObra: TCmDbField;
    FIdestab: TCmDbField;
    FIdcargo: TCmDbField;
    FIdpessoa: TCmDbField;
    FHomologacaonumero: TCmDbField;
    FSalarioatual: TCmDbField;
    FIdformaresc: TCmDbField;
    FIdempresa: TCmDbField;
    FIdvincempreg: TCmDbField;
    FNumcontafgts: TCmDbField;
    FIdfaixacargo: TCmDbField;
    FIdmotivodesligrais: TCmDbField;
    FFlgtipofgts: TCmDbField;
    FIdsitrisco: TCmDbField;
    FDatalotacao: TCmDbField;
    FNivelindiv2: TCmDbField;
    FHomologacaoorgao: TCmDbField;
    FIdagenciasalario: TCmDbField;
    FMatricula: TCmDbField;
    FDatadesligamento: TCmDbField;
    FIdfaixafuncao: TCmDbField;
    FIdsitfunc: TCmDbField;
    FIdmotivodesliggerencial: TCmDbField;
    FDataadmissao: TCmDbField;
    FDatafimcontrato: TCmDbField;
    FDatarefhorario: TCmDbField;
    FIdchefe: TCmDbField;
    FIdfuncao: TCmDbField;
    FDatacargo2: TCmDbField;
    FDataretorno: TCmDbField;
    FIdafastrais: TCmDbField;
    FDuracaocontrato: TCmDbField;
    FIddeposgre: TCmDbField;
    FProrrogcontrato: TCmDbField;
    FIdmovcontrcaged: TCmDbField;
    FDataaviso: TCmDbField;
    FIdprocessodem: TCmDbField;
    FIdtipotrab: TCmDbField;
    FDatasalario: TCmDbField;
    FNumcontasalario: TCmDbField;
    FValorFGTS: TCmDbField;
    FQuantidadefgts: TCmDbField;
    FSalariotipo: TCmDbField;
    FIdcatemprgre: TCmDbField;
    FIdhorario: TCmDbField;
    FTipocontrato: TCmDbField;
    FCodarrumadeira: TCmDbField;
    FDataopcaofgts: TCmDbField;
    FTipoPagamento: TCmDbField;
    FFlgMarcaPonto: TCmDbField;

    // Ricardo A. SOL: 103661 KTN: 472575
    FNumCracha: TCmDbField;

    // Thaise SOL 144594 - Criação dos novos campos
    //FPercentual: TCmDbField;//Everson Cunha - SIG38475
    //FflgPensao: TCmDbField; //Everson Cunha - SIG38475
	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    FFuncao       : TCmDbField;
    FDataFuncao   : TCmDbField;
    FSalarioFuncao: TCmDbField;
	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198

    //WIlliam Santana SOL: 201365 - KINTANA: 1965590
    FPercRatRefeicao: TCmDbField;
    FPercRatAlimentacao: TCmDbField;
    //END - WIlliam Santana SOL: 201365 - KINTANA: 1965590

    //Início - William Santana - SOL 211502.16259 PPM 442499
    FSitRecisao: TCmDbField;
    FFlgRessalva: TCmDbField;
    FDescRessalva: TCmDbField;
    FIdImgRecisao: TCmDbField;
    //Término - William Santana - SOL 211502.16259 PPM 442499

    // Felipe A. Santos SOL 229871.16137
    FIdEstagiario: TCmDbField;
    FIdGrauExpAgenteSocial: TCmDbField;
    FIdDadosCessao: TCmDbField;
    FIdCategTrabaeSocial: TCmDbField;
    // Felipe A. Santos SOL 229871.16137 - fim

    //Início - William Santana - SOL 229881.16648 PPM 565999
    //FAtestadoobito: TCmDbField; //Everson Cunha - SIG38475
    FProcessotrab: TCmDbField;
    FDataterminoaviso: TCmDbField;

    //Término - William Santana - SOL 229881.16648 PPM 565999

    // Felipe A. Santos SOL 250387/17326 PPM 832518 {Fim FDtFimQuar}
    FDtFimQuar: TCmDbField;
    //Cássio Rovaroto - SIG nº 38475.60440 - Início
    FFlgPensaoResc: TCmDbField;
    FVlrPensaoResc: TCmDbField;
    FTipoAvisoPrevio: TCmDbField;
    FDataCancelAvisoPrevio: TCmDbField;
    FMotivoCancelAvisoPrevio: TCmDbField;
    FPercPensaoResc: TCmDbField;

    // WO 11098 - Folha de Pagamento - Cadastro de Pessoal - Seguro vida Grupo
    // Arnaldo V. Scarin
    FflgOptanteSeguroVidaGrupo: TCmDbField;
    procedure SetTipoAvisoPrevio(const Value: TCmDbField);
    procedure SetDataCancelAvisoPrevio(const Value: TCmDbField);
    procedure SetMotivoCancelAvisoPrevio(const Value: TCmDbField);
    procedure SetPercPensaoResc(const Value: TCmDbField);

    // WO 11098 - Folha de Pagamento - Cadastro de Pessoal - Seguro vida Grupo
    // Arnaldo V. Scarin
    procedure SetflgOptanteSeguroVidaGrupo(const Value: TCmDbField);
    //Cássio Rovaroto - SIG nº 38475.60440 - Fim
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property ValorFGTS: TCmDbField read FValorFGTS write FValorFGTS;
    property TipoPagamento: TCmDbField read FTipoPagamento write FTipoPagamento;
    property TipoMaoDeObra: TCmDbField read FTipoMaoDeObra write FTipoMaoDeObra;
    property Tipocontrato: TCmDbField read FTipocontrato write FTipocontrato;
    property Salariotipo: TCmDbField read FSalariotipo write FSalariotipo;
    property Salarioatual: TCmDbField read FSalarioatual write FSalarioatual;
    property Quantidadefgts: TCmDbField read FQuantidadefgts write FQuantidadefgts;
    property Prorrogcontrato: TCmDbField read FProrrogcontrato write FProrrogcontrato;
    property Numcontasalario: TCmDbField read FNumcontasalario write FNumcontasalario;
    property Numcontafgts: TCmDbField read FNumcontafgts write FNumcontafgts;
    property Nivelindiv2: TCmDbField read FNivelindiv2 write FNivelindiv2;
    property Nivelindiv1: TCmDbField read FNivelindiv1 write FNivelindiv1;
    property Matricula: TCmDbField read FMatricula write FMatricula;
    property Idvincempreg: TCmDbField read FIdvincempreg write FIdvincempreg;
    property Idtipotrab: TCmDbField read FIdtipotrab write FIdtipotrab;
    property Idsitrisco: TCmDbField read FIdsitrisco write FIdsitrisco;
    property Idsitfunc: TCmDbField read FIdsitfunc write FIdsitfunc;
    property Idprocessodem: TCmDbField read FIdprocessodem write FIdprocessodem;
    property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
    property Idmovcontrcaged: TCmDbField read FIdmovcontrcaged write FIdmovcontrcaged;
    property Idmotivodesligrais: TCmDbField read FIdmotivodesligrais write FIdmotivodesligrais;
    property Idmotivodesliggerencial: TCmDbField read FIdmotivodesliggerencial write FIdmotivodesliggerencial;
    property Idhorario: TCmDbField read FIdhorario write FIdhorario;
    property Idfuncao: TCmDbField read FIdfuncao write FIdfuncao;
    property Idformaresc: TCmDbField read FIdformaresc write FIdformaresc;
    property Idfaixafuncao: TCmDbField read FIdfaixafuncao write FIdfaixafuncao;
    property Idfaixacargo: TCmDbField read FIdfaixacargo write FIdfaixacargo;
    property Idestab: TCmDbField read FIdestab write FIdestab;
    property Idempresa: TCmDbField read FIdempresa write FIdempresa;
    property Iddeposgre: TCmDbField read FIddeposgre write FIddeposgre;
    property Idchefe: TCmDbField read FIdchefe write FIdchefe;
    property Idcatemprgre: TCmDbField read FIdcatemprgre write FIdcatemprgre;
    property Idcargo: TCmDbField read FIdcargo write FIdcargo;
    property Idagenciasalario: TCmDbField read FIdagenciasalario write FIdagenciasalario;
    property Idagenciafgts: TCmDbField read FIdagenciafgts write FIdagenciafgts;
    property Idafastrais: TCmDbField read FIdafastrais write FIdafastrais;
    property Homologacaoorgao: TCmDbField read FHomologacaoorgao write FHomologacaoorgao;
    property Homologacaonumero: TCmDbField read FHomologacaonumero write FHomologacaonumero;
    property Flgtipofgts: TCmDbField read FFlgtipofgts write FFlgtipofgts;
    property Duracaocontrato: TCmDbField read FDuracaocontrato write FDuracaocontrato;
    property Datasalario: TCmDbField read FDatasalario write FDatasalario;
    property Dataretorno: TCmDbField read FDataretorno write FDataretorno;
    property Datarefhorario: TCmDbField read FDatarefhorario write FDatarefhorario;
    property Dataopcaofgts: TCmDbField read FDataopcaofgts write FDataopcaofgts;
    property Datalotacao: TCmDbField read FDatalotacao write FDatalotacao;
    property Datafimcontrato: TCmDbField read FDatafimcontrato write FDatafimcontrato;
    property Datadesligamento: TCmDbField read FDatadesligamento write FDatadesligamento;
    property Datacargo2: TCmDbField read FDatacargo2 write FDatacargo2;
    property Datacargo: TCmDbField read FDatacargo write FDatacargo;
    property Dataaviso: TCmDbField read FDataaviso write FDataaviso;
    property Dataadmissao: TCmDbField read FDataadmissao write FDataadmissao;
    property Codcentrocusto: TCmDbField read FCodcentrocusto write FCodcentrocusto;
    property Codarrumadeira: TCmDbField read FCodarrumadeira write FCodarrumadeira;
    property FlgMarcaPonto: TCmDbField read FFlgMarcaPonto write FFlgMarcaPonto;

    // Ricardo A. SOL: 103661 KTN: 472575
    property NumCracha: TCmDbField read FNumCracha write FNumCracha;

    // Thaise SOL 144594 - Criação dos novos campos
    //property Percentual: TCmDbField read FPercentual write FPercentual; //Everson Cunha - SIG38475
    //property flgPensao : TCmDbField read FflgPensao write FflgPensao;   //Everson Cunha - SIG38475

    //William Santana SOL: 201365 - KINTANA: 1965590
    property PercRatAlimentacao : TCmDbField read FPercRatAlimentacao write FPercRatAlimentacao;
    property PercRatRefeicao : TCmDbField read FPercRatRefeicao write FPercRatRefeicao;
    //End- WIlliam Santana SOL: 201365 - KINTANA: 1965590

    //Início - William Santana - SOL 211502.16259 PPM 442499
    property SitRecisao : TCmDbField read FSitRecisao write FSitRecisao;
    property FlgRessalva : TCmDbField read FFlgRessalva write FFlgRessalva;
    property DescRessalva : TCmDbField read FDescRessalva write FDescRessalva;
    property IdImgRecisao : TCmDbField read FIdImgRecisao write FIdImgRecisao;
    //Término - William Santana - SOL 211502.16259 PPM 442499

    //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    property VLRFUNCAO: TCmDbField read FFuncao write FFuncao;
    property DATAFUNCAO : TCmDbField read FDataFuncao write FDataFuncao;
    property VLRSALARIOFUNCAO : TCmDbField read FSalarioFuncao write FSalarioFuncao;
    //Higor Nayde Ferreira Sol 188194 - Kintana 1779198

    // Felipe A. Santos SOL 229871.16137
    property IdGrauExpAgenteSocial : TCmDbField read FIdGrauExpAgenteSocial write FIdGrauExpAgenteSocial;
    property IdCategTrabaeSocial : TCmDbField read FIdCategTrabaeSocial write FIdCategTrabaeSocial;
    property IdEstagiario : TCmDbField read FIdEstagiario write FIdEstagiario;
    property IdDadosCessao : TCmDbField read FIdDadosCessao write FIdDadosCessao;
    // Felipe A. Santos SOL 229871.16137 - fim

    //Início - William Santana - SOL 229881.16648 PPM 565999
    //property Atestadoobito: TCmDbField read FAtestadoobito write FAtestadoobito; //Everson Cunha - SIG38475
    property Processotrab: TCmDbField read FProcessotrab write FProcessotrab;
    property Dataterminoaviso: TCmDbField read FDataterminoaviso write  FDataterminoaviso;
    //Término - William Santana - SOL 229881.16648 PPM 565999

    property DtFimQuar : TCmDbField read FDtFimQuar write FDtFimQuar; // Felipe A. Santos SOL 250387/17326 PPM 832518

    //Cássio Rovaroto - SIG nº 38475.60440 - Início
    property FlgPensaoResc: TCmDbField read FFlgPensaoResc write FFlgPensaoResc ;
    property VlrPensaoResc: TCmDbField read FVlrPensaoResc write FVlrPensaoResc;
    //Cássio Rovaroto - SIG nº 38475.60440 - Fim

    //Everson Cunha - SIG38475-84907 - Início
    property TipoAvisoPrevio: TCmDbField read FTipoAvisoPrevio write SetTipoAvisoPrevio;
    property DataCancelAvisoPrevio: TCmDbField read FDataCancelAvisoPrevio write SetDataCancelAvisoPrevio;
    property MotivoCancelAvisoPrevio: TCmDbField read FMotivoCancelAvisoPrevio write SetMotivoCancelAvisoPrevio;
    property PercPensaoResc: TCmDbField read FPercPensaoResc write SetPercPensaoResc;
    //Everson Cunha - SIG38475-84907 - Fim


    property flgOptanteSeguroVidaGrupo: TCmDbField read FflgOptanteSeguroVidaGrupo write SetflgOptanteSeguroVidaGrupo;


    end;
implementation

{ TDbFuncionario }

constructor TDbFuncionario.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FUNCIONARIO';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FValorfgts := CreateCmDbField('VALORFGTS',ftFloat,false,false,false,false,'');
  FTipopagamento := CreateCmDbField('TIPOPAGAMENTO',ftString,false,false,false,false,'');
  FTipomaodeobra := CreateCmDbField('TIPOMAODEOBRA',ftString,false,false,false,false,'');
  FTipocontrato := CreateCmDbField('TIPOCONTRATO',ftString,false,false,false,false,'');
  FSalariotipo := CreateCmDbField('SALARIOTIPO',ftString,false,false,false,false,'');
  FSalarioatual := CreateCmDbField('SALARIOATUAL',ftFloat,false,false,false,false,'');
  FQuantidadefgts := CreateCmDbField('QUANTIDADEFGTS',ftFloat,false,false,false,false,'');
  FProrrogcontrato := CreateCmDbField('PRORROGCONTRATO',ftFloat,false,false,false,false,'');
  FNumcontasalario := CreateCmDbField('NUMCONTASALARIO',ftString,false,false,false,false,'');
  FNumcontafgts := CreateCmDbField('NUMCONTAFGTS',ftString,false,false,false,false,'');
  FNivelindiv2 := CreateCmDbField('NIVELINDIV2',ftFloat,false,false,false,false,'');
  FNivelindiv1 := CreateCmDbField('NIVELINDIV1',ftFloat,false,false,false,false,'');
  FMatricula := CreateCmDbField('MATRICULA',ftString,false,false,false,false,'');
  FIdvincempreg := CreateCmDbField('IDVINCEMPREG',ftFloat,false,false,false,true,'');
  FIdtipotrab := CreateCmDbField('IDTIPOTRAB',ftString,false,false,false,false,'');
  FIdsitrisco := CreateCmDbField('IDSITRISCO',ftFloat,false,false,false,true,'');
  FIdsitfunc := CreateCmDbField('IDSITFUNC',ftFloat,false,false,false,true,'');
  FIdprocessodem := CreateCmDbField('IDPROCESSODEM',ftFloat,false,false,false,true,'');
  FIdmovcontrcaged := CreateCmDbField('IDMOVCONTRCAGED',ftFloat,false,false,false,true,'');
  FIdmotivodesligrais := CreateCmDbField('IDMOTIVODESLIGRAIS',ftFloat,false,false,false,true,'');
  FIdmotivodesliggerencial := CreateCmDbField('IDMOTIVODESLIGGERENCIAL',ftFloat,false,false,false,true,'');
  FIdhorario := CreateCmDbField('IDHORARIO',ftFloat,false,false,false,true,'');
  FIdfuncao := CreateCmDbField('IDFUNCAO',ftFloat,false,false,false,true,'');
  FIdformaresc := CreateCmDbField('IDFORMARESC',ftFloat,false,false,false,false,'');
  FIdfaixafuncao := CreateCmDbField('IDFAIXAFUNCAO',ftFloat,false,false,false,true,'');
  FIdfaixacargo := CreateCmDbField('IDFAIXACARGO',ftFloat,false,false,false,true,'');
  FIdestab := CreateCmDbField('IDESTAB',ftFloat,false,false,false,true,'');
  FIdempresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FIddeposgre := CreateCmDbField('IDDEPOSGRE',ftFloat,false,false,false,true,'');
  FIdchefe := CreateCmDbField('IDCHEFE',ftFloat,false,false,false,true,'');
  FIdcatemprgre := CreateCmDbField('IDCATEMPRGRE',ftFloat,false,false,false,true,'');
  FIdcargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FIdagenciasalario := CreateCmDbField('IDAGENCIASALARIO',ftFloat,false,false,false,true,'');
  FIdagenciafgts := CreateCmDbField('IDAGENCIAFGTS',ftFloat,false,false,false,true,'');
  FIdafastrais := CreateCmDbField('IDAFASTRAIS',ftFloat,false,false,false,true,'');
  FHomologacaoorgao := CreateCmDbField('HOMOLOGACAOORGAO',ftString,false,false,false,true,'');
  FHomologacaonumero := CreateCmDbField('HOMOLOGACAONUMERO',ftString,false,false,false,true,'');
  FFlgtipofgts := CreateCmDbField('FLGTIPOFGTS',ftFloat,false,false,false,false,'');
  FDuracaocontrato := CreateCmDbField('DURACAOCONTRATO',ftFloat,false,false,false,false,'');
  FDatasalario := CreateCmDbField('DATASALARIO',ftDateTime,false,false,false,true,'');
  FDataretorno := CreateCmDbField('DATARETORNO',ftDateTime,false,false,false,true,'');
  FDatarefhorario := CreateCmDbField('DATAREFHORARIO',ftDateTime,false,false,false,true,'');
  FDataopcaofgts := CreateCmDbField('DATAOPCAOFGTS',ftDateTime,false,false,false,true,'');
  FDatalotacao := CreateCmDbField('DATALOTACAO',ftDateTime,false,false,false,true,'');
  FDatafimcontrato := CreateCmDbField('DATAFIMCONTRATO',ftDateTime,false,false,false,true,'');
  FDatadesligamento := CreateCmDbField('DATADESLIGAMENTO',ftDateTime,false,false,false,true,'');
  FDatacargo2 := CreateCmDbField('DATACARGO2',ftDateTime,false,false,false,true,'');
  FDatacargo := CreateCmDbField('DATACARGO',ftDateTime,false,false,false,true,'');
  FDataaviso := CreateCmDbField('DATAAVISO',ftDateTime,false,false,false,true,'');
  FDataadmissao := CreateCmDbField('DATAADMISSAO',ftDateTime,false,false,false,true,'');
  FCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,false,'');
  FCodarrumadeira := CreateCmDbField('CODARRUMADEIRA',ftString,false,false,false,false,'');
  FFlgMarcaPonto := CreateCmDbField('FLGMARCAPONTO',ftFloat,false,false,false,false,'');

  // Ricardo A. SOL: 103661 KTN: 472575
  FNumCracha  := CreateCmDbField('NUMCRACHA',ftString,false,false,false,false,'');

  //Thaise SOL 144594 - Criação dos novos campos
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  //FPercentual := CreateCmDbField('PERCENTUAL',ftFloat,false,false,false,true,'');
  //FPercentual := CreateCmDbField('PERCENTUAL',ftFloat,false,false,false,false,''); //Everson Cunha - SIG38475
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
  //FflgPensao  := CreateCmDbField('FLGPENSAO',ftString,false,false,false,false,''); //Everson Cunha - SIG38475


  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  FFuncao := CreateCmDbField('VLRFUNCAO',ftFloat,false,false,false,true,'');
  FDataFuncao := CreateCmDbField('DATAFUNCAO',ftDateTime,false,false,false,true,'');
  FSalarioFuncao := CreateCmDbField('VLRSALARIOFUNCAO',ftFloat,false,false,false,true,'');
  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198

  //WIlliam Santana SOL: 201365 - KINTANA: 1965590
  FPercRatAlimentacao := CreateCmDbField('PERCRATALIMENTACAO',ftFloat,false,false,false,false,'');
  FPercRatRefeicao := CreateCmDbField('PERCRATREFEICAO',ftFloat,false,false,false,false,'');
  //END- William Santana SOL: 201365 - KINTANA: 1965590

  //Início - William Santana - SOL 211502.16259 PPM 442499
  FSitRecisao := CreateCmDbField('SITRECISAO',ftString,false,false,false,false,'');
  FFlgRessalva := CreateCmDbField('FLGRESSALVA',ftFloat,false,false,false,false,'');
  FDescRessalva := CreateCmDbField('DESCRESSALVA',ftString,false,false,false,false,'');
  FIdImgRecisao := CreateCmDbField('IDIMGRECISAO',ftFloat,false,false,false,false,'');
  //Término - William Santana - SOL 211502.16259 PPM 442499

  // Felipe A. Santos SOL 229871.16137 - início
  FIdGrauExpAgenteSocial := CreateCmDbField('IDGRAUEXPAGENTESOCIAL',ftFloat,false,false,false,True,'');
  FIdCategTrabaeSocial := CreateCmDbField('IDCATEGTRABAESOCIAL',ftFloat,false,false,false,True,'');
  FIdEstagiario := CreateCmDbField('IDESTAGIARIO',ftFloat,false,false,false,True,'');
  FIdDadosCessao := CreateCmDbField('IDDADOSCESSAO',ftFloat,false,false,false,True,'');
  // Felipe A. Santos SOL 229871.16137 - fim

  //Início - William Santana - SOL 229881.16648 PPM 565999
  //FAtestadoobito := CreateCmDbField('ATESTADOOBITO',ftString,false,false,false,false,''); //Everson Cunha - SIG38475
  FProcessotrab := CreateCmDbField('PROCESSOTRAB',ftString,false,false,false,false,'');
  FDataterminoaviso := CreateCmDbField('DATATERMINOAVISO',ftDateTime,false,false,false,true,'');
  //Término - William Santana - SOL 229881.16648 PPM 565999

  FDtFimQuar := CreateCmDbField('DTFIMQUAR',ftDateTime, false, false, false,true, ''); // Felipe A. Santos SOL 250387/17326 PPM 832518

  //Cássio Rovaroto - SIG nº 38475.60440 - Início
  FFlgPensaoResc := CreateCmDbField('FLGPENSAORESC', ftString, false, false, false, false, '');
  FVlrPensaoResc := CreateCmDbField('VLRPENSAORESC', ftFloat, false, false, false, false, '');
  //Cássio Rovaroto - SIG nº 38475.60440 - Fim

  //Everson Cunha - SIG38475-84907 - Início
  FTipoAvisoPrevio := CreateCmDbField('TIPOAVISOPREV', ftString, false, false, false, false, '');
  FDataCancelAvisoPrevio := CreateCmDbField('DATACANCEL_AVISOPREV', ftDateTime, false, false, false, true, '');
  FMotivoCancelAvisoPrevio := CreateCmDbField('MOTIVOCANCEL_AVISOPREV', ftString, false, false, false, false, '');
  FPercPensaoResc := CreateCmDbField('PERCPENSAORESC', ftFloat, false, false, false, false, '');
  //Everson Cunha - SIG38475-84907 - Fim

  // WO 11098 - Folha de Pagamento - Cadastro de Pessoal - Seguro vida Grupo
  // Arnaldo V. Scarin
  FflgOptanteSeguroVidaGrupo := CreateCmDbField('FLG_OPT_SEGUROVIDA_GRUPO', ftString, false, false, false, false, '');
end;

procedure TDbFuncionario.SetDataCancelAvisoPrevio(const Value: TCmDbField);
begin
  FDataCancelAvisoPrevio := Value;
end;

procedure TDbFuncionario.SetflgOptanteSeguroVidaGrupo(
  const Value: TCmDbField);
begin
  FflgOptanteSeguroVidaGrupo := Value;
end;

procedure TDbFuncionario.SetMotivoCancelAvisoPrevio(
  const Value: TCmDbField);
begin
  FMotivoCancelAvisoPrevio := Value;
end;

procedure TDbFuncionario.SetPercPensaoResc(const Value: TCmDbField);
begin
  FPercPensaoResc := Value;
end;

procedure TDbFuncionario.SetTipoAvisoPrevio(const Value: TCmDbField);
begin
  FTipoAvisoPrevio := Value;
end;

end.
