unit uCtrlWebTempoServico;

interface

Uses
  SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
  uCmFileUtils, db, uCtrlFuncoesAA;

Type
  TCtrlWebTempoServico = class(TCmControlObject)
  private
    FCdsTempoServico: TCMClientDataSet;
    procedure SetCdsTempoServico(const Value: TCMClientDataSet);
  public
    constructor Create; override;
    destructor Destroy; override;

    function SelecionaPessoa(pIdPessoa: Integer): OleVariant;
    function SelecionaTempoServico(pIdTempoServico: Integer): OleVariant;

    function IncluirTempoServico : Integer;
    function AlterarTempoServico : Boolean;
    function ExcluirTempoServico( iIdTempoServico : integer ) : Boolean;

    property CdsTempoServico : TCMClientDataSet read FCdsTempoServico write SetCdsTempoServico;

end;

implementation

procedure TCtrlWebTempoServico.SetCdsTempoServico(const Value: TCMClientDataSet);
begin
  FCdsTempoServico := Value;
end;

function TCtrlWebTempoServico.SelecionaPessoa(pIdPessoa: Integer): OleVariant;
begin         
  Result := GetDataPacket(
   ' SELECT HTS.IDPESSOA,     ' +
   '   HTS.IDHSTTEMPOSERVICO, ' +
   '   HTS.EMPRESA,           ' +
   '   HTS.DTINICIO,          ' +
   '   HTS.DTFIM,             ' +
   '   PES.NOME               ' +
   ' FROM HSTTEMPOSERVICO  HTS,        ' +
   '      PESSOA PES                   ' +
   ' WHERE PES.IDPESSOA = HTS.IDPESSOA ' +
   '   AND PES.IDPESSOA = ' + IntToStr(pIdPessoa));
end;

function TCtrlWebTempoServico.SelecionaTempoServico(pIdTempoServico: Integer): OleVariant;
begin         
  Result := GetDataPacket(
   ' SELECT HTS.IDPESSOA,        ' +
   '   HTS.IDHSTTEMPOSERVICO,    ' +
   '   HTS.EMPRESA,              ' +
   '   HTS.DTINICIO,             ' +
   '   HTS.DTFIM                 ' +
   '  FROM HSTTEMPOSERVICO  HTS  ' +
   ' WHERE HTS.IDHSTTEMPOSERVICO = ' + IntToStr(pIdTempoServico));
end;

function TCtrlWebTempoServico.IncluirTempoServico: Integer;
var
  sSQL : String;
  bOk : Boolean;
begin
  Result := 0;

  if (ConnectionSide = cnsClient) then begin
    bOk := ( Connection.AppServer.IncluirTempoServico( FCdsTempoServico.Data ) > 0 );
    if not (bOk) then begin
      MessageInfo := Connection.AppServer.MessageInfo;
    end;
  end else begin
    try  
      if not (FCdsTempoServico.State in [dsEdit, dsInsert]) then
      begin
        FCdsTempoServico.Edit;
        FCdsTempoServico.FieldByName('IDHSTTEMPOSERVICO').AsInteger := ProxId(Self, 'HSTTEMPOSERVICO');
        FCdsTempoServico.Post;
      end;

      StartTransaction;

      sSQL := ' insert into HSTTEMPOSERVICO    ' +
              ' (           IDHSTTEMPOSERVICO, ' +
              '             IDPESSOA,          ' +
              '             EMPRESA,           ' +
              '             DTINICIO,          ' +
              '             DTFIM              ' +
              ' ) values (                ' +
              FCdsTempoServico.FieldByName('IDHSTTEMPOSERVICO').AsString        + ', ' +
              FCdsTempoServico.FieldByName('IDPESSOA').AsString                 + ', ' +
              QuotedStr( AnsiUpperCase(FCdsTempoServico.FieldByName('EMPRESA').AsString)  )    + ', ' +
              'TO_DATE('+QuotedStr( FCdsTempoServico.FieldByName('DTINICIO').AsString    ) + ',''DD/MM/YYYY''), ' +
              'TO_DATE('+QuotedStr( FCdsTempoServico.FieldByName('DTFIM').AsString ) + ',''DD/MM/YYYY'')' +
              ' ) ';

      bOk := ExecSQL( sSQL );

      if not (bOk) then begin
        raise Exception.Create( MessageInfo );
      end;
      
      Commit;
      Result := FCdsTempoServico.FieldByName('IDHSTTEMPOSERVICO').AsInteger
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

function TCtrlWebTempoServico.AlterarTempoServico: Boolean;
var
  sSQL : string;
begin
  if (ConnectionSide = cnsClient) then begin
    Result := Connection.AppServer.AlterarTempoServico( FCdsTempoServico.Data );
    if not (Result) then begin
      MessageInfo := Connection.AppServer.MessageInfo;
    end;
  end else begin
    try  
      StartTransaction;

      sSQL := ' update HSTTEMPOSERVICO       '                                                         +
              ' set    IDPESSOA = ' + FCdsTempoServico.FieldByName('IDPESSOA').AsString              + ', ' +
              '        EMPRESA = ' + QuotedStr( AnsiUpperCase(FCdsTempoServico.FieldByName('EMPRESA').AsString) )   + ', ' +
              '        DTINICIO = TO_DATE(' + QuotedStr( FCdsTempoServico.FieldByName('DTINICIO').AsString ) + ',''DD/MM/YYYY''), ' +
              '        DTFIM = TO_DATE(' + QuotedStr( FCdsTempoServico.FieldByName('DTFIM').AsString ) + ',''DD/MM/YYYY'')' +
              ' where  IDHSTTEMPOSERVICO  = ' + FCdsTempoServico.FieldByName('IDHSTTEMPOSERVICO').AsString;
     
      Result := ExecSQL( sSQL );

      if not Result then begin
        raise Exception.Create( MessageInfo );
      end;
      
      Commit; 
   except
      On E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

function TCtrlWebTempoServico.ExcluirTempoServico(iIdTempoServico: Integer): Boolean;
var
  sSQL : string;
begin
  if (ConnectionSide = cnsClient) then begin
    Result := Connection.AppServer.ExcluirTempoServico( iIdTempoServico );
    if not (Result) then begin
      MessageInfo := Connection.AppServer.MessageInfo;
    end;
  end else begin
    try 
      StartTransaction;

      sSQL := ' delete from hsttemposervico  ' +
              ' where  idhsttemposervico  = ' + IntToStr( iIdTempoServico );

      Result := ExecSQL( sSQL );

      if not Result then begin
        raise Exception.Create( MessageInfo );
      end;
      
      Commit;
   except
      On E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

constructor TCtrlWebTempoServico.Create;
begin
  inherited;     
  FCdsTempoServico := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlWebTempoServico.Destroy;
begin
  inherited;
  FreeAndNil(FCdsTempoServico);  
end;

end.
