unit uCtrlDataRepresa1;

interface
Uses DB, uCmControlObject,Classes,uCmTypes,Forms,
     dbclient, sysutils, uMidasUtil, uCtrlMovEstoque1,
     uCtrlAlmox,DAlmoxarifado,extctrls, uString;
    // uDbUltDataRepresa;

Const
   MAX_PRODUTOS = 100;

Type
  TCtrlDataRepresa1 = class(TCmControlObject)

  Protected
    procedure AfterInitialize; Override;
    Procedure OnCreateAppServer; Override;
  private
    _MovEstoque       : TCtrlMovEstoque;
    _DtmAlmox         : TDtmAlmoxarifado;
    _Almox            : TCtrlAlmox;
    //_DbUltDataRepresa : TDbUltDataRepresa;
    _IdHotel          : Double;

    FUsaPrepareStatment: Boolean;
    procedure SetUsaPrepareStatment(const Value: Boolean);
  Public
    Constructor Create( IdHotel : Double ); ReIntroduce;
    Destructor  Destroy; Override;
    Property UsaPrepareStatment : Boolean read FUsaPrepareStatment write SetUsaPrepareStatment;
    {**
       Atualiza a data de represamento do sistema recalculando o saldo e os
       custos médios dos produtos.
    **}
    Function AtualizaDataRepresa( IdPessoa          : Integer;
                                  DataAntiga        : TDateTime;
                                  DataNova          : TDateTime;
                                  GeraSaldoMensal   : Boolean;
                                  Const IAppCliente : OleVariant ) : Boolean;

    {**
       Atualiza a data de represamento do sistema gerando o movimento X
    **}
    Function GeraMovimentoX( IdPessoa          : Integer;
                             Data              : TDateTime;
                             Const IAppCliente : OleVariant ) : Boolean;
    {**
       Retorna a data de represamento da empresa
    **}
    Function GetDataRepresa( IdPessoa : Integer ) : TDateTime;
    {**
       Verifica se foi rodado a data represa em uma determinado mes de um ano
       em uma determinada empresa.
    **}
    Function VerificaMesRepresamento( IdPessoa : Double; Data : TDateTime ) : Boolean;
  End;

implementation

uses Math;

{ TCtrlDataRepresa }

procedure TCtrlDataRepresa1.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);
  _Almox.InitializeAs(Self);
end;

function TCtrlDataRepresa1.AtualizaDataRepresa(IdPessoa: Integer;
  DataAntiga,DataNova: TDateTime; GeraSaldoMensal   : Boolean;
  Const IAppCliente: OleVariant): Boolean;
Var
    Valor    : Integer;
    MaxValor : Integer;
    sTitulo  : String;
    cont     : Integer;
