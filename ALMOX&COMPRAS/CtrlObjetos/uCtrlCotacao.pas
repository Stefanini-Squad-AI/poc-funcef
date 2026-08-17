{ ------------------------------------------------------------------------------
Data      : 04.12.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 23860
Descrição : Implementação RAD+
---------------------------------------------------------------------------------
Data      : 25.09.2006
Autor     : Antonio Marcos (amf)
Pendência : 23138
Descrição : Trata o status do processo para evitar problemas na quantidade de Ocs
            geradas. As Ocs geradas, quando estão integradas com o sistema orçamentário,
            estão gerando mais compromissos que deveriam, afetando assim, o saldo
            da reserva orçamentária.
--------------------------------------------------------------------------------

//andre tavares - 05/10/2005 - pendência 20374 o codigo para criar compromisso não é mais necessário pois o compormisso já é criado no control ctrlOrdemCompra

// Marcio Motta - Pendência 19095 - 05/05/2005
// Várias Alterações referentes a Ordem de Compra com Cotação e geração de
// Compromissos diversos para uma Reserva.

// Marchetti - Pendencia 17241
// O processo de geraçào de compromisso estava gerando para o primeiro item da OC
// Alterei o local da geração

// Marchetti - Pendencia 17082
// Verificar o total aceito em relação ao valor da(s) reserva(s)
// ProcessaSelecao

// Marchetti - Pendencia 15659
// Várias rotinas implementadas para solução da pendência
// FMTSoliCompra, UCtrlOrcamento, uCtrlCotacao
--------------------------------------------------------------------------------}

unit uCtrlCotacao;

interface


// acertos gerais para compatibilização com fontes do Igor - FDias - 13.10.2003
//  OrdemCompra.GetItemOC( Sistema.IdEmpresa,NumOC ); inclusão de Sistema.IDEmpresa


Uses DB, uDataBase,uCmDbObject, uCmControlObject, sysUtils,
     dbclient, uSistema ,Classes, uCtrlRAD, uCtrlImpostoRetido,
     uDbCotacoes,uDbProcesso,uDbPrazoEntrega,uDbPrazoPgto,
     uDbValorAgregCot,uMidasUtil, jclMath, uCtrlOrdemCompra, uCMTypes,
     uFuncaoGeral, uCtrlOrcamento, uCtrlAlmoxCompra,
     // Marcio Motta - 19095 - 02/05/2005
     uCtrlReservaOrcamen, uFuncoesOrcamento,
     // Fim..............................

     uCtrlRADPlus, uCtrlRADConsModulos;

Const
    MSG_ARTIGO_SEM_SELECAO      = 'O.C. não pode ser gerada. Existem artigo(s) sem seleção : ';
    MSG_SCI_SEM_AUTORIZACA0     = 'O.C. não pode ser gerada. Existem Solicitações não autorizadas no R.A.D. . Processos/SCI´s : ';
    MSG_COTACAO_SEM_AUTORIZACA0 = 'O.C. não pode ser gerada. Cotação não autorizada no R.A.D. ';
Type
  TCtrlCotacao = class(TCmControlObject)

  Protected
    procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean);  Override;
    Procedure OnCreateAppServer; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbProcesso      : TDbProcesso;
    _DbCotacoes      : TDbCotacoes;
    _DbPrazoEntrega  : TDbPrazoEntrega;
    _DbPrazoPgto     : TDbPrazoPgto;
    _DbValorAgregCot : TDbValorAgregCot;
    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
    _OC            : TCtrlOrdemCompra;
    _RAD           : TCtrlRAD;
    RADPlus        : TCtrlRADPlus;
    RADConsultaCompras: TCtrlRADConsultaCompras;

    _ImpostoRetido : TCtrlImpostoRetido;
    _FuncaoGeral   : TFuncaoGeral;
    _Orcamento     : TOrcamentoBackMT;
    CtrlReservaOrcamen : TCtrlReservaOrcamen;

    _AlmoxCompras  : TCtrlAlmoxCompra;

    FcdsValorAgreg: TClientDataSet;
    FcdsPrazoPgto: TClientDataSet;
    FcdsPrazoEntrega: TClientDataSet;
    FcdsCotacao: TClientDataSet;
    FcdsSumario: TClientDataSet;
    FcdsValorAgregTela: TClientDataSet;
    FNumOC: Double;
    FNumOCFim: Double;
    procedure SetcdsCotacao(const Value: TClientDataSet);
    procedure SetcdsPrazoEntrega(const Value: TClientDataSet);
    procedure SetcdsPrazoPgto(const Value: TClientDataSet);
    procedure SetcdsValorAgreg(const Value: TClientDataSet);
    procedure SetcdsSumario(const Value: TClientDataSet);
    procedure SetcdsValorAgregTela(const Value: TClientDataSet);
    procedure SetNumOC(const Value: Double);
    procedure SetNumOCFim(const Value: Double);
    function  GetSCIOC( CodProcesso,IdProcxArt : Integer ) : OleVariant;


  Public
    Property cdsCotacao        : TClientDataSet read FcdsCotacao write SetcdsCotacao;
    Property cdsPrazoEntrega   : TClientDataSet read FcdsPrazoEntrega write SetcdsPrazoEntrega;
    Property cdsPrazoPgto      : TClientDataSet read FcdsPrazoPgto write SetcdsPrazoPgto;
    Property cdsValorAgreg     : TClientDataSet read FcdsValorAgreg write SetcdsValorAgreg;
    Property cdsSumario        : TClientDataSet read FcdsSumario write SetcdsSumario;
    property cdsValorAgregTela : TClientDataSet read FcdsValorAgregTela write SetcdsValorAgregTela;
    Property NumOC             : Double read FNumOC write SetNumOC;
    Property NumOCFim          : Double read FNumOCFim write SetNumOCFim;

    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;

    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------

    {**
       Grava as Cotações no banco de dados
    **}
    Function Gravar : Boolean;
    {**
       Busca as Cotacoes  existentes.
    **}
    Function Procurar( CodProcesso,IdProcxArt,Proposta,IdForCli,CodAlmoxarifado : Double ) : OleVariant;
    {**
       Lista os Fornecedores da Cotação
    **}
    Function ListFornecedor( CodProcesso : Double ) : OleVariant;
    {**
       Lista todos as observações feitas desde a SCI até a cotação
    **}
    Function ListObservacao(CodArtigo : String; CodProcesso,IdProcxArt : Double ) : OleVariant;
    {**
       Busca os Prazos de entrega da Cotação
    **}
    Function GetPrazoEntrega( CodProcesso,IdProcxArt,Proposta,IdForCli : Double ) : OleVariant;
    {**
       Busca os Prazos de Pagamento da Cotação
    **}
    Function GetPrazoPgto( CodProcesso,IdProcxArt,Proposta,IdForCli : Double ) : OleVariant;
    {**
       Busca os Custos Agregados da Cotação para gravar na base
    **}
    Function GetAgregados( CodProcesso,IdProcxArt,Proposta,IdForCli : Double ) : OleVariant;
    {**
       Busca os Custos Agregados da Cotação para mostrar na tela
    **}
    Function GetAgregadosTela(CodProcesso, IdProcxArt, Proposta,IdForCli: Double): OleVariant;
    {**
       Busca o último contato a do aquele fornecedor
    **}
    Function  LeUltContato( idForCli,idPessoa : Double ) : String;
    {**
       Valida os dados da cotacao
    **}
    Function  ValidaDadosCotacao : Boolean;
    {**
       Lista os Dados Fornecedores da Cotação
    **}
    Function ListDadosFornecedor( IdForCli : Double ) : OleVariant;
    {**
       Lista as últimos compras feitas naquele Fornecedor
    **}
    Function ListUltCompraForn( IdForCli : Double ) : OleVariant;
    {**
       Lista os itens em cotação
    **}
    Function ListItensSumario( CodProcesso : Double ) : OleVariant;
    {**
       Lista os resultados da cotação do item
    **}
    Function ListSumario( CodProcesso,IdProcxArt : Double ) : OleVariant;
    {**
      Calcula qual os valores presentes para indicação do melhor
      fornecedor
    **}
    Function CalculaSumario ( CodProcesso : Double ) : boolean;
    {**
      Verifica  se já foi feita/aceita a seleção dos fornecedores
      tanto pelo o sistema como pelo o usuário e atualiza os status
    **}
    Function ProcessaStatus ( CodProcesso : Double ) : boolean;
    {**
       Verifica se o Ordem de compra pode ser ser gerada
    **}
    Function PodeGerarOC( CodProcesso : Double; bUsaRAD : Boolean ) : boolean;
    {**
       Grava os status de cada item em relação ao fornecedor.
    **}
    Function GravaStatus(CodProcesso,IdProcxArt,Proposta,IdForCli : Double; Status,Justificatiava : String ) : boolean;
    {**
       Recebe a seleção dos fornecedores feitas pelo usuario e atualiza
       o status de cada item.
    **}
    Function ProcessaSelecao : boolean;
    {**
       Lista os dados do(s) vencedor(s) da cotação
    **}
    Function ListVencedor( CodProcesso : Double  ) : OleVariant;
    {**
       Lista os dados para associar a(s) Solicitação(s) de Compra ao item
       da Ordem de Compra em função do vencedor da cotação
    **}
    Function ListVencedorSCItemOC( CodProcesso, IdProcxArt, Proposta, IdForCli : Double  ) : OleVariant;
    {
     Fornece uma lista dos Vecendores da Cotação
    }
    Function SimulaVencedores( CodProcesso : Double ) : OleVariant;
    {**
       Gravação de Ordem de Compra para os vencedores da Cotação
    **}
    Function GeraOC( CodProcesso   : Double;
                     IdUsuario     : Double;
                     cdsCompl      : OleVariant;
                     ImprimiObsSCI : Boolean) : Boolean;

   {**
      Pega as Observações do item concatenandoas caso hoja mais de uma
   **}
   Function GetSomaObsSCI( IdProcxArt : Double  ) : String;


   function MsgOCsGeradas : string;
End;

implementation

{ TCtrlProcessoCompra }

procedure TCtrlCotacao.AfterInitialize;
begin
  inherited;
  _OC.InitializeAs(Self);
  _OC.OpenTransaction := False;

  _RAD.InitializeAs(Self);
  _ImpostoRetido.InitializeAs(Self);
  _FuncaoGeral.InitializeAs(Self);
  _Orcamento.InitializeAs(Self);
  CtrlReservaOrcamen.InitializeAs(Self);

  RADPlus.InitializeAs(Self);
  RADPlus.OpenTransaction := false;
  RADPlus.InitializeAs(Self);
  RADPlus.OpenTransaction := false;

  RADConsultaCompras := TCtrlRADConsultaCompras.Create;
  RADConsultaCompras.InitializeAS(Self);
end;

