{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
        N. WO .............: 28045
 Data da Alteração..: 25/11/2025
 Responsável........: Leandro Pocebon
 Descrição..........: Ajuste consulta para o Oracle
--------------------------------------------------------------------------------
 N. SIG.............: 118663
 Data da Alteração..: 20/08/2021
 Responsável........: Ewerton Beltramini
 Descrição..........: Correção de erro ao excluir um arquivo.
--------------------------------------------------------------------------------  
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Rotina             : ListHistorico, ListProcessosFuncionario,
                      ListAcidTrabeSocial
 N. SIG..........   : 38475.60437
 Data da Alteração: : 22/12/2017
 Alteração Form:    : uCtrlRegOcorr
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Alteração da consulta que lista os históricos.
--------------------------------------------------------------------------------
 Nº SIG......: 21360
 Data........: 06/09/2016
 Responsável.: Michelle Suellyn Mota
 Descrição...: solicito que para o lançamentos dos eventos abaixo relacionados o
               sistema permita o lançamento apenas dos campos -
               "Tipo de Ocorrência" - "Data de Início" - e "Data Retorno".
 Alterações..: Alterada consulta para inclusão do campo descrição do CID na
               grid de Ocorrências.
--------------------------------------------------------------------------------
 Nº SOL           : 250391.17474
 Nº PPM           : 959204
 Data da Alteração: 08/04/2016
 Alteração Form   : Mudança no leiaute e novos campos
 Responsável      : Michelle Suellyn Mota
 Descrição        : Alterações de leiaute e novos campos para atender o eSocial.
 	                  Criação de novas consultas para alimentar listas.
--------------------------------------------------------------------------------
 Nº SOL           : 250384.17324
 Nº PPM           : 1070235
 Data da Alteração: 12/02/2016
 Alteração Form   : Leiaute e campos novos
 Responsável      : Michelle Suellyn Mota
 Descrição        : Mudança no leiaute e campos novos para adequar ao eSocial
--------------------------------------------------------------------------------
 Nº SOL............: 264783
 Nº PPM............: 1157993
 Data da Alteração.: 11/11/2015
 Responsável.......: André Imakawa
 Descrição.........: No insert da procedure InserirOcorrencia os parametros
                     e campos estavam incorretos.
                     Alinhado com Odelmo, tela do MODFOL não utiliza dados
                     do E-Social.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/08/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegOcorr;

interface

uses Classes, Db, Controls, SysUtils, uSistema, uCmDbObject, uCmControlObject,
  uCMClientDataSet, uCtrlCustomRH, uDbHstAsMed, uDbExame, uDbCatPess;
  //uDbCatPessXOutros; // Michelle Mota - SOL: 250391.17474 - PPM: 959204 

type
  TCtrlRegOcorr = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FCdsHstAsMed: TCMClientDataSet;
    FDbHstAsMed: TDbHstAsMed;
    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    FCdsHstAsMedXExame: TCMClientDataSet;
    FDbExame: TDbExame;
    FCdsCatPess: TCMClientDataSet;
    FDbCatPess: TDbCatPess;
    //FCdsCatPessXOutros: TCMClientDataSet; //Everson Cunha - SIG38475
    //FDbCatPessXOutros: TDbCatPessXOutros; //Everson Cunha - SIG38475
    // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListRegOcorr(IdPessoa: double = 0; CodTipoOcMed: double = 0;
      NumSeq: integer = 0): OleVariant; 
    function ListHistorico(IdPessoa: double): OleVariant;
    function ListAtestadoAnt(IdPessoa: double): OleVariant; overload; //Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Michelle Mota - SOL: 250391.17474 - PPM: 959204
    function ListResponsavel(vIdPessoa : Integer; tipo : string ): OleVariant;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    function ListRespTelefone(vIdPessoa : Integer): OleVariant;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235

    function GetProxNumSeq(IdPessoa: double; CodTipoOcMed: integer): integer;

    // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    {function InserirOcorrencia(IdPessoa: double; CodTipoOcMed: integer; DataIni, DataFim: TDate;
      IdExaminador: double; Avaliador, CodCID: string; Licenca, Avaliacao: double): boolean;}
    function InserirOcorrencia(IdPessoa: double; CodTipoOcMed: integer; DataIni, DataFim: TDate;
      IdExaminador, IdMotivo, TipoAcidTransito, OrgaoClasse: double;
      Avaliador, CodCID, FlgAlteraMotivo, FlgEfeitoRetro: string; Licenca, Avaliacao,
      AtestadoAnt: double): boolean;
    // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

    function GravarRegOcorr: boolean;
    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    function ListExames(IdPessoa, IdHsTasMed: string): OleVariant;
    //function ListMonitoraBioGrid(IdPessoa: double): OleVariant; //Everson Cunha - SIG38475
    //function ListAgenteQuimico : OleVariant; //Everson Cunha - SIG38475
    //function ListMatBio(vCODAGTQUIMICO : Integer): OleVariant; //Everson Cunha - SIG38475
    //function ListAnalise(vCODAGTQUIMICO, vCODMATERIALBIO : Integer ): OleVariant; //Everson Cunha - SIG38475
    function ListResponsavelOcorr(vIdPessoa : Integer ): OleVariant;
    function ListGridCAT(vIdPessoa : Integer ): OleVariant;
    //function ListGridParteAtingida(vidpessoa : Double ): OleVariant; //Everson Cunha - SIG38475
    function ListAtestadoAnt(IdPessoa, IdHstAsMedAtual: double): OleVariant; overload;
    //function ListGridCausador(vidpessoa : Double ): OleVariant; //Everson Cunha - SIG38475
    function ListCidade: OleVariant;
    function FiltraCidade(IdCidade : string): OleVariant;
    function RetornaCNPJFuncef: OleVariant;
    function ListCatOrigem(IdPessoa, numerocat: string): OleVariant;
    function ListCatPess(IdPessoa: string): OleVariant;
    //function ListCatPessXOutros(IdPessoa: string): OleVariant; //Everson Cunha - SIG38475
    function GetProxNumSeqHstAsMedXExame: Integer;
    function GetProxNumSeqCatPess: integer;
    function GetProxNumIdHstAsMed : Integer;
    function ListCodCID(vCodCid : String ): OleVariant;
    function ListSitGerAcidTrab(vIdSitGer : Integer ): OleVariant;
    function ListNatLesao(vIdNatLesao : Integer ): OleVariant;
    function ListParteAtingida(vCod : Integer ): OleVariant;
    function ListAgenteCausador(vCod: Integer ): OleVariant;
    procedure Operacao(metodo  :string);
    function VerificaDependeCatPess(vIdCatPess:Integer) : Integer;
    function VerificaDependeOcorr(vIdHstAsMed:Integer) : Integer;
    // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204

    //Cássio Rovaroto - SIG nº 38475.60437 - Início
    function ListProcessosFuncionario(pIdFuncionario: integer; pDataIniOcorr: TDateTime): OleVariant;
    //function ListAcidTrabeSocial : OleVariant; //Everson Cunha - SIG38475
    //Cássio Rovaroto - SIG nº 38475.60437 - Fim

    function ListProcRealizado : Olevariant; //Everson Cunha - SIG38475

    property CdsHstAsMed: TCMClientDataSet read FCdsHstAsMed write FCdsHstAsMed;
    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    property CdsHstAsMedXExame: TCMClientDataSet read FCdsHstAsMedXExame write FCdsHstAsMedXExame;
    property CdsCatPess: TCMClientDataSet read FCdsCatPess write FCdsCatPess;
    //property CdsCatPessXOutros: TCMClientDataSet read FCdsCatPessXOutros write FCdsCatPessXOutros; //Everson Cunha - SIG38475
    // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204


  end;

