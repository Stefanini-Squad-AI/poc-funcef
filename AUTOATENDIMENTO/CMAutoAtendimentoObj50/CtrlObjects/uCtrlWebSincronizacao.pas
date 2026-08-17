unit uCtrlWebSincronizacao;

interface

uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, JclSysUtils,
     Classes, uCmTypes, uCtrlWebTransfDados, uCtrlWebLogAlteracao, JCLStrings;

type
  TCtrlWebSincronizacao = class(TCmControlObject)
  private
    FCdsWebLogAlteracao: TCMClientDataSet;
    FCdsWebTransfDados: TCMClientDataSet;
    FWebLogAlteracao: TCtrlWebLogAlteracao;
    FWebTransfDados: TCtrlWebTransfDados;
    procedure SetCdsWebLogAlteracao(const Value: TCMClientDataSet);
    procedure SetCdsWebTransfDados(const Value: TCMClientDataSet);
    procedure SetWebLogAlteracao(const Value: TCtrlWebLogAlteracao);
    procedure SetWebTransfDados(const Value: TCtrlWebTransfDados);

    //Monta os comandos "Delete"
    function MontaDelete( sTabela, sChavePrimaria : String ) : String;

    //Monta os comandos "Update"
    function MontaUpdate( sTabela, sChavePrimaria : String; sCampos, sValores : TStringList ) : String;

    //Monta os comandos "Insert"
    function MontaInsert( sTabela, sChavePrimaria : String; sCampos, sValores : TStringList ) : String;

    //Monta a cláusula "where" dos comandos SQL
    function MontaWhere( sChavePrimaria, sTabela : String ) : String;

    //Monta atribuição
    function MontaAtribuicao( sNomeCampo, sConteudo, sTabela : String ) : String;

    //"Formata" um conteúdo de acordo com o tipo do campo
    function MontaConteudo( sNomeCampo, sConteudo, sTabela : string ) : string;
  protected

    procedure AfterInitialize; Override;

    //Recupera o tipo de um campo
    function TipoCampo( sNomeCampo, sTabela : String ) : String;

  public

    constructor Create; override;
    destructor Destroy; override;

    property CdsWebTransfDados   : TCMClientDataSet read FCdsWebTransfDados write SetCdsWebTransfDados;
    property CdsWebLogAlteracao  : TCMClientDataSet read FCdsWebLogAlteracao write SetCdsWebLogAlteracao;
    property WebTransfDados      : TCtrlWebTransfDados read FWebTransfDados write SetWebTransfDados;
    property WebLogAlteracao     : TCtrlWebLogAlteracao read FWebLogAlteracao write SetWebLogAlteracao;

    //Rotina de sincronização de dados
    function Sincroniza( iWebTransfDados : integer ) : boolean;

  published

end;

implementation

{ TCtrlWebSincronizacao }

procedure TCtrlWebSincronizacao.AfterInitialize;
begin
  inherited;
  FWebTransfDados.InitializeAs( Self );
  FWebLogAlteracao.InitializeAs( Self );
end;

constructor TCtrlWebSincronizacao.Create;
begin
  inherited;
  //Cria os CtrlObjects utilizados
  FWebTransfDados     := TCtrlWebTransfDados.Create;
  FWebLogAlteracao    := TCtrlWebLogAlteracao.Create;

  //Cria e "aponta" os clientdatasets para os CtrlObjects
  FCdsWebTransfDados  := TCMClientDataSet.Create(nil);
  FCdsWebLogAlteracao := TCMClientDataSet.Create(nil);
  FWebTransfDados.CdsWebTransfDados   := FCdsWebTransfDados;
  FWebLogAlteracao.CdsWebLogAlteracao := FCdsWebLogAlteracao;
end;

destructor TCtrlWebSincronizacao.Destroy;
begin
  FWebTransfDados.Free;
  FWebLogAlteracao.Free;
  FCdsWebTransfDados.Free;
  FCdsWebLogAlteracao.Free;
end;


//Monta atribuição
function TCtrlWebSincronizacao.MontaAtribuicao(sNomeCampo, sConteudo, sTabela: String): String;
begin
  sNomeCampo := UpperCase( sNomeCampo );
  Result := sNomeCampo + ' = ' + MontaConteudo( sNomeCampo, sConteudo, sTabela );
end;


//"Formata" um conteúdo de acordo com o tipo do campo
function TCtrlWebSincronizacao.MontaConteudo( sNomeCampo, sConteudo, sTabela : string ) : string;
var
  sTipo : string;
  sAux : string;
  iPos : integer;
