unit uCtrlPCS;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes; {$ENDIF}

Type

  TCtrlPCS = class(TCmControlObject)
  private
    FCdsPCS: TCMClientDataSet;
  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;


    Function ListaCargo  (piIdPessjur : Integer) : OleVariant;
    Function ListaFuncao (piIdPessjur : Integer) : OleVariant;
    Function ListaRubrica(piIdPessjur : Integer) : OleVariant;

    Function ListaModoCargo : OleVariant;
    Function ListaModoFuncao: OleVariant;
    Function ListaSituacao  : OleVariant;

  published

end;

implementation

{ TCtrlPCS }
constructor TCtrlPCS.Create;
begin
  inherited;
end;

destructor TCtrlPCS.Destroy;
begin
  inherited;
end;

procedure TCtrlPCS.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlPCS.ListaCargo(piIdPessjur : Integer): OleVariant;
begin
  If piIdPessjur <= 0 Then Exit;

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaCargo( piIdPessjur );
  end else begin
    Result := GetDataPacket('SELECT DISTINCT '+
                            '  C.CODIGO AS CODCARGO, C.TITULO,          '+
                            '  CN.IDCARGOEXT, CN.IDNIVEL, CN.IDPESSJUR, '+
                            '  N.CODIGO                                 '+
                            'FROM '+
                            '  CARGOEXT C, NIVEL N, CARGOXNIVEL CN '+
                            'WHERE                                 '+
                            '      C.IDPESSJUR   = '+ IntToStr(piIdPessjur)+' '+
                            '  AND CN.IDPESSJUR  = C.IDPESSJUR  '+
                            '  AND CN.IDCARGOEXT = C.IDCARGOEXT '+
                            '  AND CN.IDPESSJUR  = N.IDPESSJUR  '+
                            '  AND CN.IDNIVEL    = N.IDNIVEL    '+
                            'ORDER BY '+
                            '  C.CODIGO, C.TITULO, N.CODIGO ');

  end;
end;

function TCtrlPCS.ListaFuncao(piIdPessjur : Integer): OleVariant;
Var
  sSQL : String;
begin
  If piIdPessjur <= 0 Then Exit;

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaFuncao( piIdPessjur );
  end else begin
    sSQL :='SELECT  '+
           '  F.IDPESSJUR, F.IDCARGOEXT, F.CODIGO, F.TITULO '+
           'FROM '+
           '  CARGOEXT F '+
           'WHERE '+
           '      F.IDPESSJUR   = '+ IntToStr(piIdPessjur)+' '+
           '  AND F.TIPO = ''F''  '+
           'ORDER BY '+
           '  F.CODIGO  ';

    Result := GetDataPacket( sSQL );
  end;
end;


function TCtrlPCS.ListaRubrica(piIdPessjur : Integer) : OleVariant;
Var
  sSQL : String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaRubrica( piIdPessjur );
  end else begin
    sSQL :='SELECT  '+
           '  RP.IDRUBRICA, RP.CODPROVDESC, RP.DESCRPROVDESC,                           '+
           '  P.FLGCOMPOESALPART, P.FLGCOMPOESALBENEF, P.FLGIRRF, P.FLGCOMPOEREMTOTAL,  '+
           '  P.FLGSALBENEFRETRO, P.FLGSALPARTATUARIA, P.FLGSALPARTRETRO                '+
           'FROM   '+
           '  RUBRICAXPESS RP, PROVDESC P '+
           'WHERE  '+
           '  RP.IDPESSOA      = '+ IntToStr(piIdPessjur)+' '+
           '  AND RP.IDRUBRICA = P.IDPROVENTO  '+
           '  AND P.FLGTPRUBRICA LIKE ''%P%''  '+
           'ORDER BY '+
           '  RP.DESCRPROVDESC ';

    Result := GetDataPacket( sSQL );
  end;
end;


function TCtrlPCS.ListaModoCargo: OleVariant;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaModoCargo;
  end else begin
    Result := GetDataPacket('SELECT ''EF'' AS CODIGO, ''EFETIVO'' AS DESCRICAO FROM DUAL UNION '+
                            'SELECT ''BC'' AS CODIGO, ''BOLSA DE CARGO'' AS DESCRICAO FROM DUAL');
  end;

end;

function TCtrlPCS.ListaModoFuncao: OleVariant;
Var
  sSQL : String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaModoFuncao;
  end else begin
    ssQL := 'SELECT 1 AS ORDEM, ''EF'' AS CODIGO, ''EFETIVA''   AS DESCRICAO FROM DUAL UNION '+
            'SELECT 2 AS ORDEM, ''AS'' AS CODIGO, ''ASSEGURADA''             FROM DUAL UNION '+
            'SELECT 3 AS ORDEM, ''ES'' AS CODIGO, ''EVENTUAL/SUBSTITUIÇÃO''  FROM DUAL UNION '+
            'SELECT 4 AS ORDEM, ''DP'' AS CODIGO, ''DESIGNAÇÃO POR PRAZO''   FROM DUAL UNION '+
            'SELECT 5 AS ORDEM, ''FA'' AS CODIGO, ''FACULTATIVA''            FROM DUAL UNION '+
            'SELECT 6 AS ORDEM, ''BF'' AS CODIGO, ''BOLSA DE FUNÇÃO''        FROM DUAL UNION '+
            'SELECT 7 AS ORDEM, ''ET'' AS CODIGO, ''ESTRATÉGICA''            FROM DUAL       ';
    Result := GetDataPacket( sSQL );
  end;

end;


function TCtrlPCS.ListaSituacao: OleVariant;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaModo;
  end else begin
    Result := GetDataPacket('SELECT ''AT'' AS FLGSITPART, ''Ativo''     AS DESCRICAO FROM DUAL UNION '+
                            'SELECT ''AS'' AS FLGSITPART, ''Assistido'' AS DESCRICAO FROM DUAL UNION '+
                            'SELECT ''XX'' AS FLGSITPART, ''Outros''    AS DESCRICAO FROM DUAL       ');
  end;

end;

end.