var
  vOperacao, vOperacaoFilho : string; // Michelle Mota - SOL: 250391.17474 - PPM: 959204

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRegOcorr }

constructor TCtrlRegOcorr.Create;
begin
  inherited;
  FDbHstAsMed := TDbHstAsMed.Create(Self);
  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  FDbExame := TDbExame.Create(Self);
  FDbCatPess := TDbCatPess.Create(Self);
  //FDbCatPessXOutros := TDbCatPessXOutros.Create(Self); //Everson Cunha - SIG38475

  vOperacaoFilho := '';
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
end;

destructor TCtrlRegOcorr.Destroy;
begin
  FDbHstAsMed.Free;
  if (IsAppServer) then
    FCdsHstAsMed.Free;
  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  FDbExame.Free;
  if (IsAppServer) then
    FCdsHstAsMedXExame.Free;
  FDbCatPess.Free;
  if (IsAppServer) then
    FCdsCatPess.Free;

  //FDbCatPessXOutros.Free; //Everson Cunha - SIG38475
  //if (IsAppServer) then      //Everson Cunha - SIG38475
  //  FCdsCatPessXOutros.Free; //Everson Cunha - SIG38475
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  inherited;
end;

procedure TCtrlRegOcorr.OnCreateAppServer;
begin
  inherited;
  FCdsHstAsMed := TCMClientDataSet.Create(nil);
  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  FCdsHstAsMedXExame := TCMClientDataSet.Create(nil);
  FCdsCatPess := TCMClientDataSet.Create(nil);
  //FCdsCatPessXOutros := TCMClientDataSet.Create(nil); //Everson Cunha - SIG38475
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
end;

procedure TCtrlRegOcorr.DoChangeDataBase;
begin
  inherited;
  FDbHstAsMed.DataBaseName := DataBaseName;
  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  FDbExame.DataBaseName := DataBaseName;
  FDbCatPess.DataBaseName := DataBaseName;
  //FDbCatPessXOutros.DataBaseName := DataBaseName; //Everson Cunha - SIG38475
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
end;

function TCtrlRegOcorr.ListRegOcorr(IdPessoa, CodTipoOcMed: double; NumSeq: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdPessoa = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL + CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  HSTASMED'+CR_LF+
    'WHERE'+CR_LF;

  if (IdPessoa = -1) then
    sSQL := sSQL + '  (1 = 2)'
  else
  begin
    if (IdPessoa > 0) then
      sSQL := sSQL + '  (IDPESSOA = '+FloatToStr(IdPessoa)+')';

    if (CodTipoOcMed > 0) then
    begin
      if (IdPessoa > 0) then
        sSQL := sSQL + ' AND'+CR_LF;

      sSQL := sSQL + '  (CODTIPOOCMED = '+FloatToStr(CodTipoOcMed)+')';
    end;

    if (NumSeq > 0) then
      sSQL := sSQL + ' AND' +CR_LF+ '  (NUMSEQ = '+IntToStr(NumSeq)+')';
  end;

  Result := GetDataPacket(sSQL);
end;

function TCtrlRegOcorr.ListHistorico(IdPessoa: double): OleVariant;
var
  sql : string;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.*, H.CODTIPOOCMED AS CODTIPOOCMED_OLD, T.DESCRTIPOOCMED,'+CR_LF+
    '  NVL(DATAREAL,DATAPLAN) AS DATAREF, H.IDEXAMINADOR'+CR_LF+
    //',H.CODPTCORPESOCIAL ,H.CODAGTESOCIAL, H.CODSDOENCAESOCIAL,H.CODSTESOCIAL,H.CODNTESOCIAL'+CR_LF+
    '  ,(select SUBSTR(DESCRCID,0,200) AS DESCRCID from CID C where C.CODCID = H.CODCID ) as DESCCID '+CR_LF+ // Michelle Mota - SIG 21360
    //Cássio Rovaroto - SIG nº 38475.60437 - Início
    //',(SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM PARTECPATGESOCIAL PA WHERE PA.CODPTCORPESOCIAL = H.CODPTCORPESOCIAL ) AS DESC1,'+CR_LF+
    //' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM AGNTCAUSADORACIDTESOCIAL PA WHERE PA.CODAGTESOCIAL = H.CODAGTESOCIAL ) AS DESC2,'+CR_LF+
    //' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM STGERD_DOENCAESOCIAL PA WHERE PA.CODSDOENCAESOCIAL = H.CODSDOENCAESOCIAL ) AS DESC3,'+CR_LF+
    //' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM STGERDACIDTESOCIAL PA WHERE PA.CODSTESOCIAL = H.CODSTESOCIAL ) AS DESC4,'+CR_LF+
    //' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM NTLESAOESOCIAL PA WHERE PA.CODNTESOCIAL = H.CODNTESOCIAL ) AS DESC5'+CR_LF+
    //Everson Cunha - SIG38475 - Ini
    {',(SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM PARTECORPOATINGIDA PA WHERE PA.CODIGO = H.CODPTCORPESOCIAL ) AS DESC1,'+CR_LF+
    ' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM AGENTECAUSADORACIDTRAB PA WHERE PA.CODIGO = H.CODAGTESOCIAL ) AS DESC2,'+CR_LF+
    ' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM SITGERADOENCAPROFISSIONAL PA WHERE PA.CODIGO = H.CODSDOENCAESOCIAL ) AS DESC3,'+CR_LF+
    ' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM SITUACAOGERADORAACIDTRAB PA WHERE PA.CODIGO = H.CODSTESOCIAL ) AS DESC4,'+CR_LF+
    ' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM NATUREZALESAO PA WHERE PA.CODIGO = H.CODNTESOCIAL ) AS DESC5'+CR_LF+}
    //Everson Cunha - SIG38475 - Fim
    //Cássio Rovaroto - SIG nº 38475.60437 - Fim
    ' FROM'+CR_LF+
    '  HSTASMED H, TIPOCMED T'+CR_LF+
    ' WHERE'+CR_LF+
    '  (H.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.CODTIPOOCMED = T.CODTIPOOCMED)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DATAREF DESC');

    sql := 'SELECT'+CR_LF+
    '  H.*, H.CODTIPOOCMED AS CODTIPOOCMED_OLD, T.DESCRTIPOOCMED,'+CR_LF+
    '  NVL(DATAREAL,DATAPLAN) AS DATAREF, H.IDEXAMINADOR'+CR_LF+
    //',H.CODPTCORPESOCIAL ,H.CODAGTESOCIAL, H.CODSDOENCAESOCIAL,H.CODSTESOCIAL,H.CODNTESOCIAL'+CR_LF+
    //Everson Cunha - SIG38475 - Ini
    {',(SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM PARTECPATGESOCIAL PA WHERE PA.CODPTCORPESOCIAL = H.CODPTCORPESOCIAL ) AS DESC1,'+CR_LF+
    ' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM AGNTCAUSADORACIDTESOCIAL PA WHERE PA.CODAGTESOCIAL = H.CODAGTESOCIAL ) AS DESC2,'+CR_LF+
    ' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM STGERD_DOENCAESOCIAL PA WHERE PA.CODSDOENCAESOCIAL = H.CODSDOENCAESOCIAL ) AS DESC3,'+CR_LF+
    ' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM STGERDACIDTESOCIAL PA WHERE PA.CODSTESOCIAL = H.CODSTESOCIAL ) AS DESC4,'+CR_LF+
    ' (SELECT SUBSTR(PA.DESCRICAO,0,200) AS DESCRICAO  FROM NTLESAOESOCIAL PA WHERE PA.CODNTESOCIAL = H.CODNTESOCIAL ) AS DESC5'+CR_LF+}
    //Everson Cunha - SIG38475 - Fim
    ' FROM'+CR_LF+
    '  HSTASMED H, TIPOCMED T'+CR_LF+
    ' WHERE'+CR_LF+
    '  (H.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.CODTIPOOCMED = T.CODTIPOOCMED)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DATAREF DESC';

    sql := sql;
