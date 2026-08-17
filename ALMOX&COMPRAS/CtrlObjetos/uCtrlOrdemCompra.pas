// Alterações:
{ --------------------------------------------------------------------------------------------------
Data      : 03.10.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 23375
Descrição : No cancelamento da OC, verificas as seguintes condições:
               . Se Somente uma OC está vinculada ao processo
               . Se o usuário deseja cancelar todas as Ocs
            Caso estas condições sejam satisfeitas, o número do processo será reutilizado.
-----------------------------------------------------------------------------------------------------
Data      : 20.09.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 26385
Descrição : Previne problemas caso o RAD esteja ativo e não exista tipo de processo vinculado ao mesmo.
-----------------------------------------------------------------------------------------------------
Data      : 17.05.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 25373
Descrição : O cancelamento de OC estava dobrando a quantidade de itens na solicitação
de compras.
---------------------------------------------------------------------------------
Data      : 26.04.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : (????) - descoberto na CM (não foi gerado por SOL do usuário)
Descrição : Na confirmação de um novo processo a ser criado, não exibia a mensagem com o novo número
            do processo gerado.
---------------------------------------------------------------------------------
Data      : 04.12.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 23860
Descrição : Implementação RAD+
---------------------------------------------------------------------------------
Rotina    : AfterApplyCdsRecord
Data      : 16.06.2006
Autor     : Antonio Marcos (amf)
Pendência : 22504
Descrição : lista para guardar as OCs(Inicial e Final) para impressão posterior.
----------------------------------------------------------------------------------
Rotina    : GerandoOc
Data      : 10/05/2006
Autor     : Antonio Marcos (amf)
Pendência : 22244
Descrição : Testa se a quantidade pedida é a mesma da quantidade pendente. Se for, é porque
            ainda não houve recebimento de mercadoria. Assim sendo, a quantidade pendente
            não deve ser atualizada.
-----------------------------------------------------------------------------------------
Rotina    : AfterApplyCdsRecord
Data      : 05/09/2005
Autor     : Andre Tavares
Pendência : 20374
Descrição : acerto na criação do compromisso,  1 oc = 1 compromisso
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Gravar
Data      : 17/08/2005
Autor     : Rodolpho da Silva
Pendência : 17895
Descrição : Não permitir gerar lançamento de previsão do CAP caso o recebimento da mercadoria seja
            sem O.C.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AfterApplyCdsRecord
Data      : 09/05/2005
Autor     : Rodolpho da Silva
Pendência : 19199
Descrição : Correção do erro que ao inserir um imposto agregado a um item de O.C., estava travando
            o sistema.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversos
Data      : 03/05/2005
Autor     : Rodolpho da Silva
Pendência : 18764
Descrição : Não permitir que seja zerada o campo QTDEPENDENTE da tabela
            ITEMSOLI
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CtrlOrdemCompra.LancaPrevisaoCAP
Data      : 04/08/2004
Autor     : Andre Tavares
Pendência : 17280
Descrição : Quando no Contas a Pagar estar preenchido o parametro com nº de vencimento,
o sistema não está permitindo o lançamento de notas com vencimento futuro ou do dia.
A mensagem do erro é: USUARIO SEM PRIVILÉGIO DE LANÇAR/ ALTERAR DOCUMENTO COM DATA DE VENCIMENTO INDICADO.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CtrlOrdemCompra.AfterApplyCdsRecord
Data      : 22/07/2004
Autor     : Marchetti
Pendência : 17234
Descrição : Não estava gravando o prazo de entrega e a data de pagamento,
            com isso estava dando erro no relatório de Ordem de Compras -  Modelo 2
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CtrlOrdemCompra.AfterApplyCdsRecord
Data      : 12/07/2004
Autor     : Marchetti
Pendência : 16790
Descrição : Somente gerar processo RAD quando OC for sem cotação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CtrlOrdemCompra.AfterApplyCdsRecord
Data      : 23/06/2004
Autor     : André Pontes
Pendência : 17062
Descrição : Criados blocos de try..except no momento da Atualização do Prazo de Entrega e
            Atualização do Prazo de Pagamento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ?
Data      : ?
Autor     : MArchetti
Pendência : ?
Descrição : Várias alterações
---------------------------------------------------------------------------------------------------}
// acertos gerais para compatibilizar com fontes do Igor e acerto do cancelamento de OC
// FDias - 13.10.2003
// pendência 15181 - FDias - 14.10.2003

unit uCtrlOrdemCompra;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject, sysUtils,
     dbclient, uSistema ,Classes,uMidasUtil, uCMMath,
     uDbAgregItemOC, uDbOc, uDbItemOC, uDbAgregTotOC,
     uDbPrazoPgtoOC, uDbPrazoEntregaOC, uDbSCItemOC,
     uDbProcesso, uDbCotacoes, uDbProcxArt, uDbPrazoPgto,
     uDbPrazoentrega,uDbValorAgregCot, uCMTypes, uCmSQLParams,
     uCtrlRAD, uCtrlDocumento, uCtrlOrcamento, uCtrlUnMedida,
     uCtrlReservaOrcamen, uFuncoesOrcamento, uCtrlResXComp, JCLMath,

     
     uCtrlRADPlus;

Const
   MSG_OC_CANCELADA_OK     = ' O.C. Cancelada com Sucesso ';

   MSG_OC_GERADAS          = 'Documento(s) Gerado(s): ';

   MSG_ITEMOC_CANCELADO_OK = ' Item Cancelado com Sucecsso ';
   MSG_GERADO_PROCCOMPRA   = ' Gerado o processo de compras Nº ';
   MSG_ITEMOC_NAO_ACHEI    = ' Item da O.C. não foi encontrado ';

   MSG_REUTILIZA_PROCESSO  = ' O número do processo será reutilizado ';

Type
  TCtrlOrdemCompra = class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;
    Procedure OnCreateAppServer; Override;

  private
    slOCGerada : TStringList;
    _RAD       : TCtrlRAD;

    RADplus: TCtrlRADPlus;
    IdProcesso: integer;

    _Documento : TCtrlDocumento;
    _Orcamento : TOrcamentoBackMT;
    _UnMedida  : TCtrlUnMedida;
    CReservaOrcamen   : TCtrlReservaorcamen;

    CtrlResXComp : TCtrlResXComp;

    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbAgregItemOC     : TDbAgregItemOC;
    _DbOC              : TDbOC;
    _DbItemOC          : TDbItemOC;
    _DbAgregTotOC      : TDbAgregTotOC;
    _DbPrazoPgtoOC     : TDbPrazoPgtoOC;
    _DbPrazoEntregaOC  : TDbPrazoEntregaOC;
    _DbSCItemOC        : TDbSCItemOC;
    _DbProcesso        : TDbProcesso;
    _DbCotacoes        : TDbCotacoes;
    _DbProcxArt        : TDbProcxArt;
    _DbPrazoPgto       : TDbPrazoPgto;
    _DbPrazoentrega    : TDbPrazoentrega;
    _DbValorAgregCot   : TDbValorAgregCot;

    FcdsPrazoPgtoOC: TClientDataSet;
    FcdsAgregTotOC: TClientDataSet;
    FcdsAgregItemOC: TClientDataSet;
    FcdsItemOC: TClientDataSet;
    FcdsPrazoEntregaOC: TClientDataSet;
    FcdsSCItemOC: TClientDataSet;
    FcdsOC: TClientDataSet;
    FNumOC: Double;
    FNumOCFim: Double;
    FPrevisaoCap: Boolean;

    iNumReservaAnt  : Int64;
    iIdCompromisso  : Integer;
    iNumCompromisso : Integer;
    FValorOC        : Extended;
    FOCJaCancelada  : boolean;

    //  Esta variável global é somente utilizada dentro do método AfterApplyCdsRecord
    // e a função dela é indicar se o processo em foco é uma O.C. sem cotação.
    //  É instanciada dentro do método Gravar.
    bOrdemCompraSemCotacao   : boolean;



    procedure SetcdsAgregItemOC(const Value: TClientDataSet);
    procedure SetcdsAgregTotOC(const Value: TClientDataSet);
    procedure SetcdsItemOC(const Value: TClientDataSet);
    procedure SetcdsOC(const Value: TClientDataSet);
    procedure SetcdsPrazoEntregaOC(const Value: TClientDataSet);
    procedure SetcdsPrazoPgtoOC(const Value: TClientDataSet);
    procedure SetcdsSCItemOC(const Value: TClientDataSet);
    function  MontaVetorOrcamento(iNumSolCompra : Double) : Integer;
    procedure SetNumOC(const Value: Double);
    procedure SetNumOCFim(const Value: Double);

    function GetPrazoPgto(CodProcesso, IdProcxArt, Proposta, IdForCli: Double): OleVariant;

    function GetPrazoEntrega(CodProcesso, IdProcxArt, Proposta, IdForCli: Double): OleVariant;

    function BuscaIdNumReserva(const NumReserva:Integer;
                               const bMostraMsg:Boolean
                               ):Integer;

    function EstornaCompromisso(iNumReserva:longint;
                                rValor:extended;
                                bExibeMsg: boolean
                               ):Integer;

    // INÍCIO: Marcio Motta - 18065 - 24/02/2005
    function IntegraOrcamento: boolean;
    function BuscaMargemQuebra: double;
    function BuscaValorReserva(const iNumReserva: double): double;
    function BuscaNumReserva(const iNumSolCompra: double): double;
    function BuscaTotalSCI(iNumSolCompra: double): double;
    //    FIM: Marcio Motta - 18065 - 24/02/2005


    function MsgOCsGeradas: string;


    {**
       Lança a previsão de pagamento no sistema de contas a pagar
    **}
    function LancaPrevisaoCAP : Boolean;
    {**
       Exclui a previsão de pagamento no sistema de contas a pagar
       quando cancelamos a OC
    **}
    procedure SetPrevisaoCap(const Value: Boolean);

    function GetReservaDaOC(numOC : double): integer;

  Public
     sGerar     : String;

     //  Informa se o recebimento da mercadoria é com ordem de compra
     bRecebimentoComOC : Boolean;
     iIdModulo         : Double;

     ListaMsgOC, ListaMsgComp : TStringList;

     stlImpOCs: TStringList;

     Property cdsOC             : TClientDataSet read FcdsOC write SetcdsOC;
     Property cdsItemOC         : TClientDataSet read FcdsItemOC write SetcdsItemOC;
     Property cdsPrazoPgtoOC    : TClientDataSet read FcdsPrazoPgtoOC write SetcdsPrazoPgtoOC;
     Property cdsPrazoEntregaOC : TClientDataSet read FcdsPrazoEntregaOC write SetcdsPrazoEntregaOC;
     Property cdsSCItemOC       : TClientDataSet read FcdsSCItemOC write SetcdsSCItemOC;
     Property cdsAgregItemOC    : TClientDataSet read FcdsAgregItemOC write SetcdsAgregItemOC;
     Property cdsAgregTotOC     : TClientDataSet read FcdsAgregTotOC write SetcdsAgregTotOC;
     Property NumOC             : Double read FNumOC write SetNumOC;
     Property NumOCFim          : Double read FNumOCFim write SetNumOCFim;
     Property PrevisaoCap       : Boolean read FPrevisaoCap write SetPrevisaoCap;

     property OcJaCancelada     : boolean read FOcJaCancelada;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------

    function QtdCompromissos(idReserva: double): integer;
    function BuscaIdReserva(NumOC: double): double;
    function BuscaNumOC(IdItemOC: double): double;

    function DeletaPrevisaoCAP(IdPessoa, NumOC: Double): Boolean;

    {**
       Grava o Ordem de Compra
    **}
    Function Gravar( IdUsuario : Double; bOCSemCotacao: boolean = false) : Boolean;


    {**
       Exclui a Ordem de Compra
    **}
    Function Excluir : Boolean;
    {**
       Lista as OC´s
    **}
    Function ListOC( NumOC : Double = 0; MostraForn : Boolean = False ) : OleVariant;
    {**
       Pega os Itens de uma Ordem de Compra
    **}
    Function GetItemOC(IdPessoa,NumOC : Double ) : OleVariant;
    {**
       Pega os Prazos de pagamentos de um item de uma Ordem de Compra
    **}
    Function GetPrazoPgtoOC( IdItemOC : Double ) : OleVariant; OverLoad;
    Function GetPrazoPgtoOC( NumOC : LongInt ) : OleVariant; OverLoad;
    {**
       Pega os Prazos de entrega de um item de uma Ordem de Compra
    **}
    Function GetPrazoEntregaOC( IdItemOC : Double ) : OleVariant; OverLoad;
    Function GetPrazoEntregaOC( NumOC : LongInt ) : OleVariant;  OverLoad;
    {**
       Pega as SCI´s associadas a um item de uma Ordem de Compra
    **}
    Function GetSCItemOC( IdItemOC : Double ) : OleVariant; OverLoad;
    Function GetSCItemOC( NumOC : LongInt ) : OleVariant; OverLoad;
    {**
       Pega os Custos agregados de um item de uma Ordem de Compra
    **}
    Function GetAgregItemOC( IdItemOC : Double ): OleVariant; OverLoad;
    Function GetAgregItemOC( NumOC : LongInt ): OleVariant; OverLoad;
    {**
       Pega os Custos agregados de uma Ordem de Compra
    **}
    Function GetAgregOC( NumOC : Double ): OleVariant;
    {**
       Verifica se a Ordem de Compra pode ser Camcelada
    **}
    Function PodeCancelarOC( NumOC : Double ) : Boolean;
    {**
       Cancela o item da Ordem de Compra
    **}
    Function CancelaItemOC( IdPessoa    : Double;
                            IdItemOC    : Double;
                            TemCotacao  : Boolean;
                            CodProcesso   : Double = 0;
                            bGeraProcesso : Boolean = False) : Boolean;
    {**
       Cancela a Ordem de Compra toda
    **}
    Function CancelaOC( IdPessoa     : Double;
                        NumOC        : Double;
                        GeraProcesso : Boolean ) : Boolean;
    {**
       Listas a Solicitações de compra que deram origem ao
       item de ordem de compra
    **}
    Function ListSCIOrigem( IdItemOC : Double ) : OleVariant;
    {**
       Pega o ultimo contato feio com aquele fornecedor
    **}
    Function GetUltContato ( IdPessoa,IdForCli : Double ) : String;
    {**
       Pega o ultimo contato feio com aquele fornecedor
    **}
    Function BaixaOC ( IdItemOC          : Double;
                       Quantidade        : Double;
                       CodMedida         : String;
                       DeixaQtdePendente : Boolean ) : Boolean;

    Function GetSCIOrigem( NumOC : Double ) : OleVariant;

    {**
      Testa se a quantidade pedida é a mesma da quantidade pendente. Se for, é porque ainda
      não houve recebimento de mercadoria. Assim sendo, a quantidade pendente não deve ser
      atualizada.
    **}
    function GerandoOC(iItemSoli: integer): boolean;

    {*
       Total de OCs vinculadas ao processo.
       Se existe somente uma OC vinculada ao processo, atende a primeira condição
       para reaproveitamento do número de processo
    *}
    function ocsVinculadasAoProcesso(codProcesso: extended): integer;
  End;





