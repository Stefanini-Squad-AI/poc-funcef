{
--------------------------------------------------------------------------------
Pendência   : SOL 144873 KINTANA 961354
Responsável : BRUNO AZEVEDO
Data        : 08/12/2010
Descrição   : Ajustes para atender as necessidades do cliente.
--------------------------------------------------------------------------------
}
unit uCtrl_Depentit;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDb_Depentit, DB, uCtrlFuncoesAA,uCmFileUtils;

Type

  TUpdateStatus = (usUnmodified, usModified, usInserted, usDeleted);

  TCtrl_Depentit = class(TCmControlObject)
  private
    FCdsDepentit: TCMClientDataSet;
    FDb_Depentit: TDb_Depentit;
    procedure SetCdsDepentit(const Value: TCMClientDataSet);
    procedure SetDb_Depentit(const Value: TDb_Depentit);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property Db_Depentit : TDb_Depentit read FDb_Depentit write SetDb_Depentit;
    property CdsDepentit : TCMClientDataSet read FCdsDepentit write SetCdsDepentit;

    function SelecionaDepentit( iIdPessoa, iIdTitular : integer ) : OleVariant;

    function IncluirDepentit( bEmTransacao : boolean = False ) : Boolean;
    function AlterarDepentit( bEmTransacao : boolean = False ) : Boolean;
    function ExcluirDepentit( iIdPessoa, iIdTitular : integer; bEmTransacao : boolean = False ) : Boolean;

  published

end;

implementation

{ TCtrl_Depentit }

procedure TCtrl_Depentit.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDb_Depentit.DataBaseName    := DataBaseName
  else
    FDb_Depentit.DbAdoConnection := DbAdoConnection;
end;

