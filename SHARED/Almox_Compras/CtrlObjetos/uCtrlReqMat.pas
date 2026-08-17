{-------------------------------------------------------------------------------
Data        : 20.09.2007
Autor       : Antonio Marcos Fernandes de Souza (amf)
Pendência   : 26385
Descrição   : permitir gravar a requisição quando não há tipo de processo definido no RAD, estando o RAD "ligado"
---------------------------------------------------------------------------------
Data        : 04.12.2006
Autor       : Antonio Marcos Fernandes de Souza (amf)
Pendência   : 23860
Descrição   : Implementação RAD+
---------------------------------------------------------------------------------
 Data       : 15.08.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22576
 Descrição  : Alteração no SQL que retorna as requisições. Acrescentei mais um DECODE no teste.
              rotina: Function ListReqCad
----------------------------------------------------------------------------------}

unit uCtrlReqMat;

Interface

Uses DB, Classes, uDataBase,uCmDbObject, uCmControlObject,
     uMidasUtil, sysUtils, dbclient, uSistema,uCmTypes,
     uDbReqMat, uDbItemPedi, DAlmoxarifado, uCtrlMovEstoque,
     uDbItemEntr, uCtrlAlmox, uCtrlRAD, uCtrlRADPlus,
     uCtrlAlmoxCompra;

Const
   MSG_NUM_REQ = 'Requisição Nº ';

Type
  TStatusReq      = (srTodas, srPendentes, srAtendTotal, srAtendParcial );
  TTipoRequisicao = (trTransferencia, trCusto);

  TCtrlReqMat = class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
    procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean);  Override;
    procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;

  private
    FlgTestaGrau: boolean;
    sGrpProduto  : String;
   //-------------------------------------------------------------------------
   // Classes de Persistência
   //-------------------------------------------------------------------------
    _DbReqMat   : TDbReqMat;
    _DbItemPedi : TDbItemPedi;
    _DbItemEntr : TDbItemEntr;
    _DtmAlmox   : TDtmAlmoxarifado;
    _MovEstoque : TCtrlMovEstoque;
    _Almox      : TCtrlAlmox;
    _RAD        : TCtrlRAD;

    RADplus     : TCtrlRADPlus;

    Fcds: TClientDataSet;
    FcdsItem: TClientDataSet;
    FrValorTotal: double;
    FsGrupoProd: String;
    AlmoxCompras: TCtrlAlmoxCompra;

    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsItem(const Value: TClientDataSet);

    Function  ExecutaMovimentacao( TipoRequisicao     : TTipoRequisicao;
                                   IdPessoa           : Integer;
                                   Valor              : Double;
                                   Qtde               : Double;
                                   CodCusteio         : LongInt;
                                   CodAlmoxOrigem     : longint;
                                   CodArtigo          : String;
                                   CodTipoMov         : String;
                                   CodMedida          : String;
                                   Data               : TDateTime;
                                   NumDocumento       : String;
                                   CentroCustoOrigem  : String;
                                   UnidNegoc          : longint;
                                   CodAlmoxTransf     : longint = 0;
                                   CodCusteioDestino  : longint = 0;
                                   CentroCustoDestino : String = '';
                                   CodTipoMovEnt      : String = '') : Boolean;
    procedure SetrValorTotal(const Value: double);
    procedure SetsGrupoProd(const Value: String);

  Public
    Property cds     : TClientDataSet read Fcds write Setcds;
    Property cdsItem : TClientDataSet read FcdsItem write SetcdsItem;
    Property rValorTotal : double read FrValorTotal write SetrValorTotal;
    Property sGrupoProd  : String read FsGrupoProd write SetsGrupoProd;

    constructor Create;  Override;
    Destructor  Destroy; Override;
   //-------------------------------------------------------------------------
   // Metodos da Regra de Negócio
   //-------------------------------------------------------------------------
    {**
       Grava as Requisições de Material
    **}
    Function Gravar(  Valor  : Double;
                      Grupo  : String ) : Boolean;
    {**
       Apaga as Requisições de Material
    **}
    Function Excluir : Boolean;
    {**
       Busca as Requisições de Material existentes.
    **}
    Function GetReqMat( NumRequisicao : Double ) : OleVariant;
    {**
       Busca os itens das Requisições de Material
    **}
    Function GetItemReqMat( NumRequisicao : Double ) : OleVariant;
    {**
       Gera uma lista de Requisições de Material existentes comforme
       os filtros.
    **}
    Function ListReqCad( IdPessoa        : Integer;
                         IDProcesso      : Double;
                         NumRequisicao   : Double;
                         Status          : TStatusReq;
                         CodCentroCusto  : String;
                         CodAlmoxarifado : Integer;
                         CodGrupoProd    : String;
                         CodArtigo       : String;
                         IdUsuario       : Double;
                         DataReqIni      : TDateTime;
                         DataReqFim      : TDateTime;
                         DataNecIni      : TDateTime;
                         DataNecFim      : TDateTime;
                         DataAtendIni    : TDateTime;
                         DataAtendFim    : TDateTime ) : OleVariant;
    {**
       Busca os atendimentos realizazdos para o determinado itens
       das Requisições de Material
    **}
    Function GetAtendimentoItem( NumRequisicao : Double;
                                 CodArtigo     : String ) : OleVariant;
    {**
       Verifica se a requisição já foi entregue
    **}
    Function RequisicaoJaEntregue( NumRequisicao : Double ) : Boolean;
    {**
      Gera uma lista de Requsições feita para um determinado produto
    **}
    Function ListOutrasRequisicoes( IdPessoa        : Integer;
                                    CodArtigo       : String;
                                    CodAlmoxarifado : Integer;
                                    NumRequisicao   : Double = 0) : OleVariant;
    {**
      Gera uma lista com os items das  Requsições
      pendente de atendimento
    **}
    Function ListItemAntendimento( IdPessoa        : Integer;
                                   CodAlmoxarifado : Integer;
                                   CodCentroCusto  : String = '';
                                   NumRequisicao   : Double    = 0;
                                   DataEmissao     : TDateTime = 0;
                                   DataNecessidade : TDateTime = 0) : OleVariant;
    {**
       Função responsável pelo atendimento da requisição de materia
    **}
    Function AtenderReqCad( IdPessoa           : Integer;
                            QtdeAtendida       : Double;
                            DataAtendimento    : TDateTime;
                            IdAtendente        : Double;
                            DeixaRestoPendente : Boolean) : Boolean;
    {**
       Exclui logicamento o item da requisição de material
     **}
    Function EstornarReqCad  : Boolean;
    {**
       Efetua a confirmação do Atendimento da requisição de mercadoria.
    **}
    Function ConfirmaAtendimento( IdItemEntrega : Double;
                                  IdUsuario     : Double;
                                  Data          : TDateTime ) : Boolean;
    {**
       Efetua a devolução do Atendimento da requisição de mercadoria.
    **}
    Function DevolveAtendimento( IdPessoa  : Integer;
                                 IdUsuario : Double;
                                 Data      : TDateTime ) : Boolean;
  {**
     Gera uma lista com os items das  Requsições
     pendentes de confirmação/devolução de atendimento
   **}
  Function ListItemConfAtend ( IdPessoa        : Integer;
                               CodAlmoxarifado : Integer;
                               CodCentroCusto  : String = '';
                               NumRequisicao   : Double    = 0;
                               DataEmissao     : TDateTime = 0;
                               DataNecessidade : TDateTime = 0) : OleVariant;

  End;
