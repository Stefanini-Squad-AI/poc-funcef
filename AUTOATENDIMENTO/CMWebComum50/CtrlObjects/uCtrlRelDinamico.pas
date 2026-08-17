unit uCtrlRelDinamico;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, JCLStrings,
     uCmTypes, uDbRelDinamico, uCtrlWebRegra, uCtrlFuncoesAA, uMidasUtil, uCmFileUtils;

Type
  TCtrlRelDinamico = class(TCmControlObject)
  private

    FCdsRelDinamico: TCMClientDataSet;
    FDbRelDinamico: TDbRelDinamico;
    procedure SetCdsRelDinamico(const Value: TCMClientDataSet);
    procedure SetDbRelDinamico(const Value: TDbRelDinamico);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    Regra : TCtrlWebRegra;

    constructor Create; override;
    destructor Destroy; override;

    property DbRelDinamico : TDbRelDinamico read FDbRelDinamico write SetDbRelDinamico;
    property CdsRelDinamico : TCMClientDataSet read FCdsRelDinamico write SetCdsRelDinamico;

    function SelecionaRelDinamico( iIdRelDinamico : integer ) : OleVariant;
    function GravaRelDinamico( var iIdRelDinamico : integer ) : Boolean;

    //Lista os benefícios que podem ser simulados
    function ListaRelatorios : OleVariant;

    //Informa se há uma transação em abero
    function InTransaction: boolean;

    //Recupera o nome de um determinado benefício
    function DescRelDinamico( iIdRelDinamico : integer ) : String;

    //Recupera os campos ativos de uma simulação
    function RecuperaCamposAtivos( iIdRelDinamico : integer ) : OleVariant;

    //Gera os campos para o relatório
    function CamposRelDinamico( iIdPessoa, iIdRelDinamico, iFlgRollback, iIdEmpresaProp : integer ) : OleVariant;

    //Verifica se há uma simulação ativa para um benefício, que não seja a passada como parâmetro
    function ExisteRelDinamicoAtivo(iIdRelDinamico: integer): boolean;

    //Converte um DataPacket em um SQL
    function GeraSQL( oData : OleVariant ) : String;

    //Converte um conjunto de campos e resultados em um dataset em linha
    function DataToSQL( oData : OleVariant ) : OLEVariant;

  published

end;

implementation

{ TCtrlRelDinamico }


procedure TCtrlRelDinamico.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbRelDinamico.DataBaseName    := DataBaseName
  else
    FDbRelDinamico.DbAdoConnection := DbAdoConnection;

  Regra.InitializeAs( Self );
end;

constructor TCtrlRelDinamico.Create;
begin
  inherited;
  Regra             := TCtrlWebRegra.Create;
  FDbRelDinamico    := TDbRelDinamico.Create( self );
end;

destructor TCtrlRelDinamico.Destroy;
begin
  Regra.Free;
  FDbRelDinamico.Free;
  if IsAppServer then FCdsRelDinamico.Free;
  inherited;
end;

function TCtrlRelDinamico.GravaRelDinamico( var iIdRelDinamico : integer ): Boolean;
var
  Msg : String;
begin
  iIdRelDinamico := -1;

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Insert( iIdRelDinamico );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsRelDinamico, FDbRelDinamico, [], [] );

      iIdRelDinamico := FDbRelDinamico.IdRelDinamico.AsInteger;

      Msg := FDbRelDinamico.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

procedure TCtrlRelDinamico.OnCreateAppServer;
begin
  inherited;
  FCdsRelDinamico := TCMClientDataSet.Create( nil );
end;

function TCtrlRelDinamico.SelecionaRelDinamico( iIdRelDinamico : integer ) : OleVariant;
begin
  FDbRelDinamico.IdRelDinamico.AsInteger := iIdRelDinamico;
  Result := GetDataPacket( FDbRelDinamico.SSqlSelect );
end;

procedure TCtrlRelDinamico.SetCdsRelDinamico(
  const Value: TCMClientDataSet);
begin
  FCdsRelDinamico := Value;
end;