function TCtrlCotacao.CalculaSumario(CodProcesso : Double): boolean;
Var
  Msg         : String;
  Sql         : String;
  rValorAux   : Double;
  rValor      : Double;
  rAux        : Double;
  cAux        : Array [0..1] of Char;
  cdsAgreg    : TClientDataSet;
  cdsPrazoPg  : TClientDataSet;
  _cds        : TClientDataSet;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.CalculaSumario( CodProcesso );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
         cdsAgreg    := TClientDataSet.Create(nil);
         cdsPrazoPg  := TClientDataSet.Create(nil);
         _cds        := TClientDataSet.Create(nil);
         Try
            SQL := ' SELECT                  '+
                   '      C.IDFORCLI,        '+
                   '      C.IDPROCXART,      '+
                   '      C.CODPROCESSO,     '+
                   '      C.PROPOSTA,        '+
                   '      C.QTDEFORNECIDA,   '+
                   '      C.PRECO,           '+
                   '      C.CODMEDIDA,       '+
                   '      C.NUMCOT,          '+
                   '      C.STATUS,          '+
                   '      C.OBS,             '+
                   '      C.MOECODIGO,       '+
                   '      C.TXJUROS,         '+
                   '      C.IDITEMOC,        '+
                   '      C.CONTATO,         '+
                   '      C.PRECOAVALORPRES, '+
                   '      (C.PRECO * C.QTDEFORNECIDA) AS PRECOTOTAL  '+
                   ' FROM                    '+
                   '     COTACOES C          '+
                   ' WHERE                   '+
                   '       (C.CODPROCESSO  = '+FloatToStr(CodProcesso)+') '+
                   ' ORDER BY C.IDPROCXART, C.IDFORCLI, C.PROPOSTA ';

           _cds.Data := GetDataPacket( SQL );

           _cds.First;
           While Not _cds.EOF Do
              Begin
                 If (_cds.FieldByName('PRECO').IsNull) or (_cds.FieldByName('PRECO').AsFloat <= 0) Then
                    Begin
                      _cds.Edit;
                      _cds.FieldByName('PRECOAVALORPRES').Clear;
                      _cds.Post;
                    End
                 Else
                    Begin
                        rValorAux := _cds.FieldByName('PRECO').AsFloat*_cds.FieldByName('QTDEFORNECIDA').AsFloat;
                        //----------------------------------------------------------------------------------------------------------------
                        // Calcula incidencia de custos agregado (Encargos)
                        //----------------------------------------------------------------------------------------------------------------
                        cdsAgreg.Data := GetAgregados( _cds.FieldByName('CODPROCESSO').asFloat,
                                                       _cds.FieldByName('IDPROCXART').asFloat,
                                                       _cds.FieldByName('PROPOSTA').asFloat,
                                                       _cds.FieldByName('IDFORCLI').asFloat);

                        cdsAgreg.First;
                        While Not cdsAgreg.EOF Do
                            Begin
                               StrPcopy(cAux,cdsAgreg.FieldByName('CODTRATFISCE').AsString);
                               If cAux[0] in ['1','3','4','5','9','A'] Then
                                  rValorAux := rValorAux + cdsAgreg.FieldByName('VALOR').AsFloat
                               Else
                                  If cAux[0] in ['2','6'] Then
                                     rValorAux := rValorAux - cdsAgreg.FieldByName('VALOR').AsFloat;
                               cdsAgreg.Next;
                            End;
                        //----------------------------------------------------------------------------------------------------------------
                        // Converte o valor para a moeda corrente
                        //----------------------------------------------------------------------------------------------------------------
                        If Not _cds.FieldByName('MOECODIGO').IsNull Then
                           rValorAux := rValorAux * _FuncaoGeral.TestaCotacaoMoeda(_Cds.FieldByName('MOECODIGO').AsInteger,DateToStr(Date),'N');

                        rValorAux := rValorAux / _cds.FieldByName('QTDEFORNECIDA').AsFloat;

                        rValor := 0;
                        //----------------------------------------------------------------------------------------------------------------
                        // Calcula fórmula de prazo de pagamento
                        //----------------------------------------------------------------------------------------------------------------
                        cdsPrazoPg.Data := GetPrazoPgto( _cds.FieldByName('CODPROCESSO').asFloat,
                                                         _cds.FieldByName('IDPROCXART').asFloat,
                                                         _cds.FieldByName('PROPOSTA').asFloat,
                                                         _cds.FieldByName('IDFORCLI').asFloat);

                        cdsPrazoPg.First;
                        While Not cdsPrazoPg.EOF Do
                            Begin
                               rAux   := Power((1 + (_cds.FieldByName('TXJUROS').AsFloat/100)) , (cdsPrazoPg.FieldByName('PRAZOPGTO').AsFloat/30));
                               rValor := rValor + ((rValorAux * (cdsPrazoPg.FieldByName('PERCENT').AsFloat/100)) / rAux);
                               cdsPrazoPg.Next;
                            End;

                        _cds.Edit;
                        If cdsPrazoPg.IsEmpty Then
                           _cds.FieldByName('PRECOAVALORPRES').AsFloat := rValorAux
                        Else
                           _cds.FieldByName('PRECOAVALORPRES').AsFloat := rValor;

                        _cds.Post;
                    End;

                 _cds.Next;

              End;

            Try
               StartTransaction;

               Result := ApplyCds(_cds,_DbCotacoes,[],[] );
               Msg    := _DbCotacoes.MessageInfo;
               If Not Result Then Raise Exception.Create(Msg);

               Sql := ' UPDATE PROCESSO SET STATUS = ''S'' '+
                      ' WHERE (CODPROCESSO = '+FloatToStr( CodProcesso )+') ';
               If Not ExecSQL( Sql ) Then
                  Raise Exception.Create(MessageInfo);

               //Verifica os status
               OpenTransaction := False;

               Result := ProcessaStatus(CodProcesso);
               Msg    := Self.MessageInfo;
               If Not Result Then Raise Exception.Create(Msg);

               OpenTransaction := True;

               Commit;
            Except
               On E:Exception Do
                Begin
                   Rollback;
                   Result := False;
                   MessageInfo := E.Message;
                End;
            End;
         Finally
            cdsAgreg.Free;
            cdsPrazoPg.Free;
            _cds.Free;
         End;
     End;
end;

constructor TCtrlCotacao.Create;
begin
  inherited;
  _DbProcesso      := TDbProcesso.Create(Self);
  _DbCotacoes      := TDbCotacoes.Create(Self);
  _DbPrazoEntrega  := TDbPrazoEntrega.Create(Self);
  _DbPrazoPgto     := TDbPrazoPgto.Create(Self);
  _DbValorAgregCot := TDbValorAgregCot.Create(Self);
  //
  _OC              := TCtrlOrdemCompra.Create;
  _RAD             := TCtrlRAD.Create;

  RADPlus          := TCtrlRADPlus.Create;

  _ImpostoRetido   := TCtrlImpostoRetido.Create;
  _FuncaoGeral     := TFuncaoGeral.Create;
  _Orcamento       := TOrcamentoBackMT.Create;
  _AlmoxCompras    := TCtrlAlmoxCompra.Create;
  CtrlReservaOrcamen := TCtrlReservaOrcamen.Create;

end;

destructor TCtrlCotacao.Destroy;
begin
  if IsAppServer Then
      FreeCds([FcdsValorAgreg,FcdsPrazoPgto,
               FcdsPrazoEntrega,FcdsCotacao,FcdsSumario,FcdsValorAgregTela]);

  _DbProcesso.Free;
  _DbCotacoes.Free;
  _DbPrazoEntrega.Free;
  _DbPrazoPgto.Free;
  _DbValorAgregCot.Free;

  _OC.Free;
  _RAD.Free;

  FreeAndNil(RADPlus);
  FreeAndNil(RADConsultaCompras);

  _ImpostoRetido.Free;
  _FuncaoGeral.Free;
  _Orcamento.Free;
  _AlmoxCompras.Free;
  CtrlReservaOrcamen.Free;
  inherited;
end;

procedure TCtrlCotacao.DoChangeDataBase;
begin
  inherited;
  _DbProcesso.DataBaseName      := DataBaseName;
  _DbCotacoes.DataBaseName      := DataBaseName;
  _DbPrazoEntrega.DataBaseName  := DataBaseName;
  _DbPrazoPgto.DataBaseName     := DataBaseName;
  _DbValorAgregCot.DataBaseName := DataBaseName;
end;

function TCtrlCotacao.GeraOC(CodProcesso,IdUsuario: Double; cdsCompl : OleVariant; ImprimiObsSCI : Boolean ) : Boolean;
Var
  SQL               : String;
  x, i              : Integer;
  rIdForCli         : Double;
  rIdPessoa         : Double;
  rProposta         : Double;
  rValorOC          : Double;
  rReserva          : Integer;

  cAux              : Array [0..1] of Char;
  cdsWins           : TClientDataSet;
  cdsWinEnt         : TClientDataSet;
  cdsWinPag         : TClientDataSet;
  cdsWinAgreg       : TClientDataSet;
  cdsWinSCItemOC    : TClientDataSet;
  cdsOC             : TClientDataSet;
  cdsItemOC         : TClientDataSet;
  cdsAgregItemOC    : TClientDataSet;
  cdsPrazoPgtoOC    : TClientDataSet;
  cdsPrazoEntregaOC : TClientDataSet;
  cdsSCItemOC       : TClientDataSet;
  cdsComplOC        : TClientDataSet;
  cdsSCIOC          : TClientDataSet;
  cdsAux            : TClientDataSet;


  iCodProcesso      : Int64;
  iProcXArt         : Int64;

  iIDItemOC         : Extended;
  iNumCompromisso   : Int64;
  iIdCompromisso    : Int64;
  iNumReserva       : Int64;
  iNumReservaAnt    : Int64;
  iOrcament         : Array [0..100] of LongInt;
  aCompromisso      : Array of LongInt;
  aValCompromisso   : Array of Extended;

  fMargemOC         : Extended;
  fTotalReserva     : Extended;
  fTotalCompra      : Extended;
  bIntegraOrc       : Boolean;

  sMensCompromisso  : String;

  ListaReservas     : TStringList;
  ListaVlrReservas  : TStringList;

