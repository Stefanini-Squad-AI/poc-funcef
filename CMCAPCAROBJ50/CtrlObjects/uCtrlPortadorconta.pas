// Alterações
{ --------------------------------------------------------------------------------------------------------
Data      : 08.03.2018
Autor     : Everson Luiz Pereira da Cunha
Pendência : SIG TIBERO
Descrição : Melhoria TIBERO.
            Inserir Alias nas tabelas e campos.
            Retirar INDEX, +rule etc
----------------------------------------------------------------------------------------------------------
Rotina    : PlanoPrevDifereDaLista
Data      : 02.03.2007
Pendencia : 24450
Autor     : Antonio Marcos Fernandes de Souza (amf)
Descrição : A trava estava incorreta pois, não deveria considerar caso não houvesse planos previdenciários
            associados a contacorrente a ao portador-forma. Deve criticar somente se houver planos previdenciários
            associados.
----------------------------------------------------------------------------------------------------------
Rotina    : PlanoPrevDifereDaLista
Data      : 01.03.2007
Pendencia : 24450
Autor     : Antonio Marcos Fernandes de Souza (amf)
Descrição : Verifica se o plano previdenciário encontra-se na lista de planos previdenciários
            cadastrados na conta corrente associada ao portador-forma.
----------------------------------------------------------------------------------------------------------}

Unit uCtrlPortadorconta;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbPortadorconta, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes, udbPortcontaxplano;