procedure TCtrlRelDinamico.SetDbRelDinamico(
  const Value: TDbRelDinamico);
begin
  FDbRelDinamico := Value;
end;


//Lista os relatórios que podem ser emitidos
function TCtrlRelDinamico.ListaRelatorios: OleVariant;
begin
  Result := GetDataPacket(
   ' select IDRELDINAMICO,              ' +
   '        DESCRELDINAMICO,            ' +
   '        QUERYINICIAL,               ' +
   '        FLGROLLBACK,                ' +
   '        FLGROLLBACK,                ' +
   '        IDREPORTS,                  ' +
   '        ORIGEMCM,                   ' +
   '        FLGTIPODEMONSTRA,           ' +
   '        HTMLDEMONSTRA               ' +
   ' from   RELDINAMICO                 ' +
   ' where  FLGATIVO    = 1             ' );
end; {ListaBeneficios}


//Recupera os campos ativos de uma simulação
function TCtrlRelDinamico.RecuperaCamposAtivos( iIdRelDinamico: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select   i.IDINPUT,                                     ' +
   '          i.TITULO,                                      ' +
   '          i.NOMEPARAREGRA,                               ' +
   '          i.FLGATIVO,                                    ' +
   '          i.FLGVISIVEL,                                  ' +
   '          i.FLGREQUERIDO,                                ' +
   '          i.TIPODADO,                                    ' +
   '          i.FORMATO,                                     ' +
   '          i.ORIGEMDADO,                                  ' +
   '          i.IDREGRAPREENCHE,                             ' +
   '          i.FLGQUERYPREENCHE,                            ' +
   '          i.QUERYPREENCHE,                               ' +
   '          i.CAMPO,                                       ' +
   '          i.VALORDEFAULT,                                ' +
   '          i.FLGPODEALTERAR,                              ' +
   '          i.IDREGRAVALIDA,                               ' +
   '          i.FLGQUERYVALIDA,                              ' +
   '          i.QUERYVALIDA,                                 ' +
   '          i.LISTAITENS,                                  ' +
   '          r.ORDEM                                        ' +
   ' from     RELDINAMICOXINPUT r,                           ' +
   '          INPUTSIMULABENEF  i                            ' +
   ' where    r.IDINPUT       = i.IDINPUT                    ' +
   '   and    i.FLGATIVO      = 1                            ' +
   '   and    r.IDRELDINAMICO = ' + IntToStr( iIdRelDinamico ) +
   ' order by r.ORDEM                                        ' );
end; {RecuperaAtivos}


//Gera os campos para simulação de benefícios
function TCtrlRelDinamico.CamposRelDinamico( iIdPessoa, iIdRelDinamico, iFlgRollback, iIdEmpresaProp : integer ): OleVariant;
var
  cdsDadosQuery,
  cdsRelDinamico,
  cdsInputRelDinamico,
  cdsJaCalculados : TCMClientDataSet;

  rAux : Real;
  dAux : TDateTime;

  sQueryInicial,
  sCampos,
  sValor,
  sFormato,
  sNomeParaRegra : string;

  i : integer;

  procedure ExecutaQuery;
  var
    sQueryOrigem : string;
  begin
    sQueryOrigem := '';

    //Se utiliza a query do processo...
    if cdsInputRelDinamico.FieldByName('FLGQUERYPREENCHE').AsInteger <> 1 then
      //...monta a query com os campos gerados até o momento (se houverem)
      sQueryOrigem := ' select ' + sCampos + ' from DUAL '

    //Se utiliza query própria...
    else
    begin

      //...monta a query com o conteúdo do campo
      sQueryOrigem := cdsInputRelDinamico.FieldByName('QUERYPREENCHE').AsString;

      //Substitui os campos "[XXX]" pelo respectivo conteúdo da query do processo
      cdsJaCalculados.First;
      while not cdsJaCalculados.Eof do
      begin
        sQueryOrigem := StringReplace( sQueryOrigem, '[' + cdsJaCalculados.FieldByName('NOMECAMPO').AsString + ']',
         QuotedStr( cdsJaCalculados.FieldByName('VALOR').AsString ), [rfReplaceAll, rfIgnoreCase] );
        cdsJaCalculados.Next;
      end;

    end;

    //Executa a query
    cdsDadosQuery.Close;
    try
      cdsDadosQuery.Data := GetDataPacket( sQueryOrigem );
    except
      if InTransaction then Rollback;
      raise Exception.Create('Query inválida. Favor entrar em contato com o Suporte Planus.');
    end;

  end;

