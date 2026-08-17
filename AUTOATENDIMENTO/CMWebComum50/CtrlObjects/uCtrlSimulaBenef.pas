unit uCtrlSimulaBenef;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, JCLStrings,
     uCmTypes, uDbSimulaBenef, uCtrlWebRegra, uCtrlFuncoesAA, uMidasUtil, uCmFileUtils;

Type
  TCtrlSimulaBenef = class(TCmControlObject)
  private

    FCdsSimulaBenef: TCMClientDataSet;
    FDbSimulaBenef: TDbSimulaBenef;
    procedure SetCdsSimulaBenef(const Value: TCMClientDataSet);
    procedure SetDbSimulaBenef(const Value: TDbSimulaBenef);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    Regra : TCtrlWebRegra;

    constructor Create; override;
    destructor Destroy; override;

    property DbSimulaBenef : TDbSimulaBenef read FDbSimulaBenef write SetDbSimulaBenef;
    property CdsSimulaBenef : TCMClientDataSet read FCdsSimulaBenef write SetCdsSimulaBenef;

    function SelecionaSimulaBenef( iIdSimulaBenef : integer ) : OleVariant;
    function GravaSimulaBenef( var iIdSimulaBenef : integer ) : Boolean;

    //Lista os benefícios que podem ser simulados
    function ListaBeneficios : OleVariant;

    //Informa se há uma transação em abero
    function InTransaction: boolean;

    //Recupera o nome de um determinado benefício
    function NomeBeneficio( iIdSimulaBenef : integer ) : String;

    //Recupera os campos ativos de uma simulação
    function RecuperaCamposAtivos( iIdSimulaBenef : integer ) : OleVariant;

    //Gera os campos para simulação de benefícios
    function CamposSimulaBenef( iIdPessoa, iIdSimulaBenef, iFlgRollback, iIdEmpresaProp : integer ) : OleVariant;

    //Gera os resultados da simulação de benefícios
    function ResultSimulaBenef( iIdPessoa, iIdSimulaBenef, iFlgRollback, iIdEmpresaProp : integer; oCampos : OLEVariant ) : OleVariant;

    //Verifica se há uma simulação ativa para um benefício, que não seja a passada como parâmetro
    function ExisteSimulacaoAtiva( iIdBeneficio, iIdSimulaBenef : integer ) : boolean;

    //Converte um DataPacket em um SQL
    function GeraSQL( oData : OleVariant ) : String;

    //Converte um conjunto de campos e resultados em um dataset em linha
    function DataToSQL( oData : OleVariant ) : OLEVariant;

  published

end;

implementation

{ TCtrlSimulaBenef }


procedure TCtrlSimulaBenef.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbSimulaBenef.DataBaseName    := DataBaseName
  else
    FDbSimulaBenef.DbAdoConnection := DbAdoConnection;

  Regra.InitializeAs( Self );
end;

constructor TCtrlSimulaBenef.Create;
begin
  inherited;
  Regra             := TCtrlWebRegra.Create;
  FDbSimulaBenef    := TDbSimulaBenef.Create( self );
end;

destructor TCtrlSimulaBenef.Destroy;
begin
  Regra.Free;
  FDbSimulaBenef.Free;
  if IsAppServer then FCdsSimulaBenef.Free;
  inherited;
end;

function TCtrlSimulaBenef.GravaSimulaBenef( var iIdSimulaBenef : integer ): Boolean;
var
  Msg : String;
begin
  iIdSimulaBenef := -1;

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Insert( iIdSimulaBenef );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsSimulaBenef, FDbSimulaBenef, [], [] );

      iIdSimulaBenef := FDbSimulaBenef.Idsimulabenef.AsInteger;      

      Msg := FDbSimulaBenef.MessageInfo;

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

procedure TCtrlSimulaBenef.OnCreateAppServer;
begin
  inherited;
  FCdsSimulaBenef := TCMClientDataSet.Create( nil );
end;

function TCtrlSimulaBenef.SelecionaSimulaBenef( iIdSimulaBenef : integer ) : OleVariant;
begin
  FDbSimulaBenef.IdSimulaBenef.AsInteger := iIdSimulaBenef;
  Result := GetDataPacket( FDbSimulaBenef.SSqlSelect );
end;

procedure TCtrlSimulaBenef.SetCdsSimulaBenef(
  const Value: TCMClientDataSet);
begin
  FCdsSimulaBenef := Value;
end;

procedure TCtrlSimulaBenef.SetDbSimulaBenef(
  const Value: TDbSimulaBenef);
begin
  FDbSimulaBenef := Value;
end;


