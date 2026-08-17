{
-------------------------------------------------------------------------
Pendência   : SOL 208389 KINTANA 2019073
Responsável : William Moreira da Silva
Data        : 13/06/2012
Descrição   : Campo sexo esta vindo como Feminino, quando deveria vir vazio
-------------------------------------------------------------------------
Pendência   : SOL 193615 Kintana 1871498
Responsável : Otacilio Aquino
Data        : 28/11/2012
Descrição   : Alterado consulta para retornar valor liquido
-------------------------------------------------------------------------
Pendência   : SOL 174939 Kintana 1585984
Responsável : Fanuel Junior
Data        : 28/02/2012
Descrição   : A mensagem de retorno está trazendo a situação na patrocinadora,
              o correto seria a situação na fundação.
-------------------------------------------------------------------------
Pendência   : SOL 176153 Kintana 1605708
Responsável : BRUNO AZEVEDO
Data        : 13/03/2012
Descrição   : Ajustes ao carregar o salário de participação.
-------------------------------------------------------------------------
Pendência   : SOL 170222 Kintana 1514151
Responsável : Fanuel Junior
Data        : 13/12/2011
Descrição   : Os dados do Parcipiante nao aparece , o mesmo tem duas matriculas.
-------------------------------------------------------------------------
Pendência   : SOL 168419 Kintana 1494159
Responsável : Fanuel Junior
Data        : 28/11/2011
Descrição   : Erro ao acessar Conta
-------------------------------------------------------------------------
Pendência   : SOL 167061 Kintana 1463494
Responsável : Fanuel Junior
Data        : 26/10/2011
Descrição   : A conversão da UF da naturalidade nos dados pessoais do
              autoatendimento está sendo feita errada.
-------------------------------------------------------------------------
Pendência   : SOL 166625 Kintana 1473533
Responsável : Fanuel Junior
Data        : 16/11/2011
Descrição   : É apresentado a msg de erro ORA-00936: missing expression,
              ao acessar a funcionalidade
-------------------------------------------------------------------------
Pendência   : SOL 164342 Kintana 1410200
Responsável : Fanuel Junior
Data        : 02/09/2011
Descrição   : Corrigido erro ao buscar o salário/benefício.
-------------------------------------------------------------------------
Pendência   : SOL 163067 KINTANA 1390325
Responsável : Fanuel Junior
Data        : 30/08/2011
Descrição   : Ajuste no salario do participante quando ele é ativo e aposentado pelo INSS
-------------------------------------------------------------------------
Pendência   : SOL 157942 KINTANA 1275822
Responsável : Fanuel Junior
Data        : 21/07/2011
Descrição   : Corrigido o valor do salário na tela Planos / Patrocinadora
-------------------------------------------------------------------------
Pendência   : SOL 152167 KINTANA 1130320
Responsável : BRUNO AZEVEDO
Data        : 27/04/2011
Descrição   : Disponibilizar a opção de tributação nos planos.
-------------------------------------------------------------------------
Pendência   : SOL 111643 KINTANA 515405
Responsável : BRUNO AZEVEDO
Data        : 30/08/2010
Descrição   : Criação da possibilidade de receber ou não as publicações.
-------------------------------------------------------------------------
Pendência   : SOL 91655 KINTANA 394002
Responsável : BRUNO AZEVEDO
Data        : 06/07/2010
Descrição   : Criação da manutenção dos dados cadastrais (E-mail, telefone e endereço).
--------------------------------------------------------------------------------
}
//Rotina.............: TCtrlWebDadosCadastrais
//N. Sol.............: 94276      
//N. Kintana.........: 406241
//Data...............: 28/08/2008
//Responsável........: William Santos
//Descrição..........: Incluída linha abaixo para diferenciar cargos que existem tanto para a Fundação
//                     quanto para a Patrocinadora, permitindo que somente seja carregado o cargo correto.

unit uCtrlWebDadosCadastrais;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMFileUtils,
     uCmTypes;

