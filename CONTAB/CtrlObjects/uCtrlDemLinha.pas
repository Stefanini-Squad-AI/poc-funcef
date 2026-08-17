unit uCtrlDemLinha;

interface

Uses DB, uDataBase, uDbDemLinha, uCmControlObject, dbclient, sysutils,
      Provider,  ComCtrls,CMProcuraMask, CMProcura,DBTables,
      uCMTypes;

  Type

    TCtrlDemLinha = Class(TCmControlObject)

    private
      FProximaOrdem :Double;
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbDemLinha  : TDbDemLinha;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsDemLinha : TClientDataSet;

      procedure SetCdsDemLinha(const Value: TClientDataSet);

    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property ProximaOrdem: Double Read FProximaOrdem  Write FProximaOrdem;
      property CdsDemLinha : TClientDataSet Read FCdsDemLinha  Write SetCdsDemLinha;

      {Esta função tem com objetivo preencher a combo de linhas da tabela colxLin}
      function ListLinha(IdDemonstrativo:Double) :OleVariant;
      {Esta função tem com objetivo retornar as linhas da tabela DemLinha}
      Function ListDemLinha(idLinha :Double) :OleVariant;
      {Esta função tem como objetivo gravar as linhas na tabela DemLinha}
      function Gravar :Boolean;
      {Esta função tem como objetivo retorna a proxima ordem de linha}
      function RetornaOdemLinha(iDemo:Double):Boolean;

    protected
    End;


implementation

constructor TCtrlDemLinha.Create;
begin
  inherited;
  _dbDemLinha  := TDbDemLinha.Create(Self);
end;

destructor TCtrlDemLinha.Destroy;
begin
  inherited;

  _dbDemLinha.Free;

  If IsAppServer Then FCdsDemLinha.Free;

end;

procedure TCtrlDemLinha.OnCreateAppServer;
begin
  inherited;
  FCdsDemLinha := TClientDataSet.Create(nil);

end;

function TCtrlDemLinha.RetornaOdemLinha(iDemo:Double):Boolean;
var
 sSql :string;
begin
      sSql := 'SELECT  MAX(ORDEMLINHA) AS PROXIMA ' +
              'FROM DEMLINHA ' +
              'WHERE IDDEMONSTRATIVO = ' + FloatToStr(iDemo);

     _cds.Data :=  GetDataPacket(sSql);

     If Not _cds.IsEmpty Then
     Begin
        Result := True;
        FProximaOrdem := _cds.FieldByName('PROXIMA').asFloat;
     End Else
     Begin
        Result        := False;
        FProximaOrdem := 0;
     End;

end;

function TCtrlDemLinha.Gravar :Boolean;
var
   Msg  : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarDemLinha(FcdsDemLinha.Data);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
     Try
         StartTransaction;

         //grava contas
         Result := ApplyCds(FcdsDemLinha,_dbDemLinha,[],[] );
         Msg    := _dbDemLinha.MessageInfo;
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


function TCtrlDemLinha.ListLinha(IdDemonstrativo:Double) :OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT ' +
              '  IDLINHA, NOMELINHA ' +
              'FROM ' +
              '  DEMLINHA ' +
              ' WHERE  ' +
              ' (IDDEMONSTRATIVO = ' + FloatToStr(idDemonstrativo) + ')' +
              'ORDER BY NOMELINHA ';

       Result := GetDataPacket(sSql);

end;

function TCtrlDemLinha.ListDemLinha(IdLinha:Double) :OleVariant;
var
  sSql, sFiltro :string;
begin
       sSql := 'SELECT '+
               '  IDLINHA, ' +
               '  IDDEMONSTRATIVO, ' +
               '  ORDEMLINHA, '+
               '  NOMELINHA, '+
               '  FLGNATUREZA, '+
               '  FLGMONETARIA, '+
               '  FLGPASSATRACO  ' +
              'FROM '+
              ' DEMLINHA ';
      //----------------------------------------------------------
      sfiltro := '';
      If (idLinha <> 0) Then
         sfiltro :=   'WHERE (IDLINHA = ' + FloatToStr(idLinha) + ') ';
     //----------------------------------------------------------
     sSql := sSql + sFiltro;

     Result := GetDataPacket(sSql);

end;



procedure TCtrlDemLinha.DoChangeDataBase;
begin
  inherited;
  _dbDemLinha.DataBaseName := DataBaseName;

end;

procedure TCtrlDemLinha.SetCdsDemLinha(const Value: TClientDataSet);
begin
  FCdsDemLinha := Value;
end;


end.
