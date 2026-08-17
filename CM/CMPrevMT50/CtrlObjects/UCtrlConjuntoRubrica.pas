unit UCtrlConjuntoRubrica;
{
// Alterações:
----------------------------------------------------------------------------------------------------
Rotina           : SelecionaRubricaNaoAssociada e SelecionaRubricaAssociada
N. SIG.......... : 126044
Data da Alterao: : 01/06/2022
Responsvel:      : Andr Imakawa
Descrio.......   : Tibero est transformando o campo em MEMO.
----------------------------------------------------------------------------------------------------

Autor     : Renato Visoni
Data      : 17/04/2009
Rotina    : SelecionaRubricaNaoAssociada e SelecionaRubricaAssociada
Pendência : SOL 68486 Kintana 532892
Descricao : O sistema não estava listando as rubricas com o FLGTPRUBRICA = P.
----------------------------------------------------------------------------------------------------
}


interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbConjuntoRubrica;

Type

  TCtrlConjuntoRubrica = class(TCmControlObject)
  private
    FCdsConjuntoRubrica: TCMClientDataSet;
    FDbConjuntoRubrica: TDbConjuntoRubrica;
    procedure SetCdsConjuntoRubrica(const Value: TCMClientDataSet);
    procedure SetDbConjuntoRubrica(const Value: TDbConjuntoRubrica);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbConjuntoRubrica : TDbConjuntoRubrica     read FDbConjuntoRubrica  write SetDbConjuntoRubrica;
    property CdsConjuntoRubrica : TCMClientDataSet read FCdsConjuntoRubrica write SetCdsConjuntoRubrica;

    function ListaConjuntoRubrica : OleVariant;
    function SelecionaConjuntoRubrica( iIdConjuntoRubrica : Integer ) : OleVariant;
    function ExisteConjuntoRubrica   ( iIdConjuntoRubrica : Integer ) : Boolean;
    function ExisteCodigo            ( iIdConjuntoRubrica : Integer;
                                       sCodigo : String ) : Boolean;
    function GravaConjuntoRubrica : Boolean;

    function SelecionaRubricaNaoAssociada( iIdConjuntoRubrica : Integer ) : OleVariant;
    function SelecionaRubricaAssociada   ( iIdConjuntoRubrica : Integer ) : OleVariant;

    function IncluiAssociacao            ( iIdConjuntoRubrica, iIdRubrica : Integer ) : Boolean;
    function ExcluiAssociacao            ( iIdConjuntoRubrica, iIdRubrica : Integer ) : Boolean;

  published

end;

implementation

{ TCtrlConjuntoRubrica }

constructor TCtrlConjuntoRubrica.Create;
begin
  inherited;
  FDbConjuntoRubrica  := TDbConjuntoRubrica.Create(Self);
  FCdsConjuntoRubrica := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlConjuntoRubrica.Destroy;
begin
  FDbConjuntoRubrica.Free;
  FCdsConjuntoRubrica.Free;
  inherited;
end;

procedure TCtrlConjuntoRubrica.DoChangeDataBase;
begin
  inherited;
  FDbConjuntoRubrica.DataBaseName := Self.DataBaseName;
end;


function TCtrlConjuntoRubrica.GravaConjuntoRubrica: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarConjuntoRubrica( CdsConjuntoRubrica.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsConjuntoRubrica, DbConjuntoRubrica, [], [] );

      Msg := DbConjuntoRubrica.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;


procedure TCtrlConjuntoRubrica.SetCdsConjuntoRubrica(const Value: TCMClientDataSet);
begin
  FCdsConjuntoRubrica := Value;
end;

procedure TCtrlConjuntoRubrica.SetDbConjuntoRubrica(const Value: TDbConjuntoRubrica);
begin
  FDbConjuntoRubrica := Value;
end;

