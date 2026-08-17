unit uCtrl_DocPessoa;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDb_DocPessoa, DB, uCtrlFuncoesAA, uCmFileUtils;

Type

  TUpdateStatus = (usUnmodified, usModified, usInserted, usDeleted);

  TCtrl_DocPessoa = class(TCmControlObject)
  private
    FCdsDocPessoa:  TCMClientDataSet;
    FDb_DocPessoa:  TDb_DocPessoa;
    procedure SetCdsDocPessoa(const Value: TCMClientDataSet);
    procedure SetDb_DocPessoa(const Value: TDb_DocPessoa);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property Db_DocPessoa  : TDb_DocPessoa read FDb_DocPessoa write SetDb_DocPessoa;
    property CdsDocPessoa  : TCMClientDataSet read FCdsDocPessoa write SetCdsDocPessoa;

    function SelecionaDocPessoa( iIdPessoa, iIdDocumento : integer ) : OleVariant;

    function IncluirDocPessoa( bEmTransacao : boolean = False ) : Boolean;
    function AlterarDocPessoa( bEmTransacao : boolean = False ) : Boolean;
    function ExcluirDocPessoa( iIdPessoa, iIdDocumento : integer; bEmTransacao : boolean = False ) : Boolean;

    //function IncluirDocPessoa : Integer;
    //function AlterarDocPessoa : Boolean;
    //function ExcluirDocPessoa( iIdPessoa, iIdDocumento : integer ): Boolean;
    //function GravaDocPessoa : Boolean;

  published

end;

implementation

{ TCtrl_DocPessoa }

procedure TCtrl_DocPessoa.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDb_DocPessoa.DataBaseName    := DataBaseName
  else
    FDb_DocPessoa.DbAdoConnection := DbAdoConnection;
end;