begin
  sTipo := TipoCampo( sNomeCampo, sTabela );
  Result := sConteudo;

  //Campo string
  if ( sTipo  = 'CHAR' ) or ( sTipo  = 'VARCHAR2' ) then
    Result := QuotedStr( Result )
  else
    if ( sTipo  = 'DATE' ) then
    begin
      iPos   := Pos( '-', Result );
      sAux   := Copy( Result, 1, iPos - 1 );
      Result := StrRight( Result, length( Result ) - iPos );
      iPos   := Pos( '-', Result );
      sAux   := Copy( Result, 1, iPos - 1 ) + '/' + sAux;
      Result := StrRight( Result, length( Result ) - iPos );
      iPos   := Pos( ' ', Result );
      sAux   := Copy( Result, 1, iPos - 1 ) + '/' + sAux;
      Result := 'TO_DATE( ' + QuotedStr( sAux ) + ' )';
    end;
end;


//Monta os comandos "Delete"
function TCtrlWebSincronizacao.MontaDelete(sTabela,
  sChavePrimaria: String): String;
begin
  Result := 'delete from ' + UpperCase( trim( sTabela ) ) + ' ' + MontaWhere( sChavePrimaria, sTabela );
end;


//Monta os comandos "Insert"
function TCtrlWebSincronizacao.MontaInsert(sTabela, sChavePrimaria: String;
  sCampos, sValores: TStringList): String;
var
  iQtde, iCont : integer;
  sFields, sContents : string;
begin
  sFields := '';
  sContents := '';
  iQtde := sCampos.Count - 1;

  for iCont := 0 to iQtde do
  begin
    sFields   := sFields   + sCampos.Strings[iCont]  + ', ';
    sContents := sContents + MontaConteudo( sCampos.Strings[iCont],
     sValores.Strings[iCont], sTabela ) + ', ';
  end;

  sFields   := StrLeft( sFields,   length( sFields   ) - 2 );
  sContents := StrLeft( sContents, length( sContents ) - 2 );

  Result := 'insert into ' + UpperCase( trim( sTabela ) ) + ' ( '+ sFields + ' ) values ( ' +
   sContents + ' ) ';
end;

//Monta os comandos "Update"
function TCtrlWebSincronizacao.MontaUpdate(sTabela, sChavePrimaria: String;
  sCampos, sValores: TStringList): String;
var
  iQtde, iCont : integer;
  sFields : string;
begin
  sFields := '';
  iQtde := sCampos.Count - 1;

  for iCont := 0 to iQtde do
  begin
    sFields := sFields + ' ' + MontaAtribuicao( sCampos.Strings[iCont],
     sValores.Strings[iCont], sTabela ) + ', ';
  end;

  sFields := StrLeft( sFields, length( sFields ) - 2 );

  Result := 'update ' + UpperCase( trim( sTabela ) ) + ' set ' + sFields +
   MontaWhere( sChavePrimaria, sTabela );
end;

//Monta a cláusula "where" dos comandos SQL
function TCtrlWebSincronizacao.MontaWhere(sChavePrimaria, sTabela: String): String;
var
  sAux, sChave, sConteudo : String;
  iPos : integer;
begin
  Result    := '';
  sChave    := '';
  sConteudo := '';
  sAux := trim( sChavePrimaria );

  if sAux = '' then exit;

  repeat
    sAux := StrRight( sAux, length( sAux ) - 1 );
    iPos := Pos( '/', sAux );
    if iPos > 0 then
    begin
      sChave := StrLeft( sAux, iPos - 1 );
      sAux   := StrRight( sAux, length( sAux ) - iPos + 1 )
    end
    else
    begin
      sChave := sAux;
      sAux   := '';
    end;

    iPos := Pos( ':', sChave );

    sConteudo := StrRight( sChave, length( sChave ) - iPos );
    sChave    := UpperCase( StrLeft( sChave, iPos - 1 ) );

    sChave    := MontaAtribuicao( sChave, sConteudo, sTabela );

    Result := Result + ' ' + iff( Result <> '', ' and ', '' ) + ' ' + sChave;

  until sAux = '';

  Result := iff( Result <> '', ' where ', '' ) + Result;
end;

procedure TCtrlWebSincronizacao.SetCdsWebLogAlteracao(
  const Value: TCMClientDataSet);
begin
  FCdsWebLogAlteracao := Value;
end;

procedure TCtrlWebSincronizacao.SetCdsWebTransfDados(
  const Value: TCMClientDataSet);
begin
  FCdsWebTransfDados := Value;
end;

procedure TCtrlWebSincronizacao.SetWebLogAlteracao(
  const Value: TCtrlWebLogAlteracao);
begin
  FWebLogAlteracao := Value;
end;

procedure TCtrlWebSincronizacao.SetWebTransfDados(
  const Value: TCtrlWebTransfDados);
begin
  FWebTransfDados := Value;
end;

