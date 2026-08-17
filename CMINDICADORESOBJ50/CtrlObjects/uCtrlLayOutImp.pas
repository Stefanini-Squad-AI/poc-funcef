unit uCtrlLayOutImp;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE LAY OUT DE IMPORTAÇÃO DE PLANILHAS EXCEL  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Marcio Motta
//      Data de Início  :  19/03/2004
//      Data de Término :  19/03/2004
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaLayOutImp     -  Grava o Layout de uma importação em Planilha
//      LookupLayOutImp    -  Busca um Layout de uma importação em Planilha
//      LookupDetLayOutImp -  Busca o Layout detalhe
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbLayOutImp, uDbIndLayOutxInd;

type TCtrlLayOutImp = class(TCMControlObject)

     private
       FCdsLayOutImp    : TCMClientDataSet;
       FDbLayOutImp     : TDbLayOutImp;
       FCdsDetLayOutImp : TCMClientDataSet;
       FDbIndLayOutxInd : TDbIndLayOutxInd;

       procedure SetCdsLayOutImp(const Value: TCMClientDataSet);
       procedure SetDbLayOutImp (const Value: TDbLayOutImp);
       procedure SetCdsDetLayOutImp(const Value: TCMClientDataSet);
       procedure SetDbIndLayOutxInd(const Value: TDbIndLayOutxInd);

     protected
       procedure AfterInitialize; Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbLayOutImp     : TDbLayOutImp     read FDbLayOutImp     write SetDbLayOutImp;
       property DbIndLayOutxInd : TDbIndLayOutxInd read FDbIndLayOutxInd write SetDbIndLayOutxInd;
       property CdsLayOutImp    : TCMClientDataSet read FCdsLayOutImp    write SetCdsLayOutImp;
       property CdsDetLayOutImp : TCMClientDataSet read FCdsDetLayOutImp write SetCdsDetLayOutImp;

       function GravaLayOutImp : Boolean;
       function ExcluiLayOutImp : Boolean;
       function LookupLayOutImp(const iIdLayOutImp:Integer = -1) : OLEVariant;
       function LookupDetLayOutImp(const iIdLayOutImp:Integer = -1) : OLEVariant;

     published

end;

implementation

{ TCtrlGrpApuracao }

constructor TCtrlLayOutImp.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbLayOutImp     := TDBLayOutImp.Create( Self );
  FDbIndLayOutxInd := TDbIndLayOutxInd.Create( Self );
end;

destructor TCtrlLayOutImp.Destroy;
begin
  FDbLayOutImp.Free;
  FDbIndLayOutxInd.Free;

  if isAppServer then FCdsLayOutImp.Free;
  inherited;
end;

procedure TCtrlLayOutImp.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsLayOutImp := TCMClientDataSet.Create( nil );
end;

procedure TCtrlLayOutImp.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbLayOutImp.DataBaseName := DataBaseName;
  FDbIndLayOutxInd.DataBaseName := DataBaseName;
end;