end;

function TCtrlRegOcorr.GetProxNumSeq(IdPessoa: double; CodTipoOcMed: integer): integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  MAX(NUMSEQ) AS MAX_NUM'+CR_LF+
    'FROM'+CR_LF+
    '  HSTASMED'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (CODTIPOOCMED = ' +IntToStr(CodTipoOcMed)+ ')');

  Result := _Cds.FieldByName('MAX_NUM').asInteger + 1;

  _Cds.Free;
end;

// Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 ER180
// Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204    
procedure TCtrlRegOcorr.Operacao(metodo:string);
begin
  vOperacao := metodo;
end;

function TCtrlRegOcorr.VerificaDependeCatPess(vIdCatPess:Integer) : Integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  count(*) AS QtdDepend'+CR_LF+
    'FROM'+CR_LF+
    '  CatPess where idcatpessorigem =  ' + IntToStr(vIdCatPess) );

  Result := _Cds.FieldByName('QtdDepend').asInteger;

  _Cds.Free;

end;

function TCtrlRegOcorr.VerificaDependeOcorr(vIdHstAsMed:Integer) : Integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  count(*) AS QtdDepend'+CR_LF+
    'FROM'+CR_LF+
    //Ewerton Beltramini - 20/08/2021 - SIG118663
    //'  HSTASMED where IDATESTADOANT =  ' + IntToStr(vIdHstAsMed) );
    '  LOGPLANUS.LOG_PLANUS_HSTASMED where IDATESTADOANT = ' + IntToStr(vIdHstAsMed) );   

  Result := _Cds.FieldByName('QtdDepend').asInteger;

  _Cds.Free;

end;

function TCtrlRegOcorr.GetProxNumSeqHstAsMedXExame: integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    //'  CM.SEQIDHSTASMEDXMONITOBIO.NEXTVAL AS MAX_NUM'+CR_LF+ //Everson Cunha - SIG38475
    '  CM.SEQIDHSTASMEDXEXAME.NEXTVAL AS MAX_NUM'+CR_LF+       //Everson Cunha - SIG38475
    'FROM'+CR_LF+
    '  DUAL ' );

  Result := _Cds.FieldByName('MAX_NUM').asInteger;

  _Cds.Free;

end;

function TCtrlRegOcorr.GetProxNumSeqCatPess: integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  CM.SEQIDCATPESS.NEXTVAL AS MAX_NUM'+CR_LF+
    'FROM'+CR_LF+
    '  DUAL ' );

  Result := _Cds.FieldByName('MAX_NUM').asInteger;

  _Cds.Free;

end;

function TCtrlRegOcorr.GetProxNumIdHstAsMed: integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  CM.SEQIDHSTASMED_HSTASMED.nextval AS MAX_NUM'+CR_LF+
    'FROM'+CR_LF+
    '  DUAL ' );

  Result := _Cds.FieldByName('MAX_NUM').asInteger;

  _Cds.Free;

end;
// Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
function TCtrlRegOcorr.InserirOcorrencia(IdPessoa: double; CodTipoOcMed: integer;
  DataIni, DataFim: TDate; IdExaminador, IdMotivo, TipoAcidTransito, OrgaoClasse: double;
   Avaliador, CodCID, FlgAlteraMotivo, FlgEfeitoRetro: string;
  Licenca, Avaliacao, AtestadoAnt: double): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.InserirOcorrencia(IdPessoa, CodTipoOcMed, DataIni, DataFim,
      IdExaminador, Avaliador, CodCID, Licenca, Avaliacao,IdMotivo,TipoAcidTransito,
      OrgaoClasse,FlgAlteraMotivo,FlgEfeitoRetro,AtestadoAnt);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      _Cds.Data := GetDataPacket(
        'SELECT NUMSEQ'+CR_LF+
        'FROM   HSTASMED'+CR_LF+
        'WHERE  (IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
        '       (CODTIPOOCMED = ' +IntToStr(CodTipoOcMed)+ ') AND'+CR_LF+
        '       (DATAREAL     = TO_DATE(' +QuotedStr(DateToStr(DataIni))+ ',''DD/MM/YYYY''))');
      if not(_Cds.IsEmpty) then
        raise Exception.Create('Já existe esse Tipo de Ocorrência nessa data.' +CR_LF+
          'Verifique no módulo Medicina do Trabalho.');

      StartTransaction;

      Result := ExecSQL(
        'INSERT INTO HSTASMED (IDHSTASMED,IDPESSOA,CODTIPOOCMED,NUMSEQ,DATAREAL,' + // Michelle Mota - SOL: 250384.17324 - PPM: 1070235 ER180
        'EXAMINADOR,IDEXAMINADOR,CODCID,AVALIACAO,LICENCA,' + //)' +CR_LF+
        'IDMOTIVO,TIPOACIDTRANSITO,ORGAOCLASSE,FLGALTERAMOTIVO,FLGEFEITORETRO,IDATESTADOANT)' +CR_LF+
        //Andre Imakawa - 11/11/2015 - Sol: 264783
        // Removido campos abaixo(E-Social)
        //'CODPTCORPESOCIAL,CODAGTESOCIAL, CODSDOENCAESOCIAL,CODSTESOCIAL,CODNTESOCIAL)' +CR_LF+
        'VALUES(' +
        'CM.SEQIDHSTASMED_HSTASMED.NEXTVAL,' +  // idhstasmed - chave da tabela  - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 ER180
        FloatToStr(IdPessoa) +','+
        IntToStr(CodTipoOcMed) +','+
        IntToStr(GetProxNumSeq(IdPessoa, CodTipoOcMed)) +','+
        'TO_DATE(' +QuotedStr(DateToStr(DataIni))+ ',''DD/MM/YYYY''),' +
        QuotedStr(Trim(Avaliador)) +','+
        IFF(IdExaminador=0, 'NULL', FloatToStr(IdExaminador)) +','+
        QuotedStr(Trim(CodCID)) +','+
        FloatToStr(Avaliacao) +','+
        FloatToStr(Licenca)+','+ //+')');//+','+  //Michelle Mota - SOL: 250384.17324 - PPM: 1070235 ER180
        // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 ER180
        FloatToStr(IdMotivo) +','+
        //FloatToStr(TipoAcidTransito) +','+
        IFF(TipoAcidTransito=0, 'NULL', FloatToStr(TipoAcidTransito)) +','+
        FloatToStr(OrgaoClasse) +','+
        QuotedStr(FlgAlteraMotivo) +','+
        QuotedStr(FlgEfeitoRetro) +','+
        //FloatToStr(AtestadoAnt) +')');
        IFF(AtestadoAnt=0, 'NULL', FloatToStr(AtestadoAnt)) + ')'); //hom  24/03/2016 - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 ER180
        // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 ER180