//Lista os benefícios que podem ser simulados
function TCtrlSimulaBenef.ListaBeneficios: OleVariant;
begin
  Result := GetDataPacket(
   ' select s.IDSIMULABENEF,              ' +
   '        s.IDBENEFICIO,                ' +
   '        s.QUERYINICIAL,               ' +
   '        s.FLGROLLBACK,                ' +
   '        b.NOME,                       ' +
   '        s.FLGROLLBACK,                ' +
   '        s.IDREPORTS,                  ' +
   '        s.ORIGEMCM,                   ' +
   '        s.FLGTIPODEMONSTRA,           ' +
   '        s.HTMLDEMONSTRA               ' +
   ' from   SIMULABENEF s,                ' +
   '        BENEFICIO   b                 ' +
   ' where  s.FLGATIVO    = 1             ' +
   '   and  s.IDBENEFICIO = b.IDBENEFICIO ' );
end; {ListaBeneficios}


//Recupera os campos ativos de uma simulação
function TCtrlSimulaBenef.RecuperaCamposAtivos( iIdSimulaBenef: integer): OleVariant;
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
   '          s.ORDEM                                        ' +
   ' from     SIMULABENEFXINPUT s,                           ' +
   '          INPUTSIMULABENEF  i                            ' +
   ' where    s.IDINPUT       = i.IDINPUT                    ' +
   '   and    i.FLGATIVO      = 1                            ' +
   '   and    s.IDSIMULABENEF = ' + IntToStr( iIdSimulaBenef ) +
   ' order by s.ORDEM                                        ' );
end; {RecuperaAtivos}


