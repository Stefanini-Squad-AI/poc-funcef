{ --------------------------------------------------------------------------------------------------
Data      : 27.10.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 24187
Descrição : Retorna na consulta somente artigos que não tenham OCs associadas.
-------------------------------------------------------------------------------------------------------
Data      : 20.09.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 26385
Descrição : Previne problemas caso o RAD esteja ativo e não exista tipo de processo vinculado ao mesmo.
-------------------------------------------------------------------------------------------------------
Data      : 30.01.2007
Autor     : Antonio Marcos (amf)
Pendência : 24187
Descrição : OCs sem cotação não devem participar do processo de compras (As SCIs não podem ser listadas na tela de Processo de Compras)
----------------------------------------------------------------------------------------------------
Data      : 30.11.2006
Autor     : Antonio Marcos (amf)
Pendência : 23860
Descrição : Implementar o RAD+ no Sistema de Compras
--------------------------------------------------------------------------------}

unit uCtrlSoliCompra;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,uDbSoliComp,
     uDBItemSoli, uMidasUtil, sysUtils, dbclient,Classes,
     uSistema, uCMTypes, uCtrlRAD, uCtrlOrdemCompra, uCtrlImpostoRetido,
     uCtrlOrcamento,

     uCtrlRADPlus;
Const
   MSG_JA_EXIST_COMPRA       = 'Esta Solicitação não pode ser excluida, pois já existem itens comprados. Escolha a opção alterar e exclua os itens solicitados ';
   MSG_JA_EM_PROCESSOCOMPRA  = 'Esta Solicitação não pode ser excluida, pois já existem itens em processo de compra';
   MSG_JA_RECEBIDO_MERC      = 'Solicitação não pode ser excluida. Existem itens já recebidos';
   MSG_RESERV_NAO_AUTORIZADA = ' não pode ser solicitado por esta reserva orçamentária';
   MSG_JA_EM_OC              = 'Existem itens já em Ordem de Compras. Exclusão proibida.';
   MSG_SCI_JA_AUTORIZADA     = ' Proibido alterar solicitação. Autorização R.A.D. já realizada ';
Type
  {**
    Tipo de Operação para atribução de comprador
  **}
  TipoOperacao = ( toAtribuir, toRemover );

  TStatusSCI   = (ssTodas, ssPendentes, ssAtendParcial, ssAtendTotal);

  TCtrlSoliCompra = class(TCmControlObject)

  Protected
     Procedure AfterInitialize; Override;
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
     procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean);  Override;
     procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;
  private
    sGrpProduto : String;
    rIdUsuario  : Double;
    //
    _DbSoliComp    : TDbSoliComp;
    _DBItemSoli    : TDBItemSoli;
    _RAD           : TCtrlRAD;

    RADPlus        : TCtrlRADPlus;
    IdProcesso     : integer;

    _OC            : TCtrlOrdemCompra;
    _ImpostoRetido : TCtrlImpostoRetido;
    _Orcamento     : TOrcamentoBackMT;

    Fcds: TClientDataSet;
    FcdsItem: TClientDataSet;
    FrValorTotal: double;
    FsGrupoProd: String;
    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsItem(const Value: TClientDataSet);
    procedure SetrValorTotal(const Value: double);
    procedure SetsGrupoProd(const Value: String);
    {**
       Gera a Ordem de Compra aurtomaticamente através do contrato de Produto
    **}
    Function GerarOCAuto( IdUsuario : Double ) : Boolean;

  Public
    Property cds         : TClientDataSet read Fcds write Setcds;
    Property cdsItem     : TClientDataSet read FcdsItem write SetcdsItem;
    Property rValorTotal : double read FrValorTotal write SetrValorTotal;
    Property sGrupoProd  : String read FsGrupoProd write SetsGrupoProd;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    {**
       Grava as Solicitações no banco de dados
    **}
    Function Gravar(  Valor     : Double;
                      IdUsuario : Double;
                      Grupo     : String ) : Boolean;
    {**
       Apaga as Solicitações  no banco de dados
    **}
    Function Excluir : Boolean;
    {**
       Busca as Solicitações  existentes.
    **}
    Function Procurar( NumSolCompra : Double ) : OleVariant;
    {**
       Busca os Itens da Solicitação.
    **}
    Function GetItem( NumSolCompra, CodCusteio : Double ) : OleVariant;
    {**
       Verifica se a Solicitações já possui algum item atribuido
       a um processo de Compra
    **}
    Function PossuiItemEmCotacao( NumSolCompra : Double ) : Boolean;
    {**
       Atribui um Comprador para o item da Solicitação, para que este
       possa entrar em processo de compra
    **}
    Function AtribuirComprador(Operacao : TipoOperacao; idItemSoli : Double; IdComprador : Double = 0) : Boolean;
    {**
       Informa as Solicitações de Compra de acordo com a parametrização
    **}
    Function ListSoliCompra( VerifRAD : Boolean ; NumSolCompra : Double = 0 ; IdPessoa : Integer = 0; CodArtigo : String = ''; CodGrupoProd : String = ''; IdComprador : Double = 0; DataNecessidade : Double = 0 ) : OleVariant;
    {**
      Informa um lista com os números da solicitações de compra que ainda
      não possuem comprador atribuído.
     **}
    Function ListNumSoliSemComprador(VerifRAD : Boolean ;IdComprador : Double = 0) : OleVariant;
    {**
       Gera uma lista das  Solicitações existentes existentes comforme
       os filtros.
    **}
    Function ListAcompSCI( IdPessoa        : Integer;
                           NumSCI          : Double;
                           Status          : TStatusSCI;
                           CodCentroCusto  : String;
                           CodAlmoxarifado : Integer;
                           CodGrupoProd    : String;
                           CodArtigo       : String;
                           IdUsuario       : Double;
                           DataEmisIni     : TDateTime;
                           DataEmisFim     : TDateTime;
                           DataNecIni      : TDateTime;
                           DataNecFim      : TDateTime) : OleVariant;
    {**
      Lista os itens de ordem de compras oriundios deste item de solicitação
    **}
    Function ListItemSolixOC( IdItemSoli : Double ) : OleVariant;
    {**
      Lista os itens de um Nota Fiscal oriundios deste item de solicitação
    **}
    Function ListItemSolixReceb( IdItemSoli : Double )  : OleVariant;
    {**
       Verifica se a SCI pode excluir
    **}
    Function PodeExcluir( NumSolCompra : Double ) : Boolean;
    {**
       Verifica se Reserva Orcamentária pode comprar o determinado artigo
    **}
    Function VerifReservaxArtigo( IdReseva  : Double;
                                  CodArtigo : String ) : Boolean;

    //Verifico se a solicitação já está associada a alguma OC.
    function SolicitacaoTemOCVinculada(ANumSolCompra: double): boolean;

  End;

implementation

{ TCtrlSoliCompra }

procedure TCtrlSoliCompra.AfterApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
Var
   SQL        : String;
   iStatusRAD : TRADStatus;
   sStatusRAD : string;