//     intToStr(CODPTCORPESOCIAL)+','+
//     intToStr(CODAGTESOCIAL)+','+
//     intToStr(CODSDOENCAESOCIAL)+','+
//     intToStr(CODSTESOCIAL)+','+
//     intToStr(CODNTESOCIAL)+')'); 

      if (Result) then
        Commit
      else
        raise Exception.Create(MessageInfo);
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
// Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 ER180

function TCtrlRegOcorr.GravarRegOcorr: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRegOcorr(FCdsHstAsMed.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    Result := Connection.AppServer.GravarRegOcorr(FCdsHstAsMedXExame.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
    Result := Connection.AppServer.GravarRegOcorr(FCdsCatPess.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;

    //Result := Connection.AppServer.GravarRegOcorr(FCdsCatPessXOutros.Data); //Everson Cunha - SIG38475
    //if not(Result) then                                //Everson Cunha - SIG38475
    //  MessageInfo := Connection.AppServer.MessageInfo; //Everson Cunha - SIG38475
    // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  end
  else
  begin
    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    {FCdsHstAsMed.DisableControls;
      try
        StartTransaction;
        Result := ApplyCds(FCdsHstAsMed, FDbHstAsMed, [], []);
        if (Result) then
          Commit
        else
          raise Exception.Create(FDbHstAsMed.MessageInfo);
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
      FCdsHstAsMed.EnableControls;}

    if (vOperacao = 'Delete') then   // no modo excluir usa ordem filho/pai FK
    begin
      FCdsHstAsMedXExame.DisableControls;
      FCdsHstAsMed.DisableControls;
      try
        StartTransaction;
        Result := ApplyCds(FCdsHstAsMedXExame, FDbExame, [], []);
        if not (result) then
          raise Exception.Create(FDbExame.MessageInfo);

        Result := ApplyCds(FCdsHstAsMed, FDbHstAsMed, [], []);
        if not (result) then
          raise Exception.Create(FDbHstAsMed.MessageInfo);

        if (Result) then
          Commit;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
      FCdsHstAsMedXExame.EnableControls;
      FCdsHstAsMed.EnableControls;

      //FCdsCatPessXOutros.DisableControls; //Everson Cunha - SIG38475
      FCdsCatPess.DisableControls;
      try
        StartTransaction;
        //Result := ApplyCds(FCdsCatPessXOutros, FDbCatPessXOutros, [], []); //Everson Cunha - SIG38475
        //if not (result) then                                               //Everson Cunha - SIG38475
        //  raise Exception.Create(FDbCatPessXOutros.MessageInfo);           //Everson Cunha - SIG38475

        Result := ApplyCds(FCdsCatPess, FDbCatPess, [], []);
        if not (result) then
          raise Exception.Create(FDbCatPess.MessageInfo);

        if (Result) then
          Commit;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
      //FCdsCatPessXOutros.EnableControls; //Everson Cunha - SIG38475
      FCdsCatPess.EnableControls;
    end
    else // insert e update ordem pai e filho - PK
    begin
      FCdsHstAsMed.DisableControls;
      try
        StartTransaction;
        Result := ApplyCds(FCdsHstAsMed, FDbHstAsMed, [], []);
        if (Result) then
          Commit
        else
          raise Exception.Create(FDbHstAsMed.MessageInfo);
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
      FCdsHstAsMed.EnableControls;

      FCdsHstAsMedXExame.DisableControls;
      try
        StartTransaction;
        Result := ApplyCds(FCdsHstAsMedXExame, FDbExame, [], []);
        if (Result) then
          Commit
        else
          raise Exception.Create(FDbExame.MessageInfo);
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
      FCdsHstAsMedXExame.EnableControls;

      FCdsCatPess.DisableControls;
      try
        StartTransaction;
        Result := ApplyCds(FCdsCatPess, FDbCatPess, [], []);
        if (Result) then
          Commit
        else
          raise Exception.Create(FDbCatPess.MessageInfo);
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
      FCdsCatPess.EnableControls;

      //Everson Cunha - SIG38475 - ini
      {FCdsCatPessXOutros.DisableControls;
      try
        StartTransaction;
        Result := ApplyCds(FCdsCatPessXOutros, FDbCatPessXOutros, [], []);
        if (Result) then
          Commit
        else
          raise Exception.Create(FDbCatPessXOutros.MessageInfo);
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
      FCdsCatPessXOutros.EnableControls;}
      //Everson Cunha - SIG38475 - Fim
    end;
    // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  end;
end;

// Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
function TCtrlRegOcorr.ListResponsavel(vIdPessoa : Integer; tipo : string ): OleVariant;
begin
  if (tipo = 'R') then
    begin
      Result := GetDataPacket(
      'SELECT UPPER(P.RAZAOSOCIAL) RAZAOSOCIAL,'+CR_LF+
      '       TRIM(D_CRM.NUMDOCUMENTO) CRM_CRE_CRO,'+CR_LF+
      '       TRIM(E.CODESTADO) UF_CRM '+CR_LF+
      '  FROM FORNSERV F '+CR_LF+
      '  JOIN DOCPESSOA D_CRM '+CR_LF+
      '    ON F.IDPESSOA = D_CRM.IDPESSOA '+CR_LF+
      '   AND D_CRM.IDDOCUMENTO = 47 -- {CRM/CRO/CRE} '+CR_LF+
      '  JOIN ESTADO E '+CR_LF+
      '    ON E.IDESTADO = D_CRM.IDESTADO  '+CR_LF+
      '  JOIN PESSOA P  '+CR_LF+
      '    ON P.IDPESSOA = F.IDPESSOA  '+CR_LF+
      ' WHERE P.IDPESSOA = ' + IntToStr( vIdPessoa ) );
    end
  else
    begin
      Result := GetDataPacket(
      'SELECT P.RAZAOSOCIAL,'+CR_LF+
      '       D_CRM.NUMDOCUMENTO CRM_CRE_CRO,'+CR_LF+
      '       E.CODESTADO UF_CRM,'+CR_LF+
      '       D_NIS.NUMDOCUMENTO NIS'+CR_LF+
      'FROM FORNSERV F'+CR_LF+
      '  JOIN DOCPESSOA D_CRM ON F.IDPESSOA = D_CRM.IDPESSOA AND'+CR_LF+
      '       D_CRM.IDDOCUMENTO = 47 '+CR_LF+ {CRM/CRO/CRE}
      '  JOIN ESTADO E ON E.IDESTADO = D_CRM.IDESTADO'+CR_LF+
      '  JOIN DOCPESSOA D_NIS ON F.IDPESSOA = D_NIS.IDPESSOA AND'+CR_LF+
      '       D_NIS.IDDOCUMENTO = 48'+CR_LF+ {NIS}
      '  JOIN PESSOA P ON P.IDPESSOA = F.IDPESSOA'+CR_LF+
      'WHERE P.IDPESSOA = ' + IntToStr( vIdPessoa ) );
    end;
end;

function TCtrlRegOcorr.ListRespTelefone(vIdPessoa : Integer): OleVariant;
begin
  Result := GetDataPacket(
      'SELECT TRIM(T.DDD) || '' '' || TRIM(T.NUMERO) TEL_CONTATO '+CR_LF+
      '  FROM (SELECT MAX(TI.IDTELEFONE) MAIOR, TI.IDPESSOA '+CR_LF+
      '          FROM TELENDPESS TI '+CR_LF+
      '         WHERE TI.TIPO LIKE ''%C%'' '+CR_LF+
      '         GROUP BY TI.IDPESSOA) TII '+CR_LF+
      '  JOIN TELENDPESS T '+CR_LF+
      '    ON TII.MAIOR = T.IDTELEFONE '+CR_LF+
      ' WHERE TII.IDPESSOA = ' + IntToStr( vIdPessoa ) );
end;

function TCtrlRegOcorr.ListAtestadoAnt(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT NVL(DATAREAL, DATAPLAN) AS DATAREAL, '+CR_LF+
    '  SUBSTR(NVL(DATAREAL, DATAPLAN) || '' - '' || T.DESCRTIPOOCMED || NVL2(C.DESCRCID, '' - '' || C.DESCRCID, C.DESCRCID),0,255) list_combo, '+CR_LF+
    '  IDHSTASMED AS ATESTADOANT '+CR_LF+
    '  FROM   '+CR_LF+
    '  HSTASMED H, TIPOCMED T, CID C '+CR_LF+
    '  WHERE '+CR_LF+
    '  (H.CODTIPOOCMED = T.CODTIPOOCMED) AND  '+CR_LF+
    '  (C.CODCID(+) = H.CODCID) AND '+CR_LF+
    '  (H.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') '+CR_LF+
    'ORDER BY '+CR_LF+
    '  1 ');

end;

function TCtrlRegOcorr.ListCatOrigem(IdPessoa,numerocat: string): OleVariant;
var
  sSql : string;
begin
  sSql := '';
  sSql := sSql + ' SELECT IDCATPESS, DTACIDENTE, NUMEROCAT, DTACIDENTE || '' - '' || NUMEROCAT as LISTA_COMBO '+CR_LF+
    'FROM CATPESS P ';

  if (IdPessoa = '-1') then
    begin
      sSql := sSql + ' WHERE 1 = 2 '
    end
  else
    begin
      sSql := sSql + ' WHERE IDPESSOA = ' + (idpessoa)
    end;

    sSql := sSql + '  AND NUMEROCAT <> ' + quotedstr(numerocat) ;
    sSql := sSql + ' ORDER BY 2';

  Result := GetDataPacket( sSql );
end;

function TCtrlRegOcorr.ListCatPess(IdPessoa: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT  '+CR_LF+
    //Everson Cunha - SIG38475 - Ini
    {'  case cp.tiporegistrador when ''1'' then ''Empregador'' '+CR_LF+
    '                          when ''2'' then ''Cooperativa'' '+CR_LF+
    '                          when ''3'' then ''Sindicato de trabalhadores avulsos não portuários'' '+CR_LF+
    '                          when ''4'' then ''Órgão Gestor de Mão de Obra'' '+CR_LF+
    '                          when ''5'' then ''Empregado'' '+CR_LF+
    '                          when ''6'' then ''Dependente do Empregado'' '+CR_LF+
    '                          when ''7'' then ''Entidade Sindical competente'' '+CR_LF+
    '                          when ''8'' then ''Médico Assistente'' '+CR_LF+
    '                          when ''9'' then ''Autoridade Pública'' '+CR_LF+
    '  end tiporegistr,'+CR_LF+
    '  cp.NUMEROINSCR,'+CR_LF+}
    //Everson Cunha - SIG38475 - Fim
    '  cp.NUMEROCAT,'+CR_LF+
    '  case cp.tipoacidente when ''1'' then ''Típico'' '+CR_LF+
    '                       when ''2'' then ''Doença'' '+CR_LF+
    '                       when ''3'' then ''Trajeto'' '+CR_LF+
    '  end tipoacid,'+CR_LF+
    '  case cp.tipocat when ''1'' then ''Inicial'' '+CR_LF+
    '                  when ''2'' then ''Reabertura'' '+CR_LF+
    '                  when ''3'' then ''Comunicação de Óbito'' '+CR_LF+
    '  end desctipocat,'+CR_LF+
    '  cp.DTACIDENTE,'+CR_LF+
    '  case cp.CATEMITIDAPOR when ''1'' then ''Iniciativa do Empregador'' '+CR_LF+
    '                        when ''2'' then ''Ordem Judicial'' '+CR_LF+
    '                        when ''3'' then ''Determinação de órgão fiscalizador'' '+CR_LF+
    '  end catemitpor,'+CR_LF+
    '  cp.IDSITGERADORAACIDTRAB, substr(sit.DESCRICAO,0,255) as DescSitGerTrab, cp.idcatpess, cp.* '+CR_LF+
    'from'+CR_LF+
    '  catpess cp left join SITUACAOGERADORAACIDTRAB sit on cp.IDSITGERADORAACIDTRAB = sit.IDSITGERADORAACIDTRAB '+CR_LF+
    'where cp.idpessoa = ' + ( IdPessoa ) +CR_LF+
    'order by cp.DTACIDENTE desc ');
end;

//Everson Cunha - SIG38475 - Ini
{function TCtrlRegOcorr.ListCatPessXOutros(IdPessoa: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT * '+CR_LF+
    'FROM CATPESSXOUTROS P '+CR_LF+
    'WHERE P.IDCATPESS in (select idcatpess from CatPess where idpessoa = ' + ( idpessoa ) + ')');
end;}
//Everson Cunha - SIG38475 - Fim

function TCtrlRegOcorr.RetornaCNPJFuncef: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT P.NOME,'+CR_LF+
    '   TRIM(P.NUMDOCUMENTO) CNPJ_FUNCEF '+CR_LF+
    'FROM PESSOA P '+CR_LF+
    'WHERE P.IDPESSOA = 94099 ');
end;

function TCtrlRegOcorr.ListCidade: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  CIDADES ORDER BY NOME');
end;

function TCtrlRegOcorr.FiltraCidade(IdCidade : string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  CIDADES '+CR_LF+
    'WHERE IDCIDADES = ' + (IdCidade) +CR_LF+
    'ORDER BY NOME');
end;

function TCtrlRegOcorr.ListExames(IdPessoa, IdHsTasMed : string): OleVariant;
var
  sql : string;
begin
  //Everson Cunha - SIG38475 - Ini - (Refazer o select)
  {Result := GetDataPacket(
      'SELECT M.DTINICIO, M.DTFIM, AGT.DESCRICAOAGT, AGT.DESCRICAOMATBIO, '+CR_LF+
    '       AGT.DESCRICAOANALISE, '+CR_LF+
    '       CASE M.INTERPRETEXAME WHEN ''1'' THEN  ''EE'' '+CR_LF+
    '                             WHEN ''2'' THEN ''SC'' '+CR_LF+
    '                             WHEN ''3'' THEN ''SC+'' END AS INTERPRETEXAM, '+CR_LF+
    '       CASE M.ORDEMEXAME WHEN ''1'' THEN ''REFERENCIAL'' '+CR_LF+
    '                         WHEN ''2'' THEN ''SEQUENCIAL'' END ORDEMEXAM, '+CR_LF+
    '       CASE M.INDICARESULTADO WHEN ''1'' THEN ''NORMAL'' '+CR_LF+
    '                              WHEN ''2'' THEN ''ALTERADO'' '+CR_LF+
    '                              WHEN ''3'' THEN ''ESTÁVEL'' '+CR_LF+
    '                              WHEN ''4'' THEN ''AGRAVAMENTO'' END INDICARESULT, '+CR_LF+
    '       P.NOME RESPONSAVEL, H.*, M.* '+CR_LF+
    'FROM HSTASMED H, HSTASMEDXMONITOBIO M, PESSOA P, AGTQUIMICOXMATBIOXANALISE AGT '+CR_LF+
    'WHERE '+CR_LF+
    '      H.IDPESSOA     = ' +(IdPessoa) +CR_LF+
    '  and H.IDHSTASMED     = ' +(IdHsTasMed) +CR_LF+
    '  and (H.IDHSTASMED = M.IDHSTASMED) '+CR_LF+
    '  AND (P.IDPESSOA = H.IDPESSOA) '+CR_LF+
    '  AND M.CODAGTQUIMICO = AGT.CODAGTQUIMICO '+CR_LF+
    '  AND M.CODMATERIALBIO = AGT.CODMATERIALBIO '+CR_LF+
    '  AND M.CODANALISE = AGT.CODANALISE '+CR_LF+
    'ORDER BY m.DTINICIO DESC ');   }

  //WO28045 Leandro - Inicio
  sql := ' SELECT SUBSTR(PR.DESC_PROC_REALIZADO, 0, 254) DESC_PROC_REDUZIDA, '+CR_LF+
         '        CASE HXE.ORDEMEXAME '+CR_LF+
         '          WHEN ''1'' THEN ''Inicial'' '+CR_LF+
         '          WHEN ''2'' THEN ''Sequencial'' END DESC_ORDEMEXAME, '+CR_LF+
         '        CASE HXE.INDICARESULTADO '+CR_LF+
         '          WHEN ''1'' THEN ''Normal'' '+CR_LF+
         '          WHEN ''2'' THEN ''Alterado'' '+CR_LF+
         '          WHEN ''3'' THEN ''Estável'' '+CR_LF+
         '          WHEN ''4'' THEN ''Agravamento'' END DESC_INDICARESULTADO, '+CR_LF+
         '          PR.*, HXE.* '+CR_LF+
         '     FROM CM.HSTASMED H '+CR_LF+
         '     JOIN CM.HSTASMEDXEXAME HXE ON HXE.IDHSTASMED = H.IDHSTASMED '+CR_LF+
         '     JOIN CM.PROCEDIMENTO_REALIZADO PR ON PR.ID_PROC_REALIZADO = HXE.ID_PROC_REALIZADO '+CR_LF+
         '    WHERE H.IDPESSOA   = ' + (IdPessoa)   +CR_LF+
         '      AND H.IDHSTASMED = ' + (IdHsTasMed) +CR_LF+
         '    ORDER BY HXE.DTEXAME DESC ';
  //WO28045 Leandro - Fim

  Result := GetDataPacket(sql);
  //Everson Cunha - SIG38475 - Fim
end;

//Everson Cunha - SIG38475 - Ini
{function TCtrlRegOcorr.ListMonitoraBioGrid(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT M.DTINICIO, M.DTFIM, AGT.DESCRICAOAGT, AGT.DESCRICAOMATBIO, '+CR_LF+
    '       AGT.DESCRICAOANALISE, '+CR_LF+
    '       CASE M.INTERPRETEXAME WHEN ''1'' THEN  ''EE'' '+CR_LF+
    '                             WHEN ''2'' THEN ''SC'' '+CR_LF+
    '                             WHEN ''3'' THEN ''SC+'' END AS INTERPRETEXAME, '+CR_LF+
    '       CASE M.ORDEMEXAME WHEN ''1'' THEN ''REFERENCIAL'' '+CR_LF+
    '                         WHEN ''2'' THEN ''SEQUENCIAL'' END ORDEMEXAME, '+CR_LF+
    '       CASE M.INDICARESULTADO WHEN ''1'' THEN ''NORMAL'' '+CR_LF+
    '                              WHEN ''2'' THEN ''ALTERADO'' '+CR_LF+
    '                              WHEN ''3'' THEN ''ESTÁVEL'' '+CR_LF+
    '                              WHEN ''4'' THEN ''AGRAVAMENTO'' END INDICARESULTADO, '+CR_LF+
    '       P.NOME RESPONSAVEL, H.* '+CR_LF+
    'FROM HSTASMED H, HSTASMEDXMONITOBIO M, PESSOA P, AGTQUIMICOXMATBIOXANALISE AGT '+CR_LF+
    'WHERE '+CR_LF+
    '      H.IDPESSOA     = ' +FloatToStr(IdPessoa) +CR_LF+
    '  and (H.IDHSTASMED = M.IDHSTASMED) '+CR_LF+
    '  AND (P.IDPESSOA = H.IDPESSOA) '+CR_LF+
    '  AND M.CODAGTQUIMICO = AGT.CODAGTQUIMICO '+CR_LF+
    '  AND M.CODMATERIALBIO = AGT.CODMATERIALBIO '+CR_LF+
    '  AND M.CODANALISE = AGT.CODANALISE '+CR_LF+
    'ORDER BY m.DTINICIO DESC ');
end;

function TCtrlRegOcorr.ListAgenteQuimico: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT AGT.CODAGTQUIMICO || '' - '' || AGT.DESCRICAOAGT LISTA_COMBO,'+CR_LF+
    '       AGT.CODAGTQUIMICO'+CR_LF+
    ' FROM AGTQUIMICOXMATBIOXANALISE AGT'+CR_LF+
    'ORDER BY AGT.CODAGTQUIMICO');
end;

function TCtrlRegOcorr.ListMatBio(vCODAGTQUIMICO : Integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT MAT.CODMATERIALBIO || '' - '' || MAT.DESCRICAOMATBIO LISTA_COMBO,'+CR_LF+
    '       MAT.CODMATERIALBIO'+CR_LF+
    ' FROM AGTQUIMICOXMATBIOXANALISE MAT'+CR_LF+
    'WHERE MAT.CODAGTQUIMICO = ' + IntToStr( vCODAGTQUIMICO ) +CR_LF+
    'ORDER BY MAT.CODMATERIALBIO');
end;

function TCtrlRegOcorr.ListAnalise(vCODAGTQUIMICO, vCODMATERIALBIO : Integer ): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT ANA.CODANALISE || '' - '' || ANA.DESCRICAOANALISE LISTA_COMBO,'+CR_LF+
    '       ANA.CODANALISE'+CR_LF+
    ' FROM AGTQUIMICOXMATBIOXANALISE ANA'+CR_LF+
    'WHERE ANA.CODAGTQUIMICO = ' + IntToStr( vCODAGTQUIMICO ) +CR_LF+
    '  AND ANA.CODMATERIALBIO = ' + IntToStr( vCODMATERIALBIO ) );
