unit uCtrlCampoDeParaCC;

interface

Uses DB, uDataBase, uDbCampoDeParaCC, uCmControlObject, dbclient, sysutils,Provider,
      ComCtrls,CMProcuraMask, CMProcura,DBTables,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlCampoDeParaCC = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbCampoDePara  : TDbCAmpoDeParaCC;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsCampoDePara : TClientDataSet;

      procedure SetcdsCampoDePara(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsCampoDePara: TClientDataSet Read FCdsCampoDePara Write SetCdsCampoDePara;

      {Esta função tem o Objetivo de retornar registros da tabela campo De-Para}
      Function ListaCampoDePara(dTabela :Double):OleVariant;

      Function Insert : Boolean;

      function Apagar :Boolean;

    End;


implementation

{ TCtrlCampoDeParaCC }



constructor TCtrlCampoDeParaCC.Create;
begin
  inherited;
  _dbCampoDePara  := TDbCampoDeParaCC.Create(Self);
end;



destructor TCtrlCampoDeParaCC.Destroy;
begin
  inherited;

  _dbCampoDePara.Free;
  if isAppServer then FCdsCampoDePara.Free;
end;



procedure TCtrlCampoDeParaCC.DoChangeDataBase;
begin
  inherited;
  _dbCampoDePara.DataBaseName := DataBaseName;

end;



procedure TCtrlCampoDeParaCC.SetCdsCampoDePara(const Value: TClientDataSet);
begin
  FCdsCampoDePara := Value;
end;



procedure TCtrlCampoDeParaCC.OnCreateAppServer;
begin
  inherited;
  FCdsCAmpoDePara := TClientDataSet.Create(nil);
end;



function TCtrlCampoDeParaCC.ListaCampoDePara(dTabela: Double): OleVariant;
var
  sSql, sFiltro, sOrdem :string;

begin
   sSql := 'SELECT '+
           '    IDCAMPODEPARACC, IDTABELADEPARACC, NOMECAMPO '+
           'FROM ' +
           '    CAMPODEPARACC ';

   //----------------------------------------------------------
   sfiltro := '';
   If (dTabela <> 0) Then
      sfiltro :=   'WHERE (IDTABELADEPARACC = ' + FloatToStr(dTabela) + ') ';
   //----------------------------------------------------------

   sOrdem := 'ORDER BY  NOMECAMPO ';

   sSql := Ssql + sFiltro + sOrdem;

   Result := GetDataPacket(sSql);
end;



function TCtrlCampoDeParaCC.Insert: Boolean;
begin
   try
      FCdsCampoDePara.FieldByName('IDCAMPODEPARACC').AsFloat := _dbCampoDePara.Idcampodepara.AsFloat;
      Result := True;
   except
      Result := False;
   end;
end;



function TCtrlCampoDeParaCC.Apagar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.Apagar ( FCdsCampoDePara.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FCdsCampoDePara,_dbCampoDePara,[],[] );
           Msg    := _dbCampoDePara.MessageInfo;
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



end.