begin
   If (sTableName = 'SOLICOMP') And (CdsState = usInserted) Then
   begin
      //------------------------------------------------------------------------------------------------------
      // Gravar o R.A.D.
      //------------------------------------------------------------------------------------------------------

      if (Sistema.UsaRAD) then
      begin
        if (Sistema.VersaoRAD = '+') then
        begin
            RADPlus.InicializaPropriedades;
            RADPlus.IdEventoGerador  := 3;
            RADPlus.IdEmpresa        := _DbSoliComp.IdPessoa.AsInteger;
            RADPlus.IdUsuario       := Trunc(rIdUsuario);
            RADPlus.CodCentroRespon := _DbSoliComp.CodCentroRespon.AsString;
            RADPlus.UnidNegoc       := _DbSoliComp.UnidNegoc.AsInteger;
            RADPlus.OBS             := 'S.C.I. Número : '+ _DbSoliComp.NumSolCompra.AsString;
            RADPlus.VlrProc           := FrValorTotal;
            RADPlus.CodGrupoProd    := FsGrupoProd;
            RADPlus.idEmpresa       := _DbSoliComp.IdEmpresa.AsInteger;
            RADPlus.CodCentroCusto  := _DbSoliComp.CodCentroCusto.AsString;

            IdProcesso := RADPlus.IniciarProcesso;

            if ( idProcesso = 0 ) then
            begin
               if (radPlus.RecuperaTipoProcesso(3, sistema.IdEmpresa) = 0 ) then
                  Accept := true
               else
                  Raise Exception.Create( RADPlus.MessageInfo );
            end
            else
            begin
               SQL := ' UPDATE SOLICOMP SET IDPROCESSO = '+FloatToStr(IdProcesso)+
                        ' WHERE  (NUMSOLCOMPRA = '+_DbSoliComp.NumSolCompra.AsString+') ';

               If Not ExecSQL( SQL ,True ) Then
                    Raise Exception.Create( MessageInfo );
            end;
           end
           else
           begin
             if (_RAD.TipoProcesso > 0) then
             begin
              _RAD.IdPessoa        := _DbSoliComp.IdPessoa.AsInteger;
              _RAD.IdUsuario       := Trunc(rIdUsuario);
              _RAD.CodCentroRespon := _DbSoliComp.CodCentroRespon.AsString;
              _RAD.UnidNegoc       := _DbSoliComp.UnidNegoc.AsInteger;
              _RAD.OBS             := 'S.C.I. Número : '+ _DbSoliComp.NumSolCompra.AsString;
              _RAD.Valor           := FrValorTotal;
              _RAD.CodGrupoProd    := FsGrupoProd;
              _RAD.idEmpresa       := _DbSoliComp.IdEmpresa.AsInteger;
              _RAD.CodCentroCusto  := _DbSoliComp.CodCentroCusto.AsString;

              IdProcesso := _RAD.IniciarProcesso;

              If IdProcesso < 0 Then
                 Raise Exception.Create( _RAD.MessageInfo );

                 SQL := ' UPDATE SOLICOMP SET IDPROCESSO = '+ FloatToStr(IdProcesso)+
                     ' WHERE  (NUMSOLCOMPRA = '+ _DbSoliComp.NumSolCompra.AsString+') ';

              if not ExecSQL( SQL ,True ) Then
                 Raise Exception.Create( MessageInfo );
             end;
           end;
      end;
   end;

   If (sTableName = 'SOLICOMP') And (CdsState = usModified) Then
   begin
      if (Sistema.UsaRAD) then
      begin
        if (Sistema.VersaoRAD = '+') then
           sStatusRAD := RADPlus.SituacaoProcesso(aCds.FieldByName('IDPROCESSO').AsInteger)
        else
           iStatusRAD := _RAD.StatusProcesso(aCds.FieldByName('IDPROCESSO').AsFloat);
      end;

      if (sStatusRAD = 'S') then
         iStatusRAD := rsAutorizado
      else if (sStatusRAD = 'R') then
         iStatusRAD := rsRecusado;

      Case iStatusRAD Of
          rsRecusado :
             Begin
                //------------------------------------------------------------------------------------------------------
                // Gravar o R.A.D.
                //------------------------------------------------------------------------------------------------------
                if (Sistema.VersaoRAD = '+') then
                begin
                   if (RADPlus.TipoProcesso > 0) then
                   begin
                      RADPlus.InicializaPropriedades;
                      RADPlus.IdEventoGerador := 3;
                      IdProcesso := RADPlus.IniciarProcesso;
                      RADPlus.IdEmpresa        := _DbSoliComp.IdPessoa.AsInteger;
                      RADPlus.IdUsuario       := Trunc(rIdUsuario);
                      RADPlus.CodCentroRespon := _DbSoliComp.CodCentroRespon.AsString;
                      RADPlus.UnidNegoc       := _DbSoliComp.UnidNegoc.AsInteger;
                      RADPlus.OBS             := 'S.C.I. Número : '+ _DbSoliComp.NumSolCompra.AsString;
                      RADPlus.VlrProc           := FrValorTotal;
                      RADPlus.CodGrupoProd    := FsGrupoProd;
                      RADPlus.idEmpresa       := _DbSoliComp.IdEmpresa.AsInteger;
                      RADPlus.CodCentroCusto  := _DbSoliComp.CodCentroCusto.AsString;

                      if ( idProcesso = 0 ) then
                      begin
                         if ( radPlus.RecuperaTipoProcesso(3, sistema.IdEmpresa) = 0 ) then
                            Accept := True
                         else
                            Raise Exception.Create( RADPlus.MessageInfo );
                      end
                      else
                      begin
                         SQL := ' UPDATE SOLICOMP SET IDPROCESSO = '+FloatToStr(IdProcesso)+
                                 ' WHERE  (NUMSOLCOMPRA = '+_DbSoliComp.NumSolCompra.AsString+') ';

                         If Not ExecSQL( SQL ,True ) Then
                            Raise Exception.Create( MessageInfo );
                      end;
                   end;
                end
                else
                begin
                    If (_RAD.TipoProcesso > 0) Then
                    Begin
                       _RAD.IdPessoa        := _DbSoliComp.IdPessoa.AsInteger;
                       _RAD.IdUsuario       := Trunc(rIdUsuario);
                       _RAD.CodCentroRespon := _DbSoliComp.CodCentroRespon.AsString;
                       _RAD.UnidNegoc       := _DbSoliComp.UnidNegoc.AsInteger;
                       _RAD.OBS             := 'S.C.I. Número : '+ _DbSoliComp.NumSolCompra.AsString;
                       _RAD.Valor           := FrValorTotal;
                       _RAD.CodGrupoProd    := FsGrupoProd;
                       _RAD.idEmpresa       := _DbSoliComp.IdEmpresa.AsInteger;
                       _RAD.CodCentroCusto  := _DbSoliComp.CodCentroCusto.AsString;

                       IdProcesso := _RAD.IniciarProcesso;

                       If IdProcesso < 0 Then
                          Raise Exception.Create( _RAD.MessageInfo );

                       SQL := ' UPDATE SOLICOMP SET IDPROCESSO = '+FloatToStr(IdProcesso)+
                              ' WHERE  (NUMSOLCOMPRA = '+_DbSoliComp.NumSolCompra.AsString+') ';

                       If Not ExecSQL( SQL ,True ) Then
                          Raise Exception.Create( MessageInfo );
                   End;
                end;
             End;
          rsAutorizado :
             begin
                 Raise Exception.Create( MSG_SCI_JA_AUTORIZADA );
             end;
      End;
   end;
end;

procedure TCtrlSoliCompra.AfterInitialize;
begin
  inherited;
  _RAD.InitializeAs(Self);
  _RAD.OpenTransaction := False;

  _OC.InitializeAs(Self);
  _OC.OpenTransaction := False;

  _ImpostoRetido.InitializeAs(Self);
  _ImpostoRetido.OpenTransaction := False;

  _Orcamento.InitializeAs(Self);

  RADPlus.InitializeAs(Self);
  RADPlus.OpenTransaction := false;
  RADPlus.InitializeAs(Self);
  RADPlus.OpenTransaction := false;

end;

function TCtrlSoliCompra.AtribuirComprador(Operacao: TipoOperacao;
  idItemSoli, IdComprador: Double): Boolean;
Var
   SQL   : String;
