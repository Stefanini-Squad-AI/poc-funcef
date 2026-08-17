unit uCtrlGeraCiap;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlTerceiros, DBaseDados, uCtrlCiap, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraCiap = Class(TCmControlObject)
    private
      Terceiros : TCtrlTerceiros;
      Ciap  : TCtrlCiap;
      //Cds a serem utilizados
      CdsCiap: TClientDataSet;
      procedure CarregaCdsLimpo;
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      function GeraCiap(CdsBem : OleVariant; IdPessoa : integer) : boolean;
      Constructor Create; Override;
      Destructor Destroy; Override;
      {Lista os Bens a serem gerados no CIAP}
      function ListBensCiap(IdPessoa : LongInt) : OleVariant;
    protected

    End;

implementation

{ TCtrlGeraCiap }



procedure TCtrlGeraCiap.AfterInitialize;
begin
  inherited;
  Terceiros.InitializeAs(Self);
  Ciap.InitializeAs(Self);
  Terceiros.OpenTransaction := false;
  Ciap.OpenTransaction      := false;
end;

procedure TCtrlGeraCiap.CarregaCdsLimpo;
var
  Ssql : string;
begin
  Ssql := 'SELECT * FROM CIAP WHERE (1 = 2)';
  CdsCiap.data := GetDataPacket(Ssql);
end;

constructor TCtrlGeraCiap.Create;
begin
  inherited;
  //Lists de terceiros
  Terceiros := TCtrlTerceiros.Create;

  //Carrega classe de negócio do livro
  Ciap := TCtrlCiap.Create;
  cdsCiap := TClientDataSet.Create(nil);
  //Liga meus cds aos da classe de negócio
  Ciap.CdsCiap := CdsCiap;
end;

destructor TCtrlGeraCiap.Destroy;
begin
  inherited;
  if isAppServer then CdsCiap.free;
  Terceiros.Free;
  Ciap.Free;
end;

procedure TCtrlGeraCiap.DoChangeDataBase;
begin
  inherited;
end;



function TCtrlGeraCiap.GeraCiap(CdsBem : OleVariant; IdPessoa : integer) : boolean;
var
   Ssql : string;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GeraCiap(_Cds.Data, IdPessoa);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    Begin
      _Cds.data := CdsBem;
      Result := True;
      _Cds.First;
      While not _Cds.EOF do
      Begin
         Try
            CarregaCdsLimpo;
            StartTransaction;

            CdsCiap.Append;
            CdsCiap.fieldByname('IDBEM').Asinteger    := _Cds.FieldByName('IDBEM').AsInteger;
            CdsCiap.fieldByname('IDPESSOA').Asinteger := IdPessoa;
            cdsCiap.fieldByName('CODIGO').Asinteger   := _Cds.FieldByName('PLACA').AsInteger;
            cdsCiap.fieldByName('DATA').AsDateTime    := _Cds.FieldByName('DATAINSTALACAO').AsDateTime;
            cdsCiap.fieldByName('NF').AsInteger       := _Cds.FieldByName('NUMNF').AsInteger;
            cdsCiap.fieldByName('DESCRI').Asstring    := _Cds.FieldByName('DESBEM').AsString;
            cdsCiap.fieldByName('ENTRADA').AsFloat    := _Cds.FieldByName('VALOR').AsFloat;
            cdsCiap.fieldByName('SAIDA').AsFloat      := 0;//_Cds.FieldByName('VALOR').AsFloat;
            //Usa a classe de de controle do cadastro para efetuar a inserçào
            Ciap.InserirCiap;
            // Atualiza o flag de gerou registro na tabela de ITENSRECEBDEVOL
            sSql := 'UPDATE ITENSRECEBDEVOL SET FLGCIAP = ''S'' ' +
                    ' WHERE IDITENSRECDEV = ' + _Cds.FieldByName('IDITENSRECDEV').AsString;
            ExecSQL(Ssql);
            Commit;
         Except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo :=  ('Geração do Bem ')+_Cds.FieldByName('IDITENSRECDEV').AsString +
                               (' não Efetuado');;
            End;
         end;
         _Cds.Next;
      end;
    end;

end;


function TCtrlGeraCiap.ListBensCiap(IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT BEM.IDBEM, BEM.PLACA, BEM.DATAINSTALACAO, NF.DATAENTDEVOL,NF.NUMNF,BEM.DESBEM,VALORITEM.VALOR,IT.IDITENSRECDEV '+
          '  FROM NFRECEBDEVOL NF,ITENSRECEBDEVOL IT,BEM, '+
          '      (SELECT A.IdITENSRECDEV,nvl(ROUND(A.VLRRECUPERADO/B.QTDERECEBDEVOL,2),0) VALOR '+
          '         FROM AGRITENSRECDEV A,ITENSRECEBDEVOL B '+
          '        WHERE (A.IDITENSRECDEV=B.IDITENSRECDEV)) VALORITEM '+
          ' WHERE (NF.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL) '+
          '   AND (IT.IDITENSRECDEV = BEM.IDITENSRECDEV) '+
          '   AND (IT.IdITENSRECDEV = VALORITEM.IdITENSRECDEV) '+
          '   AND (NF.FLGTIPONOTA=''R'') '+
          '   AND ((IT.FLGCIAP = ''N'') OR (IT.FLGCIAP IS NULL)) '+
          '   AND (BEM.IDPESSOA = '+ intTostr(Idpessoa)+ ')';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlGeraCiap.OnCreateAppServer;
begin
  inherited;
  
end;

end.