//Rotina de sincronização de dados
function TCtrlWebSincronizacao.Sincroniza( iWebTransfDados: integer ): boolean;
var
  sComandos, sCampos, sValores  : TStringList;
  iLote : integer;
  i : integer;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.Sincroniza( iWebTransfDados )
  else
  begin

    Result := False;

    sComandos := TStringList.Create;
    sCampos   := TStringList.Create;
    sValores  := TStringList.Create;

    try    //finally

      try  //expect

        //Recupera os dados da transferência
        FCdsWebTransfDados.Data  := WebTransfDados.SelecionaWebTransfDados( iWebTransfDados );

        //Verifica se a transferência realmente existe
        if FCdsWebTransfDados.IsEmpty then
          raise Exception.Create('Número de transferência inexistente.');

        //Recupera os dados das alterações
        FCdsWebLogAlteracao.Data :=
         WebLogAlteracao.SelecionaWebLogAlteracaoPorWebTransfDados( iWebTransfDados );

        //Se houverem aletarações a serem sincronizadas
        if not FCdsWebLogAlteracao.IsEmpty then
        begin

          //Varre o dataset de alterações
          FCdsWebLogAlteracao.First;
          while not FCdsWebLogAlteracao.Eof do
          begin
            sCampos.Clear;
            sValores.Clear;

            //Delete
            if FCdsWebLogAlteracao.FieldByName('OPERACAO').AsString = 'D' then
            begin
              sComandos.Add( MontaDelete( UpperCase( FCdsWebLogAlteracao.FieldByName('TABELA').AsString ),
                                          FCdsWebLogAlteracao.FieldByName('CHAVEPRIMARIA').AsString ) );
            end
            else
            begin

              //Monta os campos de todo um "lote"
              iLote := FCdsWebLogAlteracao.FieldByName('LOTE').AsInteger;
              while ( FCdsWebLogAlteracao.FieldByName('LOTE').AsInteger = iLote )
                and ( not FCdsWebLogAlteracao.eof ) do
              begin
                sCampos.Add( FCdsWebLogAlteracao.FieldByName('NOMECAMPO').AsString );
                sValores.Add( FCdsWebLogAlteracao.FieldByName('VALORATUAL').AsString );
                FCdsWebLogAlteracao.Next;
              end;
              if not FCdsWebLogAlteracao.eof then FCdsWebLogAlteracao.Prior;

              //Update
              if FCdsWebLogAlteracao.FieldByName('OPERACAO').AsString = 'U' then
                sComandos.Add( MontaUpdate( UpperCase( FCdsWebLogAlteracao.FieldByName('TABELA').AsString ),
                                            FCdsWebLogAlteracao.FieldByName('CHAVEPRIMARIA').AsString,
                                            sCampos, sValores ) )
              else
                sComandos.Add( MontaInsert( UpperCase( FCdsWebLogAlteracao.FieldByName('TABELA').AsString ),
                                            FCdsWebLogAlteracao.FieldByName('CHAVEPRIMARIA').AsString,
                                            sCampos, sValores ) );
            end;

            FCdsWebLogAlteracao.Next;
          end;
        end;

        StartTransaction;

        //Executa os comandos, um a um
        for i := 0 to sComandos.Count - 1 do
        begin
          Result := ExecSQL( sComandos.Strings[i] );
          if not result then break;
        end;

        if Result then
        begin

          //Atualiza a situação da transferência para "sincronizada".
          FCdsWebTransfDados.Edit;
          FCdsWebTransfDados.FieldByName('SITUACAO').AsString := '3';
          FCdsWebTransfDados.Post;

          //Grava a transferência
          Result := FWebTransfDados.GravaWebTransfDados( False );

          if not Result then
            raise Exception.Create( FWebTransfDados.MessageInfo );

          Commit;
          
        end
        else
          Rollback;

      except
        On E:Exception do
        begin
          Rollback;
          MessageInfo := E.Message;
          Result := False;
        end;
      end;

    finally
      sComandos.Free;
      sCampos.Free;
      sValores.Free;
    end;

  end;
end;

//Recupera o tipo de um campo
function TCtrlWebSincronizacao.TipoCampo( sNomeCampo, sTabela: String ): String;
var
  sSQL : string;
  cdsAll_TAB_COLUMNS : TCMClientDataSet;
begin
  cdsAll_TAB_COLUMNS := TCMClientDataSet.Create( nil );
  try
    sSQL := ' select DATA_TYPE                               ' +
            '   from ALL_TAB_COLUMNS                         ' +
            '  where upper( TABLE_NAME  ) = ' + QuotedStr( UpperCase( sTabela  ) )   +
            '    and upper( COLUMN_NAME ) = ' + QuotedStr( UpperCase( sNomeCampo ) );

    cdsAll_TAB_COLUMNS.Data := GetDataPacket( sSQL );

    Result := cdsAll_TAB_COLUMNS.FieldByName('DATA_TYPE').AsString;
  finally
    cdsAll_TAB_COLUMNS.Free;
  end;
end;

end.
