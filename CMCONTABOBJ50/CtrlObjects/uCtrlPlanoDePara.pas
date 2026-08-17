unit uCtrlPlanoDePara;

interface

Uses DB, uDataBase, uDbPlanoDePara, uCmControlObject, dbclient, sysutils,Provider,
      uCtrlGeral, ComCtrls,CMProcuraMask, CMProcura,DBTables,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlPlanoDePara = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbPlanoDePara  : TDbPlanoDePara;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsPlanoDePara : TClientDataSet;

      procedure SetcdsPlanoDePara(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsPlanoDePara: TClientDataSet Read FCdsPlanoDePara Write SetCdsPlanoDePara;

      {Esta função tem o Objetivo de retornar regsitros da tabela de Plano De-Para}
      Function ListPlanoDePara(dPlanoDePara :Double):OleVariant;

      {Esta função tem o Objetivo de retornar registros da tabela de De-Para}
      Function ListTabelaDePara:OleVariant;

      {Esta função tem o Objetivo de retornar registros da tabela campo De-Para}
      Function ListCampoDePara(dTabela :Double):OleVariant;


      {Esta função tem o objetivo de gravar registros na tabela Plano}
      function Gravar :Boolean;

    End;


implementation

{ TCtrlPlanoDePara }

constructor TCtrlPlanoDePara.Create;
begin
  inherited;
  _dbPlanoDePara  := TDbPlanoDePara.Create(Self);
end;

destructor TCtrlPlanoDePara.Destroy;
begin
  inherited;

  _dbPlanoDePara.Free;
  if isAppServer then FCdsPlanoDePara.Free;

end;


function TCtrlPlanoDePara.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarPlanoDePara ( FCdsPlanoDePara.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FCdsPlanoDePara,_dbPlanoDePara,[],[] );
           Msg    := _dbPlanoDePara.MessageInfo;
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


procedure TCtrlPlanoDePara.DoChangeDataBase;
begin
  inherited;
  _dbPlanoDePara.DataBaseName := DataBaseName;

end;

function TCtrlPlanoDePara.ListPlanoDePara(dPlanoDePara:Double): OleVariant;
var
  sSql, sfiltro :string;

begin
          sSql := 'SELECT  IDPLANODEPARA,  '+
                  '    CONTA1, PLANO1, CENTROCUSTO1, IDEMPRESA1, ' +
                  '    CONTA2, PLANO2, CENTROCUSTO2, IDEMPRESA2  ' +
                  'FROM  PLANODEPARA ';

      //----------------------------------------------------------
      sfiltro := '';
      If (dPlanoDePara <> 0) Then
         sfiltro :=   'WHERE (IDPLANODEPARA = ' + FloatToStr(dPlanoDePara) + ') ';
     //----------------------------------------------------------

     sSql := Ssql + sFiltro;

     Result := GetDataPacket(sSql);

end;

procedure TCtrlPlanoDePara.SetCdsPlanoDePara(const Value: TClientDataSet);
begin
  FCdsPlanoDePara := Value;
end;



procedure TCtrlPlanoDePara.OnCreateAppServer;
begin
  inherited;
  FCdsPlanoDePara := TClientDataSet.Create(nil);

end;

function TCtrlPlanoDePara.ListTabelaDePara: OleVariant;
var
  sSql :string;

begin
          sSql := 'SELECT '+
                  '    IDTABELADEPARA, NOMETABELA, '+
                  '    NOMECAMPOPLANO, IDTABELAREF '+
                  'FROM '+
                  '    TABELADEPARA '+
                  ' ORDER BY  '+
                  '    IDTABELAREF DESC ';



     Result := GetDataPacket(sSql);



end;
function TCtrlPlanoDePara.ListCampoDePara(dTabela: Double): OleVariant;
var
  sSql, sFiltro :string;

begin
          sSql := 'SELECT '+
                  '    IDCAMPODEPARA, IDTABELADEPARA, NOMECAMPOCONTA '+
                  'FROM ' +
                  '    CAMPODEPARA ';

      //----------------------------------------------------------
      sfiltro := '';
      If (dTabela <> 0) Then
         sfiltro :=   'WHERE (IDTABELADEPARA = ' + FloatToStr(dTabela) + ') ';
     //----------------------------------------------------------

     sSql := Ssql + sFiltro;

     Result := GetDataPacket(sSql);

end;

end.
