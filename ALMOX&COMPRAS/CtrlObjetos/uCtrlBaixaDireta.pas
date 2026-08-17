// Alterado por: andré tavares - 12/02/2004 - pendência 14995

unit uCtrlBaixaDireta;

interface

Uses DB, uCmControlObject, dbclient,uCmDbObject, DAlmoxarifado,
     sysUtils, uCmTypes, uMidasUtil, uCtrlMovEstoque, uCtrlAlmox;

Type
 TTipoBaixaDir = (tbTransferencia, tbCusto );

 TCtrlBaixaDireta = class(TCmControlObject)
   Protected
     Procedure AfterInitialize; Override;
     Procedure OnCreateAppServer; Override;

   private
    _DtmAlmox   : TDtmAlmoxarifado;
    _MovEstoque : TCtrlMovEstoque;
    _Almox      : TCtrlAlmox;

     FCds: TClientDataSet;

     procedure SetCds(const Value: TClientDataSet);
    {**
       Faz a chamada a Classe de Movimentação de estoque
       realizando a baixa dos produtos.
    **}
    Function  ExecutaBaixa(TipoBaixa          : TTipoBaixaDir;
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
     Property Cds : TClientDataSet read FCds write SetCds;

     Constructor Create;  Override;
     Destructor  Destroy; Override;
     {**
        Gera a lista dos itens da nota que estão disponíveis para sofrer
        baixa direta
     **}
     Function ListBaixaDireta( IdNFRecebDevol : Double ) : OleVariant;
     {**
        Pega o Centro de Custo da SCI
     **}
     Function GetCentroCustoSCI( IdItemOC : Double ) : String;
    {**
       Executa a abaixa dos itens de acordo com o sesu tipo
    **}
    Function  FazBaixarDireta( TipoBaixaDir : TTipoBaixaDir;
                               IdPessoa     : Integer ) : Boolean;

   End;

implementation

{ TCtrlBaixaDireta }

procedure TCtrlBaixaDireta.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);
  _Almox.InitializeAs(Self);

end;

constructor TCtrlBaixaDireta.Create;
begin
  inherited;
  _DtmAlmox   := TDtmAlmoxarifado.Create(nil);
  _MovEstoque := TCtrlMovEstoque.Create;
  _Almox      := TCtrlAlmox.Create;
  
end;

destructor TCtrlBaixaDireta.Destroy;
begin
  If IsAppServer Then
     FreeCds([FCds]);

  _DtmAlmox.Free;
  _MovEstoque.Free;
  _Almox.Free;
  
  inherited;
end;

function TCtrlBaixaDireta.ExecutaBaixa(TipoBaixa: TTipoBaixaDir;
  IdPessoa: Integer; Valor, Qtde: Double; CodCusteio,
  CodAlmoxOrigem: Integer; CodArtigo, CodTipoMov, CodMedida: String;
  Data: TDateTime; NumDocumento, CentroCustoOrigem: String; UnidNegoc,
  CodAlmoxTransf, CodCusteioDestino: Integer; CentroCustoDestino,
  CodTipoMovEnt: String): Boolean;
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
                                                  CentroCustoDestino,
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
                                                  CentroCustoOrigem,
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
      End;
   Except
      On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
   End;
end;

function TCtrlBaixaDireta.FazBaixarDireta(TipoBaixaDir: TTipoBaixaDir;
  IdPessoa: Integer): Boolean;