Type
  TCtrlWebDadosCadastrais = class(TCmControlObject)
  private
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    FCdsDadosCadastrais: TCMClientDataSet;
    procedure SetCdsDadosCadastrais(const Value: TCMClientDataSet);
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
  protected

  public

    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    constructor Create; override;
    destructor Destroy; override;
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002

    //Busca Salario da Pessoa
    //Fanuel Junior SOL157942 KINTANA1275822
    function BuscaSalario( iIdPessoa : integer; sMatricula : String = '' ): double;

    //Fanuel Junior SOL174939 Kintana1585984
    function BuscaSituacaoFunc(iIdPessoa, iIdPessJur : integer ) : String;



    //Dados Pessoais
    function SelecionaDadosPessoa( iIdPessoa : integer ) : OleVariant;
    function SelecionaDocumentos( iIdPessoa : integer ) : OleVariant;
    function SelecionaTelefones( iIdPessoa : integer ) : OleVariant;
    function SelecionaContasBancarias( iIdPessoa : integer ) : OleVariant;


    //Participante na Patrocinadora
    function SelecionaPartPatro( iIdPessoa, iIdPessJur : integer; sMatricula : String = '' ) : OleVariant;
    function SelecionaMaxAdmissao( iIdPessoa : integer ) : OleVariant;

    //BRUNO AZEVEDO SOL 111643 KINTANA 515405
    function SelecionaConfiguracaoEmail( ): OleVariant;
    function SelecionaPessoaParam( iIdPessoa, iIdParam : integer ) : OleVariant;
    function GravaPessoaParam(iIdPessoa, iIdParam : integer): Boolean;
             
    //Participante nos Planos
    function SelecionaPartPlano( iIdPessoa : integer ) : OleVariant;


    //Dados para emissão do extrato
    function DadosExtrato( iIdPessoa, iIdPlanoPrev : integer ) : OleVariant;

    //Retorna o FLGINTERNO do participante
    function RecuperaFlgInterno( iIdPessoa : integer ) : String; 

    //BRUNO AZEVEDO SOL 91655 KINTANA 394002
    function AlterarDadosCadastrais : Boolean;

    property CdsDadosCadastrais : TCMClientDataSet read FCdsDadosCadastrais write SetCdsDadosCadastrais;
    //BRUNO AZEVEDO SOL 91655 KINTANA 394002



  published

end;

implementation

{ TCtrlWebDadosCadastrais }


function TCtrlWebDadosCadastrais.SelecionaContasBancarias( iIdPessoa: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select     c.IDCBANCARIA,                                                ' +
   '            bc.NUMBANCO,                                                  ' +
   '            b.NOME AS BANCO,                                              ' +
   '            ag.NUMAGENCIA,                                                ' +
   '            a.NOME AS AGENCIA,                                            ' +
   '            c.CONTACORRENTE,                                              ' +
   '            c.FLGCONTAPREF,                                               ' +
   '            decode( c.FLGCONTAPREF, 1, ''Sim'', ''Não'' ) as CONTAPREF    ' +
   ' from       CONTABANCARIA c,                                              ' +
   '            PESSOA a,                                                     ' +
   '            PESSOA b,                                                     ' +
   '            AGENCIABANCARIA ag,                                           ' +
   '            BANCO bc                                                      ' +
   ' where      c.IDPESSOA   = ' + IntToStr( iIdPessoa )                        +
   '   and      c.IDAGENCIA  = a.IDPESSOA                                     ' +
   '   and      c.IDAGENCIA  = ag.IDPESSOA                                    ' +
   '   and      ag.IDBANCO   = b.IDPESSOA                                     ' +
   '   and      ag.IDBANCO   = bc.IDPESSOA                                    ' );
end;

