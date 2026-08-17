{------------------------------------------------------------------------------}
{ ALTERAÇÕES                                                                   }
{------------------------------------------------------------------------------}
{
Rotina    : GerarSCI
Data      : 21/06/2004
Autor     : David Ayrolla
Pendência : 16495
Descrição : A solicitação de compra deve ser cadastrada como "NÃO ATENDIDA".
-------------------------------------------------------------------------------
}

unit uCtrlGeraSCIAuto;

interface

Uses DB, uDataBase, udbAlmox, uCmControlObject,Classes,uDbSoliComp,
     uDBItemSoli,dbclient, sysutils,uSistema, uMidasUtil, uCMTypes,
     uCtrlSoliCompra;

Const
   MSG_REQPEND_GERADA    = 'Geração das Requsições pendetes concluida';
   MSG_NAO_EXIST_REQPEND = 'Não Existem Requisições pendentes para geração';
   MSG_NAO_PREVIEW       = 'O preview não foi gerado. Gere o preview';
   MSG_SCI_GERADA        = 'Geração das SCI´S concluida';

Type
  TCtrlGeraSCIAuto = class(TCmControlObject)
  Protected
     procedure AfterInitialize; Override;
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    _DbSoliComp : TDbSoliComp;
    _DBItemSoli : TDBItemSoli;
    _SoliCompra : TCtrlSoliCompra;

    FCds: TClientDataSet;
    FCdsItem: TClientDataSet;
    procedure SetCds(const Value: TClientDataSet);
    procedure SetCdsItem(const Value: TClientDataSet);

  public
    Property Cds     : TClientDataSet read FCds write SetCds;
    Property CdsItem : TClientDataSet read FCdsItem write SetCdsItem;

    Constructor Create; Override;
    Destructor  Destroy; Override;
    //
    {**
       Gera a lista das Requisições pendente de atendimento
    **}
    Function ListReqPendente( IdPessoa : Integer ) : OleVariant;
    {**
       Gera a Lista das SCI´s
    **}
    Function ListSCI : OleVariant;
    {**
       Gera a Lista dos Itens das SCI´s
    **}
    Function ListItemSCI : OleVariant;
    {**
       Gera o preview da SCI´s que vão ser geradas
    **}
    Function PreviewSCI( IdPessoa : Integer; Bilhete : String ) : Boolean;
    {**
       Gera as SCI´s a partir do Preview realizado
    **}
    Function GerarSCI( IdPessoa        : Integer;
                       IdUsuario       : Integer;
                       CodAlmoxarifado : Integer;
                       UnidNegoc       : Integer;
                       NumRequisicao   : Double;
                       CentRespon      : String;
                       CodCentroCusto  : String;
                       IdReservaOrc    : Integer = 0 ) : Boolean;


  End;

implementation

{ TCtrlGeraSCIAuto }

procedure TCtrlGeraSCIAuto.AfterInitialize;
begin
  inherited;
  _SoliCompra.InitializeAs(Self);
  _SoliCompra.OpenTransaction := False;

end;

constructor TCtrlGeraSCIAuto.Create;
begin
  inherited;
  _DbSoliComp := TDbSoliComp.Create(Self);
  _DBItemSoli := TDBItemSoli.Create(Self);
  _SoliCompra := TCtrlSoliCompra.Create;
end;

destructor TCtrlGeraSCIAuto.Destroy;
begin
  If IsAppServer Then
     FreeCds([FCds,FCdsItem]);

  _DbSoliComp.Free;
  _DBItemSoli.Free;

  _SoliCompra.Free;
  inherited;
end;

procedure TCtrlGeraSCIAuto.DoChangeDataBase;
begin
  inherited;
  _DbSoliComp.DataBaseName := DataBaseName;
  _DBItemSoli.DataBaseName := DataBaseName;
end;

function TCtrlGeraSCIAuto.GerarSCI(IdPessoa, IdUsuario, CodAlmoxarifado,UnidNegoc : Integer;
  NumRequisicao : Double; CentRespon,CodCentroCusto: String; IdReservaOrc: Integer): Boolean;