//Gera os campos para simulação de benefícios
function TCtrlSimulaBenef.CamposSimulaBenef( iIdPessoa, iIdSimulaBenef, iFlgRollback, iIdEmpresaProp : integer ): OleVariant;
var
  cdsDadosQuery,
  cdsSimulaBenef,
  cdsInputSimulaBenef,
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
    if cdsInputSimulaBenef.FieldByName('FLGQUERYPREENCHE').AsInteger <> 1 then
      //...monta a query com os campos gerados até o momento (se houverem)
      sQueryOrigem := ' select ' + sCampos + ' from DUAL '

    //Se utiliza query própria...
    else
    begin

      //...monta a query com o conteúdo do campo
      sQueryOrigem := cdsInputSimulaBenef.FieldByName('QUERYPREENCHE').AsString;

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
  cdsSimulaBenef      := TCMClientDataSet.Create( nil );
  cdsInputSimulaBenef := TCMClientDataSet.Create( nil );
  cdsJaCalculados     := TCMClientDataSet.Create( nil );
  try

    try

      //Inicializa variáveis
      sCampos        := '';
      sValor         := '';
      sNomeParaRegra := '#';


      //Recupera dados da simulação
      cdsSimulaBenef.Data := SelecionaSimulaBenef( iIdSimulaBenef );


      //Inicializa o dataset de campos já calculados
      cdsJaCalculados.Data := GetDataPacket(
                               ' select ' + QuotedStr( StringOfChar( 'x',  20 ) ) + ' as NOMECAMPO, ' +
                                            QuotedStr( StringOfChar( '0', 100 ) ) + ' as VALOR      ' +
                               ' from DUAL ' );
      cdsJaCalculados.Data := CopyClientDataSet( cdsJaCalculados );
      cdsJaCalculados.Delete;


      //Recupera campos
      cdsInputSimulaBenef.Data := GetDataPacket(
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
       '          s.ORDEM,                                       ' +
       QuotedStr  ( 'D' ) + ' as TIPOORIGEM,                     ' +
       QuotedStr  ( StringOfChar( ' ', 100 ) ) + ' as VALOR      ' +
       ' from     SIMULABENEFXINPUT s,                           ' +
       '          INPUTSIMULABENEF  i                            ' +
       ' where    s.IDINPUT       = i.IDINPUT                    ' +
       '   and    i.FLGATIVO      = 1                            ' +
       '   and    s.IDSIMULABENEF = ' + IntToStr( iIdSimulaBenef ) +
       ' order by s.ORDEM                                        ' );


      //Copia o pacote para o próprio dataset
      //(necessário para alterar dados trazidos via ADO)
      cdsInputSimulaBenef.Data := CopyClientDataSet( cdsInputSimulaBenef );

      //Substitui a string [IDPESSOA] pelo IDPESSOA passado como parâmetro
      sQueryInicial := StrSubst( UpperCase( cdsSimulaBenef.FieldByName('QUERYINICIAL').AsString ),
       '[IDPESSOA]', IntToStr( iIdPessoa ) );

      //Inclui os campos da query na lista de campos
      cdsDadosQuery.Close;
      try
        cdsDadosQuery.Data := GetDataPacket( sQueryInicial );
      except
        raise Exception.Create('Query inicial inválida. Favor entrar em contato com o Suporte Planus');
      end;

      //Gera um erro caso a query inicial possua mais de um registro
      if cdsDadosQuery.RecordCount > 1 then
        raise Exception.Create('A query inicial está retornando ' + IntToStr( cdsDadosQuery.RecordCount ) +
         ' registros. Não é possível efetuar simulações com mais de um registro. Favor entrar em contato com o Suporte Planus.');

      for i := 0 to ( cdsDadosQuery.Fields.Count - 1 ) do
      begin
        cdsInputSimulaBenef.Insert;

        cdsInputSimulaBenef.FieldByName('TITULO').AsString :=
         cdsDadosQuery.Fields[i].FieldName;

        cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').AsString :=
         cdsDadosQuery.Fields[i].FieldName;

        //Formata o valor, se não for nulo
        sValor := trim( cdsDadosQuery.Fields[i].AsString );

        if sValor <> '' then
          sValor := OraNumero( sValor )
        else
          sValor := ' ';

        cdsInputSimulaBenef.FieldByName('VALOR').AsString := sValor;

        cdsInputSimulaBenef.FieldByName('FLGVISIVEL').AsInteger := 0;
        cdsInputSimulaBenef.FieldByName('ORDEM').AsInteger      := 0;
        cdsInputSimulaBenef.FieldByName('TIPOORIGEM').AsString  := 'Q';

        //Acrescenta o nome para a regra do campo ao string de verificação de duplicidade
        sNomeParaRegra := sNomeParaRegra + cdsDadosQuery.Fields[i].FieldName + '#';

        //Se não é o primeiro, acrescenta vírgula
        if trim( sCampos ) <> '' then sCampos := sCampos + ', ';

        //Adiciona o valor calculado aos campos da query (se houver um local para tanto)
        sCampos := sCampos + QuotedStr( sValor ) + ' as ' +
         cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;

        cdsInputSimulaBenef.Post;

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
      cdsInputSimulaBenef.First;
      while not cdsInputSimulaBenef.Eof do
      begin

        //Se o campo vem da query, ao invés do cadastro, pula para o próximo campo
        if cdsInputSimulaBenef.FieldByName('TIPOORIGEM').AsString = 'Q' then
        begin
          cdsInputSimulaBenef.Next;
          Continue;
        end;

        //Verifica se já não há um campo incluído com o mesmo nome para regra
        if not cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').IsNull then
        begin
          if StrSearch( '#' + trim( cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').AsString ) + '#', sNomeParaRegra ) > 0 then
            raise Exception.Create('Foi encontrada duplicidade do nome "' +
             cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').AsString + '" nos campos do cálculo. ' +
             'Favor entrar em contato com o Suporte Planus.');

          //Acrescenta o nome para a regra na lista
          sNomeParaRegra := sNomeParaRegra + trim( cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').AsString ) + '#';
        end
        else
          sNomeParaRegra := sNomeParaRegra + '*#';

        sValor := '';

        //--------------- Início do processamento dos campos ---------------


        //Se a origem do campo for um VALOR DEFAULT
        if cdsInputSimulaBenef.FieldByName('ORIGEMDADO').AsString = 'V' then
          sValor := cdsInputSimulaBenef.FieldByName('VALORDEFAULT').AsString;


        //Se a origem do campo for um CAMPO DE QUERY
        if cdsInputSimulaBenef.FieldByName('ORIGEMDADO').AsString = 'C' then
        begin

          ExecutaQuery;

          //Recupera o conteúdo do campo
          try
            sValor := trim( cdsDadosQuery.FieldByName( cdsInputSimulaBenef.FieldByName('CAMPO').AsString ).AsString );
          except
            raise Exception.Create('Coluna "' + cdsInputSimulaBenef.FieldByName('CAMPO').AsString +
             '" inexistente na query de origem. Favor entrar em contato com o Suporte Planus.');
          end;

          //Fecha a query
          cdsDadosQuery.Close;

        end;



        //Se a origem do campo for um RESULTADO DE REGRA
        if cdsInputSimulaBenef.FieldByName('ORIGEMDADO').AsString = 'R' then
        begin
          Regra.CdsDataSetIn.Close;

          //Preenche o ClientDataSet da Query com os dados da query local
          ExecutaQuery;
          Regra.CdsDataSetIn.Data := cdsDadosQuery.Data;

          //Executa a regra para recuperar o conteúdo do campo
          sValor := Regra.RegraString( cdsInputSimulaBenef.FieldByName('IDREGRAPREENCHE').AsString, iIdEmpresaProp );

          //Fecha a query
          cdsDadosQuery.Close;
          Regra.CdsDataSetIn.Close;
        end;


        //Verifica a validade do campo, e, se este for do tipo "Data" ou "Número",
        //formata-o adequadamente (caso haja um formato informado)
        if  ( ( ( cdsInputSimulaBenef.FieldByName('TIPODADO').AsString = 'D' )
         or ( cdsInputSimulaBenef.FieldByName('TIPODADO').AsString = 'N' ) )
         and ( sValor <> '' ) ) then
        begin

          //Verifica o tipo de dado para formatá-lo adequadamante
          if cdsInputSimulaBenef.FieldByName('TIPODADO').AsString = 'N' then    //Número
          begin

            //Verifica se é um número válido, e gera uma exceção caso contrário
            try
              rAux := StrToFloat( OraNumeroInv( sValor ) );
            except
              raise Exception.Create('O campo "' + cdsInputSimulaBenef.FieldByName('TITULO').AsString +
               '" possui um número inválido.');
            end;

            if not cdsInputSimulaBenef.FieldByName('FORMATO').IsNull then
            begin
              //Troca as ',' por '.', e vice-e-versa.
              sFormato := cdsInputSimulaBenef.FieldByName('FORMATO').AsString;
              sFormato := StrSubst( sFormato, '.', '§' );
              sFormato := StrSubst( sFormato, ',', '.' );
              sFormato := StrSubst( sFormato, '§', ',' );

              sValor := FormatFloat( sFormato, StrToFloat( OraNumeroInv( sValor ) ) );
            end;

          end;  {if cdsInputSimulaBenef.FieldByName('TIPODADO').AsString = 'N' then}



          if cdsInputSimulaBenef.FieldByName('TIPODADO').AsString = 'D' then    //Data
          begin

            //Verifica se é uma data válida, e gera uma exceção caso contrário
            try
              dAux := StrToDateTime( sValor );
            except
              raise Exception.Create('O campo "' + cdsInputSimulaBenef.FieldByName('TITULO').AsString +
               '" possui uma data inválida.');
            end;

            if not cdsInputSimulaBenef.FieldByName('FORMATO').IsNull then
              sValor := FormatDateTime( cdsInputSimulaBenef.FieldByName('FORMATO').AsString,
               StrToDateTime( sValor ) );

          end; {if cdsInputSimulaBenef.FieldByName('TIPODADO').AsString = 'D' then}

        end;
        
        //--------------- Término do processamento dos campos ---------------

        if sValor = '' then sValor := ' ';

        //Adiciona o valor calculado aos campos da query (se houver um local para tanto)
        if not cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').IsNull then
        begin
          //Se não é o primeiro, acrescenta vírgula
          if trim( sCampos ) <> '' then sCampos := sCampos + ', ';
    
          sCampos := sCampos + QuotedStr( sValor ) + ' as ' +
           cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;
        end;

        //Altera o conteúdo do campo, preenchendo-o com o valor calculado
        cdsInputSimulaBenef.Edit;
        cdsInputSimulaBenef.FieldByName('VALOR').AsString := sValor;
         cdsInputSimulaBenef.Post;

        //Insere um registro na lista de campos já calculados
        if not cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').IsNull then
        begin
          cdsJaCalculados.Append;
          cdsJaCalculados.FieldByName('NOMECAMPO').AsString := cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;
          cdsJaCalculados.FieldByName('VALOR').AsString     := sValor;
          cdsJaCalculados.Post;
        end;

        //Move para o próximo campo
        cdsInputSimulaBenef.Next;

      end; 

      //Reordena o dataset
      cdsInputSimulaBenef.IndexFieldNames := 'ORDEM';
      cdsInputSimulaBenef.Data := CopyClientDataSet( cdsInputSimulaBenef );

      //Retorna os dados dos campos devidamente alterados
      Result := cdsInputSimulaBenef.Data;

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
    cdsSimulaBenef.Free;
    cdsInputSimulaBenef.Free;
    cdsJaCalculados.Free;
  end; 

end; {CamposSimulaBenef}

//Gera os resultados da simulação de benefícios
function TCtrlSimulaBenef.ResultSimulaBenef(iIdPessoa, iIdSimulaBenef, iFlgRollback, iIdEmpresaProp: integer; oCampos: OLEVariant): OleVariant;
var
  cdsDadosQuery,
  cdsCampos,
  cdsQuery,
  cdsInputSimulaBenef,
  cdsResultSimulaBenef,
  cdsJaCalculados,
  cdsAux,
  cdsAux2 : TCMClientDataSet;

  rAux : Real;
  dAux : TDateTime;

  sNomeParaRegra,
  sNomeCampo,
  sSQL,
  sCampos,
  sValor,
  sConteudo,
  sFormato : string;

  procedure ExecutaQuery;
  var
    sQueryOrigem : string;
  begin
    sQueryOrigem := '';

    //Se utiliza a query do processo...
    if cdsResultSimulaBenef.FieldByName('FLGQUERYPREENCHE').AsInteger <> 1 then
      //...monta a query com os campos gerados até o momento (se houverem)
      sQueryOrigem := ' select ' + sCampos + ' from DUAL '

    //Se utiliza query própria...
    else
    begin

      //...monta a query com o conteúdo do campo
      sQueryOrigem := cdsResultSimulaBenef.FieldByName('QUERYPREENCHE').AsString;

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

  cdsCampos            := TCMClientDataSet.Create( nil );
  cdsDadosQuery        := TCMClientDataSet.Create( nil );
  cdsQuery             := TCMClientDataSet.Create( nil );
  cdsInputSimulaBenef  := TCMClientDataSet.Create( nil );
  cdsResultSimulaBenef := TCMClientDataSet.Create( nil );
  cdsJaCalculados      := TCMClientDataSet.Create( nil );
  cdsAux               := TCMClientDataSet.Create( nil );
  cdsAux2              := TCMClientDataSet.Create( nil );
  try

    try

      //Atribui os dados dos campos calculados ao dataset local
      cdsCampos.Data := oCampos;

      //Recupera campos
      cdsInputSimulaBenef.Data := RecuperaCamposAtivos( iIdSimulaBenef );

      //Inicializa o dataset de campos e resultados já calculados
      cdsJaCalculados.Data := GetDataPacket(
                               ' select ' + QuotedStr( StringOfChar( 'x',  20 ) ) + ' as NOMECAMPO, ' +
                                            QuotedStr( StringOfChar( '0', 100 ) ) + ' as VALOR      ' +
                               ' from DUAL ' );
      cdsJaCalculados.Data := CopyClientDataSet( cdsJaCalculados );
      cdsJaCalculados.Delete;

      //Montagem da Query
      sNomeParaRegra := '#';
      sCampos := '';
      cdsCampos.First;
      while not cdsCampos.Eof do
      begin
        sNomeCampo := '';

        //Se é um campo calculado, recupera o nome do banco
        if not cdsCampos.FieldByName('IDINPUT').IsNull then
        begin

          //Localiza o campo no dataset de inputs
          if not cdsInputSimulaBenef.Locate( 'IDINPUT', cdsCampos.FieldByName('IDINPUT').AsString, [] ) then
            raise Exception.Create('Não foi possível encontrar o campo ' + cdsCampos.FieldByName('IDINPUT').AsString +
            '. Favor entrar em contato com o Suporte Planus.' );

          //Se não tem nome para regra, ignora
          if cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').IsNull then
          begin
            cdsCampos.Next;
            Continue;
          end;

          cdsCampos.Edit;
          cdsCampos.FieldByName('NOMECAMPO').AsString := cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;
          cdsCampos.Post;

          sNomeCampo := cdsInputSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;
        end
        else
          //Senão, recupera da própria query
          sNomeCampo := cdsCampos.FieldByName('NOMECAMPO').AsString;

        //Recupera o conteúdo
        sConteudo := trim( cdsCampos.FieldByName('VALOR').AsString );

        //Se é um campo calculado e não está vazio, valida o formato
        if   ( not cdsCampos.FieldByName('IDINPUT').IsNull )
         and ( sConteudo <> '' ) then
        begin

          //Verifica o tipo de dado para formatá-lo adequadamante
          if cdsInputSimulaBenef.FieldByName('TIPODADO').AsString = 'N' then    //Número
          begin

            //Verifica se é um número válido, e gera uma exceção caso contrário
            try
              rAux := StrToFloat( OraNumeroInv( sConteudo ) );
            except
              raise Exception.Create('O campo "' + cdsInputSimulaBenef.FieldByName('TITULO').AsString +
               '" possui um número inválido.');
            end;

            //Converte para um valor que o regra pode tratar
            sConteudo := OraNumero( sConteudo );

            //Altera o conteúdo do campo
            cdsCampos.Edit;
            cdsCampos.FieldByName('VALOR').AsString := sConteudo;
            cdsCampos.Post;
          end; 

          if cdsInputSimulaBenef.FieldByName('TIPODADO').AsString = 'D' then    //Data
          begin

            //Verifica se é uma data válida, e gera uma exceção caso contrário
            try
              dAux := StrToDateTime( sConteudo );
            except
              raise Exception.Create('O campo "' + cdsInputSimulaBenef.FieldByName('TITULO').AsString +
               '" possui uma data inválida.');
            end;

            //Converte para uma data no formato 'dd/MM/yyyy'
            sConteudo := FormatDateTime( 'dd/mm/yyyy', dAux );

            //Altera o conteúdo do campo
            cdsCampos.Edit;
            cdsCampos.FieldByName('VALOR').AsString := sConteudo;
            cdsCampos.Post;
          end; {if cdsInputSimulaBenef.FieldByName('TIPODADO').AsString = 'D' then}

        end; { if   ( not cdsCampos.FieldByName('IDINPUT').IsNull )
                and ( sConteudo <> '' ) then}

        //Se não é o primeiro, acrescenta vírgula
        if trim( sCampos ) <> '' then sCampos := sCampos + ', ';

        if sConteudo = '' then sConteudo := ' ';

        //Monta o campo na query
        sCampos := sCampos + QuotedStr( sConteudo ) + ' as ' + sNomeCampo;

        //Acrescenta o nome para a regra do campo ao string de verificação de duplicidade
        sNomeParaRegra := sNomeParaRegra + sNomeCampo + '#';

        //Insere um registro na lista de campos já calculados
        cdsJaCalculados.Append;
        cdsJaCalculados.FieldByName('NOMECAMPO').AsString := cdsCampos.FieldByName('NOMECAMPO').AsString;
        cdsJaCalculados.FieldByName('VALOR').AsString     := cdsCampos.FieldByName('VALOR').AsString;
        cdsJaCalculados.Post;

        cdsCampos.Next;

      end; {while not cdsCampos.Eof do}



      //----- Validação de campos ---------------------------------------------> INÍCIO

      //Inicia uma transação
      StartTransaction;

      //Inicializa o dataset de campos já validados
      cdsAux.Data  := cdsCampos.Data;
      cdsAux2.Data := cdsInputSimulaBenef.Data;

      if trim( sCampos ) <> '' then
      begin

        //Executa a query
        cdsQuery.Data := GetDataPacket( ' select ' + sCampos + ' from DUAL ' );

        //Validação dos campos
        cdsCampos.First;
        while not cdsCampos.Eof do
        begin

          //Verifica se o campo é calculado. Se vem da query, ignora-o
          if cdsCampos.FieldByName('IDINPUT').IsNull then
          begin
            cdsCampos.Next;
            Continue;
          end;

          //Localiza o campo no dataset de inputs
          if not cdsInputSimulaBenef.Locate( 'IDINPUT', cdsCampos.FieldByName('IDINPUT').AsString, [] ) then
            raise Exception.Create('Não foi possível encontrar o campo ' + cdsCampos.FieldByName('IDINPUT').AsString +
            '. Favor entrar em contato com o Suporte Planus.' );


          //Valida o preenchimento do campo (se requerido)
          if   ( cdsInputSimulaBenef.FieldByName('FLGREQUERIDO').AsInteger = 1 )
           and ( trim( cdsCampos.FieldByName('VALOR').AsString ) = '' ) then
            raise Exception.Create('O preenchimento do campo "' + cdsInputSimulaBenef.FieldByName('TITULO').AsString +
             '" é obrigatório.');


          //Senão possui validação, ignora-o
          if cdsInputSimulaBenef.FieldByName('IDREGRAVALIDA').IsNull then
          begin
            cdsCampos.Next;
            Continue;
          end;

          sValor := '';

          //Fecha o ClientDataSet do Regra
          Regra.CdsDataSetIn.Close;

          //Se possui query própria, copia-a para o ClientDataSet do Regra
          if cdsInputSimulaBenef.FieldByName('FLGQUERYVALIDA').AsInteger = 1 then
          begin
            sSQL := cdsInputSimulaBenef.FieldByName('QUERYVALIDA').AsString;

            //Substitui os campos "[XXX]" pelo respectivo conteúdo da query do processo
            cdsAux.First;
            while not cdsAux.Eof do
            begin
              sNomeCampo := trim( cdsAux.FieldByName('NOMECAMPO').AsString );
              if sNomeCampo = '' then
              begin
                cdsAux2.First;
                cdsAux2.Locate( 'IDINPUT', cdsAux.FieldByName('IDINPUT').AsInteger, [] );
                sNomeCampo := cdsAux2.FieldByName('NOMEPARAREGRA').AsString;
              end;
              sSQL := StringReplace( sSQL, '[' + sNomeCampo + ']',
               QuotedStr( cdsAux.FieldByName('VALOR').AsString ), [rfReplaceAll, rfIgnoreCase] );
              cdsAux.Next;
            end;

            try
              Regra.CdsDataSetIn.Data := GetDataPacket( sSQL );
            except
              raise Exception.Create('Query de validação do campo "' + cdsInputSimulaBenef.FieldByName('TITULO').AsString +
               '" inválida. Favor entrar em contato com o Suporte Planus.');
            end;

          end
          else
          //Se não possui query própria, utiliza a do processo
          begin

            Regra.CdsDataSetIn.Data := cdsQuery.Data;

          end;

          sValor := trim( Regra.RegraString( cdsInputSimulaBenef.FieldByName('IDREGRAVALIDA').AsString,
           iIdEmpresaProp ) );

          //Se a regra retornar alguma mensagem, é sinal de que a validação não
          //aceitou o valor do campo. É gerado, então, um erro.
          if sValor <> '' then
            raise Exception.Create( sValor );

          cdsCampos.Next;

        end; 

        //----- Validação de campos ---------------------------------------------> FIM

      end;


      //----- Geração dos resultados ---------------------------------------------> INÍCIO

      //Recupera resultados
      cdsResultSimulaBenef.Data := GetDataPacket(
       ' select   r.IDRESULT,                                    ' +
       '          r.TITULO,                                      ' +
       '          r.NOMEPARAREGRA,                               ' +
       '          r.FLGATIVO,                                    ' +
       '          r.IDREGRA,                                     ' +
       '          r.FLGVISIVEL,                                  ' +
       '          r.TIPODADO,                                    ' +
       '          r.FORMATO,                                     ' +
       '          s.ORDEM,                                       ' +
       '          r.ORIGEMDADO,                                  ' +
       '          r.FLGQUERYPREENCHE,                            ' +
       '          r.QUERYPREENCHE,                               ' +
       '          r.CAMPO,                                       ' +
       '          r.VALORDEFAULT,                                ' +
       QuotedStr  ( StringOfChar( ' ', 100 ) ) + ' as VALOR      ' +
       ' from     SIMULABENEFXRESULT s,                          ' +
       '          RESULTSIMULABENEF  r                           ' +
       ' where    s.IDRESULT      = r.IDRESULT                   ' +
       '   and    r.FLGATIVO      = 1                            ' +
       '   and    s.IDSIMULABENEF = ' + IntToStr( iIdSimulaBenef ) +
       ' order by s.ORDEM                                        ' );

      //Copia o pacote para o próprio dataset
      //(necessário para alterar dados trazidos via ADO)
      cdsResultSimulaBenef.Data := CopyClientDataSet( cdsResultSimulaBenef );


      //Varre os resultados para preencher seus conteúdos
      cdsResultSimulaBenef.First;
      while not cdsResultSimulaBenef.Eof do
      begin

        if not cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').IsNull then
        begin
          //Verifica se já não há um campo incluído com o mesmo nome para regra
          if StrSearch( '#' + trim( cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').AsString ) + '#', sNomeParaRegra ) > 0 then
            raise Exception.Create('Foi encontrada duplicidade do nome "' +
             cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').AsString + '" nos campos ou resultados do cálculo. ' +
             'Favor entrar em contato com o Suporte Planus.');

          //Acrescenta o nome para a regra na lista
          sNomeParaRegra := sNomeParaRegra + trim( cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').AsString ) + '#';
        end
        else
          sNomeParaRegra := sNomeParaRegra + '*#';

        sValor := '';

        //--------------- Início do processamento dos resultados ---------------


        //Se a origem do resultado for um VALOR DEFAULT
        if cdsResultSimulaBenef.FieldByName('ORIGEMDADO').AsString = 'V' then
          sValor := cdsResultSimulaBenef.FieldByName('VALORDEFAULT').AsString;


        //Se a origem do resultado for um CAMPO DE QUERY
        if cdsResultSimulaBenef.FieldByName('ORIGEMDADO').AsString = 'C' then
        begin

          ExecutaQuery;

          //Recupera o conteúdo do campo
          try
            sValor := trim( cdsDadosQuery.FieldByName( cdsResultSimulaBenef.FieldByName('CAMPO').AsString ).AsString );
          except
            raise Exception.Create('Coluna "' + cdsResultSimulaBenef.FieldByName('CAMPO').AsString +
             '" inexistente na query de origem. Favor entrar em contato com o Suporte Planus.');
          end;

          //Fecha a query
          cdsDadosQuery.Close;

        end;

        //Se a origem do campo for um RESULTADO DE REGRA
        if cdsResultSimulaBenef.FieldByName('ORIGEMDADO').AsString = 'R' then
        begin
          Regra.CdsDataSetIn.Close;

          //Preenche o ClientDataSet da Query com os dados da query local
          ExecutaQuery;
          Regra.CdsDataSetIn.Data := cdsDadosQuery.Data;

          //Executa a regra para recuperar o conteúdo do resultado
          sValor := Regra.RegraString( cdsResultSimulaBenef.FieldByName('IDREGRA').AsString, iIdEmpresaProp );

          //Fecha a query
          cdsDadosQuery.Close;
          Regra.CdsDataSetIn.Close;
        end; 


        //Verifica a validade do resultado, e, se este for do tipo "Data" ou "Número",
        //formata-o adequadamente (caso haja um formato informado)
        if  ( ( ( cdsResultSimulaBenef.FieldByName('TIPODADO').AsString = 'D' )
         or ( cdsResultSimulaBenef.FieldByName('TIPODADO').AsString = 'N' ) )
         and ( sValor <> '' ) ) then
        begin

          //Verifica o tipo de dado para formatá-lo adequadamante
          if cdsResultSimulaBenef.FieldByName('TIPODADO').AsString = 'N' then    //Número
          begin

            //Verifica se é um número válido, e gera uma exceção caso contrário
            try
              rAux := StrToFloat( OraNumeroInv( sValor ) );
            except
              raise Exception.Create('O resultado "' + cdsResultSimulaBenef.FieldByName('TITULO').AsString +
               '" possui um número inválido.');
            end;

            if not cdsResultSimulaBenef.FieldByName('FORMATO').IsNull then
            begin
              //Troca as ',' por '.', e vice-e-versa.
              sFormato := cdsResultSimulaBenef.FieldByName('FORMATO').AsString;
              sFormato := StrSubst( sFormato, '.', '§' );
              sFormato := StrSubst( sFormato, ',', '.' );
              sFormato := StrSubst( sFormato, '§', ',' );

              sValor := FormatFloat( sFormato, StrToFloat( OraNumeroInv( sValor ) ) );
            end;

          end;  {if cdsResultSimulaBenef.FieldByName('TIPODADO').AsString = 'N' then}



          if cdsResultSimulaBenef.FieldByName('TIPODADO').AsString = 'D' then    //Data
          begin

            //Verifica se é uma data válida, e gera uma exceção caso contrário
            try
              dAux := StrToDateTime( sValor );
            except
              raise Exception.Create('O resultado "' + cdsResultSimulaBenef.FieldByName('TITULO').AsString +
               '" possui uma data inválida.');
            end;

            if not cdsResultSimulaBenef.FieldByName('FORMATO').IsNull then
              sValor := FormatDateTime( cdsResultSimulaBenef.FieldByName('FORMATO').AsString,
               StrToDateTime( sValor ) );

          end;

        end; 

        //--------------- Término do processamento dos campos ---------------

        if sValor = '' then sValor := ' ';

        //Altera o conteúdo do campo, preenchendo-o com o valor calculado
        cdsResultSimulaBenef.Edit;
        cdsResultSimulaBenef.FieldByName('VALOR').AsString := sValor;
        cdsResultSimulaBenef.Post;


        //Converte o campo (se for numérico) para um formato aceito pelo Regra.
        if cdsResultSimulaBenef.FieldByName('TIPODADO').AsString = 'N' then
          sValor := OraNumero( sValor );

        //Adiciona o valor calculado aos campos da query
        if not cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').IsNull then
        begin
          //Se não é o primeiro, acrescenta vírgula
          if trim( sCampos ) <> '' then sCampos := sCampos + ', ';

          sCampos := sCampos + QuotedStr( sValor ) + ' as ' +
           cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;
        end;

        //Insere um registro na lista de campos já calculados
        if not cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').IsNull then
        begin
          cdsJaCalculados.Append;
          cdsJaCalculados.FieldByName('NOMECAMPO').AsString := cdsResultSimulaBenef.FieldByName('NOMEPARAREGRA').AsString;
          cdsJaCalculados.FieldByName('VALOR').AsString     := sValor;
          cdsJaCalculados.Post;
        end;

        //Move para o próximo campo
        cdsResultSimulaBenef.Next;

      end;


      //----- Geração dos resultados ---------------------------------------------> FIM


      //Retorna os dados dos resultados devidamente alterados
      Result := cdsResultSimulaBenef.Data;


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
    cdsCampos.Free;
    cdsQuery.Free;
    cdsInputSimulaBenef.Free;
    cdsResultSimulaBenef.Free;
    cdsJaCalculados.Free;
    cdsAux.Free;
    cdsAux2.Free;
  end;


end; {ResultSimulaBenef}


//Recupera o nome de um determinado benefício
function TCtrlSimulaBenef.NomeBeneficio( iIdSimulaBenef : integer ) : String;
var
  cdsLocal : TCmClientDataSet;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try

    cdsLocal.Data := GetDataPacket(
     ' select b.NOME                                           ' +
     ' from   SIMULABENEF s,                                   ' +
     '        BENEFICIO   b                                    ' +
     ' where  s.IDBENEFICIO   = b.IDBENEFICIO                  ' +
     '   and  s.IDSIMULABENEF = ' + IntToStr( iIdSimulaBenef ) ) ;

    Result := cdsLocal.FieldByName('NOME').AsString;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;
end; {NomeBeneficio}

//Verifica se há uma simulação ativa para um benefício, que não seja a passada como parâmetro
function TCtrlSimulaBenef.ExisteSimulacaoAtiva(iIdBeneficio, iIdSimulaBenef: integer): boolean;
var
  cdsLocal : TCMClientDataSet;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try

    cdsLocal.Data := GetDataPacket(
     ' select IDSIMULABENEF                                 ' +
     ' from   SIMULABENEF                                   ' +
     ' where  IDBENEFICIO   =  ' + IntToStr( iIdBeneficio   ) +
     '   and  IDSIMULABENEF <> ' + IntToStr( iIdSimulaBenef ) +
     '   and  FLGATIVO      = 1                             ' );

    Result := not cdsLocal.IsEmpty;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;

end;

function TCtrlSimulaBenef.GeraSQL(oData: OleVariant): String;
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

function TCtrlSimulaBenef.InTransaction: boolean;
begin
  if DbConnectionType = cntBDE then
    Result := DataBase.InTransaction
  else
    Result := DbAdoConnection.InTransaction;
end;

function TCtrlSimulaBenef.DataToSQL(oData: OleVariant): OLEVariant;
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