Begin
  Result := True;
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AtribuirComprador ( Operacao, idItemSoli, IdComprador );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           If Operacao = toAtribuir Then
              SQL := ' UPDATE ITEMSOLI SET IDCOMPRADOR = ' + FloatToStr(IdComprador)+
                     ' WHERE ( IDITEMSOLI = '+FloatToStr(IdItemSoli)+') '
           Else
              SQL := ' UPDATE ITEMSOLI SET IDCOMPRADOR = NULL '+
                     ' WHERE ( IDITEMSOLI = '+FloatToStr(IdItemSoli)+') ';

           If Not ExecSQL(SQL,True) Then
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
     End;
end;

constructor TCtrlSoliCompra.Create;
begin
  inherited;
  sGrupoProd       := '';

  _DbSoliComp      := TDbSoliComp.Create(Self);
  _DbItemSoli      := TDbItemSoli.Create(Self);

  _RAD             := TCtrlRAD.Create;

  RADPlus          := TCtrlRAdPlus.Create;

  _OC              := TCtrlOrdemCompra.Create;
  _ImpostoRetido   := TCtrlImpostoRetido.Create;
  _Orcamento       := TOrcamentoBackMT.Create;

end;

destructor TCtrlSoliCompra.Destroy;
begin
   If IsAppServer Then
      FreeCds([Fcds, FcdsItem]);

  _DbSoliComp.Free;
  _DbItemSoli.Free;

  _RAD.Free;

  FreeAndNil(RADPlus);

  _OC.Free;
  _ImpostoRetido.Free;
  _Orcamento.Free;

  inherited;
end;

procedure TCtrlSoliCompra.DoChangeDataBase;
begin
  inherited;
  _DbSoliComp.DataBaseName := DataBaseName;
  _DbItemSoli.DataBaseName := DataBaseName;
end;

function TCtrlSoliCompra.Excluir: Boolean;
Var
   IdNumReserva  : Integer;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirSoliCompra ( Fcds.Data, FcdsItem.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FcdsItem,_DbItemSoli,[],[] );
           If Not Result Then Raise Exception.Create(_DbItemSoli.MessageInfo);

           Try
               Fcds.StatusFilter := [usDeleted];
              // ------------------------------------------------------------------
              // Estorna a Reserva ORcamentária
              // ------------------------------------------------------------------
              If Not FCds.FieldByName('IDRESERVAORCAMEN').IsNull Then
                 Begin
                    IdNumReserva := _Orcamento.BuscaIdNumReserva(FCds.FieldByName('IDRESERVAORCAMEN').AsInteger,0,True);

                    Result := _Orcamento.EstornaReserva(IdNumReserva,True) = 0;
                    If Not Result Then
                       Raise Exception.Create(_Orcamento.MessageInfo );
                 End;
              // ------------------------------------------------------------------
              // Estorna o Processo no R.A.D.
              // ------------------------------------------------------------------
              If Not FCds.FieldByName('IDPROCESSO').IsNull Then
              begin
                 if (Sistema.VersaoRAD = '+') then
                 begin
                   If (not RADPlus.ExcluirProcesso(IdProcesso)) then
                      Raise Exception.Create( RADPlus.MessageInfo );
                 end
                 else
                 begin
                   If (not _RAD.GravaStatusProcesso(FCds.FieldByName('IDPROCESSO').AsFloat, rsRecusado)) then
                      Raise Exception.Create( _RAD.MessageInfo );
                 end;
              end;
           Finally
              Fcds.StatusFilter := [];
           End;
           // Pai
           Result := ApplyCds(Fcds,_DbSoliComp,[],[] );
           If Not Result Then Raise Exception.Create(_DbSoliComp.MessageInfo);

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

function TCtrlSoliCompra.GerarOCAuto( IdUsuario : Double ) : Boolean;
Var
  cdsItemSoli       : TClientDataSet;
  cdsOC             : TClientDataSet;
  cdsItemOC         : TClientDataSet;
  cdsAgregItemOC    : TClientDataSet;
  cdsPrazoPgtoOC    : TClientDataSet;
  cdsPrazoEntregaOC : TClientDataSet;
  cdsSCItemOC       : TClientDataSet;
  CdsForn           : TClientDataSet;
  CdsAgregProd      : TClientDataSet;
  UltIDForne        : Integer;
  iPrazo            : Integer;
  SQL               : String;
  rBase             : Double;
  rPerc             : Double;
  rValorImp         : Double;
