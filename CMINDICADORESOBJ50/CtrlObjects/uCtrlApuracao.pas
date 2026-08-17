unit uCtrlApuracao;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE APURAÇÃO DE INDICADORES  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  23/05/2002
//      Data de Término :  23/07/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      SelecionaApuracao   - Busca um registro de apuração
//      GravaApuracao       - Insere, Altera e Exclui apurações                     ( TLB )
//      ExcluiApuracao      - Exclui apurações em lote                              ( TLB )
//      IndicadorApurado    - Verifica se um indicador já foi apurado
//      ApuraIndicadores    - Apura Indicadores Calculados ( ABL e Aluguel Mínimo ) ( TLB )
//      ApuraRegras         - Apura Indicadores por Regras de Negócio               ( TLB )
//      CheckList           - Efetua uma checagem dos indicadores conforme cadastro ( TLB )
//      ConciliaIndicadores - Compara valores de ABL e Aluguel ( Calc x Import )    ( TLB )
// -----------------------------------------------------------------------------

interface

Uses SysUtils, StdCtrls, Classes, db, dbClient, 
     uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
     uDbApuracao, uComunsImobiliario, uCtrlTipoIndicador, uCtrlContratoLoja,
     uCtrlGrpApuracao, uCtrlIndicador, uCtrlRegra, uDiasUteis, uDbIndLote;

Type TCtrlApuracao = class(TCmControlObject)

     private
       FCdsApuracao: TCMClientDataSet;
       FDbApuracao : TDbApuracao;
       FDbIndLote  : TDbIndLote;

       CtrlTipoIndicador : TCtrlTipoIndicador;
       CtrlContratoLoja  : TCtrlContratoLoja;
       CtrlGrpApuracao   : TCtrlGrpApuracao;
       CtrlIndicador     : TCtrlIndicador;
       CtrlRegra         : TCtrlRegra;
       DiasUteis         : TDiasUteis;

       cdsResult         : TCMClientDataSet;
       cdsRegras         : TCMClientDataSet;
       sBilheteRegra     : String;
       iTotRegRegra      : Integer;

       procedure SetCdsApuracao(const Value: TCMClientDataSet);
       procedure SetDbApuracao (const Value: TDbApuracao);

       // utilizadas pelo processo de checklist
       procedure InsereCheck (const sValor: String);
       function  ErroCheck   (const bApurado,bContrato:Boolean; const iNumApurado:Integer; var sErro:String;
                              const iIdIndicador,iIndAbl,iIndAlug,iNivel:Integer;
                              const fVlrAbl,fVlrAlug:Extended;
                              const sPeriodicidade:String) : Boolean;

       // utilizadas pelo processo de apuração de regras
       Procedure OnResultRegra( Sender: TObject );
       Function  BuscaDadosRegra(const iIdImovel,iIdContrato,iMes,iAno,iIdIndVenda,iIdIndAluguel:Integer; const dApuracao:TDateTime) : OLEVariant;
       Function  BuscaDadosRegraGeral(const iIdImovel,iIdContrato,iMes,iAno:Integer; const dApuracao:TDateTime) : OLEVariant;       
       Function  BuscaDadosRegraHotel(const iIdImovel,iMes,iAno:Integer; const dApuracao:TDateTime) : OLEVariant;

    procedure SetDbIndLote(const Value: TDbIndlote);

     protected
       procedure AfterInitialize;   Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
       destructor  Destroy; override;

       property DbApuracao  : TDbApuracao      read FDbApuracao  write SetDbApuracao;
       property DbIndLote   : TDbIndlote       read FDbIndLote   write SetDbIndLote;
       property CdsApuracao : TCMClientDataSet read FCdsApuracao write SetCdsApuracao;

       function SelecionaApuracao  (const iIdApuracao:Integer ) : OLEVariant;
       function GravaApuracao(const iIdLayOutImp : Double = -1; const sDescricao : String = '';
                              const sArquivoImp : string = ''): Boolean;
       function ExcluiApuracao     (const iIdIndicador,iIdImovel,iIdContrato,iMes,iAno:Integer; const dLanca:TDateTime; const sTipoLanca,sTipoInc:String; const bTransacao:Boolean = True) : Boolean;
       function IndicadorApurado   (const iIdApuracao,iIdImovel,iIdIndicador,iIdGrpApuracao,
                                          iIdSubGrpApuracao,iIdContrato,iMes:Integer;
                                    const iAno:Double; const sTipo:String; const dDataApura: TDateTime;
                                      var iNumApura:Integer;  var fVlrApura:Extended; const sInclusao:String = '') : Boolean;
       function ApuraIndicadores   (const vContratos: OLEVariant; const iMes,iAno,iIndABL,iIndAlug:Integer; const dApuracao:TDateTime; sNomeBilhete:String; const bTransacao:Boolean = True) : Boolean;
       function ApuraRegras        (const iIdIndicador,iIdImovel,iIdContrato,iMes,iAno,iIdIndVenda,iIdIndAluguel:Integer; const dApuracao:TDateTime; sNomeBilhete: String; const bTransacao:Boolean = True): Boolean;
       function CheckList          (const iIdImovel,iIdTipo,iIdSubtipo,iMes,iAno,iIndABL,iIndAlug:Integer; const bSoErros: Boolean; sNomeBilhete:String) : OLEVariant;
       function ConciliaIndicadores(const iIdImovel,iIdContrato,iIdIndicador,iMes,iAno:Integer; sNomeBilhete:String; bTransacao: Boolean = True) : OLEVariant;
    published

end;

implementation

{ TCtrlApuracao }

constructor TCtrlApuracao.Create;
begin
  inherited create;
  // Cria os DbOjbects
  FDbApuracao := TDBApuracao.Create( Self );
  FDbIndLote   := TDbIndLote.Create(Self);

  // Cria uma instância dos CtrlObjects Externos
  CtrlTipoIndicador := TCtrlTipoIndicador.Create;
  CtrlContratoLoja  := TCtrlContratoLoja.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
  CtrlGrpApuracao   := TCtrlGrpApuracao.Create;
  CtrlIndicador     := TCtrlIndicador.Create;
  CtrlRegra         := TCtrlRegra.Create;
  DiasUteis         := TDiasUteis.Create;
end;

destructor TCtrlApuracao.Destroy;
begin
  // Destrói os DbObjects criados
  FDbApuracao.Free;
  FDbIndLote.Free;

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  If IsAppServer Then FCdsApuracao.Free;

  // Destroi os CtrlObjects Externos
  CtrlTipoIndicador.Free;
  CtrlContratoLoja.Free;
  CtrlGrpApuracao.Free;
  CtrlIndicador.Free;
  CtrlRegra.Free;
  DiasUteis.Free;
  inherited;
end;

procedure TCtrlApuracao.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsApuracao := TCMClientDataSet.Create( nil );
end;

procedure TCtrlApuracao.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDBApuracao.DataBaseName := DataBaseName;
  FDbIndLote.DataBaseName := DataBaseName;

  // Inicializa os CtrlObjects Externos
  CtrlTipoIndicador.InitializeAs( Self );
  CtrlContratoLoja.InitializeAs( Self );
  CtrlGrpApuracao.InitializeAs( Self );
  CtrlRegra.InitializeAs( Self );
  CtrlIndicador.InitializeAs( Self );
  DiasUteis.InitializeAs( Self );
end;

