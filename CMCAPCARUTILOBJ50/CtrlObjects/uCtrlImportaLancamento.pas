Unit uCtrlImportaLancamento;
{-----------------------------------------------------------------------------------------
  Data      : 16/10/2007
  Autor     : Marcus Oliveira
  Pendência : 26534
  Descrição : Adicionado um filtro ao método ListaDocFromTabela
{-----------------------------------------------------------------------------------------
  Data      : 10/05/2007
  Autor     : Rodolpho da Silva
  Pendência : 25154
  Descrição : Corrigir o erro em que não contabilizava alguns lanctos
-----------------------------------------------------------------------------------------
  Data      : 05/02/2007
  Autor     : Rodolpho da Silva
  Pendência : 24396
  Descrição : Corrigir o erro no qual o campo PLACONTA não estava gravando
              na tabela DOCUMENTO 
------------------------------------------------------------------------------------------
  Data      : 02/08/2006
  Autor     : Rodolpho da Silva
  Pendência : 22484
  Descrição : Implementar rotina de importação para dados importados de tabelas (banco de dados)
------------------------------------------------------------------------------------------}

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, uCMTypes,
  DbClient, Classes, uCtrlImpostoRetido, uCtrlDocumento, uCtrlLancDocCapCar,
  uCtrlPadroes, uFuncaoGeral, uctrlparamintegra, CmEventosCadastro,
  // Rodolpho da Silva - P: 22118 - 26/09/2006
  uDbLoteexportactb, uCtrlPlacontasCapCar;




Type

  TCtrlImportaLancamento = Class(TCmControlObject)
  private

  protected
    Procedure AfterInitialize; override;
    Procedure DoChangeDataBase; override;


  private
    CtrlImpostoRetido : TCtrlImpostoRetido;
    CtrlDocumento     : TCtrlDocumento;
    CtrlLancDocCapCar : TCtrlLancDocCapCar;
    CtrlFuncaoGeral   : TFuncaoGeral;
    CdsAux            : TClientDataSet;
    CdsDocumento      : TClientDataSet;
    CdsCCBaixasXDocum : TClientDataSet;
    CdsContab         : TClientDataSet;
    CdsRateio         : TClientDataSet;
    PlaConta          : TPlacontas;

    // Rodolpho da Silva - P: 22118 - 26/09/2006
    DbLoteExportaCtb  : TDbLoteexportactb;
    _CdsDocumento     : TClientDataSet;
    _CdsRateioDocum   : TClientDataSet;
    _CdsAlteradores   : TClientDataSet;

    function  PreencheCdsDocumento: OleVariant;
    function  PreencheCdsRateioDocum: OleVariant;


    function  RetornaCentCusto(sCodExterno: string; iIdPlanoCentCusto: integer): string;
    function  RetornaAtivProjeto(sIdPessoa: string): string;
    function  RetornaCodCentRespon(sIdPessoa: string): string;

    function  RetornaCodFormaPagto(sCodigo,sRecPag: string): string;
    function  RetornaCodPortForma(sCodigo: string): string;
    // Rodolpho da Silva - P:22484 - 02/08/2006
    function  ListaCCBaixasXDocum: OleVariant;
    function  ListaCdsContab: OleVariant;
    function  ListaCdsRateio: Olevariant;
    function  InsereContaCorrente(iIdFornCli,iNumBanco,iNumAgencia: integer; sContaCorrente: string): Boolean;
    procedure RetornarErroLog(sDescErro: string;bImportaFromTabela: boolean);

    function RetornaCodigo(sSQL: string) : string;
    function ValidaData(sData: string): boolean;


    function  ProcessaDadosCdsDocumento(bImportaFromTabela: boolean): boolean;
    function  CopiaDadosCdsDocumento(bGravaDocumento,bGravaLancDocum,bGravaRateio,
              // Rodolpho da Silva - P: 22484 - 14/09/2006
              bImportaFromTabela: boolean): boolean;

  public
    Constructor Create; override;
    Destructor  Destroy; override;


    Function    ListaPlano: OleVariant;
    Function    ListRateioDocum(iCodDocumento: Double): OleVariant;
    Function    ListNumLancto(iCodDocumento: Double): OleVariant;

    // Rodolpho da Silva - P: 22484 - 18/09/2006
    function    ListaDocFromTabela(sRecPag : string; dDataIni,dDataFim: TDateTime; sFiltroData: string): OleVariant;


    function    ImportaLancamentos(sArquivoImportacao: TStringList;
                                   sRecPag, sHistoricoCompl: string;
                                   bUsaPlanoPatro,bPartidaDobrada,bIntegraContab: boolean;
                                   iIdEspAcesso,
                                   iIdUsuario,
                                   iIdEmpresa,
                                   iIdMdulo,
                                   iIdPlanoCentCusto,
                                   iUnidNegoc,
                                   iPlanoConta: integer;
                                   // Rodolpho da Silva - P: 22484
                                   sDescLote: string;
                                   bLancaPartDobrada: boolean;
                                   ovDocsFromTabela: OleVariant;
                                   bImportaFromTabela: boolean = False
                                   ): Boolean;


  End;




Implementation

{ TCtrlImportaLancamento }




Procedure TCtrlImportaLancamento.AfterInitialize;
Begin
  Inherited;
  CtrlDocumento.InitializeAs(self);
  CtrlFuncaoGeral.InitializeAs(Self);
  CtrlImpostoRetido.InitializeAs(self);
  CtrlLancDocCapCar.InitializeAs(self);
  inherited;
  _CdsDocumento.Data   := PreencheCdsDocumento;
  _CdsRateioDocum.Data := PreencheCdsRateioDocum;
  _CdsAlteradores.Data := GetDataPacket('SELECT ' +
                                        ' ''                                      '' AS DESCRICAO, ' +
                                        ' ''01.01.1900'' AS DATALANCTO, ' +
                                        ' 0.00 AS VALOROUTRAMOEDA, 0.00 AS VALOR, ' +
                                        ' ''                                                                           '' AS HISTORICOCOMPL, ' +
                                        ' ''  '' AS DEBCRE, ' +
                                        ' 0.00 AS VLRLIQUIDO, ' +
                                        ' 0 AS UNIDNEGOC, ' +
                                        ' 0 AS IDPESSOA, ' +
                                        ' ''                            '' AS NOME, ' +
                                        ' 0 AS CODALTERADOR, ' +
                                        ' ''S'' AS CONTABILIZA, ' +
                                        ' '' '' AS FLGINCIDEIRRF ' +
                                        'FROM ' +
                                        '  DUAL ' +
                                        'WHERE 1 = 2 ');
End;





Constructor TCtrlImportaLancamento.Create;
Begin
  Inherited;
  CtrlDocumento     := TCtrlDocumento.Create;
  CtrlFuncaoGeral   := TFuncaoGeral.Create;
  CtrlImpostoRetido := TCtrlImpostoRetido.Create;
  CtrlLancDocCapCar := TCtrlLancDocCapCar.Create;
  CdsAux            := TClientDataSet.Create(Nil);
  CdsDocumento      := TClientDataSet.Create(nil);
  CdsCCBaixasXDocum := TClientDataSet.Create(nil);
  CdsContab         := TClientDataSet.Create(nil);
  CdsRateio         := TClientDataSet.Create(nil);

  // Rodolpho da Silva - P: 22118  26/09/2006
  DbLoteExportaCtb  := TDbLoteexportactb.Create(self);
  _CdsDocumento     := TClientDataSet.Create(nil);
  _CdsRateioDocum   := TClientDataSet.Create(nil);
  _CdsAlteradores   := TClientDataSet.Create(nil);
End;




Destructor TCtrlImportaLancamento.Destroy;
Begin
  FreeAndNil(CtrlDocumento);
  FreeAndNil(CdsDocumento);
  FreeAndNil(CdsAux);
  FreeAndNil(CtrlImpostoRetido);
  FreeAndNil(CtrlFuncaoGeral);
  FreeAndNil(CtrlLancDocCapCar);
  FreeAndNil(CdsCCBaixasXDocum);
  FreeAndNil(CdsContab);
  FreeAndNil(CdsRateio);

  // Rodolpho da Silva - P: 22118  26/09/2006
  FreeAndNil(DbLoteExportaCtb);
  FreeAndNil(_CdsDocumento);
  FreeAndNil(_CdsRateioDocum);
  FreeAndNil(_CdsAlteradores);
  Inherited;
End;




function TCtrlImportaLancamento.ImportaLancamentos(sArquivoImportacao: TStringList;
                                                   sRecPag,sHistoricoCompl: string;
                                                   bUsaPlanoPatro,bPartidaDobrada,bIntegraContab: boolean;
                                                   iIdEspAcesso,
                                                   iIdUsuario,
                                                   iIdEmpresa,
                                                   iIdMdulo,
                                                   iIdPlanoCentCusto,
                                                   iUnidNegoc,
                                                   iPlanoConta: integer;
                                                   // Rodolpho da Silva - P: 22484
                                                   sDescLote: string;
                                                   bLancaPartDobrada: boolean;
                                                   ovDocsFromTabela: OleVariant;
                                                   bImportaFromTabela: boolean = False
                                                   ): Boolean;
var
  CdsDocFromTabela: TClientDataSet;

  i,iNumLote: integer;

  CdsLoteCtb: TClientDataSet;

  // Variáveis que identificam os valores de cada linha do arquivo/tabela
  sCodPortForma,
  sIdFornecedor,
  sSistemaOrigem,
  sCodTipoDoc,
  sIndicaPag,
  sNumDocumento,
  sComplDocumento,
  sDataEmissao,
  sDataVencimento,
  sDataProgramada,
  sOperacao,
  sOperLancto,
  sCodAlterador,
  sDataLancto,
  sValorLancto,
  sCodTipoRecDes,
  sIndicaRecPag,
  sCodCentRespon,
  sAtividadeProj,
  sValorRateio,
  sFlgContabiliza,
  sCodFormaPagto,
  sCentCusto,
  sHistorico,
  sPlanoPrev,
  sPatro,
  sPrograma,
  sSegregaCriter,
  sDebCre,
  sPlanoConta : string;
begin
   try // Finally
      CdsLoteCtb := TClientDataSet.Create(nil);

      try  // Except

        if ConnectionSide = cnsClient Then
        begin
           Result := Connection.AppServer.ImportaLancamentos;
           if not Result then
              MessageInfo := Connection.AppServer.MessageInfo;
        end
        else
        begin
            CdsDocumento.Data := PreencheCdsDocumento;
            Result            := false;
            iNumLote          := 0;
            // Rodolpho da Silva - P: 25154 - 10/05/2007
            // Necessário isto devido a formatação do arquivo (Ex: 123.45)
            // Rodolpho da Silva - P:22484 - 02/08/2006
            //Verifica qual é o tipo de importação a ser feita
            //============================================================================
            // Se a importação for por tabela do banco de dados
            //============================================================================
            if bImportaFromTabela then
            begin
               CdsDocFromTabela := TClientDataSet.Create(nil);
               // Pega a estrutura para o CdsDocumento
               CdsDocumento.Data := PreencheCdsDocumento;

               // Selecionando os documentos ainda não importados
               CdsDocFromTabela.Data := ovDocsFromTabela;

               //  Exibe a barra de progresso
               DoProgresso([0,                              // Tipo operação
                            0,                              // Min.Reg. acima
                            CdsDocFromTabela.RecordCount, // Tot. Reg. acima
                            0,                              // Reg. atual acima
                            'Extraindo documentos não importados ',            // Legenda acima
                            1,                              // Min.Reg. abaixo
                            2,                              // Tot. Reg. abaixo
                            1,                              // Reg. atual abaixo0
                            'Selecionando documentos...',   // Legenda abaixo
                            '',                             // Mensagem do memo
                            '']);                           // Origem do erro



               // Rodolpho da Silva - P: 22118 - 26/09/2006
               // Pega o numero do lote para fazer o relacionamento
               //entre os documentos x lote na tabela IMPORTACAPCAR
               iNumLote := GetSequence('LOTEEXPORTACTB');

               while not CdsDocFromTabela.Eof do
               begin
                  //  Extrai as informações do da linha em foco
                  sCodPortForma := CdsDocFromTabela.FieldByName('CODPORTFORMA').AsString;
                  sIdFornecedor := CdsDocFromTabela.FieldByName('IDFORCLI').AsString;

                  case CdsDocFromTabela.FieldByName('RECPAG').AsString[1] of
                     'P': sSistemaOrigem := '3';
                     'R': sSistemaOrigem := '4';
                  end;

                  sCodTipoDoc     := CdsDocFromTabela.FieldByName('CODTIPDOC').AsString;
                  sIndicaPag      := CdsDocFromTabela.FieldByName('RECPAG').AsString;
                  sNumDocumento   := CdsDocFromTabela.FieldByName('NODOCUMENTO').AsString;
                  sComplDocumento := CdsDocFromTabela.FieldByName('COMPLDOCUMENTO').AsString;
                  sDataEmissao    := CdsDocFromTabela.FieldByName('DATAEMISSAO').AsString;
                  sDataVencimento := CdsDocFromTabela.FieldByName('DATAVENCTO').AsString;
                  sDataProgramada := CdsDocFromTabela.FieldByName('DATAPROGRAMADA').AsString;
                  sOperacao       := CdsDocFromTabela.FieldByName('OPERACAO').AsString;
                  sCodAlterador   := CdsDocFromTabela.FieldByName('CODALTERADOR').AsString;
                  sDataLancto     := CdsDocFromTabela.FieldByName('DATALANCTO').AsString;
                  sValorLancto    := CdsDocFromTabela.FieldByName('VALOR').AsString;
                  sCodTipoRecDes  := CdsDocFromTabela.FieldByName('CODTIPRECDES').AsString;
                  sIndicaRecPag   := CdsDocFromTabela.FieldByName('RECPAG').AsString;
                  sCodCentRespon  := CdsDocFromTabela.FieldByName('CODCENTRORESPON').AsString;
                  sAtividadeProj  := CdsDocFromTabela.FieldByName('UNIDNEGOC').AsString;
                  sValorRateio    := CdsDocFromTabela.FieldByName('VLRRATEIO').AsString;
                  sFlgContabiliza := CdsDocFromTabela.FieldByName('FLGCONTABILIZA').AsString;
                  sCodFormaPagto  := CdsDocFromTabela.FieldByName('CODTIPDOC').AsString;
                  sCentCusto      := CdsDocFromTabela.FieldByName('CODCENTROCUSTO').AsString;
                  sHistorico      := CdsDocFromTabela.FieldByName('HISTORICOCOMPL').AsString;
                  sPlanoPrev      := CdsDocFromTabela.FieldByName('IDPLANOPREV').AsString;
                  sPatro          := CdsDocFromTabela.FieldByName('IDPATRO').AsString;
                  sPrograma       := CdsDocFromTabela.FieldByName('IDPROGRAMA').AsString;
                  sSegregaCriter  := CdsDocFromTabela.FieldByName('IDSEGREGACRITER').AsString;


                  if Trim(sSegregaCriter) = '' then
                    sSegregaCriter := '-1';

                  if Trim(sHistorico) = '' then
                     sHistorico := sHistoricoCompl;

                  if Trim(sCodAlterador) = '' then
                    sCodAlterador := '-1';

                  //Pendência 22484 - David
                  //Só preenche novamente a AtividadeXProjeto se esta estiver nula
                  if trim( sAtividadeProj ) = '' then
                    sAtividadeProj := IntToStr(iUnidNegoc);

                  if Trim(sCodCentRespon) = '' then
                    sCodCentRespon := RetornaCodCentRespon(IntToStr(iIdEmpresa));

                  if Trim(sCodFormaPagto) = '' then
                    sCodFormaPagto :=  '-1';

                  //  Pega o flg Débito/Crédito através do CodTipDocumento
                  CdsAux.Data := GetDataPacket(' SELECT DEBCRE ' +
                                               ' FROM TIPODOCRECPAG ' +
                                               ' WHERE (CODTIPDOC = ' + sCodTipoDoc + ')' +
                                               '   AND (RECPAG = ' + QuotedStr(sRecPag)+ ')');
                  sDebCre := CdsAux.FieldByName('DEBCRE').AsString;

                  sPlanoConta := IntToStr(iPlanoConta);

                  // Insere os valores da linha
                  CdsDocumento.Append;
                  CdsDocumento.FieldByName('CODPORTFORMA').AsInteger   := StrToIntDef(Trim(sCodPortForma),0);
                  CdsDocumento.FieldByName('IDFORCLI').AsInteger       := StrToIntDef(Trim(sIdFornecedor),0);
                  CdsDocumento.FieldByName('SISTEMAORIGEM').AsInteger  := StrToIntDef(Trim(sSistemaOrigem),0);
                  CdsDocumento.FieldByName('CODTIPDOC').AsInteger      := StrToIntDef(Trim(sCodTipoDoc),0);
                  CdsDocumento.FieldByName('INDICAPAG').AsString       := Trim(AnsiUpperCase(sIndicaPag));
                  CdsDocumento.FieldByName('NODOCUMENTO').AsString     := Trim(sNumDocumento);
                  CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString  := Trim(sComplDocumento);
                  CdsDocumento.FieldByName('DATAEMISSAO').AsString     := Trim(sDataEmissao);
                  CdsDocumento.FieldByName('DATAVENCTO').AsString      := Trim(sDataVencimento);
                  CdsDocumento.FieldByName('DATAPROGRAMADA').AsString  := Trim(sDataProgramada);
                  CdsDocumento.FieldByName('CODALTERADOR').AsInteger   := StrToIntDef(Trim(sCodAlterador),0);
                  CdsDocumento.FieldByName('DATALANCTO').AsString      := Trim(sDataLancto);
                  CdsDocumento.FieldByName('VALOR').AsString           := Trim(sValorLancto);
                  CdsDocumento.FieldByName('OPERLANCTO').AsInteger     := StrToIntDef(Trim(sOperacao),0);
                  CdsDocumento.FieldByName('CODTIPRECDES').AsString    := Trim(sCodTipoRecDes);
                  CdsDocumento.FieldByName('INDICARECPAG').AsString    := Trim(sIndicaRecPag);
                  CdsDocumento.FieldByName('CODCENTRORESPON').AsString := Trim(sCodCentRespon);
                  CdsDocumento.FieldByName('UNIDNEGOC').AsInteger      := StrToIntDef(Trim(sAtividadeProj),0);
                  CdsDocumento.FieldByName('VLRRATEIO').AsString       := Trim(sValorRateio);
                  CdsDocumento.FieldByName('FLGCONTABILIZA').AsString  := AnsiUpperCase(Trim(sFlgContabiliza));
                  CdsDocumento.FieldByName('CODFORMAPAGTO').AsInteger  := StrToIntDef(Trim(sCodFormaPagto),0);
                  CdsDocumento.FieldByName('CODCENTROCUSTO').AsString  := Trim(sCentCusto);
                  CdsDocumento.FieldByName('HISTORICOCOMPL').AsString  := Trim(sHistorico);
                  CdsDocumento.FieldByName('IDPLANOPREV').AsInteger    := StrToIntDef(Trim(sPlanoPrev),0);
                  CdsDocumento.FieldByName('IDPATRO').AsInteger        := StrToIntDef(Trim(sPatro),0);
                  CdsDocumento.FieldByName('IDPROGRAMA').AsInteger     := StrToIntDef(Trim(sPrograma),0);
                  CdsDocumento.FieldByName('IDSEGREGACRITER').AsString := Trim(sSegregaCriter);
                  CdsDocumento.FieldByName('RECPAG').AsString          := sRecPag;
                  CdsDocumento.FieldByName('IDPESSOA').AsFloat         := iIdEmpresa;
                  CdsDocumento.FieldByName('IDMODULO').AsFloat         := iIdMdulo;
                  CdsDocumento.FieldByName('IDUSUARIO').AsFloat        := iIdUsuario;
                  CdsDocumento.FieldByName('IDESPACESSO').AsFloat      := iIdEspAcesso;
                  CdsDocumento.FieldByName('IDPLANOCENTCUSTO').AsFloat := iIdPlanoCentCusto;
                  CdsDocumento.FieldByName('USAPLANOPATRO').AsBoolean  := bUsaPlanoPatro;
                  CdsDocumento.FieldByName('DEBCRE').AsString          := sDebCre;
                  CdsDocumento.FieldByName('PLANOCONTA').AsString      := sPlanoConta;
                  CdsDocumento.FieldByName('PARTIDADOBRADA').AsBoolean := bPartidaDobrada;
                  CdsDocumento.FieldByName('INTEGRACONTAB').AsBoolean  := bIntegraContab;

                  // Início - Rodolpho da Silva - P: 22484 - 02/08/2006
                  if bLancaPartDobrada then
                     CdsDocumento.FieldByName('LANCAPARTDOBRADA').AsString := 'S'
                  else
                     CdsDocumento.FieldByName('LANCAPARTDOBRADA').AsString := 'N';
                  // Fim - Rodolpho da Silva - P: 22484 - 02/08/2006


                  // Rodolpho da Silva - P: 22118 - 26/09/2006
                  CdsDocumento.FieldByName('NUMLOTE').AsInteger := iNumLote;

                  // Início - Rodolpho da Silva - P: 22484 - 02/08/2006
                  // Estes campos não tem a necessidade de vir das variáveis, pois
                  //não há nenhuma validação específica, logo, podem vir direto do Cds
                  CdsDocumento.FieldByName('CPFCNPJ').AsString         := CdsDocFromTabela.FieldByName('CPFCNPJ').AsString;
                  CdsDocumento.FieldByName('NOMEFORCLI').AsString      := CdsDocFromTabela.FieldByName('NOMEFORCLI').AsString;
                  CdsDocumento.FieldByName('RAZAOSOCIAL').AsString     := CdsDocFromTabela.FieldByName('RSFORCLI').AsString;
                  CdsDocumento.FieldByName('BANCO').AsString           := CdsDocFromTabela.FieldByName('CODBANCO').AsString;
                  CdsDocumento.FieldByName('AGENCIA').AsString         := CdsDocFromTabela.FieldByName('CODAGENCIA').AsString;
                  CdsDocumento.FieldByName('CONTACORRENTE').AsString   := CdsDocFromTabela.FieldByName('CODCONTACORR').AsString;
                  CdsDocumento.FieldByName('QTDECOTAS').AsInteger      := CdsDocFromTabela.FieldByName('QTDECOTAS').AsInteger;
                  CdsDocumento.FieldByName('STATUSEXTERNO').AsString   := CdsDocFromTabela.FieldByName('STATUSEXTERNO').AsString;
                  CdsDocumento.FieldByName('CODEXTERNO').AsInteger     := CdsDocFromTabela.FieldByName('CODEXTERNO').AsInteger;
                  CdsDocumento.FieldByName('CODUSUARIO').AsString      := CdsDocFromTabela.FieldByName('CODUSUARIO').AsString;
                  CdsDocumento.FieldByName('DATAVALIDACAO').AsDateTime := CdsDocFromTabela.FieldByName('DATAVALIDACAO').AsDateTime;
                  CdsDocumento.FieldByName('DATACARGA').AsDateTime     := CdsDocFromTabela.FieldByName('DATACARGA').AsDateTime;
                  CdsDocumento.FieldByName('REFCLIENTE').AsString      := CdsDocFromTabela.FieldByName('REFCLIENTE').AsString;
                  // Fim - Rodolpho da Silva - P: 22484 - 02/08/2006

                  CdsDocumento.Post;


                  //  Anda a barra de progresso
                  DoProgresso([1,                              // Tipo operação 0-Mostra; 1-Anda, 2-Esconde
                               0,                              // Min.Reg. acima
                               CdsDocFromTabela.RecordCount,   // Tot. Reg. acima
                               CdsDocFromTabela.RecNo,         // Reg. atual acima
                               'Inserindo registros... ',      // Legenda acima
                               1,                              // Min.Reg. abaixo
                               2,                              // Tot. Reg. abaixo
                               1,                              // Reg. atual abaixo
                               'Importando documentos...',     // Legenda abaixo
                               '',                             // Mensagem do memo
                               '']);                           // Origem do erro



                  CdsDocFromTabela.Next;
               end;
                                        


            end
            else
            //============================================================================
            // Se a importação for feita pelo arquivo de texto
            //============================================================================
            begin
               //  Exibe a barra de progresso
               DoProgresso([0,                              // Tipo operação
                            0,                              // Min.Reg. acima
                            (sArquivoImportacao.Count - 1), // Tot. Reg. acima
                            0,                              // Reg. atual acima
                            'Validando arquivo',            // Legenda acima
                            1,                              // Min.Reg. abaixo
                            2,                              // Tot. Reg. abaixo
                            1,                              // Reg. atual abaixo0
                            'Importando o arquivo',         // Legenda abaixo
                            '',                             // Mensagem do memo
                            '']);                            // Origem do erro
                         // Origem do erro


               // Validar arquivo
               if Trim(sArquivoImportacao.Text) = '' then
                  raise Exception.Create('O arquivo de importação não pode estar vazio!');

               //  Início do loop do arquivo de importação
               for i := 0 to (sArquivoImportacao.Count - 1) do
               begin
                   //  Extrai as informações do da linha em foco
                  sCodPortForma   := Copy(sArquivoImportacao.Strings[i],1,8);
                  sIdFornecedor   := Copy(sArquivoImportacao.Strings[i],9,8);
                  sSistemaOrigem  := Copy(sArquivoImportacao.Strings[i],17,1);
                  sCodTipoDoc     := Copy(sArquivoImportacao.Strings[i],18,8);
                  sIndicaPag      := Copy(sArquivoImportacao.Strings[i],26,1);
                  sNumDocumento   := Copy(sArquivoImportacao.Strings[i],27,15);
                  sComplDocumento := Copy(sArquivoImportacao.Strings[i],42,3);
                  sDataEmissao    := Copy(sArquivoImportacao.Strings[i],45,10);
                  sDataVencimento := Copy(sArquivoImportacao.Strings[i],55,10);
                  sDataProgramada := Copy(sArquivoImportacao.Strings[i],65,10);
                  sOperacao       := Copy(sArquivoImportacao.Strings[i],75,1);
                  sCodAlterador   := Copy(sArquivoImportacao.Strings[i],76,8);
                  sDataLancto     := Copy(sArquivoImportacao.Strings[i],84,10);
                  sValorLancto    := StringReplace(Copy(sArquivoImportacao.Strings[i],94,17),'.',',',[rfReplaceAll]);
                  sOperLancto     := Copy(sArquivoImportacao.Strings[i],111,2);
                  sCodTipoRecDes  := Copy(sArquivoImportacao.Strings[i],113,15);
                  sIndicaRecPag   := Copy(sArquivoImportacao.Strings[i],128,1);
                  sCodCentRespon  := Copy(sArquivoImportacao.Strings[i],129,10);
                  sAtividadeProj  := Copy(sArquivoImportacao.Strings[i],139,8);
                  sValorRateio    := Copy(sArquivoImportacao.Strings[i],147,17);
                  sFlgContabiliza := Copy(sArquivoImportacao.Strings[i],164,1);
                  sCodFormaPagto  := Copy(sArquivoImportacao.Strings[i],165,8);
                  sCentCusto      := Copy(sArquivoImportacao.Strings[i],173,10);
                  sHistorico      := Copy(sArquivoImportacao.Strings[i],183,60);
                  sPlanoPrev      := Copy(sArquivoImportacao.Strings[i],243,10);
                  sPatro          := Copy(sArquivoImportacao.Strings[i],253,10);
                  sPrograma       := Copy(sArquivoImportacao.Strings[i],263,10);
                  sSegregaCriter  := Copy(sArquivoImportacao.Strings[i],273,10);



                  //  Validações necessárias c .custo
                  // Rodolpho da Silva - 08/03/2007
                  if Trim(sCentCusto) <> '' then
                  begin
                     // Verifica a existência do c.custo
                     if Trim(sCentCusto) <> RetornaCodigo('SELECT CODEXTERNO FROM CENTCUST WHERE CODEXTERNO = ' + QuotedStr(Trim(sCentCusto))) then
                        raise Exception.Create('Centro de custo não existente. Documento: ' + sNumDocumento + ' - ' + sComplDocumento);

                     // Extrai a chave (CODCENTROCUSTO) do valor informado (CODEXTERNO)
                     sCentCusto := RetornaCentCusto(Trim(sCentCusto),iIdPlanoCentCusto);
                  end;

                  if Trim(sSegregaCriter) = '' then
                    sSegregaCriter := '-1';

                  if Trim(sHistorico) = '' then
                     sHistorico := sHistoricoCompl;

                  if Trim(sCodAlterador) = '' then
                    sCodAlterador := '-1';

                  sAtividadeProj := IntToStr(iUnidNegoc);

                  if Trim(sCodCentRespon) = '' then
                    sCodCentRespon := RetornaCodCentRespon(IntToStr(iIdEmpresa));

                  if Trim(sCodFormaPagto) = '' then
                    sCodFormaPagto :=  '-1';

                  //  Pega o flg Débito/Crédito através do CodTipDocumento
                  CdsAux.Data := GetDataPacket(' SELECT DEBCRE ' +
                                               ' FROM TIPODOCRECPAG ' +
                                               ' WHERE (CODTIPDOC = ' + sCodTipoDoc + ')' +
                                               '   AND (RECPAG = ' + QuotedStr(sRecPag)+ ')');
                  sDebCre := CdsAux.FieldByName('DEBCRE').AsString;

                  sPlanoConta := IntToStr(iPlanoConta);

                  // Insere os valores da linha
                  CdsDocumento.Append;
                  CdsDocumento.FieldByName('CODPORTFORMA').AsInteger   := StrToIntDef(Trim(sCodPortForma),0);
                  CdsDocumento.FieldByName('IDFORCLI').AsInteger   := StrToIntDef(Trim(sIdFornecedor),0);
                  CdsDocumento.FieldByName('SISTEMAORIGEM').AsInteger  := StrToIntDef(Trim(sSistemaOrigem),0);
                  CdsDocumento.FieldByName('CODTIPDOC').AsInteger     := StrToIntDef(Trim(sCodTipoDoc),0);
                  CdsDocumento.FieldByName('INDICAPAG').AsString       := Trim(AnsiUpperCase(sIndicaPag));
                  CdsDocumento.FieldByName('NODOCUMENTO').AsString     := Trim(sNumDocumento);
                  CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString  := Trim(sComplDocumento);
                  CdsDocumento.FieldByName('DATAEMISSAO').AsString     := Trim(sDataEmissao);
                  CdsDocumento.FieldByName('DATAVENCTO').AsString      := Trim(sDataVencimento);
                  CdsDocumento.FieldByName('DATAPROGRAMADA').AsString  := Trim(sDataProgramada);
                  CdsDocumento.FieldByName('OPERACAO').AsString        := Trim(sOperacao);
                  CdsDocumento.FieldByName('CODALTERADOR').AsInteger   := StrToIntDef(Trim(sCodAlterador),0);
                  CdsDocumento.FieldByName('DATALANCTO').AsString      := Trim(sDataLancto);
                  CdsDocumento.FieldByName('VALOR').AsFloat            := StrToFloat(Trim(sValorLancto));
                  CdsDocumento.FieldByName('OPERLANCTO').AsInteger     := StrToIntDef(Trim(sOperLancto),0);
                  CdsDocumento.FieldByName('CODTIPRECDES').AsString    := Trim(sCodTipoRecDes);
                  CdsDocumento.FieldByName('INDICARECPAG').AsString    := Trim(sIndicaRecPag);
                  CdsDocumento.FieldByName('CODCENTRORESPON').AsString := Trim(sCodCentRespon);
                  CdsDocumento.FieldByName('UNIDNEGOC').AsInteger      := StrToIntDef(Trim(sAtividadeProj),0);
                  CdsDocumento.FieldByName('VLRRATEIO').AsFloat        := StrToFloat(Trim(sValorRateio));
                  CdsDocumento.FieldByName('FLGCONTABILIZA').AsString  := AnsiUpperCase(Trim(sFlgContabiliza));
                  CdsDocumento.FieldByName('CODFORMAPAGTO').AsInteger  := StrToIntDef(Trim(sCodFormaPagto),0);
                  CdsDocumento.FieldByName('CODCENTROCUSTO').AsString  := Trim(sCentCusto);
                  CdsDocumento.FieldByName('HISTORICOCOMPL').AsString  := Trim(sHistorico);
                  CdsDocumento.FieldByName('IDPLANOPREV').AsInteger    := StrToIntDef(Trim(sPlanoPrev),0);
                  CdsDocumento.FieldByName('IDPATRO').AsInteger        := StrToIntDef(Trim(sPatro),0);
                  CdsDocumento.FieldByName('IDPROGRAMA').AsInteger     := StrToIntDef(Trim(sPrograma),0);
                  CdsDocumento.FieldByName('IDSEGREGACRITER').AsString := Trim(sSegregaCriter);
                  CdsDocumento.FieldByName('RECPAG').AsString          := sRecPag;
                  CdsDocumento.FieldByName('IDPESSOA').AsFloat         := iIdEmpresa;
                  CdsDocumento.FieldByName('IDMODULO').AsFloat         := iIdMdulo;
                  CdsDocumento.FieldByName('IDUSUARIO').AsFloat        := iIdUsuario;
                  CdsDocumento.FieldByName('IDESPACESSO').AsFloat      := iIdEspAcesso;
                  CdsDocumento.FieldByName('IDPLANOCENTCUSTO').AsFloat := iIdPlanoCentCusto;
                  CdsDocumento.FieldByName('USAPLANOPATRO').AsBoolean  := bUsaPlanoPatro;
                  CdsDocumento.FieldByName('DEBCRE').AsString          := sDebCre;
                  CdsDocumento.FieldByName('PLANOCONTA').AsString      := sPlanoConta;
                  CdsDocumento.FieldByName('PARTIDADOBRADA').AsBoolean := bPartidaDobrada;
                  CdsDocumento.FieldByName('INTEGRACONTAB').AsBoolean  := bIntegraContab;

                  // Início - Rodolpho da Silva - P: 22484 - 02/08/2006
                  if bLancaPartDobrada then
                     CdsDocumento.FieldByName('LANCAPARTDOBRADA').AsString := 'S'
                  else
                     CdsDocumento.FieldByName('LANCAPARTDOBRADA').AsString := 'N';
                  // Fim - Rodolpho da Silva - P: 22484 - 02/08/2006
                  
                  CdsDocumento.Post;


                  //  Anda a barra de progresso
                  DoProgresso([1,                              // Tipo operação 0-Mostra; 1-Anda, 2-Esconde
                               0,                              // Min.Reg. acima
                               (sArquivoImportacao.Count - 1), // Tot. Reg. acima
                               i,                              // Reg. atual acima
                               'Inserindo registros... ',      // Legenda acima
                               1,                              // Min.Reg. abaixo
                               2,                              // Tot. Reg. abaixo
                               1,                              // Reg. atual abaixo
                               'Importando o arquivo...',      // Legenda abaixo
                               '',                             // Mensagem do memo
                               '']);                           // Origem do erro


               end;
            end; //  Fim do loop do arquivo de importação


            Result := ProcessaDadosCdsDocumento(bImportaFromTabela);
            if not Result then
              raise Exception.Create(MessageInfo);

            // Início - Rodolpho da Silva - P: 22118 - 26/09/2006
            if Result then
            begin
                if bImportaFromTabela then
                try
                   StartTransaction;

                   CdsLoteCtb.Data := GetDataPacket('SELECT IDLOTEEXPORTACTB, IDUSUARIO, DESCLOTE, ' +
                                                    '   DATALOTE, TIPOLOTE, NUMLOTE ' +
                                                    'FROM LOTEEXPORTACTB WHERE 1 = 2 ');
                   CdsLoteCtb.Append;
                   CdsLoteCtb.FieldByName('IDUSUARIO').AsInteger := iIdUsuario;
                   CdsLoteCtb.FieldByName('DESCLOTE').AsString   := sDescLote;
                   CdsLoteCtb.FieldByName('DATALOTE').AsDateTime := Now;

                   if sRecPag = 'R' then
                      CdsLoteCtb.FieldByName('TIPOLOTE').AsString := 'D'
                   else
                      CdsLoteCtb.FieldByName('TIPOLOTE').AsString := 'B';

                   CdsLoteCtb.FieldByName('NUMLOTE').AsInteger := iNumLote;
                   CdsLoteCtb.Post;

                   if not ApplyCds(CdsLoteCtb,DbLoteExportaCtb, [], []) then
                      raise Exception.Create(MessageInfo);

                   Result := true;

                   Commit;

                except
                   on E: exception do
                   begin
                      Rollback;
                      Result := False;
                      MessageInfo := E.Message;
                   end;
                end;
            end;
            // Fim - Rodolpho da Silva - P: 22118 - 26/09/2006

         end;

      except
         on E: exception do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;


   finally
      FreeAndNil(CdsDocFromTabela);
      FreeAndNil(CdsLoteCtb);
      //  Esconde a barra de progresso
      DoProgresso([2,                              // Tipo operação
                   0,                              // Min.Reg. acima
                   0,                              // Tot. Reg. acima
                   0,                              // Reg. atual acima
                   '',                             // Legenda acima
                   0,                              // Min.Reg. abaixo
                   3,                              // Tot. Reg. abaixo
                   1,                              // Reg. atual abaixo0
                   '',                             // Legenda abaixo
                   '',                             // Mensagem do memo
                   '']);                           // Origem do erro
   end;
end;







Function TCtrlImportaLancamento.ListNumLancto(
  iCodDocumento: Double): OleVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT ' +
          '  L.NUMLANCTO ' +
          'FROM ' +
          '  LANCTODOCUM L, DOCUMENTO D ' +
          'WHERE ' +
          '  (L.CODDOCUMENTO = ' + FloatToStr(iCodDocumento) + ') AND ' +
          '  (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
          '  (L.OPERACAO = D.OPERACAO) AND ' +
          '  (L.ESTORNO IS NULL) ';
  Result := GetDataPacket(sSQL);
End;




Function TCtrlImportaLancamento.ListRateioDocum(
  iCodDocumento: Double): OLEVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT ' +
    '  SUM(VALOR) AS VALOR ' +
    'FROM ' +
    '  RATEIODOCUM  ' +
    'WHERE ' +
    '  CODDOCUMENTO = ' + FloatToStr(iCodDocumento);
  Result := GetDataPacket(sSQL);
End;






function TCtrlImportaLancamento.PreencheCdsDocumento: OleVariant;
var
  sSql : string;

begin
   sSql :=  'SELECT ' +
            '   0 AS CODDOCUMENTO, ' +
            '   0 AS CODPORTFORMA, ' +
            '   0 AS IDFORCLI, ' +
            '   0 AS SISTEMAORIGEM, ' +
            '   0 AS CODTIPDOC, ' +
            '   '' '' AS INDICAPAG, ' +
            '   0 AS NODOCUMENTO, ' +
            '   0 AS IDCBANCARIA, ' +
            '   0 AS IDUSUARIOINCLUSAO, ' +
            '   ''   '' AS COMPLDOCUMENTO, ' +
            '   SYSDATE AS DATAEMISSAO, ' +
            '   SYSDATE AS DATAVENCTO, ' +
            '   SYSDATE AS DATAPROGRAMADA, ' +
            '   '' '' AS OPERACAO, ' +
            '   0 AS CODALTERADOR, ' +
            '   0 AS CODSUBCONTA, ' +
            '   0 AS CODFORMA, ' +
            '   0 AS CODLANCFINANC, ' +
            '   SYSDATE AS DATALANCTO, ' +
            '   0.00 AS VALOR, ' +
            '   0.00 AS VALOROUTRAMOEDA, ' +
            '   0 AS OPERLANCTO, ' +
            '   ''               '' AS CODTIPRECDES, ' +
            '   ''               '' AS NUMFATURA_1, ' +
            '   '' '' AS INDICARECPAG, ' +
            '   ''          '' AS CODCENTRORESPON, ' +
            '   0  AS UNIDNEGOC, ' +
            '   0 AS VLRRATEIO, ' +
            '   '' '' AS FLGCONTABILIZA, ' +
            '   0 AS CODFORMAPAGTO, ' +
            '   ''          '' AS CODCENTROCUSTO, ' +
            '   ''                                                                  '' AS HISTORICOCOMPL, ' +
            '   0 AS IDPLANOPREV, ' +
            '   0 AS IDPATRO, ' +
            '   0 AS IDPROGRAMA, ' +

            '   '' '' AS RECPAG,  ' +
            '   0 AS IDPESSOA, ' +
            '   0 AS IDMODULO, ' +
            '   0 AS IDUSUARIO, ' +
            '   0 AS IDESPACESSO, ' +
            '   0 AS IDPLANOCENTCUSTO, '+
            '   '' '' AS USAPLANOPATRO, ' +
            '   0 AS PLANO, ' +
            '   ''                                           '' AS PLACONTA, ' +
            '   ''                                           '' AS PLACONTACREDITO, ' +
            '   ''                                           '' AS CONTACREDITO, ' +
            '   '' '' AS DEBCRE, ' +
            '   ''                                                             '' AS NOMEFORNECEDOR, ' +
            '   0 AS UNIDNEGOC, ' +
            '   ''                                           '' AS PLANOCONTA, ' +
            '   '' '' AS PARTIDADOBRADA, ' +
            '   '' '' AS INTEGRACONTAB, ' +

            // Início - Rodolpho da Silva - P:22484 - 02/08/2006
            '   0 AS IDSEGREGACRITER, ' +
            '   ''N'' AS LANCAPARTDOBRADA, ' +
            '   0 AS PLNCODIGO, ' +
            '   0 AS VLRLIQUIDO, ' +
            '   0 AS NUMLANCTO, ' +
            '   0 AS NUMFATURA, ' +
            '   0 AS MOECODIGO, ' +

            '   ''               '' AS NUMSLIP, ' +
            '   ''               '' AS NUMLEITCODBARRAS, ' +
            '   ''               '' AS NOSSONUMERO, ' +
            '   ''               '' AS NUMDIGCODBARRAS, ' +
            '   ''               '' AS EMISBLOQ, ' +
            '   ''               '' AS REFERENCIA, ' +
            '   ''               '' AS OBS, ' +


            '   ''               '' AS CPFCNPJ, ' +
            '   ''                    '' AS CODEXTFORNCLI, ' +
            '   ''                                                       '' AS NOMEFORCLI, ' +
            '   ''                                                       '' AS RAZAOSOCIAL, ' +
            '   0 AS BANCO, ' +
            '   0 AS AGENCIA, ' +
            '   ''               '' AS CONTACORRENTE, ' +
            '   0 AS QTDECOTAS, ' +
            '   0 AS NUMAPGR, ' +
            '   0 AS NUMLOTE, ' +
            '   ''01.01.1899'' AS DATAIMPORTA, ' +
            '   0 AS STATUSCM, ' +
            '   0 AS CODEXTERNO, ' +
            '   ''  '' AS STATUSEXTERNO, ' +
            '   ''               '' AS CODUSUARIO, ' +
            '   ''01.01.1899'' AS DATAVALIDACAO, ' +
            '   ''01.01.1899'' AS DATACARGA, ' +
            '   ''                    '' AS REFCLIENTE ' +
            //Fim - Rodolpho da Silva - P: 22484

            'FROM ' +
            '   DUAL ' +
            'WHERE ' +
            '   1 = 2 ';

   Result := GetDataPacket(sSql);
end;




function TCtrlImportaLancamento.RetornaAtivProjeto(
  sIdPessoa: string): string;
begin
   CdsAux.Data := GetDataPacket('SELECT UNIDNEGOC FROM PARAMGLOBAL WHERE IDPESSOA = ' + sIdPessoa);
   Result      := CdsAux.FieldByName('UNIDNEGOC').AsString;
end;




function TCtrlImportaLancamento.RetornaCentCusto(sCodExterno: string; iIdPlanoCentCusto: integer): string;
begin
   CdsAux.Data := GetDataPacket('SELECT CODCENTROCUSTO ' +
                                'FROM CENTCUST ' +
                                'WHERE CODEXTERNO     = ' + QuotedStr(sCodExterno) +
                                '  AND IDPLANCENTCUST = ' + IntToStr(iIdPlanoCentCusto));
   Result := CdsAux.FieldByName('CODCENTROCUSTO').AsString;
end;







function TCtrlImportaLancamento.RetornaCodFormaPagto(
  sCodigo, sRecpag: string): string;
begin
   CdsAux.Data := GetDataPacket('SELECT CODFORMA ' +
                                'FROM FORMARECPAG ' +
                                'WHERE (CODFORMA = ' + sCodigo + ') ' +
                                ' AND  (RECPAG   = ' + QuotedStr(sRecPag) + ')');
   Result := CdsAux.FieldByName('CODFORMA').AsString;
end;




function TCtrlImportaLancamento.ProcessaDadosCdsDocumento(bImportaFromTabela: boolean): boolean;
var
  sIdFornecedorAnt, sNumDocumentoAnt, sComplDocAnt, sFornCli, sSQL: string;
  iCodDocumento: integer;
  bGravaDocum,bGravaLancDocum,bGravaRateio: boolean;

begin
   Result := true;
   CdsDocumento.First;
   iCodDocumento     := 0;
   bGravaDocum       := true;
   bGravaLancDocum   := true;

   bGravaRateio := bImportaFromTabela;

   // Inicio - Rodolpho da Silva - P:22484 - 02/08/2006
   // Preenche o CdsCCbaixasXDocum
   CdsCCBaixasXDocum.Data := ListaCCBaixasXDocum;

   // Preenche o CdsContab
   CdsContab.Data := ListaCdsContab;

   // Preenche o CdsRateio
   CdsRateio.Data := ListaCdsRateio;
   // Fim - Rodolpho da Silva - P:22484 - 02/08/2006


   //  Início da varredura no Cds
   while not CdsDocumento.Eof do
   begin
      //  Anda a barra de progresso
      DoProgresso([1,                              // Tipo operação 0-Mostra; 1-Anda, 2-Esconde
                   0,                              // Min.Reg. acima
                   CdsDocumento.RecordCount,       // Tot. Reg. acima
                   CdsDocumento.RecNo,             // Reg. atual acima
                   'Validando registro '+ IntToStr(CdsDocumento.RecNo),          // Legenda acima
                   1,                              // Min.Reg. abaixo
                   2,                              // Tot. Reg. abaixo
                   2,                              // Reg. atual abaixo
                   'Gravando registros...',        // Legenda abaixo
                   '',                             // Mensagem do memo
                   '']);                           // Origem do erro


      // Informa às variáveis a identificação do registro
      sIdFornecedorAnt := CdsDocumento.FieldByName('IDFORCLI').AsString;
      sNumDocumentoAnt := CdsDocumento.FieldByName('NODOCUMENTO').AsString;
      sComplDocAnt     := CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString;


      //====================  Validando valores informados nos campos
      // Valida CodPortForma
      if CdsDocumento.FieldByName('CODPORTFORMA').AsInteger = 0 then
      begin
         RetornarErroLog('Contas Caixas x Tipo de pagamento nulas',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if CdsDocumento.FieldByName('CODPORTFORMA').AsString <> RetornaCodPortForma(CdsDocumento.FieldByName('CODPORTFORMA').AsString) then
      begin
         RetornarErroLog('Contas Caixas x Tipo de pagamento inexistente.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


     // Início - Rodolpho da Silva - P: 22484 -  12/09/2006
     // Verificar se o CNPJ/CPF foi informado. Caso seja, entende-se que se
     //deva cadastrar o fornecedor/cliente com os dados informados no registro
     if Trim(CdsDocumento.FieldByName('CPFCNPJ').AsString) <> '' then
     begin
        CdsAux.Data := GetDataPacket('SELECT P.NUMDOCUMENTO, P.IDPESSOA ' +
                                     'FROM PESSOA P ' +
                                     'WHERE ' +
                                     '   (P.NUMDOCUMENTO  = ' + QuotedStr(CdsDocumento.FieldByName('CPFCNPJ').AsString +
                                                                          StringOfChar(' ',18 - Length(CdsDocumento.FieldByName('CPFCNPJ').AsString))) +  ') ');

        // Se o fornecedor/cliente não existir, cria o mesmo
        if CdsAux.IsEmpty then
        begin
           CdsDocumento.Edit;
           // Valida o tipo de cliente/fornecedor para o tamanho da string, conforme
           //especificado pelo ALEX, que <= 11 é um CPF; > 11 é um CNPJ
           if Length(Trim(CdsDocumento.FieldByName('CPFCNPJ').AsString)) <= 11 then
              CdsDocumento.FieldByName('IDFORCLI').AsFloat := CtrlDocumento.ForCli.CriaPessoa(CdsDocumento.FieldByName('NOMEFORCLI').AsString,
                                                                                                  CdsDocumento.FieldByName('RAZAOSOCIAL').AsString,
                                                                                                  CdsDocumento.FieldByName('CPFCNPJ').AsString,
                                                                                                  tpFisica)
           else
              CdsDocumento.FieldByName('IDFORCLI').AsFloat := CtrlDocumento.ForCli.CriaPessoa(CdsDocumento.FieldByName('NOMEFORCLI').AsString,
                                                                                                  CdsDocumento.FieldByName('RAZAOSOCIAL').AsString,
                                                                                                  CdsDocumento.FieldByName('CPFCNPJ').AsString,
                                                                                                  tpJuridica);
           CdsDocumento.Post;

           // Insere na tabela EMPRESAFORN
           if CdsDocumento.FieldByName('RECPAG').AsString = 'P' then
           begin
              if not CtrlDocumento.ForCli.Inserir(CdsDocumento.FieldByName('IDFORCLI').AsInteger,
                                                  CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                  0,
                                                  0,
                                                  0,
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  tfcFornecedor) then
              begin
                 RetornarErroLog(CtrlDocumento.MessageInfo,bImportaFromTabela);
                 Result := false;
                 Exit;
              end;
           end
           else
           begin
              // Insere na tabela EMPRESACLI
              if not CtrlDocumento.ForCli.Inserir(CdsDocumento.FieldByName('IDFORCLI').AsInteger,
                                                  CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                  0,
                                                  0,
                                                  0,
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  tfcCliente) then
              begin
                 RetornarErroLog(CtrlDocumento.MessageInfo,bImportaFromTabela);
                 Result := false;
                 Exit;
              end;
            end;
        end
        else

        // Se existir na tabela PESSOA, verifica se já existe cliente/forncecedor cadastrado
        begin
           // Atribui o id do fornecedor/cliente ao documento
           CdsDocumento.Edit;
           CdsDocumento.FieldByName('IDFORCLI').AsInteger := CdsAux.FieldByName('IDPESSOA').AsInteger;
           CdsDocumento.Post;

           // Se for CAP, valida fornecedor
           if CdsDocumento.FieldByName('RECPAG').AsString = 'P' then
           begin
              if CdsDocumento.FieldByName('IDFORCLI').AsString <> RetornaCodigo('SELECT IDFORCLI FROM EMPRESAFORN WHERE IDFORCLI = ' + CdsDocumento.FieldByName('IDFORCLI').AsString) then
              begin
                 if not CtrlDocumento.ForCli.Inserir(CdsDocumento.FieldByName('IDFORCLI').AsInteger,
                                                     CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                     0,
                                                     0,
                                                     0,
                                                     '',
                                                     '',
                                                     '',
                                                     '',
                                                     tfcFornecedor) then
                 begin
                    RetornarErroLog(CtrlDocumento.MessageInfo,bImportaFromTabela);
                    Result := false;
                    Exit;
                 end;
              end;
           end
           // Se for CAR, valida cliente...
           else
           begin
              if CdsDocumento.FieldByName('IDFORCLI').AsString <> RetornaCodigo('SELECT IDFORCLI FROM EMPRESACLIENTE WHERE IDFORCLI = ' + CdsDocumento.FieldByName('IDFORCLI').AsString) then
              begin
                  if not CtrlDocumento.ForCli.Inserir(CdsDocumento.FieldByName('IDFORCLI').AsInteger,
                                                      CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                      0,
                                                      0,
                                                      0,
                                                      '',
                                                      '',
                                                      '',
                                                      '',
                                                      tfcCliente) then
                  begin
                     RetornarErroLog(CtrlDocumento.MessageInfo,bImportaFromTabela);
                     Result := false;
                     Exit;
                  end;
               end;
           end;
        end;

        //Pendência 22484 - David
        //Não tenta inserir dados da conta-corrente se esta estiver vazia
        if trim( CdsDocumento.FieldByName('CONTACORRENTE').AsString ) <> '' then
        begin
          // Insere a conta corrente para o fornecedor/cliente
          if not InsereContaCorrente(CdsDocumento.FieldByName('IDFORCLI').AsInteger,
                                     CdsDocumento.FieldByName('BANCO').AsInteger,
                                     CdsDocumento.FieldByName('AGENCIA').AsInteger,
                                     CdsDocumento.FieldByName('CONTACORRENTE').AsString) then
          begin
             RetornarErroLog('Erro ao inserir a conta corrente. ' + MessageInfo,bImportaFromTabela);
             Result := false;
             Exit;
          end;
        end;
     end
     else
     // Fim - Rodolpho da Silva - P: 22484 -  12/09/2006


     begin
        // Se for CAP, valida fornecedor
        if CdsDocumento.FieldByName('RECPAG').AsString = 'P' then
        begin
           if CdsDocumento.FieldByName('IDFORCLI').AsInteger = 0 then
           begin
              RetornarErroLog('Fornecedor/Cliente nulo.',bImportaFromTabela);
              Result := false;
              Exit;
           end
           else
           if CdsDocumento.FieldByName('IDFORCLI').AsString <> RetornaCodigo('SELECT IDFORCLI FROM EMPRESAFORN WHERE IDFORCLI = ' + CdsDocumento.FieldByName('IDFORCLI').AsString) then
           begin
              if not CtrlDocumento.ForCli.Inserir(CdsDocumento.FieldByName('IDFORCLI').AsInteger,
                                                  CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                  0,
                                                  0,
                                                  0,
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  tfcFornecedor) then
              begin
                 RetornarErroLog(CtrlDocumento.MessageInfo,bImportaFromTabela);
                 Result := false;
                 Exit;
              end;
           end;
        end
        // Se for CAR, valida cliente...
        else
        begin
           if CdsDocumento.FieldByName('IDFORCLI').AsInteger = 0 then
           begin
              RetornarErroLog('Fornecedor/Cliente nulo.',bImportaFromTabela);
              Result := false;
              Exit;
           end
           else        
           if CdsDocumento.FieldByName('IDFORCLI').AsString <> RetornaCodigo('SELECT IDFORCLI FROM EMPRESACLIENTE WHERE IDFORCLI = ' + CdsDocumento.FieldByName('IDFORCLI').AsString) then
           begin
               if not CtrlDocumento.ForCli.Inserir(CdsDocumento.FieldByName('IDFORCLI').AsInteger,
                                                   CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                   0,
                                                   0,
                                                   0,
                                                   '',
                                                   '',
                                                   '',
                                                   '',
                                                   tfcCliente) then
               begin
                  RetornarErroLog(CtrlDocumento.MessageInfo,bImportaFromTabela);
                  Result := false;
                  Exit;
               end;
            end;
        end;
     end;


      // Início - Rodolpho da Silva - P: 22484 - 27/09/2006
      if bImportaFromTabela then
      begin
         if not (CdsDocumento.FieldByName('RECPAG').AsString[1] in ['R','P']) then
         begin
            RetornarErroLog('Sistema de origem nulo,',bImportaFromTabela);
            Result := false;
            Exit;
         end;
      end
      else
      // Fim - Rodolpho da Silva - P: 22484 - 27/09/2006
      
      begin
         // Valida Sistema origem
         if CdsDocumento.FieldByName('SISTEMAORIGEM').AsInteger = 0 then
         begin
            RetornarErroLog('Sistema de origem nulo',bImportaFromTabela);
            Result := false;
            Exit;
         end
         else
         if not (CdsDocumento.FieldByName('SISTEMAORIGEM').AsString[1] in ['3','4']) then
         begin
            RetornarErroLog('Sistema de origem inexistente.',bImportaFromTabela);
            Result := false;
            Exit;
         end;
      end;

      // Valida Código do tipo do documento
      if CdsDocumento.FieldByName('CODTIPDOC').IsNull then
      begin
         RetornarErroLog('Tipo de documento nulo.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if CdsDocumento.FieldByName('CODTIPDOC').AsString <> RetornaCodigo('SELECT CODTIPDOC FROM TIPODOCRECPAG WHERE CODTIPDOC = ' + CdsDocumento.FieldByName('CODTIPDOC').AsString) then
      begin
         RetornarErroLog('Tipo de documento inexistente.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      // Valida indicação de pagamento
      if CdsDocumento.FieldByName('INDICAPAG').IsNull then
      begin
         RetornarErroLog('Indicação de pagamento nula.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if not (CdsDocumento.FieldByName('INDICAPAG').AsString[1] in ['P','R']) then
      begin
         RetornarErroLog('Indicação de pagamento inexistente.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      // Validando número do documento
      if CdsDocumento.FieldByName('NODOCUMENTO').IsNull then
      begin
         RetornarErroLog('Número do documento nulo.',bImportaFromTabela);
         Result := false;
         Exit;
      end;
      // PS: A validação de documento existente é feita no método GravarDadosCds;



      //  Validando data emissão
      if CdsDocumento.FieldByName('DATAEMISSAO').IsNull then
      begin
         RetornarErroLog('Data emissão nula.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if not ValidaData(CdsDocumento.FieldByName('DATAEMISSAO').AsString) then
      begin
         RetornarErroLog('Data emissão inválida.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      //  Validando data vencimento
      if CdsDocumento.FieldByName('DATAVENCTO').IsNull then
      begin
         RetornarErroLog('Data vencimento nula.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if not ValidaData(CdsDocumento.FieldByName('DATAVENCTO').AsString) then
      begin
         RetornarErroLog('Data vencimento inválida.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if CdsDocumento.FieldByName('DATAVENCTO').AsDateTime < CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime then
      begin
         RetornarErroLog('Data vencimento menor que a data da emissão.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      //  Validando data programada
      if CdsDocumento.FieldByName('DATAPROGRAMADA').IsNull then
      begin
         RetornarErroLog('Data programada nula.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if not ValidaData(CdsDocumento.FieldByName('DATAPROGRAMADA').AsString) then
      begin
         RetornarErroLog('Data programada inválida.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime < CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime then
      begin
         RetornarErroLog('Data programada menor que a data da emissão.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      //Rodolpho da Silva - P: 22484 - 27/09/2006
      if not bImportaFromTabela then
      begin
         // validando operação
         if CdsDocumento.FieldByName('OPERACAO').AsString <> '2' then
         begin
            RetornarErroLog('Operação inválida.',bImportaFromTabela);
            Result := false;
            Exit;
         end;
      end;

      //  Validando data lançamento
      if CdsDocumento.FieldByName('DATALANCTO').IsNull then
      begin
         RetornarErroLog('Data de lançamento nula.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if not ValidaData(CdsDocumento.FieldByName('DATALANCTO').AsString) then
      begin
         RetornarErroLog('Data de lançamento inválida.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      //  Validando valor do documento
      if CdsDocumento.FieldByName('VALOR').IsNull then
      begin
         RetornarErroLog('Valor do documento nulo.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      // Validando operação de lançamento
      if not (CdsDocumento.FieldByName('OPERLANCTO').AsInteger in [1,2,3,4,14]) then
      begin
         RetornarErroLog('Operação de lançamento inválida.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      // Validando código de desembolso
      if CdsDocumento.FieldByName('CODTIPRECDES').IsNull then
      begin
         RetornarErroLog('Código de desembolso nulo.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if Trim(CdsDocumento.FieldByName('CODTIPRECDES').AsString) <> RetornaCodigo('SELECT  RTRIM(CODTIPRECDES) FROM TIPORECEBDESEMB WHERE CODTIPRECDES = ' + Trim(CdsDocumento.FieldByName('CODTIPRECDES').AsString)) then
      begin
         RetornarErroLog('Código de desembolso inexistente.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      // Início - Rodolpho da Silva - P: 22484 - 02/08/2006
      // Validar a quantidade de cotas, se o TipoRecDesemb obrigar a mesma
      CdsAux.Data := GetDataPacket('SELECT NVL(FLGOBRQTDECOTAS,''N'') AS FLGOBRQTDECOTAS ' +
                                   'FROM TIPORECEBDESEMB ' +
                                   'WHERE TRIM(CODTIPRECDES) = ' + QuotedStr(Trim(CdsDocumento.FieldByName('CODTIPRECDES').AsString)));
      if (CdsAux.FieldByName('FLGOBRQTDECOTAS').AsString = 'S') then
      begin
         if (CdsDocumento.FieldByName('FLGOBRQTDECOTAS').AsInteger = 0) then
         begin
            DoProgresso([1,0,CdsDocumento.RecordCount,CdsDocumento.RecNo,'',0,4,2,'','Quantidade de cotas não informada. Documento: ' + CdsDocumento.FieldByName('NODOCUMENTO').AsString + '-' + CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString + '.  Linha: ' + IntToStr(CdsDocumento.RecNo),2]);
            MessageInfo := 'Erro ao validar o documento. Verifique o log de erros';
            Result := false;
            Exit;
         end;
      end; 
      // Fim - Rodolpho da Silva - P: 22484 - 02/08/2006



      //  Validando Indicação de pagamento ou recebimento
      if not (CdsDocumento.FieldByName('INDICARECPAG').AsString[1] in ['P','R']) then
      begin
         RetornarErroLog('Indicação de pagamento inválida.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      // Validando Centro de responsabilidade
      if CdsDocumento.FieldByName('CODCENTRORESPON').IsNull then
      begin
         RetornarErroLog('Centro de Responsabilidade padrão não cadastrado no Global.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if CdsDocumento.FieldByName('CODCENTRORESPON').AsString <> RetornaCodigo('SELECT CODCENTRORESPON FROM CENTRESPON WHERE CODCENTRORESPON = ' + QuotedStr(CdsDocumento.FieldByName('CODCENTRORESPON').AsString)) then
      begin
         RetornarErroLog('Centro de Responsabilidade inexistente.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      // Validando Atividade/Projeto
      if CdsDocumento.FieldByName('UNIDNEGOC').IsNull then
      begin
         RetornarErroLog('Atividade/Projeto padrão do fornecedor/cliente não cadastrado no Global.',bImportaFromTabela);
         Result := false;
         Exit;
      end
      else
      if CdsDocumento.FieldByName('UNIDNEGOC').AsString <> RetornaCodigo('SELECT UNIDNEGOC FROM UNIDNEGOCIO WHERE UNIDNEGOC = ' + CdsDocumento.FieldByName('UNIDNEGOC').AsString) then
      begin
         RetornarErroLog('Atividade/Projeto inexistente.',bImportaFromTabela);
         Result := false;
         Exit;
      end;


      //  Validando valor do rateio
      if CdsDocumento.FieldByName('VLRRATEIO').IsNull then
      begin
         RetornarErroLog('Valor do rateio nulo.',bImportaFromTabela);
         Result := false;
         Exit;
      end;
      //  PS: A rotina de validação do total do rateio, está após o Next do Cds


      // Se for um novo documento, pega o coddocumento da sequence e instancia a variável
      if iCodDocumento = 0 then
      begin
         iCodDocumento := CtrlDocumento.GetSequenceDocumento;
         CdsDocumento.Edit;
         CdsDocumento.FieldByName('CODDOCUMENTO').AsFloat := iCodDocumento;
         CdsDocumento.Post;
      end
      else
      begin
         CdsDocumento.Edit;
         CdsDocumento.FieldByName('CODDOCUMENTO').AsFloat := iCodDocumento;
         CdsDocumento.Post;
      end;


      //  Anda a barra de progresso
      DoProgresso([1,                              // Tipo operação 0-Mostra; 1-Anda, 2-Esconde
                   0,                              // Min.Reg. acima
                   CdsDocumento.RecordCount,       // Tot. Reg. acima
                   CdsDocumento.RecNo,             // Reg. atual acima
                   'Gravando registro ' + IntToStr(CdsDocumento.RecNo),          // Legenda acima
                   1,                              // Min.Reg. abaixo
                   2,                              // Tot. Reg. abaixo
                   2,                              // Reg. atual abaixo
                   'Gravando registros...',        // Legenda abaixo
                   '',                             // Mensagem do memo
                   '']);                           // Origem do erro


      //  Preenche os Cds que serão enviados ao método CtrllancDoccapcar.ProcessaDocumento
      //  Se o registro em foco for o Header do documento, gravar somente nos Cds DOCUMENTO e LANCTODOCUM
      //  A variável bGravaRAteiro deve estar instanciada para false, mas somente se for o Header do documento
      if not CopiaDadosCdsDocumento(bGravaDocum,bGravaLancDocum,bGravaRateio,bImportaFromTabela) then
      begin
         Result := false;
         Exit;
      end;



      // Vai para o próximo registro
      CdsDocumento.Next;



      //  Se o documento em foco for diferente do documento anterior, é validado o total do rateio
      //com o total do valor de lançamento
      if not ((CdsDocumento.FieldByName('IDFORCLI').AsString       = sIdFornecedorAnt) and
              (CdsDocumento.FieldByName('NODOCUMENTO').AsString    = sNumDocumentoAnt) and
              (CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString = sComplDocAnt)) then
      begin
         // Volta ao documento anterior, para pegar os parâmetros
         CdsDocumento.Prior;



         // Limpa o ponteiro
         PlaConta.iPlano           := 0;
         PlaConta.sPlaconta        := '';
         PlaConta.sPlacontaPass    := '';
         PlaConta.iSubConta        := 0;
         PlaConta.iSubContaPass    := 0;
         PlaConta.iIdSegregaCriter := -1;
         PlaConta.scodCentroCusto  := '';
         
         // Chama o método de contabilização
         if not CtrlLancDocCapCar.DeterminaContabilizacao((CdsDocumento.FieldByName('FLGCONTABILIZA').AsString = 'S'),
                                                          PlaConta,CdsDocumento,
                                                          CdsCCBaixasXDocum,CdsContab,
                                                          _CdsRateioDocum.Data,
                                                          CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                          CdsDocumento.FieldByname('PLANOCONTA').AsInteger,
                                                          False,
                                                          opldEfetivo,
                                                          '',
                                                          CdsDocumento.FieldByName('RECPAG').AsString[1]) then
         begin
            Result      := False;
            RetornarErroLog( CtrlLancDocCapCar.MessageInfo, bImportaFromTabela );
            MessageInfo := CtrlLancDocCapCar.MessageInfo;
            Exit;
         end
         else
         begin
            // Rodolpho da Silva - P: 24396 - 05/02/2007
            // Passa os parâmetros para o documento
            // Se não for múltiplas contas de baixas, pegar os
            //dados contábeis do objeto
            if CdsCCBaixasXDocum.IsEmpty then
            begin
               _CdsDocumento.Edit;
               _CdsDocumento.FieldByName('PLANO').asInteger           := PlaConta.iPlano;
               _CdsDocumento.FieldByName('PLACONTA').asString         := PlaConta.sPlacontaPass;
               _CdsDocumento.FieldByName('CODCENTROCUSTO').AsString   := PlaConta.scodCentroCusto;
               _CdsDocumento.FieldByName('IDSEGREGACRITER').asInteger := PlaConta.iIdSegregaCriter;
               _CdsDocumento.Post;
            end;
         end;


         // Insere o documento
         if not CtrlLancDocCapCar.ProcessaDocumento(CdsDocumento.FieldByName('IDUSUARIO').AsInteger,
                                                    CdsDocumento.FieldByName('IDESPACESSO').AsInteger,
                                                    CdsDocumento.FieldByName('UNIDNEGOC').AsInteger,
                                                   (CdsDocumento.FieldByName('FLGCONTABILIZA').AsString = 'S'),
                                                    CdsDocumento.FieldByName('USAPLANOPATRO').AsBoolean,
                                                    False,False,False,False,False,
                                                    _CdsDocumento.Data,_CdsAlteradores.Data,_CdsRateioDocum.Data,
                                                    CdsContab.Data,null,null,
                                                    CdsCCBaixasXDocum.Data,
                                                    opInserir,
                                                    opldEfetivo,
                                                    false,
                                                    0) then

         begin
            Result      := false;
            RetornarErroLog( CtrlLancDocCapCar.MessageInfo, bImportaFromTabela );
            MessageInfo := CtrlLancDocCapCar.MessageInfo;
            Exit;
         end
         else
         begin
            // Marca o documento no status de "importado"
            if not ExecSQL('UPDATE DOCUMENTO SET FLGIMPORTADO = ''S'' WHERE CODDOCUMENTO = ' + CdsDocumento.FieldByName('CODDOCUMENTO').AsString) then
            begin
               RetornarErroLog('Erro ao atualizar a tabela documento. ' + MessageInfo,bImportaFromTabela);
               Result := False;
               Exit;
            end
            else
            begin
               if bImportaFromTabela then
               begin
                  if not ExecSQL(' UPDATE IMPORTACAPCAR ' +
                                 ' SET  DATAIMPORTA  = TRUNC(SYSDATE), ' +
                                 '      STATUSCM     = 1,' +
                                 '      CODDOCUMENTO = ' + CdsDocumento.FieldByName('CODDOCUMENTO').AsString + ', ' +
                                 '      NUMLOTE      = ' + CdsDocumento.FieldByName('NUMLOTE').AsString      + ', ' +
                                 '      NUMAPGR      = ' + _CdsDocumento.FieldByName('NUMAPGR').AsString      +
                                 ' WHERE ' +
                                 '    (NODOCUMENTO    = ' + QuotedStr(CdsDocumento.FieldByName('NODOCUMENTO').AsString)   + ' ) AND ' +
                                 '    (COMPLDOCUMENTO = ' + QuotedStr(CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString) + ' ) ') then

                  begin
                     RetornarErroLog('Erro ao atualizar o registro na tabela IMPORTACAPCAR: ' + MessageInfo,bImportaFromTabela);
                     Result := False;
                     Exit;
                  end;
               end;
            end;

            _CdsDocumento.EmptyDataSet;
            _CdsRateioDocum.EmptyDataSet;
            CdsDocumento.Next;
         end;   


         iCodDocumento   := 0;
         bGravaDocum     := true;
         bGravaLancDocum := true;
         bGravaRateio    := bImportaFromTabela;
      end

      else
      if CdsDocumento.Eof then
      begin
         // Limpa o ponteiro
         PlaConta.iPlano           := 0;
         PlaConta.sPlaconta        := '';
         PlaConta.sPlacontaPass    := '';
         PlaConta.iSubConta        := 0;
         PlaConta.iSubContaPass    := 0;
         PlaConta.iIdSegregaCriter := -1;
         PlaConta.scodCentroCusto  := '';

         // Chama o método de contabilização
         if not CtrlLancDocCapCar.DeterminaContabilizacao((CdsDocumento.FieldByName('FLGCONTABILIZA').AsString = 'S'),
                                                          PlaConta,CdsDocumento,
                                                          CdsCCBaixasXDocum,CdsContab,
                                                          _CdsRateioDocum.Data,
                                                          CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                          CdsDocumento.FieldByname('PLANOCONTA').AsInteger,
                                                          False,
                                                          opldEfetivo,
                                                          '',
                                                          CdsDocumento.FieldByName('RECPAG').AsString[1]) then
         begin
            Result      := False;
            RetornarErroLog( CtrlLancDocCapCar.MessageInfo, bImportaFromTabela );
            MessageInfo := CtrlLancDocCapCar.MessageInfo;
            Exit;
         end
         else
         begin
            // Rodolpho da Silva - P: 24396 - 05/02/2007
            // Passa os parâmetros para o documento
            // Se não for múltiplas contas de baixas, pegar os
            //dados contábeis do objeto
            if CdsCCBaixasXDocum.IsEmpty then
            begin
               _CdsDocumento.Edit;
               _CdsDocumento.FieldByName('PLANO').asInteger           := PlaConta.iPlano;
               _CdsDocumento.FieldByName('PLACONTA').asString         := PlaConta.sPlacontaPass;
               _CdsDocumento.FieldByName('CODCENTROCUSTO').AsString   := PlaConta.scodCentroCusto;
               _CdsDocumento.FieldByName('IDSEGREGACRITER').asInteger := PlaConta.iIdSegregaCriter;
               _CdsDocumento.Post;
            end;
         end;



         if not CtrlLancDocCapCar.ProcessaDocumento(CdsDocumento.FieldByName('IDUSUARIO').AsInteger,
                                                    CdsDocumento.FieldByName('IDESPACESSO').AsInteger,
                                                    CdsDocumento.FieldByName('UNIDNEGOC').AsInteger,
                                                   (CdsDocumento.FieldByName('FLGCONTABILIZA').AsString = 'S'),
                                                    CdsDocumento.FieldByName('USAPLANOPATRO').AsBoolean,
                                                    False,False,False,False,False,
                                                    _CdsDocumento.Data,_CdsAlteradores.Data,_CdsRateioDocum.Data,
                                                    CdsContab.Data,null,null,
                                                    CdsCCBaixasXDocum.Data,
                                                    opInserir,
                                                    opldEfetivo,
                                                    false,
                                                    0) then

         begin
            Result      := false;
            RetornarErroLog( CtrlLancDocCapCar.MessageInfo, bImportaFromTabela );
            MessageInfo := CtrlLancDocCapCar.MessageInfo;
            Exit;
         end
         else
         begin
            // Marca o documento no status de "importado"
            if not ExecSQL('UPDATE DOCUMENTO SET FLGIMPORTADO = ''S'' WHERE CODDOCUMENTO = ' + CdsDocumento.FieldByName('CODDOCUMENTO').AsString) then
            begin
               RetornarErroLog('Erro ao atualizar a tabela documento. ' + MessageInfo,bImportaFromTabela);
               Result := False;
               Exit;
            end
            else
            begin
               if bImportaFromTabela then
               begin
                  if not ExecSQL(' UPDATE IMPORTACAPCAR ' +
                                 ' SET  DATAIMPORTA  = TRUNC(SYSDATE), ' +
                                 '      STATUSCM     = 1,' +
                                 '      CODDOCUMENTO = ' + CdsDocumento.FieldByName('CODDOCUMENTO').AsString + ', ' +
                                 '      NUMLOTE      = ' + CdsDocumento.FieldByName('NUMLOTE').AsString      + ', ' +
                                 '      NUMAPGR      = ' + _CdsDocumento.FieldByName('NUMAPGR').AsString      +
                                 ' WHERE ' +
                                 '    (NODOCUMENTO    = ' + QuotedStr(CdsDocumento.FieldByName('NODOCUMENTO').AsString)   + ' ) AND ' +
                                 '    (COMPLDOCUMENTO = ' + QuotedStr(CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString) + ' ) ') then

                  begin
                     RetornarErroLog('Erro ao atualizar o registro na tabela IMPORTACAPCAR: ' + MessageInfo,bImportaFromTabela);
                     Result := False;
                     Exit;
                  end;
               end;
            end;

            _CdsDocumento.EmptyDataSet;
            _CdsRateioDocum.EmptyDataSet;
         end;
      end


      //   Se o documento for o mesmo que o anterior, entende-se que este seja uma parte do rateio,
      //logo, na passada seguinte só é gravado o rateio
      else
      begin
         bGravaDocum     := False;
         bGravaLancDocum := False;
         bGravaRateio    := True;
      end;


   end;
   //  Fim da varredura no Cds

end;




function TCtrlImportaLancamento.RetornaCodPortForma(
  sCodigo: string): string;
begin
   CdsAux.data := GetDataPacket('SELECT CODPORTFORMA FROM PORTADORFORMA WHERE CODPORTFORMA = ' + sCodigo);
   Result      := cdsAux.FieldByName('CODPORTFORMA').AsString;
end;




function TCtrlImportaLancamento.RetornaCodCentRespon(sIdPessoa: string): string;
begin
   CdsAux.Data := GetDataPacket('SELECT CODCENTRORESPON FROM PARAMGLOBAL WHERE IDPESSOA = ' + sIdPessoa);
   Result      := CdsAux.FieldByName('CODCENTRORESPON').AsString;
end;




function TCtrlImportaLancamento.RetornaCodigo(sSQL: string): string;
begin
   CdsAux.Data := GetDataPacket(sSQL);
   Result      := CdsAux.Fields[0].AsString;
end;




function TCtrlImportaLancamento.ValidaData(sData: string): boolean;
begin
   try
     Result := true;
     StrToDate(sData);

   except
      on EConvertError do
      Result := false;
   end;
end;




function TCtrlImportaLancamento.CopiaDadosCdsDocumento(bGravaDocumento,
                                bGravaLancDocum,bGravaRateio,bImportaFromTabela: boolean): boolean;
var
  iNumApGR : integer;
  rValorLancDocum: Double;
 
begin
   Result := False;

   if bImportaFromTabela then
      iNumApGR := CtrlDocumento.GetNumApGr
   else
      iNumApGR := 0;

   // Tabela documento
   if bGravaDocumento then
   begin
      // Preenche o Cds
      _CdsDocumento.Append;
      _CdsDocumento.FieldByName('RECPAG').AsString             := CdsDocumento.FieldByName('RECPAG').AsString;
      _CdsDocumento.FieldByName('IDPESSOA').AsInteger          := CdsDocumento.FieldByName('IDPESSOA').AsInteger;
      _CdsDocumento.FieldByName('IDMODULO').AsInteger          := CdsDocumento.FieldByName('IDMODULO').AsInteger;
      _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger      := CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;
      _CdsDocumento.FieldByName('NODOCUMENTO').AsString        := CdsDocumento.FieldByName('NODOCUMENTO').AsString;
      _CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString     := CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString;
      _CdsDocumento.FieldByName('PLACONTA').AsString           := CdsDocumento.FieldByName('PLACONTA').AsString;
      _CdsDocumento.FieldByName('CODCENTROCUSTO').AsString     := CdsDocumento.FieldByName('CODCENTROCUSTO').AsString;
      _CdsDocumento.FieldByName('DATAVENCTO').AsDateTime       := CdsDocumento.FieldByName('DATAVENCTO').AsDateTime;
      _CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime      := CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime;
      _CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime   := CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime;
      _CdsDocumento.FieldByName('CODTIPDOC').AsInteger         := CdsDocumento.FieldByName('CODTIPDOC').AsInteger;
      _CdsDocumento.FieldByName('IDFORCLI').AsInteger          := CdsDocumento.FieldByName('IDFORCLI').AsInteger;
      _CdsDocumento.FieldByName('UNIDNEGOC').AsInteger         := CdsDocumento.FieldByName('UNIDNEGOC').AsInteger;
      _CdsDocumento.FieldByName('PLANO').AsString              := CdsDocumento.FieldByName('PLANO').AsString;
      _CdsDocumento.FieldByName('NUMAPGR').AsInteger           := iNumApGR;
      _CdsDocumento.FieldByName('CODPORTFORMA').AsString       := CdsDocumento.FieldByName('CODPORTFORMA').AsString;
      _CdsDocumento.FieldByName('IDESPACESSO').AsInteger       := CdsDocumento.FieldByName('IDESPACESSO').AsInteger;
      _CdsDocumento.FieldByName('IDUSUARIO').AsInteger         := CdsDocumento.FieldByName('IDUSUARIO').AsInteger;
      _CdsDocumento.FieldByName('OPERLANCTO').AsInteger        := CdsDocumento.FieldByName('OPERLANCTO').AsInteger;
      _CdsDocumento.FieldByName('IDFORCLI').AsInteger          := CdsDocumento.FieldByName('IDFORCLI').AsInteger;
      _CdsDocumento.FieldByName('CONTACREDITO').AsString       := CdsDocumento.FieldByName('CONTACREDITO').AsString;
      _CdsDocumento.FieldByName('IDUSUARIOINCLUSAO').AsInteger := CdsDocumento.FieldByName('IDUSUARIO').AsInteger;
      _CdsDocumento.Post;
   end;


   // Tabela LancToDocum
   if bGravaLancDocum then
   begin
      _CdsDocumento.Edit;
      _CdsDocumento.FieldByName('DATALANCTO').AsDateTime   := CdsDocumento.FieldByName('DATALANCTO').AsDateTime;
      _CdsDocumento.FieldByName('NUMLANCTO').AsString      := CdsDocumento.FieldByName('NUMLANCTO').AsString;
      _CdsDocumento.FieldByName('VALOR').AsFloat           := CdsDocumento.FieldByName('VALOR').AsFloat;
      _CdsDocumento.FieldByName('HISTORICOCOMPL').AsString := CdsDocumento.FieldByName('HISTORICOCOMPL').AsString;
      _CdsDocumento.Post;
   end;


   //  Tabela RateioDocum
   if bGravaRateio then
   begin
      _CdsRateioDocum.Append;
      _CdsRateioDocum.FieldByName('VALOR').AsFloat            := CdsDocumento.FieldByName('VLRRATEIO').AsFloat;
      _CdsRateioDocum.FieldByName('UNIDNEGOC').AsInteger      := CdsDocumento.FieldByName('UNIDNEGOC').AsInteger;
      _CdsRateioDocum.FieldByName('IDPLANOPREV').AsInteger    := CdsDocumento.FieldByName('IDPLANOPREV').AsInteger;
      _CdsRateioDocum.FieldByName('IDPATRO').AsInteger        := CdsDocumento.FieldByName('IDPATRO').AsInteger;
      _CdsRateioDocum.FieldByName('IDPROGRAMA').AsInteger     := CdsDocumento.FieldByName('IDPROGRAMA').AsInteger;
      _CdsRateioDocum.FieldByName('CODTIPRECDES').AsString    := CdsDocumento.FieldByName('CODTIPRECDES').AsString;
      _CdsRateioDocum.FieldByName('CODCENTRORESPON').AsString := CdsDocumento.FieldByName('CODCENTRORESPON').AsString;
      _CdsRateioDocum.FieldByName('CODCENTROCUSTO').AsString  := CdsDocumento.FieldByName('CODCENTROCUSTO').AsString;
      _CdsRateioDocum.FieldByName('PLANO').AsString           := CdsDocumento.FieldByName('PLANOCONTA').AsString;
      _CdsRateioDocum.FieldByName('PLACONTA').AsString        := CdsDocumento.FieldByName('PLACONTA').AsString;
      _CdsRateioDocum.FieldByName('IDPESSOA').AsString        := CdsDocumento.FieldByName('IDPESSOA').AsString;
      _CdsRateioDocum.Post;
   end;
   Result := True;
end;

function TCtrlImportaLancamento.ListaPlano: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '  IDPLANOPREV, ' +
                           '  NOME, ' +
                           '  ''N'' AS MARCA ' +
                           'FROM ' +
                           '  PLANPREVCONTABIL ' +
                           'ORDER BY ' +
                           '  NOME ');
end;







function TCtrlImportaLancamento.ListaCCBaixasXDocum: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '  ''                         '' AS PATROCINADORA, ' +
                           '  ''                         '' AS PLANPREVCONTABIL, ' +
                           '  ''                         '' AS SEGREGACRITER, ' +
                           '  ''                         '' AS PLACONTA, ' +
                           '  0 AS VALOR, ' +
                           '  0 AS IDPATRO, 0 AS IDPLANOPREV, 0 AS IDSEGREGACRITER, ' +
                           '  0 AS PLANO, 0 AS UNIDNEGOC, 0 AS IDPESSOA ' +
                           'FROM ' +
                           '  DUAL ' +
                           'WHERE ' +
                           '  (1 = 2) ');
end;




function TCtrlImportaLancamento.ListaCdsContab: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   ''                                       '' AS PLACONTA, ' +
                           '   0 AS CODSUBCONTA, ' +
                           '   ''    '' AS LACDEBCRE, ' +
                           '   0 AS LACVALOR, ' +
                           '   ''                                                                                                                                   '' AS LACVALHIST, ' +
                           '   ''                                                                                                                                   '' AS LACHIST1, ' +
                           '   ''                                                                                                                                   '' AS LACHIST2, ' +
                           '   ''                                                                                                                                   '' AS LACHIST3, ' +
                           '   ''                                                                                                                                   '' AS LACHIST4, ' +
                           '   ''                                                                                                                                   '' AS LACHIST5, ' +
                           '   0 AS PLNCODIGO, ' +
                           '   0 AS LACNUMLAN, ' +
                           '   ''                                         '' AS HITCODHIST, ' +
                           '   0 AS IDPESSOA, ' +
                           '   0 AS IDPESSOA, ' +
                           '   0 AS IDMODULO, ' +
                           '   0 AS UNIDNEGOC, ' +
                           '   0 AS IDUSUARIOINCLUSAO, ' +
                           '   0 AS PLANO, ' +
                           '   ''                                       '' AS LACTIPO, ' +
                           '   0 AS LACNUMDOC, ' +
                           '   ''    '' AS LACTIPCONVOFICIAL, ' +
                           '   0 AS LACVALOFICIAL, ' +
                           '   ''                                 '' AS LACTIPCONVGER, ' +
                           '   0 AS LACVALGERENCIAL, ' +
                           '   ''                              '' AS LACTIPCONVGEREN1, ' +
                           '   0 AS LACVALGEREN1, ' +
                           '   ''                              '' AS LACTIPCONVGEREN2, ' +
                           '   0 AS LACVALGEREN2, ' +
                           '   ''                                 '' AS LACATOUTMOEDA, ' +
                           '   ''                                '' AS LACORIGEMAPLIC, ' +
                           '   ''    '' AS TIPCODIGO, ' +
                           '   0 AS IDELEMDEMONSTRAT, ' +
                           '   ''                                '' AS CODCENTROCUSTO, ' +
                           '   ''                                    '' AS CODEXTERNO, ' +
                           '   ''                                          '' AS NOME, ' +
                           '   ''                                '' AS NOME_1, ' +
                           '   ''                             '' as CODCENTROCUSTO_CC, ' +
                           '   ''                                       '' AS PLANOME, ' +
                           '   0 AS IDPLANOPREV, ' +
                           '   0 AS IDPATRO, ' +
                           '   ''                                     '' AS NOMEPATRO, ' +
                           '   ''                                     '' AS DESCPLANO, ' +
                           '   0 AS IDSEGREGACRITER, ' +
                           '   ''                                 '' AS SEGREGACRITER, ' +
                           '   ''                                 ''  As CODDOCUMENTO, ' +
                           '   ''   '' AS COMPLDOCUMENTO, ' +
                           '   ''                                                           '' AS RAZAOSOCIAL, ' +
                           '   ''                           '' AS DSCLANCAMENTO, ' +
                           '   ''01.01.1899'' AS DATAVENCIMENTO, ' +

                           '   ''                                                           '' AS HISTORICOCOMPL, ' +
                           '   ''                                                           '' AS TIPODOCUMENTO, ' +
                           '   ''01.01.1899'' AS PLNDATDIA ' +
                           'FROM ' +
                           '   DUAL  ' +
                           'WHERE ' +
                           '  (1=2) ');
end;




function TCtrlImportaLancamento.ListaCdsRateio: Olevariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   0 AS CODDOCUMENTO, ' +
                           '   0 AS CODTIPRECDES, ' +
                           '   '' '' AS RECPAG, ' +
                           '   0 AS IDPESSOA, ' +
                           '   0 AS IDRESERVAORCAMEN, ' +
                           '   ''                       '' AS CODCENTRORESPON, ' +
                           '   ''                       '' AS CODEXTERNOCR, ' +
                           '   0 AS UNIDNEGOC, ' +
                           '   ''                       '' AS MOECODIGO, ' +
                           '   0.00 AS VALOR, ' +
                           '   0.00 AS VALOROUTRAMOEDA, ' +
                           '   ''                                            ''AS PLACONTACREDITO, ' +
                           '   0 AS IDUSUARIOINCLUSAO, ' +
                           '   ''                              '' AS NOME, ' +
                           '   ''                              '' AS NOME, ' +
                           '   ''                              '' AS CODCENTROCUSTO, ' +
                           '   ''                              '' AS CODEXTERNOCC, ' +
                           '   0 AS IDRATEIODOCUM, ' +
                           '   ''                                                      '' AS DESCRICAO, ' +
                           '   ''                              '' AS MOESIGLA, ' +
                           '   ''                              '' AS NOMECENTROCUSTO, ' +
                           '   0 AS PLANO, ' +
                           '   0 AS IDPATRO, ' +
                           '   0 AS IDPROGRAMA, ' +
                           '   ''  '' AS FLGTIPOPROGRAMA, ' +
                           '   0 AS NUMIMOVEL, ' +
                           '   ''                                        '' AS NOMEPATRO, ' +
                           '   ''                                        '' AS DESCPLANO, ' +
                           '   ''                                        '' AS DESCPROGRAMA, ' +
                           '   ''                                        '' AS HITCODHIST, ' +
                           '   0 AS IDPLANOPREV, ' +
                           '   0 AS NUMRESERVA, ' +
                           '   ''  '' AS FLGOBRIGARESERVA, ' +
                           '   0 AS NUMRESERVAOLD, ' +
                           '   0.00 AS VALORRESERVAOLD, ' +
                           '   0.00 AS VLRRESORCAMEN, ' +
                           '   -1 AS IDSEGREGACRITER, ' +
                           '   ''                                                            '' AS DESCSEGREGACRITER, ' +
                           '   0 AS CODSUBCONTA, 0 AS CODSUBCONTAPASS, ' +
                           '   ''                  '' AS PLACONTA, ' +
                           '   ''                  '' AS PLACONTAPASS, ' +
                           '   ''                                        '' AS NOMECONTA, ' +
                           '   ''                                        '' AS NOMECONTAPASS ' +
                           'FROM ' +
                           '   DUAL ' +
                           'WHERE ' +
                           '  (1 = 2) ');
end;















function TCtrlImportaLancamento.InsereContaCorrente(iIdFornCli,
                    iNumBanco,iNumAgencia: integer; sContaCorrente: string): Boolean;
var
   sSQL: string;
   iIdBanco,iIdAgencia: integer;

begin
   try
      Result     := True;
      iIdBanco   := 0;
      iIdAgencia := 0;

      StartTransaction;

      // Pega o id do banco
      CdsAux.Data := GetDataPacket('SELECT IDPESSOA FROM BANCO WHERE NUMBANCO = ' + IntToStr(iNumBanco));
      if not CdsAux.IsEmpty then
         iIdBanco := CdsAux.Fields[0].AsInteger
      else
         raise Exception.Create('Banco não cadastrado');

      // Pega o id da Agência
      CdsAux.Data := GetDataPacket('SELECT IDPESSOA, NUMAGENCIA ' +
                                   'FROM AGENCIABANCARIA ' +
                                   'WHERE IDBANCO = ' + IntToStr(iIdBanco) + ' AND NUMAGENCIA = ' + IntToStr(iNumAgencia));
      if not CdsAux.IsEmpty then
         iIdAgencia := CdsAux.Fields[0].AsInteger
      else
         raise Exception.Create('Agência não cadastrada');

      if Trim(sContaCorrente) = '' then
         raise Exception.Create('Conta corrente não informada');

      CdsAux.Data := GetDataPacket('SELECT IDCBANCARIA ' +
                                   'FROM CONTABANCARIA ' +
                                   'WHERE (IDPESSOA      = ' + IntToStr(iIdFornCli)            + ') AND ' +
                                   '      (CONTACORRENTE = ' + QuotedStr(Trim(sContaCorrente)) + ')');
      if CdsAux.IsEmpty then
      begin
         sSQL := 'INSERT INTO CONTABANCARIA ' +
                 '    (IDCBANCARIA,CONTACORRENTE,IDAGENCIA, ' +
                 '     FLGCONTAPREF,IDPESSOA,TIPOCONTA,FLGCONTACONJUNTA) ' +
                 'VALUES ' +
                 '    (' + IntToStr(GetSequence('CONTABANCARIA')) + ',' + QuotedStr(sContaCorrente) + ',' + IntToStr(iIdAgencia) + ',' +
                 '     1,' + IntToStr(iIdFornCli) + ',1,''N'') ';

         Result := ExecSQL(sSQL);
         if not Result then
            raise Exception.Create(MessageInfo);
      end;

      Commit;

   except
      on E:Exception do
      begin
         Rollback;
         MessageInfo := e.Message;
         Result := false;
      end;
   end;
end;




function TCtrlImportaLancamento.ListaDocFromTabela(sRecPag : string; dDataIni,
  dDataFim: TDateTime; sFiltroData: string): OleVariant;

var
   sSQL: string;
begin
     sSQL := 'SELECT ' +
           '   DECODE(PT.NOME,'''',''Inexistente'',PT.NOME) AS NOMEPATRO, ' +
           '   DECODE(PL.NOME,'''',''Inexistente'',PL.NOME) AS NOMEPLANO, ' +
           '   DECODE(CC.CODEXTERNO,'''',''Inexistente'',TRIM(CC.CODEXTERNO)||'' - '' || CC.NOME) AS NOMECC, ' +
           '   DECODE(CR.CODEXTERNO,'''',''Inexistente'',TRIM(CR.CODEXTERNO)||'' - '' || CC.NOME) AS NOMECR, ' +
           '   DECODE(ATV.NOME,'''',''Inexistente'',ATV.NOME) AS NOMEATV, ' +
           '   DECODE(TD.DESCRICAO,'''',''Inexistente'',TD.DESCRICAO) AS NOMETD, ' +
           '   DECODE(TRD.DESCRICAO,'''',''Inexistente'',TRIM(TRD.CODTIPRECDES) || '' - '' || TRD.DESCRICAO) AS NOMETRD, ' +
           '   DECODE(P.DESCPROGRAMA,'''',''Inexistente'',P.DESCPROGRAMA) AS NOMEPROGRAMA, ' +
           '   I.CODPORTFORMA, I.IDFORCLI, ' +
           '   I.NODOCUMENTO, I.COMPLDOCUMENTO, I.DATAEMISSAO, ' +
           '   I.DATAVENCTO, I.DATAPROGRAMADA, I.IDEMPRESAPROP, ' +
           '   I.CODCENTRORESPON, I.UNIDNEGOC, I.VLRRATEIO, ' +
           '   I.FLGCONTABILIZA, I.CODTIPDOC, I.CODCENTROCUSTO, ' +
           '   I.HISTORICOCOMPL, I.IDPLANOPREV, I.IDPATRO, ' +
           '   I.IDPROGRAMA, I.IDSEGREGACRITER, I.CPFCNPJ, ' +
           '   I.NOMEFORCLI, I.RSFORCLI, I.CODBANCO, ' +
           '   I.CODAGENCIA, I.CODCONTACORR, I.QTDECOTAS, ' +
           '   I.CODDOCUMENTO, I.NUMAPGR, I.CODUSUARIO, ' +
           '   I.DATAVALIDACAO, I.DATACARGA, I.REFCLIENTE, ' +
           '   I.CODTIPDOC, I.RECPAG, I.CODALTERADOR, ' +
           '   I.DATALANCTO, I.VALOR, I.OPERACAO, ' +
           '   I.CODTIPRECDES, I.CODFORCLI, I.NUMLOTE, ' +
           '   I.DATAIMPORTA, I.STATUSCM, I.CODEXTERNO, ' +
           '   I.STATUSEXTERNO ' +
           'FROM ' +
           '  IMPORTACAPCAR I, ' +
           '  PESSOA PT, ' +
           '  PLANPREVCONTABIL PL, ' +
           '  UNIDNEGOCIO ATV, ' +
           '  CENTCUST CC, ' +
           '  CENTRESPON CR, ' +
           '  TIPODOCRECPAG TD, ' +
           '  TIPORECEBDESEMB TRD, ' +
           '  PROGRAMA P ' +

           'WHERE ' +
           '    (I.IDPATRO         = PT.IDPESSOA(+)) AND ' +
           '    (I.IDPLANOPREV     = PL.IDPLANOPREV(+)) AND ' +
           '    (I.UNIDNEGOC       = ATV.UNIDNEGOC(+)) AND ' +
           '    (I.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND ' +
           '    (I.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND ' +
           '    (I.CODTIPDOC       = TD.CODTIPDOC(+)) AND ' +
           '    (I.RECPAG          = TD.RECPAG(+)) AND ' +
           '    (I.CODTIPRECDES    = TRD.CODTIPRECDES(+)) AND ' +
           '    (I.RECPAG          = TRD.RECPAG(+)) AND ' +
           '    (I.IDPROGRAMA      = P.IDPROGRAMA(+)) AND ' +

           //Marcus Oliveira P. 26534 16/10/2007
           '    (I.DATAVALIDACAO IS NOT NULL) AND ' +

           //Pendência 22484 - David
           //Permite apenas importação de documentos no sistema devido
           '   ( I.RECPAG = ' + QuotedStr( UpperCase( trim( sRecPag ) ) ) + ' ) AND ' +

           '   ((I.STATUSCM IS NULL) OR (I.STATUSCM = 2)) ';

           if (Trim(sFiltroData) <> '') then
              sSQL := sSQL + ' AND (TRUNC(I.' + sFiltroData +  ') BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ',''DD/MM/YYYY'') )';

           sSQL := sSQL + ' ORDER BY  I.NODOCUMENTO, I.COMPLDOCUMENTO ';

  Result := GetDataPacket(sSQL);
end;




procedure TCtrlImportaLancamento.DoChangeDataBase;
begin
  inherited;
  DbLoteExportaCtb.DataBaseName := DataBaseName;
end;








function TCtrlImportaLancamento.PreencheCdsRateioDocum: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '   IDRATEIODOCUM, IDPROCESSO, IDPLANOPREV, ' +
                           '   IDPATRO, PLANO, IDPROGRAMA, ' +
                           '   IDEMPRESA, CODCENTROCUSTO, IDPESSOA, ' +
                           '   CODCENTRORESPON, UNIDNEGOC, CODTIPRECDES, ' +
                           '   RECPAG, CODDOCUMENTO, MOECODIGO,IDUSUARIOINCLUSAO, ' +
                           '   VALOR, VALOROUTRAMOEDA, IDRESERVAORCAMEN, ' +
                           '   LOTETRANSMISSAO, NUMIMOVEL, VLRRESORCAMEN, ' +
                           '   ''                                        '' AS NOMEPATRO, ' +
                           '   ''                                        '' AS DESCPLANO, ' +
                           '   ''                                        '' AS DESCPROGRAMA, ' +
                           '   ''                                        '' AS DESCSEGREGACRITER, ' +
                           '   ''                       '' AS CODEXTERNOCR, ' +
                           '   ''                                            ''AS PLACONTACREDITO, ' +
                           '   ''                              '' AS NOME, ' +
                           '   ''                              '' AS NOMECENTROCUSTO, ' +
                           '   ''                              '' AS CODEXTERNOCC, ' +
                           '   ''                                                      '' AS DESCRICAO, ' +
                           '   ''                              '' AS MOESIGLA, ' +
                           '   ''  '' AS FLGTIPOPROGRAMA, ' +
                           '   ''                                        '' AS HITCODHIST, ' +
                           '   0 AS NUMRESERVA, ' +
                           '   ''  '' AS FLGOBRIGARESERVA, ' +
                           '   0 AS NUMRESERVAOLD, ' +
                           '   0.00 AS VALORRESERVAOLD, ' +
                           '   0 AS IDSEGREGACRITER, ' +
                           '   0 AS CODSUBCONTA, 0 AS CODSUBCONTAPASS, ' +
                           '   ''                  '' AS PLACONTA, ' +
                           '   ''                  '' AS PLACONTAPASS, ' +
                           '   ''                                        '' AS NOMECONTA, ' +
                           '   ''                                        '' AS NOMECONTAPASS, ' +
                           '   IDSEGREGACONTR,IDPLANOVIRTUAL ' +
                           'FROM ' +
                           '   RATEIODOCUM ' +
                           'WHERE ' +
                           '   1 = 2   ');
end;







procedure TCtrlImportaLancamento.RetornarErroLog(sDescErro: string;
  bImportaFromTabela: boolean);
var
  sSQL: string;

begin
   try
      if bImportaFromTabela then
      begin
         StartTransaction;
         // Marco o documento como status de "2 - Registro Invalido"
         sSQL := 'UPDATE IMPORTACAPCAR ' +
                 'SET  STATUSCM = 2' +
                 'WHERE ' +
                 '   (NODOCUMENTO    = ' + QuotedStr(CdsDocumento.FieldByName('NODOCUMENTO').AsString)   + ' ) AND ' +
                 '   (COMPLDOCUMENTO = ' + QuotedStr(CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString) + ' ) ';
         if not ExecSQL(sSQL) then
            raise Exception.Create(MessageInfo);

         Commit;   
      end;

      DoProgresso([1,0,CdsDocumento.RecordCount,CdsDocumento.RecNo,'',0,4,2,'',' ' + sDescErro + '  Documento: ' + CdsDocumento.FieldByName('NODOCUMENTO').AsString + '-' + CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString + '.  Linha: ' + IntToStr(CdsDocumento.RecNo),1]);
      MessageInfo := ' Erro ao validar o documento. Verifique o log de erros';



   except
      on E:Exception do
      begin
         DoProgresso([1,0,CdsDocumento.RecordCount,CdsDocumento.RecNo,'',0,4,2,'',' ' + sDescErro + '  Documento: ' + CdsDocumento.FieldByName('NODOCUMENTO').AsString + '-' + CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString + '.  Linha: ' + IntToStr(CdsDocumento.RecNo),1]);
         MessageInfo := E.Message;

         if bImportaFromTabela then
            Rollback;
      end;
   end;
end;

End.