function TCtrlWebDadosCadastrais.SelecionaDadosPessoa( iIdPessoa : integer ) : OleVariant;
var
sSQL : String;
begin

   sSQL:= (
   ' select     p.NOME, p.IDPESSOA,                                                     ' +
   '            pf.NOMEPAI,                                                             ' +
   '            pf.NOMEMAE,                                                             ' +
   '            decode(  pf.SEXO, ''M'', ''Masculino'', ''F'', ''Feminino'', ''-'' ) as SEXO, ' + //William Moreira da Silva SOL 208389 KINTANA 2019073
   '            p.EMAIL,                                                                ' +
   '            decode( pf.ESTCIVIL, ''S'', ''Solteiro(a)'',                           ' +
   '            decode( pf.ESTCIVIL, ''C'', ''Casado(a)'',                             ' +
   '            decode( pf.ESTCIVIL, ''D'', ''Divorciado(a)'',                         ' +
   '            decode( pf.ESTCIVIL, ''E'', ''Desquitado(a)'',                         ' +
   '            decode( pf.ESTCIVIL, ''J'', ''Separado(a) Judicial'',                  ' +
   '            decode( pf.ESTCIVIL, ''V'', ''Viúvo(a)'',                              ' +
   '            decode( pf.ESTCIVIL, ''M'', ''Uniao Estavel'',                         ' +
   //'          decode( pf.ESTCIVIL, ''O'', ''Outros''))))) as ESTADOCIVIL,            ' +
   '            decode( pf.ESTCIVIL, ''P'', ''Separado(a)'')))))))) as ESTADOCIVIL,     ' +
   '            pi.nomepais as NACIONALIDADE,                                           ' +
   '            e.NOMEESTADO as NATURALIDADE,                                           ' +
   '            pf.DATANASC,                                                            ' +
   '            pf.DATAMORTE,                                                           ' +
   '            decode( pf.FLGMOLESTIAGRAVE, 1, ''Sim'', ''Não'' ) as FLGMOLESTIAGRAVE, ' +
   '            decode( pf.FLGISENTOIRRF,    1, ''Sim'', ''Não'' ) as FLGISENTOIRRF,    ' +
   '            pf.INICIOINVALIDEZ,                                                     ' +
   '            pf.FIMINVALIDEZ,                                                        ' +
   '            p.IDIMAGEM,                                                             ' +
   '            pp.valor AS NAORECEBERPERIODICO,                                        ' +
   '            PP.OBSERVACAO AS MOTIVO                                                 ' +
   ' from       PESSOA        p,                                                        ' +
   '            PESSOAFISICA  pf,                                                       ' +
   '            CIDADES       C,                                                        ' +//Fanuel Junior SOL167061 Kintana1463494
   '            PAIS          pi,                                                       ' +
   '            ESTADO        e,                                                        ' +
   '            pessoaparam   pp                                                        ' +
   ' where      p.IDPESSOA    = ' + IntToStr( iIdPessoa )                                 +
   '   and      p.IDPESSOA    = pf.IDPESSOA                                             ' +
   '   and      pf.IDPAIS     = pi.IDPAIS   (+)                                         ' +    //Fanuel Junior SOL170222 Kintana1514151
   '   and      C.IDCIDADES(+)  = PF.IDCIDADES                                             ' +//Fanuel Junior SOL167061 Kintana1463494
   '   and      C.CODESTADO  = E.CODESTADO(+)                                              ' +//Fanuel Junior SOL167061 Kintana1463494
   //'   and      pf.CODESTADO  = e.CODESTADO (+)                                         ' +
   '   AND      pp.idpessoa (+)  = p.idpessoa                                           ' +
   '   AND      pp.idparam  (+)  = 129                                                  ');
   //CmDebugToFile(sSQL, 'C:\AAErro.txt');
   Result := GetDataPacket(sSQL);
end;


function TCtrlWebDadosCadastrais.SelecionaDocumentos( iIdPessoa : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select     t.NOMEDOCUMENTO,               ' +
   '            e.CODESTADO,                   ' +
   '            d.NUMDOCUMENTO,                ' +
   '            d.ORGAO,                       ' +
   '            d.DATAEMISSAO,                 ' +
   '            d.DATAVALIDADE                 ' +
   '  from      DOCPESSOA d,                   ' +
   '            TIPODOCPESSOA t,               ' +
   '            ESTADO e                       ' +
   '  where     d.IDPESSOA    = ' + IntToStr( iIdPessoa ) +
   '    and     t.IDDOCUMENTO = d.IDDOCUMENTO  ' +
   '    and     d.IDESTADO    = e.IDESTADO (+) ' );
end;

function TCtrlWebDadosCadastrais.SelecionaMaxAdmissao( iIdPessoa : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select   IDPESSJUR,                  ' +
   '          IDPESSOA,                   ' +
   '          max( DATAADMISSAO ) as MAX  ' +
   ' from     ELEGPATRO                   ' +
   ' where    IDPESSOA = ' + IntToStr( iIdPessoa ) +
   ' group by IDPESSJUR,                  ' +
   '          IDPESSOA                    ' );
