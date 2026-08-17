unit uCtrlArtxForn;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,uDbArtxForn,
     sysUtils, dbclient, uSistema,uMidasUtil, Classes, uCMTypes;

Type
  TCtrlArtxForn = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
     _DbArtxForn : TDbArtxForn;
    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
   {**
      Atribui os Artigo para o Fornecedor
    **}
    Function  AtribuirArtigo : Boolean;
   {**
      Informa os Artigo que não forma associados ao Fornecedor
    **}
    Function  ListArtigoDisponivel( IdForCli : Double; CodGrupoProd : String = '' ) : OleVariant;
   {**
      Informa os Artigo Selecionados
   **}
    Function Procurar( IdForCli : Double = 0 ) : OleVariant;

  End;

implementation

{ TCtrlArtxForn }

function TCtrlArtxForn.AtribuirArtigo: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AtribuirArtigo( Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds( fcds, _DbArtxForn, [], []);
           Msg    := _DbArtxForn.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
           except
              On E:Exception Do
               Begin
                 Rollback;
                 Result := False;
                 MessageInfo := E.Message;
              End;
           End;
     End;
end;

constructor TCtrlArtxForn.Create;
begin
  inherited;
  _DbArtxForn := TDbArtxForn.Create(Self);

end;

destructor TCtrlArtxForn.Destroy;
begin
  If isAppServer Then
     FreeCds([Fcds]);

  _DbArtxForn.Free;


  inherited;

end;

procedure TCtrlArtxForn.DoChangeDataBase;
begin
  inherited;
  _DbArtxForn.DatabaseName  := DatabaseName;
end;

function TCtrlArtxForn.ListArtigoDisponivel( IdForCli : Double; CodGrupoProd : String = '' ) : OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT     '+
          '     A.CODARTIGO, '+
          '     P.DESCPROD   '+
          ' FROM             '+
          '     ARTIGO A,    '+
          '     PRODUTO P    '+
          ' WHERE (1=1)      ';

   If Trim(CodGrupoProd) <> '' Then
      Begin
         CodGrupoProd := Copy( CodGrupoProd + '           ',1,10);
         SQL := SQL +'  AND (P.CODGRUPOPROD = '+QuotedStr( CodGrupoProd )+') ';
      End;

   SQL := SQL +'   AND (A.CODARTIGO NOT IN(SELECT CODARTIGO FROM ARTXFORN '+
               '                           WHERE (IDFORCLI = '+FloatToStr( IdForCli )+') )  ) '+
               '   AND (A.CODPRODUTO = P.CODPRODUTO) '+
               ' ORDER BY P.DESCPROD  ';
   //
   Result := GetDataPacket( SQL );
end;

procedure TCtrlArtxForn.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

Function TCtrlArtxForn.Procurar(IdForCli: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create ;
   Try
      SQL.Clear;
      SQL.Append('SELECT               ');
      SQL.Append('      AXF.IDFORCLI,  ');
      SQL.Append('      AXF.CODARTIGO, ');
      SQL.Append('      P.DESCPROD     ');
      SQL.Append('FROM                 ');
      SQL.Append('      ARTXFORN AXF,  ');
      SQL.Append('      PRODUTO P,     ');
      SQL.Append('      ARTIGO A       ');
      SQL.Append('WHERE                ');
      SQL.Append('       (AXF.IDFORCLI  = '+FloatToStr( IdForCli )+')');
      SQL.Append('   AND (AXF.CODARTIGO = A.CODARTIGO)');
      SQL.Append('   AND (P.CODPRODUTO  = A.CODPRODUTO)');
      SQL.Append('ORDER BY P.DESCPROD ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

procedure TCtrlArtxForn.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