function TCtrlLayOutImp.GravaLayOutImp: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaLayOutImp( CdsLayOutImp.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Grava Layout  ( Pai )
      Result := ApplyCds( CdsLayOutImp, DbLayOutImp, [], [] );
      if not Result then raise Exception.Create(DbLayOutImp.MessageInfo);

      // Grava Layout ( Filho )
        Result := ApplyCds( CdsDetLayOutImp, DbIndLayOutxInd, [DbLayOutImp.IdLayOutImp], [DbIndLayOutxInd.IdLayOutImp] );
        if not Result then raise Exception.Create( DbIndLayOutxInd.MessageInfo );
      //end;

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

function TCtrlLayOutImp.LookupLayOutImp(const iIdLayOutImp: Integer = -1): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam := '';
  if iIdLayOutImp <> -1  then sParam := sParam + ' AND IDLAYOUTIMP = ' + IntToStr(iIdLayOutImp);

  // Define Sql
  sSql := 'SELECT IDLAYOUTIMP,  DESCRICAO,  ' +#13+
          '       POSINDICADOR, POSVALOR,   ' +#13+
          '       POSCONTRATO,  FLGPOSICAO, ' +#13+
          '       FLGTIPOINDICADOR '          +#13+
          '  FROM INDLAYOUTIMP '                   +#13+
          ' WHERE 1=1 '                            +#13+
          sParam                                   +#13+
          'ORDER BY DESCRICAO';

  // Busca os dados do Sql
  Result := GetDataPacket( sSql );
end;

procedure TCtrlLayOutImp.SetCdsLayOutImp(const Value: TCMClientDataSet);
begin
  FCdsLayOutImp := Value;
end;

procedure TCtrlLayOutImp.SetDbLayOutImp(const Value: TDbLayOutImp);
begin
  FDbLayOutImp := Value;
end;

procedure TCtrlLayOutImp.SetCdsDetLayOutImp(const Value: TCMClientDataSet);
begin
  FCdsDetLayOutImp := Value;
end;

function TCtrlLayOutImp.LookupDetLayOutImp(const iIdLayOutImp: Integer = -1): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam := '';
  if iIdLayOutImp <> -1  then sParam := sParam + ' AND IL.IDLAYOUTIMP = ' + IntToStr(iIdLayOutImp);

  // Define Sql
  sSql := 'SELECT IL.IDLAYOUTIMP,  IL.IDINDICADOR, ' +#13+
          '       IL.POSINDICADOR, ID.DESCRICAO,   ' +#13+
          '       DECODE(IL.POSINDICADOR,1,''A'',  ' +#13+
          '                              2,''B'',  ' +#13+
          '                              3,''C'',  ' +#13+
          '                              4,''D'',  ' +#13+
          '                              5,''E'',  ' +#13+
          '                              6,''F'',  ' +#13+
          '                              7,''G'',  ' +#13+
          '                              8,''H'',  ' +#13+
          '                              9,''I'',  ' +#13+
          '                             10,''J'',  ' +#13+
          '                             11,''K'',  ' +#13+
          '                             12,''L'',  ' +#13+
          '                             13,''M'',  ' +#13+
          '                             14,''N'',  ' +#13+
          '                             15,''O'',  ' +#13+
          '                             16,''P'',  ' +#13+
          '                             17,''Q'',  ' +#13+
          '                             18,''R'',  ' +#13+
          '                             19,''S'',  ' +#13+
          '                             20,''T'',  ' +#13+
          '                             21,''U'',  ' +#13+
          '                             22,''V'',  ' +#13+
          '                             23,''X'',  ' +#13+
          '                             24,''W'',  ' +#13+
          '                             25,''Y'',  ' +#13+
          '                             26,''Z'',  ' +#13+
          '                              NULL) AS DSC_COLUNA' +#13+
          '  FROM INDLAYOUTXIND IL,INDINDICADOR ID'           +#13+
          ' WHERE IL.IDINDICADOR = ID.IDINDICADOR(+)'         +#13+
          sParam;

  // Busca os dados do Sql
  Result := GetDataPacket( sSql );
end;

procedure TCtrlLayOutImp.SetDbIndLayOutxInd(const Value: TDbIndLayOutxInd);
begin
  FDbIndLayOutxInd := Value;
end;

function TCtrlLayOutImp.ExcluiLayOutImp: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiLayOutImp( CdsLayOutImp.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Marca todos os filhos para exclusão
      CdsDetLayOutImp.First;
      while not CdsDetLayOutImp.Eof do CdsDetLayOutImp.Delete;

      // Grava exclusão do Layout ( Filho )
      Result := ApplyCds( CdsDetLayOutImp, DbIndLayOutxInd, [DbLayOutImp.IdLayOutImp], [DbIndLayOutxInd.IdLayOutImp] );
      if not Result then raise Exception.Create( DbIndLayOutxInd.MessageInfo );

      // Grava exclusão do Layout  ( Pai )
      Result := ApplyCds( CdsLayOutImp, DbLayOutImp, [], [] );
      if not Result then raise Exception.Create(DbLayOutImp.MessageInfo);

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

end.