function TCtrlConjuntoRubrica.SelecionaConjuntoRubrica( iIdConjuntoRubrica : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaConjuntoRubrica( iIdConjuntoRubrica );
  end else begin
    FDbConjuntoRubrica.IdConjuntoRubrica.AsInteger := iIdConjuntoRubrica;
    Result := GetDataPacket( FDbConjuntoRubrica.SSqlSelect );
  end;
end;


function TCtrlConjuntoRubrica.ExisteConjuntoRubrica(iIdConjuntoRubrica: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbConjuntoRubrica.IdConjuntoRubrica.AsInteger := iIdConjuntoRubrica;
    CdsConjuntoRubrica.Data := GetDataPacket( FDbConjuntoRubrica.SSqlSelect );
    Result := Not CdsConjuntoRubrica.IsEmpty;
  end;
end;


function TCtrlConjuntoRubrica.ExisteCodigo( iIdConjuntoRubrica : Integer;
                                            sCodigo : String ) : Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    CdsConjuntoRubrica.Data := GetDataPacket( 'SELECT '+
                                              '  IDCONJUNTORUBRICA, DESCRICAO, CODIGO '+
                                              'FROM '+
                                              '  CONJUNTORUBRICA '+
                                              'WHERE '+
                                              '  IDCONJUNTORUBRICA <> '+ IntToStr ( iIdConjuntoRubrica )  +' AND '+
                                              '  CODIGO            =  '+ QuotedStr( sCodigo )             +'     '+
                                              'ORDER BY DESCRICAO ' );

    Result := ( Not CdsConjuntoRubrica.IsEmpty );
  end;
end;

function TCtrlConjuntoRubrica.ListaConjuntoRubrica: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaConjuntoRubrica;
  end else begin
    Result := GetDataPacket( 'SELECT IDCONJUNTORUBRICA, DESCRICAO, CODIGO '+
                             'FROM CONJUNTORUBRICA ORDER BY DESCRICAO ' );
  end;
end;

function TCtrlConjuntoRubrica.SelecionaRubricaNaoAssociada(iIdConjuntoRubrica: Integer): OleVariant;
Var
  sSQL : String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaRubricaNaoAssociada;
  end else begin
    // TRATAR CÓDIGOS NÃO INFORMADOS
    sSQL := 'SELECT '+
            //' NVL(PRV.CODPROVDESC,PRV.IDPROVENTO) AS CODPROVDESC, PRV.IDPROVENTO, '+
            ' SUBSTR(NVL(PRV.CODPROVDESC,PRV.IDPROVENTO),0,255) AS CODPROVDESC, PRV.IDPROVENTO, '+ //Andre Imakawa - SIG 126044
            //' NVL(PRV.DESCRPROVDESC, PRV.DESCRICAO) AS DESCRICAO '+
            ' SUBSTR(NVL(PRV.DESCRPROVDESC, PRV.DESCRICAO),0,255) AS DESCRICAO '+                  // Andre Imakawa - SIG 126044
            'FROM '+
            '  PROVDESC PRV '+
            'WHERE '+
            '  PRV.IDPROVENTO NOT IN ( SELECT CXR.IDRUBRICA FROM '+
            '                          CONJUNTORUBXRUB CXR       '+
            '                          WHERE IDCONJUNTORUBRICA = '+ IntToStr ( iIdConjuntoRubrica ) + ' ) '+
            'AND ((FLGTPRUBRICA LIKE ''%B%'') OR (FLGTPRUBRICA = ''P'')) '+ // Renato Visoni SOL 68486 Kintana 532892 RUBRICA VINCULADA A FOLHA DE BENEFÍCIOS
            'ORDER BY PRV.DESCRICAO ' ;

    Result := GetDataPacket( sSQL );;
  end;

end;

function TCtrlConjuntoRubrica.SelecionaRubricaAssociada(iIdConjuntoRubrica: Integer): OleVariant;
Var
  sSQL : String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaRubricaAssociada;
  end else begin
    // TRATAR CÓDIGOS NÃO INFORMADOS
    sSQL := 'SELECT '+
            //' NVL(PRV.CODPROVDESC,PRV.IDPROVENTO) AS CODPROVDESC, PRV.IDPROVENTO, '+
            ' SUBSTR(NVL(PRV.CODPROVDESC,PRV.IDPROVENTO),0,255) AS CODPROVDESC, PRV.IDPROVENTO, '+  //Andre Imakawa - SIG 126044
            //' NVL(PRV.DESCRPROVDESC, PRV.DESCRICAO) AS DESCRICAO '+
            ' SUBSTR(NVL(PRV.DESCRPROVDESC, PRV.DESCRICAO),0,255) AS DESCRICAO '+                   //Andre Imakawa - SIG 126044
            'FROM '+
            '  PROVDESC PRV '+
            'WHERE '+
            '  PRV.IDPROVENTO IN ( SELECT CXR.IDRUBRICA FROM '+
            '                      CONJUNTORUBXRUB CXR       '+
            '                      WHERE IDCONJUNTORUBRICA = '+ IntToStr ( iIdConjuntoRubrica ) + ' ) '+
            'AND ((FLGTPRUBRICA LIKE ''%B%'') OR (FLGTPRUBRICA = ''P'')) '+ // Renato Visoni SOL 68486 Kintana 532892   RUBRICA VINCULADA A FOLHA DE BENEFÍCIOS
            'ORDER BY PRV.DESCRICAO ' ;

    Result := GetDataPacket( sSQL );;
  end;

end;

function TCtrlConjuntoRubrica.IncluiAssociacao(iIdConjuntoRubrica, iIdRubrica: Integer): Boolean;
Var
  sSQL : String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ExcluiAssociacao;
  end else begin
    sSQL := 'INSERT INTO CONJUNTORUBXRUB (IDCONJUNTORUBRICA, IDRUBRICA)'+
            'VALUES('+ IntToStr ( iIdConjuntoRubrica ) +', '+ IntToStr ( iIdRubrica )+ ') ';

    Result := ExecSQL( sSQL );
  end;

end;


function TCtrlConjuntoRubrica.ExcluiAssociacao(iIdConjuntoRubrica, iIdRubrica: Integer): Boolean;
Var
  sSQL : String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ExcluiAssociacao;
  end else begin
    sSQL := 'DELETE FROM '+
            '  CONJUNTORUBXRUB '+
            'WHERE '+
            '  IDCONJUNTORUBRICA = '+ IntToStr ( iIdConjuntoRubrica ) + ' AND '+
            '  IDRUBRICA         = '+ IntToStr ( iIdRubrica )         + '     ';

    Result := ExecSQL( sSQL );
  end;

end;

end.