end;

function TCtrlWebDadosCadastrais.SelecionaPartPatro( iIdPessoa, iIdPessJur : integer; sMatricula : String = '' ): OleVariant;
var
sData,sSQL : String;
sMes,sAno : String;
fSalario  : double;
begin
   //Fanuel Junior SOL157942 Kintana1275822
   //CmDebugToFile(sMatricula,'C:\Planus\AAErro.txt');
   fSalario := BuscaSalario(iIdPessoa, sMatricula);

  //Fanuel Junior SOL157942 Kintana1275822
    sSQL := (  //Result := GetDataPacket(
   ' select p.NOME as PATROCINADORA,                     ' +
   '        f.NOME as FILIAL,                            ' +
   '        s.DESCRICAO as SITUACAO,                     ' +
   '        vf.DESCRICAO as VINCULAFUNC,                 ' +
   '        cc.NOME as CENTROCUSTO,                      ' +
   '        ce.TITULO as CARGO,                          ' +
   '        e.MATRICULA,                                 ' +
   '  '+ StringReplace(FloatToStr(fSalario ),',','.',[rfReplaceAll])+' AS SALTOTAL,  ' +//Fanuel Junior SOL157942 KINTANA1275822
 //'  '+ FloatToStr(fSalario)    +' AS SALTOTAL,         ' +//Fanuel Junior SOL157942 KINTANA1275822
 //'        e.SALTOTAL,                                  ' +
   '        e.DATAADMISSAO,                              ' +
   '        e.DATADEMISSAO,                              ' +
   '        e.DATAREADMISSAO,                            ' +
   '        o.NOME as ORGAO,                             ' +
   '        e.TEMPOSERVANTERIOR,                         ' +
   '        e.TEMPONAOCREDITADO                          ' +
   ' from   ELEGPATRO e,                                 ' +
   '        PESSOA p,                                    ' +
   '        SITFUNC s,                                   ' +
   '        PESSOA f,                                    ' +
   '        VINCULAFUNC vf,                              ' +
   '        CENTCUST cc,                                 ' +
   '        CARGOEXT ce,                                 ' +
   '        ORGAOPREV o                                  ' +
   ' where  e.IDPESSOA           = ' + IntToStr( iIdPessoa )  +
   '   and  e.IDPESSJUR          = ' + IntToStr( iIdPessJur ) +
// William Santos - 28/08/2008 - N. Sol 94276 - N. Kintana 406241
   '   and  ce.IDPESSJUR         = ' + IntToStr( iIdPessJur ) +
   '   and  p.IDPESSOA           = e.IDPESSJUR           ' +
   '   and  e.IDESTAB            = f.IDPESSOA        (+) ' +
   '   and  e.IDSITFUNC          = s.IDSITFUNC       (+) ' +
   '   and  e.CODVINCULAFUNC     = vf.CODVINCULAFUNC (+) ' +
   '   and  e.CODCENTROCUSTO     = cc.CODCENTROCUSTO (+) ' +
   '   and  e.IDCARGOEXT         = ce.IDCARGOEXT     (+) ' +
   '   and  e.IDPESSJUR          = o.IDPESSJUR       (+) ' );
   //CmDebugToFile(sSQL, 'C:\Planus\AAErro.txt');
   //Fanuel Junior SOL157942 KINTANA1275822
   Result := GetDataPacket(sSQL);
end;

