unit uCtrlApagaItemSCI;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,Classes,
     sysUtils, dbclient, uSistema,uMidasUtil, uCMTypes;

Const
   MSG_FIM_EXCLUSAO = ' Item(s) Excluido(s)';


Type
  TCtrlApagaItemSCI = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
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
    // Metodos de Presistencia
    //-------------------------------------------------------------------------
    {**
       Gera um lista com os itens pendentes de atendimento
    **}
    Function ListItensSCI( IdPessoa     : Integer;
                           NumSCI       : Double;
                           CodArtigo    : String;
                           CodGrupoProd : String ) : OleVariant;
    {**
       Exclui os itens tens pendentes de atendimento, e que não vão ser mais
       nececssários
    **}
    Function ApagarItem( Bilhete : String ) : Boolean;
    {**
       Lista as SCI´s com itens pendentes de atendimento, e que não vão ser mais
       nececssários
    **}
    Function ListComboSCI : OleVariant;

  End;


implementation

{ TCtrlApagaItemSCI }

function TCtrlApagaItemSCI.ApagarItem(Bilhete: String): Boolean;
Var
   Cont       : Integer;
   iMaxValor  : Integer;
   iProgresso : Integer;
   SQL        : String;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ApagarItem( FCds.Data, Bilhete);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

         Cont       := 0;
         iMaxValor  := FCds.RecordCount;
         iProgresso := 0;

         FCds.First;
         While Not FCds.Eof Do
         Begin
            DoProgresso([Bilhete,iMaxValor,iProgresso,'Excluindo...']);

            If FCds.FieldByName('FLAG').AsInteger = 1 Then
               Begin
                  Inc(Cont);

                  SQL := 'DELETE FROM ITEMSOLI WHERE (IDITEMSOLI = '+FCds.FieldByName('IDITEMSOLI').AsString+')';
                  If Not ExecSQL(SQL,True) Then
                     Raise Exception.Create( MessageInfo );
               End;
            FCds.Next;
            Inc(iProgresso);
         End;

         Commit;

         MessageInfo := IntToStr( Cont ) + MSG_FIM_EXCLUSAO ;

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

constructor TCtrlApagaItemSCI.Create;
begin
  inherited;

end;

destructor TCtrlApagaItemSCI.Destroy;
begin
  If IsAppServer Then
     FreeCds([FCds]);

  inherited;
end;

procedure TCtrlApagaItemSCI.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlApagaItemSCI.ListComboSCI: OleVariant;
Var
   SQL : TStringList;
Begin
   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add(' SELECT                 ');
      Sql.Add('                        ');
      Sql.Add('       SC.NUMSOLCOMPRA  ');
      Sql.Add(' FROM                   ');
      Sql.Add('       SOLICOMP SC,     ');
      Sql.Add('       ITEMSOLI IT      ');
      Sql.Add(' WHERE (1=1)            ');
      Sql.Add('   AND (IT.QTDEPENDENTE > 0    ) ');
      Sql.Add('   AND (IT.CODPROCESSO IS NULL) ');
      Sql.Add('   And (IT.IDCOMPRADOR IS NULL )  ');
      Sql.Add('   AND (SC.NUMSOLCOMPRA = IT.NUMSOLCOMPRA) ');
      Sql.Add(' GROUP BY SC.NUMSOLCOMPRA ');
      Sql.Add(' MINUS                    ');
      Sql.Add(' SELECT NUMSOLCOMPRA      ');
      Sql.Add(' FROM SCITEMOC            ');
      Sql.Add(' ORDER BY NUMSOLCOMPRA    ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlApagaItemSCI.ListItensSCI(IdPessoa : Integer; NumSCI: Double;
  CodArtigo, CodGrupoProd : String ): OleVariant;
Var
   SQL : TStringList;
Begin
   CodArtigo    := Copy( CodArtigo + '                  ',1,14);
   CodGrupoProd := Copy( CodGrupoProd + '                  ',1,10);

   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add(' SELECT                ');
      Sql.Add('	    (0) AS FLAG,      ');
      Sql.Add('	    IT.NUMSOLCOMPRA,  ');
      Sql.Add('	    IT.CODARTIGO,     ');
      Sql.Add('	    IT.CODMEDIDA,     ');
      Sql.Add('     IT.QTDEPEDIDA,    ');
      Sql.Add('     IT.IDPRODVARI,    ');
      Sql.Add('	    SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO, ');
      Sql.Add('     IT.IDITEMSOLI,                                                      ');
      Sql.Add('     P.CODGRUPOPROD,                                                     ');
      Sql.Add('     SC.DATAENTREGA AS NECESSIDADE                                       ');
      Sql.Add(' FROM                            ');
      Sql.Add('       ITEMSOLI IT,              ');
      Sql.Add('       SOLICOMP SC,              ');
      Sql.Add('       PRODUTO P,                ');
      Sql.Add('       ARTIGO A,                 ');
      Sql.Add('       PRODVARI PV               ');
      Sql.Add(' WHERE                           ');
      Sql.Add('       (IT.IDCOMPRADOR IS NULL ) ');
      Sql.Add('   AND (IT.QTDEPENDENTE > 0    ) ');
      If NumSCI >= 0 Then
        Sql.Add('   AND (IT.NUMSOLCOMPRA = '+FloatToStr(NumSCI)+')');
      If Trim(CodArtigo) <> '' Then
        Sql.Add('   AND (IT.CODARTIGO = '+ QuotedStr(CodArtigo )+')')
      Else
      If Trim(CodGrupoProd) <> '' Then
        Sql.Add('   AND (RTRIM(P.CODGRUPOPROD) = '+QuotedStr(CodGrupoProd)+') ');
      If IdPessoa > 0 Then
        Sql.Add('   AND (SC.IDPESSOA = '+IntToStr(IdPessoa)+')');

      Sql.Add('  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)');
      Sql.Add('  AND (IT.CODARTIGO = A.CODARTIGO)                      ');
      Sql.Add('  AND (A.CODPRODUTO = P.CODPRODUTO)                     ');
      Sql.Add('  AND (IT.IDPRODVARI = PV.IDPRODVARI(+))                ');
      Sql.Add('  ORDER BY DESCRICAO ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

procedure TCtrlApagaItemSCI.OnCreateAppServer;
begin
  inherited;

  FCds := TClientDataSet.Create(nil); 
end;

procedure TCtrlApagaItemSCI.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