Type
  TCtrlPortadorconta = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbPortadorconta: TDbPortadorconta;
    _DbPortcontaxplano : TDbPortcontaxplano;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    //catia - 22469 - 07/07/2006
    FcdsContaxPlano: TClientDataSet;

    Procedure Setcds(Const Value: TClientDataSet);
    //catia - 22469 - 07/07/2006
    Procedure SetcdsContaxPlano(Const Value: TClientDataSet);
  public
    Property cds: TClientDataSet read Fcds write Setcds;
    //catia - 22469 - 07/07/2006
    Property CdsContaxPlano: TClientDataSet read FCdsContaxPlano write SetCdsContaxPlano;

    Constructor Create; override;
    Destructor Destroy; override;

    //amf 01.03.2007 24450
    function PlanoPrevDifereDaLista(codportador, idplanoprev: integer): boolean;

    Function ListPortadorconta(Codportador: double = 0; RECPAG: String = ''; IDPESSOA: double = 0): OleVariant;
    Function ListContaxForma(Codportador: double = 0): Olevariant;
    //catia - p: 22469 - 07/07/2006
    Function ListPortContaxPlano(CODPORTADOR: double = 0; idpessoa: double = 0): OleVariant;

    Function GravarPortadorconta(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;

  End;

Implementation

{ TCtrlPortadorconta }

Function TCtrlPortadorconta.GravarPortadorconta(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg, sDscLog: String;

Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarPortadorconta(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(FCds, _DbPortadorconta, [], []);
      Msg := _DbPortadorconta.MessageInfo;
      //catia - 22469 - 07/07/2006
      Result := ApplyCds(FCdsContaxPlano, _DbPortcontaxplano,[_dbPortadorconta.Codportador], [_dbPortContaxplano.codportador]);
      Msg := _DbPortcontaxplano.MessageInfo;

      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Contas Bancarias X Caixas'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Contas Bancarias X Caixas'
      Else
        sDscLog := 'Alteracao de Contas Bancarias X Caixas ';

      If Not Result Then
        Raise Exception.create(Msg);
      If sDscLog <> '' Then
        If Not _Padroes.GravaLogOperacoes(IdPessoa, IdModulo, IdUsuario, sDscLog, False) Then
          Raise Exception.Create(_Padroes.MessageInfo);
      Commit;
    Except
      On E: Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Constructor TCtrlPortadorconta.Create;
Begin
  Inherited;
  _DbPortadorconta := TDbPortadorconta.Create(self);
  _DbPortcontaxplano := TDbPortcontaxplano.Create(self);
  _Padroes := TCtrlPadroes.Create;

End;

Destructor TCtrlPortadorconta.Destroy;
Begin
  FreeAndNil(_DbPortadorconta);
  FreeAndNil(_DbPortcontaxplano);
  FreeAndNil(_Padroes);
  If isAppServer Then
    FreeAndNil(FCds);
  Inherited;
End;

Procedure TCtrlPortadorconta.DoChangeDataBase;
Begin
  Inherited;
  _DbPortadorconta.DataBaseName := DataBaseName;
  _DbPortcontaxplano.DataBaseName := DataBaseName;
End;

Procedure TCtrlPortadorconta.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlPortadorconta.ListPortadorconta(Codportador: double = 0; RECPAG: String = ''; IDPESSOA: double = 0): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT         ' +
    '  CODPORTADOR, IDUSUARIOINCLUSAO, IDAGENCIA, CODCENTROCUSTO, MOECODIGO, ' +
    '  PLANO, PLACONTA, IDBANCO, NOCONTACORR, IDPESSOA, DESCRICAO, IDEMPRESA, ' +
    '  FLGGRAVAFLUXO, UNIDNEGOC, CODSUBCONTA, FLGSTATUS, CONTROLEREMESSA, FLGCONTAINVEST ' +
    ' ,NDIASAPURACPMF '+//andré tavares - pendência 22316 - 17/05/2006
    'FROM ' +
    '  PORTADORCONTA ' +
    'WHERE ';
  If Codportador <> 0 Then
    ssql := ssql + ' Codportador = ' + floattostr(Codportador);

  If (IDPessoa <> 0) And (Codportador <> 0) Then
  Begin
    ssql := ssql + ' AND ';
  End;
  If IDPessoa <> 0 Then
    ssql := ssql + ' IDPESSOA = ' + floattostr(IDPessoa);
  Result := GetDataPacket(ssql);
End;

Function TCtrlPortadorconta.ListContaxForma(Codportador: double): Olevariant;
Var
  ssql: String;
Begin
  ssql := ' Select Distinct                ' +
    '    Pc.CodPortador, Pc.PlaConta ' +
    ' From  PortadorConta Pc, PortadorForma Pf ' +
    ' Where ' +
    '   Pc.CodPortador = Pf.CodPortador and  ' +
    '   Pc.CodPortador = ' + floattostr(CodPortador);
  result := GetDataPacket(ssql);
End;


//catia - 22469 - 07/07/2006
procedure TCtrlPortadorconta.SetCdsContaxPlano (const Value: TClientDataSet);
begin
  FCdsContaxPlano  := Value;
end;

Procedure TCtrlPortadorconta.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlPortadorconta.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;
//catia - p: 22469 - 07/07/2006
Function TCtrlPortadorconta.ListPortContaxPlano(CODPORTADOR: double = 0; idpessoa: double = 0): OleVariant;
Var
  ssql: String;
Begin


  ssql := ' SELECT   ' + #13 +
          ' C.NOME,C.IDPLANOPREV , P.IDPORTCONTAXPLANO, P.CODPORTADOR   ' + #13 +
          ' FROM   ' + #13 +
          ' PORTCONTAXPLANO P , PLANPREVCONTABIL C  ' + #13 ;

  If Codportador <> 0 Then
  begin
  ssql := ssql + 'WHERE ';
  ssql := ssql + 'Codportador = ' + floattostr(Codportador);
  ssql := ssql + ' AND P.IDPLANOPREV = C.IDPLANOPREV '  ;
  end
  else
  ssql := ssql + 'WHERE  1=2';
  ssql := ssql + ' ORDER BY C.NOME               ';
  Result := GetDataPacket(ssql);
End;

function TCtrlPortadorconta.PlanoPrevDifereDaLista(codportador,
  idplanoprev: integer): boolean;
var
  cdsLocal: TClientDataSet;
  sSQL: string;
begin
  try
    cdsLocal := TClientDataSet.Create(nil);

    sSQL :=
      'SELECT  C.NOME,C.IDPLANOPREV , P.IDPORTCONTAXPLANO, P.CODPORTADOR '+
      'FROM   PORTCONTAXPLANO P , PLANPREVCONTABIL C  '+
//      'WHERE  CODPORTADOR = ' + IntToStr(codportador)  + //Everson TIBERO
      'WHERE  P.CODPORTADOR = ' + IntToStr(codportador)  + //Everson TIBERO
      '   AND P.IDPLANOPREV = C.IDPLANOPREV           ';

    cdsLocal.Data := GetDataPacket(sSQL);

    //amf 02.03.2007 24450 - não tem planos previdenciários cadastrados
    if (cdsLocal.IsEmpty) then
       Result := False
    else  //amf 02.03.2007 - tem planos mas não encontrou o plano previdenciário selecionado no lançamento de documento.
    begin
       Result := True;
       cdsLocal.First;
       while (not cdsLocal.Eof) do
       begin
          if (idplanoprev = cdsLocal.FieldByName('IDPLANOPREV').AsInteger) then
          begin
             Result := False;
             break;
          end;

          cdsLocal.Next;
       end;
    end;
  finally
    FreeAndNil(cdsLocal);
  end;
end;

End.