Var
   CdsSCI     : TClientDataSet;
   CdsItemSCI : TClientDataSet;
   SQL        : TStringList;
   x          : Integer;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GerarSCIAutomatica( IdPessoa,IdUsuario,CodAlmoxarifado, UnidNegoc,
                                                         NumRequisicao,
                                                         CentRespon,CodCentroCusto,
                                                         IdReservaOrc, FCdsItem.Data );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      CdsSCI     := TClientDataSet.Create(nil);
      CdsItemSCI := TClientDataSet.Create(nil);
      SQL        := TStringList.Create;
      SQL.Clear;
      Try
         Try
            StartTransaction;

            CdsSCI.Data      := _SoliCompra.Procurar(-1);
            CdsItemSCI.Data  := _SoliCompra.GetItem(-1,-1);
            // Grava o Pai
            With CdsSCI Do
               Begin
                  Append;
                  FieldByName('IDPESSOA').asInteger        := IdPessoa;
                  FieldByName('CODALMOXARIFADO').asInteger := CodAlmoxarifado;
                  FieldByName('UNIDNEGOC').asInteger       := UnidNegoc;
                  FieldByName('CODCENTRORESPON').asString  := CentRespon;
                  FieldByName('DATAENTREGA').asDateTime    := Date;
                  FieldByName('DATAEMISSAO').asDateTime    := Date;
                  FieldByName('CODCENTROCUSTO').asString   := CodCentroCusto;
                  FieldByName('CUSTOESTOQUE').asString     := 'E';

                  FieldByName('SOLICIATENDIDA').asString   := 'F';

                  FieldByName('SOLICIACEITA').asString     := 'T';
                  FieldByName('IMPRESSO').asString         := 'F';
                  FieldByName('FLGPREPRONTA').asString     := 'S';
                  Post;
               End;

            FCdsItem.First;
            While Not(FCdsItem.Eof) Do
               Begin
                  With CdsItemSCI Do
                     Begin
                        Append;
                        FieldByName('CODARTIGO').asString      := FCdsItem.FieldByName('CODARTIGO').asString;
                        FieldByName('CODMEDIDA').asString      := FCdsItem.FieldByName('CODMEDIDA').asString;
                        FieldByName('SALDOACOMPRAR').asFloat   := FCdsItem.FieldByName('QTDEPEDIDA').AsFloat;
                        FieldByName('QTDEPEDIDA').asFloat      := FCdsItem.FieldByName('QTDEPEDIDA').AsFloat;
                        FieldByName('QTDEPENDENTE').asFloat    := FCdsItem.FieldByName('QTDEPEDIDA').AsFloat;
                        FieldByName('SOLICIACEITA').asString   := 'N';
                        FieldByName('OBSITEMSOLIC').asString   := '';
                        Post;
                     End;
                  SQL.Add(' UPDATE ITEMPEDI SET FLGSCI =''S'' '+
                          ' WHERE  (NUMREQUISICAO = '+FloatToStr(NumRequisicao)+')'+
                          '    AND (CODARTIGO = '+ QuotedStr(Copy(FCdsItem.FieldByName('CODARTIGO').asString+'                ',1,14))+')');

                  FCdsItem.Next;
               End;

            _SoliCompra.cds     := CdsSCI;
            _SoliCompra.cdsItem := CdsItemSCI;

            If Not _SoliCompra.Gravar(0,IdUsuario ,'') Then
               Raise Exception.Create( _SoliCompra.MessageInfo );

            //------------------------------------------------------------------
            // Atualiza as Requisições com já geradas
            //------------------------------------------------------------------
            For x := 0 To Pred(SQL.Count) Do
               If Not ExecSQL(SQL.Strings[x] ,True) Then
                  Raise Exception.Create( MessageInfo );

            Commit;

            MessageInfo := _SoliCompra.MessageInfo;

         except
            On E:Exception Do
             Begin
                Rollback;
                Result := False;
                MessageInfo := E.Message;
             End;
         End;
      Finally
         CdsSCI.Free;
         CdsItemSCI.Free;
         SQL.Free;
      End;
   End;
end;

