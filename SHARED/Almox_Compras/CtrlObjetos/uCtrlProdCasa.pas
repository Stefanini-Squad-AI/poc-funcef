unit uCtrlProdCasa;

interface
Uses DB, Classes, uDataBase,uCmDbObject, uCmControlObject,
     uMidasUtil, sysUtils, dbclient, uSistema, uCtrlAlmox,
     uCtrlMovEstoque, DAlmoxarifado,uCmTypes, uCtrlUnMedida;

Type
  TTipoProdCasa = (tpcBaixaFichTec, tpcBaixaItem);

  TCtrlProdCasa = class(TCmControlObject)
  Protected
    Procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    _MovEstoque : TCtrlMovEstoque;
    _Almox      : TCtrlAlmox;
    _DtmAlmox   : TDtmAlmoxarifado;
    _UnMedida   : TCtrlUnMedida;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
  Public
    Property cds : TClientDataSet read Fcds write Setcds;
   //-------------------------------------------------------------
   // Métodos
   //-------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    {**
       Gera uma lista dos artigos que são fichas técnicas
    **}
    Function ListProdCasa( Tipo       : TTipoProdCasa;
                           CodCusteio : Integer) : OleVariant;

    {**
       Executa a operação de baixa dos produtos feitos na casa
    **}
    Function  BaixaProdCasa( TipoBaixa          : TTipoProdCasa;
                             IdPessoa           : Integer;
                             Valor              : Double;
                             Qtde               : Double;
                             CodAlmoxOrigem     : longint;
                             CodArtigo          : String;
                             CodMedida          : String;
                             Data               : TDateTime;
                             NumDocumento       : String;
                             UnidNegoc          : longint;
                             CodAlmoxTransf     : longint = 0;
                             CodArtigoElab      : String = '';
                             CodMedidaElab      : String = '';
                             QtdeElab           : Double = 0 ) : Boolean;

   {**
      Gera uma lista com os itens que compões a ficha técnica.
   **}
   Function ListItemFichaTec ( CodArtigo : String;
                               CodCusteio : Integer ) : OleVariant;


  End;

implementation

{ TCtrlReqManual }

procedure TCtrlProdCasa.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs( Self );
  _Almox.InitializeAs( Self );
  _UnMedida.InitializeAs( Self );

end;

function TCtrlProdCasa.BaixaProdCasa(TipoBaixa: TTipoProdCasa;
  IdPessoa: Integer; Valor, Qtde: Double; CodAlmoxOrigem: Integer; CodArtigo,
  CodMedida: String; Data: TDateTime;  NumDocumento : String;
  UnidNegoc, CodAlmoxTransf : Integer; CodArtigoElab, CodMedidaElab: String;
  QtdeElab : Double): Boolean;
Var
   iCodCusteio         : Integer;
   iCodCusteioDestino  : Integer;
   sCentroCusto        : String;
   sCentroCustoDestino : String;
   rValor              : Double;
   rQtde               : Double;
   IdMov,IdMovS        : Double;
   SQL                 : String;
   sMovList            : String;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.BaixaProdCasa(TipoBaixa,IdPessoa,Valor,Qtde,CodAlmoxOrigem,CodArtigo,
                                                   CodMedida,Data,NumDocumento,UnidNegoc,CodAlmoxTransf,
                                                   CodArtigoElab,CodMedidaElab );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

          _cds.Data := _Almox.Procurar( CodAlmoxOrigem );
          // Pega os dados do almoxarifado de origem
         iCodCusteio  := _cds.FieldByName('CODCUSTEIO').AsInteger;
         sCentroCusto := _cds.FieldByName('CODCENTROCUSTO').AsString;

         _cds.Data  := _Almox.Procurar( CodAlmoxTransf );
         // Pega os dados do almoxarifado de destino
         iCodCusteioDestino  := _cds.FieldByName('CODCUSTEIO').AsInteger;
         sCentroCustoDestino := _cds.FieldByName('CODCENTROCUSTO').AsString;