function TCtrlWebDadosCadastrais.SelecionaPartPlano( iIdPessoa: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select     pl.NOME AS PLANO,                                                       ' +
   '            sp.DESCRICAO AS SITPART,                                                ' +
   '            spp.DESCRICAO AS SITPLANO,                                              ' +
   '            pp.INSCRICAONUMERO,                                                     ' +
   '            pp.INSCRICAODATA,                                                       ' +
   '            pp.REQUERIMENTODATA,                                                    ' +
   '            decode( pp.INSCRICAOTIPO, ''F'', ''Fundador'',                          ' +
   '             decode( pp.INSCRICAOTIPO, ''N'', ''Não-Fundador'',                     ' +
   '             decode( pp.INSCRICAOTIPO, ''R'', ''Retardatário'',                     ' +
   '             decode( pp.INSCRICAOTIPO, ''O'', ''Outros'' ) ) ) ) as  INSCRICAOTIPO, ' +
   '            pp.SALINSCRICAO,                                                        ' +
   '            decode( pp.FLGFITESPECIAL, 1, ''Sim'', ''Não'' ) AS FLGFITESPECIAL,     ' +
   '            pp.DATACANCELAMENTO,                                                    ' +
   //BRUNO AZEVEDO SOL 152167 KINTANA 1130320
   '            decode( pp.TIPOOPCAOIR, ''1'', ''Progressivo'',                         ' +
   '                                    ''2'', ''Regressivo'',                          ' +
   '                                           ''Sem opção'') as  OPCAOIR,              ' +
   //BRUNO AZEVEDO SOL 152167 KINTANA 1130320
   '            pp.DATAINICIOMANUT                                                      ' +
   ' from       SITPART sp,                                                             ' +
   '            SITPLANOPREV spp,                                                       ' +
   '            PLANPREV pl,                                                            ' +
   '            PARTPREVPLAN pp                                                         ' +
   ' where      pp.IDPESSOA       = ' + IntToStr( iIdPessoa )                             +
   '   and      pp.IDPLANOPREV    = pl.IDPLANOPREV                                      ' +
   '   and      pp.IDSITPART      = sp.IDSITPART                                        ' +
   '   and      pp.IDSITPLANOPREV = spp.IDSITPLANOPREV                                  ' +
   ' order by   pp.INSCRICAODATA,                                                       ' +
   '            PLANO                                                                   ' );
end;

function TCtrlWebDadosCadastrais.SelecionaTelefones( iIdPessoa: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select     e.LOGRADOURO,                                                                    ' +
   '            t.TIPO,                                                                          ' +
   '            t.DDI,                                                                           ' +
   '            t.DDD,                                                                           ' +
   '            t.NUMERO                                                                         ' +
   ' from       TELENDPESS t,                                                                    ' +
   '            ENDPESS    e,                                                                    ' +
   '            PESSOA pe                                                                        ' +
   ' where      e.IDPESSOA   = ' + IntToStr( iIdPessoa )                                           +
   '   and      t.IDENDERECO = e.IDENDERECO                                                      ' +
   '   and      e.IDPESSOA   = pe.IDPESSOA                                                       ' +
   //BRUNO AZEVEDO SOL 91655 KINTANA 394002
   '   and e.idendereco IN(SELECT p.idendcorresp                            ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendcomercial                                       ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendentrega                                         ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendresidencial                                     ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendcobranca                                        ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +')' );
   //BRUNO AZEVEDO SOL 91655 KINTANA 394002
end;

function TCtrlWebDadosCadastrais.DadosExtrato(iIdPessoa,
  iIdPlanoPrev: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '    ELEGPATRO.MATRICULA, ' +
   '    PESSOA.NOME, ' +
   '    PARTPREVPLAN.INSCRICAONUMERO, ' +
   '    PLANPREV.NOME AS PLANO, ' +
   '    PATRO.NOME AS PATRO, ' +
   '    ELEGPATRO.IDPESSOA, ' +
   '    ELEGPATRO.IDPESSJUR, ' +
   '    PLANPREV.IDPLANOPREV, ' +
   '    PARTPREVPLAN.SEQPROPOSTA, ' +
   '    SITPART.FLGINTERNO ' +
   ' FROM ' +
   '    PESSOA, ' +
   '    ELEGPATRO, ' +
   '    PARTPREVPLAN, ' +
   '    PESSOA PATRO, ' +
   '    PLANPREV, ' +
   '    SITFUNC, ' +
   '    SITPART, ' +
   '    SITPLANOPREV, ' +
   '    PESSOAFISICA ' +
   ' WHERE ' +
   '    ( PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA ) AND ' +
   '    ( ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA ) AND ' +
   '    ( ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR ) AND ' +
   '    ( PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV ) AND ' +
   '    ( PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR ) AND ' +
   '    ( ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+) ) AND ' +
   '    ( PARTPREVPLAN.IDSITPART = SITPART.IDSITPART ) AND ' +
   '    ( PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV ) AND ' +
   '    ( PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA ) AND ' +
   '    ( PARTPREVPLAN.IDPLANOPREV = ' + IntToStr( iIdPlanoPrev ) + ' ) AND ' +
   '    ( PESSOA.IDPESSOA = ' + IntToStr( iIdPessoa ) + ' ) ' );