function TCtrlApuracao.GravaApuracao(const iIdLayOutImp : Double = -1; const sDescricao : String = '';
                                     const sArquivoImp : string = ''): Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaApuracao( CdsApuracao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      if (iIdLayOutImp > 0) then begin
        FDbIndLote.Idlayoutimp.AsFloat     := iIdLayOutImp;
        FDbIndLote.Descricao.AsString      := sDescricao;
        FDbIndLote.Arquivoimp.AsString     := sArquivoImp;
        FDbIndLote.Idimovel.AsFloat        := CdsApuracao.FieldByName('IDIMOVEL').AsFloat;
        FDbIndLote.Dataapuracao.AsDateTime := CdsApuracao.FieldByName('DATAAPURACAO').AsDateTime;
        FDbIndLote.Tipolanca.AsString      := CdsApuracao.FieldByName('TIPOLANCA').AsString;

        if not FDbIndLote.Insert then
          raise Exception.Create(FDbIndLote.MessageInfo);
      end;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsApuracao, DbApuracao, [FDbIndLote.IdIndLote], [DbApuracao.IdIndLote] );

      if not Result then raise Exception.Create( DbApuracao.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlApuracao.SelecionaApuracao(const iIdApuracao: Integer): OLEVariant;
var sSql : String;
begin
  // define o SQL
  sSql := 'SELECT A.IDAPURACAO,     A.IDGRPAPURACAO,  A.IDSUBGRPAPURACAO, ' +
          '       A.IDCONTRATO,     A.IDINDICADOR,    A.IDIMOVEL, I.IDIMOVELMESTRE, ' +
          '       A.MESCOMPETENCIA, A.ANOCOMPETENCIA, A.DATAAPURACAO, ' +
          '       A.TIPOLANCA,      A.VLRAPURACAONUM, A.VLRAPURACAOSTR, ' +
          '       A.VLRAPURACAODAT, A.DATAINCLUSAO,   A.TIPOINCLUSAO, ' +
          '       ID.TIPODADO,      ID.FLGGRPAPURACAO, ID.FLGSUBGRPAPURACAO, ' +
          '       ID.FLGCONTRATO,   ID.PERIODICIDADE,  A.FLGCONCILIADO, ' +
          '       ID.IDGRPPADRAO,   ID.IDSUBGRPPADRAO, A.OBSERVACAO, A.IDINDLOTE,' +
          '       IG.DESCRICAO  AS DSC_GRPPADRAO, ' +
          '       IP.DESCRICAO  AS DSC_SUBGRPPADRAO, ' +
          '       ID.DESCRICAO  AS DSC_INDICADOR, ' +
          '       GR.DESCRICAO  AS DSC_GRPAPURACAO, ' +
          '       SG.DESCRICAO  AS DSC_SUBGRPAPURACAO, ' +
          '       DECODE(I.IDIMOVELMESTRE, NULL, I.IMONOME, ' +
          '         IM.IMONOME || ' + QuotedStr(' - ') + ' || I.IMONOME ) AS NOME_EXTENSO, ' +
          '       CL.NUMCONTRATO || ' + QuotedStr(' - ') + ' || CL.NOMCONTRATO AS DSC_CONTRATO ' +
          '  FROM INDAPURACAO A, ' +
          '       INDINDICADOR ID, ' +
          '       INDGRPAPURACAO GR, ' +
          '       INDGRPAPURACAO SG, ' +
          '       INDGRPAPURACAO IG, ' +
          '       INDGRPAPURACAO IP, ' +
          '       INDCONTRATOLOJA CL, ' +
          '       IMOVEL I, ' +
          '       IMOVEL IM ' +
          ' WHERE A.IDCONTRATO = CL.IDCONTRATO(+) ' +
          '   AND A.IDINDICADOR = ID.IDINDICADOR ' +
          '   AND A.IDGRPAPURACAO = GR.IDGRPAPURACAO(+) ' +
          '   AND A.IDSUBGRPAPURACAO = SG.IDGRPAPURACAO(+) ' +
          '   AND ID.IDGRPPADRAO = IG.IDGRPAPURACAO(+) ' +
          '   AND ID.IDSUBGRPPADRAO = IP.IDGRPAPURACAO(+) ' +
          '   AND A.IDIMOVEL = I.IDIMOVEL ' +
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL(+) ' +
          '   AND A.IDAPURACAO = ' + IntToStr(iIdApuracao);

  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função para Excluir um lote de indicadores
// Data : 06/08/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdIndicador      : id do Indicador         ( -1 )
//       iIdImovel         : id do imóvel            ( -1 )
//       iIdContrato       : id do Contrato de Loja  ( -1 )
//       iMes              : Mes de competência      ( -1 )
//       iAno              : Ano de competência      ( -1 )
//       dLanca            : Data de Lançamento      ( -1 )
//       sTipoLanca        : Tipo de Lançamento ( P - previsto, R - realizado )
//       sTipoInc          : Tipo de Inclusão   ( M - Manual, I - Importado, C - Calculado, R - Regra )
//       bTransacao        : Controla Transação ( default - True )
//
// Retorno : True  - Exclusão com Sucesso
//           False - Falha na Exclusão
//----------------------------------------------------------------------------------------
function TCtrlApuracao.ExcluiApuracao(const iIdIndicador,iIdImovel,iIdContrato,iMes,iAno: Integer;
                                      const dLanca: TDateTime; const sTipoLanca,sTipoInc: String;
                                      const bTransacao: Boolean): Boolean;
var sSql, sCond, sParam: String;
    i : Integer;

begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiApuracao( iIdIndicador, iIdImovel, iIdContrato,
                                                   iMes, iAno, dLanca, sTipoLanca, sTipoInc, bTransacao );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    Result := True;

    try
      // Define Parametros
      sParam := '';
      if iIdIndicador > 0 then sParam := sParam + ' AND IDINDICADOR = '    + IntToStr(iIdIndicador);
      if iIdImovel > 0    then sParam := sParam + ' AND IDIMOVEL = '       + IntToStr(iIdImovel);
      if iIdContrato > 0  then sParam := sParam + ' AND IDCONTRATO = '     + IntToStr(iIdContrato);
      if iMes > 0         then sParam := sParam + ' AND MESCOMPETENCIA = ' + IntToStr(iMes);
      if iAno > 0         then sParam := sParam + ' AND ANOCOMPETENCIA = ' + IntToStr(iAno);
      if dLanca > 0       then sParam := sParam + ' AND DATAAPURACAO = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',  dLanca)) + ',''DD/MM/YYYY'')';

      // Monta Clausula IN para Tipo de Lançamento
      if sTipoLanca <> '' then begin
         sCond := ' AND TIPOLANCA IN(';
         for i := 1 to length(sTipoLanca) do begin
            sCond := sCond + QuotedStr(sTipoLanca[i]) + ',';
         end;
         sCond  := Copy(sCond,1,Length(sCond)-1) + ')';
         sParam := sParam + sCond;
      end;

      // Monta Clausula IN para Tipo de Inclusão
      if sTipoInc <> '' then begin
         sCond := ' AND TIPOINCLUSAO IN(';
         for i := 1 to length(sTipoInc) do begin
            sCond := sCond + QuotedStr(sTipoInc[i]) + ',';
         end;
         sCond  := Copy(sCond,1,Length(sCond)-1) + ')';
         sParam := sParam + sCond;
      end;

      // Define Sql
      sSql := 'DELETE FROM INDAPURACAO ' +#13+
              ' WHERE 1=1 ' +#13+ sParam;


      if bTransacao then StartTransaction;
      if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
      if bTransacao then Commit;
    except
      on E : Exception do begin
        Result := False;
        if bTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


