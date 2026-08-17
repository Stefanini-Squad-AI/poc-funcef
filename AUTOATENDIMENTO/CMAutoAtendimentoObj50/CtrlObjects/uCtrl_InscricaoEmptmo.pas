unit uCtrl_InscricaoEmptmo;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, DB, uCtrlFuncoesAA, JCLSysUtils;

Type

  TUpdateStatus = (usUnmodified, usModified, usInserted, usDeleted);

  TCtrl_InscricaoEmptmo = class(TCmControlObject)
  private
    FCdsInscricaoEmptmo: TCMClientDataSet;
    procedure SetCdsInscricaoEmptmo(const Value: TCMClientDataSet);

  protected

    procedure OnCreateAppServer; Override;

  public

    destructor Destroy; override;

    property CdsInscricaoEmptmo : TCMClientDataSet read FCdsInscricaoEmptmo write SetCdsInscricaoEmptmo;

    function SelecionaInscricaoEmptmo( iIdInscricaoEmptmo : extended ) : OleVariant;
    function IncluirInscricaoEmptmo : extended;
    function SelecionaDadosInscricao( iIdPessoa, iIdTitular : integer;
                                      iIdInscricaoEmptmo : extended;
                                      sFlgSituacao : string;
                                      iIdTipoEmptmo,
                                      iIdTipoContrEmptmo : extended ): OleVariant;

    function ExcluiInscricaoEmptmo(  iIdInscricaoEmptmo : extended  ) : Boolean;

    function TemContrato( iIdInscricaoEmptmo : extended ) : Boolean;

  published

end;

implementation

{ TCtrl_InscricaoEmptmo }


destructor TCtrl_InscricaoEmptmo.Destroy;
begin
  if IsAppServer then FCdsInscricaoEmptmo.Free;
  inherited;
end;



function TCtrl_InscricaoEmptmo.IncluirInscricaoEmptmo: extended;
var
  sSQL : string;
  bOk : boolean;
