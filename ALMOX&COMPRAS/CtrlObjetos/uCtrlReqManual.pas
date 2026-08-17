unit uCtrlReqManual;

interface

Uses DB, Classes, uDataBase,uCmDbObject, uCmControlObject,
     uMidasUtil, sysUtils, dbclient, uSistema, uCtrlAlmox,
     uCtrlMovEstoque, DAlmoxarifado,uCmTypes;

Type
  TTipoBaixa = (tbTransferencia, tbCusto, tbDevolucao );

  TCtrlReqManual = class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    _MovEstoque : TCtrlMovEstoque;
    _Almox      : TCtrlAlmox;
    _DtmAlmox   : TDtmAlmoxarifado;
    //
    Fcds: TClientDataSet;
    FcdsItem: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsItem(const Value: TClientDataSet);
    {**
       Faz a chamada a Classe de Movimentação de estoque
       realizando a baixa dos produtos.
    **}
    Function  ExecutaBaixa(TipoBaixa          : TTipoBaixa;
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
  public
    Property cds     : TClientDataSet read Fcds write Setcds;
    Property cdsItem : TClientDataSet read FcdsItem write SetcdsItem;
   //-------------------------------------------------------------
   // Métodos
   //-------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    {**
       Executa a abaixa dos itens de acordo com o sesu tipo
    **}
    Function  BaixarMaterial( TipoBaixa : TTipoBaixa;
                              IdPessoa  : Integer ) : Boolean;
    {**
       Carrega os campos para tele ser montada (Db where)
    **}
    Function  ListReq     : OleVariant;
    {**
       Carrega os campos para tele ser montada (Db where)
    **}
    Function  ListReqItem : OleVariant;
    {**
       Verifica se já existe aquele número de requisição para
       aquele artigo
    **}
    Function ExisteRequisicao( IdPessoa      : Integer;
                               NumRequisicao : String;
                               CodArtigo     : String ) : Boolean;
  End;

implementation

{ TCtrlReqManual }

procedure TCtrlReqManual.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);
end;