//---------------------------------------------------------------------------------
// BAIXA POR ITEM
//---------------------------------------------------------------------------------
         If TipoBaixa = tpcBaixaItem Then
            Begin
               IdMovS := _MovEstoque.GeraMovimento(tlSaida,
                                                  IdPessoa,
                                                  Valor,
                                                  Qtde,
                                                  iCodCusteio,
                                                  CodAlmoxOrigem,
                                                  Codartigo,
                                                  '',
                                                  'O',
                                                  CodMedida,
                                                  0,
                                                  Data,
                                                  NumDocumento,
                                                  sCentroCusto,
                                                  IdPessoa,
                                                  CodAlmoxTransf,
                                                  UnidNegoc);

               If IdMovS < 0 Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );

               SQL := 'SELECT VALORMOV*(-1) AS VALOR FROM MOVIMENT WHERE (IDMOV = '+FloatToStr(IdMovS)+')';
               _cds.Data := GetDataPacket( SQL );

               Valor := _cds.fieldByName('VALOR').AsFloat;
               //------------------------------------------------------------------
               // Efetua a entrada do almoxarifado Destino
               //------------------------------------------------------------------
               IdMov := _MovEstoque.GeraMovimento(tlEntrada,
                                                  IdPessoa,
                                                  Valor,
                                                  QtdeElab,
                                                  iCodCusteioDestino,
                                                  CodAlmoxTransf,
                                                  CodartigoElab,
                                                  '',
                                                  'C',
                                                  CodMedidaElab,
                                                  0,
                                                  Data,
                                                  NumDocumento,
                                                  sCentroCustoDestino,
                                                  IdPessoa,
                                                  CodAlmoxOrigem,
                                                  UnidNegoc);
               If IdMov < 0 Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );

               If Not _MovEstoque.updMovimento(IdMovS, IdMov,-1) Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );
            End
//---------------------------------------------------------------------------------
// BAIXA POR FICHA TÉCNICA
//---------------------------------------------------------------------------------
         Else
            Begin
               _cds.Data := ListItemFichaTec( CodArtigo, iCodCusteio );
               _cds.First;
               rValor   := 0;
               sMovList := '(';
               While Not _cds.Eof Do
                  Begin
                      rQtde := _UnMedida.QtdeToUnCustoMedio(_cds.FieldByName('CODARTIGO').AsString,
                                                            _cds.FieldByName('CODMEDIDA').AsString,
                                                            _cds.FieldByName('QTDE').AsFloat * Qtde);

                      rValor := rValor + (rQtde * _cds.FieldByName('CUSTOMEDIO').AsFloat);

                      IdMov := _MovEstoque.GeraMovimento(tlSaida,
                                                         IdPessoa,
                                                         rQtde * _cds.FieldByName('CUSTOMEDIO').AsFloat,
                                                         _cds.FieldByName('QTDE').AsFloat * Qtde,
                                                         iCodCusteio,
                                                         CodAlmoxOrigem,
                                                         _cds.FieldByName('CODARTIGO').AsString,
                                                         '',
                                                         'O',
                                                         _cds.FieldByName('CODMEDIDA').AsString,
                                                         0,
                                                         Data,
                                                         NumDocumento,
                                                         sCentroCusto,
                                                         IdPessoa,
                                                         CodAlmoxTransf,
                                                         UnidNegoc);

                      If IdMov < 0 Then
                         Raise Exception.Create( _MovEstoque.MessageInfo );

                      sMovList := sMovList + FloatToStr(idMov)+',';

                     _cds.Next;
                  End;

                  sMovList := Copy(sMovList,1,length(sMovList)-1) +')';

                  //------------------------------------------------------------------
                  // Efetua a entrada do Artigo principal da ficha técinica
                  // no almoxarifado Destino
                  //------------------------------------------------------------------
                  IdMov := _MovEstoque.GeraMovimento(tlEntrada,
                                                     IdPessoa,
                                                     rValor,
                                                     Qtde,
                                                     iCodCusteioDestino,
                                                     CodAlmoxTransf,
                                                     Codartigo,
                                                     '',
                                                     'C',
                                                     CodMedida,
                                                     0,
                                                     Data,
                                                     NumDocumento,
                                                     sCentroCustoDestino,
                                                     IdPessoa,
                                                     CodAlmoxOrigem,
                                                     UnidNegoc);
                  If IdMov < 0 Then
                     Raise Exception.Create( _MovEstoque.MessageInfo );
                  //---------------------------------------------------------------------------------------------------
                  // Associa os movimentos de saida dos itens que compõem a
                  // a ficha técnica
                  //---------------------------------------------------------------------------------------------------
                  SQL := 'UPDATE MOVIMENT SET IDMOVENTRADA = '+FloatToStr(IdMov)+' WHERE ( IDMOV IN'+sMovList+')';
                  If Not ExecSQL(SQL,True) Then
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

constructor TCtrlProdCasa.Create;
begin
  inherited;
  _MovEstoque := TCtrlMovEstoque.Create;
  _Almox      := TCtrlAlmox.Create;
  _UnMedida   := TCtrlUnMedida.Create;

  _DtmAlmox   := TDtmAlmoxarifado.Create(nil);

end;