begin
  Result := 0;

  if ConnectionSide = cnsClient then
  begin
    bOk := ( Connection.AppServer.IncluirInscricaoEmptmo( FCdsInscricaoEmptmo.Data ) > 0 );
    if not bOk then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      if not ( FCdsInscricaoEmptmo.State in [dsEdit, dsInsert] ) then
      begin
        FCdsInscricaoEmptmo.Edit;
        FCdsInscricaoEmptmo.FieldByName('IDINSCRICAOEMPTMO').AsFloat := ProxIdFloat( Self, 'INSCRICAOEMPTMO' );
        FCdsInscricaoEmptmo.Post;
      end;

      StartTransaction;

      sSQL := ' insert into INSCRICAOEMPTMO    ' +
              ' (           IDINSCRICAOEMPTMO, ' +
              '             IDTIPOCONTREMPTMO, ' +
              '             IDPESSOA,          ' +
              '             IDPATRO,           ' +
              '             IDPLANOPREV,       ' +
              '             IDBENEF,           ' +
              '             FLGSITUACAO,       ' +
              '             IDCBANCARIA,       ' +
              '             IDCBANCARIADEB,    ' +              
              '             FLGFORMAREC,       ' +
              '             FLGFORMAPAG,       ' +
              '             CODFORMAPAG,       ' +
              '             PORTFORMAPAG,      ' +
              '             PORTFORMAREC,      ' +
              '             DATAINSC,          ' +
              '             VLRSOLIC,          ' +
              '             NUMPARCELAS,       ' +
              '             VLRSALBASE,        ' +
              '             VLRMARGEM,         ' +
              '             VLRMAXPERMIT,      ' +
              '             MOECODIGO,         ' +
              '             TXJUROS,           ' +
              '             FLGSUSPENSAOAUTO,  ' +
              '             FLGPENDENTE,       ' +
              '             FLGINTERNET,       ' +
              '             DATACREDITO,       ' +
              '             DATAENVIO          ' +
              ' ) values (                     ' +
              FCdsInscricaoEmptmo.FieldByName('IDINSCRICAOEMPTMO').AsString               + ', ' +
              FCdsInscricaoEmptmo.FieldByName('IDTIPOCONTREMPTMO').AsString               + ', ' +
              FCdsInscricaoEmptmo.FieldByName('IDPESSOA').AsString                        + ', ' +
              FCdsInscricaoEmptmo.FieldByName('IDPATRO').AsString                         + ', ' +
              FCdsInscricaoEmptmo.FieldByName('IDPLANOPREV').AsString                     + ', ' +
              FCdsInscricaoEmptmo.FieldByName('IDBENEF').AsString                         + ', ' +
              QuotedStr( FCdsInscricaoEmptmo.FieldByName('FLGSITUACAO').AsString )        + ', ' +
              Iff( trim( FCdsInscricaoEmptmo.FieldByName('IDCBANCARIA').AsString ) <> '',
               FCdsInscricaoEmptmo.FieldByName('IDCBANCARIA').AsString, 'null' )          + ', ' +
              Iff( trim( FCdsInscricaoEmptmo.FieldByName('IDCBANCARIADEB').AsString ) <> '',
               FCdsInscricaoEmptmo.FieldByName('IDCBANCARIADEB').AsString, 'null' )       + ', ' +
              QuotedStr( FCdsInscricaoEmptmo.FieldByName('FLGFORMAREC').AsString )        + ', ' +
              QuotedStr( FCdsInscricaoEmptmo.FieldByName('FLGFORMAPAG').AsString )        + ', ' +
              FCdsInscricaoEmptmo.FieldByName('CODFORMAPAG').AsString                     + ', ' +
              FCdsInscricaoEmptmo.FieldByName('PORTFORMAPAG').AsString                    + ', ' +
              FCdsInscricaoEmptmo.FieldByName('PORTFORMAREC').AsString                    + ', ' +
              '             SYSDATE,                                                           ' +
              OraNumero( FCdsInscricaoEmptmo.FieldByName('VLRSOLIC').AsString )           + ', ' +
              FCdsInscricaoEmptmo.FieldByName('NUMPARCELAS').AsString                     + ', ' +
              OraNumero( FCdsInscricaoEmptmo.FieldByName('VLRSALBASE').AsString )         + ', ' +
              OraNumero( FCdsInscricaoEmptmo.FieldByName('VLRMARGEM').AsString )          + ', ' +
              OraNumero( FCdsInscricaoEmptmo.FieldByName('VLRMAXPERMIT').AsString )       + ', ' +
              FCdsInscricaoEmptmo.FieldByName('MOECODIGO').AsString                       + ', ' +
              OraNumero( FCdsInscricaoEmptmo.FieldByName('TXJUROS').AsString )            + ', ' +
              '0                                                                             , ' +
              QuotedStr( 'N' )                                                            + ', ' +
              FCdsInscricaoEmptmo.FieldByName('FLGINTERNET').AsString                     + ', ' +
              DateToStrOracle( FCdsInscricaoEmptmo.FieldByName('DATACREDITO').AsDateTime )+ ', ' +
              '             SYSDATE                                                            ' +              
              ' ) ';

      bOk := ExecSQL( sSQL );

      if not bOk then raise Exception.Create( MessageInfo );

      Commit;

      Result := FCdsInscricaoEmptmo.FieldByName('IDINSCRICAOEMPTMO').AsFloat

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

procedure TCtrl_InscricaoEmptmo.OnCreateAppServer;
begin
  inherited;
  FCdsInscricaoEmptmo := TCMClientDataSet.Create( nil );
end;

function TCtrl_InscricaoEmptmo.SelecionaInscricaoEmptmo( iIdInscricaoEmptmo : extended ): OleVariant;
begin
  Result := GetDataPacket(
   ' select IDINSCRICAOEMPTMO,  ' +
   '        IDTIPOCONTREMPTMO,  ' +
   '        IDPESSOA,           ' +
   '        IDPATRO,            ' +
   '        IDPLANOPREV,        ' +
   '        IDBENEF,            ' +
   '        FLGSITUACAO,        ' +
   '        IDCBANCARIA,        ' +
   '        IDCBANCARIADEB,     ' +   
   '        FLGFORMAREC,        ' +
   '        FLGFORMAPAG,        ' +
   '        CODFORMAPAG,        ' +
   '        PORTFORMAPAG,       ' +
   '        PORTFORMAREC,       ' +
   '        DATAINSC,           ' +
   '        VLRSOLIC,           ' +
   '        NUMPARCELAS,        ' +
   '        VLRSALBASE,         ' +
   '        VLRMARGEM,          ' +
   '        VLRMAXPERMIT,       ' +
   '        MOECODIGO,          ' +
   '        VLRPARCELAMES,      ' +
   '        FLGINTERNET,        ' +
   '        TXJUROS,            ' +
   '        DATACREDITO         ' +
   ' from   INSCRICAOEMPTMO     ' +
   ' where  IDINSCRICAOEMPTMO = ' + FloatToStr( iIdInscricaoEmptmo ) );