begin
Result :=  True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AtualizaDataRepresa( IdPessoa, DataAntiga,
                                                          DataNova, IAppCliente,
                                                          _IdHotel, GeraSaldoMensal );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      _MovEstoque.CriarPrepare;
      Try
         Try
            //------------------------------------------------------------------
            // Para as querys enchegarem a data nova para executarem as query
            // de forma correta.
            //------------------------------------------------------------------
            _MovEstoque.DataRepresa := DataNova;

            StartTransaction;

            With _DtmAlmox Do
               Begin
                  //------------------------------------------------------------
                  //  Atualiza o saldo dos produtos por almoxarifado
                  //------------------------------------------------------------
                  Cds.Data := _Almox.ListAlmox(IdPessoa);
                  Cds.First;
                  While Not Cds.Eof Do
                     Begin
                        spListProdAtuRepresa.Prepare;
                        spListProdAtuRepresa.ParamByName('IDPESSOA').AsFloat        :=  IdPessoa;
                        spListProdAtuRepresa.ParamByName('CODALMOXARIFADO').AsFloat :=  Cds.FieldByName('CODALMOXARIFADO').AsFloat;

                        _cds.Data := spListProdAtuRepresa.Data;

                        Valor    := 0;
                        MaxValor := _cds.RecordCount;
                        cont     := 0;

                        _cds.First;
                        While Not _Cds.Eof Do
                           Begin
                              //------------------------------------------------
                              // Verifica se a rotina vai gerar Saldo mensal
                              //------------------------------------------------
                              If GeraSaldoMensal then
                                 If Not _MovEstoque.GeraMovSaldoMensal( IdPessoa,
                                                                        DataAntiga+1,
                                                                        _cds.FieldByName('CODARTIGO').asString,
                                                                        Cds.FieldByName('CODALMOXARIFADO').asInteger )
                                 Then
                                    Raise Exception.Create( _MovEstoque.MessageInfo );

                              _MovEstoque.AtualizaSaldo( IdPessoa,
                                                         DataAntiga+1,
                                                         _cds.FieldByName('CODARTIGO').asString,
                                                         cds.FieldByName('CODALMOXARIFADO').asInteger );

                              _cds.Next;

                              Try
                                 Inc( Valor );
                                 sTitulo := cds.FieldByName('DESCALMOX').asString +'#'+ _cds.FieldByName('DESCPROD').asString;
                                 IAppCliente.BarraProgresso_CB(sTitulo, MaxValor, Valor);
                              Except
                              End;

                              If cont = MAX_PRODUTOS Then
                                 Begin
                                   cont := 0;
                                   Commit;
                                   StartTransaction;
                                 End;

                           End;
                        Cds.Next;

                        Inc( Cont );
                     End;

                  Commit;
                  //------------------------------------------------------------
                  //  Atualiza o custo médio dos produtos
                  //------------------------------------------------------------
                  _Cds.Data := GetDataPacket('SELECT DISTINCT   '+
                                             '     A.CODARTIGO, '+
                                             '     P.DESCPROD   '+
                                             ' FROM             '+
                                             '     ARTIGO A,    '+
                                             '     PRODUTO P,   '+
                                             '     SALDO S,     '+
                                             '     CUSTOMED C   '+
                                             ' WHERE (A.CODPRODUTO = P.CODPRODUTO) '+
                                             '  AND (A.CODPRODUTO = S.CODARTIGO)   '+
                                             '  AND (A.CODPRODUTO = C.CODARTIGO)  '+
                                             ' ORDER BY   P.DESCPROD ');
                  Valor    := 0;
                  MaxValor := _cds.RecordCount;
                  cont     := 0;

                  StartTransaction;

                  _cds.First;
                  While Not _Cds.Eof Do
                     Begin
                         If Not _MovEstoque.GeraRetroativo( IdPessoa,
                                                            DataAntiga+1,
                                                            _cds.FieldByName('CODARTIGO').asString )
                         Then
                            Raise Exception.Create(_MovEstoque.MessageInfo);

                         _cds.Next;

                         Try
                            Inc( Valor );
                            sTitulo := 'Custos e Valores' +'#'+ _cds.FieldByName('DESCPROD').asString;
                            IAppCliente.BarraProgresso_CB(sTitulo, MaxValor, Valor);
                         Except
                         End;

                         If cont = MAX_PRODUTOS Then
                            Begin
                              cont := 0;
                              Commit;
                              StartTransaction;
                            End;

                         Inc( cont );
                     End;
               End;

            Commit;

           //-------------------------------------------------------------------
           //  Atualiza a Última Data de represamento
           //-------------------------------------------------------------------
            StartTransaction;

            If GeraSaldoMensal Then
               Begin
                  _MovEstoque.PodeGerarSaldoMensal := VerificaMesRepresamento( IdPessoa, DataAntiga );

                  If _MovEstoque.PodeGerarSaldoMensal Then
                     Begin
                       // _DbUltDataRepresa.UltimaData.AsDateTime := DataAntiga+1;
                      //  _DbUltDataRepresa.IdPessoa.AsFloat      := IdPessoa;

                      //  If Not _DbUltDataRepresa.Insert Then
                       //    Raise Exception.Create( _DbUltDataRepresa.MessageInfo );
                     End;
               End;
               //---------------------------------------------------------------
               //  Atualiza a nova Data de represamento
               //---------------------------------------------------------------
               If Not ExecSQL(' UPDATE PARALMOX SET'+
                              ' DATAREPRESA = '+ SQLFormatToDate( DataNova )+
                              ' WHERE (IDPESSOA = '+IntToStr( IdPessoa )+') ',True)
               Then
                  Raise Exception.Create(MessageInfo);

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
         _MovEstoque.DestruirPrepare;
      End;
   End;
end;