end;}
//Everson Cunha - SIG38475 - Fim

function TCtrlRegOcorr.ListResponsavelOcorr(vIdPessoa : Integer ): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT UPPER(P.RAZAOSOCIAL) RAZAOSOCIAL, '+CR_LF+
    '       TRIM(D_CRM.NUMDOCUMENTO) CRM_CRE_CRO,'+CR_LF+
    '       TRIM(E.CODESTADO) UF_CRM'+CR_LF+
    '  FROM FORNSERV F'+CR_LF+
    '  JOIN DOCPESSOA D_CRM ON F.IDPESSOA = D_CRM.IDPESSOA AND D_CRM.IDDOCUMENTO = 47 -- {CRM/CRO/CRE}'+CR_LF+
    '  JOIN PESSOA P ON P.IDPESSOA = F.IDPESSOA'+CR_LF+
    '  LEFT JOIN ESTADO E ON E.IDESTADO = D_CRM.IDESTADO /*Coloquei com LEFT JOIN para dar a MSG009*/'+CR_LF+
    'WHERE P.IDPESSOA = ' + IntToStr( vIdPessoa ) );
end;

function TCtrlRegOcorr.ListCodCID(vCodCid : String ): OleVariant;
begin
  Result := GetDataPacket('select * from cid where codcid = ' + quotedstr( vCodCid ) );