//========================================================================================
// Função para Verificar se o Indicador já foi Apurado para os parametros informados
// Data : 24/05/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdApuracao       : id da Apuração               ( -1 ou Null )
//       iIdImovel         : id da Condição de Pagamento  ( -1 )
//       iIdIndicador      : id do Indicador              ( -1 )
//       iIdGrpApuracao    : id do Grupo de Apuração      ( -1 )
//       iIdSubGrpApuracao : id do Subgrupo de Apuração   ( -1 )
//       iIdContrato       : id do Contrato de Loja       ( -1 )
//       iMes              : Mes de competência
//       iAno              : Ano de competência
//       sTipo             : Tipo de Lançamento ( P - previsto, R - realizado )
//       dDataApura        : Data da Apuração
//       iNumApura         : Retorna a qtde de registros apurados ( duplicidade )
//       fVlrApura         : Retorna o Valor apurado para indicadores numéricos, quando iNumApura = 1
//       sInclusao         : Tipo de Inclusão a ser pesquisado ( M, I, C, R ) ( default Null )
//
// Retorno : True  - Caso o indicador já tenha sido apurado
//           False - Caso o indicador não tenha sido apurado
//----------------------------------------------------------------------------------------
function TCtrlApuracao.IndicadorApurado(const iIdApuracao,iIdImovel,iIdIndicador,iIdGrpApuracao,
                                              iIdSubGrpApuracao,iIdContrato,iMes:Integer;
                                        const iAno:Double; const sTipo: String; const dDataApura: TDateTime;
                                        var iNumApura:Integer; var fVlrApura:Extended; const sInclusao:String): Boolean;
var sSql, sParam : String;
    cdsTemp : TCMClientDataSet;
begin
  Result    := False;
  iNumApura := -1;
  cdsTemp := TCMClientDataSet.Create( nil );

  // Define filtros
  sParam := '';
  if iIdImovel > 0         then sParam := sParam + ' AND IDIMOVEL = ' + IntToStr(iIdImovel);
  if iIdIndicador > 0      then sParam := sParam + ' AND IDINDICADOR = ' + IntToStr(iIdIndicador);
  if iIdGrpApuracao > 0    then sParam := sParam + ' AND IDGRPAPURACAO = ' + IntToStr(iIdGrpApuracao);
  if iIdSubGrpApuracao > 0 then sParam := sParam + ' AND IDSUBGRPAPURACAO = ' + IntToStr(iIdSubGrpApuracao);
  if iIdContrato > 0       then sParam := sParam + ' AND IDCONTRATO = ' + IntToStr(iIdContrato);
  if iMes > 0              then sParam := sParam + ' AND MESCOMPETENCIA = ' + IntToStr(iMes);
  if iAno > 0              then sParam := sParam + ' AND ANOCOMPETENCIA = ' + FormatFloat('####',iAno);
  if sTipo <> ''           then sParam := sParam + ' AND TIPOLANCA = ' + QuotedStr(sTipo);
  if sInclusao <> ''       then sParam := sParam + ' AND TIPOINCLUSAO = ' + QuotedStr(sInclusao);
  if dDataApura > 0        then sParam := sParam + ' AND DATAAPURACAO = TO_DATE(' + QuotedStr(DateToStr(dDataApura)) + ')';

  sSql := 'SELECT IDAPURACAO, VLRAPURACAONUM ' +
          '  FROM INDAPURACAO ' +
          ' WHERE 1=1 ' + sParam;

  cdsTemp.Data := GetDataPacket( sSql );
  if not cdsTemp.IsEmpty then begin
    Result    := True;
    iNumApura := cdsTemp.RecordCount;
    if iNumApura = 1 then
         fVlrApura := cdsTemp.FieldByName('VLRAPURACAONUM').AsFloat
    else fVlrApura := 0;
    if iIdApuracao > 0 then begin
       if cdsTemp.FieldByName('IDAPURACAO').AsInteger = iIdApuracao then begin
         Result := False;
       end;
    end;
  end;
  cdsTemp.Free;
end;



//========================================================================================
// Função para Apurar indicadores calculados
// Data : 27/06/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vContratos   : Conjunto de contratos a ser calculado ( OLEVariant )
//       iMes         : Mes de Competencia
//       iAno         : Ano de Competencia
//       iIndABL      : id do Indicador de ABL            ( -1 )
//       iIndAlug     : id do Indicador de Aluguel Mínimo ( -1 )
//       dApuracao    : Data da Apuração
//       sNomeBilhete : Nome do Arquivo temporario a ser gerado pela func. DoProgresso
//       bTransacao   : Controla Transação ( default - True )
//
// Retorno : True  - Apuração com sucesso
//           False - Falha na Apuração
//----------------------------------------------------------------------------------------
function TCtrlApuracao.ApuraIndicadores(const vContratos: OLEVariant; const iMes,iAno,iIndABL,iIndAlug: Integer; const dApuracao:TDateTime; sNomeBilhete:String; const bTransacao:Boolean): Boolean;
var cdsContratos        : TCMClientDataSet;
    iNumApura, iTotReg  : Integer;
    fVlrApura, fVlrNovo : Extended;
    bApurado            : Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ApuraIndicadores( vContratos, iMes, iAno, iIndABL, iIndAlug, dApuracao,
                                                     sNomeBilhete, bTransacao );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    Result       := True;
    cdsContratos := nil;
    try
      try

        // Cria e carrega o cds Temporário de contratos
        cdsContratos      := TCMClientDataSet.Create( nil );
        cdsContratos.Data := vContratos;
        iTotReg           := cdsContratos.RecordCount;
        cdsContratos.First;

        if bTransacao then StartTransaction;

        // Efetua Lançamentos em INDAPURACAO
        while not cdsContratos.Eof do begin

          // Lança ABL
          if (iIndABL > 0) and (cdsContratos.FieldByName('QTDEABL').AsFloat > 0) then begin

            // Verifica se o indicador já foi apurado anteriormente ou possui valores diferentes
            bApurado := IndicadorApurado(-1,
                                         cdsContratos.FieldByName('IDIMOVEL').AsInteger,
                                         iIndABL, -1, -1,
                                         cdsContratos.FieldByName('IDCONTRATO').AsInteger,
                                         iMes, iAno, 'R', dApuracao, iNumApura, fVlrApura,'C');

            // Exclui a apuração anterior no caso de divergências com o valor atual
            fVlrNovo := cdsContratos.FieldByName('QTDEABL').AsFloat;
            if (bApurado) and (fVlrApura <> fVlrNovo) then begin
               ExcluiApuracao(iIndABL, cdsContratos.FieldByName('IDIMOVEL').AsInteger,
                              cdsContratos.FieldByName('IDCONTRATO').AsInteger,
                              iMes, iAno, dApuracao, 'R', 'C', False );
               bApurado := False;
            end;

            // Registra a apuração
            if not bApurado then begin
              with DbApuracao do begin
                Idimovel.AsInteger       := cdsContratos.FieldByName('IDIMOVEL').AsInteger;
                Idindicador.AsInteger    := iIndABL;
                Idcontrato.AsInteger     := cdsContratos.FieldByName('IDCONTRATO').AsInteger;
                MesCompetencia.AsInteger := iMes;
                AnoCompetencia.AsInteger := iAno;
                DataApuracao.AsDateTime  := dApuracao;
                TipoLanca.AsString       := 'R';
                Vlrapuracaonum.AsFloat   := cdsContratos.FieldByName('QTDEABL').AsFloat;
                Datainclusao.AsDateTime  := Date;
                Tipoinclusao.AsString    := 'C';
                FlgConciliado.AsString   := 'N';
              end;
              if not DbApuracao.Insert then raise Exception.Create( DbApuracao.MessageInfo );
            end;
          end;

          // Lança Aluguel Mínimo
          if (iIndAlug > 0) and (cdsContratos.FieldByName('VLRALUGMIN').AsFloat > 0) then begin

            // Verifica se o indicador já foi apurado anteriormente ou possui valores diferentes
            bApurado := IndicadorApurado(-1,
                                         cdsContratos.FieldByName('IDIMOVEL').AsInteger,
                                         iIndAlug, -1, -1,
                                         cdsContratos.FieldByName('IDCONTRATO').AsInteger,
                                         iMes, iAno, 'R', dApuracao, iNumApura, fVlrApura,'C');

            // Exclui a apuração anterior no caso de divergências com o valor atual
            fVlrNovo := cdsContratos.FieldByName('VLRALUGMIN').AsFloat;
            if (bApurado) and (fVlrApura <> fVlrNovo) then begin
               ExcluiApuracao(iIndAlug, cdsContratos.FieldByName('IDIMOVEL').AsInteger,
                              cdsContratos.FieldByName('IDCONTRATO').AsInteger,
                              iMes, iAno, dApuracao, 'R', 'C', False );
               bApurado := False;
            end;

            // Registra a apuração
            if not bApurado then begin
              with DbApuracao do begin
                Idimovel.AsInteger       := cdsContratos.FieldByName('IDIMOVEL').AsInteger;
                Idindicador.AsInteger    := iIndAlug;
                Idcontrato.AsInteger     := cdsContratos.FieldByName('IDCONTRATO').AsInteger;
                MesCompetencia.AsInteger := iMes;
                AnoCompetencia.AsInteger := iAno;
                DataApuracao.AsDateTime  := dApuracao;
                TipoLanca.AsString       := 'R';
                Vlrapuracaonum.AsFloat   := cdsContratos.FieldByName('VLRALUGMIN').AsFloat;
                Datainclusao.AsDateTime  := Date;
                Tipoinclusao.AsString    := 'C';
                FlgConciliado.AsString   := 'N';
              end;
              if not DbApuracao.Insert then raise Exception.Create( DbApuracao.MessageInfo );
            end;
          end;

          // Envia o identificador do registro processado para o Cliente
          DoProgresso([sNomeBilhete, 'Apurando Contratos...',
                       CdsContratos.RecNo, iTotReg]);

          cdsContratos.Next;
        end;

        if bTransacao then Commit;
      except
        on E : Exception do begin
          Result := False;
          if bTransacao then Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      cdsContratos.Free;
      if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;

  end;