end;


procedure TCtrl_InscricaoEmptmo.SetCdsInscricaoEmptmo(const Value: TCMClientDataSet);
begin
  FCdsInscricaoEmptmo := Value;
end;


function TCtrl_InscricaoEmptmo.SelecionaDadosInscricao( iIdPessoa, iIdTitular : integer;
                                                        iIdInscricaoEmptmo : extended;
                                                        sFlgSituacao : string;
                                                        iIdTipoEmptmo,
                                                        iIdTipoContrEmptmo : extended ): OleVariant;
var
  sWhere : string;
  sSQL : string; 
begin

  sWhere := '';
  if iIdInscricaoEmptmo > 0 then
    sWhere := sWhere + ' AND i.IDINSCRICAOEMPTMO = ' + FloatToStr( iIdInscricaoEmptmo );

  if sFlgSituacao <> '' then
    sWhere := sWhere + ' AND i.FLGSITUACAO = ' + QuotedStr( sFlgSituacao );

  if iIdTipoEmptmo > 0 then
    sWhere := ' AND te.IDTIPOEMPTMO = ' + FloatToStr( iIdTipoEmptmo );

  if iIdTipoContrEmptmo > 0 then
    sWhere := ' AND tc.IDTIPOCONTREMPTMO = ' + FloatToStr( iIdTipoContrEmptmo );

  sSQL :=
   ' select i.IDINSCRICAOEMPTMO,                                              ' +
   '        i.IDTIPOCONTREMPTMO,                                              ' +
   '        i.IDPESSOA,                                                       ' +
   '        i.IDPATRO,                                                        ' +
   '        i.IDPLANOPREV,                                                    ' +
   '        i.IDBENEF,                                                        ' +
   '        i.IDCBANCARIA,                                                    ' +
   '        i.IDCBANCARIADEB,                                                 ' +
   '        i.FLGFORMAREC,                                                    ' +
   '        i.FLGFORMAPAG,                                                    ' +
   '        i.CODFORMAPAG,                                                    ' +
   '        i.PORTFORMAPAG,                                                   ' +
   '        i.PORTFORMAREC,                                                   ' +
   '        i.DATAINSC,                                                       ' +
   '        i.VLRSOLIC,                                                       ' +
   '        i.NUMPARCELAS,                                                    ' +
   '        i.VLRSALBASE,                                                     ' +
   '        i.VLRMARGEM,                                                      ' +
   '        i.VLRMAXPERMIT,                                                   ' +
   '        i.MOECODIGO,                                                      ' +
   '        i.VLRPARCELAMES,                                                  ' +
   '        i.TXJUROS,                                                        ' +
   '        NVL(i.FLGINTERNET, 0) AS FLGINTERNET,                             ' +
   '        i.DATACREDITO,                                                    ' +
   '        i.FLGSITUACAO,                                                    ' +
   '        pa.NOME as PATRO,                                                 ' +
   '        pp.NOME as PLANO,                                                 ' +
   '        tc.TCEDESCRICAO,                                                  ' +
   '        te.DESCTIPOEMPTMO,                                                ' +
   '        bcp.NUMBANCO as NUMBANCOPAG,                                      ' +
   '        bnp.NOME AS BANCOPAG,                                             ' +
   '        agp.NUMAGENCIA as NUMAGENCIAPAG,                                  ' +
   '        anp.NOME AS AGENCIAPAG,                                           ' +
   '        cbp.CONTACORRENTE as CONTACORRENTEPAG,                            ' +
   '        bcr.NUMBANCO as NUMBANCOREC,                                      ' +
   '        bnr.NOME AS BANCOREC,                                             ' +
   '        agr.NUMAGENCIA as NUMAGENCIAREC,                                  ' +
   '        anr.NOME AS AGENCIAREC,                                           ' +
   '        cbr.CONTACORRENTE as CONTACORRENTEREC,                            ' +
   '        mo.MOESIGLA,                                                      ' +
   '        av.NOME as NOMEAVALISTA                                           ' +
   ' from   INSCRICAOEMPTMO    i,                                             ' +
   '        PESSOA            pa,                                             ' +
   '        PLANPREV          pp,                                             ' +
   '        TIPOCONTREMPTMO   tc,                                             ' +
   '        TIPOEMPTMO        te,                                             ' +
   '        CONTABANCARIA     cbp,                                            ' +
   '        PESSOA            anp,                                            ' +
   '        PESSOA            bnp,                                            ' +
   '        AGENCIABANCARIA   agp,                                            ' +
   '        BANCO             bcp,                                            ' +
   '        CONTABANCARIA     cbr,                                            ' +
   '        PESSOA            anr,                                            ' +
   '        PESSOA            bnr,                                            ' +
   '        AGENCIABANCARIA   agr,                                            ' +
   '        BANCO             bcr,                                            ' +
   '        MOEDA             mo,                                             ' +
   '        CONTRATOXAVALISTA ca,                                             ' +
   '        AVALISTA          av                                              ' +
   ' where                                                                    ' +
   '        i.IDPESSOA = ' + IntToStr( iIdTitular )                             +
   '   and  i.IDBENEF  = ' + IntToStr( iIdPessoa )                              + 
   sWhere                                                                       +
   '   and  i.IDPATRO           = pa.IDPESSOA                                 ' +
   '   and  i.IDPLANOPREV       = pp.IDPLANOPREV                              ' +
   '   and  i.IDTIPOCONTREMPTMO = tc.IDTIPOCONTREMPTMO(+)                     ' +
   '   and  i.IDCBANCARIA       = cbp.IDCBANCARIA(+)                          ' +
   '   and  i.IDCBANCARIADEB    = cbr.IDCBANCARIA(+)                          ' +
   '   and  tc.IDTIPOEMPTMO     = te.IDTIPOEMPTMO(+)                          ' +
   '   and  cbp.IDAGENCIA       = anp.IDPESSOA(+)                             ' +
   '   and  cbp.IDAGENCIA       = agp.IDPESSOA(+)                             ' +
   '   and  agp.IDBANCO         = bnp.IDPESSOA(+)                             ' +
   '   and  agp.IDBANCO         = bcp.IDPESSOA(+)                             ' +
   '   and  cbr.IDAGENCIA       = anr.IDPESSOA(+)                             ' +
   '   and  cbr.IDAGENCIA       = agr.IDPESSOA(+)                             ' +
   '   and  agr.IDBANCO         = bnr.IDPESSOA(+)                             ' +
   '   and  agr.IDBANCO         = bcr.IDPESSOA(+)                             ' +
   '   and  i.IDINSCRICAOEMPTMO = ca.IDINSCRICAOEMPTMO (+)                    ' +
   '   and  ca.IDAVALISTA       = av.IDAVALISTA (+)                           ' +
   '   and  i.MOECODIGO         = mo.MOECODIGO(+)                             ' ;

  Result := GetDataPacket( sSQL );