function TCtrl_DocPessoa.AlterarDocPessoa( bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlterarDocPessoa( FCdsDocPessoa.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' update DOCPESSOA set  ';

      if not FCdsDocPessoa.FieldByName('NUMDOCUMENTO').IsNull then
         sSQL := sSQL + ' NUMDOCUMENTO = '         + QuotedStr( FCdsDocPessoa.FieldByName('NUMDOCUMENTO').AsString  ) + ', ';

      if not FCdsDocPessoa.FieldByName('ORGAO').IsNull then
         sSQL := sSQL + ' ORGAO        = '         + QuotedStr( FCdsDocPessoa.FieldByName('ORGAO').AsString  )        + ', ';

      if not FCdsDocPessoa.FieldByName('IDIMAGEM').IsNull then
         sSQL := sSQL + ' IDIMAGEM     = '         +            FCdsDocPessoa.FieldByName('IDIMAGEM').AsString        + ', ';

      if not FCdsDocPessoa.FieldByName('IDPAIS').IsNull then
         sSQL := sSQL + ' IDPAIS       = '         +            FCdsDocPessoa.FieldByName('IDPAIS').AsString          + ', ';

      if not FCdsDocPessoa.FieldByName('UF').IsNull then
         sSQL := sSQL + ' UF           = '         + QuotedStr( FCdsDocPessoa.FieldByName('UF').AsString  )           + ', ';

      if not FCdsDocPessoa.FieldByName('DATAEMISSAO').IsNull then
         sSQL := sSQL + ' DATAEMISSAO  = ' + DateToStrOracle( FCdsDocPessoa.FieldByName('DATAEMISSAO').AsDateTime  )    + ', ';

      if not FCdsDocPessoa.FieldByName('IDESTADO').IsNull then
         sSQL := sSQL + ' IDESTADO     = '         +            FCdsDocPessoa.FieldByName('IDESTADO').AsString        + ', ';

      if not FCdsDocPessoa.FieldByName('DATAVALIDADE').IsNull then
         sSQL := sSQL + ' DATAVALIDADE = ' + DateToStrOracle( FCdsDocPessoa.FieldByName('DATAVALIDADE').AsDateTime  )   + ', ';

      sSQL := Copy(sSQL, 0, length(sSQL)-2);

      if sSQL <> ' update DOCPESSOA set  ' then begin
         sSQL := sSQL +
         ' where  IDPESSOA     = '         +            FCdsDocPessoa.FieldByName('IDPESSOA').AsString +
         ' and    IDDOCUMENTO  = '         +            FCdsDocPessoa.FieldByName('IDDOCUMENTO').AsString;

         Result := ExecSQL( sSQL );
      end else
         Result := true;

      if not Result then
        raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

   except
      On E : Exception Do
      begin
        Result := False;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

constructor TCtrl_DocPessoa.Create;
begin
  inherited;
  FDb_DocPessoa  := TDb_DocPessoa.Create( self );
end;

destructor TCtrl_DocPessoa.Destroy;
begin
  FDb_DocPessoa.Free;
  if IsAppServer then FCdsDocPessoa.Free;
  inherited;
end;

function TCtrl_DocPessoa.ExcluirDocPessoa( iIdPessoa, iIdDocumento : integer; bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluirDocPessoa( iIdPessoa, iIdDocumento );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' delete from DOCPESSOA ' +
              ' where  IDPESSOA  =    ' + IntToStr( iIdPessoa );

      if iIdDocumento > 0 then
         sSQL := sSQL +
              ' and    IDDOCUMENTO =  ' + IntToStr( iIdDocumento );

      Result := ExecSQL( sSQL );

      if not Result then
        raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

   except
      On E : Exception Do
      begin
        Result := False;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

function TCtrl_DocPessoa.IncluirDocPessoa( bEmTransacao : boolean ): boolean;
var
  sCampo,
  sValor,
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluirDocPessoa( FCdsDocPessoa.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' insert into DOCPESSOA     ' +
              ' (           IDDOCUMENTO,  ' +
              '             IDPESSOA,     ' +
              '             NUMDOCUMENTO, ' +
              '             ORGAO,        ' +
              '             IDIMAGEM,     ' +
              '             IDPAIS,       ' +
              '             UF,           ' +
              '             DATAEMISSAO,  ' +
              '             IDESTADO,     ' +
              '             DATAVALIDADE  ' +
              ' ) values (                ';

      if FCdsDocPessoa.FieldByName('IDDOCUMENTO').IsNull then sSQL := sSQL + 'NULL, ' else
         sSQL := sSQL + FCdsDocPessoa.FieldByName('IDDOCUMENTO').AsString    + ', ';

      if FCdsDocPessoa.FieldByName('IDPESSOA').IsNull then sSQL := sSQL + 'NULL, ' else
         sSQL := sSQL + FCdsDocPessoa.FieldByName('IDPESSOA').AsString       + ', ';

      if FCdsDocPessoa.FieldByName('NUMDOCUMENTO').IsNull then sSQL := sSQL + 'NULL, ' else
         sSQL := sSQL + QuotedStr( FCdsDocPessoa.FieldByName('NUMDOCUMENTO').AsString ) + ', ';

      if FCdsDocPessoa.FieldByName('ORGAO').IsNull then sSQL := sSQL + 'NULL, ' else
         sSQL := sSQL + QuotedStr( FCdsDocPessoa.FieldByName('ORGAO').AsString )        + ', ';

      if FCdsDocPessoa.FieldByName('IDIMAGEM').IsNull then sSQL := sSQL + 'NULL, ' else
         sSQL := sSQL + FCdsDocPessoa.FieldByName('IDIMAGEM').AsString       + ', ';

      if FCdsDocPessoa.FieldByName('IDPAIS').IsNull then sSQL := sSQL + 'NULL, ' else
         sSQL := sSQL + QuotedStr( FCdsDocPessoa.FieldByName('IDPAIS').AsString )       + ', ';

      if FCdsDocPessoa.FieldByName('UF').IsNull then sSQL := sSQL + 'NULL, ' else
         sSQL := sSQL + QuotedStr( FCdsDocPessoa.FieldByName('UF').AsString )           + ', ';

      if FCdsDocPessoa.FieldByName('DATAEMISSAO').IsNull then sSQL := sSQL + 'NULL, ' else
         sSQL := sSQL + DateToStrOracle( FCdsDocPessoa.FieldByName('DATAEMISSAO').AsDateTime )  + ', ';

      if FCdsDocPessoa.FieldByName('IDESTADO').IsNull then sSQL := sSQL + 'NULL, ' else
         sSQL := sSQL + FCdsDocPessoa.FieldByName('IDESTADO').AsString       + ', ';

      if FCdsDocPessoa.FieldByName('DATAVALIDADE').IsNull then sSQL := sSQL + 'NULL  ' else
         sSQL := sSQL + DateToStrOracle( FCdsDocPessoa.FieldByName('DATAVALIDADE').AsDateTime ) + '  ';

      sSQL := sSQL +  ' ) ';

      Result := ExecSQL( sSQL );

      if not Result then raise Exception.Create( MessageInfo );

      if not bEmTransacao then Commit;

    except
      On E : Exception Do
      begin
        Result := False;
        if not bEmTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrl_DocPessoa.OnCreateAppServer;
begin
  inherited;
  FCdsDocPessoa := TCMClientDataSet.Create( nil );
end;

function TCtrl_DocPessoa.SelecionaDocPessoa( iIdPessoa, iIdDocumento: integer ): OleVariant;
begin
  FDb_DocPessoa.IdPessoa.AsInteger    := iIdPessoa;
  FDb_DocPessoa.IdDocumento.AsInteger := iIdDocumento;
  Result := GetDataPacket( FDb_DocPessoa.SSqlSelect );
end;

procedure TCtrl_DocPessoa.SetCdsDocPessoa(const Value: TCMClientDataSet);
begin
  FCdsDocPessoa := Value;
end;

procedure TCtrl_DocPessoa.SetDb_DocPessoa(const Value: TDb_DocPessoa);
begin
  FDb_DocPessoa := Value;
end;

end.