begin
   Result := True;
   _Orcamento.IdEmpresa := Sistema.IdEmpresa;

   sMensCompromisso := '';
   _OC.ListaMsgComp.Clear;
   _OC.ListaMsgOC.Clear;

   for x := 0 to 100 do iOrcament[x] := 0;

   iNumCompromisso   := -1;
   iIdCompromisso    := -1;

   cdsWins           := TClientDataSet.Create(nil);
   cdsWinEnt         := TClientDataSet.Create(nil);
   cdsWinPag         := TClientDataSet.Create(nil);
   cdsWinAgreg       := TClientDataSet.Create(nil);
   cdsWinSCItemOC    := TClientDataSet.Create(nil);
   cdsOC             := TClientDataSet.Create(nil);
   cdsItemOC         := TClientDataSet.Create(nil);
   cdsAgregItemOC    := TClientDataSet.Create(nil);
   cdsPrazoPgtoOC    := TClientDataSet.Create(nil);
   cdsPrazoEntregaOC := TClientDataSet.Create(nil);
   cdsSCItemOC       := TClientDataSet.Create(nil);
   cdsComplOC        := TClientDataSet.Create(nil);
   cdsSCIOC          := TClientDataSet.Create(nil);
   cdsAux            := TClientDataSet.Create(nil);

   Self.MessageInfo  := '';

   cdsAux.Data  := GetDataPacket('SELECT FLGORCAMENTO, NVL(FLGMARGEMOC,0) AS FLGMARGEMOC FROM PARAMCOMPRAS WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   fMargemOC    := (1 + (cdsAux.FieldByName('FLGMARGEMOC').AsFloat / 100));
   bIntegraOrc  := (cdsAux.FieldByNAme('FLGORCAMENTO').AsString = 'S');

   iNumReservaAnt := 0;
   Try
      Try
         //------------------------------------------------------------------------
         // Inicializa os cds´s da OC
         //------------------------------------------------------------------------
         cdsOC.Data             := _OC.ListOC(-1);
         cdsItemOC.Data         := _OC.GetItemOC(Sistema.IdEmpresa,-1);
         cdsAgregItemOC.Data    := _OC.GetAgregItemOC(-1);
         cdsPrazoPgtoOC.Data    := _OC.GetPrazoPgtoOC(-1);
         cdsPrazoEntregaOC.Data := _OC.GetPrazoEntregaOC(-1);
         cdsSCItemOC.Data       := _OC.GetSCItemOC(-1);
         cdsComplOC.Data        := cdsCompl;

         _OC.cdsOC             := cdsOC;
         _OC.cdsItemOC         := cdsItemOC;
         _OC.cdsAgregItemOC    := cdsAgregItemOC;
         _OC.cdsPrazoEntregaOC := cdsPrazoEntregaOC;
         _OC.cdsPrazoPgtoOC    := cdsPrazoPgtoOC;
         _OC.cdsSCItemOC       := cdsSCItemOC;

         //Pega os vencedores do Processo de Cotação
         cdsWins.Data := ListVencedor(CodProcesso);

         if bIntegraOrc then
           begin
             // Crias as StringList's para calcular o valor total de cada Reserva
             ListaReservas            := TStringList.Create;
             ListaVlrReservas         := TStringList.Create;
             ListaReservas.Sorted     := True;
             ListaReservas.Duplicates := dupIgnore;

             // Percorre o CdsWins para buscar as reservas existentes
             // e adiciona na StringList
             cdsWins.First;

             if cdsWins.FieldByName('IDRESERVAORCAMEN').IsNull then
               begin
                 Self.MessageInfo := ('Para integração com o sistema de Orçamento, ' +#13+
                                      'é necessário informar o número da Reserva '  +#13+
                                      'no ato da Solicitação de Compra.');

                 Raise Exception.Create(Self.MessageInfo);
               end;

             while not cdsWins.Eof do
               begin
                 ListaReservas.Add(cdsWins.FieldByName('IDRESERVAORCAMEN').AsString);
                 cdsWins.Next;
               end;

             // Percorre a StringList para pegar cada Reserva e fazer o somatório
             // no CdsWins para saber o total de compra em cada Reserva
             for i := 0 to ListaReservas.Count - 1 do
               begin
                 // Aplica o filtro no CdsWins para exibir somente os registros
                 // que possuem a Reserva atual
                 cdsWins.First;
                 cdsWins.Filter   := 'IDRESERVAORCAMEN=' + ListaReservas[i];
                 cdsWins.Filtered := True;

                 // Soma o valor total gasto em cada reserva
                 fTotalReserva := 0;
                 while not cdsWins.Eof do
                   begin
                     fTotalReserva := fTotalReserva + (cdsWins.FieldByName('VALOR').AsFloat * cdsWins.FieldByName('QTDEOC').AsFloat);
                     cdsWins.Next;
                   end;

                 // Guarda o valor gasto em uma segunda StringList.
                 ListaVlrReservas.Add(FloatToStr(fTotalReserva));
                 cdsWins.Filtered := False;
               end;

             cdsWins.First;
             fTotalReserva := 0;

             // Verifica se existe alguma Reserva que não tenha SALDO suficiente
             // para concluir o processo
             for i := 0 to ListaReservas.Count - 1 do
               begin
                 if StrToFloat(ListaVlrReservas[i]) > (fMargemOC * CtrlReservaOrcamen.SaldoReserva(StrToInt(ListaReservas[i]))) then
                   begin
                     Self.MessageInfo := ('O valor da Reserva ' + IntToStr(_Orcamento.BuscaIdNumReserva(StrToInt(ListaReservas[i]), 0, False)) + ' é inferior ao valor' +#13+
                                          'da Solicitação de Compra');

                     Raise Exception.Create(Self.MessageInfo);
                   end;
               end;

           end; // if bIntegraOrc

         _OC.ListaMsgComp.Clear;


         cdsWins.First;
         If Not cdsWins.IsEmpty Then
           Begin
              StartTransaction;

              rIdForCli := 0;
              rIdPessoa := 0;
              rProposta := 0;
              rReserva  := 0;

              While Not cdsWins.EOF DO
                // Passo 1
                Begin
                   rValorOC := 0;

                   // Passo 1-A
                   If (Not FloatsEqual(cdsWins.FieldByName('IDFORCLI').AsFloat,rIdForCli) ) Or
                      (Not FloatsEqual(cdsWins.FieldByName('IDPESSOA').AsFloat,rIdPessoa) ) Or
                      (Not FloatsEqual(cdsWins.FieldByName('PROPOSTA').AsFloat,rProposta)) then
                     begin
                        // Passo 1-A-1
                        //--------------------------------------------------------------------------------------
                        // Verifica se o processo já foi autorizado no R.A.D.
                        //--------------------------------------------------------------------------------------
                        _Cds.Data := GetDataPacket('SELECT IDPROCESSO FROM PROCESSO WHERE (CODPROCESSO = '+FloatToStr(CodProcesso)+')');

                        if not _Cds.FieldByName('IDPROCESSO').IsNull then
                        begin
                           if (Sistema.VersaoRAD = '+') then
                           begin
                              if (not RadPlus.ProcessoConcluido(_Cds.FieldByName('IDPROCESSO').AsInteger)) then
                                 Raise Exception.Create( MSG_COTACAO_SEM_AUTORIZACA0 );
                           end
                           else
                           begin
                             _Cds.Data := GetDataPacket('SELECT IDPROCESSO, FLGOK FROM RADINSTPROCESSO WHERE (IDPROCESSO = '+_Cds.FieldByName('IDPROCESSO').AsString+')');

                             If _Cds.FieldByName('FLGOK').AsString <> 'S' Then Raise Exception.Create( MSG_COTACAO_SEM_AUTORIZACA0 );
                           end;
                        end;

                        //--------------------------------------------------------------------------------------


                        // Passo 1-A-2
                        //--------------------------------------------------------------------------------------
                        // Grava a Ordem de Compra ( O.C.)
                        //--------------------------------------------------------------------------------------
                        cdsOC.Append;
                        cdsOC.FieldByName('NUMOC').AsInteger        := GetNextID;
                        cdsOC.FieldByName('IDFORCLI').AsFloat       := cdsWins.FieldByName('IDFORCLI').AsFloat;
                        cdsOC.FieldByName('IDPESSOA').AsFloat       := cdsWins.FieldByName('IDPESSOA').AsFloat;
                        cdsOC.FieldByName('OCATENDIDA').AsString    := 'F';
                        cdsOC.FieldByName('FLGIMPRESSA').AsString   := 'F';
                        cdsOC.FieldByName('FLGCOMSEMOC').AsString   := 'C';
                        cdsOC.FieldByName('FLGCOMSEMCOT').AsString  := 'C';
                        cdsOC.FieldByName('DATAOC').AsDateTime      := Date;

                        if not _Cds.FieldByName('IDPROCESSO').IsNull  then
                           cdsOC.FieldByName('IDPROCESSO').AsFloat     := _Cds.FieldByName('IDPROCESSO').AsInteger;

                        cdsOC.FieldByName('OBSOC').AsString         := cdsComplOC.FieldByName('OBSOC').AsString;
                        cdsOC.FieldByName('FLGTIPOFRETE').asInteger := cdsComplOC.FieldByName('FLGTIPOFRETE').asInteger;
                        If Not cdsComplOC.Eof Then cdsComplOC.Next;

                        cdsOC.FieldByName('CONTATO').asString       := cdsWins.FieldByName('CONTATO').asString;

                        cdsOC.Post;
                     end; // Fim do Passo 1-A



                   fTotalReserva := 0;
                   fTotalCompra  := 0;


                   iIdCompromisso := 0;

                   rIdForCli := cdsWins.FieldByName('IDFORCLI').AsFloat;
                   rIdPessoa := cdsWins.FieldByName('IDPESSOA').AsFloat;
                   rProposta := cdsWins.FieldByName('PROPOSTA').AsFloat;
                   rReserva  := cdsWins.FieldByName('IDRESERVAORCAMEN').AsInteger;

                   For x := 0 to 100 do
                     iOrcament[x] := 0;

                   while FloatsEqual(cdsWins.FieldByName('IDFORCLI').AsFloat, rIdForCli) and
                         FloatsEqual(cdsWins.FieldByName('IDPESSOA').AsFloat, rIdPessoa) and
                         FloatsEqual(cdsWins.FieldByName('PROPOSTA').AsFloat, rProposta) and
                         FloatsEqual(cdsWins.FieldByName('IDRESERVAORCAMEN').AsInteger, rReserva) and
                         (not cdsWins.Eof) do
                     begin
                        iIDItemOC := GetSequence('ITEMOC');

                        cdsItemOC.Append;
                        cdsItemOC.FieldByName('NUMOC').AsFloat             := cdsOC.FieldByName('NUMOC').AsFloat;
                        cdsItemOC.FieldByName('CODPROCESSO').AsFloat       := CodProcesso;
                        cdsItemOC.FieldByName('IDPROCXART').AsFloat        := cdsWins.FieldByName('IDPROCXART').AsFloat;
                        cdsItemOC.FieldByName('IDFORCLI').AsFloat          := cdsWins.FieldByName('IDFORCLI').AsFloat;
                        cdsItemOC.FieldByName('PROPOSTA').AsFloat          := cdsWins.FieldByName('PROPOSTA').AsFloat;
                        cdsItemOC.FieldByName('IDITEMOC').AsFloat          := iIDItemOC;
                        cdsItemOC.FieldByName('CODARTIGO').AsString        := cdsWins.FieldByName('CODARTIGO').AsString;
                        cdsItemOC.FieldByName('CODGRUPOPROD').AsString     := cdsWins.FieldByName('CODGRUPOPROD').AsString;
                        cdsItemOC.FieldByName('CODMEDIDA').AsString        := cdsWins.FieldByName('CODMEDIDA').AsString;
                        cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat        := cdsWins.FieldByName('QTDEOC').AsFloat;

                        cdsItemOC.FieldByName('IDRESERVAORCAMEN').AsFloat := 0;

                        If (cdsWins.FieldByName('IDPRODVARI').IsNull) Or (cdsWins.FieldByName('IDPRODVARI').AsInteger <= 0) Then
                           cdsItemOC.FieldByName('IDPRODVARI').Clear
                        Else
                           cdsItemOC.FieldByName('IDPRODVARI').AsInteger := cdsWins.FieldByName('IDPRODVARI').AsInteger;

                        cdsItemOC.FieldByName('OBSITEMOC').AsString      := cdsWins.FieldByName('OBS').AsString;

                        //---------------------------------------------------------------------------------------------------
                        // Converte a cotação para a moeda padrão
                        //---------------------------------------------------------------------------------------------------
                        If Not cdsWins.FieldByName('MOECODIGO').IsNull Then
                           cdsItemOC.FieldByName('VALORUN').AsFloat := cdsWins.FieldByName('VALOR').AsFloat * _FuncaoGeral.TestaCotacaoMoeda(cdsWins.FieldByName('MOECODIGO').AsInteger,DateToStr(Date),'N')
                        Else
                           cdsItemOC.FieldByName('VALORUN').AsFloat := cdsWins.FieldByName('VALOR').AsFloat;
                        //---------------------------------------------------------------------------------------------------
                        cdsItemOC.FieldByName('FLGITEMATENDIDO').AsString  := 'F';

                        If ImprimiObsSCI Then
                           cdsItemOC.FieldByName('OBSITEMOC').AsString := GetSomaObsSCI(cdsWins.FieldByName('IDPROCXART').AsFloat)
                        Else
                           cdsItemOC.FieldByName('OBSITEMOC').Clear;

                        cdsItemOC.Post;
                        // FIM DA GRAVAÇÃO - ITEM OC


                        rValorOC := rValorOC + (cdsWins.FieldByName('QTDEOC').AsFloat * cdsWins.FieldByName('VALOR').AsFloat);

                        // Passo 1-B-2
                        //--------------------------------------------------------------------------------------
                        // Grava os prazos de Entrega para os Itens da O.C.
                        //--------------------------------------------------------------------------------------
                        cdsWinEnt.Data := GetPrazoEntrega(cdsWins.FieldByName('CODPROCESSO').AsFloat,
                                                          cdsWins.FieldByName('IDPROCXART').AsFloat,
                                                          cdsWins.FieldByName('PROPOSTA').AsFloat,
                                                          cdsWins.FieldByName('IDFORCLI').AsFloat);
                        // Verifica se a Cotação possui prazo de Entrega
                        If cdsWinEnt.IsEmpty Then
                          Begin
                             Raise Exception.Create('OC não possui Prazo de Entrega. Proibido gerar OC.'+Char(13)+
                                                    'Fornecedor : ' + cdsWins.FieldByName('RAZAOSOCIAL').AsString +Char(13)+
                                                    'Artigo     : ' + cdsWins.FieldByName('DESCPROD').AsString);
                          End;

                        cdsWinEnt.First;
                        x := 0;

                        While Not cdsWinEnt.EOF Do
                          Begin
                             Inc( x );
                             cdsPrazoEntregaOC.Append;
                             cdsPrazoEntregaOC.FieldByName('IDITEMOC').AsFloat         := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
                             cdsPrazoEntregaOC.FieldByName('PARCELAENTREGA').AsInteger := x;
                             cdsPrazoEntregaOC.FieldByName('PRAZOENTREGA').AsInteger   := cdsWinEnt.FieldByName('PRAZOENT').AsInteger;
                             cdsPrazoEntregaOC.FieldByName('QTDEENTREGA').AsFloat      := (cdsWinEnt.FieldByName('QTDEENT').AsFloat * cdsWins.FieldByName('QTDEOC').AsFloat)/cdsWins.FieldByName('QTDEFORNECIDA').AsFloat;
                             cdsPrazoEntregaOC.FieldByName('PERIODOPRAZO').AsString    := cdsWinEnt.FieldByName('PERIODOPRAZO').AsString;
                             cdsPrazoEntregaOC.FieldByName('DATAENTREGA').AsDateTime   := cdsWinEnt.FieldByName('DATAENT').AsDateTime;
                             cdsPrazoEntregaOC.Post;

                             cdsWinEnt.Next;
                          End;

                        // Passo 1-B-3
                        //--------------------------------------------------------------------------------------
                        // Grava os prazos de Pagamento para os Itens da O.C.
                        //--------------------------------------------------------------------------------------
                        cdsWinPag.Data := GetPrazoPgto(cdsWins.FieldByName('CODPROCESSO').AsFloat,
                                                       cdsWins.FieldByName('IDPROCXART').AsFloat,
                                                       cdsWins.FieldByName('PROPOSTA').AsFloat,
                                                       cdsWins.FieldByName('IDFORCLI').AsFloat);

                        // Verifica se a Cotação possui prazo de Pagamento
                        If cdsWinPag.IsEmpty Then
                          Begin
                             Raise Exception.Create('OC não possui Prazo de Pagamento. Proibido gerar OC.'+Char(13)+
                                                    'Fornecedor : ' + cdsWins.FieldByName('RAZAOSOCIAL').AsString +
                                                    'Artigo     : ' + cdsWins.FieldByName('DESCPROD').AsString);

                          End;

                        cdsWinPag.First;
                        x := 0;

                        While Not cdsWinPag.EOF Do
                          Begin
                             Inc( x );
                             cdsPrazoPgtoOC.Append;
                             cdsPrazoPgtoOC.FieldByName('IDITEMOC').AsFloat       := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
                             cdsPrazoPgtoOC.FieldByName('PARCELAPGTO').AsInteger  := x;
                             cdsPrazoPgtoOC.FieldByName('PRAZOPGTO').AsInteger    := cdsWinPag.FieldByName('PRAZOPGTO').AsInteger;
                             cdsPrazoPgtoOC.FieldByName('PERIODOPRAZO').AsString  := cdsWinPag.FieldByName('PERIODOPRAZO').AsString;
                             cdsPrazoPgtoOC.FieldByName('PERCPAGTO').AsFloat      := cdsWinPag.FieldByName('PERCENT').AsFloat;
                             cdsPrazoPgtoOC.FieldByName('DATAPAGTO').AsDateTime   := cdsWinPag.FieldByName('DATAPGTO').AsDateTime;
                             cdsPrazoPgtoOC.Post;
                             cdsWinPag.Next;
                          end;


                        // Passo 1-B-4
                        //--------------------------------------------------------------------------------------
                        // Grava os custos Agregados da cotação  para os Itens da O.C.
                        //--------------------------------------------------------------------------------------
                        cdsWinAgreg.Data := GetAgregados(cdsWins.FieldByName('CODPROCESSO').AsFloat,
                                                         cdsWins.FieldByName('IDPROCXART').AsFloat,
                                                         cdsWins.FieldByName('PROPOSTA').AsFloat,
                                                         cdsWins.FieldByName('IDFORCLI').AsFloat);

                        cdsWinAgreg.First;

                        While Not cdsWinAgreg.EOF Do
                          Begin
                             cdsAgregItemOC.Append;
                             cdsAgregItemOC.FieldByName('IDITEMOC').AsFloat           := cdsItemOC.FieldByName('IDITEMOC').asFloat;
                             cdsAgregItemOC.FieldByName('CODTIPOCUSTAGREG').AsInteger := cdsWinAgreg.FieldByName('CODTIPOCUSTAGREG').AsInteger;
                             cdsAgregItemOC.FieldByName('ALIQUOTA').AsFloat           := cdsWinAgreg.FieldByName('PERCENT').AsFloat;
                             cdsAgregItemOC.FieldByName('BASECALCULO').AsFloat        := cdsWinAgreg.FieldByName('BASECALCULO').AsFloat;
                             cdsAgregItemOC.FieldByName('VLRAGREGITEM').AsFloat       := cdsWinAgreg.FieldByName('VALOR').AsFloat;
                             cdsAgregItemOC.Post;
                             StrPcopy(cAux,cdsWinAgreg.FieldByName('CODTRATFISCE').AsString);
                             If cAux[0] in ['1','3','4','5','9','A'] Then
                                rValorOC := rValorOC + cdsAgregItemOC.FieldByName('VLRAGREGITEM').AsFloat
                             Else
                                If cAux[0] = '6' Then
                                   rValorOC := rValorOC - cdsAgregItemOC.FieldByName('VLRAGREGITEM').AsFloat;
                             cdsWinAgreg.Next;
                          End;


                        // Passo 1-B-5
                        //-------------------------------------------------------------------------------------
                        // Grava a associação ds S.C.I. x Itens da O.C.
                        //--------------------------------------------------------------------------------------
                        cdsWinSCItemOC.Data := ListVencedorSCItemOC(cdsWins.FieldByName('CODPROCESSO').AsFloat,
                                                                    cdsWins.FieldByName('IDPROCXART').AsFloat,
                                                                    cdsWins.FieldByName('PROPOSTA').AsFloat,
                                                                    cdsWins.FieldByName('IDFORCLI').AsFloat);

                        cdsWinSCItemOC.First;

                        While Not cdsWinSCItemOC.EOF Do
                          Begin
                             cdsSCItemOC.Append;
                             cdsSCItemOC.FieldByName('IDITEMOC').AsFloat     := iIDItemOC;
                             cdsSCItemOC.FieldByName('NUMSOLCOMPRA').AsFloat := cdsWinSCItemOC.FieldByName('NUMSOLCOMPRA').AsFloat;
                             cdsSCItemOC.FieldByName('IDITEMSOLI').AsFloat   := cdsWinSCItemOC.FieldByName('IDITEMSOLI').AsFloat;
                             cdsSCItemOC.Post;
                             cdsWinSCItemOC.Next;
                          End;

                        cdsOC.Edit;
                        cdsOC.FieldByName('VALOROC').AsFloat := cdsOC.FieldByName('VALOROC').AsFloat + rValorOC;
                        cdsOC.Post;

                        fTotalCompra := fTotalCompra  + (cdsWins.FieldByName('QTDEOC').AsFloat * cdsWins.FieldByName('VALOR').AsFloat);

                        cdsWins.Next;
                     end;
                     // Fim do Passo 1-B



                   // Passo 1-C
                   x := 0;
                   // Pendencia 17241 - Cria o compromisso para a reserva
                   if (cdsWins.FieldByName('IDRESERVAORCAMEN').AsInteger <> rReserva) or
                      (cdsWins.Eof) then
                     begin
                        iNumReserva := _Orcamento.BuscaIdNumReserva(rReserva, 0, True);

                        // Passo 1-C-1
                        if iNumReserva > 0 Then
                          begin

                            iOrcament[x] := iNumReserva;
                            cdsAux.Close;
                            cdsAux.Data := GetDataPacket('SELECT NVL(VLRRESERVA,0) AS VLRRESERVA ' + #13 +
                                                         'FROM RESERVAORCAMEN '    + #13 +
                                                         'WHERE NUMRESERVA = ' + IntToSTr(iNumReserva));

                            fTotalReserva := cdsAux.FieldByName('VLRRESERVA').AsFloat;
                            Inc(x);

                            //   end;
                          end;


                        // Passo 1-C-2
                        if (bIntegraOrc) and (fTotalCompra > (fTotalreserva * fMargemOC))  then
                          begin
                             Self.MessageInfo := 'Valor da OC não pode ser superior a ' + FormatFloat('###,###,##0.00',(fTotalReserva * fMargemOC));
                             Raise Exception.Create( Self.MessageInfo );
                          end;


                     end;
                     // Fim do Passo 1-C



                   // Passo 1-D
                   // Caso mude o fornecedor ou a empresa deve ser gerada uma nova Ordem de Compra
                   If (Not FloatsEqual(cdsWins.FieldByName('IDFORCLI').AsFloat,rIdForCli) ) Or
                      (Not FloatsEqual(cdsWins.FieldByName('IDPESSOA').AsFloat,rIdPessoa) ) Or
                      (Not FloatsEqual(cdsWins.FieldByName('PROPOSTA').AsFloat,rProposta )) Or
                      (cdsWins.Eof) Then
                     Begin

                        // Passo 1-D-1
                        //----------------------------------------------------------------------------------------------------
                        // Gerando a O.C.
                        //----------------------------------------------------------------------------------------------------
                        If Not _OC.Gravar( IdUsuario ) Then
                           Raise Exception.Create(_OC.MessageInfo);

                         sMensCompromisso := MsgOCsGeradas;
                         Self.MessageInfo := sMensCompromisso;

                         Self.NumOC    := _OC.NumOC;
                         Self.NumOCFim := _OC.NumOCFim;

                         // Passo 1-D-2
                         //------------------------------------------------------------------------
                         // Inicializa os cds´s da OC
                         //------------------------------------------------------------------------
                         iIdCompromisso := 0;
                         fTotalCompra   := 0;
                         fTotalreserva  := 0;

                         cdsOC.Data             := _OC.ListOC(-1);
                         cdsItemOC.Data         := _OC.GetItemOC(Sistema.IdEmpresa,-1);
                         cdsAgregItemOC.Data    := _OC.GetAgregItemOC(-1);
                         cdsPrazoPgtoOC.Data    := _OC.GetPrazoPgtoOC(-1);
                         cdsPrazoEntregaOC.Data := _OC.GetPrazoEntregaOC(-1);
                         cdsSCItemOC.Data       := _OC.GetSCItemOC(-1);

                         _OC.cdsOC             := cdsOC;
                         _OC.cdsItemOC         := cdsItemOC;
                         _OC.cdsAgregItemOC    := cdsAgregItemOC;
                         _OC.cdsPrazoEntregaOC := cdsPrazoEntregaOC;
                         _OC.cdsPrazoPgtoOC    := cdsPrazoPgtoOC;
                         _OC.cdsSCItemOC       := cdsSCItemOC;

                     end;
                End;


             // Passo 1-E
             //-------------------------------------------------------------------------------------
             // Atualiza o status do processo para finalizado
             //--------------------------------------------------------------------------------------
             Sql := ' UPDATE PROCESSO SET STATUS = ''F'' '+
                    ' WHERE (CODPROCESSO = '+FloatToStr( CodProcesso )+') ';
             If Not ExecSQL( Sql ,True ) Then
                Raise Exception.Create( MessageInfo );

             Commit;
           End; // if inicial se CdsWins não estiver Vazio
      Except
         On E:Exception Do
          Begin
             if Self.DataBase.InTransaction then
                Rollback;

             Result := False;
             MessageInfo := E.Message;
          End;
      End;
   Finally
      cdsWins.Free;
      cdsWinEnt.Free;
      cdsWinPag.Free;
      cdsWinAgreg.Free;
      cdsWinSCItemOC.Free;
      cdsOC.Free;
      cdsItemOC.Free;
      cdsAgregItemOC.Free;
      cdsPrazoPgtoOC.Free;
      cdsPrazoEntregaOC.Free;
      cdsSCItemOC.Free;
      cdsComplOC.Free;
      cdsSCIOC.Free;
      cdsAux.Free;

      FreeAndNil(ListaReservas);
   End;
end;

function TCtrlCotacao.GetAgregados(CodProcesso, IdProcxArt, Proposta,
  IdForCli: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT VC.CODPROCESSO,     '+
          '        VC.IDPROCXART,      '+
          '        VC.PROPOSTA,        '+
          '        VC.IDFORCLI,        '+
          '        VC.PERCENT,         '+
          '        VC.CODTIPOCUSTAGREG,'+
          '        VC.VALOR,           '+
          '        VC.BASECALCULO,     '+
          '        TA.FLGBASE,         '+
          '        TA.CODTRATFISCE '+
          ' FROM VALORAGREGCOT VC, '+
          '      TIPOAGRE TA '+
          ' WHERE  (VC.CODPROCESSO = '+FloatToStr(CodProcesso)+') '+
          '    AND (VC.IDPROCXART  = '+FloatToStr(IdProcxArt)+') '+
          '    AND (VC.IDFORCLI    = '+FloatToStr(IdForCli)+') '+
          '    AND (VC.PROPOSTA    = '+FloatToStr(Proposta)+') '+
          '    AND (VC.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG) '+
          ' ORDER BY TA.FLGBASE DESC ';

   Result := GetDataPacket( SQL );
end;

function TCtrlCotacao.GetAgregadosTela(CodProcesso, IdProcxArt, Proposta,
  IdForCli: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := 'SELECT VC.IDPROCXART,       '+
          '       VC.IDFORCLI,         '+
          '       VC.CODPROCESSO,      '+
          '       VC.PROPOSTA,         '+
          '       TA.CODTIPOCUSTAGREG, '+
          '       VC.PERCENT,          '+
          '       VC.VALOR,            '+
          '       TA.DESCCUSTAGREG,    '+
          '       TA.FLGBASE,          '+
          '       TA.PERCVALOR,        '+
          '       TA.CODTRATFISCE,       '+
          '       VC.BASECALCULO AS BASE,'+
          '       (0) AS ACUMBASE        '+
          'FROM VALORAGREGCOT VC,        '+
          '     TIPOAGRE TA              '+
          'WHERE (VC.CODPROCESSO(+) = '+FloatToStr(CodProcesso)+')'+
          '  AND (VC.IDFORCLI(+)    = '+FloatToStr(IdForCli)+')   '+
          '  AND (VC.IDPROCXART(+)  = '+FloatToStr(IdProcxArt)+') '+
          '  AND (VC.PROPOSTA(+)    = '+FloatToStr(Proposta)+')   '+
          '  AND (TA.FLGINCIDECOMPRA = ''S'') '+
          '  AND (VC.CODTIPOCUSTAGREG(+) = TA.CODTIPOCUSTAGREG) '+
          'ORDER BY TA.FLGBASE DESC, TA.DESCCUSTAGREG           ';
   Result := GetDataPacket( SQL );
end;

function TCtrlCotacao.GetPrazoEntrega(CodProcesso, IdProcxArt, Proposta,
  IdForCli: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT QTDEENT, PROPOSTA, PRAZOENT, PERIODOPRAZO, IDPROCXART, '+
          ' IDPRAZOENT, IDFORCLI, DATAENT, CODPROCESSO, CODMEDIDA '+
          ' FROM PRAZOENTREGA '+
          ' WHERE  (CODPROCESSO = '+FloatToStr(CodProcesso)+') '+
          '    AND (IDPROCXART  = '+FloatToStr(IdProcxArt)+') '+
          '    AND (IDFORCLI    = '+FloatToStr(IdForCli)+') '+
          '    AND (PROPOSTA    = '+FloatToStr(Proposta)+') ';

   Result := GetDataPacket( SQL );
end;

function TCtrlCotacao.GetPrazoPgto(CodProcesso, IdProcxArt, Proposta,
  IdForCli: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT PROPOSTA, PRAZOPGTO, PERIODOPRAZO, PERCENT, '+
          ' IDPROCXART, IDPRAZOPGTO, IDFORCLI, DATAPGTO, CODPROCESSO '+
          ' FROM PRAZOPGTO '+
          ' WHERE  (CODPROCESSO = '+FloatToStr(CodProcesso)+') '+
          '    AND (IDPROCXART  = '+FloatToStr(IdProcxArt)+') '+
          '    AND (IDFORCLI    = '+FloatToStr(IdForCli)+') '+
          '    AND (PROPOSTA    = '+FloatToStr(Proposta)+') ';

   Result := GetDataPacket( SQL );
end;

function TCtrlCotacao.GetSomaObsSCI(IdProcxArt: Double): String;
Var
  SQl : String;
begin
   Result := '';
   SQL := ' SELECT OBSITEMSOLIC AS OBS FROM ITEMSOLI '+
          ' WHERE (IDPROCXART = '+FloatToStr(IdProcxArt)+') ';

   _Cds.Data := GetDataPacket(SQL);

   _Cds.First;
   While Not _Cds.Eof Do
      Begin
         If Result <> '' Then
            Result := Result + ' ' + Trim(_Cds.FieldByName('OBS').AsString)
         Else
            Result := Trim(_Cds.FieldByName('OBS').AsString);

        _Cds.Next;
      End;
end;

function TCtrlCotacao.Gravar: Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarCotacao( FcdsCotacao.Data, FcdsPrazoEntrega.Data, FcdsPrazoPgto.Data, FcdsValorAgreg.Data, FcdsValorAgregTela.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
          //----------------------------------------------------------------------------------------------------
          //Atualiza o Imposto a ser gravado
          //----------------------------------------------------------------------------------------------------
           FcdsValorAgregTela.DisableControls;
           FcdsValorAgregTela.First;
           While Not FcdsValorAgregTela.EOF Do
               Begin
                  if FcdsValorAgreg.Locate('CODTIPOCUSTAGREG',FcdsValorAgregTela.FieldByName('CODTIPOCUSTAGREG').AsInteger,[]) Then
                     Begin
                        If FcdsValorAgregTela.FieldByName('VALOR').AsFloat <> 0 Then
                           Begin
                             FcdsValorAgreg.Edit;
                             FcdsValorAgreg.FieldByName('CODPROCESSO').AsInteger := FcdsCotacao.FieldByName('CODPROCESSO').AsInteger;
                             FcdsValorAgreg.FieldByName('IDPROCXART').AsInteger  := FcdsCotacao.FieldByName('IDPROCXART').AsInteger;
                             FcdsValorAgreg.FieldByName('IDFORCLI').AsInteger    := FcdsCotacao.FieldByName('IDFORCLI').AsInteger;
                             FcdsValorAgreg.FieldByName('PROPOSTA').AsInteger    := FcdsCotacao.FieldByName('PROPOSTA').AsInteger;
                             FcdsValorAgreg.FieldByName('PERCENT').AsFloat       := FcdsValorAgregTela.FieldByName('PERCENT').AsFloat;
                             FcdsValorAgreg.FieldByName('VALOR').AsFloat         := FcdsValorAgregTela.FieldByName('VALOR').AsFloat;
                             FcdsValorAgreg.FieldByName('BASECALCULO').AsFloat   := FcdsValorAgregTela.FieldByName('BASE').AsFloat;
                             FcdsValorAgreg.Post;
                          End
                        Else
                          FcdsValorAgreg.Delete;
                    End
                  Else
                    If FcdsValorAgregTela.FieldByName('VALOR').AsFloat <> 0 Then
                       Begin
                         FcdsValorAgreg.Append;
                         FcdsValorAgreg.FieldByName('CODPROCESSO').AsInteger      := FcdsCotacao.FieldByName('CODPROCESSO').AsInteger;
                         FcdsValorAgreg.FieldByName('IDPROCXART').AsInteger       := FcdsCotacao.FieldByName('IDPROCXART').AsInteger;
                         FcdsValorAgreg.FieldByName('IDFORCLI').AsInteger         := FcdsCotacao.FieldByName('IDFORCLI').AsInteger;
                         FcdsValorAgreg.FieldByName('PROPOSTA').AsInteger         := FcdsCotacao.FieldByName('PROPOSTA').AsInteger;
                         FcdsValorAgreg.FieldByName('CODTIPOCUSTAGREG').AsInteger := FcdsValorAgregTela.FieldByName('CODTIPOCUSTAGREG').AsInteger;
                         FcdsValorAgreg.FieldByName('PERCENT').AsFloat            := FcdsValorAgregTela.FieldByName('PERCENT').AsFloat;
                         FcdsValorAgreg.FieldByName('VALOR').AsFloat              := FcdsValorAgregTela.FieldByName('VALOR').AsFloat;
                         FcdsValorAgreg.FieldByName('BASECALCULO').AsFloat        := FcdsValorAgregTela.FieldByName('BASE').AsFloat;
                         FcdsValorAgreg.Post;
                      End;
                  FcdsValorAgregTela.Next;
              End;
           FcdsValorAgregTela.EnableControls;
          //----------------------------------------------------------------------------------------------------
          // Atualiza o Processo de Compra para já em cotação Status  = 'C'
          //----------------------------------------------------------------------------------------------------
           _DbProcesso.CodProcesso.AsFloat := FcdsCotacao.fieldByName('CODPROCESSO').AsFloat;
           _DbProcesso.LoadFromDb;
           If _DbProcesso.Status.AsString = 'P' Then
              Begin
                 _DbProcesso.Status.AsString :=  'C';
                 Result := _DbProcesso.Update;
                 Msg    := _DbProcesso.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
              End;

           //Cotação
           Result := ApplyCds(FcdsCotacao,_DbCotacoes,[],[] );
           Msg    := _DbCotacoes.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           //Prazo de Entrega
           Result := ApplyCds(FcdsPrazoEntrega,_DbPrazoEntrega,[],[] );
           Msg    := _DbPrazoEntrega.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           //Prazo de Pagamento
           Result := ApplyCds(FcdsPrazoPgto,_DbPrazoPgto,[],[] );
           Msg    := _DbPrazoPgto.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           //Custos Agregados
           Result := ApplyCds(FcdsValorAgreg,_DbValorAgregCot,[],[] );
           Msg    := _DbValorAgregCot.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;

        Except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;



function TCtrlCotacao.GravaStatus(CodProcesso,IdProcxArt,Proposta,IdForCli : Double; Status,Justificatiava : String ) : boolean;
Var
   SQL    : String;
   sValor : String;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaStatus(CodProcesso,IdProcxArt,Proposta,IdForCli, Status,Justificatiava );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           If Trim(Status) <> '' Then
             sValor := QuotedStr(Status)
           Else
             sValor := 'NULL';

           SQL := ' UPDATE COTACOES SET STATUS = '+sValor+
                  ' WHERE  (CODPROCESSO = '+FloatToStr(CodProcesso)+') '+
                  '    AND (IDPROCXART  = '+FloatToStr(IdProcxArt)+') '+
                  '    AND (IDFORCLI    = '+FloatToStr(IdForCli)+') '+
                  '    AND (PROPOSTA    = '+FloatToStr(Proposta)+') ';
           If Not ExecSQL( SQL ,True ) Then
              Abort;

           If (Status = 'U') or (Status = '') Then
              Begin
                 SQL := ' UPDATE PROCXART SET JUSTIFICATIVA = '+QuotedStr(Justificatiava)+
                        ' WHERE  (CODPROCESSO = '+FloatToStr(CodProcesso)+') '+
                        '    AND (IDPROCXART  = '+FloatToStr(IdProcxArt)+') ';

                 If Not ExecSQL( SQL ,True ) Then
                    Abort;
              End;

           Commit;

        Except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;

function TCtrlCotacao.LeUltContato(idForCli, idPessoa: Double): String;
Var
   SQL : String;
begin
   SQL := 'SELECT ULTCONTATO FROM EMPRESAFORN '+
          'WHERE (IDFORCLI = '+FloatToStr(idForCli)+')'+
          '  AND (IDPESSOA = '+FloatToStr(idPessoa)+')';

   _cds.Data := GetDataPacket(SQL);

   Result := _cds.FieldByName('ULTCONTATO').AsString;
end;

function TCtrlCotacao.ListDadosFornecedor(IdForCli: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Append('SELECT     ');
      SQL.Append('       P.IDPESSOA,');
      SQL.Append('      (E.LOGRADOURO ||'' ''|| E.NUMERO ||'' ''|| E.COMPLEMENTO ||'' ''|| E.BAIRRO) AS ENDERECO, ');
      SQL.Append('       E.CEP, ES.CODESTADO,P.EMAIL AS EMAILEMP,                    ');
      SQL.Append('       DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,       ');
      SQL.Append('       PA.NOMEPAIS, TC.TELEFONE,TC.DDI,TC.DDD,TC.RAMAL, ES.IDPAIS, ');
      SQL.Append('       TC.CONTATO, TC.CARGO, TC.SETOR, TC.EMAILCON                 ');
      SQL.Append('FROM PESSOA P,         ');
      SQL.Append('     ENDPESS E,        ');
      SQL.Append('     CIDADES C,        ');
      SQL.Append('     ESTADO  ES,       ');
      SQL.Append('     PAIS    PA,       ');
      SQL.Append('     (SELECT E.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD, ');
      SQL.Append('             C.RAMAL, C.CONTATO, C.CARGO, C.SETOR, C.EMAILCON   ');
      SQL.Append('      FROM PESSOA P,       ');
      SQL.Append('           ENDPESS E,      ');
      SQL.Append('           TELENDPESS  TP, ');
      SQL.Append('           (SELECT TC.IDTELEFONE,TC.RAMAL, CP.NOME AS CONTATO, CP.CARGO,');
      SQL.Append('                   CP.SETOR, CP.EMAIL AS EMAILCON         ');
      SQL.Append('            FROM PESSOA P,                                ');
      SQL.Append('                 ENDPESS E,                               ');
      SQL.Append('                 CONTATOPESS CP,                          ');
      SQL.Append('                 TELCONTATO  TC                           ');
      SQL.Append('            WHERE (P.IDPESSOA    = '+FloatToStr(IdForCli)+') AND         ');
      SQL.Append('                  (E.IDENDERECO  = P.IDENDCOMERCIAL) AND  ');
      SQL.Append('                  (E.IDPESSOA    = P.IDPESSOA) AND        ');
      SQL.Append('                  (E.IDENDERECO  = CP.IDENDERECO) AND     ');
      SQL.Append('                  (TC.IDCONTATO  = CP.IDCONTATO)) C       ');
      SQL.Append('      WHERE (P.IDPESSOA    = '+FloatToStr(IdForCli)+') AND               ');
      SQL.Append('            (E.IDENDERECO  = P.IDENDCOMERCIAL) AND        ');
      SQL.Append('            (E.IDPESSOA    = P.IDPESSOA) AND              ');
      SQL.Append('            ((TP.TIPO LIKE ''%C%'') OR (TP.TIPO LIKE ''%F%'')) AND ');
      SQL.Append('            (E.IDENDERECO     = TP.IDENDERECO) AND ');
      SQL.Append('            (C.IDTELEFONE(+)  = TP.IDTELEFONE)) TC ');
      SQL.Append('WHERE (P.IDPESSOA    = '+FloatToStr(IdForCli)+') AND              ');
      SQL.Append('      (E.IDPESSOA    = P.IDPESSOA) AND             ');
      SQL.Append('      (E.IDENDERECO  = P.IDENDCOMERCIAL) AND       ');
      SQL.Append('      (E.IDCIDADES   = C.IDCIDADES) AND            ');
      SQL.Append('      (ES.IDESTADO   = C.IDESTADO) AND             ');
      SQL.Append('      (ES.IDPAIS      = PA.IDPAIS) AND             ');
      SQL.Append('      (TC.IDENDERECO(+) = E.IDENDERECO)            ');
      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;


end;

function TCtrlCotacao.ListFornecedor(CodProcesso: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Append('SELECT     ');
      SQL.Append('     (TO_CHAR(C.IDFORCLI) || TO_CHAR(C.PROPOSTA)) AS CHAVE, ');
      SQL.Append('     MIN(C.CODPROCESSO) AS CODPROCESSO,  ');
      SQL.Append('     MIN(C.IDPROCXART)  AS IDPROCXART,  ');
      SQL.Append('     C.IDFORCLI,    ');
      SQL.Append('     C.PROPOSTA,    ');
      SQL.Append('     P.RAZAOSOCIAL, ');
      SQL.Append('     ES.CODESTADO,  ');
      SQL.Append('     ES.IDPAIS      ');
      SQL.Append('FROM                ');
      SQL.Append('    PESSOA P,       ');
      SQL.Append('    ENDPESS E,      ');
      SQL.Append('    CIDADES CI,     ');
      SQL.Append('    ESTADO  ES,     ');
      SQL.Append('    COTACOES C      ');
      SQL.Append('WHERE               ');
      SQL.Append('      (C.CODPROCESSO  = '+FloatToStr(CodProcesso)+') ');
      SQL.Append('  AND (C.IDFORCLI     = P.IDPESSOA)       ');
      SQL.Append('  AND (E.IDPESSOA(+)  = P.IDPESSOA)       ');
      SQL.Append('  AND (E.IDENDERECO(+)= P.IDENDCOMERCIAL) ');
      SQL.Append('  AND (E.IDCIDADES    = CI.IDCIDADES(+))  ');
      SQL.Append('  AND (ES.IDESTADO(+) = CI.IDESTADO)      ');
      SQL.Append('GROUP BY  C.IDFORCLI,                     ');
      SQL.Append('          C.PROPOSTA,                     ');
      SQL.Append('          P.RAZAOSOCIAL,                  ');
      SQL.Append('          ES.CODESTADO,                   ');
      SQL.Append('          ES.IDPAIS                       ');

      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;
end;

function TCtrlCotacao.ListItensSumario(CodProcesso: Double): OleVariant;
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
      SQL.Append('      (PXA.CODPROCESSO = '+FloatToStr(CodProcesso)+') ');
      SQL.Append('  AND (PXA.CODARTIGO = A.CODARTIGO)                   ');
      SQL.Append('  AND (A.CODPRODUTO = P.CODPRODUTO)                   ');
      SQL.Append('  AND (PXA.IDPRODVARI = PV.IDPRODVARI(+))             ');
      SQL.Append('ORDER BY DESCRICAO                                    ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlCotacao.ListObservacao(CodArtigo: String; CodProcesso,
  IdProcxArt: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      CodArtigo := Copy( CodArtigo + '         ',1,14);
      SQL.Append('(SELECT P.DESCRCOMPL AS OBSITEMSOLIC ');
      SQL.Append(' FROM PRODUTO P,                     ');
      SQL.Append('      ARTIGO A                       ');
      SQL.Append(' WHERE (A.CODARTIGO = '+QuotedStr(CodArtigo)+')   ');
      SQL.Append('   AND (P.CODPRODUTO = A.CODPRODUTO) ');
      SQL.Append('   AND (P.DESCRCOMPL IS NOT NULL))   ');
      SQL.Append('UNION ALL                            ');
      SQL.Append('(SELECT                              ');
      SQL.Append('    OBSITEMSOLIC                     ');
      SQL.Append(' FROM                                ');
      SQL.Append('    ITEMSOLI                         ');
      SQL.Append(' WHERE                               ');
      SQL.Append('       (CODPROCESSO = '+FloatToStr(CodProcesso)+') ');
      SQL.Append('   AND (IDPROCXART  = '+FloatToStr(IdProcxArt)+')  ');
      SQL.Append('   AND (OBSITEMSOLIC IS NOT NULL))   ');

      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;
end;

function TCtrlCotacao.ListSumario(CodProcesso, IdProcxArt: Double): OleVariant;
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
      SQL.Append('      (C.CODPROCESSO  = '+FloatToStr(CodProcesso)+')  ');
      SQL.Append('  AND (C.IDPROCXART   = '+FloatToStr(IdProcxArt)+')   ');
      SQL.Append('  AND (C.IDFORCLI     = P.IDPESSOA)    ');
      SQL.Append('  AND (C.MOECODIGO    = M.MOECODIGO(+))');
      SQL.Append('  AND (C.PRECOAVALORPRES IS NOT NULL)');
      SQL.Append('ORDER BY C.PRECOAVALORPRES             ');
      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;

end;

function TCtrlCotacao.ListUltCompraForn(IdForCli: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Append('SELECT ');
      SQL.Append('   P.DESCPROD,                                  ');
      SQL.Append('   NF.DATAENTDEVOL,                             ');
      SQL.Append('   I.QTDERECEBDEVOL,                            ');
      SQL.Append('   (I.VLRESTOQUE/I.QTDERECEBDEVOL) AS VALUNEST, ');
      SQL.Append('   I.VLRUNITARIO,                               ');
      SQL.Append('   I.CODMEDIDA                                  ');
      SQL.Append('FROM                                            ');
      SQL.Append('   PRODUTO P,                                   ');
      SQL.Append('   ARTIGO A,                                    ');
      SQL.Append('   ITENSRECEBDEVOL I,                           ');
      SQL.Append('   NFRECEBDEVOL NF                              ');
      SQL.Append('WHERE                                           ');
      SQL.Append('      (NF.IDFORCLI = '+FloatToStr(IdForCli)+')  ');
      SQL.Append('  AND (NF.FLGTIPONOTA = ''R'')                  ');
      SQL.Append('  AND (NF.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL)    ');
      SQL.Append('  AND (A.CODARTIGO = I.CODARTIGO)               ');
      SQL.Append('  AND (A.CODPRODUTO = P.CODPRODUTO)             ');
      SQL.Append('ORDER BY NF.DATAENTDEVOL DESC            ');

      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;

end;

function TCtrlCotacao.ListVencedor(CodProcesso: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Append('SELECT                ');
      SQL.Append('      C.CODPROCESSO,  ');
      SQL.Append('      SC.IDRESERVAORCAMEN,  ');
      SQL.Append('      C.IDFORCLI,     ');
      SQL.Append('      C.PROPOSTA,     ');
      SQL.Append('      SC.IDPESSOA,    ');
      SQL.Append('      C.IDPROCXART,   ');
      SQL.Append('      C.QTDEFORNECIDA,');
      SQL.Append('      PXA.CODARTIGO,  ');
      SQL.Append('      PXA.CODMEDIDA,  ');
      SQL.Append('      PXA.IDPRODVARI, ');
      SQL.Append('      C.OBS,          ');
      SQL.Append('      PE.RAZAOSOCIAL, ');
      SQL.Append('      C.IDITEMOC,     ');
      SQL.Append('      MAX(C.PRECO / CI.FATOR * CM.FATOR) AS VALOR, ');
      SQL.Append('      SUM((C.QTDEFORNECIDA * CI.FATOR/CM.FATOR) * SCI.QTDESCI/ PXA.QTDEPEDIDA ) AS QTDEOC,');
      SQL.Append('      MAX(IT.OBSITEMSOLIC) AS OBSITEMSOLIC, ');
      SQL.Append('      P.DESCPROD,        ');
      SQL.Append('      P.CODGRUPOPROD,    ');
      SQL.Append('      C.CONTATO,         ');
      SQL.Append('      C.MOECODIGO        ');
      SQL.Append('FROM                     ');
      SQL.Append('      PESSOA PE,         ');
      SQL.Append('      COTACOES C,        ');
      SQL.Append('      PROCXART PXA,      ');
      SQL.Append('      ITEMSOLI IT,       ');
      SQL.Append('      SOLICOMP SC,       ');
      SQL.Append('      ARTIGO A,          ');
      SQL.Append('      PRODUTO P,         ');
      SQL.Append('      CONVER CM,         ');
      SQL.Append('      CONVER CI,         ');
      SQL.Append('      (                  ');
      SQL.Append('       SELECT            ');
      SQL.Append('           SC.NUMSOLCOMPRA,  ');
      SQL.Append('           IT.IDITEMSOLI,    ');
      SQL.Append('           SC.IDPESSOA,      ');
      SQL.Append('	     IT.IDPROCXART,        ');
      SQL.Append('	    (IT.QTDEPEDIDA * CI.FATOR/CM.FATOR) AS QTDESCI ');
      SQL.Append('       FROM                    ');
      SQL.Append('           ITEMSOLI IT,        ');
      SQL.Append('           SOLICOMP SC,        ');
      SQL.Append('	     ARTIGO A,             ');
      SQL.Append('	     PRODUTO P,            ');
      SQL.Append('	     CONVER CM,            ');
      SQL.Append('	     CONVER CI             ');
      SQL.Append('       WHERE                   ');
      SQL.Append('              (IT.CODPROCESSO  = '+FloatToStr(CodProcesso)+')  ');
      SQL.Append('          AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)');
      SQL.Append('          AND (IT.CODARTIGO    = A.CODARTIGO)    ');
      SQL.Append('          AND (A.CODPRODUTO    = P.CODPRODUTO)   ');
      SQL.Append('          AND (CM.CODPRODUTO   = P.CODPRODUTO)   ');
      SQL.Append('          AND (CM.CODMEDIDA    = P.CODMEDCUSTO)  ');
      SQL.Append('          AND (CI.CODPRODUTO   = P.CODPRODUTO)   ');
      SQL.Append('          AND (CI.CODMEDIDA    = IT.CODMEDIDA)   ');
      SQL.Append('      ) SCI                                      ');
      SQL.Append('WHERE (C.CODPROCESSO = '+FloatToStr(CodProcesso)+')');

      SQL.Append('  AND ((C.STATUS = ''C'') OR (C.STATUS = ''U'')) ');
      SQL.Append('  AND (PXA.CODPROCESSO = C.CODPROCESSO)          ');
      SQL.Append('  AND (PXA.IDPROCXART  = C.IDPROCXART)           ');
      SQL.Append('  AND (PXA.IDPROCXART  = IT.IDPROCXART)          ');
      SQL.Append('  AND (PXA.CODPROCESSO = IT.CODPROCESSO)         ');
      SQL.Append('  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)        ');
      SQL.Append('  AND (SCI.IDPESSOA    = SC.IDPESSOA)            ');
      SQL.Append('  AND (SCI.IDPROCXART  = PXA.IDPROCXART)         ');
      SQL.Append('  AND (SCI.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)       ');
      SQL.Append('  AND (SCI.IDITEMSOLI   = IT.IDITEMSOLI)         ');
      SQL.Append('  AND (PXA.CODARTIGO   = A.CODARTIGO)            ');
      SQL.Append('  AND (A.CODPRODUTO    = P.CODPRODUTO)           ');
      SQL.Append('  AND (CM.CODPRODUTO   = P.CODPRODUTO)           ');
      SQL.Append('  AND (CM.CODMEDIDA    = P.CODMEDCUSTO)          ');
      SQL.Append('  AND (CI.CODPRODUTO   = P.CODPRODUTO)           ');
      SQL.Append('  AND (CI.CODMEDIDA    = C.CODMEDIDA)            ');
      SQL.Append('  AND (PE.IDPESSOA     = C.IDFORCLI)             ');
      SQL.Append('GROUP BY                ');
      SQL.Append('      PE.RAZAOSOCIAL,   ');
      SQL.Append('      C.CODPROCESSO,    ');
      SQL.Append('      SC.IDRESERVAORCAMEN,  ');
      SQL.Append('      C.IDFORCLI,       ');
      SQL.Append('      C.PROPOSTA,       ');
      SQL.Append('      SC.IDPESSOA,      ');
      SQL.Append('      C.IDPROCXART,     ');
      SQL.Append('      PXA.CODARTIGO,    ');
      SQL.Append('      PXA.CODMEDIDA,    ');
      SQL.Append('      PXA.IDPRODVARI,   ');
      SQL.Append('      C.QTDEFORNECIDA,  ');
      SQL.Append('      C.OBS,            ');
      SQL.Append('      C.IDITEMOC,       ');
      SQL.Append('      P.CODGRUPOPROD,   ');
      SQL.Append('      P.DESCPROD,       ');
      SQL.Append('      C.CONTATO,        ');
      SQL.Append('      C.MOECODIGO       ');
      SQL.Append('ORDER BY SC.IDPESSOA, C.IDFORCLI, C.PROPOSTA,  SC.IDRESERVAORCAMEN  ');

      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;

end;

function TCtrlCotacao.ListVencedorSCItemOC(CodProcesso, IdProcxArt,
  Proposta, IdForCli: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Append('SELECT                  ');
      SQL.Append('      SC.NUMSOLCOMPRA,  ');
      SQL.Append('      IT.IDITEMSOLI     ');
      SQL.Append('FROM                    ');
      SQL.Append('      COTACOES C,       ');
      SQL.Append('      PROCXART PXA,     ');
      SQL.Append('      ITEMSOLI IT,      ');
      SQL.Append('      SOLICOMP SC       ');
      SQL.Append('WHERE                   ');
      SQL.Append('      (C.CODPROCESSO  = '+FloatToStr(CodProcesso)+')');
      SQL.Append('  AND (C.IDFORCLI     = '+FloatToStr(IdForCli)+') ');
      SQL.Append('  AND (C.IDPROCXART   = '+FloatToStr(IdProcxArt)+')   ');
      SQL.Append('  AND (C.PROPOSTA     = '+FloatToStr(Proposta)+')   ');
      SQL.Append('  AND (PXA.CODPROCESSO = C.CODPROCESSO) ');
      SQL.Append('  AND (PXA.IDPROCXART  = C.IDPROCXART)  ');
      SQL.Append('  AND (PXA.IDPROCXART  = IT.IDPROCXART) ');
      SQL.Append('  AND (PXA.CODPROCESSO = IT.CODPROCESSO)');
      SQL.Append('  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)');

      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;

end;

procedure TCtrlCotacao.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
Var
   SQL : String;
begin
  inherited;
  If sTableName = 'COTACOES' Then
     Begin
         // Tipos disponíveis = (usUnmodified, usModified, usInserted, usDeleted)
          If CdsState = usModified Then
            Begin
              //----------------------------------------------------------------------------------------------------
              // Atualiza o último contato do fornecedor
              //----------------------------------------------------------------------------------------------------
              SQL := ' UPDATE EMPRESAFORN SET ULTCONTATO = '+QuotedStr(aCds.FieldByName('CONTATO').AsString)+
                     ' WHERE (IDFORCLI = '+aCds.FieldByName('IDFORCLI').AsString+')';

               If Not ExecSQL( SQL ) Then
                  Raise Exception.Create( MessageInfo );
            End;
     End;
end;

procedure TCtrlCotacao.OnCreateAppServer;
begin
  inherited;
  FcdsValorAgregTela := TClientDataSet.Create(nil);
  FcdsValorAgreg     := TClientDataSet.Create(nil);
  FcdsPrazoPgto      := TClientDataSet.Create(nil);
  FcdsPrazoEntrega   := TClientDataSet.Create(nil);
  FcdsCotacao        := TClientDataSet.Create(nil);
  FcdsSumario        := TClientDataSet.Create(nil);
end;

function TCtrlCotacao.PodeGerarOC(CodProcesso: Double;
  bUsaRAD: Boolean): boolean;
Var
   SQL : TStringList;
   IdProcessoCotacao: integer;
begin
   Result := True;

   SQL := TStringList.Create;
   Try
     SQL.Clear;
     SQL.Add('SELECT ');
     SQL.Add('      C.IDPROCXART,  ');
     SQL.Add('      PXA.CODARTIGO, ');
     SQL.Add('      PXA.IDPROCXART,');
     SQL.Add('      SUBSTR(DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO ');
     SQL.Add('FROM                 ');
     SQL.Add('      COTACOES C,    ');
     SQL.Add('      PROCXART PXA,  ');
     SQL.Add('      PRODUTO P,     ');
     SQL.Add('      ARTIGO A,      ');
     SQL.Add('      PRODVARI PV    ');
     SQL.Add('WHERE                ');
     SQL.Add('      (C.CODPROCESSO = '+FloatToStr(CodProcesso)+') ');
     SQL.Add('  AND (C.IDPROCXART NOT IN ( SELECT IDPROCXART    ');
     SQL.Add('                             FROM   COTACOES      ');
     SQL.Add('                             WHERE (CODPROCESSO = '+FloatToStr(CodProcesso)+')  ');
     SQL.Add('                               AND ((STATUS = ''C'') OR (STATUS = ''U'') ) ) ) ');
     SQL.Add('  AND (PXA.CODPROCESSO = C.CODPROCESSO)     ');
     SQL.Add('  AND (PXA.IDPROCXART  = C.IDPROCXART)      ');
     SQL.Add('  AND (PXA.CODARTIGO   = A.CODARTIGO)       ');
     SQL.Add('  AND (A.CODPRODUTO    = P.CODPRODUTO)      ');
     SQL.Add('  AND (PXA.IDPRODVARI  = PV.IDPRODVARI(+))  ');
     SQL.Add('GROUP BY C.IDPROCXART, PXA.CODARTIGO, PXA.IDPROCXART, DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI) ');
     SQL.Add('ORDER BY  DESCRICAO');

     _Cds.Data := GetDataPacket(SQL.Text);

     If Not _Cds.IsEmpty Then
        Begin
           Result := False;

           MessageInfo := MSG_ARTIGO_SEM_SELECAO;
           _Cds.First;
           While Not _Cds.Eof Do
              Begin
                 MessageInfo := MessageInfo + Chr(13) + _Cds.FieldByName('CODARTIGO').AsString + ' - '+_Cds.FieldByName('DESCRICAO').AsString;
                 _Cds.Next;
              End;
        End
     Else
     if bUsaRAD then
     begin
       
       if (Sistema.VersaoRAD = '+') then
       begin
         if (RADPlus.ProcessoConcluido(RadConsultaCompras.RecuperaIdProcessoNaCotacao(Trunc(CodProcesso)))) then
             Result := True;
       end
       else
       begin
         SQL.Clear;
         SQL.Add('SELECT ');
         SQL.Add('      SC.IDPROCESSO,  ');
         SQL.Add('      SC.NUMSOLCOMPRA ');
         SQL.Add('FROM                  ');
         SQL.Add('      COTACOES C,     ');
         SQL.Add('      PROCXART PXA,   ');
         SQL.Add('      ITEMSOLI IT,    ');
         SQL.Add('      SOLICOMP SC,    ');
         SQL.Add('      RADINSTPROCESSO RP  ');
         SQL.Add('WHERE (C.CODPROCESSO = '+FloatToStr(CodProcesso)+') ');
         SQL.Add('  AND ((C.STATUS = ''C'') OR (C.STATUS = ''U'')) ');
         SQL.Add('  AND (PXA.CODPROCESSO = C.CODPROCESSO)          ');
         SQL.Add('  AND (PXA.IDPROCXART  = C.IDPROCXART)           ');
         SQL.Add('  AND (PXA.IDPROCXART  = IT.IDPROCXART)          ');
         SQL.Add('  AND (PXA.CODPROCESSO = IT.CODPROCESSO)         ');
         SQL.Add('  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)        ');
         SQL.Add('  AND (RP.IDPROCESSO = SC.IDPROCESSO)            ');
         SQL.Add('  AND ((RP.FLGOK <> ''S'') OR (RP.FLGOK IS NULL))');
         SQL.Add('GROUP BY              ');
         SQL.Add('   SC.IDPROCESSO,     ');
         SQL.Add('   SC.NUMSOLCOMPRA    ');

         _Cds.Data := GetDataPacket(SQL.Text);

         If Not _Cds.IsEmpty Then
            Begin
               Result := False;

               MessageInfo := MSG_SCI_SEM_AUTORIZACA0;
               _Cds.First;
               While Not _Cds.Eof Do
               begin
                   MessageInfo := MessageInfo + Chr(13)+ '   . '+ _Cds.FieldByName('IDPROCESSO').AsString+'/'+_Cds.FieldByName('NUMSOLCOMPRA').AsString;
                   _Cds.Next;
               end;
            end;
       end;
    end;
   Finally
      SQL.Free;
   End;
end;

function TCtrlCotacao.ProcessaSelecao: boolean;
Var
  SQL             : String;
  bTemSelUsuario  : Boolean;
  cdsItensSumario : TClientDataSet;
  cdsAux          : TClientDataSet;
  fTotalReserva   : Extended;
  fValorTotal     : Extended;
  fMargemOC       : Extended;
  iNumReserva     : LongInt;
  sMensagem       : String;
  bValorIndev     : Boolean;
  fReserva        : Extended;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaSelecao( FcdsSumario.Data ) ;
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try

           StartTransaction;

           // Verifica se possui saldo na reserva para poder continuar o processo
           try

               cdsItensSumario := TClientDataSet.Create(nil);
               cdsAux          := TClientDataSet.Create(nil);

               _Orcamento.IdEmpresa := Sistema.IdEmpresa;
               sMensagem            := '';
               bValorIndev          := False;
               fValorTotal          := 0;

               cdsAux.Data          := GetDataPacket('SELECT FLGORCAMENTO, NVL(FLGMARGEMOC,0) AS FLGMARGEMOC FROM PARAMCOMPRAS WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
               fMargemOC            := ( 1 + (cdsAux.FieldByName('FLGMARGEMOC').AsFloat / 100) );

               SQL :=
               'SELECT DISTINCT '                                                            + #13 +
               '     C.CODPROCESSO, '                                                        + #13 +
               '     C.IDPROCXART, '                                                         + #13 +
               '     (C.PRECO * C.QTDEFORNECIDA) AS PRECOTOTAL, '                            + #13 +
               '      SC.IDPROCESSO, '                                                       + #13 +
               '      SC.NUMSOLCOMPRA, '                                                     + #13 +
               '      SC.IDRESERVAORCAMEN '                                                  + #13 +
               'FROM '                                                                       + #13 +
               '      PROCXART PXA, '                                                        + #13 +
               '      PRODUTO P, '                                                           + #13 +
               '      ARTIGO A, '                                                            + #13 +
               '      PRODVARI PV, '                                                         + #13 +
               '      COTACOES C, '                                                          + #13 +
               '      ITEMSOLI IT, '                                                         + #13 +
               '      SOLICOMP SC '                                                          + #13 +
               'WHERE '                                                                      + #13 +
               '      PXA.CODPROCESSO = ' + FcdsSumario.FieldByName('CODPROCESSO').AsString  + #13 +
               '  AND PXA.CODARTIGO   = A.CODARTIGO '                                        + #13 +
               '  AND A.CODPRODUTO    = P.CODPRODUTO '                                       + #13 +
               '  AND PXA.IDPRODVARI  = PV.IDPRODVARI(+) '                                   + #13 +
               '  AND C.CODPROCESSO   = PXA.CODPROCESSO '                                    + #13 +
               '  AND C.IDPROCXART    = PXA.IDPROCXART '                                     + #13 +
               '  AND (PXA.IDPROCXART  = IT.IDPROCXART) '                                    + #13 +
               '  AND (PXA.CODPROCESSO = IT.CODPROCESSO) '                                   + #13 +
               '  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA) '                                  + #13 +
               '  AND (SC.IDRESERVAORCAMEN IS NOT NULL) '                                    + #13 +
               '  AND C.PRECOAVALORPRES IS NOT NULL '                                        + #13 +
               '  AND C.STATUS IN (''U'',''S'') '                                            + #13 +
               'ORDER BY SC.IDRESERVAORCAMEN '                                               + #13;

               cdsItensSumario.Data := GetDataPacket(SQL);

               while not cdsItensSumario.Eof do
               begin

                  fReserva := cdsItensSumario.FieldByName('IDRESERVAORCAMEN').AsFloat;
                  fTotalReserva  := 0;
                  fValorTotal    := 0;

                  while (fReserva = cdsItensSumario.FieldByName('IDRESERVAORCAMEN').AsFloat) and (not cdsItensSumario.Eof) do
                  begin
                     iNumReserva := _Orcamento.BuscaIdNumReserva(cdsItensSumario.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                                                 0,
                                                                 True);
                     fValorTotal    := fValorTotal + cdsItensSumario.FieldByName('PRECOTOTAL').AsFloat;

                     if iNumReserva > 0 Then
                     begin
                        cdsAux.Close;
                        cdsAux.Data := GetDataPacket('SELECT IDRESERVA ' + #13 +
                                                     'FROM RESXCOMP '    + #13 +
                                                     'WHERE IDRESERVA = ' + IntToSTr(iNumReserva)
                                                    );
                        if cdsAux.IsEmpty then
                        begin
                           cdsAux.Close;
                           cdsAux.Data   := GetDataPacket('SELECT NVL(VLRRESERVA,0) AS VLRRESERVA ' + #13 +
                                                          'FROM RESERVAORCAMEN '    + #13 +
                                                          'WHERE NUMRESERVA = ' + IntToSTr(iNumReserva)
                                                         );
                           fTotalReserva := fTotalReserva + cdsAux.FieldByName('VLRRESERVA').AsFloat;
                        end;
                     end;

                     cdsItensSumario.Next;
                  end;
                  
                  if (fTotalReserva > 0) and ( (fTotalReserva * fMargemOC) < fValorTotal ) then
                  begin
                     bValorIndev := True;
                     if sMensagem = '' then
                     begin
                        sMensagem := 'Essa{s) reserva(s) possui(em) valor(es) inferior(es) ao que está sendo aceito.' + #13 + #13;
                     end;

                     sMensagem := sMensagem + 'Reserva Nº: ' + IntToStr(iNumReserva) + '   Valor..: ' + FormatFloat('##,##0.00', fTotalReserva) + #13;
                  end;
               end;


               if bValorIndev then Raise Exception.Create( sMensagem );

           finally
               cdsAux.Free;
               cdsItensSumario.Free;
           end;


           bTemSelUsuario := False;
           //--------------------------------------------------------------------------------------------------------------------------
           // Verifica se tem seleção feita pelo usuario
           //--------------------------------------------------------------------------------------------------------------------------
           FcdsSumario.First;
           While Not FcdsSumario.Eof Do
              Begin
                 If (FcdsSumario.FieldByName('STATUS').AsString = 'U') Or ((FcdsSumario.FieldByName('STATUS').AsString = 'C')) Then
                    Begin
                       bTemSelUsuario := True;
                       Break;
                    End;
                 FcdsSumario.Next;
              End;

           If Not bTemSelUsuario Then
              Begin
                 FcdsSumario.First;
                 If (Not FcdsSumario.FieldByName('PRECOAVALORPRES').IsNull) and (FcdsSumario.FieldByName('STATUS').AsString = 'S') Then
                    Begin
                       FcdsSumario.Next;
                       If (FcdsSumario.EOF) Or (FcdsSumario.FieldByName('STATUS').AsString <> 'S') Or (FcdsSumario.FieldByName('STATUS').IsNull) Then
                          Begin
                             FcdsSumario.Prior;
                             FcdsSumario.Edit;
                             FcdsSumario.FieldByName('STATUS').AsString := 'C';
                             FcdsSumario.Post;

                             SQL := ' UPDATE COTACOES SET STATUS = ''C'''+
                                    ' WHERE  (CODPROCESSO = '+FcdsSumario.FieldByName('CODPROCESSO').asString+') '+
                                    '    AND (IDPROCXART  = '+FcdsSumario.FieldByName('IDPROCXART').asString+') '+
                                    '    AND (IDFORCLI    = '+FcdsSumario.FieldByName('IDFORCLI').asString+') '+
                                    '    AND (PROPOSTA    = '+FcdsSumario.FieldByName('PROPOSTA').asString+') ';
                             If Not ExecSQL( SQL ,True ) Then
                                Raise Exception.Create( MessageInfo );
                          End;
                    End;
              End;

           Commit;
        Except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;


function TCtrlCotacao.ProcessaStatus(CodProcesso: Double): boolean;
Var
  SQL        : String;
  cdsSumario : TClientDataSet;
  rValor     : Double;
  cdsSumarioAux: TClientDataSet;

        function UsuarioSelecionouRegistro(const cdsAux: TClientDataSet): boolean;
        begin
           cdsAux.Filtered := False;
           cdsAux.Filter := ('STATUS = ''C'' OR STATUS = ''U'' ');
           cdsAux.Filtered := True;
           Result := cdsAux.RecordCount > 0;
        end;


begin
  Result := True;
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaStatus( CodProcesso );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        cdsSumario := TClientDataSet.Create(nil);

        cdsSumarioAux := TClientDataSet.Create(nil);

        Try
            Try
               StartTransaction;
               _cds.Data := ListItensSumario(CodProcesso);
               _cds.First;
               While Not _cds.Eof Do
                  Begin
                     cdsSumario.Data := ListSumario(_cds.FieldByName('CODPROCESSO').AsFloat,
                                                     _cds.FieldByName('IDPROCXART').AsFloat);
                     cdsSumarioAux.Data := cdsSumario.Data;

                     cdsSumario.First;
                     If Not cdsSumario.FieldByName('PRECOAVALORPRES').IsNull Then
                        Begin
                           cdsSumario.Edit;
                           If cdsSumario.FieldByName('STATUS').AsString <> 'C' Then
                           begin
                              if not UsuarioSelecionouRegistro(cdsSumarioAux) then
                                 cdsSumario.FieldByName('STATUS').AsString := 'S';
                           end;

                           cdsSumario.Post;

                           rValor := cdsSumario.FieldByName('PRECOAVALORPRES').asFloat;

                           cdsSumario.Next;
                           While Not cdsSumario.EOF Do
                               Begin
                                   cdsSumario.Edit;
                                   If FloatsEqual(rValor,cdsSumario.FieldByName('PRECOAVALORPRES').AsFloat) Then
                                      Begin
                                        If cdsSumario.FieldByName('STATUS').AsString <> 'C' Then
                                        begin
                                          if not UsuarioSelecionouRegistro(cdsSumarioAux) then
                                             cdsSumario.FieldByName('STATUS').AsString := 'S';
                                        end;
                                      End
                                   Else
                                      If (cdsSumario.FieldByName('STATUS').AsString <> 'U') Then
                                          cdsSumario.FieldByName('STATUS').Clear;

                                   cdsSumario.Post;
                                   cdsSumario.Next;
                               End;
                        End;
                     //-----------------------------------------------------------------------
                     // Atualiza o STATUS da Cotação
                     //-----------------------------------------------------------------------
                     cdsSumario.First;
                     While Not cdsSumario.Eof Do
                        Begin
                           SQL := ' UPDATE COTACOES SET STATUS = '+QuotedStr(cdsSumario.FieldByName('STATUS').asString)+
                                  ' WHERE  (CODPROCESSO = '+cdsSumario.FieldByName('CODPROCESSO').asString+') '+
                                  '    AND (IDPROCXART  = '+cdsSumario.FieldByName('IDPROCXART').asString+') '+
                                  '    AND (IDFORCLI    = '+cdsSumario.FieldByName('IDFORCLI').asString+') '+
                                  '    AND (PROPOSTA    = '+cdsSumario.FieldByName('PROPOSTA').asString+') ';
                           If Not ExecSQL( SQL ,True ) Then
                              Raise Exception.Create( MessageInfo );

                           cdsSumario.Next;
                        End;

                     _cds.Next;
                  End;

               Commit;
            Except
               On E:Exception Do
                Begin
                   Rollback;
                   Result := False;
                   MessageInfo := E.Message;
                End;
            End;
         Finally
            cdsSumario.Free;

            cdsSumarioAux.Free
         End;
     End;
end;

Function TCtrlCotacao.GetSCIOC( CodProcesso,IdProcxArt : Integer ) : OleVariant;
Var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                   + #13 +
   '      SC.IDPROCESSO, '                                     + #13 +
   '      SC.NUMSOLCOMPRA, '                                   + #13 +
   '      SC.IDRESERVAORCAMEN '                                + #13 +
   'FROM '                                                     + #13 +
   '      COTACOES C, '                                        + #13 +
   '      PROCXART PXA, '                                      + #13 +
   '      ITEMSOLI IT, '                                       + #13 +
   '      SOLICOMP SC '                                        + #13 +
   'WHERE (C.CODPROCESSO = ' + IntToStr(CodProcesso) + ') '    + #13 +
   '  AND (C.IDPROCXART  = ' + IntToStr(IdProcxArt) + ')'      + #13 +
   '  AND ((C.STATUS = ''C'') OR (C.STATUS = ''U'')) '         + #13 +
   '  AND (PXA.CODPROCESSO = C.CODPROCESSO) '                  + #13 +
   '  AND (PXA.IDPROCXART  = C.IDPROCXART) '                   + #13 +
   '  AND (PXA.IDPROCXART  = IT.IDPROCXART) '                  + #13 +
   '  AND (PXA.CODPROCESSO = IT.CODPROCESSO) '                 + #13 +
   '  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA) '                + #13 +
   '  AND (SC.IDRESERVAORCAMEN IS NOT NULL) '                  + #13 +
   'GROUP BY '                                                 + #13 +
   '   SC.IDPROCESSO, '                                        + #13 +
   '   SC.NUMSOLCOMPRA, '                                      + #13 +
   '   SC.IDRESERVAORCAMEN '                                   + #13;

   Result := GetDataPacket(sSQL);
end;



Function TCtrlCotacao.Procurar( CodProcesso,IdProcxArt,Proposta,IdForCli,CodAlmoxarifado : Double ) : OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Append('SELECT                ');
      SQL.Append('     C.IDFORCLI,      ');
      SQL.Append('     C.IDPROCXART,    ');
      SQL.Append('     C.CODPROCESSO,   ');
      SQL.Append('     C.PROPOSTA,      ');
      SQL.Append('     C.QTDEFORNECIDA, ');
      SQL.Append('     C.PRECO,         ');
      SQL.Append('     C.CODMEDIDA,     ');
      SQL.Append('     C.NUMCOT,        ');
      SQL.Append('     C.DATACOT,       ');
      SQL.Append('     C.STATUS,        ');
      SQL.Append('     C.OBS,           ');
      SQL.Append('     C.MOECODIGO,     ');
      SQL.Append('     C.TXJUROS,        ');
      SQL.Append('     C.PRECOAVALORPRES,');
      SQL.Append('     C.CONTATO,        ');
      SQL.Append('     PXA.CODARTIGO,    ');
      SQL.Append('     PXA.QTDEPEDIDA,   ');
      SQL.Append('     PXA.CODMEDIDA AS UNIDPED, ');
      SQL.Append('     SUBSTR(DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO, ');
      SQL.Append('     P.RAZAOSOCIAL,   ');
      SQL.Append('     PR.CODPRODUTO,   ');
      SQL.Append('     PR.CODMEDCUSTO,  ');
      SQL.Append('     SA.SALDOQTDE,    ');
      SQL.Append('     G.CODTIPRECDES   ');
      SQL.Append('FROM                  ');
      SQL.Append('    PESSOA P,         ');
      SQL.Append('    COTACOES C,       ');
      SQL.Append('    PROCXART PXA,     ');
      SQL.Append('    SALDO SA,         ');
      SQL.Append('    PRODUTO PR,       ');
      SQL.Append('    ARTIGO A,         ');
      SQL.Append('    PRODVARI PV,      ');
      SQL.Append('    GRUPPROD G        ');
      SQL.Append('WHERE                 ');
      SQL.Append('      (C.CODPROCESSO   = '+FloatToStr( CodProcesso )+') ');
      SQL.Append('  AND (C.IDFORCLI      = '+FloatToStr( IdForCli )   +') ');
      SQL.Append('  AND (C.PROPOSTA      = '+FloatToStr( Proposta )   +') ');
      If IdProcxArt > 0 Then
         SQL.Append('  AND (C.IDPROCXART    = '+FloatToStr( IdProcxArt ) +') ');

      SQL.Append('  AND (SA.CODALMOXARIFADO(+) = '+FloatToStr(CodAlmoxarifado)+')');
      SQL.Append('  AND (C.IDPROCXART    = PXA.IDPROCXART)   ');
      SQL.Append('  AND (C.CODPROCESSO   = PXA.CODPROCESSO)  ');
      SQL.Append('  AND (C.IDFORCLI      = P.IDPESSOA)       ');
      SQL.Append('  AND (PXA.CODARTIGO   = A.CODARTIGO)      ');
      SQL.Append('  AND (PXA.CODARTIGO  = SA.CODARTIGO(+))   ');
      SQL.Append('  AND (A.CODPRODUTO    = PR.CODPRODUTO)    ');
      SQL.Append('  AND (PR.CODGRUPOPROD = G.CODGRUPOPROD)   ');
      SQL.Append('  AND (PXA.IDPRODVARI  = PV.IDPRODVARI(+)) ');
      SQL.Append('ORDER BY DESCRICAO    ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

procedure TCtrlCotacao.SetcdsCotacao(const Value: TClientDataSet);
begin
  FcdsCotacao := Value;
end;

procedure TCtrlCotacao.SetcdsPrazoEntrega(const Value: TClientDataSet);
begin
  FcdsPrazoEntrega := Value;
end;

procedure TCtrlCotacao.SetcdsPrazoPgto(const Value: TClientDataSet);
begin
  FcdsPrazoPgto := Value;
end;

procedure TCtrlCotacao.SetcdsSumario(const Value: TClientDataSet);
begin
  FcdsSumario := Value;
end;

procedure TCtrlCotacao.SetcdsValorAgreg(const Value: TClientDataSet);
begin
  FcdsValorAgreg := Value;
end;

procedure TCtrlCotacao.SetcdsValorAgregTela(const Value: TClientDataSet);
begin
  FcdsValorAgregTela := Value;
end;

procedure TCtrlCotacao.SetNumOC(const Value: Double);
begin
  FNumOC := Value;
end;

procedure TCtrlCotacao.SetNumOCFim(const Value: Double);
begin
  FNumOCFim := Value;
end;

function TCtrlCotacao.SimulaVencedores(CodProcesso: Double): OleVariant;
Var
   cdsWins   : TClientDataSet;
   SQL       : String;
   rIdForCli : Double;
   rIdPessoa : Double;
   rProposta : Double;
begin
   cdsWins := TClientDataSet.Create(nil);
   Try
      SQL := 'SELECT OBSOC, FLGTIPOFRETE, OBSOC AS RAZAOSOCIAL FROM OC WHERE (1=2) ';

      _cds.Data    := GetDataPacket( SQL );
      cdsWins.Data := ListVencedor(CodProcesso);
      cdsWins.First;
      If Not cdsWins.IsEmpty Then
         Begin
            rIdForCli := cdsWins.FieldByName('IDFORCLI').AsFloat;
            rIdPessoa := cdsWins.FieldByName('IDPESSOA').AsFloat;
            rProposta := cdsWins.FieldByName('PROPOSTA').AsFloat;

            _cds.Append;
            _cds.FieldByName('OBSOC').AsString         := '';
            _cds.FieldByName('FLGTIPOFRETE').asInteger := 0;
            _cds.FieldByName('RAZAOSOCIAL').AsString   := cdsWins.FieldByName('RAZAOSOCIAL').AsString;
            _cds.Post;

            While Not cdsWins.EOF DO
               Begin
                  If (Not FloatsEqual(cdsWins.FieldByName('IDFORCLI').AsFloat,rIdForCli) ) Or
                     (Not FloatsEqual(cdsWins.FieldByName('IDPESSOA').AsFloat,rIdPessoa) ) Or
                     (Not FloatsEqual(cdsWins.FieldByName('PROPOSTA').AsFloat,rProposta ))
                  Then
                     Begin
                        rIdForCli := cdsWins.FieldByName('IDFORCLI').AsFloat;
                        rIdPessoa := cdsWins.FieldByName('IDPESSOA').AsFloat;
                        rProposta := cdsWins.FieldByName('PROPOSTA').AsFloat;

                        _cds.Append;
                        _cds.FieldByName('OBSOC').AsString         := '';
                        _cds.FieldByName('FLGTIPOFRETE').asInteger := 0;
                        _cds.FieldByName('RAZAOSOCIAL').AsString   := cdsWins.FieldByName('RAZAOSOCIAL').AsString;
                        _cds.Post;
                     End;
                  cdsWins.Next;
               End;
         End;
   Finally
      Result := _cds.Data;
      cdsWins.Free;
   End;
end;

function TCtrlCotacao.ValidaDadosCotacao: Boolean;
Var
   rQtdeAtend : Double;
   rPercPag   : Double;
begin
 Result := True;
 If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ValidaDadosCotacao( FcdsCotacao.Data, FcdsPrazoEntrega.Data, FcdsPrazoPgto.Data, FcdsValorAgreg.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        If IsFloatZero(FcdsCotacao.FieldByName('PRECO').AsFloat) Then
        Begin
           Result := False;
           Self.MessageInfo := 'Preço igual a zero';
           Exit;
        End;

        rQtdeAtend := 0;
        FcdsPrazoEntrega.First;
        While Not FcdsPrazoEntrega.EOF Do
           Begin
               rQtdeAtend := rQtdeAtend + FcdsPrazoEntrega.FieldByName('QTDEENT').AsFloat;
               FcdsPrazoEntrega.Next;
           End;
        If (Not FloatsEqual(rQtdeAtend,FcdsPrazoEntrega.FieldByName('QTDEENT').AsFloat))
           And ( rQtdeAtend > FcdsPrazoEntrega.FieldByName('QTDEENT').AsFloat )
        Then
           Begin
              Result := False;
              Self.MessageInfo := 'Quatidade Fornecida de :'+Format('%12.2f',[rQtdeAtend])+' excede a fornecida';
              Exit;
           End;

        rPercPag := 0;
        FcdsPrazoPgto.First;
        While Not FcdsPrazoPgto.EOF Do
           Begin
               rPercPag := rPercPag + FcdsPrazoPgto.FieldByName('PERCENT').AsFloat;
               FcdsPrazoPgto.Next;
           End;
        If Not FloatsEqual(rPercPag,100) Then
           Begin
              Result := False;
              Self.MessageInfo := 'Percentual de pagamento :'+Format('%12.2f',[rPercPag])+' não é 100 %';
              Exit;
           End;
     End;

end;


{
=============================================================================================
 REGRAS DE CALCULO DO SUMÁRIO DE COTAÇÃO
=============================================================================================
  1) Para preços nulos ou igual a zero gravar nulo no PRECOAVALORPRES
  2) Adicionar ao PRECO todos os encargos (somando ou diminuindo)
  3) Para valores em outra moeda, converter para real  (Valitem)
  4) Para trazer a valor presente, utilizar a seguinte formula com
     os prazos.
     4.1) Fazer um while na query prazos
     4.2) VlPresente := 0 => Valor Presente
     4.3) VlPresente := VlPresente + ((Valitem * (PERCENT/100.00)) / ((1+(TXJUROS/100.00)) ** (PRAZOPGTO/30)))
}


function TCtrlCotacao.MsgOCsGeradas: string;
// Função para Montar a MENSAGEM a ser EXIBIDA no Término do Processo de Gerar OC's
// e Compromissos.
var
  i : integer;
begin
  // Ordena o Conteúdo das StringList's
  _OC.ListaMsgComp.Sort;
  _OC.ListaMsgOC.Sort;

  // Monta as OC's Geradas
  Result := MSG_OC_GERADAS;
  case _OC.ListaMsgOC.Count of
    0 : Result := Result + '';
    1 : Result := Result + #13 + _OC.ListaMsgOC[0];
  else
    begin
      Result := Result + #13 + _OC.ListaMsgOC[0];
      for i := 1 to _OC.ListaMsgOC.Count - 1 do
        Result := Result + #13 + _OC.ListaMsgOC[i];
    end;
  end;

  // Monta os Compromissos Gerados
  case _OC.ListaMsgComp.Count of
    0 : Result := Result + '';
    1 : Result := Result + #13 + _OC.ListaMsgComp[0];
  else
    begin
      Result := Result + #13 + _OC.ListaMsgComp[0];
      for i := 1 to _OC.ListaMsgComp.Count - 1 do
        Result := Result + #13 + _OC.ListaMsgComp[i];
    end;
  end;
end;

end.






