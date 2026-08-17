unit uCtrlEventoSRH;

interface

Uses DB, uDataBase, uDbEventoSRH, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables,
    {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlEventoSRH = Class(TCmControlObject)

    private
      FUnidNegoc    :Double;
      FUneCodigo    :String;
      FNomeAtivProj :String;
      FAchouAtiv    :Boolean;
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbEventoSRH  : TDbEventoSRH;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsEventoSRH : TClientDataSet;

      procedure SetCdsEventoSRH(const Value: TClientDataSet);

      procedure SetUneCodigo(const Value: string);
      procedure SetNomeAtivProj(const Value: string);
      procedure SetUnidNegoc(const Value: double);
      procedure SetAchouAtiv(const Value: Boolean);

     protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property UneCodigo   : string  read FUneCodigo    write SetUneCodigo;
      property NomeAtivProj: string  read FNomeAtivProj write SetNomeAtivProj;
      property UnidNegoc   : double  read FUnidNegoc    write SetUnidNegoc;
      property AchouAtiv   : Boolean read FAchouAtiv    write SetAchouAtiv;

      property CdsEventoSRH: TClientDataSet read FCdsEventoSRH write SetCdsEventoSRH;

      {Esta função tem o objetivo de retornar dados da ativ. projeto}
      Function RetornaDadosAtivProj(dIdEmpresa, dUnidNegoc: Double; sUneCod:string) : OleVariant;

      {Esta função tem a finalidade de retornar registros da tabela EventoSRH }
      Function ListEventoSRH(dIdPessoa :Double;sCodEvento :string) :OleVariant;

      {Esta função tem o objetivo de gravar registros na tabela CadeventoSRH}
      function Gravar :Boolean;

    End;


implementation

{ TCtrlEventoSRH }

constructor TCtrlEventoSRH.Create;
begin
  inherited;
  _dbEventoSRH  := TDbEventoSRH.Create(Self);
end;

destructor TCtrlEventoSRH.Destroy;
begin
  inherited;

  _dbEventoSRH.Free;
  If isAppServer Then FCdsEventoSRH.Free;

end;

procedure TCtrlEventoSRH.OnCreateAppServer;
begin
  inherited;
  FCdsEventoSRH := TClientDataSet.Create(nil);
end;


function TCtrlEventoSRH.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarEventoSRH ( FcdsEventoSRH.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsEventoSRH,_dbEventoSRH,[],[] );
           Msg    := _dbEventoSRH.MessageInfo;
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



Function TCtrlEventoSRH.RetornaDadosAtivProj(dIdEmpresa, dUnidNegoc: Double;sUneCod:string) : OleVariant;
var
  sSql,sFiltro :string;
begin
    FUnidNegoc    := 0;
    FNomeAtivProj := '';
    FUneCodigo    := '';
    FAchouAtiv    := False;

    //------------------------------------------------------------------------
    sSql :=  'SELECT  UNECODIGO,NOME,UNIDNEGOC '+
             'FROM UNIDNEGOCIO ' +
             'WHERE  (IDPESSOA  = '+ FloatToStr(dIdEmpresa) + ') ';
    //------------------------------------------------------------------------
    sfiltro := '';
    If dUnidNegoc <> 0 Then
       sfiltro :=  '  AND  (UNIDNEGOC   = ' + FloatToStr(dUnidNegoc) + ') ';
    //------------------------------------------------------------------------
    if sUneCod <> '' Then
    Begin
       If sFiltro = '' Then
          sFiltro :=  'WHERE (UNECODIGO = ''' + sUneCod + ''') '
       else
          sFiltro := sFiltro +  'AND (UNECODIGO = ''' + sUneCod + ''') ';
    End;
   //----------------------------------------------------------

    sSql := sSql + sfiltro;

    _cds.Data := GetDataPacket(sSql);
   //----------------------------------------------------------

   If Not _cds.Isempty Then
   Begin
     FUnidNegoc    := _cds.FieldByName('UNIDNEGOC').AsFloat;
     FNomeAtivProj := _cds.FieldByName('NOME').AsString;
     FUneCodigo    := _cds.FieldByName('UNECODIGO').AsString;
     FAchouAtiv    := True;
   End;
end;



procedure TCtrlEventoSRH.DoChangeDataBase;
begin
  inherited;
  _dbEventoSRH.DataBaseName := DataBaseName;

end;

procedure TCtrlEventoSRH.SetCdsEventoSRH(const Value: TClientDataSet);
begin
  FCdsEventoSRH := Value;
end;
function TCtrlEventoSRH.ListEventoSRH(dIdPessoa:Double;sCodEvento: string): OleVariant;
var
  sSql, sfiltro, sOrdena :string;

begin
          sSql := 'SELECT ' +
                  '   CODEVENTO,  ' +
                  '   HITCODHIST, ' +
                  '   IDPESSOA,   ' +
                  '   UNIDNEGOC,  ' +
                  '   SUBCONTADEB,' +
                  '   CONTACRE,   ' +
                  '   PLANO,      ' +
                  '   CONTADEB,   ' +
                  '   DESCRICAO,  ' +
                  '   SUBCONTACRE ' +
                  'FROM ' +
                  'CADEVENTOSRH ';

      //----------------------------------------------------------
      sfiltro := '';
      If (dIdPessoa <> 0) Then
         sfiltro :=   'WHERE (IDPESSOA = ' + FloatToStr(dIdPessoa) + ') ';
     //----------------------------------------------------------
      if sCodEvento <> '' Then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (CODEVENTO = ''' + sCodEvento + ''') '
         else
            sFiltro := sFiltro +  'AND (CODEVENTO = ''' + sCodEvento + ''') ';
      End;
     //----------------------------------------------------------
     sOrdena := 'ORDER BY DESCRICAO ';

     sSql := Ssql + sFiltro + sOrdena;

     Result := GetDataPacket(sSql);

end;

procedure TCtrlEventoSRH.SetUneCodigo(const Value: string);
begin
  FUneCodigo := Value;
end;

procedure TCtrlEventoSRH.SetNomeAtivProj(const Value: string);
begin
  FNomeAtivProj := Value;
end;

procedure TCtrlEventoSRH.SetUnidNegoc(const Value: double);
begin
  FUnidNegoc := Value;
end;

procedure TCtrlEventoSRH.SetAchouAtiv(const Value: Boolean);
begin
  FAchouAtiv := Value;
end;

end.