implementation

{ TCtrlOrdemCompra }


procedure TCtrlOrdemCompra.AfterApplyCdsRecord(aCds: TClientDataSet; const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
Var
   SQL             : String;
   iNumSolCompra   : Integer;
   iNumReserva     : Integer;
   x,y             : Integer;
   iOrcamento      : Array [0..100] of Integer;

   FValorSCI : double;

   // Substituído pela function "IntegraOrcamento" pois esta verificação será
   // utilizada em outros lugares neste CTRL
   // ***********************************************************************
   // FCdsAux         : TClientDataSet;
   // bIntegraOrc     : Boolean;
   // ***********************************************************************
begin
  Accept := True;
  // Tipos disponíveis = (usUnmodified, usModified, usInserted, usDeleted)

  iIdCompromisso  := 0;
  iNumCompromisso := 0;

  inherited;
  If sTableName = 'OC' Then
     Begin
        FValorOC := aCds.FieldByName('VALOROC').AsFloat;
        If CdsState = usInserted Then
          Begin
             //------------------------------------------------------------------------------------------------------
             // Gravar o R.A.D.
             //------------------------------------------------------------------------------------------------------

             if aCds.FieldByName('FLGCOMSEMCOT').AsString <> 'C' then
             begin
                 if (Sistema.UsaRAD) then
                 begin
                   if (Sistema.VersaoRAD = '+') then
                   begin
                       RadPlus.InicializaPropriedades;
                       RADPlus.IdEventoGerador := 5;
                       RADPlus.IdUsuario       := Sistema.IdUsuario;
                       RADPlus.IdEmpresa       := Sistema.IdEmpresa;
                       RadPlus.VlrProc         := aCds.FieldByName('VALOROC').AsFloat;
                       RadPlus.OBS             := 'O.C. Número : '+ _DbOC.NumOC.AsString;
                       RadPlus.IdEmpresa       := _DbOC.IdPessoa.AsInteger;

                       RADPlus.CodGrupoProd    := aCds.FieldByName('GRUPOPROD').AsString;

                       IdProcesso := RADPlus.IniciarProcesso;

                       if idProcesso = 0 then
                       begin
                         if ( radPlus.RecuperaTipoProcesso(5, sistema.IdEmpresa) = 0 ) then
                            Accept := True
                         else
                            Raise Exception.Create( RADPlus.MessageInfo );
                       end
                       else
                       begin
                          SQL := ' UPDATE OC SET IDPROCESSO = '+FloatToStr(IdProcesso)+
                                 ' WHERE  (NUMOC = '+_DbOC.NumOC.AsString+') ';

                          If Not ExecSQL( SQL ,True ) Then
                             Raise Exception.Create( MessageInfo );
                       end;
                   end
                   else
                   begin
                      _RAD.TipoProcesso := _RAD.GetTipoProcesso( 5 , _DbOC.IdPessoa.AsInteger); // É fixa a referência
                      If _RAD.TipoProcesso > 0 Then
                      Begin
                         _RAD.Valor        := aCds.FieldByName('VALOROC').AsFloat;
                         _RAD.OBS          := 'O.C. Número : '+ _DbOC.NumOC.AsString;
                         _RAD.IdPessoa     := _DbOC.IdPessoa.AsInteger;
                         _RAD.IdUsuario       := Sistema.IdUsuario;
                         IdProcesso := _RAD.IniciarProcesso;

                         If IdProcesso < 0 Then
                            Raise Exception.Create( _RAD.MessageInfo );

                         SQL := ' UPDATE OC SET IDPROCESSO = '+FloatToStr(IdProcesso)+
                                ' WHERE  (NUMOC = '+_DbOC.NumOC.AsString+') ';

                         If Not ExecSQL( SQL ,True ) Then
                            Raise Exception.Create( MessageInfo );
                      End;
                   end;
                 end;
             end;

             ListaMsgOC.Add('O.C. Nº : ' + _DbOC.NumOC.AsString);

             //------------------------------------------------------------------------------------------------------
             // Atualizaza os números das  OC´s geradas inicial e final
             //------------------------------------------------------------------------------------------------------
             IF FNumOC = 0 Then
                FNumOC := _DbOC.NumOC.AsFloat;

             FNumOCFim := _DbOC.NumOC.AsFloat;

             slOCGerada.Add(_DbOC.NumOC.AsString);

             stlImpOCs.Add(_DbOC.NumOC.AsString);
             FNumOC    := StrToFloat(stlImpOCs.Strings[0]);
             FNumOCFim := StrToFloat(stlImpOCs.Strings[Pred(stlImpOCs.Count)]);

             //------------------------------------------------------------------------------------------------------
             // Atualizaza Item OC
             //------------------------------------------------------------------------------------------------------
             Try
                if FcdsItemOC.FieldByName('NUMOC').AsInteger > 0 then
                begin
                   FcdsItemOC.Filter := 'NUMOC ='+_DbOC.NumOC.AsString;
                FcdsItemOC.Filtered := True;
                end;

                FcdsItemOC.First;
                While Not FcdsItemOC.Eof Do
                   Begin
                      FcdsItemOC.Edit;
                      FcdsItemOC.FieldByName('NUMOC').AsFloat := _DbOC.NumOC.AsFloat;
                      FcdsItemOC.Post;

                      //---------------------------------------------------------------------
                      // Não pode colocar o NEXT pois estamos filtrando os registros
                      // então ao efetuar o POST, o registro some.
                      //---------------------------------------------------------------------

                      if not FcdsItemOC.Filtered then FcdsItemOC.Next;

                   End;
             Finally
                if FcdsItemOC.Filtered then
                begin
                FcdsItemOC.Filter   := '';
                FcdsItemOC.Filtered := False;
                end;
             End;

          //------------------------------------------------------------------------------------------------------
          // Verifica se é sem OC, e baixa a quantidade do ITEM SCI
          //------------------------------------------------------------------------------------------------------
          If Not aCds.FieldByName('CONTATO').IsNull Then
             Begin
                SQL := ' UPDATE EMPRESAFORN SET ULTCONTATO = '+ QuotedStr(aCds.FieldByName('CONTATO').AsString) +
                       ' WHERE (IDFORCLI = '+aCds.FieldByName('IDFORCLI').asString +')'+
                       '   AND (IDPESSOA = '+aCds.FieldByName('IDPESSOA').asString +')';

                If Not ExecSQL(SQL, True) Then
                   Raise Exception.Create( MessageInfo );
             End;
          End;

     End;

  If sTableName = 'ITEMOC' Then
     Begin
        If CdsState = usInserted Then
          Begin
             // Verifica se é com cotação
             IF Not acds.FieldByName('CODPROCESSO').IsNull Then
                Begin
                   SQL := ' UPDATE COTACOES SET IDITEMOC = '+_DbItemOC.IdItemOC.AsString+
                          ' WHERE  (CODPROCESSO = '+acds.FieldByName('CODPROCESSO').asString+') '+
                          '    AND (IDPROCXART  = '+acds.FieldByName('IDPROCXART').asString+') '+
                          '    AND (IDFORCLI    = '+acds.FieldByName('IDFORCLI').asString+') '+
                          '    AND (PROPOSTA    = '+acds.FieldByName('PROPOSTA').asString+') ';

                   If Not ExecSQL( SQL ,True ) Then
                      Raise Exception.Create( MessageInfo );

                End;
             //------------------------------------------------------------------------------------------------------
             // Atualizaza Prazo de Entrega
             //------------------------------------------------------------------------------------------------------


             Try
                FcdsPrazoEntregaOC.Filter := 'IDITEMOC ='+acds.FieldByName('IDITEMOC').AsString;
                FcdsPrazoEntregaOC.Filtered := True;
                FcdsPrazoEntregaOC.First;


                While Not FcdsPrazoEntregaOC.Eof Do
                   Begin

                      FcdsPrazoEntregaOC.Edit;
                      FcdsPrazoEntregaOC.FieldByName('IDITEMOC').AsFloat := _DbItemOC.IdItemOC.AsFloat;
                      FcdsPrazoEntregaOC.Post;
                      FcdsPrazoEntregaOC.Next;
                   End;

             Finally
                FcdsPrazoEntregaOC.Filter   := '';
                FcdsPrazoEntregaOC.Filtered := False;
             End;


             //------------------------------------------------------------------------------------------------------
             // Atualiza Prazo de Pagamento
             //------------------------------------------------------------------------------------------------------

             Try
                FcdsPrazoPgtoOC.Filter := 'IDITEMOC ='+acds.FieldByName('IDITEMOC').AsString;
                FcdsPrazoPgtoOC.Filtered := True;
                FcdsPrazoPgtoOC.First;
                While Not FcdsPrazoPgtoOC.Eof Do
                  Begin
                    FcdsPrazoPgtoOC.Edit;
                    FcdsPrazoPgtoOC.FieldByName('IDITEMOC').AsFloat := _DbItemOC.IdItemOC.AsFloat;
                    FcdsPrazoPgtoOC.Post;
                    FcdsPrazoPgtoOC.Next;
                  End;

             Finally
                FcdsPrazoPgtoOC.Filter   := '';
                FcdsPrazoPgtoOC.Filtered := False;
             End;


             //------------------------------------------------------------------------------------------------------
             // Atualizaza Agregados do Item
             //------------------------------------------------------------------------------------------------------

             Try
                FcdsAgregItemOC.Filter := 'IDITEMOC ='+acds.FieldByName('IDITEMOC').AsString;
                FcdsAgregItemOC.Filtered := True;
                FcdsAgregItemOC.First;
                While Not FcdsAgregItemOC.Eof Do
                   Begin
                      FcdsAgregItemOC.Edit;
                      FcdsAgregItemOC.FieldByName('IDITEMOC').AsFloat := _DbItemOC.IdItemOC.AsFloat;
                      FcdsAgregItemOC.Post;



                      if (FcdsAgregItemOC.FieldByName('IDITEMOC').AsFloat = aCds.FieldByName('IDITEMOC').AsFloat) then
                         FcdsAgregItemOC.Next;


                      //---------------------------------------------------------------------
                      // Não pode colocar o NEXT pois estamos filtrando os registros
                      // então ao efetuar o POST, o registro some.
                      //---------------------------------------------------------------------
                   End;
             Finally
                FcdsAgregItemOC.Filter   := '';
                FcdsAgregItemOC.Filtered := False;
             End;
             //------------------------------------------------------------------------------------------------------
             // Atualização SCITEMOC
             //------------------------------------------------------------------------------------------------------

             Try
                for y := 0 to 100 do iOrcamento[y] := 0;

                y := 0;

                FcdsSCItemOC.Filter := 'IDITEMOC ='+acds.FieldByName('IDITEMOC').AsString;
                FcdsSCItemOC.Filtered := True;

                FcdsSCItemOC.First;
                While Not FcdsSCItemOC.Eof Do
                  Begin
                    iNumSolCompra := FcdsSCItemOC.FieldByName('NUMSOLCOMPRA').AsInteger;

                    // Busca o total da Solicitacao de Compra
                    FValorSCI := BuscaTotalSCI(iNumSolCompra);

                    //------------------------------------------------------------------------------------------
                    // Buscando as Reservas orçamentárias a serem efetivadas
                    //------------------------------------------------------------------------------------------
                    iNumReserva := MontaVetorOrcamento(iNumSolCompra);
                    if iNumReserva > 0 then
                      begin
                        iOrcamento[y] := iNumReserva;
                        Inc(y);
                      end;

                    FcdsSCItemOC.Next;
                  End;

                //---------------------------------------------------------------------
                //Grava o Compromisso Orçamentário
                //---------------------------------------------------------------------





                if IntegraOrcamento then

                  begin
                    // CRIA O COMPROMISSO

                      if GetReservaDaOC(_dbItemOC.NumOC.AsFloat) = 0 then
                      begin

                        if (iOrcamento[0] > 0) then
                          begin
                            iNumCompromisso := _Orcamento.CriaCompromisso(DateToStr(Date),FValorSCI,'',113,iOrcamento,True,True);

                            if iNumCompromisso <= 0 then
                              Raise Exception.Create( _Orcamento.MessageInfo );

                            iIdCompromisso := BuscaIdNumReserva(iNumCompromisso,True);

                            ListaMsgComp.Add('Compromisso Nº : ' + IntToStr(iIdCompromisso));

                            iNumReservaAnt := iOrcamento[0];

                            GravaLogPLANEORC('uCtrlOrdemCompra.AfterApplyCdsRecord: Gerado Compromisso nº ' + IntToStr(iIdCompromisso),
                                              Sistema.IdModulo,
                                              Sistema.IdUsuario);

                          end;

                        // GRAVA O ID DO COMPROMISSO NA TABELA ITEMOC
                        // => Só não entra no IF acima e passa por aqui, quando for
                        //    o último compromisso a ser criado, pois ele já virá
                        //    criado da UCtrlCotacao.
                        //    Na rotina acima, acabamos de CRIAR o COMPROMISSO e
                        //    precisamos gravar na Tabela ITEMOC
                        if iIdCompromisso > 0 then
                          begin
                            SQL := 'UPDATE ITEMOC SET IDRESERVAORCAMEN = '+IntToStr(iNumCompromisso)+' WHERE NUMOC = '+_dbItemOC.NumOC.AsString;

                            if not ExecSql(SQL, True) then Raise Exception.Create( MessageInfo );
                          end;
                      end
                      else begin
                        // GRAVA O ID DO COMPROMISSO NA TABELA ITEMOC
                        // => Quando for o último Compromisso, já virá criado pela
                        //    UCtrlCotacao e precisa ser gravado na Tabela ITEMOC

                        iNumCompromisso := GetReservaDaOC(_dbItemOC.NumOC.AsFloat);

                        SQL := 'UPDATE ITEMOC SET IDRESERVAORCAMEN = '+IntToStr(iNumCompromisso)+' WHERE NUMOC = '+_dbItemOC.NumOC.AsString;

                        if not ExecSql(SQL, True) then Raise Exception.Create( MessageInfo );
                      end;
                  end; // if IntegraOrcamento

             Finally
                FcdsSCItemOC.Filter   := '';
                FcdsSCItemOC.Filtered := False;
             End;

             //------------------------------------------------------------------------------------------------------
             // Verifica se é sem OC, e baixa a quantidade do ITEM SCI
             //------------------------------------------------------------------------------------------------------

             {**
                Na geração da OC, a quantidade pendente na ITEMSOLI não deve ser atualizada
             **}

             if (not GerandoOC(aCds.FieldByName('IDITEMSOLI').AsInteger)) then
             begin
                If Not aCds.FieldByName('IDITEMSOLI').IsNull Then
                Begin
                  SQL := ' UPDATE ITEMSOLI SET QTDEPENDENTE = QTDEPENDENTE - '+ FloatToStrCM( _DbItemOC.QtdePedida.AsFloat ) +
                         ' WHERE ( IDITEMSOLI = '+aCds.FieldByName('IDITEMSOLI').asString +')';

                  If Not ExecSQL(SQL, True) Then
                    Raise Exception.Create( MessageInfo );
                End;
             end;

          End;
     End;
end;


constructor TCtrlOrdemCompra.Create;
begin
  inherited;

  ListaMsgOC   := TStringList.Create;
  ListaMsgComp := TStringList.Create;

  slOCGerada        := TStringList.Create;
  FPrevisaoCap      := True;

  _DbAgregItemOC    := TDbAgregItemOC.Create(Self);
  _DbOC             := TDbOC.Create(Self);
  _DbItemOC         := TDbItemOC.Create(Self);
  _DbAgregTotOC     := TDbAgregTotOC.Create(Self);
  _DbPrazoPgtoOC    := TDbPrazoPgtoOC.Create(Self);
  _DbPrazoEntregaOC := TDbPrazoEntregaOC.Create(Self);
  _DbSCItemOC       := TDbSCItemOC.Create(Self);
  _DbProcesso       := TDbProcesso.Create(Self);
  _DbCotacoes       := TDbCotacoes.Create(Self);
  _DbProcxArt       := TDbProcxArt.Create(Self);
  _DbPrazoPgto      := TDbPrazoPgto.Create(Self);
  _DbPrazoentrega   := TDbPrazoentrega.Create(Self);
  _DbValorAgregCot  := TDbValorAgregCot.Create(Self);

  _RAD              := TCtrlRAD.Create;
  RADPlus           := TCtrlRADPlus.Create;


  _Documento        := TCtrlDocumento.Create;
  _Orcamento        := TOrcamentoBackMT.Create;
  _UnMedida         := TCtrlUnMedida.Create;

  _Orcamento.IdEmpresa := Sistema.IdEmpresa;
  CReservaOrcamen  := TCtrlReservaorcamen.Create;

  CtrlResXComp := TCtrlResXComp.Create;

  stlImpOCs := TStringList.Create;

end;




destructor TCtrlOrdemCompra.Destroy;
begin
  if IsAppServer Then
     FreeCds([FcdsOC,FcdsItemOC,FcdsPrazoPgtoOC,FcdsPrazoEntregaOC,
              FcdsSCItemOC,FcdsAgregItemOC,FcdsAgregTotOC]);

  _DbAgregItemOC.Free;
  _DbOC.Free;
  _DbItemOC.Free;
  _DbAgregTotOC.Free;
  _DbPrazoPgtoOC.Free;
  _DbPrazoEntregaOC.Free;
  _DbSCItemOC.Free;
  _DbProcesso.Free;
  _DbCotacoes.Free;
  _DbProcxArt.Free;
  _DbPrazoPgto.Free;
  _DbPrazoentrega.Free;
  _DbValorAgregCot.Free;

  _RAD.Free;

  FreeAndNil(RADPlus);

  _Documento.Free;
  slOCGerada.Free;
  _Orcamento.Free;
  _UnMedida.Free;
  CReservaOrcamen.Free;

  FreeAndNil(CtrlResXComp);
  FreeAndNil(ListaMsgOC);
  FreeAndNil(ListaMsgComp);

  FreeAndNil(stlImpOCs);
  inherited;
end;




procedure TCtrlOrdemCompra.DoChangeDataBase;
begin
  inherited;
  _DbAgregItemOC.DataBaseName    := DataBaseName;
  _DbOC.DataBaseName             := DataBaseName;
  _DbItemOC.DataBaseName         := DataBaseName;
  _DbAgregTotOC.DataBaseName     := DataBaseName;
  _DbPrazoPgtoOC.DataBaseName    := DataBaseName;
  _DbPrazoEntregaOC.DataBaseName := DataBaseName;
  _DbSCItemOC.DataBaseName       := DataBaseName;
  _DbProcesso.DataBaseName       := DataBaseName;
  _DbCotacoes.DataBaseName       := DataBaseName;
  _DbProcxArt.DataBaseName       := DataBaseName;
  _DbPrazoPgto.DataBaseName      := DataBaseName;
  _DbPrazoentrega.DataBaseName   := DataBaseName;
  _DbValorAgregCot.DataBaseName  := DataBaseName;
end;




function TCtrlOrdemCompra.Excluir: Boolean;
Var
   Msg : String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirOrdemCompra(FcdsOC.Data,FcdsItemOC.Data,FcdsPrazoPgtoOC.Data,FcdsPrazoEntregaOC.Data,
                                                       FcdsSCItemOC.Data,FcdsAgregItemOC.Data,FcdsAgregTotOC.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsAgregTotOC,_DbAgregTotOC,[],[] );
           Msg    := _DbAgregTotOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsAgregItemOC,_DbAgregItemOC,[],[] );
           Msg    := _DbAgregItemOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsPrazoEntregaOC,_DbPrazoEntregaOC,[],[] );
           Msg    := _DbPrazoEntregaOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsPrazoPgtoOC,_DbPrazoPgtoOC,[],[] );
           Msg    := _DbPrazoPgtoOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsItemOC,_DbItemOC,[],[] );
           Msg    := _DbItemOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsOC,_DbOC,[],[] );
           Msg    := _DbOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;




