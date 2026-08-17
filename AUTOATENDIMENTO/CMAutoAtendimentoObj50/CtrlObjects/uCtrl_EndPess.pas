{
--------------------------------------------------------------------------------
Pendência   : SOL 150726 KINTANA 1099530
Responsável : BRUNO AZEVEDO
Data        : 15/06/2011
Descrição   : Criação do histórico de endereços.
--------------------------------------------------------------------------------
Pendência   : SOL 91655 KINTANA 394002
Responsável : BRUNO AZEVEDO
Data        : 06/07/2010
Descrição   : Criação da manutenção dos dados cadastrais (E-mail, telefone e endereço).
--------------------------------------------------------------------------------
}
unit uCtrl_EndPess;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDb_EndPess, DB, uCtrlFuncoesAA, uCMFileUtils;

Type

  TUpdateStatus = (usUnmodified, usModified, usInserted, usDeleted);


  TCtrl_EndPess = class(TCmControlObject)
  private
    FCdsEndPess: TCMClientDataSet;
    FCdsAux: TCMClientDataSet;
    FDb_EndPess: TDb_EndPess;
    procedure SetCdsEndPess(const Value: TCMClientDataSet);
    procedure SetDb_EndPess(const Value: TDb_EndPess);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property Db_EndPess : TDb_EndPess read FDb_EndPess write SetDb_EndPess;
    property CdsEndPess : TCMClientDataSet read FCdsEndPess write SetCdsEndPess;

    function SelecionaEnderecosPorPessoa( iIdPessoa : integer ) : OleVariant;
    function SelecionaCidades : OleVariant;
    function SelecionaEndereco( iIdEndereco : integer ) : OleVariant;
    function SelecionaEnderecoPessoa( iIdEndereco : integer ) : OleVariant;
    function GravaEndPess : Boolean;

    function IncluirEndPess : Integer;
    function AlterarEndPess : Boolean;
    function ExcluirEndPess( iIdEndereco : integer ) : Boolean;

    //BRUNO AZEVEDO SOL 150726 KINTANA 1099530
    procedure GravaLogEndereco(pIdEndereco: Integer; pIdPessoa, pIdTitular:String; xDataSet, xDataSetAnt: TCMClientDataSet; pTipo: TOperacao);
    function  SelecionaHistoricoEnderecos(iIdEndereco : integer) : OleVariant;
    //BRUNO AZEVEDO SOL 150726 KINTANA 1099530
    function BuscaCidades( sIdCidades: string ): OleVariant;
    
  published

end;

implementation

{ TCtrl_EndPess }

procedure TCtrl_EndPess.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDb_EndPess.DataBaseName    := DataBaseName
  else
    FDb_EndPess.DbAdoConnection := DbAdoConnection;
end;