function TCtrlReqManual.BaixarMaterial( TipoBaixa : TTipoBaixa; IdPessoa : Integer ) : Boolean;
Var
   sAlmoxOrigem        : String;
   sAlmoxDestino       : String;
   iCodCusteio         : Integer;
   iCodCusteioDestino  : Integer;
   sCentroCusto        : String;
   sCentroCustoDestino : String;
   TipoMovSai          : String;
   TipoMovEnt          : String;
   rValor              : Double;
   rQtde               : Double;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.BaixarMaterial (TipoBaixa, IdPessoa, Fcds.Data, FcdsItem.Data );
        If Not Result Then
           MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        Try
           StartTransaction;

           sAlmoxDestino := '';

           _cds.Data := _Almox.Procurar(Fcds.FieldByName('CODALMOXARIFADO').AsInteger );
            // Pega os dados do almoxarifado de origem
           sAlmoxOrigem := _cds.FieldByName('PRINCIPSECUND').AsString;
           iCodCusteio  := _cds.FieldByName('CODCUSTEIO').AsInteger;
           sCentroCusto := _cds.FieldByName('CODCENTROCUSTO').AsString;
           iCodCusteioDestino  := 0;
           sCentroCustoDestino := '';

           If TipoBaixa =  tbTransferencia Then
              Begin
                 _cds.Data  := _Almox.Procurar(Fcds.FieldByName('CODALMOXTRANSF').AsInteger );
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
              FcdsItem.First;
              While Not FcdsItem.Eof Do
                 Begin
                    // Verifica se é ficha técnica
                    If FcdsItem.FieldByName('FLGDEST').AsString = 'I' Then
                       Begin
                          Case TipoBaixa Of
                             tbTransferencia:
                                Begin
                                   IF Not ExecutaBaixa(TipoBaixa,IdPessoa,
                                                   FcdsItem.FieldByName('VALOR').AsFloat,
                                                   FcdsItem.FieldByName('QUANTIDADE').AsFloat,
                                                   iCodCusteio,
                                                   Fcds.FieldByName('CODALMOXARIFADO').AsInteger,
                                                   FcdsItem.FieldByName('CODARTIGO').AsString,
                                                   TipoMovSai,
                                                   FcdsItem.FieldByName('CODMEDIDA').AsString,
                                                   Fcds.FieldByName('DATAREQ').AsDateTime,
                                                   Fcds.FieldByName('NUMREQUISICAO').AsString,
                                                   sCentroCusto,
                                                   Fcds.FieldByName('UNIDNEGOC').AsInteger
                                                   Fcds.FieldByName('CODALMOXTRANSF').AsInteger,
                                                   iCodCusteioDestino,
                                                   sCentroCustoDestino,
                                                   TipoMovEnt )
                                   Then
                                      Raise Exception.Create(MessageInfo);

                                End;
                             tbCusto:
                                Begin
                                   // na baixa por Custo usar o Centro Custo destino
                                   // como origem para ele ser gravado na tabela moviment
                                   IF Not ExecutaBaixa(TipoBaixa,IdPessoa,
                                                   FcdsItem.FieldByName('VALOR').AsFloat,
                                                   FcdsItem.FieldByName('QUANTIDADE').AsFloat,
                                                   iCodCusteio,
                                                   Fcds.FieldByName('CODALMOXARIFADO').AsInteger,
                                                   FcdsItem.FieldByName('CODARTIGO').AsString,
                                                   '',
                                                   FcdsItem.FieldByName('CODMEDIDA').AsString,
                                                   Fcds.FieldByName('DATAREQ').AsDateTime,
                                                   Fcds.FieldByName('NUMREQUISICAO').AsString,
                                                   Fcds.FieldByName('CENTROCUSTODESTINO').AsString,
                                                   Fcds.FieldByName('UNIDNEGOC').AsInteger)
                                   Then
                                      Raise Exception.Create(MessageInfo);

                                End;
                             tbDevolucao:
                                Begin
                                   IF Not ExecutaBaixa(TipoBaixa,IdPessoa,
                                                   FcdsItem.FieldByName('VALOR').AsFloat,
                                                   FcdsItem.FieldByName('QUANTIDADE').AsFloat,
                                                   iCodCusteio,
                                                   Fcds.FieldByName('CODALMOXARIFADO').AsInteger,
                                                   FcdsItem.FieldByName('CODARTIGO').AsString,
                                                   '',
                                                   FcdsItem.FieldByName('CODMEDIDA').AsString,
                                                   Fcds.FieldByName('DATAREQ').AsDateTime,
                                                   Fcds.FieldByName('NUMREQUISICAO').AsString,
                                                   Fcds.FieldByName('CENTROCUSTODESTINO').AsString,
                                                   Fcds.FieldByName('UNIDNEGOC').AsInteger)
                                   Then
                                     Raise Exception.Create(MessageInfo);
                                End;
                          End;
                       End
                    Else
                       Begin
                          With _DtmAlmox Do
                             Begin
                                spFichaTec.Prepare;
                                spFichaTec.ParamByName('CODARTIGO').AsString   := Copy(FcdsItem.FieldByName('CODARTIGO').AsString + '                 ',1,14);
                                spFichaTec.ParamByName('CODCUSTEIO').AsInteger := iCodCusteio;

                                cds.Data := spFichaTec.Data;

                                cds.First;
                                While Not cds.Eof Do
                                   Begin
                                      rQtde  := cds.FieldByName('QTDE').AsFloat * FcdsItem.FieldByName('QUANTIDADE').AsFloat;
                                      rValor := rQtde * cds.FieldByName('CUSTOMEDIO').AsFloat;

                                      Case TipoBaixa Of
                                         tbTransferencia:
                                            Begin
                                               IF Not ExecutaBaixa(TipoBaixa,IdPessoa,
                                                               rValor,
                                                               rQtde,
                                                               iCodCusteio,
                                                               Fcds.FieldByName('CODALMORIFADO').AsInteger,
                                                               cds.FieldByName('CODARTIGOSEC').AsString,
                                                               TipoMovSai,
                                                               cds.FieldByName('CODMEDIDA').AsString,
                                                               Fcds.FieldByName('DATAREQ').AsDateTime,
                                                               Fcds.FieldByName('NUMREQUISICAO').AsString,
                                                               sCentroCusto,
                                                               Fcds.FieldByName('UNIDNEGOC').AsInteger
                                                               Fcds.FieldByName('CODALMOXTRANSF').AsInteger,
                                                               iCodCusteioDestino,
                                                               sCentroCustoDestino,
                                                               TipoMovEnt )
                                               Then
                                                  Raise Exception.Create(MessageInfo);

                                            End;
                                         tbCusto:
                                            Begin
                                               IF Not ExecutaBaixa(TipoBaixa,IdPessoa,
                                                               rValor,
                                                               rQtde,
                                                               iCodCusteio,
                                                               Fcds.FieldByName('CODALMORIFADO').AsInteger,
                                                               cds.FieldByName('CODARTIGOSEC').AsString,
                                                               '',
                                                               cds.FieldByName('CODMEDIDA').AsString,
                                                               Fcds.FieldByName('DATAREQ').AsDateTime,
                                                               Fcds.FieldByName('NUMREQUISICAO').AsString,
                                                               Fcds.FieldByName('CENTROCUSTODESTINO').AsString,
                                                               Fcds.FieldByName('UNIDNEGOC').AsInteger)
                                               Then
                                                  Raise Exception.Create(MessageInfo);

                                            End;
                                         tbDevolucao:
                                            Begin
                                               IF Not ExecutaBaixa(TipoBaixa,IdPessoa,
                                                               rValor,
                                                               rQtde,
                                                               iCodCusteio,
                                                               Fcds.FieldByName('CODALMORIFADO').AsInteger,
                                                               cds.FieldByName('CODARTIGOSEC').AsString,
                                                               '',
                                                               cds.FieldByName('CODMEDIDA').AsString,
                                                               Fcds.FieldByName('DATAREQ').AsDateTime,
                                                               Fcds.FieldByName('NUMREQUISICAO').AsString,
                                                               Fcds.FieldByName('CENTROCUSTODESTINO').AsString,
                                                               Fcds.FieldByName('UNIDNEGOC').AsInteger)
                                               Then
                                                  Raise Exception.Create(MessageInfo);
                                            End;
                                      End;
                                      cds.Next;
                                   End;
                             End;
                       End;
                     FcdsItem.Next;
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