end;


//========================================================================================
// Função para Verificar consistência dos Indicadores lançados
// Data : 04/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel   : ID do Imovel a ser verificado
//       iIdTipo     : ID do Tipo de Relatorio    ( -1 )
//       iIdSubTipo  : ID do SubTipo do Relatorio ( -1 )
//       iMes         : Mes de Competencia
//       iAno         : Ano de Competencia
//       iIndABL      : id do Indicador de ABL            ( -1 )
//       iIndAlug     : id do Indicador de Aluguel Mínimo ( -1 )
//       bSoErros     : Lista apenas os erros encontrados
//       sNomeBilhete : Nome do Arquivo temporario a ser gerado pela func. DoProgresso
//
// Retorno : True  - Verificação concluída com sucesso
//           False - Falha na Verificação
//----------------------------------------------------------------------------------------
function TCtrlApuracao.CheckList(const iIdImovel,iIdTipo,iIdSubTipo,iMes,iAno,iIndABL,iIndAlug: Integer;
                                 const bSoErros : Boolean;  sNomeBilhete: String): OLEVariant;
var cdsCheck,cdsContratos,cdsGrupos : TCMClientDataSet;
    iQuebra,iTotReg,iIdIndicador,iChecado,iNumApura,iNivel,i : Integer;
    bApurado, bErro, bIndicadorImpresso, bChecado, bContrato : Boolean;
    sTipo,sMes,sErro, sPeriodicidade, sInclusao : String;
    fVlrApura : Extended;
    dInicio  : TDateTime;
    vChecado : Array of String;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.CheckList( iIdImovel, iIdTipo, iIdSubTipo, iMes, iAno, iIndABL, iIndAlug,
                                              bSoErros, sNomeBilhete );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    cdsCheck     := nil;
    cdsResult    := nil;
    cdsGrupos    := nil;
    cdsContratos := nil;
    try
      try
        sMes     := IntToStr(iMes);
        iChecado := 0;
        if iMes < 10 then sMes := '0'+ sMes;
        dInicio  := StrToDate('01/' + sMes + '/' + IntToStr(iAno));
        // Cria e carrega o cds Temporário de Indicadores a serem verificados
        cdsCheck      := TCMClientDataSet.Create( nil );
        cdsCheck.Data := CtrlTipoIndicador.LookupGrpIndicador(iIdSubTipo,iIdTipo);
        cdsCheck.First;
        iTotReg := cdsCheck.RecordCount;

        // Cria e carrega o cds Temporário de contratos ativos no periodo de verificação
        cdsContratos      := TCMClientDataSet.Create( nil );
        cdsContratos.Data := CtrlContratoLoja.LookupContratoLoja (-1,dInicio,OpCalcular,iIdImovel);

        // Cria o cds Temporário de grupos ( será carregado por indicador dependendo do tipo )
        cdsGrupos := TCMClientDataSet.Create( nil );

        // Cria o cds Temporário para guardar o resultado do Check List
        cdsResult      := TCMClientDataSet.Create( nil );
        cdsResult.Data := GetDataPacket('SELECT ' + QuotedStr(ComunsImobiliario.Space(150)) + ' AS LINHA FROM DUAL WHERE 1=1');

        // Verifica todos os indicadores associados aos relatorio selecionados
        while not cdsCheck.eof do begin
          // Imprime cabecalho do grupo
          iQuebra := cdsCheck.FieldByName('IDSUBTIPO').AsInteger;
          InsereCheck( cdsCheck.FieldByName('DSC_TIPO').AsString + ' - ' + cdsCheck.FieldByName('DSC_SUBTIPO').AsString );
          while (iQuebra = cdsCheck.FieldByName('IDSUBTIPO').AsInteger) and (not cdsCheck.eof) do begin

            bApurado           := True;
            bIndicadorImpresso := False;
            iIdIndicador       := cdsCheck.FieldByName('IDINDICADOR').AsInteger;
            iNivel             := cdsCheck.FieldByName('NIVELVERIFICA').AsInteger;
            sTipo              := cdsCheck.FieldByName('DSC_TIPOLANCA').AsString[1];
            sPeriodicidade     := cdsCheck.FieldByName('PERIODICIDADE').AsString;

            if (iIdIndicador = iIndAlug) or (iIdIndicador = iIndAbl) then
                 sInclusao := 'C'
            else sInclusao := '';
            if cdsCheck.FieldByName('FLGCONTRATO').AsString = 'S' then
                 bContrato := True
            else bContrato := False;

            // checa o indicador somente se o mesmo estiver setado para tal no cadastro
            if iNivel > 0 then begin

              // Checa se o indicador já foi verificado para outro relatório
              bChecado := False;
              if iChecado > 0 then begin
                for i := 0 to iChecado -1 do begin
                  if vChecado[i] = IntToStr(iIdIndicador) + sTipo then begin
                    bChecado := True;
                    Break;
                  end;
                end;
              end;

              // Efetua a verificação
              if not bChecado then begin

                // para nivel 1 - Pelo menos uma ocorrencia por Indicador
                if iNivel = 1 then begin
                  bApurado := IndicadorApurado(-1,iIdImovel,iIdIndicador,-1,-1,-1,iMes,iAno,sTipo,-1,iNumApura,fVlrApura,sInclusao);
                  bErro    := ErroCheck(bApurado,bContrato,iNumApura,sErro,iIdIndicador,iIndABL,iIndAlug,iNivel,0,0,sPeriodicidade);
                  if (bErro) or ((not bSoErros) and (not bErro)) then begin
                    InsereCheck('      ' + cdsCheck.FieldByName('DSC_INDICADOR').AsString + '  (' +cdsCheck.FieldByName('DSC_TIPOLANCA').AsString +')  -  ' + sErro );
                  end;
                end;

                // para nivel 2 - Uma ocorrencia por contrato / grupo
                if iNivel = 2 then begin
                  // Verifica Apuração por contrato
                  if cdsCheck.FieldByName('FLGCONTRATO').AsString = 'S' then begin
                    cdsContratos.First;
                    while not cdsContratos.eof do begin
                      bApurado := IndicadorApurado(-1,iIdImovel,iIdIndicador,-1,-1,
                                                   cdsContratos.FieldByName('IDCONTRATO').AsInteger,
                                                   iMes,iAno,sTipo,-1,iNumApura,fVlrApura,sInclusao);
                      // define o erro encontrado
                      bErro    := ErroCheck(bApurado,bContrato,iNumApura,sErro,iIdIndicador,iIndABL,iIndAlug,iNivel,
                                            cdsContratos.FieldByName('QTDEABL').AsFloat,
                                            cdsContratos.FieldByName('VLRALUGMIN').AsFloat,
                                            sPeriodicidade);
                      if (bErro) or ((not bSoErros) and (not bErro)) then begin
                        if not bIndicadorImpresso then begin
                          InsereCheck('      ' + cdsCheck.FieldByName('DSC_INDICADOR').AsString + '  (' +cdsCheck.FieldByName('DSC_TIPOLANCA').AsString +')' );
                          bIndicadorImpresso := True;
                        end;
                        InsereCheck('            ' + cdsContratos.FieldByName('NUMCONTRATO').AsString + ' - ' +
                                                     cdsContratos.FieldByName('NOMCONTRATO').AsString + ' - ' + sErro );
                      end;
                      cdsContratos.Next;
                    end;
                    InsereCheck(' ');
                  end else begin
                    // Verifica Apuração por Grupo
                    if not cdsCheck.FieldByName('FLGGRPAPURACAO').IsNull then begin
                      // Carrega o cds Temporário de grupos
                      cdsGrupos.Data := CtrlGrpApuracao.LookupGrpApuracao(-1,cdsCheck.FieldByName('FLGGRPAPURACAO').AsString);
                      cdsGrupos.First;
                      while not cdsGrupos.eof do begin
                        bApurado := IndicadorApurado(-1,iIdImovel,iIdIndicador,
                                                     cdsGrupos.FieldByName('IDGRPAPURACAO').AsInteger,
                                                     -1,-1,iMes,iAno,sTipo,-1,iNumApura,fVlrApura,sInclusao);
                        // define o erro encontrado
                        bErro    := ErroCheck(bApurado,bContrato,iNumApura,sErro,iIdIndicador, iIndABL, iIndAlug, iNivel, 0, 0, sPeriodicidade);
                        if (bErro) or ((not bSoErros) and (not bErro)) then begin
                          if not bIndicadorImpresso then begin
                            InsereCheck('      ' + cdsCheck.FieldByName('DSC_INDICADOR').AsString + '  (' +cdsCheck.FieldByName('DSC_TIPOLANCA').AsString +')' );
                            bIndicadorImpresso := True;
                          end;
                          InsereCheck('            ' + cdsGrupos.FieldByName('DESCRICAO').AsString + ' - ' + sErro );
                        end;
                        cdsGrupos.Next;
                      end;
                      InsereCheck(' ');
                    end;
                  end;
                end;

                // Inclui o Indicador no vetor de Indicadores já verificados
                SetLength(vChecado,iChecado+1);
                vChecado[iChecado] := IntToStr(iIdIndicador) + sTipo;
                iChecado := iChecado + 1;

              end else begin
                if not bSoErros then
                  InsereCheck('      ' + cdsCheck.FieldByName('DSC_INDICADOR').AsString + '  (' +cdsCheck.FieldByName('DSC_TIPOLANCA').AsString +')  -  Verificado Anteriormente' );
              end;
            end;

            // Envia o identificador do registro processado para o Cliente
            DoProgresso([sNomeBilhete,
                         'Apurando ' + cdsCheck.FieldByName('DSC_TIPO').AsString + '...',
                         CdsCheck.RecNo, iTotReg]);

            iQuebra := cdsCheck.FieldByName('IDSUBTIPO').AsInteger;

            cdsCheck.Next;
          end;
          InsereCheck(' ');
        end;
      except
        on E : Exception do MessageInfo := E.Message;
      end;
    finally
      Result := cdsResult.Data;
      cdsCheck.Free;
      cdsContratos.Free;
      cdsResult.Free;
      cdsGrupos.Free;
      if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;

  end;