Var
   sAlmoxOrigem        : String;
   sAlmoxDestino       : String;
   iCodCusteio         : Integer;
   iCodCusteioDestino  : Integer;
   sCentroCusto        : String;
   sCentroCustoDestino : String;
   TipoMovSai          : String;
   TipoMovEnt          : String;
   iCodAlmoxTransf     : Integer;
   sCentroCustoTodos   : String;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.FazBaixarDireta (TipoBaixaDir, IdPessoa, Fcds.Data );
        If Not Result Then
           MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        Try
           StartTransaction;
           iCodAlmoxTransf := 0;
           sAlmoxDestino   := '';

           _cds.Data := _Almox.Procurar(Fcds.FieldByName('CODALMOXARIFADO').AsInteger );
            // Pega os dados do almoxarifado de origem
           sAlmoxOrigem := _cds.FieldByName('PRINCIPSECUND').AsString;
           iCodCusteio  := _cds.FieldByName('CODCUSTEIO').AsInteger;
           sCentroCusto := _cds.FieldByName('CODCENTROCUSTO').AsString;
           iCodCusteioDestino  := 0;
           sCentroCustoDestino := '';

           If TipoBaixaDir =  tbTransferencia Then
           Begin
              iCodAlmoxTransf :=  Fcds.FieldByName('CODALMOXTRANSF').AsInteger;
              _cds.Data       := _Almox.Procurar( iCodAlmoxTransf );
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

           Fcds.First;
           sCentroCustoTodos := Fcds.FieldByName('CENTROCUSTODESTINO').AsString;
           While Not Fcds.Eof Do
              Begin
                 If Fcds.FieldByName('FLAG').AsInteger > 0 Then
                    Begin
                       Case TipoBaixaDir Of
                          tbTransferencia:
                             Begin
                                IF Not ExecutaBaixa(TipoBaixaDir,IdPessoa,
                                                    0,
                                                    Fcds.FieldByName('QTDEBAIXA').AsFloat,
                                                    iCodCusteio,
                                                    Fcds.FieldByName('CODALMOXARIFADO').AsInteger,
                                                    Fcds.FieldByName('CODARTIGO').AsString,
                                                    TipoMovSai,
                                                    Fcds.FieldByName('CODMEDIDA').AsString,
                                                    Fcds.FieldByName('DATAENTDEVOL').AsDateTime,
                                                    Fcds.FieldByName('NUMNOTA').AsString,
                                                    sCentroCusto,
                                                    Fcds.FieldByName('UNIDNEGOC').AsInteger,
                                                    iCodAlmoxTransf,
                                                    iCodCusteioDestino,
                                                    sCentroCustoDestino,
                                                    TipoMovEnt )
                                Then
                                   Raise Exception.Create(MessageInfo);

                             End;
                          tbCusto:
                             Begin
                                If Trim(Fcds.FieldByName('CENTROCUSTODESTINO').AsString) <> '' Then
                                   sCentroCustoTodos :=  Fcds.FieldByName('CENTROCUSTODESTINO').AsString;

                                IF Not ExecutaBaixa(TipoBaixaDir,IdPessoa,
                                                    0,
                                                    Fcds.FieldByName('QTDEBAIXA').AsFloat,
                                                    iCodCusteio,
                                                    Fcds.FieldByName('CODALMOXARIFADO').AsInteger,
                                                    Fcds.FieldByName('CODARTIGO').AsString,
                                                    '',
                                                    Fcds.FieldByName('CODMEDIDA').AsString,
                                                    Fcds.FieldByName('DATAENTDEVOL').AsDateTime,
                                                    Fcds.FieldByName('NUMNOTA').AsString,
                                                    sCentroCustoTodos,
                                                    Fcds.FieldByName('UNIDNEGOC').AsInteger)
                                Then
                                   Raise Exception.Create(MessageInfo);

                             End;
                       End;
                    End;

                 FCds.Edit;
                 FCds.FieldByName('QTDEBAIXA').asFloat      := FCds.FieldByName('QTDERECEBDEVOL').asFloat - FCds.FieldByName('QTDEBAIXA').asFloat;
                 FCds.FieldByName('QTDERECEBDEVOL').asFloat := FCds.FieldByName('QTDEBAIXA').asFloat;
                 if FCds.FieldByName('QTDEBAIXA').asFloat = 0 then
                   FCds.FieldByName('FLAG').AsInteger    := 0
                 else
                   FCds.FieldByName('FLAG').AsInteger    := 1;

                 FCds.Post;

                 Cds.Next;
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

function TCtrlBaixaDireta.GetCentroCustoSCI(IdItemOC: Double): String;
Var
   SQL : String;
begin
   SQL := ' SELECT SC.CODCENTROCUSTO '+
          ' FROM SOLICOMP SC, '+
          '      SCITEMOC SCIT '+
          ' WHERE (SCIT.IDITEMOC = '+FloatToStr(IdItemOC)+') '+
          '   AND (SCIT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA ) ';

   _Cds.Data := GetDataPacket(SQL);

   Result :=  _Cds.FieldByName('CODCENTROCUSTO').AsString;
end;

function TCtrlBaixaDireta.ListBaixaDireta(
  IdNFRecebDevol: Double): OleVariant;
begin
   With _DtmAlmox Do
      Begin
          spListBaixaDir.Prepare;
          spListBaixaDir.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

          Result := spListBaixaDir.Data;
      End;
end;

procedure TCtrlBaixaDireta.OnCreateAppServer;
begin
  inherited;
  Fcds := TClientDataSet.Create(nil);
end;

procedure TCtrlBaixaDireta.SetCds(const Value: TClientDataSet);
begin
  FCds := Value;
end;

end.