function TCtrlGeraSCIAuto.ListItemSCI: OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Add('SELECT    ');
      SQL.Add('     IDITEMSOLI,   ');
      SQL.Add('     NUMSOLCOMPRA, ');
      SQL.Add('     CODARTIGO,    ');
      SQL.Add('     CODMEDIDA,    ');
      SQL.Add('     QTDEPEDIDA,   ');
      SQL.Add('     QTDEPENDENTE, ');
      SQL.Add('     QTDEPEDIDA AS SALDOACOMPRAR, ');
      SQL.Add('     (''                                                            '') AS DESCRICAO ');
      SQL.Add('FROM  ');
      SQL.Add('    ITEMSOLI ');
      SQL.Add('WHERE  (NUMSOLCOMPRA =  -1) ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlGeraSCIAuto.ListReqPendente(IdPessoa: Integer): OleVariant;
Var
   Sql : TStringList;
begin
   Sql := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add(' SELECT  ');
      Sql.Add('      RQ.NUMREQUISICAO,   ');
      Sql.Add('      RQ.DATAEMISSAO,     ');
      Sql.Add('      RQ.DATANECESSIDADE, ');
      Sql.Add('      RQ.IDEMPRESA,       ');
      Sql.Add('      RQ.CODCENTROCUSTO,  ');
      Sql.Add('      RQ.CODALMOXAORIGEM, ');
      Sql.Add('      AL.CODCENTROCUSTO AS CODCENTROCUSTOALMOX, ');
      Sql.Add('      IT.CODARTIGO,       ');
      Sql.Add('      IT.QTDEPEDIDA,      ');
      Sql.Add('      IT.CODMEDIDA,       ');
      Sql.Add('      (PR.DESCPROD || '' '' || AR.CODTAMANHO || '' '' || AR.CODCOR) AS DESCRICAO, ');
      Sql.Add('      PR.CODGRUPOPROD,    ');
      Sql.Add('      AL.DESCALMOX        ');
      Sql.Add('FROM                      ');
      Sql.Add('     REQMAT RQ,           ');
      Sql.Add('     ITEMPEDI IT,         ');
      Sql.Add('     RADINSTPROCESSO RP,  ');
      Sql.Add('     ARTIGO AR,           ');
      Sql.Add('     PRODUTO PR,          ');
      Sql.Add('     ALMOX AL             ');
      Sql.Add('WHERE                     ');
      Sql.Add('       (IT.QTDEPENDENTE > 0) ');
      Sql.Add('   AND ((IT.FLGSCI = ''N'') OR (IT.FLGSCI IS NULL))   ');
      Sql.Add('   AND (RQ.IDPESSOA = '+IntToStr(IdPessoa)+') ');
      Sql.Add('   AND ((RP.FLGOK = ''S'') OR (RQ.IDPROCESSO IS NULL)) ');
      Sql.Add('   AND (AR.CODPRODUTO = PR.CODPRODUTO)               ');
      Sql.Add('   AND (AR.CODARTIGO  = IT.CODARTIGO)                ');
      Sql.Add('   AND (RQ.IDPROCESSO = RP.IDPROCESSO(+))            ');
      Sql.Add('   AND (RQ.NUMREQUISICAO = IT.NUMREQUISICAO)         ');
      Sql.Add('   AND (RQ.CODALMOXAORIGEM = AL.CODALMOXARIFADO)     ');
      Sql.Add('ORDER BY RQ.NUMREQUISICAO, PR.CODGRUPOPROD           ');

      Result := GetDataPacket( SQL.Text );

   Finally
      SQL.Free;
   End;
end;

function TCtrlGeraSCIAuto.ListSCI: OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Add('SELECT     ');
      SQL.Add('       NUMREQUISICAO,    ');
      SQL.Add('       NUMSOLCOMPRA,     ');
      SQL.Add('       IDPESSOA,         ');
      SQL.Add('       IDEMPRESA,        ');
      SQL.Add('       CODCENTROCUSTO,   ');
      SQL.Add('       DATAEMISSAO,      ');
      SQL.Add('       DATAENTREGA,      ');
      SQL.Add('       CUSTOESTOQUE,     ');
      SQL.Add('       IMPRESSO,         ');
      SQL.Add('       CODCENTRORESPON,  ');
      SQL.Add('       UNIDNEGOC,        ');
      SQL.Add('       CODALMOXARIFADO,  ');
      SQL.Add('       FLGPREPRONTA,     ');
      SQL.Add('       IDRESERVAORCAMEN, ');
      SQL.Add('       IDPROCESSO,       ');
      SQL.Add('       SOLICIATENDIDA,   ');
      SQL.Add('       SOLICIACEITA,     ');
      SQL.Add('       (''                         '') AS DESCALMOX ');
      SQL.Add('FROM  ');
      SQL.Add('       SOLICOMP ');
      SQL.Add('WHERE           ');
      SQL.Add('     (IDPESSOA = -1 ) ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

procedure TCtrlGeraSCIAuto.OnCreateAppServer;
begin
  inherited;
  FCds     := TClientDataSet.Create(nil);
  FCdsItem := TClientDataSet.Create(nil);
end;

function TCtrlGeraSCIAuto.PreviewSCI(IdPessoa: Integer; Bilhete : String): Boolean;
Var
  rNumReq    : Double;
  sCodGrupo  : String;
  iNumSol    : LongInt;
  iMaxValor  : Integer;
  iProgresso : Integer;
begin
   Result    := True;
   rNumReq   := 0;
   iNumSol   := 0;
   iProgresso:= 0;
   sCodGrupo := '';
   _Cds.Data := ListReqPendente( IdPessoa );

   iMaxValor := _Cds.RecordCount;
   If Not _Cds.IsEmpty Then
      Begin
         _Cds.First;
         While Not _Cds.Eof Do
            Begin
               If ((rNumReq = 0 ) or (rNumReq <> _Cds.FieldByName('NUMREQUISICAO').AsFloat)) or
                    ((sCodGrupo = '') or (sCodGrupo <> _Cds.FieldByName('CODGRUPOPROD').AsString))
                 Then
                    Begin
                       Inc(iNumSol);
                       rNumReq   := _Cds.FieldByName('NUMREQUISICAO').AsFloat;
                       sCodGrupo := _Cds.FieldByName('CODGRUPOPROD').AsString;
                       FCds.Append;
                       FCds.FieldByName('NUMREQUISICAO').AsFloat     := rNumReq;
                       FCds.FieldByName('NUMSOLCOMPRA').AsFloat      := iNumSol;
                       FCds.FieldByName('IDPESSOA').AsInteger        := IdPessoa;
                       FCds.FieldByName('IDEMPRESA').AsInteger       := _Cds.FieldByName('IDEMPRESA').AsInteger;
                       FCds.FieldByName('CODCENTROCUSTO').asString   := _Cds.FieldByName('CODCENTROCUSTOALMOX').AsString;
                       FCds.FieldByName('DATAEMISSAO').AsDateTime    := _Cds.FieldByName('DATAEMISSAO').AsDateTime;
                       FCds.FieldByName('CUSTOESTOQUE').asString     := 'E';
                       FCds.FieldByName('IMPRESSO').asString         := 'F';
                       FCds.FieldByName('CODALMOXARIFADO').AsInteger := _Cds.FieldByName('CODALMOXAORIGEM').AsInteger;
                       FCds.FieldByName('FLGPREPRONTA').asString     := 'N';
                       FCds.FieldByName('DATAENTREGA').AsDateTime    := _Cds.FieldByName('DATANECESSIDADE').AsDateTime;
                       FCds.FieldByName('DESCALMOX').asString        := _Cds.FieldByName('DESCALMOX').asString;
                       FCds.FieldByName('SOLICIATENDIDA').asString   := 'F';
                       FCds.FieldByName('SOLICIACEITA').asString     := 'N';
                       FCds.FieldByName('IDRESERVAORCAMEN').Clear;
                       FCds.Post;
                    End;
               FCdsItem.Append;
               FCdsItem.FieldByName('NUMSOLCOMPRA').asFloat  := iNumSol;
               FCdsItem.FieldByName('CODARTIGO').asString    := _Cds.FieldByName('CODARTIGO').AsString;
               FCdsItem.FieldByName('CODMEDIDA').asString    := _Cds.FieldByName('CODMEDIDA').AsString;
               FCdsItem.FieldByName('QTDEPEDIDA').asFloat    := _Cds.FieldByName('QTDEPEDIDA').asFloat;
               FCdsItem.FieldByName('QTDEPENDENTE').asFloat  := _Cds.FieldByName('QTDEPEDIDA').asFloat;
               FCdsItem.FieldByName('SALDOACOMPRAR').asFloat := _Cds.FieldByName('QTDEPEDIDA').asFloat;
               FCdsItem.FieldByName('DESCRICAO').asString    := _Cds.FieldByName('DESCRICAO').AsString;
               FCdsItem.Post;

               Inc(iProgresso);

               DoProgresso([Bilhete,iMaxValor,iProgresso,'Gerando...']);

               _Cds.Next;
            End;

         MessageInfo := MSG_REQPEND_GERADA;
      End
   Else
      Begin
         Result := False;;
         MessageInfo := MSG_NAO_EXIST_REQPEND;
      End;
end;

procedure TCtrlGeraSCIAuto.SetCds(const Value: TClientDataSet);
begin
  FCds := Value;
end;

procedure TCtrlGeraSCIAuto.SetCdsItem(const Value: TClientDataSet);
begin
  FCdsItem := Value;
end;

end.