end;


//========================================================================================
// Função para Apurar indicadores calculados por Regra de Negócio
// Data : 17/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdIndicador : ID do Indicador a ser calculado   ( -1 )
//       iIdImovel    : ID do shopping                    ( -1 )
//       iIdContrato  : ID do Contrato                    ( -1 )
//       iMes         : Mes de Competencia
//       iAno         : Ano de Competencia
//       iIndVenda    : id do Indicador de Vendas
//       iIndAluguel  : id do Indicador de Aluguel Mínimo
//       dApuracao    : Data da Apuração
//       sNomeBilhete : Nome do Arquivo temporario a ser gerado pela func. DoProgresso
//       bTransacao   : Controla Transação ( default - True )
//
// Retorno : True  - Apuração com sucesso
//           False - Falha na Apuração
//----------------------------------------------------------------------------------------
function TCtrlApuracao.ApuraRegras(const iIdIndicador,iIdImovel,iIdContrato,iMes,iAno,iIdIndVenda,iIdIndAluguel:Integer;
                                   const dApuracao:TDateTime; sNomeBilhete:String; const bTransacao:Boolean): Boolean;
var cdsContratos : TCMClientDataSet;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ApuraRegras(iIdIndicador,iIdImovel,iIdContrato,iMes,iAno,iIdIndVenda,iIdIndAluguel,
                                               dApuracao,sNomeBilhete,bTransacao);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    Result       := True;
    cdsContratos := nil;
    try
      try
        sBilheteRegra := sNomeBilhete;

        // Cria e carrega o cds Temporario de indicadores
        cdsRegras := TCMClientDataSet.Create( nil );
        if iIdIndicador > 0 then
             cdsRegras.Data := CtrlIndicador.LookupIndicador(iIdIndicador, '', -1, -1, True)
        else cdsRegras.Data := CtrlIndicador.LookupIndicador(-1, '', -1, -1, True);

        // Retorna caso não existam regras a calcular
        if cdsRegras.IsEmpty then Exit;

        // Cria o cds Temporário de contratos
        cdsContratos := TCMClientDataSet.Create( nil );
        if bTransacao then StartTransaction;

        // Executa as regras dos indicadores
        while not cdsRegras.Eof do begin

          if cdsRegras.FieldByName('QRYREGRA').AsInteger = 1 then
               cdsContratos.Data := BuscaDadosRegra(iIdImovel,iIdContrato,iMes,iAno,iIdIndVenda,iIdIndAluguel,dApuracao)
          else if cdsRegras.FieldByName('QRYREGRA').AsInteger = 2 then
               cdsContratos.Data := BuscaDadosRegraHotel(iIdImovel,iMes,iAno,dApuracao)
          else cdsContratos.Data := BuscaDadosRegraGeral(iIdImovel,iIdContrato,iMes,iAno,dApuracao);
          iTotRegRegra := cdsContratos.RecordCount;

          if iTotRegRegra > 0 then begin
            // Carrega dados e parametros para o ctrlRegra
            CtrlRegra.CopiaData( cdsContratos.Data );
            CtrlRegra.GravaCalculo := False;
            CtrlRegra.ReloadRule   := False;
            CtrlRegra.OnGetResult  := OnResultRegra;

            CtrlRegra.RuleNumber := IntToStr(cdsRegras.FieldByName('IDREGRA').AsInteger);
            CtrlRegra.Execute;
            if (CtrlRegra.Error) or (CtrlRegra.bFinalizarRegra) then raise Exception.Create( DbApuracao.MessageInfo );
            if (CtrlRegra.Error) then raise Exception.Create( DbApuracao.MessageInfo );
          end;
          cdsRegras.Next;
        end;

        if bTransacao then Commit;
      except
        on E : Exception do begin
          Result := False;
          if bTransacao then Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      cdsRegras.Free;
      cdsContratos.Free;
      if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;
  end;