begin
   Result := True;

   CdsItemSoli       := TClientDataSet.Create(nil);
   CdsOC             := TClientDataSet.Create(nil);
   CdsItemOC         := TClientDataSet.Create(nil);
   cdsAgregItemOC    := TClientDataSet.Create(nil);
   CdsPrazoPgtoOC    := TClientDataSet.Create(nil);
   CdsPrazoEntregaOC := TClientDataSet.Create(nil);
   CdsSCItemOC       := TClientDataSet.Create(nil);
   CdsForn           := TClientDataSet.Create(nil);
   CdsAgregProd      := TClientDataSet.Create(nil);

   cdsItemSoli.Data  := FCdsItem.Data;

   //------------------------------------------------------------------------
   // Inicializa os cds´s da OC
   //------------------------------------------------------------------------
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
   Try
      Try
         cdsItemSoli.Filter          := 'IDFORNE <> -1';
         cdsItemSoli.Filtered        := True;
         cdsItemSoli.IndexFieldNames := 'IDFORNE';
         cdsItemSoli.First;
         UltIDForne := -1;
         While Not cdsItemSoli.Eof Do
            Begin
               If UltIDForne <> cdsItemSoli.FieldByName('IDFORNE').AsInteger Then
                  Begin
                     cdsOC.Append;
                     cdsOC.FieldByName('NUMOC').AsFloat         := GetNextID;
                     cdsOC.FieldByName('IDFORCLI').AsFloat      := cdsItemSoli.FieldByName('IDFORNE').AsFloat;
                     cdsOC.FieldByName('IDPESSOA').AsFloat      := Fcds.FieldByName('IDPESSOA').AsFloat;
                     cdsOC.FieldByName('OCATENDIDA').AsString   := 'F';
                     cdsOC.FieldByName('FLGIMPRESSA').AsString  := 'F';
                     cdsOC.FieldByName('FLGCOMSEMOC').AsString  := 'C';
                     cdsOC.FieldByName('FLGCOMSEMCOT').AsString := 'C';
                     cdsOC.FieldByName('DATAOC').AsDateTime     := FCds.FieldByName('DATAEMISSAO').AsDateTime;

                     cdsOC.Post;
                     UltIDForne := cdsItemSoli.FieldByName('IDFORNE').AsInteger
                  End;
              //--------------------------------------------------------------------------------------------------------------------
              // Gera os Itens
              //--------------------------------------------------------------------------------------------------------------------
              cdsItemOC.Append;
              cdsItemOC.FieldByName('NUMOC').AsFloat             := cdsOC.FieldByName('NUMOC').AsFloat;
              cdsItemOC.FieldByName('IDITEMOC').AsFloat          := GetNextID;
              cdsItemOC.FieldByName('CODARTIGO').AsString        := cdsItemSoli.FieldByName('CODARTIGO').AsString;
              cdsItemOC.FieldByName('CODGRUPOPROD').AsString     := cdsItemSoli.FieldByName('CODGRUPOPROD').AsString;
              cdsItemOC.FieldByName('CODMEDIDA').AsString        := cdsItemSoli.FieldByName('CODMEDIDA').AsString;
              cdsItemOC.FieldByName('QTDEPEDIDA').AsFloat        := cdsItemSoli.FieldByName('QTDEPEDIDA').AsFloat;

              If (cdsItemSoli.FieldByName('IDPRODVARI').IsNull) Or (cdsItemSoli.FieldByName('IDPRODVARI').AsInteger <= 0) Then
                 cdsItemOC.FieldByName('IDPRODVARI').Clear
              Else
                 cdsItemOC.FieldByName('IDPRODVARI').AsInteger := cdsItemSoli.FieldByName('IDPRODVARI').AsInteger;

              cdsItemOC.FieldByName('OBSITEMOC').AsString        := cdsItemSoli.FieldByName('OBSITEMSOLIC').AsString;
              cdsItemOC.FieldByName('VALORUN').AsString          := cdsItemSoli.FieldByName('VALORUN').AsString;
              cdsItemOC.FieldByName('FLGITEMATENDIDO').AsString  := 'F';

              cdsItemOC.Post;

              iPrazo := Trunc(FCds.FieldByName('DATAENTREGA').AsDateTime - FCds.FieldByName('DATAEMISSAO').AsDateTime);
              If iPrazo <= 0 Then iPrazo := 1;
              //--------------------------------------------------------------------------------------------------------------------
              // Gera os Prazos de Pagamento e Entrega
              //--------------------------------------------------------------------------------------------------------------------
               cdsPrazoEntregaOC.Append;
               cdsPrazoEntregaOC.FieldByName('IDITEMOC').AsFloat         := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
               cdsPrazoEntregaOC.FieldByName('PARCELAENTREGA').AsInteger := 1;
               cdsPrazoEntregaOC.FieldByName('PRAZOENTREGA').AsInteger   := iPrazo;
               cdsPrazoEntregaOC.FieldByName('QTDEENTREGA').AsFloat      := cdsItemSoli.FieldByName('QTDEPEDIDA').AsFloat;
               cdsPrazoEntregaOC.FieldByName('PERIODOPRAZO').AsString    := 'D';
               cdsPrazoEntregaOC.FieldByName('DATAENTREGA').AsDateTime   := FCds.FieldByName('DATAENTREGA').AsDateTime;
               cdsPrazoEntregaOC.Post;
               //
               cdsPrazoPgtoOC.Append;
               cdsPrazoPgtoOC.FieldByName('IDITEMOC').AsFloat       := cdsItemOC.FieldByName('IDITEMOC').AsFloat;
               cdsPrazoPgtoOC.FieldByName('PARCELAPGTO').AsInteger  := 1;
               cdsPrazoPgtoOC.FieldByName('PRAZOPGTO').AsInteger    := iPrazo;
               cdsPrazoPgtoOC.FieldByName('PERIODOPRAZO').AsString  := 'D';
               cdsPrazoPgtoOC.FieldByName('PERCPAGTO').AsFloat      := 100;
               cdsPrazoPgtoOC.FieldByName('DATAPAGTO').AsDateTime   := FCds.FieldByName('DATAENTREGA').AsDateTime;
               cdsPrazoPgtoOC.Post;
              //--------------------------------------------------------------------------------------------------------------------
              // Gera os Impostos
              //--------------------------------------------------------------------------------------------------------------------
               If Not cdsItemOC.FieldByName('CODTIPRECDES').IsNull Then
                  Begin
                     _ImpostoRetido.DataProgramada    := FCds.FieldByName('DATAENTREGA').AsDateTime + iPrazo;
                     _ImpostoRetido.OperacaoDocumento := '2 ';
                     _ImpostoRetido.IdForCli          := cdsItemSoli.FieldByName('IDFORNE').AsInteger;
                     _ImpostoRetido.CodDocumento      := 0;
                     _ImpostoRetido.NumLancto         := 0;
                     _ImpostoRetido.ValorLancto       := cdsItemSoli.FieldByName('QTDEPEDIDA').AsFloat * cdsItemSoli.FieldByName('VALORUN').AsFloat;
                     _ImpostoRetido.ValorLiquido      := _ImpostoRetido.ValorLancto;
                     _ImpostoRetido.DataLancto        := FCds.FieldByName('DATAENTREGA').AsDateTime;
                     _ImpostoRetido.DataEmissao       := FCds.FieldByName('DATAENTREGA').AsDateTime;
                     _ImpostoRetido.DebCre            := 'C';
                     _ImpostoRetido.CodTipRecDes      := cdsItemOC.FieldByName('CODTIPRECDES').AsString;
                     _ImpostoRetido.MomentoLancamento := mlLancamento;
                     _ImpostoRetido.CodTipoDoc        := 0;
                     _ImpostoRetido.Incluir;
                     //
                     If Not _ImpostoRetido.CdsSimulacao.IsEmpty Then
                        Begin
                           _ImpostoRetido.CdsSimulacao.First;
                           While Not _ImpostoRetido.CdsSimulacao.EOF Do
                              Begin
                                 cdsAgregItemOC.Append;
                                 cdsAgregItemOC.FieldByName('IDITEMOC').AsFloat           := cdsItemOC.FieldByName('IDITEMOC').asFloat;
                                 cdsAgregItemOC.FieldByName('CODTIPOCUSTAGREG').AsInteger := _ImpostoRetido.CdsSimulacao.FieldByName('IDIMPOSTO').AsInteger;
                                 cdsAgregItemOC.FieldByName('ALIQUOTA').AsFloat           := _ImpostoRetido.CdsSimulacao.FieldByName('PERCIMPOSTO').AsFloat;
                                 cdsAgregItemOC.FieldByName('BASECALCULO').AsFloat        := _ImpostoRetido.CdsSimulacao.FieldByName('VALORBASE').AsFloat;
                                 cdsAgregItemOC.FieldByName('VLRAGREGITEM').AsFloat       := _ImpostoRetido.CdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat;
                                 cdsAgregItemOC.Post;

                                 _ImpostoRetido.CdsSimulacao.Next;
                              End;
                        End;
                  End;

               SQL := ' SELECT ES.CODESTADO, ES.IDPAIS '+
                      ' FROM  PESSOA P, ENDPESS E, CIDADES CI, ESTADO  ES '+
                      ' WHERE (P.IDPESSOA     = '+Fcds.FieldByName('IDPESSOA').AsString+') '+
                      '   AND (E.IDPESSOA(+)  = P.IDPESSOA) '+
                      '   AND (E.IDENDERECO(+)= P.IDENDCOMERCIAL) '+
                      '   AND (E.IDCIDADES    = CI.IDCIDADES(+)) '+
                      '   AND (ES.IDESTADO(+) = CI.IDESTADO) ';

               CdsForn.Data := GetDataPacket( SQL );

               SQL := ' SELECT CODTIPOCUSTAGREG '+
                      ' FROM IMPOSTOSXPRODUTOS  '+
                      ' WHERE  (RTRIM(CODPRODUTO) = '+QuotedStr(Trim(Copy(cdsItemSoli.FieldByName('CODARTIGO').AsString,1,6)))+' )'+
                      '    AND (IDPESSOA   = '+Fcds.FieldByName('IDPESSOA').AsString+') ';

               CdsAgregProd.Data := GetDataPacket( SQL );
               CdsAgregProd.First;
               While Not CdsAgregProd.Eof Do
                  Begin
                     SQL := ' SELECT PERCIMPOSTO,PERCBASEIMP '+
                            ' FROM IMPOSTOSXPRODUTOS '+
                            ' WHERE '+
                            '      (RTRIM(CODPRODUTO) = '+QuotedStr(Trim(Copy(cdsItemSoli.FieldByName('CODARTIGO').AsString,1,6)))+' )'+
                            '  AND (CODTIPOCUSTAGREG = '+ CdsAgregProd.FieldByName('CODTIPOCUSTAGREG').AsString +') '+
                            '  AND (CODESTADO  = '+QuotedStr(CdsForn.FieldByName('CODESTADO').AsString )+') '+
                            '  AND (IDPAIS     = '+CdsForn.FieldByName('IDPAIS').AsString +') ';

                     _Cds.Data := GetDataPacket( SQL );

                     If Not _Cds.IsEmpty Then
                        Begin
                           rBase := _Cds.FieldByName('PERCBASEIMP').asFloat;
                           rPerc := _Cds.FieldByName('PERCIMPOSTO').asFloat;
                           //
                           rBase     := (cdsItemSoli.FieldByName('QTDEPEDIDA').AsFloat * cdsItemSoli.FieldByName('VALORUN').AsFloat) *(rBase/100);
                           rValorImp := rBase*(rPerc/100);
                        End
                     Else
                        Begin
                           rBase     := 0;
                           rPerc     := 0;
                           rValorImp := 0;
                        End;
                     cdsAgregItemOC.Append;
                     cdsAgregItemOC.FieldByName('IDITEMOC').AsFloat           := cdsItemOC.FieldByName('IDITEMOC').asFloat;
                     cdsAgregItemOC.FieldByName('CODTIPOCUSTAGREG').AsInteger := CdsAgregProd.FieldByName('CODTIPOCUSTAGREG').AsInteger;
                     cdsAgregItemOC.FieldByName('ALIQUOTA').AsFloat           := rPerc;
                     cdsAgregItemOC.FieldByName('BASECALCULO').AsFloat        := rBase;
                     cdsAgregItemOC.FieldByName('VLRAGREGITEM').AsFloat       := rValorImp;
                     cdsAgregItemOC.Post;

                     CdsAgregProd.Next;
                  End;
               cdsItemSoli.Next;
            End;

         IF Not _OC.Gravar( IdUsuario ) Then
            Raise Exception.Create( _OC.MessageInfo );
      Except
         On E:Exception Do
            Begin
               Result := False;
               MessageInfo := E.Message;
            End;
      End;
   Finally
      cdsItemSoli.Free;
      cdsOC.Free;
      cdsItemOC.Free;
      cdsAgregItemOC.Free;
      cdsPrazoPgtoOC.Free;
      cdsPrazoEntregaOC.Free;
      cdsSCItemOC.Free;
      CdsForn.Free;
      CdsAgregProd.Free;
   End;
