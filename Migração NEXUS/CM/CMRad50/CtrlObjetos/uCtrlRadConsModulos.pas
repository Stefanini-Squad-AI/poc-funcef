    //início -  - pendência 26377 - 19/09/2007
{-------------------------------------------------------------------------------
 Data       : 19/09/2007
 Autor      : andré tavares
 Rotina     : TCtrlRadConsultaDestacamento.ListaDestacamento
 Pendência  : 26377
 Descrição  : Criação dos campos metadados NM_CENTRO_CUSTO e NM_CARGO (são campos preenchidos en tempo de execução),
              pois estava apresentando o erro "field not found".
--------------------------------------------------------------------------------}


{-------------------------------------------------------------------------------
 Data       : 21.10.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendência  : 21792
 Descrição  : Criação da Control para ser utilizada com o RAD+ (novo RAD) na Consulta
              de Documentos associados ao processos RAD+
--------------------------------------------------------------------------------}

unit uCtrlRadConsModulos;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uCtrlPadroes,
     uDbRADPRocesso, uMidasUtil,uCMTypes, Mask, Classes;

Type
   TContaBancaria = Record
     Id :Real;
     Banco :String;
     NomeBanco :String;
     Agencia :String;
     Nomeagencia :String;
     Numero :String;
     Tipo :String;
     DescTipo :String;
     MascaraConta :string;
     MascaraAgencia :String;
     AgenciaFormat :String;
     NumeroFormat :String;
   end;

  TCtrlRadConsultaDoc = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    FSaldo: extended;
    FContaBancaria: TContaBancaria;
    FValorOM: extended;
    FValor: extended;
   
  public
      //amf 22.10.2006 21792 - Extraído da uCtrlDocumento
      property Saldo: extended read FSaldo;
      property Valor: extended read FValor;
      property ValorOM: extended read FValorOM;

      property ContaBancaria: TContaBancaria read FContaBancaria;

      Constructor Create; Override;
      Destructor  Destroy;Override;

      //amf 21.10.2006 21792 ini - Extraído do datamodule DDadosBancarios (CmBack50)
      function ListaDadosBancariosDoDocumento(const iCodDocumento: integer): OleVariant;
      function ListaDadosBancariosDocFornecedor(const iCodDocumento: integer): OleVariant;

      //amf 21.10.2006 21792 ini - Extraído da uModulo da CmCapcarUtilObj50
      function GetNumSlip(const iCodDocumento: integer): string;

      //amf 22.10.2006 21792 - ini
      procedure BuscaContaDoc(const iCodDocumento: integer);
      procedure PreencheDadosBancarios(const cds: TClientDataSet);
      procedure InicializaDadosBancarios;
      procedure CalculaSaldo(iCodDocumento: integer; DataLimite: TDateTime = 0);
      //amf 22.10.2006 21792 - fim
  end;

  TCtrlRadConsultaLote = class(TCmControlObject)
  private
  

  public
     function ObterNumeroLoteDoProcessoRAD(iIdRADProcesso: integer): Integer;
     function ListaLotePagto(iNumLote: integer): OleVariant;
     function ListaDocumentosDoLote(iNumLote: integer): OleVariant;
  end;

  TCtrlRADConsultaCompras = class(TCmControlObject)
  private
    FStatus: string;
     
  protected
     
  public
     property Status: string read FStatus;

     //amf 05.12.2006 23860 - Método que retorna o Id do processo RAD na solicitação de compras
     function RecuperaIdProcessoNaSolicitacao(iNumSoliCompra: integer): integer;
     function RecuperaIDProcessoNaCotacao(iCodProcessoCompras: integer): integer;
     function GetConverteCustoMedio(sCodArtigo, sUnidade: string; iCodAlmox: integer): single;
     function GetIDNumReserva(iIdReserva, iNumReserva, iIdPessoa: integer): integer;

     //amf 07.12.2006 23860 - SQLs
     function GetNumSolicitacaoCompra(iIdProcessoRAD: integer): integer;
     function GetNumProcessoCompras(iIdProcessoRAD: integer): integer;
     function GetOrdemCompras(iIdProcessoRAD: integer): integer;
     function GetRequisicaoMaterial(iIdProcesso: integer): integer;

     function SelectListSumario(CodProcesso, IdProcxArt: integer): OleVariant;
     function SelectItensSumario(iCodProcesso: integer): OleVariant;
     function SelectSolicitacaoCompras(iNumSolicomp: integer): OleVariant;
     function SelectItemSolicitacaoCompras(iNumSoliComp, iCodCusteio: integer): OleVariant;
     function SelectPlanoPrevContabil              : OleVariant;
     function SelectPatrocinadora                  : OleVariant;
     function SelectAlmoxOrigem(iIdPessoa, iCodAlmox: integer): Olevariant;
     function SelectUnidadeNegocio(iIdPessoa: integer): OleVariant;
     function SelectArtigo(iIdUsuario, iIdPessoa: integer): OleVariant;
     function SelectPrograma: OleVariant;
     function SelectCRespon(iIdUsuario, iIdPessoa: integer): Olevariant;
     function SelectAlmox(iIdUsuario, iIdPessoa: integer): OleVariant;
     function SelectParamCompras(iIdPessoa: integer): OleVariant;

     // amf 12.12.2006 23860 - Ordem de Compras
     function SelectOC(iNumOC: integer; MostraForn : Boolean): OleVariant;
     function SelectPrazoEntregaOC(iNumOC: integer): OleVariant;
     function SelectItemOC(iNumOC: integer): OleVariant;
     function SelectPrazoPgtoOC(iNumOC: integer): OleVariant;
     function SelectAgregItemOC(iNumOC: integer): OleVariant;
     function SelectSCItemOC(iNumOC: integer): OleVariant;
     function SelectSCIOrigem(iIdItemOC: integer): OleVariant;

     //amf 12.12.2006 23860 - Requisição de Materiais
     function SelectReqMat(iNumRequisicao: integer): OleVariant;
     function SelectItemReqMat(iNumRequisicao: integer): OleVariant;
     function SelectCentroCusto(iCodCCusto, iIdEmpresa: integer): OleVariant;
  end;

  TCtrlRadConsultaDestacamento = class(TCmControlObject)
  private
  

  public
    function ListaDestacamento(const iDestacamento : Integer) : OleVariant;
    function ListaCalendario(const iDestacamento : Integer) : OleVariant;
    function ListaTrecho(const iDestacamento : Integer) : OleVariant;
    function getDescricaoCargo(const iCargo : Integer) : String;
    function getDescricaoCentroCusto(const iCentroCusto : Integer) : String;
    function getDestacamento(const iProcesso, iRADRef: Integer) : Integer;

    //Lista os valores totais do calendario disponibilizados - andré tavares - pendência ???? - 09/10/2007
    function ListaTotValoresCalendario(const iDestacamento: Integer): OleVariant;
    //Lista os valores totais do trecho - andré tavares - pendência ???? - 09/10/2007
    function ListaTotValoresTrecho(const iDestacamento: Integer): OleVariant;
    //Lista as despesas da viagem - andré tavares - pendência ???? - 09/10/2007
    function listarDespesas(const iDestacamento: Integer):  OleVariant;
    //Lista as despesas da viagem - andré tavares - pendência ???? - 09/10/2007
    function buscarStatusRAD(const iProcesso: Integer): String;

  end;



implementation

{ TCtrlRadConsultaDoc }

procedure TCtrlRadConsultaDoc.AfterInitialize;
begin
  inherited;

end;

procedure TCtrlRadConsultaDoc.BuscaContaDoc(const iCodDocumento: integer);
var
  cds: TClientDataSet;
begin
  try
    InicializaDadosBancarios;

    cds := TClientDataSet.Create(nil);

    //amf 22.10.2006 21792 - Obtém os dados bancários do documento
    cds.Data := ListaDadosBancariosDoDocumento(iCodDocumento);

    if (not cds.IsEmpty) then
       PreencheDadosBancarios(cds)
    else
    begin
       //amf 22.10.2006 21792 - obtém os dados bancários do fornecedor
       cds.Data := ListaDadosBancariosDocFornecedor(iCodDocumento);
       if (not cds.IsEmpty) then
          PreencheDadosBancarios(cds);
    end;
  finally
    FreeAndNil(cds);
  end;
end;

