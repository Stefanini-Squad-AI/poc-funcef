{-------------------------------------------------------------------------------
Data        : 22/11/2011
Autor       : Vinicius Eduardo Nascimento Maciel
SOL/KINTANA : 163982/7003 - 1489901
Descrição   : Foi alterada esta rotina para que o combo Box Atividade/
               Projeto retorne apenas as atividades analiticas e Ativas.
-------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlParamIRRF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbParamIRRF, DB, uDataBase, uSistema, DbClient,
      uCMClientDataSet, //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlParamIRRF = Class(TCmControlObject)

    private

    FDbParamIRRF: TDbParamIRRF;

    FCdsParamIRRF: TClientDataSet;

    procedure SetDbParamIRRF  (const Value: TDbParamIRRF);
    procedure SetCdsParamIRRF (const Value: TClientDataSet);
    function carregaAtividade(sCodAtividade: String): OleVariant;


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsParamIRRF: TClientDataSet   read FCdsParamIRRF  write SetCdsParamIRRF;
      property DbParamIRRF: TDbParamIRRF read FDbParamIRRF   write setDbParamIRRF;

      {Grava Alterações das Naturezas de rendimento no Banco de Dados}
      Function GravarParamIRRF : Boolean;

      function ProcurarParamIRRF(IdPessoa : integer) : OleVariant;
      {lista os tipos de Alterador}
      function ListTipoAlterador(Idpessoa : longInt) : OleVariant;
      {lista os tipos de alteradore do contas a pagar}
      function ListTipoAlteradorMultaJuros(IdPessoa : integer) : OleVariant;
      {lista os tipos de alteradore do contas a pagar}
      function ListTipoAlteradorDesconto(IdPessoa : integer) : OleVariant;
      {lista os tipos de desembolso}
      function ListTipoDesembolso(IdPessoa : integer) : OleVariant;
      {lista de atividades de projeto}
      function ListAtivProjeto(IdPessoa : integer) : OleVariant;
      {lista os centros de responsabilidade}
      function ListCentroCusto(IdPessoa : integer) : OleVariant;
      {lista os tipos de documento}
      function ListTipoDoc : OleVariant;
      {lista as siglas de todas as moedas}
      function ListSiglaMoeda : OleVariant; 
      {lista todos os impostos}
      function ListImpostos : OleVariant;
      {lista todas as Regras}
      Function ListRegras : OleVariant;

      {recupera o nome de atividades desativadas}
      function recuperaAtividadePerd(sCodAtividade: String): String;

      function DeveMostrarDadosINSS : Boolean;


    protected

    End;



implementation
{ TCtrlParamIRRF }



constructor TCtrlParamIRRF.Create;
begin
  inherited;
  FDbParamIRRF   := TDbParamIRRF.create(self);
end;



destructor TCtrlParamIRRF.Destroy;
begin
  FDbParamIRRF.Free;
  if isAppServer then
  begin
    FCdsParamIRRF.free;
  end;

  inherited;
end;



procedure TCtrlParamIRRF.DoChangeDataBase;
begin
  inherited;
  DbParamIRRF.DataBaseName   := DataBaseName;
end;



procedure TCtrlParamIRRF.SetCdsParamIRRF(const Value: TClientDataSet);
begin
  FCdsParamIRRF := Value;
end;



procedure TCtrlParamIRRF.SetDbParamIRRF(const Value: TDbParamIRRF);
begin
  FDbParamIRRF := Value;
end;



function TCtrlParamIRRF.GravarParamIRRF: Boolean;
var
  Msg : string;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarParamIRRF(FCdsParamIRRF.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Pai

           if FCdsParamIRRF.FieldByName('IDINFORME65INSS').AsInteger = 0 then
              FCdsParamIRRF.FieldByName('IDINFORME65INSS').AsInteger := FCdsParamIRRF.FieldByName('IDINFORME65ANOS').AsInteger;

           if FCdsParamIRRF.FieldByName('IDINFORMEMOLINSS').AsInteger = 0 then
              FCdsParamIRRF.FieldByName('IDINFORMEMOLINSS').AsInteger := FCdsParamIRRF.FieldByName('IDINFORMEMOLESTIA').AsInteger;

           Result := ApplyCds(FCdsParamIRRF,FDbParamIRRF,[],[] );
           Msg    := FDbParamIRRF.MessageInfo;
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



function TCtrlParamIRRF.ProcurarParamIRRF(IdPessoa : integer) : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT P.*, M.MOESIGLA, T.DESCCUSTAGREG '+            
          '  FROM PARAMIRRF P, MOEDA M, TIPOAGRE T '+            
          ' WHERE P.IDPESSOA = '+intTostr(IdPessoa)+
          '   AND P.MOECODIGO = M.MOECODIGO(+) '+                
          '   AND P.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG(+) ';  
  Result := GetDataPacket(sSQL);
end;



procedure TCtrlParamIRRF.OnCreateAppServer;
begin
  inherited;
  FcdsParamIRRF := TClientDataSet.Create(nil);
end;



function TCtrlParamIRRF.ListTipoAlterador(Idpessoa : integer) : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT CODALTERADOR, DESCRICAO '+
          '  FROM TIPOALTERADOR '+
          ' WHERE IDPESSOA = '+intTostr(Idpessoa)+
          ' ORDER BY DESCRICAO';
  Result := GetDataPacket(sSQL);
end;



function TCtrlParamIRRF.ListTipoAlteradorMultaJuros(IdPessoa: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT CODALTERADOR, DESCRICAO '+
          '  FROM TIPOALTERADOR '+
          ' WHERE RECPAG = ''P'' '+
          '   AND IDPESSOA = '+intTostr(IdPessoa)+' '+
          '   AND ACRESDECRES = ''C''';
  Result := GetDataPacket(sSQL);
end;



function TCtrlParamIRRF.ListTipoDesembolso(IdPessoa: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT CODTIPRECDES,DESCRICAO '+
          '  FROM TIPORECEBDESEMB '+
          ' WHERE (IDPESSOA = '+intTostr(IdPessoa)+') '+
          '   AND (RECPAG = ''P'') '+
          '   AND ANASINT = ''A'' ' +
          '   AND (ATIVO = ''S'') '+
          ' ORDER BY  DESCRICAO ';
  Result := GetDataPacket(sSQL);
end;



function TCtrlParamIRRF.ListAtivProjeto(IdPessoa: integer): OleVariant;
var
 sSQL : string;
begin
  sSQL := 'SELECT UNIDNEGOC,NOME '+
          '  FROM UNIDNEGOCIO '+
          ' WHERE (IDPESSOA = '+intTostr(IdPessoa)+') '+
          '   AND (UNETIPO = ''A'') '+
          ' AND (ATIVO = ''S'') ' + //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
          ' ORDER BY NOME ';
  Result := GetDataPacket(sSQL);
end;



function TCtrlParamIRRF.ListCentroCusto(IdPessoa: integer): OleVariant;
var
 sSQL : string;
begin
  sSQL := 'SELECT CODCENTROCUSTO,NOME,CODEXTERNO '+
          '  FROM CENTCUST '+
          ' WHERE (IDEMPRESA = '+intTostr(IdPessoa)+') '+
          '   AND (IDPLANCENTCUST = (SELECT IDPLANCENTCUST FROM PARAMGLOBAL)) '+
           '  AND (ATIVO = ''S'') '+
          ' ORDER BY NOME ';

  Result := GetDataPacket(sSQL);
end;



function TCtrlParamIRRF.ListTipoDoc: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT CODTIPDOC,DESCRICAO '+
          '  FROM TIPODOCRECPAG '+
          ' WHERE (RECPAG = ''P'') '+
          '   AND (DEBCRE = ''C'') '+
          ' ORDER BY DESCRICAO ';
  Result := GetDataPacket(sSQL);
end;



function TCtrlParamIRRF.ListTipoAlteradorDesconto(IdPessoa: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT CODALTERADOR, DESCRICAO '+
          '  FROM TIPOALTERADOR '+
          ' WHERE RECPAG = ''P'' '+
          '   AND IDPESSOA = '+intTostr(IdPessoa)+' '+
          '   AND ACRESDECRES = ''D''';
  Result := GetDataPacket(sSQL);
end;



function TCtrlParamIRRF.ListSiglaMoeda: OleVariant;
var
  sSQL : String;
begin
  sSQL   := ' SELECT * FROM MOEDA WHERE MOEINATIVO = ''A''';
  Result := GetDataPacket(sSQL);
end;



function TCtrlParamIRRF.ListImpostos: OleVariant;
var
  sSQL : String;
begin
  sSQL   := ' SELECT * FROM TIPOAGRE ';
  Result := GetDataPacket(sSQL);
end;



function TCtrlParamIRRF.DeveMostrarDadosINSS: Boolean;
var
   _cds : TClientDataSet;
begin
   _cds := TClientDataSet.Create(nil);
   _cds.Data := GetDataPacket('SELECT NVL(FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL FROM PARAMEMPTMO');

   Result := (_cds.FieldByName('FLGEXCEPCIONAL').AsInteger = 1);

   _cds.Free;
end;



function TCtrlParamIRRF.ListRegras: OleVariant;
var
  sSQL : String;
begin
  sSQL   := ' SELECT * FROM Regra';
  Result := GetDataPacket(sSQL);
end;

//Vinicius Maciel - SOL 163982/7003 - KTN 1489901
function TCtrlParamIRRF.recuperaAtividadePerd(
  sCodAtividade: String): String;
var
    CdsAux : TCMClientDataSet;
begin
    CdsAux := TcmClientDataSet.create(nil);
    CdsAux.Data := carregaAtividade(sCodAtividade);
    Result := CdsAux.FieldByName('Nome').asString;
    CdsAux.Free;
end;

function TCtrlParamIRRF.carregaAtividade(sCodAtividade : String) :OleVariant;
var
    sSQl : String;
begin
    sSQL := 'SELECT NOME FROM UNIDNEGOCIO WHERE UNIDNEGOC = '+sCodAtividade;
    result := GetDataPacket(sSQL);
end;
//Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM

end.