constructor TCtrlReqManual.Create;
begin
  inherited;
  _MovEstoque := TCtrlMovEstoque.Create;
  _Almox      := TCtrlAlmox.Create;
  _DtmAlmox   := TDtmAlmoxarifado.Create(nil);
end;

destructor TCtrlReqManual.Destroy;
begin
  If IsAppServer Then
     FreeCds([Fcds,FcdsItem]);

  _MovEstoque.Free;
  _Almox.Free;
  _DtmAlmox.Free;

  inherited;
end;

procedure TCtrlReqManual.DoChangeDataBase;
begin
  inherited;
  _Almox.DataBase      := DataBase;
end;


function TCtrlReqManual.ExecutaBaixa(TipoBaixa: TTipoBaixa;
  IdPessoa: Integer; Valor, Qtde: Double; CodCusteio,
  CodAlmoxOrigem: Integer; CodArtigo, CodTipoMov, CodMedida: String;
  Data: TDateTime; NumDocumento,
  CentroCustoOrigem: String; UnidNegoc, CodAlmoxTransf,CodCusteioDestino : Integer;
  CentroCustoDestino: String; CodTipoMovEnt : String): Boolean;
Var
   IdMov : Double;
   SQL   : String;
begin
   Result := True;
   Try
      Case TipoBaixa Of
         tbTransferencia :
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
         tbCusto:
            Begin
               IdMov := _MovEstoque.GeraMovimento(tlSaida,
                                                  IdPessoa,
                                                  Valor,
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
         tbDevolucao:
            Begin
               IdMov := _MovEstoque.GeraMovimento(tlSaida,
                                                  IdPessoa,
                                                  Valor *(-1),
                                                  Qtde  *(-1),
                                                  CodCusteio,
                                                  CodAlmoxOrigem,
                                                  Codartigo,
                                                  '',
                                                  'P',
                                                  CodMedida,
                                                  0,
                                                  Data,
                                                  NumDocumento,
                                                  CentroCustoOrigem,
                                                  IdPessoa,
                                                  0,
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

function TCtrlReqManual.ExisteRequisicao(IdPessoa: Integer; NumRequisicao,
  CodArtigo: String): Boolean;
begin
   with _DtmAlmox Do
     Begin
        spExisteRequisicao.Prepare;
        spExisteRequisicao.ParamByName('IDPESSOA').AsInteger     := IdPessoa;
        spExisteRequisicao.ParamByName('NUMREQUISICAO').AsString := NumRequisicao;
        spExisteRequisicao.ParamByName('CODARTIGO').AsString     := CodArtigo;

        _cds.Data := spExisteRequisicao.Data;

        Result := _cds.FieldByName('NUMREQ').AsInteger > 0 ;
     End;
end;

function TCtrlReqManual.ListReq: OleVariant;
begin
   with _DtmAlmox Do
     Begin
        spReqManual.Prepare;
        Result := spReqManual.Data;
     End;
end;

function TCtrlReqManual.ListReqItem: OleVariant;
begin
   with _DtmAlmox Do
     Begin
        spItemReqManual.Prepare;
        Result := spItemReqManual.Data;
     End;
end;

procedure TCtrlReqManual.OnCreateAppServer;
begin
  inherited;
  FCds     := TClientDataSet.Create(nil);
  FCdsItem := TClientDataSet.Create(nil);
end;

procedure TCtrlReqManual.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlReqManual.SetcdsItem(const Value: TClientDataSet);
begin
  FcdsItem := Value;
end;


end.