end;

function TCtrlWebDadosCadastrais.RecuperaFlgInterno( iIdPessoa: integer ): String;
var
  cdsLocal : TCmClientDataSet;
begin       
  cdsLocal := TCmClientDataSet.Create( nil );
  try

    Result := '';

    cdsLocal.Data := GetDataPacket(
     ' select   s.FLGINTERNO              ' +
     '   from   SITPART       s,          ' +
     '          PARTPREVPLAN  p           ' +
     '   where  p.IDPESSOA  =             ' + IntToStr( iIdPessoa ) +
     '     and  p.IDSITPART = s.IDSITPART ' );

    if not cdsLocal.IsEmpty then
      Result := cdsLocal.FieldByName('FLGINTERNO').AsString;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;
end;

//BRUNO AZEVEDO SOL 91655 KINTANA 394002
function TCtrlWebDadosCadastrais.AlterarDadosCadastrais: Boolean;
var
  sSQL : string;
begin
  if (ConnectionSide = cnsClient) then begin
    Result := Connection.AppServer.DadosCadastrais( FCdsDadosCadastrais.Data );
    if not (Result) then begin
      MessageInfo := Connection.AppServer.MessageInfo;
    end;
  end else begin
    try  
      StartTransaction;

      sSQL := ' update PESSOA       '                                                           +
              ' set    EMAIL = ' + QuotedStr(FCdsDadosCadastrais.FieldByName('EMAIL').AsString) +
              ' where  IDPESSOA  = ' + FCdsDadosCadastrais.FieldByName('IDPESSOA').AsString;
     
      Result := ExecSQL( sSQL );

      if not Result then begin
        raise Exception.Create( MessageInfo );
      end;
      
      Commit; 
   except
      On E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

procedure TCtrlWebDadosCadastrais.SetCdsDadosCadastrais(const Value: TCMClientDataSet);
begin
  FCdsDadosCadastrais := Value;
end;

constructor TCtrlWebDadosCadastrais.Create;
begin
  inherited;     
  FCdsDadosCadastrais := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlWebDadosCadastrais.Destroy;
begin
  inherited;
  FreeAndNil(FCdsDadosCadastrais);
end;
//BRUNO AZEVEDO SOL 91655 KINTANA 394002

//BRUNO AZEVEDO SOL 111643 KINTANA 515405
function TCtrlWebDadosCadastrais.SelecionaConfiguracaoEmail( ): OleVariant;
begin
  Result := GetDataPacket(
   ' select * from emailconexao where idemailconexao = ( SELECT MAX(idemailconexao) FROM emailconexao) ');
end;

function TCtrlWebDadosCadastrais.SelecionaPessoaParam( iIdPessoa, iIdParam : integer ) : OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT * FROM PESSOAPARAM ' +
   '  WHERE IDPESSOA = ' +IntToStr(iIdPessoa)+
   '    AND IDPARAM  = ' +IntToStr(iIdParam));
end;

function TCtrlWebDadosCadastrais.GravaPessoaParam(iIdPessoa, iIdParam : integer): Boolean;
var
  sSQL : string;
  cdsLocal : TCmClientDataSet;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    try
      cdsLocal.Data := SelecionaPessoaParam(iIdPessoa, iIdParam);

      StartTransaction;

      if not cdsLocal.IsEmpty then begin
        sSQL := ' update PessoaParam  ' +
                ' set    OBSERVACAO = ' + QuotedStr(FCdsDadosCadastrais.FieldByName('OBSERVACAO').AsString) +
                '        , VALOR    = ' + QuotedStr(FCdsDadosCadastrais.FieldByName('VALOR').AsString) +
                ' where  IDPESSOA  = ' + IntToStr(iIdPessoa) +
                '   AND  IDPARAM   = ' + IntToStr(iIdParam);
        Result := ExecSQL( sSQL );
      end else begin
        sSQL := ' INSERT INTO PessoaParam (IDPESSOA, IDPARAM, VALOR, OBSERVACAO, DATAINICIO) VALUES ' +
                '(' + IntToStr(iIdPessoa) + ',' + IntToStr(iIdParam) + ',' + QuotedStr(FCdsDadosCadastrais.FieldByName('VALOR').AsString) + ',' + QuotedStr(FCdsDadosCadastrais.FieldByName('OBSERVACAO').AsString) + ', SYSDATE' + ')';
        Result := ExecSQL( sSQL );
      end;

      if not Result then begin
        raise Exception.Create( MessageInfo );
      end;

      Commit;
    except
      On E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  finally
    cdsLocal.Close;
    FreeAndNil(cdsLocal);
  end;