procedure TCtrlRadConsultaDoc.CalculaSaldo(iCodDocumento: integer; DataLimite: TDateTime = 0);
var
   sSQL: string;
   sFiltroData: String;
   cds: TClientDataSet;
begin

  try

    //amf 22.10.2006 21792 - filtro condicional
    if DataLimite = 0 Then
      sFiltroData := ''
    else
      sFiltroData := ' AND LANC.DATALANCTO <= TO_DATE(''' + DateToStr(DataLimite) + ''',''DD/MM/YYYY'') ';

    sSQL :=
      'SELECT SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOR,LANC.VALOR * -1), '+
      '       DECODE(DOC.RECPAG,''R'',LANC.VALOR * -1,LANC.VALOR))) AS VALOR, '+
      '       SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOROUTRAMOEDA,LANC.VALOROUTRAMOEDA * -1),'+
      '          DECODE(DOC.RECPAG,''R'',LANC.VALOROUTRAMOEDA * -1,LANC.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA'+
      ' FROM  LANCTODOCUM LANC,' +
      '       DOCUMENTO DOC '+
      'WHERE  DOC.CODDOCUMENTO = ' + IntToStr(iCodDocumento) + sFiltroData +
      '       AND DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ';

    cds := TClientDataSet.Create(nil);
    cds.Data := GetDataPacket(sSQL);

    if (not cds.IsEmpty) then
    begin
      FValor   := cds.Fields[0].AsFloat;
      FValorOM := cds.Fields[1].AsFloat;
    end;

  finally
    FreeAndNil(cds);
  end;
end;

constructor TCtrlRadConsultaDoc.Create;
begin
  inherited;

end;

destructor TCtrlRadConsultaDoc.Destroy;
begin
  inherited;

end;

procedure TCtrlRadConsultaDoc.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlRadConsultaDoc.GetNumSlip(const iCodDocumento: integer): string;
var
  cds: TClientDataSet;
  sSQL: string;
begin
  try
     sSQL :=
       'SELECT NUMSLIP from LOTEPAGTO LP, LOTEXDOCUM LD '+
       'WHERE CODDOCUMENTO = '+ IntToStr(iCodDocumento) +' AND LP.NUMLOTE = LD.NUMLOTE ';

     cds := TClientDataSet.Create(nil);
     cds.Data := GetDataPacket(sSQL);

    if cds.IsEmpty then
       Result := ''
    else
       Result := cds.FieldByName('NUMSLIP').AsString;

  finally
     FreeAndNil(cds);
  end;
end;

procedure TCtrlRadConsultaDoc.InicializaDadosBancarios;
begin
   FContaBancaria.Id               := -1;
   FContaBancaria.Banco             := '';
   FContaBancaria.NomeBanco         := '';
   FContaBancaria.Agencia           := '';
   FContaBancaria.Nomeagencia       := '';
   FContaBancaria.Numero            := '';
   FContaBancaria.DescTipo          := '';
   FContaBancaria.Tipo              := '0';
   FContaBancaria.MascaraConta      := '';
   FContaBancaria.MascaraAgencia    := '';
   FContaBancaria.AgenciaFormat     := '';
   FContaBancaria.NumeroFormat      := '';
end;

function TCtrlRadConsultaDoc.ListaDadosBancariosDocFornecedor(
  const iCodDocumento: integer): OleVariant;
var
  sSQL: string;
begin
   sSQL :=
     'SELECT DECODE(C.TIPOCONTA,''1'',''Conta Corrente'', '+
     '       DECODE(C.TIPOCONTA,''2'',''Cartão Salário'', '+
     '       DECODE(C.TIPOCONTA,''3'',''Conta Poupança'',''''))) AS DESCTIPOCONTA,'+
     '       C.CONTACORRENTE,'+
     '       C.CONTACORRENTE,'+
     '       B.NUMBANCO,'+
     '       A.NUMAGENCIA,'+
     '       C.TIPOCONTA,'+
     '       C.IDCBANCARIA,'+
     '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGENCIA,'+
     '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBANCO,'+
     '       B.MASCARACC,'+
     '       B.MASCARAAGENCIA '+
     'FROM '+
     '       PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
     'WHERE '+
     '      (D.CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ')' +
     '  AND (C.FLGCONTAPREF = 1) '+
     '  AND (C.IDAGENCIA = A.IDPESSOA) '+
     '  AND (C.IDPESSOA = D.IDFORCLI)  '+
     '  AND (A.IDBANCO   = B.IDPESSOA) '+
     '  AND (A.IDPESSOA = PA.IDPESSOA) '+
     '  AND (B.IDPESSOA = PB.IDPESSOA) '+
     '  AND (D.IDCBANCARIA = C.IDCBANCARIA)';

   Result := GetDataPacket(sSQL);
end;

function TCtrlRadConsultaDoc.ListaDadosBancariosDoDocumento(
  const iCodDocumento: integer): OleVariant;
var
  sSQL: string;