implementation

{ TCtrlReqMat }

constructor TCtrlReqMat.Create;
begin
  inherited;
  _DbReqMat   := TDbReqMat.Create(Self);
  _DbItemPedi := TDbItemPedi.Create(Self);
  _DbItemEntr := TDbItemEntr.Create(Self);
  _DtmAlmox   := TDtmAlmoxarifado.Create(nil);
  _MovEstoque := TCtrlMovEstoque.Create;
  _Almox      := TCtrlAlmox.Create;
  _RAD        := TCtrlRAD.Create;

  RADPlus          := TCtrlRADPlus.Create;
  AlmoxCompras     := TCtrlAlmoxCompra.Create;
end;

destructor TCtrlReqMat.Destroy;
begin
  If IsAppServer Then
     FreeCds([Fcds,FcdsItem]);
   _DbReqMat.Free;
   _DbItemPedi.Free;
   _DbItemEntr.Free;
   _DtmAlmox.Free;
   _MovEstoque.Free;
   _Almox.Free;
   _RAD.Free;

   FreeAndNil(RADPlus);
   FreeAndNil(AlmoxCompras);

  inherited;
end;

procedure TCtrlReqMat.DoChangeDataBase;
begin
  inherited;
  _DbReqMat.DataBaseName   := DataBaseName;
  _DbItemPedi.DataBaseName := DataBaseName;
  _DbItemEntr.DataBaseName := DataBaseName;
end;

function TCtrlReqMat.Excluir: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirReqMat( Fcds.Data, FcdsItem.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FcdsItem,_DbItemPedi,[],[] );
           Msg    := _DbItemPedi.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Pai
           Result := ApplyCds(Fcds,_DbReqMat,[],[] );
           Msg    := _DbReqMat.MessageInfo;
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

function TCtrlReqMat.GetItemReqMat(NumRequisicao: Double): OleVariant;
begin
  With _DtmAlmox Do
     Begin
        spGetItem.Prepare;
        spGetItem.ParamByName('NUMREQUISICAO').AsFloat := NumRequisicao;
        Result := spGetItem.Data;
     End;
end;