end;

function TCtrlRegOcorr.ListSitGerAcidTrab(vIdSitGer : Integer ): OleVariant;
begin
  Result := GetDataPacket('select * from situacaogeradoraacidtrab where IDSITGERADORAACIDTRAB = ' + IntToStr( vIdSitGer ) );
end;

function TCtrlRegOcorr.ListNatLesao(vIdNatLesao : Integer ): OleVariant;
begin
  Result := GetDataPacket('select * from naturezalesao where IDNATLESAO = ' + IntToStr( vIdNatLesao ) );
end;

function TCtrlRegOcorr.ListParteAtingida(vCod : Integer ): OleVariant;
begin
  Result := GetDataPacket('select * from partecorpoatingida where codigo = ' + IntToStr( vCod ) );
end;

function TCtrlRegOcorr.ListAgenteCausador(vCod : Integer ): OleVariant;
begin
    Result := GetDataPacket('select * from AGENTECAUSADORACIDTRAB where codigo = ' + IntToStr( vCod ) );
end;

function TCtrlRegOcorr.ListGridCAT(vIdPessoa : Integer ): OleVariant;
begin
  Result := GetDataPacket(
    'select '+CR_LF+
    //Everson Cunha - SIG38475 - Ini
    {'  case cp.tiporegistrador when ''1'' then ''EMPREGADOR'' '+CR_LF+
    '                          when ''2'' then ''COOPERATIVA'' '+CR_LF+
    '                          when ''3'' then ''SINDICATO DE TRABALHADORES AVULSOS NÃO PORTUÁRIOS'' '+CR_LF+
    '                          when ''4'' then ''ÓRGÃO GESTOR DE MÃO DE OBRA'' '+CR_LF+
    '                          when ''5'' then ''EMPREGADO'' '+CR_LF+
    '                          when ''6'' then ''DEPENDENTE DO EMPREGADO'' '+CR_LF+
    '                          when ''7'' then ''ENTIDADE SINDICAL COMPETENTE'' '+CR_LF+
    '                          when ''8'' then ''MÉDICO ASSISTENTE'' '+CR_LF+
    '                          when ''9'' then ''AUTORIDADE PÚBLICA'' '+CR_LF+
    '  end tiporegistrador,'+CR_LF+
    '  cp.NUMEROINSCR,'+CR_LF+ }
    //Everson Cunha - SIG38475 - Fim
    '  cp.NUMEROCAT,'+CR_LF+
    '  case cp.tipoacidente when ''1'' then ''TÍPICO'' '+CR_LF+
    '                       when ''2'' then ''DOENÇA'' '+CR_LF+
    '                       when ''3'' then ''TRAJETO PARA O LOCAL DE TRABALHO OU ENTRE O LOCAL DE TRABALHO E A RESIDÊNCIA DO EMPREGADO'' '+CR_LF+
    '  end tipoacidente,'+CR_LF+
    '  case cp.tipocat when ''1'' then ''INICIAL'' '+CR_LF+
    '                  when ''2'' then ''REABERTURA'' '+CR_LF+
    '                  when ''3'' then ''COMUNICAÇÃO DE ÓBITO'' '+CR_LF+
    '  end tipocat,'+CR_LF+
    '  cp.DTACIDENTE,'+CR_LF+
    '  case cp.CATEMITIDAPOR when ''1'' then ''INICIATIVA DO EMPREGADOR'' '+CR_LF+
    '                        when ''2'' then ''ORDEM JUDICIAL'' '+CR_LF+
    '                        when ''3'' then ''DETERMINAÇÃO DE ÓRGÃO FISCALIZADOR'' '+CR_LF+
    '  end catemitidapor,'+CR_LF+
    '  cp.IDSITGERADORAACIDTRAB, sit.DESCRICAO as DescSitGerTrab, cp.idcatpess '+CR_LF+
    'from'+CR_LF+
    '  catpess cp left join SITUACAOGERADORAACIDTRAB sit on cp.IDSITGERADORAACIDTRAB = sit.codigo '+CR_LF+
    'where cp.idpessoa = ' + IntToStr( vIdPessoa ) +CR_LF+
    'order by cp.DTACIDENTE ');

