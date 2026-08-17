unit uCtrlElemBalPatr;

interface

Uses DB, uDataBase, uDbElemBalPatr, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables,
     uCMTypes;

  Type

    TCtrlElemBalPatr = Class(TCmControlObject)

    private
      _dbElemBalPatr  : TDbElemBalPatr;
      FCdsElemBalPatr : TClientDataSet;
      procedure SetCdsElemBalPatr(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsElemBalPatr: TClientDataSet Read FCdsElemBalPatr  Write SetCdsElemBalPatr;

      {Esta função tem como objetivo retornar registro(s) da tabela ElemBalPatr}
      Function ListElemBalPatr(iIdElemBalPatr: Integer) :OleVariant;
      {Esta função tem como objetivo retornar registro(s) da tabela ElemBalPatr}
      Function ListPosicao(iIdDemonstrativo:Double) :OleVariant;
      {Esta função tem o objetivo de gravar Elementos do Balanço Patrimonial}
      Function Gravar :Boolean;
      {Esta função tem o objetivo de preeencher o cds principal a tela elem. do bal. patr}
      Function ListCdsElemBalPatr(dIdElemBalPatr :Double) : OleVariant;
    protected
    End;


implementation


procedure TCtrlElemBalPatr.OnCreateAppServer;
begin
  inherited;
  CdsElemBalPatr := TClientDataSet.Create(nil);

end;


constructor TCtrlElemBalPatr.Create;
begin
  inherited;
  _dbElemBalPatr  := TDbElemBalPatr.Create(Self);
end;

destructor TCtrlElemBalPatr.Destroy;
begin
  inherited;

  _dbElemBalPatr.Free;

end;

function TCtrlElemBalPatr.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarElemBalPatr ( FcdsElemBalPatr.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsElemBalPatr,_dbElemBalPatr,[],[] );
           Msg    := _dbElemBalPatr.MessageInfo;
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

function TCtrlElemBalPatr.ListCdsElemBalPatr(dIdElemBalPatr :Double) :OleVariant;
var
  sSql :string;
begin
        sSql := 'SELECT                ' +
                '   B.IDELEMBALPATR,   ' +
                '   B.IDDEMONSTRATIVO, ' +
                '   B.IDELEMDEMONSTRAT, ' +
                '   B.ELEPOSICAO, ' +
                '   B.EBPDESCRICAO, ' +
                '   E.ELEDESCELEM ' +
                'FROM ' +
                '   ELEMBALPATR B, ELEMDEMONSTRATIVO E '+
                'WHERE '+
                '   (B.IDELEMBALPATR = ' + FloatToStr(dIdElemBalPatr) + ') AND ' +
                '   (B.IDELEMDEMONSTRAT=E.IDELEMDEMONSTRAT) '+
                'ORDER BY ' +
                '   E.ELEDESCELEM, '+
                '   B.ELEPOSICAO ';

      Result := GetDataPacket(sSql);

end;

function TCtrlElemBalPatr.ListElemBalPatr(iIdElemBalPatr: Integer) :OleVariant;
var
  sSql :string;
begin
        sSql := 'SELECT                ' +
                '  IDELEMBALPATR,      ' +
                '  IDDEMONSTRATIVO,    ' +
                '  IDELEMDEMONSTRAT,   ' +
                '  ELEPOSICAO,         ' +
                '  EBPDESCRICAO,       ' +
                'FROM                  ' +
                '  ELEMBALPATR         ' +
                'WHERE                 ' +
                '  (IDELEMBALPATR = ' + IntToStr(iIdElemBalPatr) + ')' +
                'ORDER BY  ELEPOSICAO ';

      Result := GetDataPacket(sSql);

end;

function TCtrlElemBalPatr.ListPosicao(iIdDemonstrativo: Double) :OleVariant;
var
  sSql, sFiltro, sOrdena :string;
begin
      sSql := 'SELECT                                  ' +
              '    ''                              ''  as POSICAO,  ' +
              '    B.IDELEMBALPATR,                    ' +
              '    B.IDDEMONSTRATIVO,                  ' +
              '    B.IDELEMDEMONSTRAT,                 ' +
              '    B.ELEPOSICAO,                       ' +
              '    B.EBPDESCRICAO,                     ' +
              '    E.ELEDESCELEM                       ' +
              'FROM                                    ' +
              '  ELEMBALPATR B, ELEMDEMONSTRATIVO E    ' +
              'WHERE                                   ' +
              '(B.IDELEMDEMONSTRAT=E.IDELEMDEMONSTRAT) ';

      // parte do filtro
      sFiltro := '';
      If (iIdDemonstrativo <> 0) Then
         sFiltro :=  ' AND (B.IDDEMONSTRATIVO = ' +FloatToStr(iIdDemonstrativo)+') ';

      sOrdena :=  'ORDER BY  B.ELEPOSICAO, E.ELEDESCELEM  ';

      sSql := sSql + sFiltro + sOrdena;

      Result := GetDataPacket(sSql);

end;



procedure TCtrlElemBalPatr.DoChangeDataBase;
begin
  inherited;
  _dbElemBalPatr.DataBaseName := DataBaseName;

end;

procedure TCtrlElemBalPatr.SetCdsElemBalPatr(const Value: TClientDataSet);
begin
  FCdsElemBalPatr := Value;
end;



end.