function TCtrlReqMat.Gravar(Valor  : Double;
                            Grupo  : String ): Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarReqMat( Valor,Grupo, Fcds.Data, FcdsItem.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        FrValorTotal := Valor;
        FsGrupoProd  := Grupo;
        Try
           StartTransaction;

           sGrpProduto := '';


           // Pai
           Result := ApplyCds(Fcds,_DbReqMat,[],[] );
           Msg    := _DbReqMat.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // itens Filhos
           Result := ApplyCds(FcdsItem,_DbItemPedi,[_DbReqMat.NumRequisicao],[_DbItemPedi.NumRequisicao],True);
           Msg    := _DbItemPedi.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;

           MessageInfo := MSG_NUM_REQ + _DbReqMat.NumRequisicao.AsString;

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

procedure TCtrlReqMat.OnCreateAppServer;
begin
  inherited;
  Fcds     := TClientDataSet.Create(nil);
  FcdsItem := TClientDataSet.Create(nil);
end;

function TCtrlReqMat.GetReqMat(NumRequisicao: Double): OleVariant;
begin
   With _DtmAlmox Do
     Begin
        spListReqMat.Prepare;
        spListReqMat.ParamByName('NUMREQUISICAO').AsFloat := NumRequisicao;
        Result := spListReqMat.Data;
     End;
end;

procedure TCtrlReqMat.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlReqMat.SetcdsItem(const Value: TClientDataSet);
begin
  FcdsItem := Value;
end;

function TCtrlReqMat.ListReqCad(IdPessoa: Integer; IDProcesso,
  NumRequisicao: Double; Status: TStatusReq; CodCentroCusto: String;
  CodAlmoxarifado: Integer; CodGrupoProd, CodArtigo: String;
  IdUsuario: Double; DataReqIni, DataReqFim, DataNecIni, DataNecFim,
  DataAtendIni, DataAtendFim: TDateTime): OleVariant;
Var
  SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
          Sql.Clear;
          Sql.Add(' SELECT DISTINCT                                                  ');
          Sql.Add('       RQ.NUMREQUISICAO,                                          ');
          Sql.Add('       AO.DESCALMOX AS ORIGEM,                                    ');
          Sql.Add('       DECODE(CUSTOTRANSF,''T'',AD.DESCALMOX,CC.NOME) AS DESTINO, ');
          Sql.Add('       RQ.DATAEMISSAO,                                            ');
          Sql.Add('       RQ.DATANECESSIDADE,                                        ');

          Sql.Add('       DECODE(RQ.REQATENDIDA,''F'',''PENDENTE'', DECODE(RQ.REQATENDIDA,''T'',''ANTED. TOTAL'', DECODE(RQ.REQATENDIDA,''P'',''ANTED. PARCIAL'')))  AS  STATUS, ');

          Sql.Add('       U.NOMEUSUARIO ');
          Sql.Add(' FROM             ');
          Sql.Add('    REQMAT RQ,    ');
          Sql.Add('    ALMOX AO,     ');
          Sql.Add('    ALMOX AD,     ');
    If ( Trim(CodArtigo) <> '') Then
          Sql.Add('    ITEMPEDI IP, ');

    If (Trim(CodGrupoProd) <> '') Then
       Begin
          Sql.Add('    ITEMPEDI IP, ');
          Sql.Add('    PRODUTO P, ');
          Sql.Add('    ARTIGO A, ');
       End;
   If ( DataAtendIni <> 0 ) or (DataAtendFim <> 0) Then
          Sql.Add('    ITEMENTR IE, ');

          Sql.Add('    CENTCUST CC,       ');
          Sql.Add('    USUARIOSISTEMA U   ');
          Sql.Add(' WHERE  (RQ.IDPESSOA = '+IntToStr(IdPessoa)+') ');
          Sql.Add('    AND (RQ.CODALMOXAORIGEM = AO.CODALMOXARIFADO)                 ');
          Sql.Add('    AND (RQ.CODALMOXADESTINO = AD.CODALMOXARIFADO(+))             ');
          Sql.Add('    AND (RQ.CODCENTROCUSTO = CC.CODCENTROCUSTO)                   ');
          Sql.Add('    AND (RQ.IDEMPRESA = CC.IDEMPRESA)                             ');
          Sql.Add('    AND (TO_NUMBER(RTRIM(SUBSTR(RQ.TRGUSERINCLUSAO,3,30))) = U.IDUSUARIO )');

//========================================================================================================================
//  Filtros
//========================================================================================================================
      Case Status Of
         srPendentes    : Sql.Add(' AND (RQ.REQATENDIDA =''F'' )');
         srAtendTotal   : Sql.Add(' AND (RQ.REQATENDIDA =''T'' )');
         srAtendParcial : Sql.Add(' AND (RQ.REQATENDIDA =''P'' )');
      End;
     If NumRequisicao <> 0 Then
        Sql.Add('    AND (RQ.NUMREQUISICAO = '+FloatToStr(NumRequisicao) +')  ');

     If IDProcesso <> 0 Then
        Sql.Add('    AND (RQ.IDPROCESSO = '+FloatToStr(IDProcesso)+') ');

     If Trim(CodCentroCusto) <> '' Then
        Sql.Add('    AND (RTRIM(RQ.CODCENTROCUSTO) = '+QuotedStr(Trim(CodCentroCusto))+')           ');

     If CodAlmoxarifado <> 0 Then
        Sql.Add('    AND (RQ.CODALMOXAORIGEM = '+FloatToStr(CodAlmoxarifado)+') ');

     If DataReqIni <> 0  Then
        Sql.Add('    AND (RQ.DATAEMISSAO >= TO_DATE('''+DateToStr(DataReqIni)+''',''DD/MM/YYYY'')) ');

     If DataReqFim <> 0 Then
        Sql.Add('    AND (RQ.DATAEMISSAO <= TO_DATE('''+DateToStr(DataReqFim)+''',''DD/MM/YYYY'')) ');

     If DataNecIni <> 0 Then
        Sql.Add('    AND (RQ.DATANECESSIDADE >= TO_DATE('''+DateToStr(DataNecIni)+''',''DD/MM/YYYY'')) ');

     If DataNecFim <> 0 Then
        Sql.Add('    AND (RQ.DATANECESSIDADE <= TO_DATE('''+DateToStr(DataNecFim)+''',''DD/MM/YYYY'')) ');

     If Trim(CodArtigo) <> '' Then
       Begin
          Sql.Add('   AND (RTRIM(IP.CODARTIGO) = '+QuotedStr(CodArtigo)+') ');
          Sql.Add('   AND (IP.NUMREQUISICAO = RQ.NUMREQUISICAO) ');
       End;
     If Trim(CodGrupoProd) <> '' Then
       Begin
          Sql.Add('   AND (IP.NUMREQUISICAO = RQ.NUMREQUISICAO) ');
          Sql.Add('   AND (RTRIM(P.CODGRUPOPROD) = '+QuotedStr(Trim(CodGrupoProd))+') ');
          Sql.Add('   AND (P.CODPRODUTO = A.CODPRODUTO ) ');
          Sql.Add('   AND (A.CODARTIGO = IP.CODARTIGO ) ');

       End;
     If DataAtendIni <> 0 Then
       Begin
          Sql.Add('   AND (IE.DATAENTREGA >= TO_DATE('''+DateToStr(DataAtendIni)+''',''DD/MM/YYYY'')) ');
          Sql.Add('   AND (IE.NUMREQUISICAO = RQ.NUMREQUISICAO) ');
       End;
     If DataAtendFim <> 0 Then
       Begin
          Sql.Add('   AND (IE.DATAENTREGA <= TO_DATE('''+DateToStr(DataAtendFim)+''',''DD/MM/YYYY'')) ');
          Sql.Add('   AND (IE.NUMREQUISICAO = RQ.NUMREQUISICAO) ');
       end;
     If IdUsuario <> 0 Then
       Sql.Add('      AND (RQ.TRGUSERINCLUSAO = '+QuotedStr('CM'+FloatToStr(IdUsuario))+' )');

     Sql.Add(' ORDER BY  NUMREQUISICAO ');

     Result := GetDataPacket(SQL.Text);

   Finally
     SQL.Free;
   End;
end;

function TCtrlReqMat.GetAtendimentoItem(NumRequisicao: Double;
  CodArtigo: String ): OleVariant;
begin
   CodArtigo := Copy(CodArtigo + '                       ',1,14);
   With _DtmAlmox Do
     Begin
        spGetAtendItem.Prepare;
        spGetAtendItem.ParamByName('NUMREQUISICAO').AsFloat := NumRequisicao;
        spGetAtendItem.ParamByName('CODARTIGO').AsString    := CodArtigo;
        Result := spGetAtendItem.Data;
     End;

end;

function TCtrlReqMat.RequisicaoJaEntregue(NumRequisicao: Double): Boolean;
begin
  With _DtmAlmox Do
     Begin
        spGetAtendItem.Prepare;
        spGetAtendItem.ParamByName('NUMREQUISICAO').AsFloat := NumRequisicao;
        cds.Data := spGetAtendItem.Data;

        Result := cds.IsEmpty;
     End;
end;

function TCtrlReqMat.ListOutrasRequisicoes(IdPessoa: Integer;
  CodArtigo: String; CodAlmoxarifado: Integer; NumRequisicao: Double): OleVariant;
begin
  With _DtmAlmox Do
     Begin
        spListOutrasReq.Prepare;

        spListOutrasReq.ParamByName('IDPESSOA').AsInteger        := IdPessoa;
        spListOutrasReq.ParamByName('CODARTIGO').AsString        := CodArtigo;
        spListOutrasReq.ParamByName('CODALMOXAORIGEM').AsInteger := CodAlmoxarifado;
        spListOutrasReq.ParamByName('NUMREQUISICAO').AsFloat     := NumRequisicao;

        Result := spListOutrasReq.Data;
     End;

end;

function TCtrlReqMat.ExecutaMovimentacao(TipoRequisicao: TTipoRequisicao;
  IdPessoa: Integer; Valor, Qtde: Double;  CodCusteio, CodAlmoxOrigem: Integer;
  CodArtigo, CodTipoMov,  CodMedida: String; Data: TDateTime; NumDocumento,
  CentroCustoOrigem: String; UnidNegoc, CodAlmoxTransf,
  CodCusteioDestino: Integer; CentroCustoDestino,
  CodTipoMovEnt: String): Boolean;
Var
   IdMov : Double;
   SQL   : String;
begin
   Result := True;
   Try
      Case TipoRequisicao Of
         trTransferencia :
            Begin
               //------------------------------------------------------------------
               // Efetua a saida do almoxarifado Origem
               //------------------------------------------------------------------
               IdMov := _MovEstoque.GeraMovimento(tlSaida,
                                                  IdPessoa,
                                                  Valor,
                                                  Qtde,
                                                  CodCusteio,
                                                  CodAlmoxOrigem,
                                                  Codartigo,
                                                  '',
                                                  CodTipoMov,
                                                  CodMedida,
                                                  0,
                                                  Data,
                                                  NumDocumento,
                                                  CentroCustoOrigem,
                                                  IdPessoa,
                                                  CodAlmoxTransf,
                                                  UnidNegoc);

               If IdMov < 0 Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );

               SQL := 'SELECT VALORMOV*(-1) AS VALOR FROM MOVIMENT WHERE (IDMOV = '+FloatToStr(IdMov)+')';
               _cds.Data := GetDataPacket( SQL );

               Valor := _cds.fieldByName('VALOR').AsFloat;
               //------------------------------------------------------------------
               // Efetua a entrada do almoxarifado Destino
               //------------------------------------------------------------------
               IdMov := _MovEstoque.GeraMovimento(tlEntrada,
                                                  IdPessoa,
                                                  Valor,
                                                  Qtde,
                                                  CodCusteioDestino,
                                                  CodAlmoxTransf,
                                                  Codartigo,
                                                  '',
                                                  CodTipoMovEnt,
                                                  CodMedida,
                                                  0,
                                                  Data,
                                                  NumDocumento,
                                                  CentroCustoDestino,
                                                  IdPessoa,
                                                  CodAlmoxOrigem,
                                                  UnidNegoc);
               If IdMov < 0 Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );
            End;
         trCusto :
            Begin
               IdMov := _MovEstoque.GeraMovimento(tlSaida,
                                                  IdPessoa,
                                                  0,
                                                  Qtde,
                                                  CodCusteio,
                                                  CodAlmoxOrigem,
                                                  Codartigo,
                                                  '',
                                                  'E',
                                                  CodMedida,
                                                  0,
                                                  Data,
                                                  NumDocumento,
                                                  CentroCustoOrigem,
                                                  IdPessoa,
                                                  CodAlmoxTransf,
                                                  UnidNegoc);

               If IdMov < 0 Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );
            End;

      End;
   Except
      On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
   End;
end;

function TCtrlReqMat.ListItemAntendimento(IdPessoa: Integer;
  CodAlmoxarifado: Integer; CodCentroCusto  : String;
  NumRequisicao: Double; DataEmissao,
  DataNecessidade: TDateTime): OleVariant;
begin



  With _DtmAlmox Do
     Begin
        spListItemAtend.Prepare;

        If NumRequisicao = 0 Then
           spListItemAtend.ParamByName('NUMREQUISICAO').ClearLine;

        If DataEmissao = 0 Then
           spListItemAtend.ParamByName('DATAEMISSAO').ClearLine;

        If DataNecessidade = 0 Then
           spListItemAtend.ParamByName('DATANECESSIDADE').ClearLine;

        If Trim(CodCentroCusto) = '' Then
           spListItemAtend.ParamByName('CODCENTROCUSTO').ClearLine;

        spListItemAtend.Prepare;

        If NumRequisicao <> 0 Then
           spListItemAtend.ParamByName('NUMREQUISICAO').AsFloat := NumRequisicao;

        If DataEmissao <> 0 Then
           spListItemAtend.ParamByName('DATAEMISSAO').AsDate := DataEmissao;

        If DataNecessidade <> 0 Then
           spListItemAtend.ParamByName('DATANECESSIDADE').AsDate := DataNecessidade;

        If Trim(CodCentroCusto) <> '' Then
           spListItemAtend.ParamByName('CODCENTROCUSTO').AsString := CodCentroCusto;

        spListItemAtend.ParamByName('IDPESSOA').AsInteger := IdPessoa;
        spListItemAtend.ParamByName('CODALMOXAORIGEM').AsInteger := CodAlmoxarifado;

        Result := spListItemAtend.Data;

        spListItemAtend.UnPrepare;
     End;
end;

function TCtrlReqMat.AtenderReqCad(IdPessoa: Integer; QtdeAtendida : Double;
DataAtendimento : TDateTime;IdAtendente : Double;
DeixaRestoPendente : Boolean ): Boolean;
Var
   sAlmoxOrigem        : String;
   sAlmoxDestino       : String;
   iCodCusteio         : Integer;
   iCodCusteioDestino  : Integer;
   sCentroCusto        : String;
   sCentroCustoDestino : String;
   TipoMovSai          : String;
   TipoMovEnt          : String;
   SQL                 : String;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AtenderReqCad(IdPessoa,QtdeAtendida ,DataAtendimento, IdAtendente,DeixaRestoPendente, FcdsItem.Data );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

         sAlmoxDestino := '';

         _cds.Data := _Almox.Procurar(FcdsItem.FieldByName('CODALMOXAORIGEM').AsInteger );
          // Pega os dados do almoxarifado de origem
         sAlmoxOrigem := _cds.FieldByName('PRINCIPSECUND').AsString;
         iCodCusteio  := _cds.FieldByName('CODCUSTEIO').AsInteger;
         sCentroCusto := _cds.FieldByName('CODCENTROCUSTO').AsString;
         iCodCusteioDestino  := 0;
         sCentroCustoDestino := '';

         If FcdsItem.FieldByName('CUSTOTRANSF').AsString = 'T' Then
            Begin
               _cds.Data  := _Almox.Procurar(FcdsItem.FieldByName('CODALMOXADESTINO').AsInteger );
               // Pega os dados do almoxarifado de destino
               sAlmoxDestino       := _cds.FieldByName('PRINCIPSECUND').AsString;
               iCodCusteioDestino  := _cds.FieldByName('CODCUSTEIO').AsInteger;
               sCentroCustoDestino := _cds.FieldByName('CODCENTROCUSTO').AsString;

               IF (sAlmoxOrigem = 'P') And (sAlmoxDestino= 'S') Then
                  Begin
                     TipoMovSai := 'F';
                     TipoMovEnt := 'B';
                  End
               Else
               IF (sAlmoxOrigem = 'P') And (sAlmoxDestino= 'P') Then
                  Begin
                     TipoMovSai := 'F';
                     TipoMovEnt := 'B';
                  End
               Else
               IF (sAlmoxOrigem = 'S') And (sAlmoxDestino= 'P') Then
                  Begin
                     TipoMovSai := 'R';
                     TipoMovEnt := 'S';
                  End
               Else
               IF (sAlmoxOrigem = 'S') And (sAlmoxDestino= 'S') Then
                  Begin
                     TipoMovSai := 'G';
                     TipoMovEnt := 'B';
                  End;
            End;
            //-----------------------------------------------------------------------------------------------------
            // Executa  a Movimentação no estoque
            //-----------------------------------------------------------------------------------------------------
            If FcdsItem.FieldByName('CUSTOTRANSF').AsString = 'T' Then
               Begin
                  IF Not ExecutaMovimentacao(trTransferencia,
                                             IdPessoa,
                                             FcdsItem.FieldByName('VALORUN').AsFloat,
                                             QtdeAtendida,
                                             iCodCusteio,
                                             FcdsItem.FieldByName('CODALMOXAORIGEM').AsInteger,
                                             FcdsItem.FieldByName('CODARTIGO').AsString,
                                             TipoMovSai,
                                             FcdsItem.FieldByName('CODMEDIDA').AsString,
                                             DataAtendimento,
                                             FcdsItem.FieldByName('NUMREQUISICAO').AsString,
                                             sCentroCusto,
                                             FcdsItem.FieldByName('UNIDNEGOC').AsInteger
                                             FcdsItem.FieldByName('CODALMOXADESTINO').AsInteger,
                                             iCodCusteioDestino,
                                             sCentroCustoDestino,
                                             TipoMovEnt )
                  Then
                    Raise Exception.Create(MessageInfo);
               End
            Else
               Begin
                  IF Not ExecutaMovimentacao(trCusto,
                                             IdPessoa,
                                             FcdsItem.FieldByName('VALORUN').AsFloat,
                                             QtdeAtendida,
                                             iCodCusteio,
                                             FcdsItem.FieldByName('CODALMOXAORIGEM').AsInteger,
                                             FcdsItem.FieldByName('CODARTIGO').AsString,
                                             '',
                                             FcdsItem.FieldByName('CODMEDIDA').AsString,
                                             DataAtendimento,
                                             FcdsItem.FieldByName('NUMREQUISICAO').AsString,
                                             FcdsItem.FieldByName('CODCENTROCUSTO').AsString,
                                             FcdsItem.FieldByName('UNIDNEGOC').AsInteger)
                  Then
                    Raise Exception.Create(MessageInfo);
               End;
           //-----------------------------------------------------------------------------------------------
           // Gera a confirmação do atendimento
           //-----------------------------------------------------------------------------------------------
           _DbItemEntr.NumRequisicao.AsFloat  := FCdsItem.FieldByName('NUMREQUISICAO').AsFloat;
           _DbItemEntr.CodArtigo.AsString     := FCdsItem.FieldByName('CODARTIGO').AsString;
           _DbItemEntr.CodMedida.AsString     := FCdsItem.FieldByName('CODMEDIDA').AsString;
           _DbItemEntr.QtdeEntrega.AsFloat    := QtdeAtendida;
           _DbItemEntr.ValorUn.AsFloat        := FCdsItem.FieldByName('VALORUN').AsFloat;
           _DbItemEntr.IdAtendente.AsFloat    := 0;
           _DbItemEntr.DataEntrega.AsDateTime := 0;
           _DbItemEntr.FlgStatus.AsString     := 'F';
           If Not _DbItemEntr.Insert Then
              Raise Exception.Create(_DbItemEntr.MessageInfo);

           //-----------------------------------------------------------------------------------------------
           // Atualizar a qtde pendente na tabela ItemPedi
           //-----------------------------------------------------------------------------------------------
            _DbItemPedi.NumRequisicao.AsFloat := _DbItemEntr.NumRequisicao.AsFloat;
            _DbItemPedi.CodArtigo.AsString    := Copy(_DbItemEntr.CodArtigo.AsString + '                           ',1,14);
            _DbItemPedi.LoadFromDb;
            If DeixaRestoPendente Then
               _DbItemPedi.QtdePendente.AsFloat := _DbItemPedi.QtdePendente.AsFloat - QtdeAtendida
            Else
               _DbItemPedi.QtdePendente.AsFloat := 0;

            If Not _DbItemPedi.Update Then
              Raise Exception.Create(_DbItemPedi.MessageInfo);

           //-----------------------------------------------------------------------------------------------
           //Verifica s Já houve atendimento de algum item da requisição
           //-----------------------------------------------------------------------------------------------
           If RequisicaoJaEntregue( _DbItemPedi.NumRequisicao.AsFloat ) Then
              SQL := 'UPDATE REQMAT SET  REQATENDIDA = ''T'' WHERE NUMREQUISICAO = '+ _DbItemPedi.NumRequisicao.AsString
           Else
              SQL := 'UPDATE REQMAT SET  REQATENDIDA = ''P'' WHERE NUMREQUISICAO = '+ _DbItemPedi.NumRequisicao.AsString;
           If Not ExecSQL(SQL,True) Then
              Raise Exception.Create(MessageInfo);

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

function TCtrlReqMat.EstornarReqCad: Boolean;
Var
   SQL : String;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AtenderReqCad( FcdsItem.Data );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

         //-----------------------------------------------------------------------------------------------
         // Atualizar a qtde pendente na tabela ITEMPEDI para zero (estorno)
         //-----------------------------------------------------------------------------------------------
          _DbItemPedi.NumRequisicao.AsFloat := FCdsItem.FieldByName('NUMREQUISICAO').AsFloat;
          _DbItemPedi.CodArtigo.AsString    := Copy(FCdsItem.FieldByName('CODARTIGO').AsString + '                           ',1,14);
          _DbItemPedi.LoadFromDb;
          _DbItemPedi.QtdePendente.AsFloat := 0;

          If Not _DbItemPedi.Update Then
            Raise Exception.Create(_DbItemPedi.MessageInfo);

         //-----------------------------------------------------------------------------------------------
         //Verifica s Já houve atendimento de algum item da requisição
         //-----------------------------------------------------------------------------------------------
         If RequisicaoJaEntregue( _DbItemPedi.NumRequisicao.AsFloat ) Then
            SQL := 'UPDATE REQMAT SET  REQATENDIDA = ''T'' WHERE NUMREQUISICAO = '+ _DbItemPedi.NumRequisicao.AsString
         Else
            SQL := 'UPDATE REQMAT SET  REQATENDIDA = ''P'' WHERE NUMREQUISICAO = '+ _DbItemPedi.NumRequisicao.AsString;
         If Not ExecSQL(SQL,True) Then
            Raise Exception.Create(MessageInfo);

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

function TCtrlReqMat.ConfirmaAtendimento(IdItemEntrega, IdUsuario: Double;
  Data: TDateTime): Boolean;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ConfirmaAtendimento(IdItemEntrega, IdUsuario, Data );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

         With _DtmAlmox Do
            Begin
               spConfDevolAtend.Prepare;

               spConfDevolAtend.ParamByName('IDITEMENTREGA').AsFloat := IdItemEntrega;
               spConfDevolAtend.ParamByName('IDUSUARIO').AsFloat     := IdUsuario;
               spConfDevolAtend.ParamByName('DATA').AsDate           := Data;
               spConfDevolAtend.ParamByName('STATUS').AsString       := 'T';

               If Not ExecSQL( spConfDevolAtend.SQLChanged,True ) Then
                  Raise Exception.Create( MessageInfo );
            End;

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

function TCtrlReqMat.DevolveAtendimento(IdPessoa: Integer;
  IdUsuario: Double; Data: TDateTime): Boolean;
Var
   sAlmoxOrigem        : String;
   sAlmoxDestino       : String;
   iCodCusteio         : Integer;
   iCodCusteioDestino  : Integer;
   sCentroCusto        : String;
   sCentroCustoDestino : String;
   TipoMovSai          : String;
   TipoMovEnt          : String;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.DevolveAtendimento(IdPessoa, IdUsuario, Data, FcdsItem.Data );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

         sAlmoxOrigem := '';
         iCodCusteio  := 0;
         sCentroCusto := '';

         _cds.Data  := _Almox.Procurar(FcdsItem.FieldByName('CODALMOXADESTINO').AsInteger );
         // Pega os dados do almoxarifado de destino
         sAlmoxDestino       := _cds.FieldByName('PRINCIPSECUND').AsString;
         iCodCusteioDestino  := _cds.FieldByName('CODCUSTEIO').AsInteger;
         sCentroCustoDestino := _cds.FieldByName('CODCENTROCUSTO').AsString;

         If FcdsItem.FieldByName('CUSTOTRANSF').AsString = 'T' Then
            Begin
               _cds.Data := _Almox.Procurar(FcdsItem.FieldByName('CODALMOXAORIGEM').AsInteger );
                // Pega os dados do almoxarifado de origem
               sAlmoxOrigem := _cds.FieldByName('PRINCIPSECUND').AsString;
               iCodCusteio  := _cds.FieldByName('CODCUSTEIO').AsInteger;
               sCentroCusto := _cds.FieldByName('CODCENTROCUSTO').AsString;

               IF (sAlmoxOrigem = 'P') And (sAlmoxDestino= 'S') Then
                  Begin
                     TipoMovSai := 'F';
                     TipoMovEnt := 'B';
                  End
               Else
               IF (sAlmoxOrigem = 'P') And (sAlmoxDestino= 'P') Then
                  Begin
                     TipoMovSai := 'F';
                     TipoMovEnt := 'B';
                  End
               Else
               IF (sAlmoxOrigem = 'S') And (sAlmoxDestino= 'P') Then
                  Begin
                     TipoMovSai := 'R';
                     TipoMovEnt := 'S';
                  End
               Else
               IF (sAlmoxOrigem = 'S') And (sAlmoxDestino= 'S') Then
                  Begin
                     TipoMovSai := 'G';
                     TipoMovEnt := 'B';
                  End;
            End;
            //-----------------------------------------------------------------------------------------------------
            // Executa  a Movimentação no estoque
            //-----------------------------------------------------------------------------------------------------
            If FcdsItem.FieldByName('CUSTOTRANSF').AsString = 'T' Then
               Begin
                  IF Not ExecutaMovimentacao(trTransferencia,
                                             IdPessoa,
                                             FcdsItem.FieldByName('VALORUN').AsFloat,
                                             FcdsItem.FieldByName('QTDEENTREGA').AsFloat,
                                             iCodCusteioDestino,
                                             FcdsItem.FieldByName('CODALMOXADESTINO').AsInteger,
                                             FcdsItem.FieldByName('CODARTIGO').AsString,
                                             TipoMovSai,
                                             FcdsItem.FieldByName('CODMEDIDA').AsString,
                                             Date,
                                             FcdsItem.FieldByName('NUMREQUISICAO').AsString,
                                             sCentroCustoDestino,
                                             FcdsItem.FieldByName('UNIDNEGOC').AsInteger
                                             FcdsItem.FieldByName('CODALMOXAORIGEM').AsInteger,
                                             iCodCusteio,
                                             sCentroCusto,
                                             TipoMovEnt )
                  Then
                    Raise Exception.Create(MessageInfo);
               End
            Else
               Begin
                  IF Not ExecutaMovimentacao(trCusto,
                                             IdPessoa,
                                             FcdsItem.FieldByName('VALORUN').AsFloat,
                                             FcdsItem.FieldByName('QTDEENTREGA').AsFloat * -1,
                                             iCodCusteioDestino,
                                             FcdsItem.FieldByName('CODALMOXADESTINO').AsInteger,
                                             FcdsItem.FieldByName('CODARTIGO').AsString,
                                             '',
                                             FcdsItem.FieldByName('CODMEDIDA').AsString,
                                             Date,
                                             FcdsItem.FieldByName('NUMREQUISICAO').AsString,
                                             sCentroCustoDestino,
                                             FcdsItem.FieldByName('UNIDNEGOC').AsInteger)
                  Then
                    Raise Exception.Create(MessageInfo);
               End;
         //-----------------------------------------------------------------------------------------------
         //  Devolução do atendimento
         //-----------------------------------------------------------------------------------------------
         With _DtmAlmox Do
            Begin
               spConfDevolAtend.Prepare;

               spConfDevolAtend.ParamByName('IDITEMENTREGA').AsFloat := FcdsItem.FieldByName('IDITEMENTREGA').AsFloat;
               spConfDevolAtend.ParamByName('IDUSUARIO').AsFloat     := IdUsuario;
               spConfDevolAtend.ParamByName('DATA').AsDate           := Data;
               spConfDevolAtend.ParamByName('STATUS').AsString       := 'D';

               If Not ExecSQL( spConfDevolAtend.SQLChanged,True ) Then
                  Raise Exception.Create( MessageInfo );
            End;

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

function TCtrlReqMat.ListItemConfAtend(IdPessoa, CodAlmoxarifado: Integer;
  CodCentroCusto: String; NumRequisicao: Double; DataEmissao,
  DataNecessidade: TDateTime): OleVariant;
begin
  With _DtmAlmox Do
     Begin
        spListItemConfAtend.Prepare;

        If NumRequisicao = 0 Then
           spListItemConfAtend.ParamByName('NUMREQUISICAO').ClearLine;

        If DataEmissao = 0 Then
           spListItemConfAtend.ParamByName('DATAEMISSAO').ClearLine;

        If DataNecessidade = 0 Then
           spListItemConfAtend.ParamByName('DATANECESSIDADE').ClearLine;

        If Trim(CodCentroCusto) = '' Then
           spListItemConfAtend.ParamByName('CODCENTROCUSTO').ClearLine;

        spListItemConfAtend.Prepare;

        If NumRequisicao <> 0 Then
           spListItemConfAtend.ParamByName('NUMREQUISICAO').AsFloat := NumRequisicao;

        If DataEmissao <> 0 Then
           spListItemConfAtend.ParamByName('DATAEMISSAO').AsDate := DataEmissao;

        If DataNecessidade <> 0 Then
           spListItemConfAtend.ParamByName('DATANECESSIDADE').AsDate := DataNecessidade;

        If Trim(CodCentroCusto) <> '' Then
           spListItemConfAtend.ParamByName('CODCENTROCUSTO').AsString := CodCentroCusto;

        spListItemConfAtend.ParamByName('IDPESSOA').AsInteger          := IdPessoa;
        spListItemConfAtend.ParamByName('CODALMOXADESTINO').AsInteger := CodAlmoxarifado;

        Result := spListItemConfAtend.Data;

        spListItemConfAtend.UnPrepare;
     End;
end;

procedure TCtrlReqMat.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);

  _Almox.InitializeAs(Self);

  _RAD.InitializeAs(Self);
  _RAD.OpenTransaction := False;

  RADPlus.InitializeAs(Self);
  RADPlus.OpenTransaction := false;
  AlmoxCompras.InitializeAs(Self);
end;

procedure TCtrlReqMat.AfterApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
Var
  IdProcesso : Double;
  SQL        : String;
begin
  inherited;
  If (sTableName = _DbReqMat.TableName) And  ( CdsState = usInserted ) Then
     Begin
        //------------------------------------------------------------------------------------------------------
        // Gravar o R.A.D.
        //------------------------------------------------------------------------------------------------------
        if (Sistema.UsaRAD) then
        begin
          if (Sistema.VersaoRAD = '+') then
          begin
              RADPlus.InicializaPropriedades;
              RADPlus.IdEventoGerador := 11;
              RADPlus.IdUsuario       := _DbReqMat.IdUsuarioInclusao.AsInteger;
              RADPlus.CodCentroCusto  := _DbReqMat.CodCentroCusto.AsString;
              RADPlus.IdEmpresa       := _DbReqMat.IdPessoa.AsInteger;

              If _DbReqMat.UnidNegoc.AsInteger <> 0 Then
                  RADPlus.UnidNegoc       := _DbReqMat.UnidNegoc.AsInteger;

              RADPlus.OBS             := 'Requisição de Material Número : '+_DbReqMat.NumRequisicao.AsString;
              RADPlus.VlrProc         := FrValorTotal;

               If Trim(FsGrupoProd) <> '' Then
                  RADPlus.CodGrupoProd    := FsGrupoProd;

               IdProcesso := RADPlus.IniciarProcesso;

               If IdProcesso = 0 Then
               begin
                  if ( radPlus.RecuperaTipoProcesso(11, sistema.IdEmpresa)  = 0 ) then
                      Accept := true
                  else
                      Raise Exception.Create( RADPlus.MessageInfo );
               end
               else
               begin
                  SQL := ' UPDATE REQMAT SET IDPROCESSO = '+FloatToStr(IdProcesso)+
                         ' WHERE  (NUMREQUISICAO = '+_DbReqMat.NumRequisicao.AsString+') ';

                  If Not ExecSQL( SQL ,True ) Then
                     Raise Exception.Create( MessageInfo );
               end;
          end
          else
          begin
            _RAD.TipoProcesso := _RAD.GetTipoProcesso( 11, aCds.FieldByName('IDPESSOA').AsInteger ); // É fixa a referência
            If _RAD.TipoProcesso > 0 Then
            Begin
                 _RAD.IdUsuario       := _DbReqMat.IdUsuarioInclusao.AsInteger;
                 _RAD.IdPessoa        := _DbReqMat.IdPessoa.AsInteger;
                 _RAD.CodCentroCusto  := _DbReqMat.CodCentroCusto.AsString;
                 _RAD.IdEmpresa       := _DbReqMat.IdPessoa.AsInteger;

                 If _DbReqMat.UnidNegoc.AsInteger <> 0 Then
                    _RAD.UnidNegoc       := _DbReqMat.UnidNegoc.AsInteger;

                 _RAD.OBS             := 'Requisição Número : '+_DbReqMat.NumRequisicao.AsString;
                 _RAD.Valor           := FrValorTotal;

                 If Trim(FsGrupoProd) <> '' Then
                    _RAD.CodGrupoProd    := FsGrupoProd;

                 IdProcesso := _RAD.IniciarProcesso;

                 If IdProcesso < 0 Then
                     Raise Exception.Create( _RAD.MessageInfo );

                 SQL := ' UPDATE REQMAT SET IDPROCESSO = '+FloatToStr(IdProcesso)+
                        ' WHERE  (NUMREQUISICAO = '+_DbReqMat.NumRequisicao.AsString+') ';

                 If Not ExecSQL( SQL ,True ) Then
                    Raise Exception.Create( MessageInfo );
              End;
            end;
        end;
     End;
end;

procedure TCtrlReqMat.SetrValorTotal(const Value: double);
begin
  FrValorTotal := Value;
end;

procedure TCtrlReqMat.SetsGrupoProd(const Value: String);
begin
  FsGrupoProd := Value;
end;

procedure TCtrlReqMat.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
begin
  inherited;
  If (sTableName = _DbItemPedi.TableName ) And (CdsState <> usDeleted) Then
  Begin
    if (FlgTestaGrau) then
    begin
        if (sGrpProduto <> '') then
        begin
          if not AlmoxCompras.VerifGrauGrupoProd( _DbReqMat.IdPessoa.AsInteger,
                                                 _RAD.TipoProcesso,
                                                 sGrpProduto,
                                                 aCds.FieldByName('CODGRUPOPROD').AsString)
          then
             raise Exception.Create(AlmoxCompras.MessageInfo);
        end;
    end
    else
    begin
      If _RAD.TipoProcesso > 0 then
      Begin
        If sGrpProduto <> '' Then
        Begin
          If Not _RAD.VerifGrauGrupoProd( _DbReqMat.IdPessoa.AsInteger,
                                        _RAD.TipoProcesso,
                                        sGrpProduto,
                                        aCds.FieldByName('CODGRUPOPROD').AsString) Then
            Raise Exception.Create( _RAD.MessageInfo );
        End;
      end;
    end;
    sGrpProduto := aCds.FieldByName('CODGRUPOPROD').AsString;
  end;
end;

end.