end;


//========================================================================================
// Função para Conciliar Indicadores de Aluguel Mínimo e ABL
// Data : 24/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel    : ID do shopping                    ( -1 )
//       iIdContrato  : ID do Contrato                    ( -1 )
//       iIdIndicador : ID do Indicador a ser verificado
//       iMes         : Mes de Competencia
//       iAno         : Ano de Competencia
//       sNomeBilhete : Nome do Arquivo temporario a ser gerado pela func. DoProgresso
//       bTransacao   : Controla Transação ( default - True )
//
// Retorno : OLEVariant com os registros divergentes
//----------------------------------------------------------------------------------------
function TCtrlApuracao.ConciliaIndicadores(const iIdImovel,iIdContrato,iIdIndicador,iMes,iAno:Integer;
                                           sNomeBilhete:String; bTransacao:Boolean): OLEVariant;
var sDtIni, sDtFim, sSql, sParam1, sParam2, sUpd : String;
    cdsTemp : TCMClientDataSet;
    iTotReg : Integer;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ConciliaIndicadores(iIdImovel,iIdContrato,iIdIndicador,iMes,iAno,
                                                       sNomeBilhete,bTransacao);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    cdsTemp := nil;
    try
      try

        sDtIni  := '01/'+FormatFloat('00',iMes)+'/'+FormatFloat('0000',iAno);
        sDtFim  := DiasUteis.UltimoDiaMes(sDtIni);

        // Define Parametros
        sParam1 := '';
        sParam2 := ' AND MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
                   ' AND ANOCOMPETENCIA = ' + IntToStr(iAno) +#13+
                   ' AND IDINDICADOR = ' + IntToStr(iIdIndicador);
        if iIdImovel > 0 then begin
          sParam1 := sParam1 + ' AND CL.IDIMOVEL = ' + IntToStr(iIdImovel);
          sParam2 := sParam2 + ' AND IDIMOVEL = ' + IntToStr(iIdImovel);
        end;
        if iIdContrato > 0 then begin
          sParam1 := sParam1 + ' AND CL.IDCONTRATO = ' + IntToStr(iIdContrato);
          sParam2 := sParam2 + ' AND IDCONTRATO = ' + IntToStr(iIdContrato);
        end;

        // Define Sql
        sSql := 'SELECT IM.IMONOME,     '+#13+
                '       CL.IDCONTRATO,  '+#13+
                '       CL.NUMCONTRATO, '+#13+
                '       CL.NOMCONTRATO, '+#13+
                '       ROUND(NVL(CAL.VLRAPURACAONUM,0),2) AS VLRCAL, '+#13+
                '       ROUND(NVL(IMP.VLRAPURACAONUM,0),2) AS VLRIMP, '+#13+
                '       CAL.IDAPURACAO AS CAL_IDAPURACAO,             '+#13+
                '       IMP.IDAPURACAO AS IMP_IDAPURACAO              '+#13+
                '  FROM IMOVEL IM, '+#13+
                '       ( '+#13+
                '        SELECT IDIMOVEL, IDCONTRATO, NUMCONTRATO, NOMCONTRATO '+#13+
                '          FROM INDCONTRATOLOJA CL      '+#13+
                '         WHERE ( ( CL.DATINICIO  <= TO_DATE(' +QuotedStr(sDtIni)+ ')       '+#13+
                '                   AND CL.DATTERMINO >= TO_DATE(' +QuotedStr(sDtFim)+ ') ) '+#13+
                '               OR CL.FLGINDETERMINADO = ''S'' )'+#13+ sParam1 +#13+
                '        ) CL, '+#13+
                '        (     '+#13+
                '          SELECT IDCONTRATO, IDAPURACAO, FLGCONCILIADO, VLRAPURACAONUM '+#13+
                '            FROM INDAPURACAO '+#13+
                '           WHERE TIPOINCLUSAO = ''C'' '+#13+ sParam2 +#13+
                '        ) CAL, '+#13+
                '        (      '+#13+
                '          SELECT IDCONTRATO, IDAPURACAO, FLGCONCILIADO, VLRAPURACAONUM '+#13+
                '            FROM INDAPURACAO '+#13+
                '           WHERE TIPOINCLUSAO = ''I'' '+#13+ sParam2 +#13+
                '        ) IMP '+#13+
                '  WHERE CL.IDCONTRATO = CAL.IDCONTRATO(+) '+#13+
                '    AND CL.IDCONTRATO = IMP.IDCONTRATO(+) '+#13+
                '    AND CL.IDIMOVEL   = IM.IDIMOVEL       '+#13+
                '    AND (    ( IMP.FLGCONCILIADO IS NULL OR IMP.FLGCONCILIADO = ''N'' )   '+#13+
                '          OR ( CAL.FLGCONCILIADO IS NULL OR CAL.FLGCONCILIADO = ''N'' ) ) '+#13+
                'ORDER BY IMONOME, NOMCONTRATO ';

        // Concilia as apurações
        cdsTemp      := TCMClientDataSet.Create( nil );
        cdsTemp.Data := GetDataPacket( sSql );
        iTotReg      := cdsTemp.RecordCount;
        cdsTemp.First;

        if bTransacao then StartTransaction;
        while not cdsTemp.eof do begin
          if cdsTemp.FieldByName('VLRIMP').AsFloat = cdsTemp.FieldByName('VLRCAL').AsFloat then begin

             // Atualiza o flag de Conciliado
             sUpd := 'UPDATE INDAPURACAO ' +#13+
                     '   SET FLGCONCILIADO = ''S'' ' +#13+
                     ' WHERE IDAPURACAO    = ' + IntToStr(cdsTemp.FieldByName('CAL_IDAPURACAO').AsInteger) +#13+
                     '    OR IDAPURACAO    = ' + IntToStr(cdsTemp.FieldByName('IMP_IDAPURACAO').AsInteger);
             if not ExecSQL( sUpd ) then raise Exception.Create( 'Erro ao atualizar a Conciliação' );

             // Exclui a apuração importada ( é utilizada apenas para fins de conciliação )
             ExcluiApuracao(iIdIndicador, iIdImovel, iIdContrato, iMes, iAno, -1, 'R', 'I', False);
          end;

          // Envia o identificador do registro processado para o Cliente
          DoProgresso([sNomeBilhete, 'Conciliando Indicadores...',
                       cdsTemp.RecNo, iTotReg]);

          cdsTemp.Next;
        end;
        if bTransacao then Commit;

        // Reabre a query com os divergências da conciliação
        Result := GetDataPacket( sSql );
      except
        on E : Exception do begin
          MessageInfo := E.Message;
          if bTransacao then Rollback;
        end;
      end;
    finally
      cdsTemp.Free;
      if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;
  end;