end;

function TCtrlSoliCompra.GetItem(NumSolCompra, CodCusteio: Double): OleVariant;
Var
   Sql : TStringList;
begin
   Sql := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add(' SELECT  ');
      Sql.Add('     I.NUMSOLCOMPRA,    ');
      Sql.Add('     I.IDITEMSOLI,      ');
      Sql.Add('     I.CODARTIGO,       ');
      Sql.Add('     I.IDPROCXART,      ');
      Sql.Add('     I.CODMEDIDA,       ');
      Sql.Add('     I.CODPROCESSO,     ');
      Sql.Add('     I.IDCONTRATOPROD,  ');
      Sql.Add('     I.IDPRODVARI,      ');
      Sql.Add('     I.QTDEPEDIDA,      ');
      Sql.Add('     I.SALDOACOMPRAR,   ');
      Sql.Add('     I.QTDEPENDENTE,    ');
      Sql.Add('     I.SOLICIACEITA,    ');
      Sql.Add('     I.IDCOMPRADOR,     ');
      Sql.Add('     I.OBSITEMSOLIC,    ');
      Sql.Add('     SUBSTR(DECODE(PV.IDPRODVARI,NULL,( P.DESCPROD  || '' '' || A.CODCOR || '' '' ||  A.CODTAMANHO ),PV.DESCPRODVARI),1,60) AS DESCRICAO,');
      Sql.Add('     P.CODMEDCUSTO,');
      Sql.Add('     P.CODGRUPOPROD,');      
      Sql.Add('     P.CODPRODUTO, ');
      Sql.Add('     CO.FATOR,     ');
      Sql.Add('     CF.FATOR,     ');
      Sql.Add('     (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) AS VALORUN, ');
      Sql.Add('     (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) * I.QTDEPEDIDA AS VALORTOTAL, ');
      Sql.Add('      DECODE(I.QTDEPENDENTE,0,''ATEND. TOTAL'', DECODE(I.QTDEPEDIDA - I.QTDEPENDENTE,0,''NÃO ATENDIDA'',''ATEND. PARCIAL'') )  AS  STATUS, ');
      Sql.Add('     (-1) AS IDFORNE,  ');
      Sql.Add('     (0)  AS VALORUN,  ');
      Sql.Add('     (0)  AS PRAZOPAG  ');
      Sql.Add(' FROM              ');
      Sql.Add('     ITEMSOLI I,   ');
      Sql.Add('     ARTIGO A,     ');
      Sql.Add('     PRODUTO P,    ');
      Sql.Add('     CUSTOMED C,   ');
      Sql.Add('     CONVER CO,    ');
      Sql.Add('     CONVER CF,    ');
      Sql.Add('     PRODVARI PV   ');
      Sql.Add(' WHERE  (I.NUMSOLCOMPRA   = '+ FloatToStr(NumSolCompra) +')');
      Sql.Add('    AND (I.CODARTIGO      = A.CODARTIGO)    ');
      Sql.Add('    AND (A.CODPRODUTO     = P.CODPRODUTO)   ');
      Sql.Add('    AND (C.CODARTIGO(+)   = A.CODARTIGO)    ');
      Sql.Add('    AND (C.CODCUSTEIO(+)  = '+ FloatToStr( CodCusteio ) +')');
      Sql.Add('    AND (CO.CODPRODUTO    = P.CODPRODUTO)   ');
      Sql.Add('    AND (CO.CODMEDIDA     = P.CODMEDCUSTO)  ');
      Sql.Add('    AND (CF.CODPRODUTO    = P.CODPRODUTO)   ');
      Sql.Add('    AND (CF.CODMEDIDA     = I.CODMEDIDA)    ');
      Sql.Add('    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)   ');
      Sql.Add(' ORDER BY DESCRICAO  ');

      Result := GetDataPacket(SQL.Text);
   Finally
      Sql.Free;
   End;
end;

function TCtrlSoliCompra.Gravar(  Valor, IdUsuario  : Double;
                                  Grupo  : String ) : Boolean;
