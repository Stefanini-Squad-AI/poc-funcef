unit uCtrlAlterorcamento;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, uMidasUtil,
     sysutils,wwQuery, provider, uDbAlterorcamento, uCMTypes, uFuncoesOrcamento;

Type
  TCtrlAlterorcamento = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _dbAlterorcamento: TdbAlterorcamento;
    FCdsAlterorcamento: TClientDataSet;
    procedure SetCdsAlterorcamento(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      Function LerUltimaSequencia : Integer;
      
      property CdsAlterorcamento: TClientDataSet read FCdsAlterorcamento write SetCdsAlterorcamento;

      function AplicaOperacaoAlterorcamento : Boolean;
      function Procurar(idalterorcamento:Double): OleVariant;
      function ProxSuplemen(idpessoa: double) : OleVariant;
      procedure CriaSuplementacao(idalterorcamento, numalteracao, 
        idplanoorcamen, idpessoa, exercicio, periodo: integer; idcontaorigem,
        datareferencia, obsalterorcamento: string; vlrsolicitado: double);

  end;

implementation


procedure TCtrlAlterorcamento.DoChangeDataBase;
begin
  inherited;
  _dbAlterorcamento.DatabaseName := DataBaseName;
end;

procedure TCtrlAlterorcamento.OnCreateAppServer;
begin
  inherited;
  FCdsAlterorcamento := TClientDataSet.Create(nil);
end;

constructor TCtrlAlterorcamento.Create;
begin
  inherited;
  _dbAlterorcamento := TdbAlterorcamento.Create(Self);
end;

destructor TCtrlAlterorcamento.Destroy;
begin
  inherited;
  _dbAlterorcamento.Free;
  if isAppServer then begin
    FreeCds([FCdsAlterorcamento]);
  end;
end;

function TCtrlAlterorcamento.AplicaOperacaoAlterorcamento: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoAlterorcamento(FCdsAlterorcamento.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsAlterorcamento,_DbAlterorcamento,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbAlterorcamento.MessageInfo;
            Abort;
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;



function TCtrlAlterorcamento.Procurar(idalterorcamento:Double): OleVariant;
begin
   _DbAlterorcamento.Idalterorcamento.AsFloat := idalterorcamento;
   Result := GetDataPacket(_DbAlterorcamento.SSqlSelect);
end;

procedure TCtrlAlterorcamento.SetCdsAlterorcamento(
  const Value: TClientDataSet);
begin
  FCdsAlterorcamento := Value;
end;

function TCtrlAlterorcamento.ProxSuplemen(idpessoa: double) : OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT                                        ' +
           '   MAX(NUMALTERACAO) AS PROXIMA               ' +
           'FROM                                          ' +
           '   ALTERORCAMENTO                             ' +
           'WHERE                                         ' +
           '   IDPESSOA = ' + TrocaVPP(FloatToStr(idpessoa));
   Result := GetDataPacket(sSql);
end;

procedure TCtrlAlterorcamento.CriaSuplementacao(idalterorcamento, numalteracao,
  idplanoorcamen, idpessoa, exercicio, periodo: integer; idcontaorigem,
  datareferencia, obsalterorcamento: string; vlrsolicitado: double);
var sSQl : String;
begin
  sSql := 'INSERT INTO ALTERORCAMENTO ' +
          '(IDALTERORCAMENTO, IDPESSOA, EXERCICIOORIGEM, PERIODOORIGEM, ' +
          'IDPLANOORCAMEN, IDCONTAORIGEM, OBSALTERORCAMEN, VLRSOLICITADO, ' +
          'DATAREFERENCIA, NUMALTERACAO, FLGTIPOALTER) VALUES ' +
          '(' + IntToStr(idalterorcamento) + ', ' + IntToStr(idpessoa) +
          ', ' + IntToStr(exercicio) + ', ' + IntToStr(periodo) +
          ', ' + IntToStr(idplanoorcamen) + ', ''' + idcontaorigem +
          ''', ''' + obsalterorcamento + ''',' +
          TrocaVPP(FloatToStr(vlrsolicitado)) +
          ', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
          IntToStr(numalteracao) + ', ''S'')';
  ExecSQL(sSql);
end;

//************************************************
Function TCtrlAlterorcamento.LerUltimaSequencia : Integer;
Begin

  Result := GetSequence( 'ALTERORCAMENTO' );
End;
//************************************************
end.