end;
//BRUNO AZEVEDO SOL 111643 KINTANA 515405

//Fanuel Junior SOL157942 KINTANA1275822
function TCtrlWebDadosCadastrais.BuscaSalario( iIdPessoa : integer; sMatricula : String = ''): double;
var
sSQLBuscaSituacao, SQLBuscaSalario,
sIdFolha: string;
cdsBuscaSalario, cdsBuscaSituacao : TCMClientDataSet;
begin

  //Fanuel Junior SOL164342 Kintana1410200
  //Busca situação da pessoa
   sSQLBuscaSituacao := ( ' SELECT VW.MATRICSHOW, VW.SITFUND '+
                          ' FROM VWPARTICIPDEPEN VW '+
   //                       ' WHERE VW.MATRICSHOW = (SELECT MATRICULA FROM ELEGPATRO WHERE IDPESSOA = '+IntToStr(iIdPessoa)+') ');
                          ' WHERE VW.MATRICSHOW = '+QuotedStr(sMatricula)+' ');//Fanuel Junior SOL168419 Kintana1494159

   //CmDebugToFile(sSQLBuscaSituacao,'C:\Planus\AAErro.txt');

   cdsBuscaSituacao := TCMClientDataSet.Create(nil);
   cdsBuscaSituacao.Data := GetDataPacket(sSQLBuscaSituacao);

   //SQLBuscaSalario :=  (' SELECT PN.SALPARTICIPACAO FROM PARTPREVPLAN PN      '+
   //                     ' WHERE IDPESSOA = '+IntToStr(iIdPessoa)+' AND IDSITPLANOPREV = 1 ');
   //                     ' WHERE IDPESSOA = '+IntToStr(iIdPessoa)+' AND FLGDESATIVADO = 0 ');

   cdsBuscaSalario := TCMClientDataSet.Create(nil);

   //Fanuel Junior SOL164342 Kintana1410200
   //Se for Ativo
   //Fanuel Junior SOL166625 Kintana1473533
   if (pos('ATIVO', cdsBuscaSituacao.FieldByName('SITFUND').AsString ) > 0) then begin
   //if ( trim(cdsBuscaSituacao.FieldByName('SITFUND').AsString) = 'ATIVO') then begin

      SQLBuscaSalario :=  (' SELECT PN.SALPARTICIPACAO FROM PARTPREVPLAN PN      '+
                           ' WHERE IDPESSOA = '+IntToStr(iIdPessoa)+'  AND FLGDESATIVADO = 0 ');
      cdsBuscaSalario.Data := GetDataPacket(SQLBuscaSalario);
      //CmDebugToFile(SQLBuscaSalario,'C:\Planus\AAErro.txt');
      result := cdsBuscaSalario.FieldByName('SALPARTICIPACAO').AsFloat;
   end
   else begin

      SQLBuscaSalario := (' SELECT DISTINCT HIS.HISTORICO, HST.MESCOBRANCA, HST.IDHSTFOLHABENEF, '+
                          ' HST.DATAPAGAMENTO FROM HISTRUBSAL HST, HSTFOLHABENEF HIS             '+
                          ' WHERE HST.IDTITULAR = '+IntToStr(iIdPessoa)+' '+
                          ' AND HST.IDMODULO = 18 AND HIS.HISTORICO LIKE '+QuotedStr('%FOLHA%')+' '+
                          ' AND HIS.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF '+
                          ' ORDER BY HST.DATAPAGAMENTO DESC, HST.MESCOBRANCA DESC, HST.IDHSTFOLHABENEF DESC');
      //CmDebugToFile(SQLBuscaSalario,'C:\Planus\AAErro.txt');
      cdsBuscaSalario.Data := GetDataPacket(SQLBuscaSalario);
      sIdFolha := trim(cdsBuscaSalario.FieldByName('IDHSTFOLHABENEF').AsString);

      //BRUNO AZEVEDO SOL KINTANA
      //A PEDIDO DO ANTONIO, CONFORME EMAIL NO KINTANA
      if (Trim(sIdFolha) = '') then begin
        SQLBuscaSalario :=  (' SELECT PN.SALPARTICIPACAO FROM PARTPREVPLAN PN      '+
                           ' WHERE IDPESSOA = '+IntToStr(iIdPessoa)+'  AND FLGDESATIVADO = 0 ');
        cdsBuscaSalario.Data := GetDataPacket(SQLBuscaSalario);
        result := cdsBuscaSalario.FieldByName('SALPARTICIPACAO').AsFloat;
      end else begin
        // SOL 193615 KTN 1871498 Otacilio Aquino
        SQLBuscaSalario := (' SELECT (SUM(VALORPROVENTO) - SUM(VALORDESCONTO)) AS VALORLIQUIDO FROM ( '+
        //' SELECT DISTINCT /*+ INDEX(HISTRUBSAL XIE17HISTRUBSAL) */ '+
        ' SELECT  '+//William Moreira da Silva SOL 193615 Kintana 1871498 
        ' DECODE(NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO),0,HST.VALORPROVENTO,NULL) VALORPROVENTO, '+
        ' DECODE(NVL(HST.FLGDESCONTO,PRD.FLGDESCONTO),1,HST.VALORPROVENTO,NULL) VALORDESCONTO  '+
        ' FROM HISTRUBSAL HST, PROVDESC PRD WHERE (HST.IDHSTFOLHABENEF = '+sIdFolha+') '+
        ' AND (HST.IDTITULAR  ='+IntToStr(iIdPessoa)+' ) AND (HST.IDRESPONSAVEL = '+IntToStr(iIdPessoa)+') '+
        ' AND (PRD.IDPROVENTO = HST.IDRUBRICA)) ');

        //CMDebugToFile(SQLBuscaSalario,'C:\Planus\Temp\SqlBuscaSalario.txt');

        //CmDebugToFile(SQLBuscaSalario,'C:\Planus\AAErro.txt');
        cdsBuscaSalario.Data := GetDataPacket(SQLBuscaSalario);
        // SOL 193615 KTN 1871498 Otacilio Aquino
        //result := cdsBuscaSalario.FieldByName('VALORPROVENTO').AsFloat;
        result := cdsBuscaSalario.FieldByName('VALORLIQUIDO').AsFloat;
      end;
   end;