end;



// ******************************************************* //
// ******************************************************* //
// *****************  FUNCÕES INTERNAS  ****************** //
// ******************************************************* //
// ******************************************************* //

// --------------------------------------------------------
// Cria um registro no cdsResult do Check List  ( INTERNA )
// --------------------------------------------------------
procedure TCtrlApuracao.InsereCheck(const sValor: String);
begin
  cdsResult.Insert;
  cdsResult.FieldByName('LINHA').AsString := sValor;
  cdsResult.Post;
end;


// -------------------------------------------------
// Define o Erro encontrado no CheckList ( INTERNA )
// -------------------------------------------------
function TCtrlApuracao.ErroCheck(const bApurado,bContrato: Boolean; const iNumApurado: Integer; var sErro: String;
                                 const iIdIndicador,iIndAbl,iIndAlug,iNivel:Integer;
                                 const fVlrAbl,fVlrAlug:Extended;
                                 const sPeriodicidade:String): Boolean;
begin
  Result := False;
  sErro  := 'Apuração OK';
  if (bApurado) and (iNumApurado > 1) then begin
    if (sPeriodicidade = 'M') then begin
      if (iNivel = 1) and (bContrato) then begin
        Result := False;
        sErro  := 'Apuração OK';
        Exit;
      end else begin
        Result := True;
        sErro  := 'Indicador Mensal, apurado com duplicidade';
        Exit;
      end;
    end;
    if sPeriodicidade = 'D' then begin
      if iNumApurado > 31 then begin
        Result := True;
        sErro  := 'Indicador Diário, possui mais de 31 lançamentos no mês';
        Exit;
      end;
    end;
  end;
  if not bApurado then begin
    Result := True;
    sErro  := 'Apuração não Encontrada';
    if ( (iIdIndicador = iIndAbl)  and (fVlrAbl = 0)  ) or
       ( (iIdIndicador = iIndAlug) and (fVlrAlug = 0) ) then begin
      Result := False;
      sErro  := 'Apuracao OK';
      Exit;
    end;
  end;
end;

// -------------------------------------------------------------
// Procedure a ser executada a cada calculo de regra ( INTERNA )
// -------------------------------------------------------------
procedure TCtrlApuracao.OnResultRegra;
var fResult, fVlrApura : Extended;
    iIdImovel, iIdContrato, iIdIndicador, iMes, iAno, iNumApura : Integer;
    dApuracao : TDateTime;
    bApurado : Boolean;
begin
  // Grava o resultado da regra em IndApuracao
  fResult := StrToFloat(CtrlRegra.Result);
  if (not CtrlRegra.Error) and (fResult > 0) then begin

    iIdImovel    := CtrlRegra.ClientDataSetIn.FieldByName('IDIMOVEL').AsInteger;
    iIdContrato  := CtrlRegra.ClientDataSetIn.FieldByName('IDCONTRATO').AsInteger;
    iIdIndicador := cdsRegras.FieldByName('IDINDICADOR').AsInteger;
    iMes         := CtrlRegra.ClientDataSetIn.FieldByName('MESCOMPETENCIA').AsInteger;
    iAno         := CtrlRegra.ClientDataSetIn.FieldByName('ANOCOMPETENCIA').AsInteger;
    dApuracao    := StrToDate(CtrlRegra.ClientDataSetIn.FieldByName('DATAPURACAO').AsString);

    // Verifica se o indicador já foi apurado anteriormente ou possui valores diferentes
    bApurado := IndicadorApurado(-1, iIdImovel, iIdIndicador, -1, -1, iIdContrato,
                                 iMes, iAno, 'R', dApuracao, iNumApura, fVlrApura,'R');

    // Exclui a apuração anterior no caso de divergências com o valor atual
    if (bApurado) and (ComunsImobiliario.Arredonda(fVlrApura,2) <>
                       ComunsImobiliario.Arredonda(fResult  ,2) ) then begin
      ExcluiApuracao(iIdIndicador, iIdImovel, iIdContrato, iMes, iAno,
                     dApuracao, 'R', 'R', False );
      bApurado := False;
    end;

    // Registra a apuração
    if not bApurado then begin
      try
        with DbApuracao do begin
          Idimovel.AsInteger       := CtrlRegra.ClientDataSetIn.FieldByName('IDIMOVEL').AsInteger;
          Idindicador.AsInteger    := cdsRegras.FieldByName('IDINDICADOR').AsInteger;
          Idcontrato.AsInteger     := CtrlRegra.ClientDataSetIn.FieldByName('IDCONTRATO').AsInteger;
          MesCompetencia.AsInteger := CtrlRegra.ClientDataSetIn.FieldByName('MESCOMPETENCIA').AsInteger;
          AnoCompetencia.AsInteger := CtrlRegra.ClientDataSetIn.FieldByName('ANOCOMPETENCIA').AsInteger;
          DataApuracao.AsDateTime  := StrToDate(CtrlRegra.ClientDataSetIn.FieldByName('DATAPURACAO').AsString);
          TipoLanca.AsString       := 'R';
          Vlrapuracaonum.AsFloat   := fResult;
          Datainclusao.AsDateTime  := Date;
          Tipoinclusao.AsString    := 'R';
          FlgConciliado.AsString   := 'N';
        end;
        if not DbApuracao.Insert then raise Exception.Create( DbApuracao.MessageInfo );
      except
        on E : Exception do begin
          MessageInfo := E.Message;
          CtrlRegra.bFinalizarRegra := True;
        end;
      end;
    end;
  end;

  // Envia o identificador do registro processado para o Cliente
  DoProgresso([sBilheteRegra,
               'Apurando ' + cdsRegras.FieldByName('DESCRICAO').AsString + '...',
               CtrlRegra.ClientDataSetIn.RecNo, iTotRegRegra]);
end;


// -------------------------------------------------------------------------------------
// Monta o Sql de entrada para a regra com os dados de cada contrato vigente ( INTERNA )
// -------------------------------------------------------------------------------------
function TCtrlApuracao.BuscaDadosRegra(const iIdImovel,iIdContrato,iMes,iAno,iIdIndVenda,iIdIndAluguel:Integer;
                                       const dApuracao:TDateTime): OLEVariant;