constructor TCtrlDataRepresa1.Create( IdHotel : Double );
begin
  inherited Create;
  _IdHotel     := IdHotel;

  _MovEstoque  := TCtrlMovEstoque.Create( IdHotel );
  _Almox       := TCtrlAlmox.Create;
  _DtmAlmox    := TDtmAlmoxarifado.Create(Self);
 // _DbUltDataRepresa := TDbUltDataRepresa.Create(Self);

  FUsaPrepareStatment := True;
end;

destructor TCtrlDataRepresa1.Destroy;
begin
  _MovEstoque.Free;
  _Almox.Free;
  _DtmAlmox.Free;
  //_DbUltDataRepresa.Free;

  inherited;
end;

function TCtrlDataRepresa1.GeraMovimentoX(IdPessoa: Integer; Data: TDateTime;
  const IAppCliente: OleVariant): Boolean;
Var
    Valor    : Integer;
    MaxValor : Integer;
    sTitulo  : String;
begin
Result :=  True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AtualizaDataRepresa( IdPessoa, Data, Data, IAppCliente);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      IF FUsaPrepareStatment Then
         _MovEstoque.CriarPrepare;
      Try
         Try
            StartTransaction;

            With _DtmAlmox Do
               Begin
                  //------------------------------------------------------------
                  //  Atualiza o saldo dos produtos por almoxarifado
                  //------------------------------------------------------------
                  Cds.Data := _Almox.ListAlmox(IdPessoa);
                  Cds.First;
                  While Not Cds.Eof Do
                     Begin
                        spListProdAtuRepresa.Prepare;
                        spListProdAtuRepresa.ParamByName('IDPESSOA').AsFloat        :=  IdPessoa;
                        spListProdAtuRepresa.ParamByName('CODALMOXARIFADO').AsFloat :=  Cds.FieldByName('CODALMOXARIFADO').AsFloat;

                        _cds.Data := spListProdAtuRepresa.Data;

                        Valor    := 0;
                        MaxValor := _cds.RecordCount;
                        _cds.First;
                        While Not _Cds.Eof Do
                           Begin
                               If Not _MovEstoque.GeraMovX( IdPessoa,
                                                            Data+1,
                                                            _cds.FieldByName('CODARTIGO').asString,
                                                            cds.FieldByName('CODALMOXARIFADO').asInteger )
                               Then
                                  Raise Exception.Create( _MovEstoque.MessageInfo );

                               _cds.Next;

                              Try
                                 Inc( Valor );
                                 sTitulo := cds.FieldByName('DESCALMOX').asString +'#'+ _cds.FieldByName('DESCPROD').asString;
                                 IAppCliente.BarraProgresso_CB(sTitulo, MaxValor, Valor);
                              Except
                              End;

                           End;
                        Cds.Next;
                     End;
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
      Finally
         IF FUsaPrepareStatment Then
            _MovEstoque.DestruirPrepare;
      End;
   End;
end;

function TCtrlDataRepresa1.GetDataRepresa(IdPessoa: Integer): TDateTime;
begin
   Result := _MovEstoque.GetDataRepresa(IdPessoa);
end;

procedure TCtrlDataRepresa1.OnCreateAppServer;
begin
  inherited;

end;
{
procedure TCtrlDataRepresa.OnTimer(Sender: TObject);
begin
  DoProgresso('','',0,0);
end;
}


procedure TCtrlDataRepresa1.SetUsaPrepareStatment(const Value: Boolean);
begin
  FUsaPrepareStatment := Value;
end;

function TCtrlDataRepresa1.VerificaMesRepresamento(IdPessoa: Double;
  Data: TDateTime): Boolean;
Var
    SQL : String;
    Ano, mes,dia : Word;
begin
    DecodeDate(Data, Ano, Mes, Dia);

    SQL := ' SELECT IDPESSOA FROM ULTDATAREPRESA '+
           ' WHERE (IDPESSOA = '+FloatToStr(IdPessoa)+') '+
           '  AND TO_NUMBER(TO_CHAR(ULTIMADATA,''YYYY'')) = '+IntToStr(Ano) +
           '  AND TO_NUMBER(TO_CHAR(ULTIMADATA,''MM'')) = '+ IntToStr(Mes);

    _Cds.Data := GetDataPacket( SQL );

    Result := _Cds.IsEmpty;
end;

end.