end;
//Fanuel Junior SOL157942 KINTANA1275822

//Fanuel Junior SOL174939 Kintana1585984 Inicio
//Funcao que retorna a situação da pessoa no plano ativo. 
function TCtrlWebDadosCadastrais.BuscaSituacaoFunc(iIdPessoa, iIdPessJur : integer ) : String;
var
cdsSituacao : TCMClientDataSet;
sSQL : String;
begin
   cdsSituacao := TCMClientDataSet.Create(nil);
   sSQL := '';
   sSQL := sSQL +
   'SELECT PPP.IDPESSOA, '+
   '       SP.IDSITPART, '+
   '       PPP.IDSITPLANOPREV, '+
   '       SPP.DESCRICAO, '+
   '       SP.DESCRICAO AS SITUACAO_FUNC '+
   '  FROM PARTPREVPLAN PPP, SITPART SP, SITPLANOPREV SPP '+
   ' WHERE IDPESSOA =  '+IntToStr(iIdPessoa)+
   '   AND PPP.IDSITPART = SP.IDSITPART  '+
   '   AND SPP.IDSITPLANOPREV = PPP.IDSITPLANOPREV  '+
   '   AND PPP.IDSITPLANOPREV <> 3  '+
   '   AND PPP.IDPESSJUR = '+IntToStr(iIdPessJur);

   cdsSituacao.Data := GetDataPacket(sSQL);
   result :=  cdsSituacao.FieldByName('SITUACAO_FUNC').AsString;
end;
//Fanuel Junior SOL174939 Kintana1585984 Fim



end.
