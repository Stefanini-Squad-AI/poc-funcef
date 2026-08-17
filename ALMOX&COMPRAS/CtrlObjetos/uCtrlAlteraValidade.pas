unit uCtrlAlteraValidade;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject, uCtrlMovEstoque, uCtrlUnMedida,
     sysUtils, dbclient, uSistema, uMidasUtil, uCMTypes, Mask, Classes;

Const
   MSG_NAO_SALDO_DATA = 'Produto não tem saldo sufuciente nesta data de validade';

Type
  TCtrlAlteraValidade  = class(TCmControlObject)
  Protected
     Procedure AfterInitialize; Override;
  private
    _MovEstoque : TCtrlMovEstoque;
    _UnMedida   : TCtrlUnMedida;

  Public
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function Procurar (IdItensRecDev : Double ): OleVariant;
   {**
      Função responsável pela alteração da data de validade do produto no
      recebimento de mercadoria
   **}
    Function Alterar( IdPessoa        : Integer;
                      IdItensRecDev   : Double;
                      CodAlmoxarifado : Integer;
                      CodArtigo       : String;
                      CodMedida       : String;
                      DataVelha       : TDateTime;
                      DataNova        : TDateTime;
                      Quantidade      : Double ) : Boolean;
  End;

implementation

{ TCtrlAlteraValidade }

procedure TCtrlAlteraValidade.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs( Self );
  _UnMedida.InitializeAs( Self );
end;

function TCtrlAlteraValidade.Alterar(IdPessoa : Integer; IdItensRecDev: Double;
  CodAlmoxarifado: Integer; CodArtigo,CodMedida : String; DataVelha, DataNova: TDateTime;
  Quantidade: Double): Boolean;
Var
   SQL    : String;
   rSaldo : Double;
Begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlteraValidade(IdItensRecDev, CodAlmoxarifado, CodArtigo,CodMedida, DataVelha, DataNova,  Quantidade );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

        //----------------------------------------------------------------------
        // Verifica se ha saldo na data nova para poder alterar a vailidade
        //----------------------------------------------------------------------
         Quantidade := _UnMedida.QtdeToUnCustoMedio(CodArtigo,CodMedida,Quantidade);
         rSaldo     := _MovEstoque.InfoSaldo(IdPessoa,CodArtigo,CodAlmoxarifado,DataNova);
         If Quantidade > rSaldo Then
            Raise Exception.Create( MSG_NAO_SALDO_DATA );

        //----------------------------------------------------------------------
        // Exclui o lote Anterior
        //----------------------------------------------------------------------
         IF Not _MovEstoque.SaiLoteVali( CodAlmoxarifado,
                                         CodArtigo,
                                         DataVelha,
                                         Quantidade*-1, -1 )
         Then
            Raise Exception.Create( _MovEstoque.MessageInfo );

        //---------------------------------------------------------------------
        // Entra com o novo lote
        //---------------------------------------------------------------------
         IF Not _MovEstoque.EntraLoteVali( CodAlmoxarifado,
                                           CodArtigo,
                                           DataVelha,
                                           Quantidade )
         Then
            Raise Exception.Create( _MovEstoque.MessageInfo );

        //----------------------------------------------------------------------
        // Atualiza a data na tabela dos itens nota
        //----------------------------------------------------------------------
         SQL := ' UPDATE ITENSRECEBDEVOL SET  '+
                ' DATAVALIDADE = TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',DataNova))+',''DD/MM/YYYY'')'+
                ' WHERE ( IDITENSRECDEV = '+FloatToStr(IdItensRecDev)+')';

         If Not ExecSQL(SQL,True) Then
            Raise Exception.Create( MessageInfo );

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

constructor TCtrlAlteraValidade.Create;
begin
  inherited;
  _MovEstoque := TCtrlMovEstoque.Create;
  _UnMedida   := TCtrlUnMedida.Create;
end;

destructor TCtrlAlteraValidade.Destroy;
begin
  _MovEstoque.Free;
  _UnMedida.Free;

  inherited;
end;

function TCtrlAlteraValidade.Procurar(IdItensRecDev: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Add('SELECT                     ');
      SQL.Add('      I.IDITENSRECDEV,     ');  
      SQL.Add('      I.NUMOC,             ');  
      SQL.Add('      I.CODARTIGO,         ');  
      SQL.Add('      I.CODALMOXARIFADO,   ');  
      SQL.Add('      I.CODMEDIDA,         ');  
      SQL.Add('      I.IDMOV,             ');  
      SQL.Add('      I.IDPESSOA,          ');  
      SQL.Add('      I.IDNFRECEBDEVOL,    ');
      SQL.Add('      I.QTDERECEBDEVOL,    ');  
      SQL.Add('      I.VLRUNITARIO,       ');  
      SQL.Add('      I.VLRESTOQUE,        ');  
      SQL.Add('      (I.QTDERECEBDEVOL* I.VLRUNITARIO) AS VALORTOTAL, ');  
      SQL.Add('      I.DATAVALIDADE,      ');  
      SQL.Add('      I.IDPRODVARI,        ');  
      SQL.Add('      SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60)  AS DESCPROD, ');  
      SQL.Add('      TO_CHAR(NF.NUMNF) || ''/'' || (NF.COMPLNF) AS NUMNOTA, ');
      SQL.Add('      PE.RAZAOSOCIAL       ');  
      SQL.Add('FROM                       ');  
      SQL.Add('      ITENSRECEBDEVOL I,   ');  
      SQL.Add('      NFRECEBDEVOL NF,     ');  
      SQL.Add('      PESSOA PE,           ');  
      SQL.Add('      PRODUTO P,           ');  
      SQL.Add('      ARTIGO A,            ');
      SQL.Add('      PRODVARI PV          ');
      SQL.Add('WHERE                      ');
      SQL.Add('        (I.IDNFRECEBDEVOL = '+FloatToStr(IdItensRecDev)+') ');
      SQL.Add('    AND (I.DATAVALIDADE IS NOT NULL)          ');
      SQL.Add('    AND (I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL)');
      SQL.Add('    AND (NF.IDFORCLI = PE.IDPESSOA)           ');
      SQL.Add('    AND (I.CODARTIGO = A.CODARTIGO)           ');
      SQL.Add('    AND (P.CODPRODUTO = A.CODPRODUTO)         ');
      SQL.Add('    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)     ');

      Result := GetDataPacket( SQL.Text );
      
   Finally
      SQL.Free;
   End;
end;

end.