Var
   Msg          : String;
   IdNumReserva : Integer;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarSoliCompra( Valor,IdUsuario,Grupo, Fcds.Data, FcdsItem.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        FrValorTotal := Valor;
        FsGrupoProd  := Grupo;
        Try
           StartTransaction;

           sGrpProduto := Grupo;
           rIdUsuario  := IdUsuario;
           //----------------------------------------------------------------------------------------------------------------------------
           // Verifica se usa o RAD
           //----------------------------------------------------------------------------------------------------------------------------

          if (Sistema.UsaRAD) then
          begin
            if (Sistema.VersaoRAD = '+') then
               RADPlus.TipoProcesso := RADPlus.RecuperaTipoProcesso(3, Sistema.idEmpresa)
            else
               _RAD.TipoProcesso := _RAD.GetTipoProcesso( 3 , FCds.FieldByName('IDPESSOA').AsInteger ); // É fixa a referência
          end;
           //
           Result := ApplyCds(Fcds,_DbSoliComp,[],[] );
           Msg    := _DbSoliComp.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           //---------------------------------------------------------------------------------------------------------
           // Caso seja alteração excluir a reserva antiga
           //---------------------------------------------------------------------------------------------------------
           If  Not FCds.FieldByName('IDRESERVAOLD').IsNull Then
              Begin
                 IdNumReserva := _Orcamento.BuscaIdNumReserva(FCds.FieldByName('IDRESERVAOLD').AsInteger,0,True);

                 Result := _Orcamento.EstornaReserva(IdNumReserva,True) = 0;
                 Msg    := _Orcamento.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
              End;
           //----------------------------------------------------------------------------------------------------------
           // Marca a reservaorcamentária como utilizada
           //----------------------------------------------------------------------------------------------------------
           If Not FCds.FieldByName('IDRESERVAORCAMEN').IsNull Then
              Begin
                 IdNumReserva := _Orcamento.BuscaIdNumReserva(FCds.FieldByName('IDRESERVAORCAMEN').AsInteger,0,True);

                 Result := _Orcamento.MarcaReserva(IdNumReserva,True) = 0;
                 Msg    := _Orcamento.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
              End;

           // itens Filhos
           Result := ApplyCds(FcdsItem,_DbItemSoli,[_DbSoliComp.NumSolCompra],[_DbItemSoli.NumSolCompra] );
           Msg    := _DbItemSoli.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           If Not GerarOCAuto( IdUsuario ) Then
              Raise Exception.Create( MessageInfo );

           Commit;

           MessageInfo :=  'SCI Nº '+ _DbSoliComp.NumSolCompra.AsString;
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

function TCtrlSoliCompra.ListAcompSCI(IdPessoa: Integer;
  NumSCI: Double; Status: TStatusSCI; CodCentroCusto: String;
  CodAlmoxarifado: Integer; CodGrupoProd, CodArtigo: String;
  IdUsuario: Double; DataEmisIni, DataEmisFim, DataNecIni, DataNecFim: TDateTime): OleVariant;
Var
  SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
          Sql.Clear;
          Sql.Add(' SELECT DISTINCT                                                  ');
          Sql.Add('       SC.NUMSOLCOMPRA,                                           ');
          Sql.Add('       DECODE(CUSTOESTOQUE,''C'',CC.NOME,A.DESCALMOX) AS DESTINO, ');
          Sql.Add('       SC.DATAENTREGA,                                            ');
          Sql.Add('       SC.DATAEMISSAO,                                            ');
          Sql.Add('       U.NOMEUSUARIO ');
          Sql.Add(' FROM             ');
          Sql.Add('    ITEMSOLI IT,  ');
          Sql.Add('    SOLICOMP SC, ');
          Sql.Add('    ALMOX A,     ');


    If (Trim(CodGrupoProd) <> '') Then
       Begin
          Sql.Add('    PRODUTO P, ');
          Sql.Add('    ARTIGO A, ');
       End;


          Sql.Add('    CENTCUST CC,       ');
          Sql.Add('    USUARIOSISTEMA U   ');
          Sql.Add(' WHERE  (SC.IDPESSOA = '+IntToStr(IdPessoa)+') ');
          Sql.Add('    AND (SC.NUMSOLCOMPRA = IT.NUMSOLCOMPRA) ');
          Sql.Add('    AND (SC.CODALMOXARIFADO = A.CODALMOXARIFADO)                 ');
          Sql.Add('    AND (SC.CODCENTROCUSTO = CC.CODCENTROCUSTO)                   ');
          Sql.Add('    AND (SC.IDEMPRESA = CC.IDEMPRESA)                             ');
          Sql.Add('    AND (TO_NUMBER(RTRIM(SUBSTR(SC.TRGUSERINCLUSAO,3,30))) = U.IDUSUARIO )');

//========================================================================================================================
//  Filtros
//========================================================================================================================
      Case Status Of
         ssAtendParcial : Sql.Add(' AND (IT.QTDEPEDIDA - IT.QTDEPENDENTE > 0 )');
         ssAtendTotal   : Sql.Add(' AND (IT.QTDEPEDIDA - IT.QTDEPENDENTE = IT.QTDEPEDIDA)');
         ssPendentes    : Sql.Add(' AND (IT.QTDEPEDIDA - IT.QTDEPENDENTE = 0 )');
      End;

     If NumSCI <> 0 Then
        Sql.Add('    AND (SC.NUMSOLCOMPRA = '+FloatToStr(NumSCI) +')  ');

     If Trim(CodCentroCusto) <> '' Then
        Sql.Add('    AND (RTRIM(SC.CODCENTROCUSTO) = '+QuotedStr(Trim(CodCentroCusto))+')           ');

     If CodAlmoxarifado <> 0 Then
        Sql.Add('    AND (SC.CODALMOXARIFADO = '+FloatToStr(CodAlmoxarifado)+') ');

     If DataEmisIni <> 0  Then
        Sql.Add('    AND (SC.DATAEMISSAO >= TO_DATE('''+DateToStr(DataEmisIni)+''',''DD/MM/YYYY'')) ');

     If DataEmisFim <> 0 Then
        Sql.Add('    AND (SC.DATAEMISSAO <= TO_DATE('''+DateToStr(DataEmisFim)+''',''DD/MM/YYYY'')) ');

     If DataNecIni <> 0 Then
        Sql.Add('    AND (SC.DATAENTREGA >= TO_DATE('''+DateToStr(DataNecIni)+''',''DD/MM/YYYY'')) ');

     If DataNecFim <> 0 Then
        Sql.Add('    AND (SC.DATAENTREGA <= TO_DATE('''+DateToStr(DataNecFim)+''',''DD/MM/YYYY'')) ');

     If Trim(CodArtigo) <> '' Then
        Sql.Add('   AND (RTRIM(IT.CODARTIGO) = '+QuotedStr(CodArtigo)+') ');

     If Trim(CodGrupoProd) <> '' Then
       Begin
          Sql.Add('   AND (RTRIM(P.CODGRUPOPROD) = '+QuotedStr(Trim(CodGrupoProd))+') ');
          Sql.Add('   AND (P.CODPRODUTO = A.CODPRODUTO ) ');
          Sql.Add('   AND (A.CODARTIGO = IT.CODARTIGO ) ');
       End;

     If IdUsuario <> 0 Then
        Sql.Add('   AND (SC.TRGUSERINCLUSAO = '+QuotedStr('CM'+FloatToStr(IdUsuario))+' )');

     Sql.Add(' ORDER BY NUMSOLCOMPRA ');



     Result := GetDataPacket(SQL.Text);

   Finally
     SQL.Free;
   End;
end;

function TCtrlSoliCompra.ListItemSolixOC(IdItemSoli : Double): OleVariant;
Var
  SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add('SELECT                   ');
      Sql.Add('       IO.NUMOC,         ');
      Sql.Add('       IO.CODMEDIDA,     ');
      Sql.Add('       IO.QTDEPEDIDA,    ');
      Sql.Add('       IO.QTDERECEBIDA,  ');
      Sql.Add('       IO.VALORUN        ');
      Sql.Add('FROM                     ');
      Sql.Add('     SCITEMOC SI,        ');
      Sql.Add('     ITEMOC IO           ');
      Sql.Add('WHERE                    ');
      Sql.Add('                         ');
      Sql.Add('       (IDITEMSOLI  = '+FloatToStr(IdItemSoli)+' ) ');
      Sql.Add('   AND (SI.IDITEMOC = IO.IDITEMOC) ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;

end;

function TCtrlSoliCompra.ListItemSolixReceb(IdItemSoli: Double): OleVariant;
Var
  SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add('SELECT                   ');
      Sql.Add('     TO_CHAR(NF.NUMNF) ||''/''|| COMPLNF AS NUMNF, ');
      Sql.Add('     PE.RAZAOSOCIAL,             ');
      Sql.Add('     NF.DATAENTDEVOL,            ');
      Sql.Add('     IT.QTDERECEBDEVOL AS QTDE,  ');
      Sql.Add('     IT.VLRUNITARIO,             ');
      Sql.Add('     DECODE(FLGDESTINO,''A'',''ATIVO FIXO'',''C'',''CUSTO'',''E'',''ESTOQUE'') AS DESTINO ');
      Sql.Add('FROM                   ');
      Sql.Add('    PESSOA PE,         ');
      Sql.Add('    ITENSRECEBDEVOL IT, ');
      Sql.Add('    NFRECEBDEVOL NF,   ');
      Sql.Add('    SOLIBAIXADAS SB    ');
      Sql.Add('WHERE                  ');
      Sql.Add('     (SB.IDITEMSOLI = '+FloatToStr(IdItemSoli)+' ) ');
      Sql.Add(' AND (SB.IDITENSRECDEV = IT.IDITENSRECDEV)   ');
      Sql.Add(' AND (NF.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL) ');
      Sql.Add(' AND (NF.IDFORCLI = PE.IDPESSOA) ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;


end;

function TCtrlSoliCompra.ListNumSoliSemComprador(VerifRAD : Boolean ;IdComprador : Double ): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT '+
          '      SC.NUMSOLCOMPRA '+
          ' FROM                 '+
          '       SOLICOMP SC,   '+
          '       ITEMSOLI IT,   '+
          '       RADINSTPROCESSO RP '+
          ' WHERE (1=1)          '+
          '   AND (IT.QTDEPENDENTE > 0    ) '+
          '   AND (IT.CODPROCESSO IS NULL) '+
          '   AND (RP.IDPROCESSO(+)= SC.IDPROCESSO) ' +

          '   AND (SC.NUMSOLCOMPRA = IT.NUMSOLCOMPRA) '+
          '   AND (SC.NUMSOLCOMPRA NOT IN (SELECT SCITEMOC.NUMSOLCOMPRA '+
          '                 FROM SCITEMOC,                              '+
          '                      ITEMOC,                                '+
          '                      OC                                     '+
          '                  WHERE SCITEMOC.NUMSOLCOMPRA = SC.NUMSOLCOMPRA '+
          '                     AND OC.NUMOC = ITEMOC.NUMOC '+
          '                     AND IT.IDITEMSOLI = SCITEMOC.IDITEMSOLI '+
          '                     AND OC.FLGCOMSEMCOT = ''S''             '+
          '                         ))                                  ';

   if VerifRad then
     SQL := SQL + '   AND ((SC.IDPROCESSO IS NULL) OR ((RP.FLGOK = ''S'') AND (SC.IDPROCESSO IS NOT NULL))) ';

   If IdComprador <> 0 Then
      SQL :=  SQL + '   AND  (IT.IDCOMPRADOR = '+FloatToStr( IdComprador )+') '
   Else
      SQL :=  SQL + '   AND  (IT.IDCOMPRADOR IS NULL ) ';

   SQL := SQL + ' GROUP BY SC.NUMSOLCOMPRA '+
                ' ORDER BY SC.NUMSOLCOMPRA ';

   Result := GetDataPacket( SQL );
end;

function TCtrlSoliCompra.ListSoliCompra(VerifRAD : Boolean;NumSolCompra: Double;
  IdPessoa: Integer; CodArtigo, CodGrupoProd: String; IdComprador : Double; DataNecessidade : Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
     SQL.Add(' SELECT                 ');
     SQL.Add('      IT.NUMSOLCOMPRA,  ');
     SQL.Add('      IT.CODARTIGO,     ');
     SQL.Add('      IT.CODMEDIDA,     ');
     SQL.Add('      IT.QTDEPEDIDA,    ');
     SQL.Add('      SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO, ');
     SQL.Add('      IT.IDITEMSOLI,                                                      ');
     SQL.Add('      P.CODGRUPOPROD,                                                     ');
     SQL.Add('      P.CODMEDCUSTO,                                                      ');
     SQL.Add('      SC.DATAENTREGA AS NECESSIDADE,                                      ');

     SQL.Add('      (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) AS VALORUNIT,                      ');
     SQL.Add('      (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) * IT.QTDEPEDIDA AS VALORTOTAL,     ');

     SQL.Add('      IT.IDPRODVARI ');
     SQL.Add(' FROM               ');
     SQL.Add('     ITEMSOLI IT,   ');
     SQL.Add('     SOLICOMP SC,   ');
     SQL.Add('     PRODUTO P,     ');
     SQL.Add('     ARTIGO A,      ');
     SQL.Add('     PRODVARI PV,   ');

     SQL.Add('     CUSTOMED C,    ');
     SQL.Add('     CONVER CO,     ');
     SQL.Add('     CONVER CF,     ');

     SQL.Add('     RADINSTPROCESSO RP ');
     SQL.Add(' WHERE (1=1)        ');
     SQL.Add('   AND (IT.QTDEPENDENTE > 0    ) ');
     SQL.Add('   AND (IT.CODPROCESSO IS NULL ) ');
     SQL.Add('   AND (RP.IDPROCESSO(+)= SC.IDPROCESSO) ');

     SQL.Add('   AND (A.CODARTIGO      = C.CODARTIGO(+)) ');
     SQL.Add('   AND (P.CODPRODUTO     = CO.CODPRODUTO) ');
     SQL.Add('   AND (P.CODMEDCUSTO    = CO.CODMEDIDA) ');
     SQL.Add('   AND (P.CODPRODUTO     = CF.CODPRODUTO) ');
     SQL.Add('   AND (IT.CODMEDIDA     = CF.CODMEDIDA) ');

      If IdComprador <> 0 Then
         SQL.Add('   AND (IT.IDCOMPRADOR = '+FloatToStr(IdComprador)+' ) ')
      Else
         SQL.Add('   AND (IT.IDCOMPRADOR IS NULL ) ');

      If NumSolCompra  <> 0 Then
         SQL.Add('   AND (IT.NUMSOLCOMPRA = '+FloatToStr(NumSolCompra)+')');

      If Trim(CodArtigo) <> '' Then
         SQL.Add('   AND (IT.CODARTIGO = '+QuotedStr( CodArtigo )+')')
      Else
      If Trim(CodGrupoProd) <> '' Then
         SQL.Add('   AND (RTRIM(P.CODGRUPOPROD) = '+QuotedStr(Trim(CodGrupoProd))+') ');

      If IdPessoa <> 0 Then
         SQL.Add('   AND (SC.IDPESSOA = '+IntToStr( IdPessoa )+')');

      If DataNecessidade <> 0 then
         SQL.Add('   AND (SC.DATAENTREGA = TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',DataNecessidade))+',''DD/MM/YYYY'') )');

      if VerifRad then
         SQL.Add('   AND ((SC.IDPROCESSO IS NULL) OR ((RP.FLGOK = ''S'') AND (SC.IDPROCESSO IS NOT NULL))) ');

      SQL.Add('  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)');
      SQL.Add('  AND (IT.CODARTIGO = A.CODARTIGO)       ');
      SQL.Add('  AND (A.CODPRODUTO = P.CODPRODUTO)      ');
      SQL.Add('  AND (IT.IDPRODVARI = PV.IDPRODVARI(+)) ');

      { Neste ponto verifico se há alguma OC associada a solicitação de compras.
        Se houver, verifico os artigos da solicitação que foram associado há OC. }
      if ( SolicitacaoTemOCVinculada(NumSolCompra) ) then
      begin
         sql.add(' AND (IT.CODARTIGO NOT IN (SELECT IT.CODARTIGO ');
         sql.add('                           FROM SOLICOMP SC,   ');
         sql.add('                                ITEMSOLI IT,   ');
         sql.add('                                SCITEMOC SOC,  ');
         sql.add('                                ITEMOC IOC,    ');
         sql.add('                                OC             ');
         sql.add('                           WHERE SC.NUMSOLCOMPRA = ' + FloatToStr(NumSolCompra));
         sql.add('                             AND SC.NUMSOLCOMPRA = IT.NUMSOLCOMPRA ');
         sql.add('                             AND IT.IDITEMSOLI = SOC.IDITEMSOLI    ');
         sql.add('                             AND IOC.NUMOC = OC.NUMOC              ');
         sql.add('                             AND IOC.CODARTIGO = IT.CODARTIGO      ');
         sql.add('                             AND SOC.IDITEMSOLI IS NOT NULL        ');
         sql.add('                             AND IOC.IDITEMOC = SOC.IDITEMOC       ');
         sql.add('                          )                                        ');
         sql.add('     )                                                             ');
      end;

      SQL.Add('  ORDER BY  DESCRICAO ');

      Result := GetDataPacket( SQL.Text );
   Finally
      SQL.Free;
   End;
end;

procedure TCtrlSoliCompra.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
Begin
  inherited;

  if (sTableName = 'ITEMSOLI')  then
  begin
    if (Sistema.UsaRAD) then
    begin
       if (Sistema.VersaoRAD = '+') then
       begin
          if (RADPlus.TipoProcesso > 0) then
          begin
             if (sGrpProduto <> '') then
             begin
                //mesma necessidade encontrada na uCtrlReqMat (verificação do grau de produto)
             end;
          end;
       end
       else
       begin
          if (_RAD.TipoProcesso > 0) then
          begin
             if (sGrpProduto <> '') then
             begin
                if (not _RAD.VerifGrauGrupoProd( _DbSoliComp.IdPessoa.AsInteger,
                                                   _RAD.TipoProcesso,
                                                   sGrpProduto,
                                                   aCds.FieldByName('CODGRUPOPROD').AsString)) then
                     Raise Exception.Create( _RAD.MessageInfo );
             end;
          end;
       end;
    end;
  end;
end;

procedure TCtrlSoliCompra.OnCreateAppServer;
begin
  inherited;
  FCds     := TClientDataSet.Create(nil);
  FCdsItem := TClientDataSet.Create(nil);
end;

function TCtrlSoliCompra.PodeExcluir(NumSolCompra: Double): Boolean;
Var
   SQL : String;
begin
   Result := True;

    SQL := ' SELECT NUMSOLCOMPRA  FROM SCITEMOC'+
           ' WHERE (NUMSOLCOMPRA = ' +FloatToStr(NumSolCompra)+' )';

    _Cds.Data := GetDataPacket(SQL);
    If Not _Cds.IsEmpty Then
       Begin
          Result      := False;
          MessageInfo := MSG_JA_EM_OC;
       End;

   _Cds.Data := GetItem(NumSolCompra,0);
   _Cds.First;
   While Not _Cds.Eof Do
      Begin
         If (Format('%17.2f',[_Cds.FieldByName('SALDOACOMPRAR').AsFloat])
             <> Format('%17.2f',[_Cds.FieldByName('QTDEPEDIDA').AsFloat]))
             And (_Cds.FieldByName('IDCONTRATOPROD').IsNull)
         Then
            Begin
               Result      := False;
               MessageInfo := MSG_JA_EXIST_COMPRA;
               Break;
            End;
         _Cds.Next;
      End;
   If Result Then
      Begin
          SQL := ' SELECT NUMSOLCOMPRA  FROM ITEMSOLI '+
                 ' WHERE (CODPROCESSO IS NOT NULL)'+
                 '  AND (NUMSOLCOMPRA = ' +FloatToStr(NumSolCompra)+' )';

          _Cds.Data := GetDataPacket(SQL);
          If Not _Cds.IsEmpty Then
             Begin
                Result      := False;
                MessageInfo := MSG_JA_EM_PROCESSOCOMPRA;
             End
          Else
             Begin
                SQL :=  ' SELECT  A.IDITEMOC, A.IDITEMSOLI, B.QTDERECEBIDA, B.NUMOC '+
                        ' FROM SCITEMOC A, ITEMOC B   '+
                        ' WHERE ( A.NUMSOLCOMPRA = '+ FloatToStr(NumSolCompra) + ')'+
                        '   AND ( A.IDITEMOC = B.IDITEMOC ) '+
                        ' ORDER BY B.NUMOC ';

                _Cds.Data := GetDataPacket(SQL);
                If Not _Cds.IsEmpty Then
                   Begin
                      Result      := False;
                      MessageInfo := MSG_JA_RECEBIDO_MERC;
                   End
             End;
      End;

end;

function TCtrlSoliCompra.PossuiItemEmCotacao( NumSolCompra: Double): Boolean;
Var
   SQL : String;
begin
    SQL := ' SELECT SUM(NVL(IDCOMPRADOR,0)) AS IDCOMPRADOR  FROM ITEMSOLI WHERE (NUMSOLCOMPRA = '+FloatToStr(NumSolCompra)+') ';

    _cds.Data := GetDataPacket( SQL );

    Result := _cds.FieldByName('IDCOMPRADOR').AsInteger > 0;
end;

Function TCtrlSoliCompra.Procurar( NumSolCompra : Double ) : OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT  NUMSOLCOMPRA ,IDPESSOA,NUMREQUISICAO,IDPROCESSO,IDRESERVAORCAMEN,CODALMOXARIFADO, '+
          '  UNIDNEGOC ,CODCENTRORESPON,DATAENTREGA,IDEMPRESA,CODCENTROCUSTO,ALGUMPARAESTOQUE, '+
          '  DATAEMISSAO , SOLICIATENDIDA ,SOLICIACEITA,CUSTOESTOQUE,IMPRESSO,FLGPREPRONTA, '+
          '  (0) AS SCIVALTOT, IDRESERVAORCAMEN AS IDRESERVAOLD '+
          ' FROM SOLICOMP '+
          ' WHERE (NUMSOLCOMPRA = '+ FloatToStr(NumSolCompra)+ ')';

    Result := GetDataPacket(SQL);
end;

procedure TCtrlSoliCompra.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlSoliCompra.SetcdsItem(const Value: TClientDataSet);
begin
  FcdsItem := Value;
end;

procedure TCtrlSoliCompra.SetrValorTotal(const Value: double);
begin
  FrValorTotal := Value;
end;

procedure TCtrlSoliCompra.SetsGrupoProd(const Value: String);
begin
  FsGrupoProd := Value;
end;

function TCtrlSoliCompra.SolicitacaoTemOCVinculada(
  ANumSolCompra: double): boolean;
var
  sql: String;
  _cdsOcVinculada: TClientDataSet;
begin
  try
     Result := False;

     _cdsOcVinculada := TClientDataSet.Create(nil);

     sql :=
       'select oc.numoc,        ' +
       '       sc.numsolcompra  ' +
       'from oc,                ' +
       '     solicomp sc,       ' +
       '     scitemoc soc,      ' +
       '     itemsoli it,       ' +
       '     itemoc ioc         ' +
       'where sc.numsolcompra = ' + FloatToStr(ANumSolCompra) +
       '  and soc.numsolcompra = sc.numsolcompra            ' +
       '  and soc.iditemsoli = it.iditemsoli                ' +
       '  and soc.iditemoc = ioc.iditemoc                   ' +
       '  and ioc.numoc = oc.numoc                          ' +
       '  and it.numsolcompra = sc.numsolcompra             ' ;

       _cdsOcVinculada.Data := GetDataPacket(sql);

       //Existe associação da solicitação de compras com pelo menos uma OC.
       Result := ( _cdsOcVinculada.RecordCount > 0 );

  finally
     FreeAndNil(_cdsOcVinculada);
  end;


end;

function TCtrlSoliCompra.VerifReservaxArtigo(IdReseva : Double;
  CodArtigo: String): Boolean;
Var
   SQL : String;
begin
   CodArtigo := CodArtigo + '                         ';

   SQL := ' SELECT C.CODTIPRECDES, C.RECPAG '+
          ' FROM COMPCONTASORCAMEN C, RESERVAORCAMEN R, GRUPPROD G, PRODUTO P '+
          ' WHERE (R.IDRESERVAORCAMEN = '+FloatToStr(IdReseva )+') AND '+
          '       (R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND '+
          '       (R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND '+
          '       (C.CODTIPRECDES   = G.CODTIPRECDES)   AND '+
          '       (C.RECPAG         = G.RECPAG)         AND '+
          '       (C.IDPESSOA       = G.IDPESSOA)       AND '+
          '       (G.CODGRUPOPROD   = P.CODGRUPOPROD)   AND '+
          '       (RTRIM(P.CODPRODUTO) = '+QuotedStr(Trim(Copy(CodArtigo,1,6)))+')';

   _Cds.Data := GetDataPacket(SQL);

   Result :=  Not _Cds.IsEmpty;
end;

end.