function TCtrl_Depentit.AlterarDepentit( bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlterarDepentit( FCdsDepentit.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' update DEPENTIT           '                                                                   +
              ' set    NUMSEQUENCIA     = ' + FCdsDepentit.FieldByName('NUMSEQUENCIA').AsString               + ', ' +
              '        IDDEPENDENCIA    = ' + QuotedStr( FCdsDepentit.FieldByName('IDDEPENDENCIA').AsString ) + ', ' +
              '        FLGCONTAIMPOSTOR = ' + FCdsDepentit.FieldByName('FLGCONTAIMPOSTOR').AsString           + ', ' +
              '        FLGCONTASALARIOF = ' + FCdsDepentit.FieldByName('FLGCONTASALARIOF').AsString           + ', ' +
              '        FLGDESIGNADO     = ' + FCdsDepentit.FieldByName('FLGDESIGNADO').AsString               + ', ' +
              '        FLGDEPLEGAL      = ' + FCdsDepentit.FieldByName('FLGDEPLEGAL').AsString                + ', ';

              if (FCdsDepentit.FieldByName('FIMIMPOSTOR').AsString <> '') then begin
                sSQL := sSQL + ' FIMIMPOSTOR = ' + DateToStrOracle( FCdsDepentit.FieldByName('FIMIMPOSTOR').AsDateTime ) + ', ';
              end else begin
                sSQL := sSQL + ' FIMIMPOSTOR = NULL, '; 
              end;

              if (FCdsDepentit.FieldByName('INICIOIMPOSTOR').AsString <> '') then begin
                sSQL := sSQL + ' INICIOIMPOSTOR = ' + DateToStrOracle( FCdsDepentit.FieldByName('INICIOIMPOSTOR').AsDateTime ) + ', ';
              end else begin
                sSQL := sSQL + ' INICIOIMPOSTOR = NULL, ';
              end;

              //BRUNO AZEVEDO SOL 124179 KINTANA 651468
              sSQL := sSQL + '        FLGDEPIR         = ' + FCdsDepentit.FieldByName('FLGDEPIR').AsString                   + ', ' +
              '        FLGDEPINVALIDO   = ' + FCdsDepentit.FieldByName('FLGDEPINVALIDO').AsString             +
              //BRUNO AZEVEDO SOL 124179 KINTANA 651468

              ' where  IDPESSOA         = ' + FCdsDepentit.FieldByName('IDPESSOA').AsString                   +
              '   and  IDTITULAR        = ' + FCdsDepentit.FieldByName('IDTITULAR').AsString                  ;

      //CMDebugToFile(sSQL , 'C:\AAErro.txt' );
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

constructor TCtrl_Depentit.Create;
begin
  inherited;
  FDb_Depentit  := TDb_Depentit.Create( self );
end;

destructor TCtrl_Depentit.Destroy;
begin
  FDb_Depentit.Free;
  if IsAppServer then FCdsDepentit.Free;
  inherited;
end;

function TCtrl_Depentit.ExcluirDepentit( iIdPessoa, iIdTitular : integer; bEmTransacao : boolean ): Boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluirDepentit( iIdPessoa, iIdTitular );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' delete from DEPENTIT  ' +
              ' where  IDPESSOA  = ' + IntToStr( iIdPessoa ) +
              ' and    IDTITULAR = ' + IntToStr( iIdTitular );

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

function TCtrl_Depentit.IncluirDepentit( bEmTransacao : boolean ): boolean;
var
  sSQL : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluirDepentit( FCdsDepentit.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not bEmTransacao then StartTransaction;

      sSQL := ' insert into DEPENTIT          ' +
              ' (           IDPESSOA,         ' +
              '             IDTITULAR,        ' +
              '             NUMSEQUENCIA,     ' +
              '             IDDEPENDENCIA,    ' +
              '             FLGCONTAIMPOSTOR, ' +
              '             FLGCONTASALARIOF, ' +
              '             FLGDESIGNADO,     ' +
              '             FLGDEPLEGAL,      ' +

              '             DATACADASTRO,     ' +
              '             INICIOIMPOSTOR,   ' +
              //BRUNO AZEVEDO SOL 124179 KINTANA 651468
              '             FLGDEPIR,         ' +
              '             FLGDEPINVALIDO    ' +
              //BRUNO AZEVEDO SOL 124179 KINTANA 651468
              
              ' ) values (                    ' +
              FCdsDepentit.FieldByName('IDPESSOA').AsString                   + ', ' +
              FCdsDepentit.FieldByName('IDTITULAR').AsString                  + ', ' +
              FCdsDepentit.FieldByName('NUMSEQUENCIA').AsString               + ', ' +
              QuotedStr( FCdsDepentit.FieldByName('IDDEPENDENCIA').AsString ) + ', ' +
              FCdsDepentit.FieldByName('FLGCONTAIMPOSTOR').AsString           + ', ' +
              FCdsDepentit.FieldByName('FLGCONTASALARIOF').AsString           + ', ' +
              FCdsDepentit.FieldByName('FLGDESIGNADO').AsString               + ', ' +
              FCdsDepentit.FieldByName('FLGDEPLEGAL').AsString                + ', ' + 

              DateToStrOracle( FCdsDepentit.FieldByName('DATACADASTRO').AsDateTime ) + ', ';

              if (FCdsDepentit.FieldByName('INICIOIMPOSTOR').AsString <> '') then begin
                sSQL := sSQL + DateToStrOracle( FCdsDepentit.FieldByName('INICIOIMPOSTOR').AsDateTime ) + ', ';
              end else begin
                sSQL := sSQL + 'null, ';
              end;

              //BRUNO AZEVEDO SOL 124179 KINTANA 651468
              sSQL := sSQL + FCdsDepentit.FieldByName('FLGDEPIR').AsString                   + ', ' +
              FCdsDepentit.FieldByName('FLGDEPINVALIDO').AsString             +
              //BRUNO AZEVEDO SOL 124179 KINTANA 651468

              ' ) ';

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

procedure TCtrl_Depentit.OnCreateAppServer;
begin
  inherited;
  FCdsDepentit := TCMClientDataSet.Create( nil );
end;

function TCtrl_Depentit.SelecionaDepentit( iIdPessoa, iIdTitular : integer ) : OleVariant;
begin
  FDb_Depentit.Idpessoa.AsInteger := iIdPessoa;
  FDb_Depentit.Idtitular.AsInteger := iIdTitular;
  Result := GetDataPacket( FDb_Depentit.SSqlSelect );
end;

procedure TCtrl_Depentit.SetCdsDepentit(const Value: TCMClientDataSet);
begin
  FCdsDepentit := Value;
end;

procedure TCtrl_Depentit.SetDb_Depentit(const Value: TDb_Depentit);
begin
  FDb_Depentit := Value;
end;


end.