end;

//Everson Cunha - SIG38475 - Ini
{function TCtrlRegOcorr.ListGridParteAtingida(vidpessoa : Double ): OleVariant;
var
  sSQL : string;
begin
  sSQL := sSQL + '  select cpo.CODIGOESOCIAL, '+CR_LF+
                 '  substr(pca.DESCRICAO,0,255) as DESCRICAO, '+CR_LF+
                 '  case cpo.LATERALCORPOATINGIDA when ''0'' then ''Não Aplicável'' '+CR_LF+
                 '  when ''1'' then ''Esquerda'' '+CR_LF+
                 '  when ''2'' then ''Direita'' '+CR_LF+
                 '  when ''3'' then ''Ambas'' end LATCORPOATING, cpo.CODTABELAESOCIAL, cpo.LATERALCORPOATINGIDA, cpo.IDCATPESS, cpo.IDCATPESSXOUTROS  '+CR_LF+
                 '  from PARTECORPOATINGIDA pca, '+CR_LF+
                 '       CATPESSXOUTROS cpo  '+CR_LF+
                 '  where cpo.CODIGOESOCIAL = pca.codigo '+CR_LF+
                 '  and cpo.CODTABELAESOCIAL = 13 '+CR_LF ;

  if (vidpessoa = -1) then
    begin
      sSQL := sSQL + '  and (1 = 2)';
    end
  else
    begin
      sSQL := sSQL + '  and cpo.idcatpess in (select idcatpess from CatPess where idpessoa = ' + FloatToStr( vidpessoa ) + ')';
    end;

  sSQL := sSQL + ' order by DESCRICAO, LATCORPOATING';
  Result := GetDataPacket(sSQL);
end;

function TCtrlRegOcorr.ListGridCausador(vidpessoa : Double ): OleVariant;
var
  sSQL : string;
begin
  sSQL := sSQL + ' select AGC.CODIGO AS CODAGCAUSA, '+CR_LF+
                 '       substr(AGC.DESCRICAO,0,255) AS DESCAGCAUSA, '+CR_LF+
                 '       null as CODSITGER, '+CR_LF+
                 '       '''' as DESCSITGER, CPO.CODTABELAESOCIAL, cpo.IDCATPESS, CPO.CODIGOESOCIAL, cpo.IDCATPESSXOUTROS '+CR_LF+
                 ',       1 as ordenado '+CR_LF+
                 ' from catpess cp '+CR_LF+
                 ' inner join CATPESSXOUTROS CPO ON CPO.IDCATPESS = CP.IDCATPESS '+CR_LF+
                 ' LEFT OUTER JOIN AGENTECAUSADORACIDTRAB AGC ON CPO.CODIGOESOCIAL = AGC.CODIGO '+CR_LF+
                 ' where CPO.CODTABELAESOCIAL = 14   '+CR_LF;

  if (vidpessoa = -1) then
    begin
      sSQL := sSQL + ' AND (1 = 2)';
    end
  else
    begin
      sSQL := sSQL + '  and cp.idpessoa = ' + FloatToStr( vidpessoa );
    end;

  sSQL := sSQL + ' UNION '+CR_LF+
                 ' select null as CODAGCAUSA, '+CR_LF+
                 '       '''' as DESCAGCAUSA, '+CR_LF+
                 '       SG.CODIGO AS CODSITGER, '+CR_LF+
                 '       substr(SG.DESCRICAO,0,255) AS DESCSITGER, CPO.CODTABELAESOCIAL, cpo.IDCATPESS, CPO.CODIGOESOCIAL, cpo.IDCATPESSXOUTROS '+CR_LF+
                 ',       2 as ordenado '+CR_LF+
                 ' from catpess cp '+CR_LF+
                 ' inner join CATPESSXOUTROS CPO ON CPO.IDCATPESS = CP.IDCATPESS '+CR_LF+
                 ' LEFT OUTER JOIN SITGERADOENCAPROFISSIONAL SG ON CPO.CODIGOESOCIAL = SG.CODIGO '+CR_LF+
                 ' where CPO.CODTABELAESOCIAL = 15   '+CR_LF;

  if (vidpessoa = -1) then
    begin
      sSQL := sSQL + ' AND (1 = 2) ';
    end
  else
    begin
      sSQL := sSQL + '  and cp.idpessoa = ' + FloatToStr( vidpessoa ) ;
    end;

  sSQL := sSQL + ' order by ordenado, DESCAGCAUSA, DESCSITGER';
  Result := GetDataPacket(sSQL);
end;}
//Everson Cunha - SIG38475 - Fim