begin
   sSQL :=
     'SELECT DECODE(C.TIPOCONTA,''1'',''Conta Corrente'', '+
     '       DECODE(C.TIPOCONTA,''2'',''Cartão Salário'', '+
     '       DECODE(C.TIPOCONTA,''3'',''Conta Poupança'',''''))) AS DESCTIPOCONTA,'+
     '       C.CONTACORRENTE,'+
     '       C.CONTACORRENTE,'+
     '       B.NUMBANCO,'+
     '       A.NUMAGENCIA,'+
     '       C.TIPOCONTA,'+
     '       C.IDCBANCARIA,'+
     '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGENCIA,'+
     '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBANCO,'+
     '       B.MASCARACC,'+
     '       B.MASCARAAGENCIA '+
     'FROM '+
     '       PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
     'WHERE '+
     '      (D.CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') '+
     '  AND (C.IDAGENCIA = A.IDPESSOA) '+
     '  AND (A.IDBANCO   = B.IDPESSOA) '+
     '  AND (A.IDPESSOA = PA.IDPESSOA) '+
     '  AND (B.IDPESSOA = PB.IDPESSOA) '+
     '  AND (D.IDCBANCARIA = C.IDCBANCARIA)';

   Result := GetDataPacket(sSQL);
end;

procedure TCtrlRadConsultaDoc.OnCreateAppServer;
begin
  inherited;

end;

procedure TCtrlRadConsultaDoc.PreencheDadosBancarios(
  const cds: TClientDataSet);
begin
   FContaBancaria.Id          := cds.FieldByName('IDCBANCARIA').AsFloat;
   FContaBancaria.Banco       := cds.FieldByName('NUMBANCO').AsString;
   FContaBancaria.NomeBanco   := cds.FieldByName('NOMEBANCO').AsString;
   FContaBancaria.Agencia     := cds.FieldByName('NUMAGENCIA').AsString;
   FContaBancaria.Nomeagencia := cds.FieldByName('NOMEAGENCIA').AsString;
   FContaBancaria.Numero      := cds.FieldByName('CONTACORRENTE').AsString;
   FContaBancaria.DescTipo    := cds.FieldByName('DESCTIPOCONTA').AsString;
   FContaBancaria.Tipo        := cds.FieldByName('TIPOCONTA').AsString;

   if cds.FieldByName('MASCARACC').IsNull then
   begin
       FContaBancaria.MascaraConta := '';
       FContaBancaria.NumeroFormat := FContaBancaria.Numero;;
   end
   else
   begin
       FContaBancaria.MascaraConta := cds.FieldByName('MASCARACC').AsString + ';0; ';
       FContaBancaria.NumeroFormat := FormatMasktext(FContaBancaria.MascaraConta,
                                                     FContaBancaria.Numero);
   end;

   if cds.FieldByName('MASCARACC').IsNull Then
   begin
       FContaBancaria.MascaraAgencia := '';
       FContaBancaria.AgenciaFormat := FContaBancaria.Agencia;
   end
   else
   begin
       FContaBancaria.MascaraAgencia := cds.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
       FContaBancaria.AgenciaFormat := FormatMasktext(FContaBancaria.MascaraAgencia,
                                                      FContaBancaria.Agencia);
   end;
end;


{ TCtrlRadConsultaLote }

function TCtrlRadConsultaLote.ListaDocumentosDoLote(iNumLote: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT S.SALDO,                                                                          ' +
    '       D.IDFORCLI,                                                                       ' +
    '       D.OPERACAO,                                                                       ' +
    '       D.CODDOCUMENTO,                                                                   ' +
    '       D.IDPESSOA,                                                                       ' +
    '       D.NODOCUMENTO,                                                                    ' +
    '       D.COMPLDOCUMENTO,                                                                 ' +
    '       D.DATAPROGRAMADA,                                                                 ' +
    '       D.DATAVENCTO,                                                                     ' +
    '       D.RECPAG,                                                                         ' +
    '       P.RAZAOSOCIAL AS NOME,                                                            ' +
    '       D.STATUS,                                                                         ' +
    '       D.NUMLEITCODBARRAS,                                                               ' +
    '       D.NUMDIGCODBARRAS,                                                                ' +
    '       TD.DESCRICAO AS TIPODOC,                                                          ' +
    '       LD.VALOR,                                                                         ' +
    '       L.HISTORICOCOMPL,                                                                 ' +
    '       D.NUMSLIP,                                                                        ' +
    '       ''          '' NUMOP                                                              ' +
    'FROM   DOCUMENTO D,                                                                      ' +
    '       PESSOA P,                                                                         ' +
    '       LOTEXDOCUM LD,                                                                    ' +
    '       TIPODOCRECPAG TD,                                                                 ' +
    '       LANCTODOCUM L,                                                                    ' +
    '       (SELECT L.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''C'',L.VALOR,(L.VALOR*-1))) AS SALDO ' +
    '       FROM LANCTODOCUM L                                                                ' +
    '       GROUP BY L.CODDOCUMENTO) S                                                        ' +
    'WHERE (LD.NUMLOTE = ' + IntToStr(iNumLote)  +  '  )                                      ' +
    ' AND  (D.CODDOCUMENTO = LD.CODDOCUMENTO)                                                 ' +
    ' AND  (P.IDPESSOA = D.IDFORCLI)                                                          ' +
    ' AND (S.CODDOCUMENTO = D.CODDOCUMENTO)                                                   ' +
    ' AND (TD.CODTIPDOC = D.CODTIPDOC)                                                        ' +
    ' AND (D.OPERACAO = L.OPERACAO)                                                           ' +
    ' AND (D.CODDOCUMENTO = L.CODDOCUMENTO)                                                   ' ;

  Result := GetDataPacket(sSQL);
end;

function TCtrlRadConsultaLote.ListaLotePagto(
  iNumLote: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT L.NUMLOTE,                                                                      ' +
    '       L.CODPORTFORMA,                                                                 ' +
    '       L.DATAEMISSAO,                                                                  ' +
    '       L.NUMCHQBORDERO,                                                                ' +
    '       L.FAVORECIDO,                                                                   ' +
    '       DECODE(L.FLAGEMISSAO,1,''SIM'',''NÃO'') AS FLAGEMISSAO,                         ' +
    '       DECODE(L.FLAGCANCEL,NULL,''EM ABERTO'', ''B'',''BAIXADO'', ''C'',''CANCELADO'', ' +
    '              ''R'',''REGERADO'') AS FLAGCANCEL,                                       ' +
    '       L.OBSERVACAO,                                                                   ' +
    '       P.DESCRICAO,                                                                    ' +
    '       L.IDPROCESSO,                                                                   ' +
    '       L.NUMSLIP NUMOP                                                                 ' +
    'FROM   LOTEPAGTO L,                                                                    ' +
    '       PORTADORFORMA P                                                                 ' +
    'WHERE (L.NUMLOTE = ' + IntToStr(iNumLote) +  '  )                                      ' +
    '  AND (L.CODPORTFORMA = P.CODPORTFORMA)                                                ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRadConsultaLote.ObterNumeroLoteDoProcessoRAD(
  iIdRADProcesso: integer): Integer;
var
  cds: TClientDataSet;
  sSQL: string;
begin
  try
    sSQL :=
      'SELECT NUMLOTE FROM LOTEPAGTO WHERE IDPROCESSO = ' + IntToStr(iIdRADProcesso);

    cds      := TClientDataSet.Create(nil);
    cds.Data := GetDataPacket(sSQL);

    if cds.IsEmpty then
       Result := 0
    else
       Result := cds.FieldByName('NUMLOTE').AsInteger;

  finally
    FreeAndNil(cds);
  end;
end;

{ TCtrlRADConsultaCompras }

function TCtrlRADConsultaCompras.SelectAlmoxOrigem(iIdPessoa, iCodAlmox: integer): Olevariant;
begin
   Result := GetDataPacket('SELECT CODALMOXARIFADO,DESCALMOX                    '+
                           'FROM ALMOX                                          '+
                           'WHERE CODALMOXARIFADO <> ' + IntToStr(iCodAlmox)     +
                           'AND IDPESSOA = ' + IntToStr(iIdPessoa)               );
end;

function TCtrlRADConsultaCompras.SelectPatrocinadora: OleVariant;
begin
  Result := GetDataPacket('SELECT PES.IDPESSOA, PES.NOME     '+
                          'FROM PESSOA PES, PATRO PAT        '+
                          'WHERE PES.IDPESSOA = PAT.IDPESSOA '+
                          'ORDER BY NOME                     ');
end;

function TCtrlRADConsultaCompras.SelectPlanoPrevContabil: OleVariant;
begin
   Result := GetDataPacket('SELECT * FROM PLANPREVCONTABIL '+
                           'WHERE ATIVO = ''S''            '+
                           'ORDER BY NOME                  ');
end;

function TCtrlRADConsultaCompras.SelectUnidadeNegocio(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT UNIDNEGOC,NOME FROM UNIDNEGOCIO ' +
                           'WHERE IDPESSOA = '+ IntToStr(iIdPessoa ) +
                           ' ORDER BY NOME');
end;

function TCtrlRADConsultaCompras.RecuperaIDProcessoNaCotacao(
  iCodProcessoCompras: integer): integer;
var
  cdsLocal: TClientDataSet;
  sSQL: string;
begin
   try
     Result := 0;
     cdsLocal := TClientDataSet.Create(nil);

     sSQL := 'SELECT IDPROCESSO FROM PROCESSO WHERE (CODPROCESSO = ' + IntToStr(iCodProcessoCompras) + ')';
     cdsLocal.Data := GetDataPacket(sSQL);
     Result := cdsLocal.FieldByName('IDPROCESSO').ASInteger;
   finally
     FreeAndNil(cdsLocal);
   end;
end;

function TCtrlRADConsultaCompras.RecuperaIdProcessoNaSolicitacao(
  iNumSoliCompra: integer): integer;
var
  cds: TClientDataSet;
begin
  try
    Result := 0;
    cds := TClientDataSet.Create(nil);
    cds.Data := GetDataPacket('SELECT IDPROCESSO FROM SOLICOMP WHERE NUMSOLCOMPRA = '+
                            IntToStr(iNumSoliCompra));
    Result := cds.FieldByName('IDPROCESSO').AsInteger;
  finally
    FreeAndNil(cds);
  end;
end;

function TCtrlRADConsultaCompras.SelectArtigo(iIdUsuario, iIdPessoa: integer): OleVariant;
var
  sSQL: string;
begin
   sSQL :=
     'SELECT U.CODARTIGO,                                                                                             '+
     '       U.DESCPROD,                                                                                              '+
     '       U.FLGVARIAVEL,                                                                                           '+
     '       U.DESCRCOMPL                                                                                             '+
     'FROM                                                                                                            '+
     '(                                                                                                               '+
     '    SELECT A.CODARTIGO,                                                                                         '+
     '           (P.DESCPROD || ' + ' A.CODTAMANHO || ' +  ' A.CODCOR)  AS DESCPROD,                            '+
     '           P.FLGVARIAVEL,                                                                                       '+
     '           P.DESCRCOMPL                                                                                         '+
     '    FROM   ARTIGO A,                                                                                            '+
     '           PRODUTO P                                                                                            '+
     '    WHERE  (((A.FLGBLOQUEADO <> ''C'')  AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL))             '+
     '       AND (A.FLGATIVO = ''S'')                                                                                 '+
     '       AND (A.CODPRODUTO = P.CODPRODUTO )                                                                       '+
     '       AND (NOT EXISTS (SELECT 1 FROM USUXGRUPPROD WHERE  (IDUSUARIO = ' + IntToStr(iIdUsuario) + ')            '+
     '                                                          AND (IDPESSOA = ' + IntToStr(iIdPessoa) + ')))        '+
     '    UNION ALL                                                                                                   '+
     '    SELECT A.CODARTIGO,                                                                                         '+
     '           (P.DESCPROD || ' + ' A.CODTAMANHO || ' + ' A.CODCOR)  AS DESCPROD,                             '+
     '           P.FLGVARIAVEL,                                                                                       '+
     '           P.DESCRCOMPL                                                                                         '+
     '    FROM   ARTIGO A,                                                                                            '+
     '           PRODUTO P,                                                                                           '+
     '           USUXGRUPPROD UXG                                                                                     '+
     '    WHERE  (((A.FLGBLOQUEADO <> ''C'')  AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL))             '+
     '       AND (A.FLGATIVO = ''S'')                                                                                 '+
     '       AND (IDUSUARIO = ' + IntToStr(iIdUsuario) + ')                                                           '+
     '       AND (IDPESSOA = ' + IntToStr(iIdPessoa) + ')                                                             '+
     '       AND (P.CODGRUPOPROD = UXG.CODGRUPOPROD)                                                                  '+
     '       AND (A.CODPRODUTO = P.CODPRODUTO )                                                                       '+
     ') U                                                                                                             '+
     'ORDER BY U.DESCPROD                                                                                             ';

   Result := GetDataPacket(sSQL);
end;

function TCtrlRADConsultaCompras.SelectPrograma: OleVariant;
begin
   Result := GetDataPacket('SELECT IDPROGRAMA , DESCPROGRAMA FROM PROGRAMA');
end;

function TCtrlRADConsultaCompras.SelectCRespon(iIdUsuario,
  iIdPessoa: integer): Olevariant;
var
  sSQL: string;
begin
  sSQL :=
   'SELECT U.CODCENTRORESPON,                                 '+
   '       U.NOME                                             '+
   'FROM                                                      '+
   '(SELECT CR.CODCENTRORESPON,                               '+
   '        CR.NOME                                           '+
   ' FROM   CENTRESPON CR,                                    '+
   '        PESSOAXCRESP PR                                   '+
   'WHERE   (CR.CODCENTRORESPON = PR.CODCENTRORESPON)         '+
   '    AND (CR.IDPESSOA = PR.IDPESSOA)                       '+
   '    AND (CR.IDPESSOA = '+ IntToStr(iIdPessoa) + ')        '+
   '    AND (CR.ATIVO    = ''S'')                             '+
   '    AND (CR.ANALITICOSINTET = ''A'')                      '+
   '    AND (PR.IDPESSOAACESSO = '+ IntToStr(iIdusuario) + ') '+
   'UNION ALL                                                 '+
   '(SELECT CR.CODCENTRORESPON,                               '+
   '        CR.NOME                                           '+
   'FROM CENTRESPON CR                                        '+
   'WHERE (CR.IDPESSOA = ' + IntToStr(iIdPessoa) + ')         '+
   '  AND (CR.ATIVO    = ''S'')                               '+
   '  AND (CR.ANALITICOSINTET = ''A'')                        '+
   '  AND (NOT EXISTS (SELECT 1 FROM PESSOAXCRESP PR          '+
   '                   WHERE (PR.IDPESSOA = ' + IntToStr(iIdPessoa) + ')'+
   '                   AND (PR.IDPESSOAACESSO = '+ IntToStr(iIdUsuario) + '))))'+
   ') U                                                       '+
   'ORDER BY U.NOME                                           ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRADConsultaCompras.SelectSolicitacaoCompras(
  iNumSolicomp: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT S.*,                         '+
    'A.DESCALMOX,                        '+
    'A.CODALMOXARIFADO AS CODALMOXADEST, '+
    'A.CODCUSTEIO AS CODCUSTEIODEST      '+
    'FROM SOLICOMP S,                    '+
    '     ALMOX A                        '+
    'WHERE S.NUMSOLCOMPRA  = '+ IntToStr(iNumSoliComp) +
    '  AND S.CODALMOXARIFADO = A.CODALMOXARIFADO(+)';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRADConsultaCompras.SelectItemSolicitacaoCompras(iNumSoliComp,
  iCodCusteio: integer): OleVariant;
var
  sSQL: string;
begin

  sSQL :=
    'SELECT I.*,                                                                                                                                  '+
    '       PT.NOME AS NOMEPATRO,                                                                                                                 '+
    '       PP.NOME AS NOMEPLANO,                                                                                                                 '+
    '       P.DESCPROGRAMA,                                                                                                                       '+
    '       SUBSTR(DECODE(PV.IDPRODVARI,NULL,( P.DESCPROD  || '' '' || A.CODCOR || '' '' ||  A.CODTAMANHO ),PV.DESCPRODVARI),1,60) AS DESCRICAO,  '+
    '       P.CODMEDCUSTO,                                                                                                                        '+
    '       P.CODPRODUTO,                                                                                                                         '+
    '       CO.FATOR,CF.FATOR,                                                                                                                    '+
    '       (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) AS VALORUN,                                                                                          '+
    '       (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) * I.QTDEPEDIDA AS VALORTOTAL,                                                                        '+
    '       (-1) AS IDFORNE,                                                                                                                      '+
    '       (0)  AS VALORUN,                                                                                                                      '+
    '       (0)  AS PRAZOPAG                                                                                                                      '+
    'FROM ITEMSOLI I,                                                                                                                             '+
    '     ARTIGO A,                                                                                                                               '+
    '     PRODUTO P,                                                                                                                              '+
    '     CUSTOMED C,                                                                                                                             '+
    '     CONVER CO,                                                                                                                              '+
    '     CONVER CF,                                                                                                                              '+
    '     PRODVARI PV,                                                                                                                            '+
    '     PROGRAMA P,                                                                                                                             '+
    '     PLANPREVCONTABIL PP,                                                                                                                    '+
    '     PESSOA PT                                                                                                                               '+
    'WHERE (I.NUMSOLCOMPRA = '+ INTTOSTR(iNumSoliComp)                                                                                        + ')'+
    '  AND (I.CODARTIGO    = A.CODARTIGO)                                                                                                         '+
    '  AND (A.CODPRODUTO     = P.CODPRODUTO)                                                                                                      '+
    '  AND (A.CODARTIGO      = C.CODARTIGO(+))                                                                                                    '+
    '  AND (C.CODCUSTEIO(+)  = '+ IntToStr(iCodCusteio) +')                                                                                '+
    '  AND (P.CodProduto     = CO.CodProduto)                                                                                                     '+
    '  AND (CO.CodMedida     = P.CODMEDCUSTO)                                                                                                     '+
    '  AND (P.CodProduto     = CF.CodProduto)                                                                                                     '+
    '  AND (CF.CodMedida     = I.CODMEDIDA)                                                                                                       '+
    '  AND (PV.IDPRODVARI(+) = I.IDPRODVARI)                                                                                                      '+
    '  AND (I.IDPROGRAMA     = P.IDPROGRAMA)                                                                                                      '+
    '  AND (I.IDPLANOPREV    = PP.IDPLANOPREV)                                                                                                    '+
    '  AND (I.IDPATRO        = PT.IDPESSOA)                                                                                                       '+
    '  ORDER BY A.CODARTIGO,P.DESCPROD                                                                                                            ';

    Result := GetDataPacket(sSQL);

end;

function TCtrlRADConsultaCompras.GetConverteCustoMedio(sCodArtigo,
  sUnidade: string; iCodAlmox: integer): single;
var
  sSQL: string;
  cdsLocal: TClientDataSet;
begin
  try
    sSQL :=
      'SELECT (C.CUSTOMEDIO*V2.FATOR)/V.FATOR AS CUSTOMEDIO '+
      'FROM CUSTOMED C,                                     '+
      '     ALMOX AL,                                       '+
      '     ARTIGO A,                                       '+
      '     PRODUTO P,                                      '+
      '     CONVER V,                                       '+
      '     CONVER V2                                       '+
      'where (C.CODARTIGO = '+ QuotedStr(sCodartigo)+')      '+
      '  AND (C.CODARTIGO = A.CODARTIGO)                    '+
      '  AND (A.CODPRODUTO=P.CODPRODUTO)                    '+
      '  AND (C.CODCUSTEIO = AL.CODCUSTEIO)                 '+
      '  AND (AL.CodAlmoxarifado = '+IntToStr(iCodAlmox)+') '+
      '  AND (P.CODPRODUTO=V.CODPRODUTO)                    '+
      '  AND (P.CODMEDCUSTO=V.CODMEDIDA)                    '+
      '  AND (V2.CODMEDIDA=' + QuotedStr(sUnidade)+')        '+
      '  AND (P.CODPRODUTO=V2.CODPRODUTO)                   ';

    cdsLocal.Data := GetDataPacket(sSQL);
    Result := cdsLocal.FieldByName('CUSTOMEDIO').AsFloat;
  finally
    FreeAndNil(cdsLocal);
  end;
end;

function TCtrlRADConsultaCompras.GetNumSolicitacaoCompra(
  iIdProcessoRAD: integer): integer;
var
  cdsLocal: TClientDataSet;
  sSQL: string;
begin
  try
    Result := 0;

    sSQL :=
      'SELECT NUMSOLCOMPRA FROM SOLICOMP WHERE IDPROCESSO = ' + IntToStr(iIdProcessoRAD);

    cdsLocal := TClientDataSet.Create(nil);
    cdsLocal.Data := GetDataPacket(sSQL);

    Result := cdsLocal.FieldByName('NUMSOLCOMPRA').AsInteger;
  finally
    FreeAndNil(cdsLocal);
  end;
end;

function TCtrlRADConsultaCompras.GetIDNumReserva(iIdReserva, iNumReserva, iIdPessoa: integer): integer;
var
   sSql: String;
   cdsLocal: TClientDataSet;
begin
   Result := 0;
   cdsLocal := TClientDataSet.Create(nil);

   sSql :=
     'SELECT IDRESERVAORCAMEN, NUMRESERVA FROM RESERVAORCAMEN WHERE IDPESSOA =' + IntToStr(iIdPessoa);

   if iIdReserva > 0 then begin
      sSql := sSql + ' AND IDRESERVAORCAMEN = ' + IntToStr(iIdReserva);
   end else begin
      if iNumReserva > 0 then begin
         sSql := sSql + ' AND NUMRESERVA = ' + IntToStr(iNumReserva);
      end;
   end;

   try
     cdsLocal.Data := GetDataPacket(sSQL);

     if iIdReserva > 0 then
        Result := cdsLocal.FieldByname('NUMRESERVA').AsInteger
     else
        Result := cdsLocal.FieldByname('IDRESERVAORCAMEN').AsInteger;
   finally
     FreeAndNil(cdsLocal);
   end;
end;


function TCtrlRADConsultaCompras.SelectAlmox(iIdUsuario,
  iIdPessoa: integer): OleVariant;
var
  sSQL: string;
begin
   try
     ssQL :=
       'SELECT CODALMOXARIFADO,                                                      '+
       '       CODCUSTEIO,                                                           '+
       '       CODCENTROCUSTO,                                                       '+
       '       DESCALMOX,                                                            '+
       '       PRINCIPSECUND                                                         '+
       'FROM   ALMOX                                                                 '+
       'WHERE (IDPESSOA = '+ IntToStr(iIdpessoa) + ')                                '+
       '  AND (CODALMOXARIFADO  IN ( SELECT CODALMOXARIFADO FROM USUXALMOX           '+
       '                             WHERE (IDUSUARIO = ' + IntToStr(iIdUsuario) + ')'+
       '                           ))                                                '+
       'ORDER BY DESCALMOX                                                           ';

     Result := GetDataPacket(sSQL);
   except
    on e:Exception do
       Raise Exception.Create('Erro ao consultar o almoxarifado.' + e.Message);
   end;
end;

function TCtrlRADConsultaCompras.SelectParamCompras(iIdPessoa: integer): OleVariant;
begin
  
end;

function TCtrlRADConsultaCompras.SelectItensSumario(iCodProcesso: integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Append('SELECT ');
      SQL.Append('      PXA.IDPROCXART,     ');
      SQL.Append('      PXA.CODPROCESSO,    ');
      SQL.Append('      PXA.CODARTIGO,      ');
      SQL.Append('      PXA.QTDEPEDIDA,     ');
      SQL.Append('      PXA.CODMEDIDA,      ');
      SQL.Append('      PXA.JUSTIFICATIVA,  ');
      SQL.Append('      PXA.STATUS,         ');
      SQL.Append('      SUBSTR(DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO ');
      SQL.Append('FROM                      ');
      SQL.Append('      PROCXART PXA,       ');
      SQL.Append('      PRODUTO P,          ');
      SQL.Append('      ARTIGO A,           ');
      SQL.Append('      PRODVARI PV         ');
      SQL.Append('WHERE                     ');
      SQL.Append('      (PXA.CODPROCESSO = '+ IntToStr(iCodProcesso)+') ');
      SQL.Append('  AND (PXA.CODARTIGO = A.CODARTIGO)                   ');
      SQL.Append('  AND (A.CODPRODUTO = P.CODPRODUTO)                   ');
      SQL.Append('  AND (PXA.IDPRODVARI = PV.IDPRODVARI(+))             ');
      SQL.Append('ORDER BY DESCRICAO                                    ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlRADConsultaCompras.SelectListSumario(CodProcesso,
  IdProcxArt: integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Append('SELECT                   ');
      SQL.Append('     C.IDFORCLI,         ');
      SQL.Append('     C.IDPROCXART,       ');
      SQL.Append('     C.CODPROCESSO,      ');
      SQL.Append('     C.PROPOSTA,         ');
      SQL.Append('     C.QTDEFORNECIDA,    ');
      SQL.Append('     C.PRECO,            ');
      SQL.Append('     C.CODMEDIDA,        ');
      SQL.Append('     C.NUMCOT,           ');
      SQL.Append('     C.DATACOT,          ');
      SQL.Append('     C.STATUS,           ');
      SQL.Append('     C.OBS,              ');
      SQL.Append('     C.MOECODIGO,        ');
      SQL.Append('     C.TXJUROS,          ');
      SQL.Append('     C.PRECOAVALORPRES,  ');
      SQL.Append('     P.RAZAOSOCIAL,      ');
      SQL.Append('     M.MOESIGLA,         ');
      SQL.Append('     C.OBS AS JUSTIFICATIVA, ');
      SQL.Append('     (C.PRECO * C.QTDEFORNECIDA) AS PRECOTOTAL ');
      SQL.Append('FROM                     ');
      SQL.Append('    PESSOA P,            ');
      SQL.Append('    COTACOES C,          ');
      SQL.Append('    MOEDA M              ');
      SQL.Append('WHERE                    ');
      SQL.Append('      (C.CODPROCESSO  = '+IntToStr(CodProcesso)+')  ');
      SQL.Append('  AND (C.IDPROCXART   = '+IntToStr(IdProcxArt)+')   ');
      SQL.Append('  AND (C.IDFORCLI     = P.IDPESSOA)    ');
      SQL.Append('  AND (C.MOECODIGO    = M.MOECODIGO(+))');
      SQL.Append('  AND (C.PRECOAVALORPRES IS NOT NULL)');
      SQL.Append('ORDER BY C.PRECOAVALORPRES             ');
      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;
end;

function TCtrlRADConsultaCompras.GetNumProcessoCompras(
  iIdProcessoRAD: integer): integer;
var
  sSQL: string;
  cdsLocal: TClientDataSet;
begin
  Result := 0;

  ssQL :=
    'SELECT STATUS, CODPROCESSO FROM PROCESSO WHERE IDPROCESSO = ' + IntToStr(iIdProcessoRAD);

  try
    cdsLocal := TClientDataSet.Create(nil);
    cdsLocal.Data := GetDataPacket(sSQL);

    Result := cdsLocal.FieldByName('CODPROCESSO').AsInteger;
    FStatus := cdsLocal.FieldByName('STATUS').AsString;
  finally
    FreeAndNil(cdsLocal);
  end;
end;

function TCtrlRADConsultaCompras.SelectOC(iNumOC: integer;  MostraForn: Boolean): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT              ');
      SQL.Add('     OC.NUMOC,         ');
      SQL.Add('     OC.IDFORCLI,      ');
      SQL.Add('     OC.IDPESSOA,      ');
      SQL.Add('     OC.OCATENDIDA,    ');
      SQL.Add('     OC.FLGIMPRESSA,   ');
      SQL.Add('     OC.FLGCOMSEMOC,   ');
      SQL.Add('     OC.FLGCOMSEMCOT,  ');
      SQL.Add('     OC.OBSOC,         ');
      SQL.Add('     OC.DATAOC,        ');
      SQL.Add('     OC.IDPROCESSO,    ');
      SQL.Add('     OC.FLGTIPOFRETE,  ');
      SQL.Add('     OC.CONTATO,       ');
      SQL.Add('     SUB.VALOROC AS VALOROC,   ');
      If MostraForn Then
         SQL.Add('     P.RAZAOSOCIAL,     ');

      SQL.Add('     DECODE(OC.FLGCOMSEMOC,''S'',''SEM O.C.'',DECODE(OC.FLGCOMSEMCOT,''C'',''COM COTAÇÃO'',''SEM COTAÇÃO'')) AS STATUS');
      SQL.Add('FROM  ');

      If MostraForn Then
         SQL.Add('    PESSOA P,  ');

      SQL.Add('    OC,         ');
      SQL.Add('    (SELECT SUM(QTDEPEDIDA * VALORUN) AS VALOROC FROM ITEMOC WHERE (NUMOC = '+IntToStr(iNumOC)+') ) SUB ');
      SQL.Add('WHERE  (OC.NUMOC = '+IntToStr(iNumOC)+')');

      If MostraForn Then
         SQL.Add('   AND (OC.IDFORCLI = P.IDPESSOA )');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlRADConsultaCompras.SelectPrazoEntregaOC(iNumOC: Integer): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDITEMOC, PARCELAENTREGA, PRAZOENTREGA, QTDEENTREGA,'+
          '        PERIODOPRAZO, DATAENTREGA '+
          ' FROM PRAZOENTREGAOC '+
          ' WHERE  (IDITEMOC IN (SELECT IDITEMOC FROM ITEMOC WHERE (NUMOC = '+IntToStr(iNumOC)+' ) ) ) ';
   Result := GetDataPacket(SQL);
end;


function TCtrlRADConsultaCompras.SelectItemOC(iNumOC: integer): OleVariant;
var
   SQL     : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT                    ');
      SQL.Add('     IT.IDITEMOC,         ');
      SQL.Add('     IT.NUMOC,            ');
      SQL.Add('     IT.CODARTIGO,        ');
      SQL.Add('     IT.CODMEDIDA,        ');
      SQL.Add('     IT.QTDEPEDIDA,       ');
      SQL.Add('     IT.QTDERECEBIDA,     ');
      SQL.Add('     IT.VALORUN,          ');

      //  Rodolpho da Silva - P: 19276 - 08/06/2005
      SQL.Add('    (IT.QTDEPEDIDA * IT.VALORUN) AS TOTAL,');

      SQL.Add('     IT.FLGITEMATENDIDO,  ');
      SQL.Add('     IT.OBSITEMOC,        ');
      SQL.Add('     IT.IDPRODVARI,       ');
      SQL.Add('     R.NUMRESERVA AS IDRESERVAORCAMEN, ');
      SQL.Add('     TO_NUMBER(RTRIM(SUBSTR(IT.TRGUSERINCLUSAO,3,30))) AS IDUSUARIO,');
      SQL.Add('     DECODE(IT.FLGITEMATENDIDO,''T'',''R'',DECODE(IT.FLGITEMATENDIDO,''C'',''C'',DECODE(NVL(QTDERECEBIDA,0),0,''P'',''A''))) AS STATUS, ');
      SQL.Add('     SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO,');
      SQL.Add('     P.CODPRODUTO,        ');
      SQL.Add('     P.CODGRUPOPROD,      ');
      SQL.Add('     G.CODTIPRECDES,      ');
      SQL.Add('     (0) AS IDITEMSOLI,   ');
      SQL.Add('     (0) AS CODPROCESSO,  ');
      SQL.Add('     (0) AS IDPROCXART,   ');
      SQL.Add('     (0) AS IDFORCLI,     ');
      SQL.Add('     (0) AS PROPOSTA      ');
      SQL.Add('FROM                      ');
      SQL.Add('     ITEMOC IT,           ');
      SQL.Add('     ARTIGO A,            ');
      SQL.Add('     PRODUTO P,           ');
      SQL.Add('     GRUPPROD G,          ');
      SQL.Add('     PRODVARI PV,         ');
      SQL.Add('     RESERVAORCAMEN R     ');
      SQL.Add('WHERE                     ');
      SQL.Add('       (IT.NUMOC = '+IntToStr(iNumOC )+') ');
      SQL.Add('   AND (IT.CODARTIGO    = A.CODARTIGO)   ');
      SQL.Add('   AND (A.CODPRODUTO    = P.CODPRODUTO)  ');
      SQL.Add('   AND (G.CODGRUPOPROD  = P.CODGRUPOPROD)  ');
      SQL.Add('   AND (IT.IDPRODVARI   = PV.IDPRODVARI(+)) ');
      SQL.Add('   AND (IT.IDRESERVAORCAMEN = R.IDRESERVAORCAMEN(+)) ');
      SQL.Add('ORDER BY DESCRICAO ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlRADConsultaCompras.SelectPrazoPgtoOC(iNumOC: integer): OleVariant;
var
   SQL : String;
begin
   SQL := ' SELECT IDITEMOC, PARCELAPGTO, PRAZOPGTO, PERIODOPRAZO, '+
          '        PERCPAGTO, DATAPAGTO '+
          ' FROM PRAZOPGTOOC '+
          ' WHERE  (IDITEMOC IN (SELECT IDITEMOC FROM ITEMOC WHERE (NUMOC = '+FloatToStr(iNumOC)+' ) ) ) ';
   Result := GetDataPacket(SQL);
end;

function TCtrlRADConsultaCompras.SelectAgregItemOC(iNumOC: integer): OleVariant;
Var
   SQL     : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT                        ');
      SQL.Add('      AI.IDITEMOC,            ');
      SQL.Add('      AI.IDAGREGITEMOC,       ');
      SQL.Add('      AI.CODTIPOCUSTAGREG,    ');
      SQL.Add('      AI.ALIQUOTA,            ');
      SQL.Add('      AI.BASECALCULO,         ');
      SQL.Add('      AI.VLRAGREGITEM,        ');
      SQL.Add('      TA.DESCCUSTAGREG        ');
      SQL.Add('FROM                          ');
      SQL.Add('      AGREGITEMOC AI,         ');
      SQL.Add('      TIPOAGRE TA             ');
      SQL.Add('WHERE                         ');
      SQL.Add('     (IDITEMOC IN (SELECT IDITEMOC FROM ITEMOC WHERE (NUMOC = '+IntToStr(iNumOC)+' ) ) ) ');
      SQL.Add(' AND (TA.FLGINCIDECOMPRA = ''S'') ');
      SQL.Add(' AND (AI.CODTIPOCUSTAGREG(+) = TA.CODTIPOCUSTAGREG)');
      SQL.Add('ORDER BY TA.DESCCUSTAGREG ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlRADConsultaCompras.SelectSCItemOC(iNumOC: integer): OleVariant;
var
   SQL : String;
begin
   SQL := ' SELECT IDITEMOC, NUMSOLCOMPRA, IDITEMSOLI '+
          ' FROM  SCITEMOC '+
          ' WHERE  (IDITEMOC IN (SELECT IDITEMOC FROM ITEMOC WHERE (NUMOC = '+IntToStr(iNumOC)+' ) ) ) ';
   Result := GetDataPacket(SQL);
end;

function TCtrlRADConsultaCompras.SelectSCIOrigem(iIdItemOC: integer): OleVariant;
var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT                  ');
      SQL.Add('      SOLI.NUMSOLCOMPRA,');
      SQL.Add('      IT.CODPROCESSO,   ');
      SQL.Add('      IT.IDPROCXART,    ');
      SQL.Add('      IT.CODARTIGO,     ');
      SQL.Add('      IT.QTDEPEDIDA,    ');
      SQL.Add('      IT.QTDEPENDENTE,  ');
      SQL.Add('      IT.CODMEDIDA,     ');
      SQL.Add('      IT.OBSITEMSOLIC,  ');
      SQL.Add('      SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO');
      SQL.Add('FROM ');
      SQL.Add('     ITEMSOLI IT,             ');
      SQL.Add('     ( SELECT NUMSOLCOMPRA    ');
      SQL.Add('       FROM  SOLICOMP         ');
      SQL.Add('       GROUP BY NUMSOLCOMPRA  ');
      SQL.Add('   	) SOLI,              ');
      SQL.Add('    SCITEMOC SXC,             ');
      SQL.Add('    PRODUTO P,                ');
      SQL.Add('    ARTIGO A,                 ');
      SQL.Add('    PRODVARI PV               ');
      SQL.Add('WHERE                         ');
      SQL.Add('      (SXC.IDITEMOC    = '+IntToStr(iIdItemOC)+')          ');
      SQL.Add('  AND (IT.IDITEMSOLI   =  SXC.IDITEMSOLI)    ');
      SQL.Add('  AND (IT.NUMSOLCOMPRA = SOLI.NUMSOLCOMPRA ) ');
      SQL.Add('  AND (A.CODARTIGO     = IT.CODARTIGO)       ');
      SQL.Add('  AND (A.CODPRODUTO    = P.CODPRODUTO)       ');
      SQL.Add('  AND (IT.IDPRODVARI  = PV.IDPRODVARI(+))    ');
      SQL.Add('ORDER BY DESCRICAO                           ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlRADConsultaCompras.GetOrdemCompras(iIdProcessoRAD: integer): integer;
var
  sSQL: string;
  cdsLocal: TClientDataSet;
begin
  try
    Result := 0;

    sSQL := 'SELECT NUMOC FROM OC WHERE IDPROCESSO = ' + IntToStr(iIdProcessoRAD);
    cdsLocal := TClientDataSet.Create(nil);

    cdsLocal.Data := GetDataPacket(sSQL);
    Result := cdsLocal.FieldByName('NUMOC').AsInteger;

  finally
    FreeAndNil(cdsLocal);
  end;
end;

function TCtrlRADConsultaCompras.SelectReqMat(iNumRequisicao: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT NUMREQUISICAO,                                                              '+
    '       IDUSUARIOINCLUSAO,                                                          '+
    '       IDPESSOA,                                                                   '+
    '       IDEMPRESA,                                                                  '+
    '       CODCENTROCUSTO,                                                             '+
    '       CODALMOXAORIGEM                                                             '+
    '       CUSTOTRANSF,                                                                '+
    '       DATAEMISSAO,                                                                '+
    '       REQATENDIDA,                                                                '+
    '       DATANECESSIDADE,                                                            '+
    '       IMPRESSO,                                                                   '+
    '       CODALMOXADESTINO,                                                           '+
    '       IDPROCESSO,                                                                 '+
    '       UNIDNEGOC,                                                                  '+
    '       OBS,                                                                        '+
    '       CODALMOXAORIGEM                                                             '+
    'FROM   REQMAT                                                                      '+
    'WHERE  NUMREQUISICAO = '+ IntToStr(iNumRequisicao)                                  ;

  Result := GetDataPacket(sSQL);
end;

function TCtrlRADConsultaCompras.SelectItemReqMat(iNumRequisicao: integer): OleVariant;
var
  sSQL: string;
begin
  ssQL :=
   'SELECT I.NUMREQUISICAO,                                                                                                                                                         '+
   '       I.CODARTIGO,                                                                                                                                                             '+
   '       I.CODMEDIDA,                                                                                                                                                             '+
   '       I.VALORUN,                                                                                                                                                               '+
   '       I.QTDEPEDIDA,                                                                                                                                                            '+
   '       I.QTDEPENDENTE,                                                                                                                                                          '+
   '       (I.QTDEPEDIDA - I.QTDEPENDENTE) AS QTDEATENDIDA,                                                                                                                         '+
   '       NVL(DECODE(SUB.FLGSTATUS, ''D'', SUB.QTDEENTREGA), 0) AS QTDEDEVOLVIDA,                                                                                                  '+
   '       ( P.DESCPROD  || ' + ' A.CODCOR || ' + '  A.CODTAMANHO)  DESCRICAO,                                                                                                      '+
   '       P.CODGRUPOPROD,                                                                                                                                                          '+
   '       (0) AS VALOR,                                                                                                                                                            '+
   '       I.OBS,                                                                                                                                                                   '+
   '       DECODE(I.QTDEPEDIDA, I.QTDEPENDENTE,''NÃO ATENDIDA'',DECODE(SUB.CODARTIGO,NULL,''ESTORNADO'',DECODE(I.QTDEPENDENTE, 0, ''ATEND. TOTAL'','' ATEND. PARCIAL''))) AS STATUS '+
   'FROM ITEMPEDI I,'+
   '     ARTIGO A,  '+
   '     PRODUTO P, '+
   '     ('+
   '       SELECT CODARTIGO, FLGSTATUS, QTDEENTREGA  FROM ITEMENTR '+
   '       WHERE (NUMREQUISICAO = '+ IntToStr(iNumRequisicao) + ')' +
   '     )SUB                                                      '+
   'WHERE (I.NUMREQUISICAO = '+ IntToStr(iNumRequisicao) +       ')'+
   '  AND ( A.CODARTIGO = I.CODARTIGO)                             '+
   '  AND ( A.CODPRODUTO = P.CODPRODUTO)                           '+
   '  AND ( A.CODARTIGO = SUB.CODARTIGO(+))                        '+
   'ORDER BY  DESCRICAO                                            ';

   Result := GetDataPacket(sSQL);
end;


function TCtrlRADConsultaCompras.GetRequisicaoMaterial(iIdProcesso: integer): integer;
var
  sSQL: string;
  cdsLocal: TClientDataSet;
begin
  try
    Result := 0;

    sSQL :=
    'SELECT NUMREQUISICAO                                  '+
    'FROM   REQMAT                                         '+
    'WHERE ( IDPROCESSO = '+ IntToStr(iIdProcesso) + ')'    ;

    cdsLocal := TClientDataSet.Create(nil);
    cdsLocal.Data := GetDataPacket(sSQL);

    Result := cdsLocal.FieldByName('NUMREQUISICAO').AsInteger;

  finally
    FreeAndNil(cdsLocal);
  end;
end;

function TCtrlRADConsultaCompras.SelectCentroCusto(
  iCodCCusto, iIdEmpresa: integer): OleVariant;
var
  sSQL: string;
begin
   sSQL :=
     'SELECT * FROM CENTCUST '+
     'WHERE IDEMPRESA = ' + IntToStr(iIdEmpresa) +
     '  AND CODCENTROCUSTO = ' + IntToStr(iCodCCusto);
   Result := GetDataPacket (sSQL);
end;

{ TCtrlRadConsultaDestacamento }

function TCtrlRadConsultaDestacamento.ListaDestacamento(const iDestacamento: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    ' select '                                                                 +
    '   dst.iddestacamento, dst.idprocesso, dst.idpessoa, '                    +
    '   dst.flgfuncionario, dst.dataini, dst.datafim, '                        +
    '   dst.observacao, dst.vlracerto, dst.indacerto, '                        +
    '   dst.justificativa, '                                                   +
    '   dst.trgdtinclusao, dst.trguserinclusao, '                              +
    '   dst.indobjetivo, dst.flglancafolha, dst.flggeraap, '                   +
    '   dst.valaliment, dst.valoutros, dst.dataemailacerto, '                  +
    '   dst.coddocacerto, dst.coddocdestac, '                                  +
    '   dst.idusuariosistema, dst.idprocessoacerto, '                          +
    '   psa.nome, '                                                            +
    '   decode(fco.idfuncao,null,fco.idcargo,fco.idfuncao) as id_cargo, '      +
    '   fco.codcentrocusto, '                                                  +
    //início - andré tavares - pendência 26377 - 19/09/2007
    ' ''                                                                                                        '' as NM_CENTRO_CUSTO, '+
    ' ''                                                                                                        '' as NM_CARGO,        '+
    //fim - andré tavares - pendência 26377 - 19/09/2007
    //início - andré tavares - 09/10/2007

    '   p1.nome as usuariodestac,     '+
    '   p2.nome as usuarioacerto,     '+
    '   d1.nodocumento as docdestac,  '+
    '   d2.nodocumento as docacerto   '+

    //fim    - andré tavares - 09/10/2007
    ' from '                                                                   +
    '   destacamento dst, '                                                    +
    '   pessoa psa, '                                                          +
    '   funcionario fco, '+
    //início - andré tavares - 09/10/2007
    ' documento d1, documento d2, pessoa p1, pessoa p2 '+
    //fim    - andré tavares - 09/10/2007

    ' where '                                                                  +
    '   dst.idpessoa = psa.idpessoa '                                          +

    //início - andré tavares - 09/10/2007

    '   and (d1.coddocumento (+) = dst.coddocdestac)      '+
    '   and (d2.coddocumento (+) = dst.coddocacerto)      '+
    '   and (p1.idpessoa (+)     = dst.idusuariosistema)  '+
    '   and (p2.idpessoa (+)     = dst.idusuarioacerto)   '+

    //fim    - andré tavares - 09/10/2007

    '   and dst.idpessoa = fco.idpessoa '                                      +
    '   and dst.IDDESTACAMENTO = ' + IntToStr(iDestacamento);

  Result := GetDataPacket(sSQL);
end;

function TCtrlRadConsultaDestacamento.ListaCalendario(const iDestacamento: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    ' select '                                                                 +
    '   iddestacamento, datadestacamento, flgdiaria, trgdtinclusao, '          +
    '   trguserinclusao, vlrdiaria, vlrhotel, vlrdeslocamento, '               +
    '   pcdiaria, pchotel, pcdeslocamento, '                                   +
    '   DECODE(FLGDIARIA,1,' + QuotedStr('Pela Empresa') +
                       ',0,' + QuotedStr('Pelo Destacado') + ') quempaga '     +
    ' from '                                                                   +
    '   dstcalendario '                                                        +
    ' where '                                                                  +
    '   iddestacamento = ' + IntToStr(iDestacamento);

  Result := GetDataPacket(sSQL);
end;


function TCtrlRadConsultaDestacamento.ListaTrecho(const iDestacamento: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    ' select '                                                                 +
    '   trc.iddestacamento, trc.numseq, trc.idcidades, trc.dataini, '          +
    '   trc.indtransporte, trc.flgtransporte, trc.vlrtransporte, '             +
    '   trc.vlrembarque, trc.vlrdesembarque, trc.trgdtinclusao, '              +
    '   trc.trguserinclusao, '                                                 +
    '   cid.nome, '                                                            +
    '   DECODE(INDTRANSPORTE,'                                                 +
               '1,' + QuotedStr('Aéreo') + ','                                 +
               '2,' + QuotedStr('Rodoviário') + ','                            +
               '3,' + QuotedStr('Carro Próprio') + ','                         +
               '4,' + QuotedStr('Carro Alugado') + ','                         +
               '5,' + QuotedStr('Ferroviário') + ','                           +
               '6,' + QuotedStr('Outros') + ','                                +
               '6) as transporte, '                                            +
    ' DECODE(FLGTRANSPORTE,'                                                   +
               '0,' + QuotedStr('Empresa') + ','                               +
               '1,' + QuotedStr('Destacado') + ') as RespTransporte, '         +
    '   cid.nome, cid.uf, cid.pais '                                           +
    ' from '                                                                   +
    '   dsttrecho trc, '                                                       +
    '   cidades cid '                                                          +
    ' where '                                                                  +
    '   trc.idcidades = cid.idcidades '                                        +
    '   and trc.iddestacamento = ' + IntToStr(iDestacamento)                   +
    ' order by '                                                               +
    '   trc.iddestacamento, '                                                  +
    '   trc.numseq ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRadConsultaDestacamento.getDescricaoCargo(const iCargo: Integer): String;
var
  sSQL: string;
  _cdsTemp: TClientDataSet;
begin
  try
    Result := '';

    sSQL := ' select titulo from cargo where idcargo = ' + IntToStr(iCargo);

    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.Data := GetDataPacket(sSQL);

    Result := _cdsTemp.Fields[0].AsString;

  finally
    FreeAndNil(_cdsTemp);
  end;
end;

function TCtrlRadConsultaDestacamento.getDescricaoCentroCusto(const iCentroCusto: Integer): String;
var
  sSQL: string;
  _cdsTemp: TClientDataSet;
begin
  try
    Result := '';

    sSQL := ' select nome from centcust where codcentrocusto = ' + IntToStr(iCentroCusto);

    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.Data := GetDataPacket(sSQL);

    Result := _cdsTemp.Fields[0].AsString;

  finally
    FreeAndNil(_cdsTemp);
  end;
end;

function TCtrlRadConsultaDestacamento.getDestacamento(const iProcesso, iRADRef: Integer): Integer;
var
  sSQL: string;
  _cdsTemp: TClientDataSet;
begin
  try
    Result := 0;

    Case iRADRef of
      32 : sSQL := ' SELECT IDDESTACAMENTO FROM DESTACAMENTO WHERE IDPROCESSO = ' + IntToStr(iProcesso);
      33 : sSQL := ' SELECT IDDESTACAMENTO FROM DESTACAMENTO WHERE IDPROCESSOACERTO = ' + IntToStr(iProcesso);
    end;

    _cdsTemp := TClientDataSet.Create(nil);
    _cdsTemp.Data := GetDataPacket(sSQL);

    Result := _cdsTemp.Fields[0].AsInteger;

  finally
    FreeAndNil(_cdsTemp);
  end;
end;


//início - Lista os valores totais disponibilizados - andré tavares - 09/10/2007
function TCtrlRadConsultaDestacamento.ListaTotValoresCalendario(const iDestacamento: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := ' SELECT SUM((VLRDIARIA * PCDIARIA) / 100) AS VLRDIARIA, '+
          '        SUM((VLRHOTEL * PCHOTEL) / 100) AS VLRHOTEL, '+
          '        SUM((VLRDESLOCAMENTO * PCDESLOCAMENTO) / 100) AS VLRDESLOCAMENTO '+
          ' FROM DSTCALENDARIO '+
          ' WHERE IDDESTACAMENTO = ' + IntToStr(iDestacamento);

  Result := GetDataPacket(sSQL);
end;


function TCtrlRadConsultaDestacamento.ListaTotValoresTrecho(const iDestacamento: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := ' SELECT SUM(VLRTRANSPORTE) AS VLRTRANSPORTE,  '+
          '        SUM(VLREMBARQUE) AS VLREMBARQUE,      '+
          '        SUM(VLRDESEMBARQUE) AS VLRDESEMBARQUE, '+
          '        SUM(VLRTRANSPORTE) + SUM(VLREMBARQUE) + SUM(VLRDESEMBARQUE) AS TOTTRECHO '+
          ' FROM DSTTRECHO '+
          ' WHERE IDDESTACAMENTO =  ' + IntToStr(iDestacamento);

  Result := GetDataPacket(sSQL);
end;


function TCtrlRadConsultaDestacamento.listarDespesas(const iDestacamento: Integer):  OleVariant;
var
  sSQL: string;
begin
  sSQL := ' SELECT D.*, C.DESCRICAO, SUBSTR(D.OBSERVACAO,1,40) AS OBSCURTA '   +
          ' FROM DSTITEMDESPESA D, DSTTIPODESPESA C '+
          ' WHERE (D.IDDESTACAMENTO = ' + IntToStr(iDestacamento) +') AND ' +
          '       (D.IDDSTTIPODESPESA = C.IDDSTTIPODESPESA) '+
          ' ORDER BY D.DATAREF, C.DESCRICAO ';

  Result := GetDataPacket(sSQL);
end;


function TCtrlRadConsultaDestacamento.buscarStatusRAD(const iProcesso: Integer): String;
var
  _CdsAux: TClientDataSet;
  sSql : String;
begin
  sSql := ' SELECT '+
          '   DECODE(FLGOK, '+
          '          ''E'',''EXCLUÍDO'', '                  +
          '          ''N'',''PENDENTE'', '                  +
          '          ''R'',''RECUSADO'', '                  +
          '          ''S'',''APROVADO'',NULL) as Status    '+
          ' FROM '                                          +
          '   RADINSTPROCESSO '                             +
          ' WHERE '                                         +
          '   IDPROCESSO = ' + IntToStR(iProcesso);

  _CdsAux := TClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(sSql);

  Result := _CdsAux.Fields[0].AsString;

  _CdsAux.Free;
end;


//fim - andré tavares - 09/10/2007


end.