function TCtrlOrdemCompra.GetAgregItemOC(IdItemOC: Double): OleVariant;
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
      SQL.Add('     (AI.IDITEMOC = '+FloatToStr(IdItemOC)+')   ');
      SQL.Add(' AND (TA.FLGINCIDECOMPRA = ''S'') ');
      SQL.Add(' AND (AI.CODTIPOCUSTAGREG(+) = TA.CODTIPOCUSTAGREG)');
      SQL.Add('ORDER BY TA.DESCCUSTAGREG ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;




function TCtrlOrdemCompra.GetAgregItemOC(NumOC: LongInt): OleVariant;
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
      SQL.Add('     (IDITEMOC IN (SELECT IDITEMOC FROM ITEMOC WHERE (NUMOC = '+FloatToStr(NumOC)+' ) ) ) ');
      SQL.Add(' AND (TA.FLGINCIDECOMPRA = ''S'') ');
      SQL.Add(' AND (AI.CODTIPOCUSTAGREG(+) = TA.CODTIPOCUSTAGREG)');
      SQL.Add('ORDER BY TA.DESCCUSTAGREG ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;




function TCtrlOrdemCompra.GetAgregOC(NumOC: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT                        ');
      SQL.Add('      AI.NUMOC,               ');
      SQL.Add('      AI.IDAGREGTOTOC,        ');
      SQL.Add('      AI.CODTIPOCUSTAGREG,    ');
      SQL.Add('      AI.ALIQUOTA,            ');
      SQL.Add('      AI.BASECALCULO,         ');
      SQL.Add('      AI.VLRAGREGTOT,         ');
      SQL.Add('      TA.DESCCUSTAGREG        ');
      SQL.Add('FROM                          ');
      SQL.Add('      AGREGTOTOC AI,          ');
      SQL.Add('      TIPOAGRE TA             ');
      SQL.Add('WHERE                         ');
      SQL.Add('     (AI.NUMOC = '+FloatToStr(NumOC)+' )');
      SQL.Add(' AND (TA.FLGINCIDECOMPRA = ''S'') ');
      SQL.Add(' AND (TA.TOTALITEM = ''T'') ');
      SQL.Add(' AND (AI.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG)');
      SQL.Add('ORDER BY TA.DESCCUSTAGREG ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;




function TCtrlOrdemCompra.GetItemOC(IdPessoa,NumOC: Double): OleVariant;
Var
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
      SQL.Add('       (IT.NUMOC = '+FloatToStr( NumOC )+') ');
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




function TCtrlOrdemCompra.GetPrazoEntregaOC(IdItemOC: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDITEMOC, PARCELAENTREGA, PRAZOENTREGA, QTDEENTREGA,'+
          '        PERIODOPRAZO, DATAENTREGA '+
          ' FROM PRAZOENTREGAOC '+
          ' WHERE  (IDITEMOC = '+FloatToStr(IdItemOC)+') ';

   Result := GetDataPacket(SQL);
end;




function TCtrlOrdemCompra.GetPrazoPgtoOC(IdItemOC: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDITEMOC, PARCELAPGTO, PRAZOPGTO, PERIODOPRAZO, '+
          '        PERCPAGTO, DATAPAGTO '+
          ' FROM PRAZOPGTOOC '+
          ' WHERE (IDITEMOC = '+FloatToStr(IdItemOC)+') ';

   Result := GetDataPacket(SQL);
end;




function TCtrlOrdemCompra.GetPrazoEntregaOC(NumOC: LongInt): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDITEMOC, PARCELAENTREGA, PRAZOENTREGA, QTDEENTREGA,'+
          '        PERIODOPRAZO, DATAENTREGA '+
          ' FROM PRAZOENTREGAOC '+
          ' WHERE  (IDITEMOC IN (SELECT IDITEMOC FROM ITEMOC WHERE (NUMOC = '+FloatToStr(NumOC)+' ) ) ) ';
   Result := GetDataPacket(SQL);
end;




function TCtrlOrdemCompra.GetPrazoPgtoOC(NumOC: LongInt): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDITEMOC, PARCELAPGTO, PRAZOPGTO, PERIODOPRAZO, '+
          '        PERCPAGTO, DATAPAGTO '+
          ' FROM PRAZOPGTOOC '+
          ' WHERE  (IDITEMOC IN (SELECT IDITEMOC FROM ITEMOC WHERE (NUMOC = '+FloatToStr(NumOC)+' ) ) ) ';
   Result := GetDataPacket(SQL);

end;




function TCtrlOrdemCompra.GetSCItemOC(IdItemOC: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDITEMOC, NUMSOLCOMPRA, IDITEMSOLI '+
          ' FROM  SCITEMOC '+
          ' WHERE (IDITEMOC = '+FloatToStr(IdItemOC)+') ';

   Result := GetDataPacket(SQL);
end;




function TCtrlOrdemCompra.GetSCItemOC(NumOC: LongInt): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDITEMOC, NUMSOLCOMPRA, IDITEMSOLI '+
          ' FROM  SCITEMOC '+
          ' WHERE  (IDITEMOC IN (SELECT IDITEMOC FROM ITEMOC WHERE (NUMOC = '+FloatToStr(NumOC)+' ) ) ) ';
   Result := GetDataPacket(SQL);
end;




function TCtrlOrdemCompra.Gravar( IdUsuario : Double; bOCSemCotacao: boolean = false) : Boolean;
Var
   Msg : String;

   VlrOC, VlrLimite, VlrReserva, VlrSCI, IdNumReserva, NumReserva, MargemQuebra: Double;
   LstSCIs, LstItemsSCI : TStringList;
   i : integer;
   CdsAuxSCItemOC, CdsAuxItemOc : TClientDataSet;
Begin

  //  Os detalhes desta variável global estão na sua declaração
  bOrdemCompraSemCotacao := bOCSemCotacao;


  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaOrdemCompra(IdUsuario, FcdsOC.Data,FcdsItemOC.Data,FcdsPrazoPgtoOC.Data,FcdsPrazoEntregaOC.Data,
                                                     FcdsSCItemOC.Data,FcdsAgregItemOC.Data,FcdsAgregTotOC.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           slOCGerada.Clear;
           FNumOC    := 0;
           FNumOCFim := 0;

           if (Sistema.UsaRAD) then
           begin
              if (Sistema.VersaoRad = '+') then
                 RADPlus.IdUsuario := (Trunc(IdUsuario))
              else
                 _RAD.IdUsuario := Trunc( IdUsuario );
           end;

           if IntegraOrcamento then
             begin
               // Cria os CDS auxiliares para evitar possíveis alterações nos
               // dados originais recebidos como parâmteros
               CdsAuxItemOc        := TClientDataSet.Create(nil);
               CdsAuxSCItemOC      := TClientDataSet.Create(nil);
               CdsAuxItemOc.Data   := FCdsItemOC.Data;
               CdsAuxSCItemOC.Data := FCdsSCItemOC.Data;

               // Cria uma StringList que não aceita itens duplicados para
               // guardar os números das SCIs que farão parte da OC
               LstSCIs            := TStringList.Create;
               LstSCIs.Sorted     := True;
               LstSCIs.Duplicates := dupIgnore;

               // Cria uma StringList para guardar os itens das SCIs no LOOP
               LstItemsSCI            := TStringList.Create;
               LstItemsSCI.Sorted     := True;
               LstItemsSCI.Duplicates := dupIgnore;

               // Busca as SCI`s existentes e guarda na StringList
               CdsAuxSCItemOC.First;
               while not CdsAuxSCItemOC.Eof do
                 begin
                   LstSCIs.Add(CdsAuxSCItemOC.FieldByName('NUMSOLCOMPRA').AsString);
                   CdsAuxSCItemOC.Next;
                 end;

               // Calcula o VALOR TOTAL da OC
               VlrOC := 0;
               CdsAuxItemOC.First;
               while not CdsAuxItemOC.Eof do
                 begin
                   VlrOC := VlrOC + (CdsAuxItemOC.FieldByName('QTDEPEDIDA').AsFloat *
                                     CdsAuxItemOC.FieldByName('VALORUN').AsFloat);
                   CdsAuxItemOC.Next;
                 end;

               // Busca os dados necessários para fazer os cálculos e saber se o
               // valor das SCI`s estão superiores ao permitido, considerando
               // o valor da RESERVA ORÇAMENTÁRIA e a MARGEM DE QUEBRA
               MargemQuebra := BuscaMargemQuebra;

               for i := 0 to LstSCIs.Count - 1 do
                 begin
                   // Busca o valor da RESERVA ORÇAMENTÁRIA
                   IdNumReserva := BuscaNumReserva(StrToFloat(LstSCIs[i]));
                   NumReserva   := BuscaIdNumReserva(Trunc(IdNumReserva), True);
                   VlrReserva   := BuscaValorReserva(NumReserva);

                   // Calcula o valor LIMITE para a SCI considerando a MARGEM DE QUEBRA
                   VlrLimite := (VlrReserva * MargemQuebra);
                   VlrSCI    := BuscaTotalSCI(StrToFloat(LstSCIs[i]));

                   // Faz a verificação de valores entre a SCI e a RESERVA ORÇAMENTÁRIA
                   if (VlrSCI > VlrLimite) then
                     Raise Exception.Create('O valor da SCI ' + LstSCIs[i] + ' não pode ser superior a ' +
                                             FormatFloat('###,###,##0.00', VlrLimite));
                 end;
             end;

             // Libera Recursos Alocados
             FreeAndNil(CdsAuxSCItemOC);
             FreeAndNil(CdsAuxItemOC);

           Result := ApplyCds(FcdsOC,_DbOC,[],[] );
           Msg    := _DbOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsItemOC,_DbItemOC,[],[] );
           Msg    := _DbItemOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsPrazoPgtoOC,_DbPrazoPgtoOC,[],[] );
           Msg    := _DbPrazoPgtoOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsPrazoEntregaOC,_DbPrazoEntregaOC,[],[] );
           Msg    := _DbPrazoEntregaOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsAgregItemOC,_DbAgregItemOC,[],[] );
           Msg    := _DbAgregItemOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsSCItemOC,_DbSCItemOC,[],[] );
           Msg    := _DbSCItemOC.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           If (FcdsAgregTotOC <> nil) And ( Not FcdsAgregTotOC.IsEmpty ) Then
              Begin
                 Result := ApplyCds(FcdsAgregTotOC,_DbAgregTotOC,[_DbOC.NumOC],[_DbAgregTotOC.NumOC]);
                 If Not Result Then
                    Raise Exception.Create( _DbAgregTotOC.MessageInfo );
              End;


           // Almoxarifado = 5
           // RecMerc     = 46
           if (Trunc(iIdModulo) in [5,46]) then
           begin
              if bRecebimentoComOC then
              begin
                 if Not LancaPrevisaoCAP Then
                    Raise Exception.Create(MessageInfo);
              end;
           end
           else
           begin
              if Not LancaPrevisaoCAP Then
                 Raise Exception.Create(MessageInfo);
           end;


           Self.MessageInfo := MsgOCsGeradas;

           Commit;

           bOrdemCompraSemCotacao := False;

        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               FNumOC := 0;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;




function TCtrlOrdemCompra.ListOC(NumOC: Double; MostraForn : Boolean): OleVariant;
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

      SQL.Add('     ''1234567890'' as GRUPOPROD, ');

      SQL.Add('     SUB.VALOROC AS VALOROC,   ');
      If MostraForn Then
         SQL.Add('     P.RAZAOSOCIAL,     ');

      SQL.Add('     DECODE(OC.FLGCOMSEMOC,''S'',''SEM O.C.'',DECODE(OC.FLGCOMSEMCOT,''C'',''COM COTAÇÃO'',''SEM COTAÇÃO'')) AS STATUS');
      SQL.Add('FROM  ');

      If MostraForn Then
         SQL.Add('    PESSOA P,  ');

      SQL.Add('    OC,         ');
      SQL.Add('    (SELECT SUM(QTDEPEDIDA * VALORUN) AS VALOROC FROM ITEMOC WHERE (NUMOC = '+FloatToStr(NumOC)+') ) SUB ');
      SQL.Add('WHERE  (OC.NUMOC = '+FloatToStr(NumOC)+')');

      If MostraForn Then
         SQL.Add('   AND (OC.IDFORCLI = P.IDPESSOA )');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;




procedure TCtrlOrdemCompra.OnCreateAppServer;
begin
  inherited;
  FcdsOC             := TClientDataSet.Create(nil);
  FcdsItemOC         := TClientDataSet.Create(nil);
  FcdsPrazoPgtoOC    := TClientDataSet.Create(nil);
  FcdsPrazoEntregaOC := TClientDataSet.Create(nil);
  FcdsSCItemOC       := TClientDataSet.Create(nil);
  FcdsAgregItemOC    := TClientDataSet.Create(nil);
  FcdsAgregTotOC     := TClientDataSet.Create(nil);
end;




procedure TCtrlOrdemCompra.SetcdsAgregItemOC(const Value: TClientDataSet);
begin
  FcdsAgregItemOC := Value;
end;




procedure TCtrlOrdemCompra.SetcdsAgregTotOC(const Value: TClientDataSet);
begin
  FcdsAgregTotOC := Value;
end;




procedure TCtrlOrdemCompra.SetcdsItemOC(const Value: TClientDataSet);
begin
  FcdsItemOC := Value;
end;




procedure TCtrlOrdemCompra.SetcdsOC(const Value: TClientDataSet);
begin
  FcdsOC := Value;
end;




procedure TCtrlOrdemCompra.SetcdsPrazoEntregaOC(
  const Value: TClientDataSet);
begin
  FcdsPrazoEntregaOC := Value;
end;




procedure TCtrlOrdemCompra.SetcdsPrazoPgtoOC(const Value: TClientDataSet);
begin
  FcdsPrazoPgtoOC := Value;
end;




procedure TCtrlOrdemCompra.SetcdsSCItemOC(const Value: TClientDataSet);
begin
  FcdsSCItemOC := Value;
end;




function TCtrlOrdemCompra.PodeCancelarOC(NumOC: Double): Boolean;
Var
   SQL : String;
begin

    sql :=
      'select iditemoc, ''ITEM'' from ITEMOC ' +
      'where qtderecebida > 0      ' +
      '  and numoc = ' + floatToStr(numOC) +
      'union  ' +
      'select numoc, ''OC'' from OC        ' +
      'where ocatendida = ''C''    ' +
      '  and numoc = ' + floatToStr(numOC) ;

    _cds.Data := GetDataPacket(SQL);

    FOCJaCancelada := ( ( _cds.Fields[1].AsString = 'OC')  and (_cds.RecordCount > 0) ) ;

    Result := _Cds.IsEmpty;
end;




function TCtrlOrdemCompra.CancelaItemOC(IdPessoa,IdItemOC: Double; TemCotacao : Boolean; CodProcesso : Double; bGeraProcesso : Boolean): Boolean;
Var
   SQL     : String;
   Msg     : String;
   cdsItem, cdsReserva : TClientDataSet;

begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.CancelaItemOC( IdPessoa,IdItemOC , TemCotacao, CodProcesso, bGeraProcesso);
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        cdsItem := TClientDataSet.Create(nil);

        cdsReserva := TClientDataSet.Create(nil);

        Try
           Try
              StartTransaction;

              //-------------------------------------------------------------------
              // Coloca o Item para cancelado
              //-------------------------------------------------------------------
              _DbItemOC.IdItemOC.AsFloat := IdItemOC;
              _DbItemOC.LoadFromDb;
              _DbItemOC.FlgItemAtendido.AsString := 'C';
              Result := _DbItemOC.Update;
              Msg    := _DbItemOC.MessageInfo;
              If Not Result Then
                 Raise Exception.Create(Msg);
              //-------------------------------------------------------------------
              // Cancela o compromisso orcamentário
              //-------------------------------------------------------------------
              IF Not _DbItemOC.IdReservaOrcamen.IsNull Then
                 Begin
                    // Busca o Número do COMPROMISSO
                    SQL := ' SELECT  NUMRESERVA '+
                           ' FROM  RESERVAORCAMEN '+
                           ' WHERE (IDRESERVAORCAMEN = ' + _DbItemOC.IdReservaOrcamen.AsString +' )';
                    _cds.Data := GetDataPacket(SQL);

                    // Busca o Número da Reserva a qual o Compromisso foi vinculado
                    CdsReserva.Data := CtrlResXComp.ListarReservasDoCompromisso(StrToFloat(_DbItemOC.IdReservaOrcamen.AsString), Sistema.IdEmpresa);

                    _Orcamento.IdEmpresa := Trunc(IdPessoa);
                    _Orcamento.IdUsuario := Sistema.IdUsuario;

                    if _Orcamento.CancelaCompromisso(_cds.FieldByName('NUMRESERVA').AsInteger, True) <> 0 then
                       Raise Exception.Create( _Orcamento.MessageInfo );

                    GravaLogPLANEORC('uCtrlOrdemCompra.CancelaItemOC: Cancelado Compromisso nº ' + _cds.FieldByName('NUMRESERVA').AsString,
                                      Sistema.IdModulo,
                                      Sistema.IdUsuario);


                 End;

              //-------------------------------------------------------------------
              // Retorna a QTDE PENDENTE da solicitação de Compras
              //-------------------------------------------------------------------
              If Not TemCotacao Then
                 Begin

                    SQL := 'SELECT SC.IDITEMOC,                                    ' +
                           '       SC.NUMSOLCOMPRA,                                ' +
                           '       SC.IDITEMSOLI,                                  ' +
                           '       IT.QTDERECEBIDA                                 ' +
                           'FROM   SCITEMOC SC,                                    ' +
                           '       ITEMOC IT,                                      ' +
                           '       SOLICOMP SOL,                                   ' +
                           '       ITEMSOLI ITS                                    ' +
                           'WHERE  SC.IDITEMOC = IT.IDITEMOC                       ' +
                           '       AND SC.NUMSOLCOMPRA = SOL.NUMSOLCOMPRA          ' +
                           '       AND SOL.NUMSOLCOMPRA = ITS.NUMSOLCOMPRA         ' +
                           '       AND SC.IDITEMSOLI = ITS.IDITEMSOLI              ' +
                           '       AND SC.IDITEMOC = ' +FloatToStr( IdItemOC )      ;
                    _cds.Data := GetDataPacket(SQL);

                    _cds.First;

                    While Not _cds.Eof Do
                       Begin
                          if (not _cds.FieldByName('QTDERECEBIDA').IsNull) and
                             (_cds.FieldByName('QTDERECEBIDA').AsFloat > 0)  then
                          begin
                             SQL := ' UPDATE ITEMSOLI SET QTDEPENDENTE = QTDEPENDENTE + '+ FloatToStrCM(_DbItemOC.QtdePedida.AsFloat) +
                                    ' WHERE (IDITEMSOLI = '+_cds.FieldByName('IDITEMSOLI').AsString+') ';
                             If Not ExecSQL(SQL,True) Then
                                Raise Exception.Create( MessageInfo );
                          end;

                          _cds.Next;
                       End;

                    MessageInfo := MSG_ITEMOC_CANCELADO_OK;
                 End
              //-------------------------------------------------------------------
              // Possui cotacao
              //-------------------------------------------------------------------
              Else
                 Begin
                    SQL := ' SELECT C.CODPROCESSO, C.IDPROCXART, P.IDCOMPRADOR '+
                           ' FROM COTACOES C, PROCESSO P '+
                           ' WHERE  (C.IDITEMOC = '+FloatToStr( IdItemOC )+')'+
                           '   AND (C.CODPROCESSO = P.CODPROCESSO) ';
                    _cds.Data := GetDataPacket(SQL);

                    If (Not _cds.IsEmpty) and (bGeraProcesso) Then
                       Begin
                          //-------------------------------------------------------------------
                          // Gera o novo Processo
                          //-------------------------------------------------------------------
                         If CodProcesso = 0 Then
                            Begin
                               _DbProcesso.CodProcesso.AsFloat := _cds.FieldByName('CODPROCESSO').AsFloat;
                               _DbProcesso.LoadFromDb;
                               _DbProcesso.Status.AsString := 'C';
                               Result := _DbProcesso.Insert;
                               Msg    := _DbProcesso.MessageInfo;
                               If Not Result Then
                                  Raise Exception.Create(Msg)
                               else
                                  MessageInfo := MSG_GERADO_PROCCOMPRA + _DbProcesso.CodProcesso.AsString;

                            End
                         Else
                            Begin
                               _DbProcesso.CodProcesso.AsFloat := CodProcesso;
                            End;

                          //-------------------------------------------------------------------
                          // Gera o Novo ProcxArt
                          //-------------------------------------------------------------------
                          _DbProcxArt.CodProcesso.AsFloat := _cds.FieldByName('CODPROCESSO').AsFloat;
                          _DbProcxArt.IdProcxArt.AsFloat  := _cds.FieldByName('IDPROCXART').AsFloat;
                          _DbProcxArt.LoadFromDb;
                          _DbProcxArt.CodProcesso.AsFloat := _DbProcesso.CodProcesso.AsFloat;
                          Result := _DbProcxArt.Insert;
                          Msg    := _DbProcesso.MessageInfo;
                          If Not Result Then
                             Raise Exception.Create(Msg);
                          //-------------------------------------------------------------------
                          // Atualiza A Solicitação para o novo processo
                          //-------------------------------------------------------------------
                          SQL := ' UPDATE ITEMSOLI SET CODPROCESSO =  '+_DbProcesso.CodProcesso.AsString +',IDPROCXART = '+_DbProcxArt.IdProcxArt.AsString +
                                 ' WHERE  (CODPROCESSO = '+_cds.FieldByName('CODPROCESSO').AsString+') '+
                                 '    AND (IDPROCXART  = '+_cds.FieldByName('IDPROCXART').AsString+') ';
                          If Not ExecSQL(SQL) Then
                             Raise Exception.Create( MessageInfo );
                          //-------------------------------------------------------------------
                          // Gera Nova Cotação
                          //-------------------------------------------------------------------
                          SQL := ' SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA '+
                                 ' FROM COTACOES '+
                                 ' WHERE  (CODPROCESSO = '+_cds.FieldByName('CODPROCESSO').AsString+') '+
                                 '    AND (IDPROCXART  = '+_cds.FieldByName('IDPROCXART').AsString+') ';

                          cdsItem.Data := GetDataPacket(SQL);
                          cdsItem.First;
                          While Not cdsItem.Eof Do
                             Begin
                                _DbCotacoes.CodProcesso.AsFloat := cdsItem.FieldByName('CODPROCESSO').AsFloat;
                                _DbCotacoes.IdProcxArt.AsFloat  := cdsItem.FieldByName('IDPROCXART').AsFloat;
                                _DbCotacoes.IdForCli.AsFloat    := cdsItem.FieldByName('IDFORCLI').AsFloat;
                                _DbCotacoes.Proposta.AsFloat    := cdsItem.FieldByName('PROPOSTA').AsFloat;
                                _DbCotacoes.LoadFromDb;
                                _DbCotacoes.CodProcesso.AsFloat := _DbProcesso.CodProcesso.AsFloat;
                                _DbCotacoes.IdProcxArt.AsFloat  := _DbProcxArt.IdProcxArt.AsFloat;
                                Result := _DbCotacoes.Insert;
                                Msg    := _DbProcesso.MessageInfo;
                                If Not Result Then
                                   Raise Exception.Create(Msg);
                                //-------------------------------------------------------------------
                                // Gera novo Prazo de Entrega
                                //-------------------------------------------------------------------
                                SQL := ' SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA,IDPRAZOENT '+
                                       ' FROM PRAZOENTREGA '+
                                       ' WHERE  (CODPROCESSO = '+cdsItem.FieldByName('CODPROCESSO').AsString+') '+
                                       '    AND (IDPROCXART  = '+cdsItem.FieldByName('IDPROCXART').AsString+') '+
                                       '    AND (IDFORCLI    = '+cdsItem.FieldByName('IDFORCLI').AsString+') '+
                                       '    AND (PROPOSTA    = '+cdsItem.FieldByName('PROPOSTA').AsString+') ';
                                _cds.Data := GetDataPacket(SQL);
                                _cds.First;
                                While Not _cds.Eof Do
                                   Begin
                                      _DbPrazoEntrega.CodProcesso.AsFloat := _cds.FieldByName('CODPROCESSO').AsFloat;
                                      _DbPrazoEntrega.IdProcxArt.AsFloat  := _cds.FieldByName('IDPROCXART').AsFloat;
                                      _DbPrazoEntrega.IdForCli.AsFloat    := _cds.FieldByName('IDFORCLI').AsFloat;
                                      _DbPrazoEntrega.Proposta.AsFloat    := _cds.FieldByName('PROPOSTA').AsFloat;
                                      _DbPrazoEntrega.IdPrazoEnt.AsFloat  := _cds.FieldByName('IDPRAZOENT').AsFloat;
                                      _DbPrazoEntrega.LoadFromDb;
                                      _DbPrazoEntrega.CodProcesso.AsFloat := _DbProcesso.CodProcesso.AsFloat;
                                      _DbPrazoEntrega.IdProcxArt.AsFloat  := _DbProcxArt.IdProcxArt.AsFloat;
                                      Result := _DbPrazoEntrega.Insert;
                                      Msg    := _DbPrazoEntrega.MessageInfo;
                                      If Not Result Then
                                         Raise Exception.Create(Msg);

                                      _cds.Next;
                                   End;
                                //-------------------------------------------------------------------
                                // Gera novo Prazo de Pagamento
                                //-------------------------------------------------------------------
                                SQL := ' SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA,IDPRAZOPGTO '+
                                       ' FROM PRAZOPGTO '+
                                       ' WHERE  (CODPROCESSO = '+cdsItem.FieldByName('CODPROCESSO').AsString+') '+
                                       '    AND (IDPROCXART  = '+cdsItem.FieldByName('IDPROCXART').AsString+') '+
                                       '    AND (IDFORCLI    = '+cdsItem.FieldByName('IDFORCLI').AsString+') '+
                                       '    AND (PROPOSTA    = '+cdsItem.FieldByName('PROPOSTA').AsString+') ';
                                _cds.Data := GetDataPacket(SQL);
                                _cds.First;
                                While Not _cds.Eof Do
                                   Begin
                                      _DbPrazoPgto.CodProcesso.AsFloat := _cds.FieldByName('CODPROCESSO').AsFloat;
                                      _DbPrazoPgto.IdProcxArt.AsFloat  := _cds.FieldByName('IDPROCXART').AsFloat;
                                      _DbPrazoPgto.IdForCli.AsFloat    := _cds.FieldByName('IDFORCLI').AsFloat;
                                      _DbPrazoPgto.Proposta.AsFloat    := _cds.FieldByName('PROPOSTA').AsFloat;
                                      _DbPrazoPgto.IdPrazoPgto.AsFloat := _cds.FieldByName('IDPRAZOPGTO').AsFloat;
                                      _DbPrazoPgto.LoadFromDb;
                                      _DbPrazoPgto.CodProcesso.AsFloat := _DbProcesso.CodProcesso.AsFloat;
                                      _DbPrazoPgto.IdProcxArt.AsFloat  := _DbProcxArt.IdProcxArt.AsFloat;
                                      Result := _DbPrazoPgto.Insert;
                                      Msg    := _DbPrazoPgto.MessageInfo;
                                      If Not Result Then
                                         Raise Exception.Create(Msg);

                                      _cds.Next;
                                   End;
                                //-------------------------------------------------------------------
                                // Gera novo Custos Agregados
                                //-------------------------------------------------------------------
                                SQL := ' SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA,CODTIPOCUSTAGREG '+
                                       ' FROM VALORAGREGCOT '+
                                       ' WHERE  (CODPROCESSO = '+cdsItem.FieldByName('CODPROCESSO').AsString+') '+
                                       '    AND (IDPROCXART  = '+cdsItem.FieldByName('IDPROCXART').AsString+') '+
                                       '    AND (IDFORCLI    = '+cdsItem.FieldByName('IDFORCLI').AsString+') '+
                                       '    AND (PROPOSTA    = '+cdsItem.FieldByName('PROPOSTA').AsString+') ';
                                _cds.Data := GetDataPacket(SQL);
                                _cds.First;
                                While Not _cds.Eof Do
                                   Begin
                                      _DbValorAgregCot.CodProcesso.AsFloat := _cds.FieldByName('CODPROCESSO').AsFloat;
                                      _DbValorAgregCot.IdProcxArt.AsFloat  := _cds.FieldByName('IDPROCXART').AsFloat;
                                      _DbValorAgregCot.IdForCli.AsFloat    := _cds.FieldByName('IDFORCLI').AsFloat;
                                      _DbValorAgregCot.Proposta.AsFloat    := _cds.FieldByName('PROPOSTA').AsFloat;
                                      _DbValorAgregCot.CodTipoCustAgreg.AsFloat := _cds.FieldByName('CODTIPOCUSTAGREG').AsFloat;
                                      _DbValorAgregCot.LoadFromDb;
                                      _DbValorAgregCot.CodProcesso.AsFloat := _DbProcesso.CodProcesso.AsFloat;
                                      _DbValorAgregCot.IdProcxArt.AsFloat  := _DbProcxArt.IdProcxArt.AsFloat;
                                      Result := _DbValorAgregCot.Insert;
                                      Msg    := _DbValorAgregCot.MessageInfo;
                                      If Not Result Then Raise Exception.Create(Msg);

                                      _cds.Next;
                                   End;

                                cdsItem.Next;
                             End;
                            MessageInfo := MSG_GERADO_PROCCOMPRA+ _DbProcesso.CodProcesso.AsString;
                        End;

                       if (not bGeraProcesso) and (not _cds.FieldByName('CODPROCESSO').IsNull) then
                       begin
                         // Coloca o STATUS do Processo para FINALIZADO quando
                         // existir mais de 1 Compromisso/OC para uma mesma Reserva.
                         if QtdCompromissos(BuscaIdReserva(BuscaNumOC(IdItemOC))) > 1 then
                           begin
                             SQL := 'UPDATE PROCESSO SET STATUS = ''F'' WHERE CODPROCESSO = ' + _cds.FieldByName('CODPROCESSO').AsString;

                             if not ExecSQL(SQL) then
                               Raise Exception.Create( MessageInfo );

                             MessageInfo := MSG_OC_CANCELADA_OK;
                           end
                         else
                           begin
                             // Coloca o STATUS do Processo para SUMÁRIO JÁ CALCULADO
                             // Permitindo a Geração de um Novo Processo Manualmente
                             SQL := 'UPDATE PROCESSO SET STATUS = ''S'' WHERE CODPROCESSO = ' + _cds.FieldByName('CODPROCESSO').AsString;

                             if not ExecSQL(SQL) then
                                Raise Exception.Create( MessageInfo );

                             MessageInfo := MSG_OC_CANCELADA_OK;
                           end;
                       end;

                 End;

              //-------------------------------------------------------------------
              // Desassocia o Item da Solicitação de Compras do Item da OC
              //-------------------------------------------------------------------
              SQL := 'DELETE FROM SCITEMOC WHERE (IDITEMOC = '+FloatToStr( IdItemOC )+' )';

              If Not ExecSQL( SQL ) Then
                 Raise Exception.Create( MessageInfo );

              Commit;

           except
              On E:Exception Do
               Begin
                  Rollback;
                  Result := False;
                  MessageInfo := E.Message;
               End;
           End;
        Finally
           cdsItem.Free;

           FreeAndNil(CdsReserva);
        End;
     End;
end;




function TCtrlOrdemCompra.CancelaOC( IdPessoa,NumOC : Double;
                                     GeraProcesso : Boolean ): Boolean;
Var
   SQL        : String;
   Msg        : String;
   cdsItemOC  : TClientDataSet;
   CdsAux     : TClientDataSet;
   TemCotacao : Boolean;
   bEstavaEmTransacao : Boolean;

   reutilizaNumeroProcesso: boolean;

begin
  Result := True;
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.CancelaOC(  IdPessoa, NumOC,GeraProcesso  );
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        cdsItemOC := TClientDataSet.Create(nil);
        CdsAux    := TClientDataSet.Create(nil);
        Try
           Try
              StartTransaction;

              bEstavaEmTransacao := Self.OpenTransaction;

              SQL := ' SELECT IDPROCESSO, FLGCOMSEMCOT FROM OC'+
                     ' WHERE (NUMOC = '+FloatToStr( NumOC )+') ';

              CdsAux.Data := GetDataPacket(SQL);

              //-------------------------------------------------------------------
              // Atualiza A Ordem de Compra para Cancelada
              //-------------------------------------------------------------------
              SQL := ' UPDATE OC SET OCATENDIDA = ''C'' '+
                     ' WHERE (NUMOC = '+FloatToStr( NumOC )+') ';
              If Not ExecSQL(SQL,True) Then
                 Raise Exception.Create( MessageInfo );

              //-------------------------------------------------------------------
              // Exclui a Previsão no Contas a Pagar
              //-------------------------------------------------------------------
              IF Not DeletaPrevisaoCAP(IdPessoa,NumOC) Then
                 Raise Exception.Create( MessageInfo );

              //-------------------------------------------------------------------
              // Cancela o  processo no R.A.D.
              //-------------------------------------------------------------------
               if not CdsAux.FieldByName('IDPROCESSO').IsNull then
               begin
                  if (Sistema.VersaoRAD = '+') then
                  begin
                     if (not RAdPlus.ExcluirProcesso(cdsAux.FieldByName('IDPROCESSO').AsInteger)) then
                        Raise Exception.Create(RadPlus.MessageInfo)
                  end
                  else
                  begin
                     SQL := ' UPDATE RADINSTPROCESSO SET FLGOK = ''R'' '+
                            ' WHERE (IDPROCESSO = '+CdsAux.FieldByName('IDPROCESSO').AsString+') ';
                     if not ExecSQL(SQL,True) then
                        Raise Exception.Create( MessageInfo );
                  end;
               end;

              //-------------------------------------------------------------------
              // Verifica se a Ordem de Compra tem Cotação
              //-------------------------------------------------------------------
              TemCotacao := CdsAux.FieldByName('FLGCOMSEMCOT').AsString = 'C';

              If Not TemCotacao Then
                 Begin
                    SQL := ' SELECT I.IDITEMOC FROM ITEMOC I '+
                           ' WHERE (I.NUMOC = '+FloatToStr( NumOC )+') ';
                    cdsItemOC.Data := GetDataPacket(SQL);
                    //-------------------------------------------------------------------
                    // Cancela os Itens
                    //-------------------------------------------------------------------

                    //Para não abrir outra transação no metodo a ser chamado
                    Self.OpenTransaction := False;

                    cdsItemOC.First;
                    While Not cdsItemOC.Eof Do
                       Begin
                          If Not CancelaItemOC(IdPessoa,cdsItemOC.fieldByName('IDITEMOC').AsFloat,TemCotacao, 0, GeraProcesso) Then
                             Raise Exception.Create( MessageInfo );

                          cdsItemOC.Next;
                       End;

                    MessageInfo := MSG_OC_CANCELADA_OK;
                 End
              Else
                 Begin
                    SQL := ' SELECT I.IDITEMOC, C.CODPROCESSO  '+
                           ' FROM ITEMOC I, COTACOES C '+
                           ' WHERE (I.NUMOC = '+FloatToStr( NumOC )+') '+
                           '   AND (I.IDITEMOC = C.IDITEMOC )';

                    cdsItemOC.Data := GetDataPacket(SQL);
                    //-------------------------------
                    // Gera o Novo Processo de Compra
                    //-------------------------------

                    If GeraProcesso Then
                    Begin
                       _DbProcesso.CodProcesso.AsFloat := cdsItemOC.FieldByName('CODPROCESSO').AsFloat;
                       _DbProcesso.LoadFromDb;
                       _DbProcesso.Status.AsString := 'C';

                       Result := _DbProcesso.Insert;
                       Msg    := _DbProcesso.MessageInfo;
                       if not Result then
                          Raise Exception.Create(Msg)
                       else
                          Msg := MSG_GERADO_PROCCOMPRA + _DbProcesso.CodProcesso.AsString;
                    end
                    else  // não gera processo
                    begin
                       { - 1ª condição: somente 1 OC vinculada ao processo
                         - 2ª condição: usuário optou por cancelar todas as Ocs vinculadas ao processo. Se está nesta rotina,
                              então a decisão do usuário foi cancelamento de todas as Ocs vinculadas ao processo. }
                       _dbProcesso.CodProcesso.AsFloat := cdsItemOc.FieldByName('codprocesso').asFloat;

                       reutilizaNumeroProcesso := ( ocsVinculadasAoProcesso(cdsItemOC.FieldByName('CODPROCESSO').AsFloat) = 1 );

                       if ( reutilizaNumeroProcesso ) then
                            Msg := MSG_REUTILIZA_PROCESSO + _DbProcesso.CodProcesso.AsString;
                    end;

                    //-------------------------------------------------------------------
                    // Cancela os Itens
                    //-------------------------------------------------------------------

                    //Para não abrir outra transação no metodo a ser chamado
                    Self.OpenTransaction := False;
                    cdsItemOC.First;
                    While Not cdsItemOC.Eof Do
                       Begin
                          If Not CancelaItemOC(IdPessoa,cdsItemOC.fieldByName('IDITEMOC').AsFloat,TemCotacao,_DbProcesso.CodProcesso.AsFloat, GeraProcesso) Then
                             Raise Exception.Create( MessageInfo );

                          cdsItemOC.Next;
                       End;
              End;

              // Só reabre a transação se a classe foi instância da com open transaction
              // true (instanciada de tela) senão não abre outra transação (pois
              // foi instanciada de uma outra classe)
              If bEstavaEmTransacao Then
                 Self.OpenTransaction := True;

              Commit;

           except
              On E:Exception Do
               Begin
                  Self.OpenTransaction := True;
                  Rollback;
                  Result := False;
                  MessageInfo := E.Message;
               End;
           End;
        Finally
           cdsItemOC.Free;
           CdsAux.Free;
        End;
     End;
end;




function TCtrlOrdemCompra.ListSCIOrigem( IdItemOC : Double ): OleVariant;
Var
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
      SQL.Add('      (SXC.IDITEMOC    = '+FloatToStr(IdItemOC)+')          ');
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




procedure TCtrlOrdemCompra.AfterInitialize;
begin
  inherited;
  _RAD.InitializeAs(Self);
  _RAD.OpenTransaction := False;


  RADPlus.InitializeAs(Self);
  RADPlus.OpenTransaction := false;

  _Documento.InitializeAs(Self);
  _Orcamento.InitializeAs(Self);
  _UnMedida.InitializeAs(Self);
  CReservaOrcamen.InitializeAs(Self);

  CtrlResXComp.InitializeAs(Self);
end;




function TCtrlOrdemCompra.MontaVetorOrcamento(iNumSolCompra: Double): Integer;
begin

   Result := 0;

   OpenDataSet('SELECT IDRESERVAORCAMEN FROM SOLICOMP WHERE NUMSOLCOMPRA = '+FloatToStr(iNumSolCompra));

   if not _lDataSet.IsEmpty then
     Result := _Orcamento.BuscaIdNumReserva(_lDataSet.FieldByName('IDRESERVAORCAMEN').AsInteger,0,True);

   if Result < 0 then
     MessageInfo := _Orcamento.MessageInfo;
end;




function TCtrlOrdemCompra.LancaPrevisaoCAP: Boolean;
var x             : Integer;
    NumOC         : Double;
    cdsCAPOC      : TClientDataSet;
    cdsCAPItemOC  : TClientDataSet;
    cdsCAPPrzPGOC : TClientDataSet;
    SQL           : String;
    rTotValor     : Double;
    rValorLanc    : Double;
    cdsAux        : TClientdataset;
    iNumDiasVencto : integer;

begin
   Result        := True;
   If Not FPrevisaoCAP Then
      Exit;

   cdsCAPOC      := TClientDataSet.Create(nil);
   cdsCAPItemOC  := TClientDataSet.Create(nil);
   cdsCAPPrzPGOC := TClientDataSet.Create(nil);
   Try
      Try
         For x:= 0 to Pred(slOCGerada.Count) Do
            Begin
               NumOC := StrToFloat(slOCGerada.Strings[x]);

               cdsCAPOC.Data  := ListOC(NumOC);

               SQL := 'SELECT PC.CODTIPDOC, PA.IDPATRO, PA.IDPLANOPREV, PA.IDPROGRAMA, '+
                      '       PG.UNIDNEGOC, PG.CODCENTRORESPON '+
                      'FROM PARAMCOMPRAS PC, PARAMGLOBAL PG, PARALMOX PA '+
                      'WHERE (PC.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') '+
                      '  AND (PC.IDPESSOA = PG.IDPESSOA) '+
                      '  AND (PC.IDPESSOA = PA.IDPESSOA) ';
               _Cds.Data := GetDataPacket(SQL);

               if not _Cds.FieldByName('CODTIPDOC').isNull Then
                  Begin
                     cdsCAPItemOC.Data  := GetItemOC(Sistema.IdEmpresa,NumOC);

                     cdsCAPPrzPGOC.Data := GetPrazoPgtoOC( cdsCAPItemOC.FieldByName('IDITEMOC').AsFloat );
                     while not cdsCAPPrzPGOC.Eof do
                        Begin
                           _Documento.Prepare(OpDocumento,odlPrevisao,sdocAberto);

                           _Documento.IdUsuario := cdsCAPItemOC.FieldByName('IDUSUARIO').AsFloat;

                           iNumDiasVencto := 0;
                           _Documento.IdEspAcesso := Sistema.IdEspAcesso;
                           cdsAux := TclientDataset.Create(nil);
                           cdsAux.data := GetDataPacket('SELECT NVL(NUMDIASVENCTO, 0) as NUMDIASVENCTO FROM PARAMCAP WHERE IDPESSOA = '+ intToStr(Sistema.IdEmpresa) +
                           ' AND RECPAG = ''P'' ');
                           iNumDiasVencto := cdsAux.FieldByName('NUMDIASVENCTO').asInteger;
                           cdsAux.free;

                           _Documento.SetValues(0,NumOC,cdsCAPPrzPGOC.FieldByName('PARCELAPGTO').AsString,'',
                                 'P','12','','','','','','','','','','','','',
                                 cdsCAPPrzPGOC.FieldByName('DATAPAGTO').asDateTime + iNumDiasVencto,
                                 cdsCAPOC.FieldByName('DATAOC').asDateTime,
                                 cdsCAPPrzPGOC.FieldByName('DATAPAGTO').asDateTime,0,0,0,0,0,0,0,0,_Cds.FieldByName('CODTIPDOC').AsInteger,
                                 Sistema.IdEmpresa,113,cdsCAPOC.FieldByName('IDFORCLI').AsInteger,
                                 0,0, 0,0,0,0,0,0,0,Trunc(_Documento.IdUsuario),Sistema.IDEmpresa,0,0,0,0,0,0,0);
                           _Documento.Lanctodocum.SetValues(cdsCAPOC.FieldByName('DATAOC').asDateTime,0,0,
                                                cdsCAPOC.FieldByName('VALOROC').AsFloat*(cdsCAPPrzPGOC.FieldByName('PERCPAGTO').AsFloat/100),0,
                                                cdsCAPOC.FieldByName('VALOROC').AsFloat*(cdsCAPPrzPGOC.FieldByName('PERCPAGTO').AsFloat/100),
                                                0,0,0,trunc(_Documento.IdUsuario),Sistema.IdEmpresa,0,0,0,0,0,'12',
                                                 '','','','','','','','C', 113, 0, False);
                           rTotValor := cdsCAPOC.FieldByName('VALOROC').AsFloat*(cdsCAPPrzPGOC.FieldByName('PERCPAGTO').AsFloat/100);
                           cdsCAPItemOC.First;
                           While not cdsCAPItemOC.Eof Do
                              Begin
                                 rValorLanc := ((cdsCAPItemOC.FieldByName('QTDEPEDIDA').asFloat*cdsCAPItemOC.FieldByName('VALORUN').AsFloat)*(cdsCAPPrzPGOC.FieldByName('PERCPAGTO').AsFloat/100));
                                 rTotValor := rTotValor - rValorLanc;
                                 _Documento.Rateiodocum.SetValues(rValorLanc,0,0,0,Sistema.IDEmpresa,0,
                                                                 _cds.FieldByName('UNIDNEGOC').AsInteger,0, Trunc(_Documento.IdUsuario),0,0,
                                                                 _cds.FieldByName('IDPLANOPREV').AsInteger,
                                                                 _cds.FieldByName('IDPATRO').AsInteger,
                                                                 _cds.FieldByName('IDPROGRAMA').AsInteger,0,
                                                                 Sistema.IdEmpresa,cdsCAPItemOC.FieldByName('CODTIPRECDES').AsString,
                                                                 'P',_cds.FieldByName('CODCENTRORESPON').AsString,
                                                                 '','');
                                 cdsCAPItemOC.Next;
                              End;
                             //Ajuda problemas de arredondamento.
                           if rTotValor <> 0 Then
                              Begin
                                 _Documento.Rateiodocum.SetValues(rTotValor,0,0,0,Sistema.IdEmpresa,0,
                                                                 _cds.FieldByName('UNIDNEGOC').AsInteger,0, Trunc(_Documento.IdUsuario),0,0,
                                                                 _cds.FieldByName('IDPLANOPREV').AsInteger,
                                                                 _cds.FieldByName('IDPATRO').AsInteger,
                                                                 _cds.FieldByName('IDPROGRAMA').AsInteger,0,
                                                                 Sistema.IdEmpresa,
                                                                 cdsCAPItemOC.FieldByName('CODTIPRECDES').AsString,
                                                                 'P',_cds.FieldByName('CODCENTRORESPON').AsString,
                                                                 '','');
                              End;
                           If Not _Documento.Insert Then
                              Raise Exception.Create( _Documento.MessageInfo );
                           cdsCAPPrzPGOC.Next;
                        End;
                  End;
            End;
      Except
         On E:Exception Do
            Begin
               Result := False;
               MessageInfo := E.Message;
            End;
      End;
   Finally
      FreeCds([cdsCAPOC,cdsCAPItemOC,cdsCAPPrzPGOC]);
   end;
end;




function TCtrlOrdemCompra.GetUltContato(IdPessoa,
  IdForCli: Double): String;
Var
   SQL : String;
Begin
   SQL := ' SELECT ULTCONTATO FROM EMPRESAFORN '+
          ' WHERE (IDFORCLI = '+ FloatToStr(IdForCli)+')'+
          '   AND (IDPESSOA = '+ FloatToStr(IdPessoa)+')';

   _Cds.Data := GetDataPacket(SQL);

   Result := _Cds.FieldByName('ULTCONTATO').AsString;
end;




procedure TCtrlOrdemCompra.SetNumOC(const Value: Double);
begin
  FNumOC := Value;
end;




procedure TCtrlOrdemCompra.SetNumOCFim(const Value: Double);
begin
  FNumOCFim := Value;
end;




function TCtrlOrdemCompra.DeletaPrevisaoCAP(IdPessoa,
  NumOC: Double): Boolean;
Var
   SQL : String;
begin
   Result := True;
   Try
      SQL :=' SELECT CODDOCUMENTO  FROM  DOCUMENTO  '+
            ' WHERE  (NODOCUMENTO = '+FloatToStr(NumOC)+')'+
            '    AND (IDMODULO = 113) '+
            '    AND (OPERACAO = ''12'')'+
            '    AND (IDPESSOA = '+FloatToStr(IdPessoa)+')'+
            '    AND (RECPAG = ''P'') ';

     _Cds.Data := GetDataPacket(SQL);

     _Cds.First;
     While Not _Cds.Eof Do
        Begin
           _Documento.Prepare(OpDocumento, odlPrevisao);
           _Documento.CodDocumento := _Cds.FieldByName('CODDOCUMENTO').AsInteger;

           If Not _Documento.Delete Then
              Raise Exception.Create( _Documento.MessageInfo );

           _Cds.Next;
        End;
   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;
end;




procedure TCtrlOrdemCompra.SetPrevisaoCap(const Value: Boolean);
begin
  FPrevisaoCap := Value;
end;




function TCtrlOrdemCompra.BaixaOC(IdItemOC, Quantidade: Double;CodMedida : String;
  DeixaQtdePendente: Boolean): Boolean;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.BaixaOC(IdItemOC, Quantidade,CodMedida ,DeixaQtdePendente );

        MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        Try
           StartTransaction;

           _DbItemOC.IdItemOC.AsFloat := IdItemOC;
           If _DbItemOC.LoadFromDb Then
              Begin
                 //----------------------------------------------------------------------
                 // Converte para mesma unidade de medida para poder subtrair
                 //----------------------------------------------------------------------
                 Quantidade := _UnMedida.QtdeToUnidade( _DbItemOC.CodArtigo.AsString,
                                                        _DbItemOC.CodMedida.AsString,
                                                        CodMedida,
                                                        Quantidade );

                 _DbItemOC.QtdeRecebida.AsFloat := _DbItemOC.QtdeRecebida.AsFloat + Quantidade;

                 If DeixaQtdePendente Then
                    _DbItemOC.FlgItemAtendido.AsString := 'F'
                 Else
                    _DbItemOC.FlgItemAtendido.AsString := 'T';

                 If Not _DbItemOC.Update then
                    Raise Exception.Create( _DbItemOC.MessageInfo );
              End
           Else
              Raise Exception.Create( MSG_ITEMOC_NAO_ACHEI );

           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;




function TCtrlOrdemCompra.GetSCIOrigem(NumOC: Double): OleVariant;
Var
   Sql : TStrings;
begin
   Sql := TStringList.Create;
   Try
     Sql.Add(' SELECT NUMSOLCOMPRA, CODCENTROCUSTO, NOME ');
     Sql.Add(' FROM VWSCIORIGEM ');
     Sql.Add(' WHERE  ( NUMOC = '+FloatToStr( NumOC )+ ') ');
     Sql.Add(' ORDER BY NUMSOLCOMPRA ');

     Result := GetDataPacket( Sql.GetText );
   Finally
     Sql.Free;
   End;
end;



function TCtrlOrdemCompra.BuscaIdNumReserva(const NumReserva:Integer;
                                            const bMostraMsg:Boolean
                                           ):Integer;
var sSQL: String;
    FCdsAux     : TClientDataSet;

begin

  Result := -1;
  FcdsAux     := TClientDataSet.Create(nil);

  sSQL := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, C.CODCENTRORESPON FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE R.IDPESSOA =' + IntToStr( Sistema.IdEmpresa) +
          ' AND C.IDPLANOORCAMEN = R.IDPLANOORCAMEN' +
          ' AND C.IDCONTAORCAMEN = R.IDCONTAORCAMEN' +
          ' AND R.IDRESERVAORCAMEN = ' + IntToStr(NumReserva);

  try
    FCdsAux.Data := GetDataPacket(sSQL);
    if not FCdsAux.IsEmpty then begin
       Result := FCdsAux.FieldByname('NUMRESERVA').AsInteger;
    end;
  except
    Result := -1;
  end;
  FcdsAux.Free;

end;




function TCtrlOrdemCompra.EstornaCompromisso(iNumReserva:longint;
                                             rValor:extended;
                                             bExibeMsg: boolean
                                             ):Integer;
var sMsg, sSQL: String;
    FCdsAux     : TClientDataSet;

begin
  //Função que procede com o estorno do Compromisso Orçamentário
  FcdsAux     := TClientDataSet.Create(nil);

  result := 0;

  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA   = ' + IntToStr( Sistema.IdEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';

  with FCdsAux do begin
    Data := GetDataPacket(sSQL);
    if not _Orcamento.VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para estornar o compromisso
      result := 1;
    end
    else begin
       if (FieldByName('FLGRESERVA').asString = 'E') or
          (FieldByName('FLGRESERVA').asString = 'A') then begin
         //O compromisso está efetivado, e pode ser estornado
         try
           sSQL :=        'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''C''';
           sSQL := sSQL + ', VLRCOMPROMISSO = VLRCOMPROMISSO + ' + FloatToStrCM(rValor * (-1));
           sSQL := sSQL + ' WHERE NUMRESERVA = ' + IntToStr(iNumReserva);
           ExecSQL(sSql);

           //A efetivação foi realizada com sucesso
           result := 0;
         except
           //Ocorreu um erro inesperado no Banco de Dados
           result := 5;
         end;
       end;
    end;
  end;


  GravaLogPLANEORC('uCtrlOrdemCompra.EstornaCompromisso: Compromisso  nº ' + IntToStr(iNumReserva) + ' - ' +
                   'Valor = ' + FloatToStr(rValor),
                    Sistema.IdModulo,
                    Sistema.IdUsuario);

  FcdsAux.Free;

  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para o Estorno';
      2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                  'não de um Compromisso';
      3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
      4 : sMsg := 'O número enviado é de um Compromisso ainda Aguardando';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;




function TCtrlOrdemCompra.GetPrazoPgto(CodProcesso, IdProcxArt, Proposta, IdForCli: Double): OleVariant;
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




function TCtrlOrdemCompra.GetPrazoEntrega(CodProcesso, IdProcxArt, Proposta, IdForCli: Double): OleVariant;
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




function TCtrlOrdemCompra.IntegraOrcamento: boolean;
// ****************************************************************************
// Função para saber se haverá INTEGRAÇÃO com o módulo do ORÇAMENTO
// ****************************************************************************
var
  CdsAux : TClientDataSet;
  sSql    : string;
begin
  try
    CdsAux := TClientDataSet.Create(nil);
    sSql := 'SELECT FLGORCAMENTO ' +
            '  FROM PARAMCOMPRAS ' +
            ' WHERE IDPESSOA = '   + IntToStr(Sistema.IdEmpresa);

    CdsAux.Data := GetDataPacket(sSql);

    Result := (CdsAux.FieldByNAme('FLGORCAMENTO').AsString = 'S');
  finally
    FreeAndNil(CdsAux);
  end;
end;




function TCtrlOrdemCompra.BuscaMargemQuebra: double;
// ****************************************************************************
// Função que retorna a MARGEM de QUEBRA permitida, configurada nos parâmetros
// do módulo de COMPRAS.
// ****************************************************************************
var
  cdsAux : TClientDataSet;
  sSql   : string;
begin
  try
    cdsAux := TClientDataSet.Create(nil);
    sSql := 'SELECT FLGORCAMENTO,'                     +
            '       NVL(FLGMARGEMOC,0) AS FLGMARGEMOC' +
            '  FROM PARAMCOMPRAS'                      +
            ' WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);

    cdsAux.Data  := GetDataPacket(sSql);

    Result := (1 + (cdsAux.FieldByName('FLGMARGEMOC').AsFloat / 100));
  finally
    FreeAndNil(CdsAux);
  end;
end;




function TCtrlOrdemCompra.BuscaValorReserva(const iNumReserva: double): double;
// ****************************************************************************
// Função que retorna o VALOR de uma RESERVA ORÇAMENTÁRIA
// ****************************************************************************
var
  CdsAux : TClientDataSet;
  sSql   : string;
begin
  try
    CdsAux := TClientDataSet.Create(nil);
    sSql := 'SELECT NVL(VLRRESERVA,0) AS VLRRESERVA ' +
            ' FROM RESERVAORCAMEN '                   +
            'WHERE NUMRESERVA = ' + FloatToStr(iNumReserva);

    CdsAux.Data := GetDataPacket(sSql);

    Result := CdsAux.FieldByName('VLRRESERVA').AsFloat;
  finally
    FreeAndNil(CdsAux);
  end;
end;




function TCtrlOrdemCompra.BuscaNumReserva(const iNumSolCompra: double): double;
// ****************************************************************************
// Função que retorna o NÚMERO de uma RESERVA a partir de uma
// SOLICITAÇÃO DE COMPRAS
// ****************************************************************************
var
  CdsAux : TClientDataSet;
  sSql   : string;
begin
  try
    CdsAux := TClientDataSet.Create(nil);
    sSql := 'SELECT IDRESERVAORCAMEN ' +
            '  FROM SOLICOMP '         +
            ' WHERE NUMSOLCOMPRA = '   + FloatToStr(iNumSolCompra);

    CdsAux.Data := GetDataPacket(sSql);

    Result := CdsAux.FieldByName('IDRESERVAORCAMEN').AsFloat;
  finally
    FreeAndNil(CdsAux);
  end;
end;




function TCtrlOrdemCompra.BuscaTotalSCI(iNumSolCompra: double): double;
// ****************************************************************************
// Função que retorna o VALOR TOTAL de uma SOLICITAÇÃO DE COMPRAS
// ****************************************************************************
var
  CdsAuxItemOC, CdsAuxSCItemOC : TClientDataSet;
  VlrSCI: double;

begin
  try
    // Cria os CDS auxiliares
    CdsAuxItemOC   := TClientDataSet.Create(nil);
    CdsAuxSCItemOC := TClientDataSet.Create(nil);

    // Busca os dados para manipular
    CdsAuxItemOC.Data   := FCdsItemOC.Data;
    CdsAuxSCItemOC.Data := FCdsSCItemOC.Data;

    // Calcula o valor da SCI atual
    Result := 0;
    VlrSCI := 0;

    // Aplica o  filtro por SCI no CDS
    CdsAuxSCItemOC.Filter := 'NUMSOLCOMPRA =' + FloatToStr(iNumSolCompra);
    CdsAuxSCItemOC.Filtered := True;
    CdsAuxSCItemOC.First;

    // Calcula o Total da SCI
    while not CdsAuxSCItemOC.Eof do
      begin

        CdsAuxItemOC.First;
        while not CdsAuxItemOC.Eof do
          begin
            if CdsAuxSCItemOC.FieldByName('IDITEMOC').AsFloat = CdsAuxItemOC.FieldByName('IDITEMOC').AsFloat then
              VlrSCI := VlrSCI + (CdsAuxItemOC.FieldByName('QTDEPEDIDA').AsFloat * CdsAuxItemOC.FieldByName('VALORUN').AsFloat);

            CdsAuxItemOC.Next;
          end;

        CdsAuxSCItemOC.Next;
      end;

    Result := VlrSCI;

    // Remove o filtro aplicado
    CdsAuxSCItemOC.Filter := '';
    CdsAuxSCItemOC.Filtered := False;
  finally
    FreeAndNil(CdsAuxItemOC);
    FreeAndNil(CdsAuxSCItemOC);
  end;
end;

function TCtrlOrdemCompra.QtdCompromissos(idReserva: double): integer;
// Função para retornar a quantidade de compromissos gerados a partir de uma
// determinada reserva.
var
   CdsAux : TClientDataSet;
begin
  Result := 0;
  try
    CdsAux      := TClientDataSet.Create(nil);
    CdsAux.Data := CtrlResXComp.ListarCompromissosDaReserva(idReserva, Sistema.IdEmpresa);
    Result      := CdsAux.RecordCount;
  finally
    FreeAndNil(CdsAux);
  end;
end;

function TCtrlOrdemCompra.BuscaIdReserva(NumOC: double): double;
// Função que retorna o ID de uma Reserva a partir do Número de uma OC
var
  CdsAux: TClientDataSet;
  sSql : string;
begin
  try
    CdsAux := TClientDataSet.Create(nil);

    sSql := 'SELECT IDRESERVA ' +
            '  FROM RESXCOMP A, ' +
            '       (SELECT IDRESERVAORCAMEN ' +
            '          FROM ITEMOC I, OC O ' +
            '         WHERE I.NUMOC = ' + FloatToStr(NumOC) +
            '           AND I.NUMOC = O.NUMOC) B ' +
            ' WHERE B.IDRESERVAORCAMEN = A.IDCOMPROMISSO ';

    CdsAux.Data := GetDataPacket(sSql);

    if CdsAux.RecordCount <> 0 then
      Result := CdsAux.FieldByName('IDRESERVA').AsFloat
    else
      Result := 0;

  finally
    FreeAndNil(CdsAux);
  end;
end;



function TCtrlOrdemCompra.BuscaNumOC(IdItemOC: double): double;
var
  CdsAux: TClientDataSet;
  sSql : string;
begin
  try
    CdsAux := TClientDataSet.Create(nil);

    sSql := 'SELECT O.NUMOC ' +
            '  FROM ITEMOC I, OC O ' +
            ' WHERE I.NUMOC = O.NUMOC ' +
            '   AND IDITEMOC = ' + FloatToStr(IdItemOC);

    CdsAux.Data := GetDataPacket(sSql);

    if CdsAux.RecordCount <> 0 then
      Result := CdsAux.FieldByName('NUMOC').AsFloat
    else
      Result := 0;

  finally
    FreeAndNil(CdsAux);
  end;
end;



function TCtrlOrdemCompra.MsgOCsGeradas: string;
// Função para Montar a MENSAGEM a ser EXIBIDA no Término do Processo de Gerar OC's
// e Compromissos.
var
  i : integer;
begin
  // Ordena o Conteúdo das StringList's
  ListaMsgComp.Sort;
  ListaMsgOC.Sort;

  // Monta as OC's Geradas
  Result := MSG_OC_GERADAS;
  case ListaMsgOC.Count of
    0 : Result := Result + '';
    1 : Result := Result + #13 + ListaMsgOC[0];
  else
    begin
      Result := Result + #13 + ListaMsgOC[0];
      for i := 1 to ListaMsgOC.Count - 1 do
        Result := Result + #13 + ListaMsgOC[i];
    end;
  end;

  // Monta os Compromissos Gerados
  case ListaMsgComp.Count of
    0 : Result := Result + '';
    1 : Result := Result + #13 + ListaMsgComp[0];
  else
    begin
      Result := Result + #13 + ListaMsgComp[0];
      for i := 1 to ListaMsgComp.Count - 1 do
        Result := Result + #13 + ListaMsgComp[i];
    end;
  end;
end;

function TCtrlOrdemCompra.GetReservaDaOC(numOC: double): integer;
var sSql : string;
    cds : tclientDataSet;
begin
 sSql := ' SELECT NVL(IDRESERVAORCAMEN, 0) AS IDRESERVAORCAMEN FROM ITEMOC WHERE NUMOC = '+ floatToStr(numOC);
 cds := tclientDataSet.Create(nil);
 try
   cds.data := getDataPacket(sSql);
   result := cds.fieldByName('IDRESERVAORCAMEN').asInteger;
 finally
   cds.free;
 end;
end;

function TCtrlOrdemCompra.GerandoOC(iItemSoli: integer): boolean;
var
  sSQL: string;
  cdsAux: TClientDataSet;
begin
  try
     Result := False;

     cdsAux := TClientDataSet.Create(nil);

     sSQL := 'SELECT QTDEPENDENTE, QTDEPEDIDA FROM ITEMSOLI '+
             'WHERE IDITEMSOLI = ' + IntToStr(iItemSoli);

     cdsAux.Data := GetDataPacket(sSQL);

     Result := FloatsEqual(cdsAux.FieldByName('QTDEPENDENTE').AsFloat,
                           cdsAux.FieldByName('QTDEPEDIDA').AsFloat);
  finally
     FreeAndNil(cdsAux);
  end;
end;

function TCtrlOrdemCompra.ocsVinculadasAoProcesso(
  codProcesso: extended): integer;

{ ** Pensei em retornar um boolean mas, ficaria muito restrita à condição específica.
     Implementei desta forma pois permite uma maior reutilização. ** }

var
  sql: String;
  cdsVinculo: TClientDataSet;
begin
  try
    cdsVinculo := TClientDataSet.Create(nil);

    sql :=
      'select  count(*) as ocsnoprocesso, proc_oc.codprocesso ' +
      'from ' +
      '   (select oc.numoc,' +
      '           p.codprocesso  ' +
      '    from   scitemoc sci,  ' +
      '           solicomp sol,  ' +
      '           itemsoli isol, ' +
      '           itemoc ioc,    ' +
      '           oc,            ' +
      '           processo p     ' +
      '    where  sci.iditemoc = ioc.iditemoc ' +
      '       and sci.numsolcompra = sol.numsolcompra ' +
      '       and ioc.numoc = oc.numoc ' +
      '       and p.codprocesso = isol.codprocesso ' +
      '       and p.codprocesso = ' + floatToStr(codProcesso) +
      '    group by oc.numoc, ' +
      '             p.codprocesso ) proc_oc ' +
      'group by proc_oc.codprocesso ' ;
    cdsVinculo.data := getDataPacket(sql);

    result := cdsVinculo.fieldByName('ocsnoprocesso').AsInteger;
  finally
    freeAndNil(cdsVinculo);
  end;
end;

end.