function TCtrlRegOcorr.ListAtestadoAnt(IdPessoa, IdHstAsMedAtual: double): OleVariant;
var
  sSql : string;
begin

    sSql:='SELECT NVL(DATAREAL, DATAPLAN) AS DATAREAL, '+CR_LF+
    '  SUBSTR(NVL(DATAREAL, DATAPLAN) || '' - '' || T.DESCRTIPOOCMED || NVL2(C.DESCRCID, '' - '' || C.DESCRCID, C.DESCRCID),0,255) list_combo, '+CR_LF+
    '  IDHSTASMED AS IDATESTADOANT '+CR_LF+
    '  FROM   '+CR_LF+
    '  HSTASMED H, TIPOCMED T, CID C '+CR_LF+
    '  WHERE '+CR_LF+
    '  (H.CODTIPOOCMED = T.CODTIPOOCMED) AND  '+CR_LF+
    '  (C.CODCID(+) = H.CODCID) AND '+CR_LF+
    '  (H.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.IDHSTASMED   <> ' +FloatToStr(IdHstAsMedAtual)+ ') '+CR_LF+
    'ORDER BY '+CR_LF+
    '  1 ';
  Result := GetDataPacket(sSql);
end;
// Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
//Cássio Rovaroto - SIG nº 38475.60437 - Início
function TCtrlRegOcorr.ListProcessosFuncionario(
  pIdFuncionario: integer; pDataIniOcorr: TDateTime): OleVariant;
begin
  Result := GetDataPacket('SELECT P.IDPROCESSO, '+
       										'				P.NUMERO '+
  												'	 FROM PROCESSOS P '+
 													'	WHERE P.IDFUNCIONARIO = ' + IntToStr(pIdFuncionario) +
   												'  	AND P.DATAINICIO <= TO_DATE(' + QuotedStr(DateTimeToStr(pDataIniOcorr))+ ', ''DD/MM/YYYY'') '+
   												'		AND (P.DATAFIM IS NULL OR P.DATAFIM >= TO_DATE(' + QuotedStr(DateTimeToStr(pDataIniOcorr)) +', ''DD/MM/YYYY''))');
end;
//Cássio Rovaroto - SIG nº 38475.60437 - Fim

//Cássio Rovaroto - SIG nº 38475.60437 - Início
//Everson Cunha - SIG38475 - Ini
{function TCtrlRegOcorr.ListAcidTrabeSocial: OleVariant;
begin
  Result := GetDataPacket('SELECT AC.IDACIDENTETRABALHO, '+
       										'				TRIM(AC.CODIGO) || '' - '' || SUBSTR(AC.DESCRICAO, 1, 200) AS DESCRICAO '+
  												'  FROM ACIDENTETRABALHO_ESOCIAL AC '+
 													' ORDER BY AC.CODIGO ')
end;}
//Everson Cunha - SIG38475 - Fim
//Cássio Rovaroto - SIG nº 38475.60437 - Fim

//Everson Cunha - SIG38475 - Ini
function TCtrlRegOcorr.ListProcRealizado: Olevariant;
var
  sSql : string;
begin
  sSql:= ' SELECT SUBSTR(PR.DESC_PROC_REALIZADO, 0, 254) DESC_REDUZIDA, '+CR_LF+
         '        PR.* '+CR_LF+
         '   FROM '+CR_LF+
         '     CM.PROCEDIMENTO_REALIZADO PR '+CR_LF+
         ' ORDER BY '+CR_LF+
         '   PR.ID_PROC_REALIZADO ';

  Result := GetDataPacket(sSql);
end;
//Everson Cunha - SIG38475 - Fim

end.