end;

function TCtrl_InscricaoEmptmo.ExcluiInscricaoEmptmo(iIdInscricaoEmptmo: extended): Boolean;
begin
  try

    StartTransaction;

    ExecSql(' DELETE FROM CONTRATOXAVALISTA ' +
            ' WHERE  IDINSCRICAOEMPTMO =    ' + FloatToStr(iIdInscricaoEmptmo) );

    ExecSql(' DELETE FROM CONTRATOXBENEFSEG ' +
            ' WHERE  IDINSCRICAOEMPTMO =    ' + FloatToStr(iIdInscricaoEmptmo) );

    ExecSql(' DELETE FROM HISTMOVINSCRICAO  ' +
            ' WHERE  IDINSCRICAOEMPTMO =    ' + FloatToStr(iIdInscricaoEmptmo) );

    ExecSql(' DELETE FROM INSCRICAOEMPTMO   ' +
            ' WHERE  IDINSCRICAOEMPTMO =    ' + FloatToStr(iIdInscricaoEmptmo) );

    Result := TRUE;

    Commit;

  except
   On E:Exception Do
   begin
     RollBack;
     MessageInfo := 'Erro ao excluir a inscrição número ' + FloatToStr( iIdInscricaoEmptmo )
      + '. '+ E.Message;
     Result := False;
   end;
  end;
end;


function TCtrl_InscricaoEmptmo.TemContrato(iIdInscricaoEmptmo: extended): Boolean;
  var cdsLocal : TcmClientDataSet;
begin
  cdsLocal := TcmClientDataSet.Create(nil);
  try
    cdsLocal.Data := GetDataPacket(' SELECT IDINSCRICAOEMPTMO   ' +
                                   ' FROM   CONTRATOEMPTMO      ' +
                                   ' WHERE  IDINSCRICAOEMPTMO = ' + FloatToStr(iIdInscricaoEmptmo));
    Result := not cdsLocal.IsEmpty;
  finally
    cdsLocal.Free;
  end;
end;

end.