destructor TCtrlProdCasa.Destroy;
begin
  If IsAppServer Then
     FreeCds([Fcds]);

  _MovEstoque.Free;
  _Almox.Free;
  _UnMedida.Free;
  _DtmAlmox.Free;

  inherited;

end;

procedure TCtrlProdCasa.DoChangeDataBase;
begin
  inherited;
  _MovEstoque.DataBase := DataBase;
  _Almox.DataBase      := DataBase;
  _UnMedida.DataBase   := DataBase;
end;

function TCtrlProdCasa.ListItemFichaTec(CodArtigo: String;
  CodCusteio: Integer): OleVariant;
Var
  SQL : TStringList;
Begin
   CodArtigo := Copy(CodArtigo + '                 ',1,14);
   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add(' SELECT                 ');
      Sql.Add('     FT.CODARTIGOSEC AS CODARTIGO,  ');
      Sql.Add('     FT.QTDE,           ');
      Sql.Add('     FT.CODMEDIDA,      ');
      Sql.Add('     CM.CUSTOMEDIO      ');
      Sql.Add('FROM                    ');
      Sql.Add('     FICHTECN FT,       ');
      Sql.Add('     CUSTOMED CM        ');
      Sql.Add('WHERE                   ');
      Sql.Add('      (FT.CODARTIGOPRINC = '+QuotedStr(CodArtigo)+') ');
      Sql.Add('  AND (CM.CODCUSTEIO(+) = '+IntToStr(CodCusteio)+') ');
      Sql.Add('  AND (CM.CODARTIGO = FT.CODARTIGOSEC)  ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlProdCasa.ListProdCasa(Tipo: TTipoProdCasa;
  CodCusteio: Integer): OleVariant;
Var
  SQL : TStringList;
Begin
   SQL := TStringList.Create;
   Try
      Case Tipo Of
         tpcBaixaFichTec :
             Begin
               Sql.Clear;
               Sql.Add(' SELECT                                                                       ');
               Sql.Add('       A.CODARTIGO,                                                           ');
               Sql.Add('       P.CODPRODUTO,                                                          ');
               Sql.Add('       P.CODMEDCUSTO,                                                         ');
               Sql.Add('      (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO,');
               Sql.Add('       (0) AS CUSTOMEDIO                                                      ');
               Sql.Add(' FROM                                                                         ');
               Sql.Add('      ARTIGO A,                                                               ');
               Sql.Add('      PRODUTO P,                                                              ');
               Sql.Add('      FICHTECN FT                                                             ');
               Sql.Add(' WHERE         ');
               Sql.Add('        (((A.FLGBLOQUEADO <> ''R'') AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL)) ');
               Sql.Add('    AND (A.FLGATIVO = ''S'') ');
               Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)                                         ');
               Sql.Add('    AND (A.CODARTIGO = FT.CODARTIGOPRINC)                                     ');
               Sql.Add(' GROUP BY                                                                     ');
               Sql.Add('        A.CODARTIGO,                                                          ');
               Sql.Add('        P.CODPRODUTO,                                                         ');               
               Sql.Add('        P.CODMEDCUSTO,                                                        ');
               Sql.Add('       (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR)             ');
               Sql.Add(' ORDER BY DESCRICAO                                                           ');
             End;
         tpcBaixaItem :
             Begin
               Sql.Clear;
               Sql.Add(' SELECT                                                                       ');
               Sql.Add('       A.CODARTIGO,                                                           ');
               Sql.Add('       P.CODPRODUTO,                                                          ');
               Sql.Add('       P.CODMEDCUSTO,                                                         ');
               Sql.Add('      (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO,');
               Sql.Add('       C.CUSTOMEDIO                                                           ');
               Sql.Add(' FROM                                                                         ');
               Sql.Add('      ARTIGO A,                                                               ');
               Sql.Add('      PRODUTO P,                                                              ');
               Sql.Add('      CUSTOMED C                                                              ');
               Sql.Add(' WHERE                                                                        ');
               Sql.Add('     (((A.FLGBLOQUEADO <> ''R'') AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL)) ');
               Sql.Add('    AND (A.FLGATIVO = ''S'') ');
               Sql.Add(' AND (C.CODCUSTEIO = '+IntToStr(CodCusteio)+')     ');
               Sql.Add(' AND (A.CODPRODUTO = P.CODPRODUTO)                                            ');
               Sql.Add(' AND (A.CODARTIGO = C.CODARTIGO)                                              ');
               Sql.Add(' ORDER BY DESCRICAO                                                           ');
             End;
      End;
      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

procedure TCtrlProdCasa.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

procedure TCtrlProdCasa.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.