begin
  cdsDadosQuery       := TCMClientDataSet.Create( nil );
  cdsRelDinamico      := TCMClientDataSet.Create( nil );
  cdsInputRelDinamico := TCMClientDataSet.Create( nil );
  cdsJaCalculados     := TCMClientDataSet.Create( nil );
  try

    try

      //Inicializa variáveis
      sCampos        := '';
      sValor         := '';
      sNomeParaRegra := '#';


      //Recupera dados da simulação
      cdsRelDinamico.Data := SelecionaRelDinamico( iIdRelDinamico );


      //Inicializa o dataset de campos já calculados
      cdsJaCalculados.Data := GetDataPacket(
                               ' select ' + QuotedStr( StringOfChar( 'x',  20 ) ) + ' as NOMECAMPO, ' +
                                            QuotedStr( StringOfChar( '0', 100 ) ) + ' as VALOR      ' +
                               ' from DUAL ' );
      cdsJaCalculados.Data := CopyClientDataSet( cdsJaCalculados );
      cdsJaCalculados.Delete;


      //Recupera campos
      cdsInputRelDinamico.Data := GetDataPacket(
       ' select   i.IDINPUT,                                     ' +
       '          i.TITULO,                                      ' +
       '          i.NOMEPARAREGRA,                               ' +
       '          i.FLGATIVO,                                    ' +
       '          i.FLGVISIVEL,                                  ' +
       '          i.FLGREQUERIDO,                                ' +
       '          i.TIPODADO,                                    ' +
       '          i.FORMATO,                                     ' +
       '          i.ORIGEMDADO,                                  ' +
       '          i.IDREGRAPREENCHE,                             ' +
       '          i.FLGQUERYPREENCHE,                            ' +
       '          i.QUERYPREENCHE,                               ' +
       '          i.CAMPO,                                       ' +
       '          i.VALORDEFAULT,                                ' +
       '          i.FLGPODEALTERAR,                              ' +
       '          i.IDREGRAVALIDA,                               ' +
       '          i.FLGQUERYVALIDA,                              ' +
       '          i.QUERYVALIDA,                                 ' +
       '          i.LISTAITENS,                                  ' +
       '          r.ORDEM,                                       ' +
       QuotedStr  ( 'D' ) + ' as TIPOORIGEM,                     ' +
       QuotedStr  ( StringOfChar( ' ', 100 ) ) + ' as VALOR      ' +
       ' from     RELDINAMICOXINPUT r,                           ' +
       '          INPUTSIMULABENEF  i                            ' +
       ' where    r.IDINPUT       = i.IDINPUT                    ' +
       '   and    i.FLGATIVO      = 1                            ' +
       '   and    r.IDRELDINAMICO = ' + IntToStr( iIdRelDinamico ) +
       ' order by r.ORDEM                                        ' );


      //Copia o pacote para o próprio dataset
      //(necessário para alterar dados trazidos via ADO)
      cdsInputRelDinamico.Data := CopyClientDataSet( cdsInputRelDinamico );

      //Substitui a string [IDPESSOA] pelo IDPESSOA passado como parâmetro
      sQueryInicial := StrSubst( UpperCase( cdsRelDinamico.FieldByName('QUERYINICIAL').AsString ),
       '[IDPESSOA]', IntToStr( iIdPessoa ) );

      //Inclui os campos da query na lista de campos
      cdsDadosQuery.Close;
      try
        cdsDadosQuery.Data := GetDataPacket( sQueryInicial );
      except
        raise Exception.Create('Query inicial inválida. Favor entrar em contato com o Suporte Planus.');
      end;

      //Gera um erro caso a query inicial possua mais de um registro
      if cdsDadosQuery.RecordCount > 1 then
        raise Exception.Create('A query inicial está retornando ' + IntToStr( cdsDadosQuery.RecordCount ) +
         ' registros. Não é possível efetuar simulações com mais de um registro. Favor entrar em contato com o Suporte Planus.');

      for i := 0 to ( cdsDadosQuery.Fields.Count - 1 ) do
      begin
        cdsInputRelDinamico.Insert;

        cdsInputRelDinamico.FieldByName('TITULO').AsString :=
         cdsDadosQuery.Fields[i].FieldName;

        cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').AsString :=
         cdsDadosQuery.Fields[i].FieldName;

        //Formata o valor, se não for nulo
        sValor := trim( cdsDadosQuery.Fields[i].AsString );

        if sValor <> '' then
          sValor := OraNumero( sValor )
        else
          sValor := ' ';

        cdsInputRelDinamico.FieldByName('VALOR').AsString := sValor;

        cdsInputRelDinamico.FieldByName('FLGVISIVEL').AsInteger := 0;
        cdsInputRelDinamico.FieldByName('ORDEM').AsInteger      := 0;
        cdsInputRelDinamico.FieldByName('TIPOORIGEM').AsString  := 'Q';

        //Acrescenta o nome para a regra do campo ao string de verificação de duplicidade
        sNomeParaRegra := sNomeParaRegra + cdsDadosQuery.Fields[i].FieldName + '#';

        //Se não é o primeiro, acrescenta vírgula
        if trim( sCampos ) <> '' then sCampos := sCampos + ', ';

        //Adiciona o valor calculado aos campos da query (se houver um local para tanto)
        sCampos := sCampos + QuotedStr( sValor ) + ' as ' +
         cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').AsString;

        cdsInputRelDinamico.Post;

        //Insere um registro na lista de campos já calculados
        cdsJaCalculados.Append;
        cdsJaCalculados.FieldByName('NOMECAMPO').AsString := cdsDadosQuery.Fields[i].FieldName;
        cdsJaCalculados.FieldByName('VALOR').AsString     := sValor;
        cdsJaCalculados.Post;

      end; 

      cdsDadosQuery.Close;


      //Inicia uma transação
      StartTransaction;

      //Varre os campos para preencher seus conteúdos
      cdsInputRelDinamico.First;
      while not cdsInputRelDinamico.Eof do
      begin

        //Se o campo vem da query, ao invés do cadastro, pula para o próximo campo
        if cdsInputRelDinamico.FieldByName('TIPOORIGEM').AsString = 'Q' then
        begin
          cdsInputRelDinamico.Next;
          Continue;
        end;

        //Verifica se já não há um campo incluído com o mesmo nome para regra
        if not cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').IsNull then
        begin
          if StrSearch( '#' + trim( cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').AsString ) + '#', sNomeParaRegra ) > 0 then
            raise Exception.Create('Foi encontrada duplicidade do nome "' +
             cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').AsString + '" nos campos do cálculo. ' +
             'Favor entrar em contato com o Suporte Planus.');

          //Acrescenta o nome para a regra na lista
          sNomeParaRegra := sNomeParaRegra + trim( cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').AsString ) + '#';
        end
        else
          sNomeParaRegra := sNomeParaRegra + '*#';

        sValor := '';

        //--------------- Início do processamento dos campos ---------------


        //Se a origem do campo for um VALOR DEFAULT
        if cdsInputRelDinamico.FieldByName('ORIGEMDADO').AsString = 'V' then
          sValor := cdsInputRelDinamico.FieldByName('VALORDEFAULT').AsString;


        //Se a origem do campo for um CAMPO DE QUERY
        if cdsInputRelDinamico.FieldByName('ORIGEMDADO').AsString = 'C' then
        begin

          ExecutaQuery;

          //Recupera o conteúdo do campo
          try
            sValor := trim( cdsDadosQuery.FieldByName( cdsInputRelDinamico.FieldByName('CAMPO').AsString ).AsString );
          except
            raise Exception.Create('Coluna "' + cdsInputRelDinamico.FieldByName('CAMPO').AsString +
             '" inexistente na query de origem. Favor entrar em contato com o Suporte Planus .');
          end;

          //Fecha a query
          cdsDadosQuery.Close;

        end; 



        //Se a origem do campo for um RESULTADO DE REGRA
        if cdsInputRelDinamico.FieldByName('ORIGEMDADO').AsString = 'R' then
        begin
          Regra.CdsDataSetIn.Close;

          //Preenche o ClientDataSet da Query com os dados da query local
          ExecutaQuery;
          Regra.CdsDataSetIn.Data := cdsDadosQuery.Data;

          //Executa a regra para recuperar o conteúdo do campo
          sValor := Regra.RegraString( cdsInputRelDinamico.FieldByName('IDREGRAPREENCHE').AsString, iIdEmpresaProp );

          //Fecha a query
          cdsDadosQuery.Close;
          Regra.CdsDataSetIn.Close;
        end; 


        //Verifica a validade do campo, e, se este for do tipo "Data" ou "Número",
        //formata-o adequadamente (caso haja um formato informado)
        if  ( ( ( cdsInputRelDinamico.FieldByName('TIPODADO').AsString = 'D' )
         or ( cdsInputRelDinamico.FieldByName('TIPODADO').AsString = 'N' ) )
         and ( sValor <> '' ) ) then
        begin

          //Verifica o tipo de dado para formatá-lo adequadamante
          if cdsInputRelDinamico.FieldByName('TIPODADO').AsString = 'N' then    //Número
          begin

            //Verifica se é um número válido, e gera uma exceção caso contrário
            try
              rAux := StrToFloat( OraNumeroInv( sValor ) );
            except
              raise Exception.Create('O campo "' + cdsInputRelDinamico.FieldByName('TITULO').AsString +
               '" possui um número inválido.');
            end;

            if not cdsInputRelDinamico.FieldByName('FORMATO').IsNull then
            begin
              //Troca as ',' por '.', e vice-e-versa.
              sFormato := cdsInputRelDinamico.FieldByName('FORMATO').AsString;
              sFormato := StrSubst( sFormato, '.', '§' );
              sFormato := StrSubst( sFormato, ',', '.' );
              sFormato := StrSubst( sFormato, '§', ',' );

              sValor := FormatFloat( sFormato, StrToFloat( OraNumeroInv( sValor ) ) );
            end;

          end;  {if cdsInputRelDinamico.FieldByName('TIPODADO').AsString = 'N' then}



          if cdsInputRelDinamico.FieldByName('TIPODADO').AsString = 'D' then    //Data
          begin

            //Verifica se é uma data válida, e gera uma exceção caso contrário
            try
              dAux := StrToDateTime( sValor );
            except
              raise Exception.Create('O campo "' + cdsInputRelDinamico.FieldByName('TITULO').AsString +
               '" possui uma data inválida.');
            end;

            if not cdsInputRelDinamico.FieldByName('FORMATO').IsNull then
              sValor := FormatDateTime( cdsInputRelDinamico.FieldByName('FORMATO').AsString,
               StrToDateTime( sValor ) );

          end;

        end; 

        //--------------- Término do processamento dos campos ---------------

        if sValor = '' then sValor := ' ';

        //Adiciona o valor calculado aos campos da query (se houver um local para tanto)
        if not cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').IsNull then
        begin
          //Se não é o primeiro, acrescenta vírgula
          if trim( sCampos ) <> '' then sCampos := sCampos + ', ';

          sCampos := sCampos + QuotedStr( sValor ) + ' as ' +
           cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').AsString;
        end;

        //Altera o conteúdo do campo, preenchendo-o com o valor calculado
        cdsInputRelDinamico.Edit;
        cdsInputRelDinamico.FieldByName('VALOR').AsString := sValor;
         cdsInputRelDinamico.Post;

        //Insere um registro na lista de campos já calculados
        if not cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').IsNull then
        begin
          cdsJaCalculados.Append;
          cdsJaCalculados.FieldByName('NOMECAMPO').AsString := cdsInputRelDinamico.FieldByName('NOMEPARAREGRA').AsString;
          cdsJaCalculados.FieldByName('VALOR').AsString     := sValor;
          cdsJaCalculados.Post;
        end;

        //Move para o próximo campo
        cdsInputRelDinamico.Next;

      end; 

      //Reordena o dataset
      cdsInputRelDinamico.IndexFieldNames := 'ORDEM';
      cdsInputRelDinamico.Data := CopyClientDataSet( cdsInputRelDinamico );

      //Retorna os dados dos campos devidamente alterados
      Result := cdsInputRelDinamico.Data;

      //Confirma ou cancela alterações de acordo com o FlgRollback
      if iFlgRollback = 0 then
        Commit
      else
        Rollback;

    except
      On E : Exception Do
      begin
        if InTransaction then Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;

  finally
    cdsDadosQuery.Free;
    cdsRelDinamico.Free;
    cdsInputRelDinamico.Free;
    cdsJaCalculados.Free;
  end; 

end; {CamposRelDinamico}


//Recupera a descrição de um determinado benefício
function TCtrlRelDinamico.DescRelDinamico( iIdRelDinamico : integer ) : String;
var
  cdsLocal : TCmClientDataSet;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try

    cdsLocal.Data := GetDataPacket(
     ' select DESCRELDINAMICO                                  ' +
     ' from   RELDINAMICO                                      ' +
     ' where  IDRELDINAMICO = ' + IntToStr( iIdRelDinamico ) ) ;

    Result := cdsLocal.FieldByName('DESCRELDINAMICO').AsString;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;
end;

//Verifica se há um relatório ativo, que não seja o passado como parâmetro
function TCtrlRelDinamico.ExisteRelDinamicoAtivo(iIdRelDinamico: integer): boolean;
var
  cdsLocal : TCMClientDataSet;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try

    cdsLocal.Data := GetDataPacket(
     ' select IDRELDINAMICO                                 ' +
     ' from   RELDINAMICO                                   ' +
     ' where  IDRELDINAMICO <> ' + IntToStr( iIdRelDinamico ) +
     '   and  FLGATIVO      = 1                             ' );

    Result := not cdsLocal.IsEmpty;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;

end;

function TCtrlRelDinamico.GeraSQL(oData: OleVariant): String;
var
  cdsLocal : TCMClientDataSet;
  i : integer;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := oData;

    Result := '';
    cdsLocal.First;
    while not cdsLocal.Eof do
    begin

      if Result <> '' then Result := Result + ' union ';

      Result := Result + ' select ';

      for i := 0 to ( cdsLocal.Fields.Count - 1 ) do
      begin
        Result := Result + QuotedStr( cdsLocal.Fields[i].AsString ) + ' as ' + cdsLocal.Fields[i].FieldName;
        if i <> cdsLocal.Fields.Count - 1 then Result := Result + ', ';
      end;

      Result := Result + ' from DUAL ';

      cdsLocal.Next;

    end;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlRelDinamico.InTransaction: boolean;
begin
  if DbConnectionType = cntBDE then
    Result := DataBase.InTransaction
  else
    Result := DbAdoConnection.InTransaction;
end;

function TCtrlRelDinamico.DataToSQL(oData: OleVariant): OLEVariant;
var
  cdsLocal : TCMClientDataSet;
  sSQL : string;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := oData;
    sSQL := '';
    cdsLocal.First;
    while not cdsLocal.Eof do
    begin
      if sSQL <> '' then sSQL := sSQL + ', ';
      sSQL := sSQL + QuotedStr( cdsLocal.FieldByName('VALOR').AsString ) +
       ' as ' + cdsLocal.FieldByName('NOMECAMPO').AsString;
      cdsLocal.Next;
    end;
    sSQL := ' select ' + sSQL + ' from DUAL ';
    Result := GetDataPacket( sSQL );
  finally
    cdsLocal.Free;
  end;
end;

end.