var sSql, sParam1, sParam2, sDtIni, sDtFim: String;
begin
  sDtIni := '01/'+FormatFloat('00',iMes)+'/'+FormatFloat('0000',iAno);
  sDtFim := DiasUteis.UltimoDiaMes(sDtIni);

  // Define Parametros
  sParam1 := '';
  sParam2 := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND CL.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;
  if iIdContrato > 0 then begin
    sParam1 := sParam1 + ' AND CL.IDCONTRATO = ' + IntToStr(iIdContrato);
    sParam2 := sParam2 + ' AND AP.IDCONTRATO = ' + IntToStr(iIdContrato);
  end;

  // Define Sql
  sSql := ' SELECT CL.IDIMOVEL,   '+#13+
          '        CL.IDCONTRATO, '+#13+
                   IntToStr(iMes) + ' AS MESCOMPETENCIA, ' +#13+
                   IntToStr(iAno) + ' AS ANOCOMPETENCIA, ' +#13+
                   QuotedStr(FormatDateTime('DD/MM/YYYY',dApuracao)) + ' AS DATAPURACAO, '+#13+
          '       NVL(CL.PERALUGVARIAVEL,0) AS PERALUGVARIAVEL, '+#13+
          '       NVL(AM.VLRAPURACAO,0)     AS VLR_ALUGMIN,     '+#13+
          '       NVL(VE.VLRAPURACAO,0)     AS VLR_VENDAS       '+#13+
          '  FROM   '+#13+
          '       ( '+#13+
          '        SELECT CL.* '+#13+
          '          FROM INDCONTRATOLOJA CL '+#13+
          '         WHERE ( ( CL.DATINICIO  <= TO_DATE(' +QuotedStr(sDtIni)+ ')       '+#13+
          '                   AND CL.DATTERMINO >= TO_DATE(' +QuotedStr(sDtFim)+ ') ) '+#13+
          '               OR CL.FLGINDETERMINADO = ''S'' )'+#13+
          '           AND CL.TIPOCONTRATO IN(''A'',''S'',''Q'') ' + sParam1 +#13+
          '        ) CL, '+#13+
          '       (      '+#13+
          '        SELECT AP.IDCONTRATO, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP '+#13+
          '         WHERE AP.IDINDICADOR = ' + IntToStr(iIdIndVenda) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDCONTRATO, AP.IDINDICADOR '+#13+
          '        ) VE, '+#13+
          '       (      '+#13+
          '        SELECT AP.IDCONTRATO, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP '+#13+
          '         WHERE AP.IDINDICADOR = ' + IntToStr(iIdIndAluguel) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDCONTRATO, AP.IDINDICADOR '+#13+
          '        ) AM  '+#13+
          'WHERE CL.IDCONTRATO   = VE.IDCONTRATO(+) '+#13+
          '  AND CL.IDCONTRATO   = AM.IDCONTRATO(+) '+#13+
          'ORDER BY NOMCONTRATO ';

  Result := GetDataPacket( sSql );
end;


function TCtrlApuracao.BuscaDadosRegraGeral(const iIdImovel, iIdContrato, iMes, iAno: Integer; const dApuracao: TDateTime): OLEVariant;
var sSql: String;
begin
  // Define Sql
  sSql := ' SELECT ' + IntToStr(iIdImovel)   + ' AS IDIMOVEL,         '+#13+
                       IntToStr(iIdContrato) + ' AS IDCONTRATOIMOVEL, '+#13+
                       IntToStr(iMes)        + ' AS MESCOMPETENCIA, ' +#13+
                       IntToStr(iAno)        + ' AS ANOCOMPETENCIA, ' +#13+
                       QuotedStr(FormatDateTime('DD/MM/YYYY',dApuracao)) + ' AS DATAPURACAO '+#13+
          '   FROM DUAL ';
  Result := GetDataPacket( sSql );
end;



function TCtrlApuracao.BuscaDadosRegraHotel(const iIdImovel, iMes, iAno: Integer; const dApuracao: TDateTime): OLEVariant;
var sSql, sParam1, sParam2, sDtIni, sDtFim: String;
var iUltDia, iUltMes, iUltAno : Word;
begin
  { Tipos fixos de Hotel relacionados em INDINDICADOR.TIPOINDICADOR

      18 - UH´s do Hotel
      19 - UH´s Alugadas
      20 - UH´s Disponíveis
      21 - Nr. de Funcionarios
      22 - ROB ( Resultado Operacional Bruto )
  }

  sDtIni := '01/'+FormatFloat('00',iMes)+'/'+FormatFloat('0000',iAno);
  sDtFim := DiasUteis.UltimoDiaMes(sDtIni);
  DecodeDate(StrToDate(sDtFim),iUltAno,iUltMes,iUltDia);

  // Define Parametros
  sParam1 := '';
  sParam2 := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND CL.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;

  // Define Sql
  sSql := ' SELECT CH.IDIMOVEL,     '+#13+
          '        0 AS IDCONTRATO, '+#13+
                   IntToStr(iMes) + ' AS MESCOMPETENCIA, ' +#13+
                   IntToStr(iAno) + ' AS ANOCOMPETENCIA, ' +#13+
                   QuotedStr(FormatDateTime('DD/MM/YYYY',dApuracao)) + ' AS DATAPURACAO, '+#13+
          '        NVL(APTO.VLRAPURACAO,0) AS QTDE_UHAPTO, '+#13+
          '        NVL(ALUG.VLRAPURACAO,0) AS QTDE_UHALUG, '+#13+
          '        NVL(DISP.VLRAPURACAO,0) AS QTDE_UHDISP, '+#13+
          '        NVL(FUNC.VLRAPURACAO,0) AS QTDE_FUNC,   '+#13+
          '        NVL(ROB.VLRAPURACAO,0)  AS VLR_ROB      '+#13+
          '  FROM   '+#13+
          '       ( '+#13+
          '        SELECT CL.IDIMOVEL, CL.NOMCONTRATO '+#13+
          '          FROM INDCONTRATOLOJA CL '+#13+
          '         WHERE ( ( CL.DATINICIO  <= TO_DATE(' +QuotedStr(sDtIni)+ ')       '+#13+
          '                   AND CL.DATTERMINO >= TO_DATE(' +QuotedStr(sDtFim)+ ') ) '+#13+
          '               OR CL.FLGINDETERMINADO = ''S'' )'+#13+
          '           AND CL.TIPOCONTRATO = ''H'' ' + sParam1 +#13+
          '        ) CH, '+#13+
          '       (      '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, ' +#13+
          '               ( SUM(AP.VLRAPURACAONUM) / ' + IntToStr(iUltDia) + ' )  AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPOINDICADOR = 18 ' +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) APTO, '+#13+
          '       (      '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPOINDICADOR = 19 ' +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) ALUG, '+#13+
          '       (      '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPOINDICADOR = 20 ' +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) DISP, '+#13+
          '       (      '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPOINDICADOR = 21 ' +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) FUNC, '+#13+
          '       (      '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPOINDICADOR = 22 ' +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) ROB  '+#13+
          'WHERE CH.IDIMOVEL   = APTO.IDIMOVEL(+) '+#13+
          '  AND CH.IDIMOVEL   = ALUG.IDIMOVEL(+) '+#13+
          '  AND CH.IDIMOVEL   = DISP.IDIMOVEL(+) '+#13+
          '  AND CH.IDIMOVEL   = FUNC.IDIMOVEL(+) '+#13+
          '  AND CH.IDIMOVEL   = ROB.IDIMOVEL(+)  '+#13+
          'ORDER BY CH.NOMCONTRATO ';

  Result := GetDataPacket( sSql );
end;

procedure TCtrlApuracao.SetCdsApuracao(const Value: TCMClientDataSet);
begin
  FCdsApuracao := Value;
end;

procedure TCtrlApuracao.SetDbApuracao(const Value: TDbApuracao);
begin
  FDbApuracao := Value;
end;

procedure TCtrlApuracao.SetDbIndLote(const Value: TDbIndlote);
begin
  FDbIndLote := Value;
end;


end.