function TCtrl_EndPess.AlterarEndPess: Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlterarEndPess( FCdsEndPess.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      StartTransaction;

      //BRUNO AZEVEDO SOL 124179 KINTANA 651468
      FCdsAux.Close;
      FCdsAux.Data := SelecionaEndereco( FCdsEndPess.FieldByName('IDENDERECO').AsInteger );

      GravaLogEndereco(FCdsEndPess.FieldByName('IDENDERECO').AsInteger,FCdsEndPess.FieldByName('IDPESSOA').AsString, FCdsEndPess.FieldByName('IDPESSOA').AsString, FCdsEndPess, FCdsAux, opAlterar);
      //GravaLogEndereco(FCdsEndPess.FieldByName('IDENDERECO').AsInteger, FCdsEndPess, FCdsAux, opAlterar);
      sSQL := ' update ENDPESS       '                                                                       +
              ' set    IDPESSOA    = ' + FCdsEndPess.FieldByName('IDPESSOA').AsString                 + ', ' +
              '        LOGRADOURO  = ' + QuotedStr( AnsiUpperCase(FCdsEndPess.FieldByName('LOGRADOURO').AsString)  ) + ', ' +
              //BRUNO AZEVEDO SOL 91655 KINTANA 394002
              '        TIPOENDERECO = ' + QuotedStr( Trim(FCdsEndPess.FieldByName('TIPOENDERECO').AsString)  ) + ', ' +
              //BRUNO AZEVEDO SOL 91655 KINTANA 394002
              '        NUMERO      = ' + QuotedStr( FCdsEndPess.FieldByName('NUMERO').AsString      ) + ', ' +
              '        COMPLEMENTO = ' + QuotedStr( FCdsEndPess.FieldByName('COMPLEMENTO').AsString ) + ', ' +
              '        BAIRRO      = ' + QuotedStr( FCdsEndPess.FieldByName('BAIRRO').AsString      ) + ', ' +
              '        CEP         = ' + QuotedStr( FCdsEndPess.FieldByName('CEP').AsString         ) + ', ' +
              '        NOME        = ' + QuotedStr( FCdsEndPess.FieldByName('NOME').AsString        ) + ', ' +
              '        IDCIDADES   = ' + QuotedStr( FCdsEndPess.FieldByName('IDCIDADES').AsString   ) + ', ' +
              '        IDPAIS      = ' + QuotedStr( FCdsEndPess.FieldByName('IDPAIS').AsString      )        +
              ' where  IDENDERECO  = ' + FCdsEndPess.FieldByName('IDENDERECO').AsString                      ;

      Result := ExecSQL( sSQL );

      if not Result then
        raise Exception.Create( MessageInfo );
      
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

constructor TCtrl_EndPess.Create;
begin
  inherited;
  FCdsAux      := TCMClientDataSet.Create( nil );
  FDb_EndPess  := TDb_EndPess.Create( self );
end;

destructor TCtrl_EndPess.Destroy;
begin
  FDb_EndPess.Free;
  FCdsAux.Free;
  if IsAppServer then FCdsEndPess.Free;
  inherited;
end;

function TCtrl_EndPess.ExcluirEndPess( iIdEndereco : integer ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluirEndPess( iIdEndereco );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      StartTransaction;

      sSQL := ' delete from ENDPESS  ' +
              ' where  IDENDERECO  = ' + IntToStr( iIdEndereco );

      Result := ExecSQL( sSQL );

      if not Result then
        raise Exception.Create( MessageInfo );

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

function TCtrl_EndPess.GravaEndPess: Boolean;
var
  Msg : String; 
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaEndPess( FCdsEndPess.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      
      Result := ApplyCds( FCdsEndPess, FDb_EndPess, [], [] );

      Msg := FDb_EndPess.MessageInfo;

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

function TCtrl_EndPess.IncluirEndPess: Integer;
var
  sSQL : string;
  bOk : boolean;
begin
  Result := 0;

  if ConnectionSide = cnsClient then
  begin
    bOk := ( Connection.AppServer.IncluirEndPess( FCdsEndPess.Data ) > 0 );
    if not bOk then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      FCdsAux.Close;
      FCdsAux.Data := SelecionaEndereco( FCdsEndPess.FieldByName('IDENDERECO').AsInteger );

      if not ( FCdsEndPess.State in [dsEdit, dsInsert] ) then
      begin
        FCdsEndPess.Edit;
        FCdsEndPess.FieldByName('IDENDERECO').AsInteger := ProxId( Self, 'ENDPESS' );
        FCdsEndPess.Post;
      end;

      StartTransaction;

      GravaLogEndereco(FCdsEndPess.FieldByName('IDENDERECO').AsInteger,FCdsEndPess.FieldByName('IDPESSOA').AsString, FCdsEndPess.FieldByName('IDPESSOA').AsString, FCdsEndPess, FCdsAux, opInserir);

      //if (FCdsEndPess.FieldByName('IDENDERECO').AsInteger <= 0 ) then begin
      //GravaLogEndereco(FCdsEndPess.FieldByName('IDENDERECO').AsInteger, FCdsEndPess, FCdsAux, opInserir);
      //end else begin
      //  CMDebugToFile('Alteração','C:\AAErro.txt');
      //  GravaLogEndereco(FCdsEndPess.FieldByName('IDENDERECO').AsInteger,FCdsEndPess.FieldByName('IDPESSOA').AsString, FCdsEndPess.FieldByName('IDPESSOA').AsString, FCdsEndPess, FCdsAux, opAlterar);
      //GravaLogEndereco(FCdsEndPess.FieldByName('IDENDERECO').AsInteger, FCdsEndPess, FCdsAux, opAlterar);
      //end;

      sSQL := ' insert into ENDPESS       ' +
              ' (           IDENDERECO,   ' +
              '             IDPESSOA,     ' +
              '             LOGRADOURO,   ' +
              //BRUNO AZEVEDO SOL 91655 KINTANA 394002
              '             TIPOENDERECO, ' +
              //BRUNO AZEVEDO SOL 91655 KINTANA 394002
              '             NUMERO,       ' +
              '             COMPLEMENTO,  ' +
              '             BAIRRO,       ' +
              '             CEP,          ' +
              '             NOME,         ' +
              '             IDCIDADES,    ' +
              '             IDPAIS        ' +
              ' ) values (                ' +
              FCdsEndPess.FieldByName('IDENDERECO').AsString               + ', ' +
              FCdsEndPess.FieldByName('IDPESSOA').AsString                 + ', ' +
              QuotedStr( AnsiUpperCase(FCdsEndPess.FieldByName('LOGRADOURO').AsString)  ) + ', ' +
              //BRUNO AZEVEDO SOL 91655 KINTANA 394002
              QuotedStr( Trim(FCdsEndPess.FieldByName('TIPOENDERECO').AsString)  ) + ', ' +
              //BRUNO AZEVEDO SOL 91655 KINTANA 394002
              QuotedStr( FCdsEndPess.FieldByName('NUMERO').AsString      ) + ', ' +
              QuotedStr( FCdsEndPess.FieldByName('COMPLEMENTO').AsString ) + ', ' +
              QuotedStr( FCdsEndPess.FieldByName('BAIRRO').AsString      ) + ', ' +
              QuotedStr( FCdsEndPess.FieldByName('CEP').AsString         ) + ', ' +
              QuotedStr( FCdsEndPess.FieldByName('NOME').AsString        ) + ', ' +
              QuotedStr( FCdsEndPess.FieldByName('IDCIDADES').AsString   ) + ', ' +
              QuotedStr( FCdsEndPess.FieldByName('IDPAIS').AsString      )        +
              ' ) ';

      bOk := ExecSQL( sSQL );

      if not bOk then raise Exception.Create( MessageInfo );

      Commit;

      Result := FCdsEndPess.FieldByName('IDENDERECO').AsInteger

    except
      On E : Exception Do
      begin
        Result := 0;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrl_EndPess.OnCreateAppServer;
begin
  inherited;
  FCdsEndPess := TCMClientDataSet.Create( nil );
end;

function TCtrl_EndPess.SelecionaCidades: OleVariant;
begin
  Result := GetDataPacket(
   '   select c.IDCIDADES,                             ' +
   '          ltrim( rtrim( c.NOME ) ) as NOMECIDADE,  ' +
   '          e.CODESTADO                              ' +
   '     from CIDADES c,                               ' +
   '          ESTADO e                                 ' +
   '    where c.IDESTADO = e.IDESTADO                  ' +
   ' order by NOMECIDADE                               ' );
end;

function TCtrl_EndPess.SelecionaEndereco( iIdEndereco : integer ): OleVariant;
begin
  FDb_EndPess.Idendereco.AsInteger := iIdEndereco;
  Result := GetDataPacket( FDb_EndPess.SSqlSelect );
end;

function TCtrl_EndPess.SelecionaEnderecoPessoa( iIdEndereco: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select     e.IDENDERECO,                                                                    ' +
   '            e.LOGRADOURO,                                                                    ' +
   '            e.NUMERO,                                                                        ' +
   '            e.COMPLEMENTO,                                                                   ' +
   '            e.BAIRRO,                                                                        ' +
   '            c.NOME as CIDADE,                                                                ' +
   '            s.NOMEESTADO as ESTADO,                                                          ' +
   '            p.IDPAIS,                                                                        ' +
   '            p.NOMEPAIS as PAIS,                                                              ' +
   '            e.CEP,                                                                           ' +
   '            e.NOME as TIPOEND,                                                               ' +
   '            e.IDCIDADES,                                                                     ' +
   '            pe.IDENDCORRESP,                                                                 ' +
   '            pe.IDENDCOMERCIAL,                                                               ' +
   '            pe.IDENDENTREGA,                                                                 ' +
   '            pe.IDENDRESIDENCIAL,                                                             ' +
   '            pe.IDENDCOBRANCA                                                                 ' +
   ' from       ENDPESS e,                                                                       ' +
   '            CIDADES c,                                                                       ' +
   '            PESSOA pe,                                                                       ' +
   '            ESTADO s,                                                                        ' +
   '            PAIS p                                                                           ' +
   ' where      e.IDENDERECO = ' + IntToStr( iIdEndereco )                                         +
   '   and      e.IDPESSOA   = pe.IDPESSOA  (+)                                                  ' +
   '   and      e.IDCIDADES  = c.IDCIDADES  (+)                                                  ' +
   '   and      e.IDPAIS     = p.IDPAIS     (+)                                                  ' +
   '   and      c.IDESTADO   = s.IDESTADO                                                        ' );

end;

function TCtrl_EndPess.SelecionaEnderecosPorPessoa( iIdPessoa: integer ): OleVariant;
var
sSQL : String;
begin
   //Result :=
   sSQL :=
   (
   //GetDataPacket(
   ' select     e.IDENDERECO,                                               ' +
   '            e.LOGRADOURO,                                               ' +
   '            e.NUMERO,                                                   ' +
   '            e.COMPLEMENTO,                                              ' +
   '            e.BAIRRO,                                                   ' +
   '            c.NOME as CIDADE,                                           ' +
   '            s.CODESTADO,                                                ' +
   '            p.IDPAIS,                                                   ' +
   '            p.NOMEPAIS as PAIS,                                         ' +
   '            e.CEP,                                                      ' +
   '            e.nome as TIPOEND,                                          ' +
   //BRUNO AZEVEDO SOL 91655 KINTANA 394002
   '            DECODE(TRIM(UPPER(e.TIPOENDERECO)),                         ' +
   '                   ''R'',''Residencial'',                               ' +
   '                   ''C'',''Comercial'' ) as TIPOENDERECO                ' +
   //BRUNO AZEVEDO SOL 91655 KINTANA 394002
   ' from       ENDPESS e,                                                  ' +
   '            CIDADES c,                                                  ' +
   '            PESSOA pe,                                                  ' +
   '            ESTADO s,                                                   ' +
   '            PAIS p                                                      ' +
   ' where      e.IDPESSOA  = ' + IntToStr( iIdPessoa )                       +
   '   and e.idendereco IN(SELECT p.idendcorresp                            ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendcomercial                                       ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendentrega                                         ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendresidencial                                     ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +
   '          UNION ALL                                                     ' +
   '          SELECT p.idendcobranca                                        ' +
   '          FROM pessoa p                                                 ' +
   '          WHERE p.idpessoa = ' + IntToStr( iIdPessoa ) +')' +
   '   and      e.IDCIDADES = c.IDCIDADES  (+)                              ' +
   '   and      e.IDPAIS    = p.IDPAIS     (+)                              ' +
   '   and      c.IDESTADO  = s.IDESTADO   (+)                              ' +
   '   and      e.IDPESSOA  = pe.IDPESSOA                                   ' );

   CmDebugToFile(sSQL,'C:\AAErro.txt');
   Result := GetDataPacket(sSQL);
end;

procedure TCtrl_EndPess.SetCdsEndPess(const Value: TCMClientDataSet);
begin
  FCdsEndPess := Value;
end;

procedure TCtrl_EndPess.SetDb_EndPess(const Value: TDb_EndPess);
begin
  FDb_EndPess := Value;
end;

//BRUNO AZEVEDO SOL 150726 KINTANA 1099530
//procedure TCtrl_EndPess.GravaLogEndereco(pIdPessoa, pIdTitular: Integer; xDataSet, xDataSetAnt: TCMClientDataSet; pTipo: TOperacao);
procedure TCtrl_EndPess.GravaLogEndereco(pIdEndereco: Integer;pIdPessoa, pIdTitular: String; xDataSet, xDataSetAnt: TCMClientDataSet; pTipo: TOperacao);
var
  i, iIdRegistro: Integer;
  sSql,sValorAnterior,sValorAtual: String;
  cdsLocal : TCMClientDataSet;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( ' select nvl(max(idregistro), 0) + 1 as PROXID from LOGALTENDERECOS' );
    iIdRegistro := cdsLocal.FieldByName('PROXID').AsInteger;
    cdsLocal.Close;
  finally
    cdsLocal.Free;
  end;

  if (pTipo = opInserir) then begin
    for i := 0 to xDataSet.Fields.Count - 1 do begin
      sSql := 'INSERT INTO LOGALTENDERECOS ' +
              '(IDREGISTRO, IDPESSOA, IDTITULAR, OPERACAO, NOMECAMPO, VALORANTERIOR, VALORALTERADO, TRGUSERINCLUSAO, TRGDTINCLUSAO) ' +
              ' VALUES ' +


              //sSql := 'INSERT INTO LOGALTENDERECOS ' +
              //'(IDREGISTRO, IDENDERECO, OPERACAO, NOMECAMPO, VALORANTERIOR, VALORALTERADO, TRGUSERINCLUSAO, TRGDTINCLUSAO) ' +
              //' VALUES ' +
              //'(' + IntToStr(iIdRegistro) + ',' + IntToStr(pIdEndereco)  + ',''INCLUSÃO'',' +QuotedStr(xDataSet.Fields[i].FieldName)+ ','''',' + QuotedStr(xDataSet.Fields[i].AsString) + ',USER,SYSDATE)';
                 '(' + IntToStr(iIdRegistro) + ','+ pIdPessoa +','+pIdTitular +',''I'',' +QuotedStr(xDataSet.Fields[i].FieldName) + ',' + QuotedStr(xDataSet.FieldByName(xDataSet.Fields[i].FieldName).AsString) + ',' + QuotedStr(xDataSet.Fields[i].AsString) + ',USER,SYSDATE)';
      cmDebugToFile(sSql, 'C:\AAErro.txt');
      ExecSQL(sSql);
    end;
  end else if (pTipo = opAlterar) then begin
    for i := 0 to xDataSet.Fields.Count - 1 do begin
      //sSql := 'INSERT INTO LOGALTENDERECOS ' +
      //        '(IDREGISTRO, IDPESSOA, IDTITULAR, OPERACAO, NOMECAMPO, VALORANTERIOR, VALORALTERADO, TRGUSERINCLUSAO, TRGDTINCLUSAO) ' +
      //        ' VALUES ' +

      //Fanuel Junior SOL Kintana
      sValorAnterior := (xDataSetAnt.FieldByName(xDataSet.Fields[i].FieldName).AsString);
      sValorAtual    := (xDataSet.Fields[i].AsString);
      cmDebugToFile(sValorAnterior+' / '+sValorAtual, 'C:\AAErro.txt');

      if (trim(sValorAnterior) <> trim(sValorAtual)) and (xDataSet.Fields[i].FieldName <> 'CODESTADO') then begin
         //sSql := 'INSERT INTO LOGALTENDERECOS ' +
         //        '(IDREGISTRO, IDENDERECO, OPERACAO, NOMECAMPO, VALORANTERIOR, VALORALTERADO, TRGUSERINCLUSAO, TRGDTINCLUSAO) ' +
        //         ' VALUES ' +
         sSql := 'INSERT INTO LOGALTENDERECOS ' +
                 '(IDREGISTRO, IDPESSOA, IDTITULAR, OPERACAO, NOMECAMPO, VALORANTERIOR, VALORALTERADO, TRGUSERINCLUSAO, TRGDTINCLUSAO) ' +
                 ' VALUES ' +
                 '(' + IntToStr(iIdRegistro) + ','+ pIdPessoa +','+pIdTitular +',''A'',' +QuotedStr(xDataSet.Fields[i].FieldName) + ',' + QuotedStr(xDataSetAnt.FieldByName(xDataSet.Fields[i].FieldName).AsString) + ',' + QuotedStr(xDataSet.Fields[i].AsString) + ',USER,SYSDATE)';
         //cmDebugToFile('deveria inserir', 'C:\AAErro.txt');
         //cmDebugToFile(sSql, 'C:\AAErro.txt');
         ExecSQL(sSql);
         end;
    end;

  end;
end;

function TCtrl_EndPess.SelecionaHistoricoEnderecos( iIdEndereco: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT LO.IDREGISTRO, ' +
   '        LEAD(LO.IDREGISTRO) OVER (ORDER BY LO.IDREGISTRO DESC) as proximo, ' +
   '        LO.* FROM LOGALTENDERECOS LO ' +
   //'  WHERE LO.IDPESSOA = ' + IntToStr( iIdPessoa ) +
   '  WHERE LO.IDENDERECO = ' + IntToStr( iIdEndereco ) +
   '  ORDER BY LO.IDREGISTRO DESC' );
end;
//BRUNO AZEVEDO SOL 150726 KINTANA 1099530


function TCtrl_EndPess.BuscaCidades( sIdCidades: string ): OleVariant;
begin
  Result := GetDataPacket('SELECT UF,NOME FROM CIDADES WHERE IDCIDADES = '+sIdCidades);
end;

end.
