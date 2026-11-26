// Alterações:
{
Pendencia : 24190
Descrição : inserção de campo no select
Data      : 30.03.2007
{ --------------------------------------------------------------------------------------------------
Pendencia : 18778
Descrição : Criar parâmetro FLGORDENASIGLA
Data      : 13/09/2005
Descrição : Este campo define se a ordenação da listagem de moedas será ordenado pelo campo "sigla".
}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 06/09/2004
Pendencia : 17193
Descrição : Criar parâmetro FLGSEGREGAFINANC

Data      : 18/10/2004
Descrição : Retirar o parâmetro FLGSEGREGAFINANC
            Criar os parâmetros:
              IDPLANOPREVADM     => Plano Previdenciário Administrativo
              FLGSEGREGAORCOMUM  => Segrega Plano Previdenciário "COMUM" na origem
              FLGSEGREGAORADM    => Segrega Plano Previdenciário "ADMINISTRATIVO" na origem
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 10/12/2003
Pendencia : 15773
Descrição : Criar parâmetro FLGSEGREGAVIRTUAL
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/12/2003
Pendencia : 14891
Descrição :
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 28/10/2003
Pendencia : 15453
Descrição :
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 20/02/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlParamGlobal;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbParamGlobal;

Type
  TCtrlParamGlobal = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
    procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName:
              String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbParamGlobal: TDbParamGlobal;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Function  ListaParamGlobal( IdEmpresa: Double = 0 ): OleVariant;
    function  ListaPlanoPrevContabil: OleVariant;
    function  ListaPatro: OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlParamGlobal.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarParamGlobal( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbParamGlobal, [], [] );
        Msg    := _DbParamGlobal.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     Except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

constructor TCtrlParamGlobal.Create;
begin
  inherited;
  _DbParamGlobal := TDbParamGlobal.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlParamGlobal.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbParamGlobal.Free;

  inherited;
end;

procedure TCtrlParamGlobal.DoChangeDataBase;
begin
  inherited;
  _DbParamGlobal.DataBaseName := DatabaseName;
end;

function TCtrlParamGlobal.ListaParamGlobal( IdEmpresa: Double ): OleVariant;
var
  sql: String;
begin
   Sql :=
   'SELECT ' +
   '   IDPESSOA, ' +
   //  pendência 15453 - 29/10/2003
   '   IDPLANCRESPON, IDPLANCENTCUST, ' +
   // FIM  pendência 15453 - 29/10/2003
   '   USACRESPON, USAABC, UNIDNEGOC, MOEDACORRENTE, MASCARACC, ' +
   '   MASCUNIDNEGOC, MASCCENTRORESPON, MASCARANUMAGENCIA, MASCARACLIENTE, ' +
   '   IDPLANOPREV, IDPATRO, FLGUSAUPPERPESSOA, FLGUSAMODRESPON, FLGUSAENDPESSOA, ' +
   '   FLGOBRIGACC, FLGOBRIDOCPESSOA, FLGINTEGRAORC, FLGINTEGRAMANUT, ' +
   // P:18951
   '   FLGOBRIGAPROG, ' +
   '   FLGDUPLDOCPESSOA, FLGCRIAAGENCIA, FLGCENTRORESPON, DOCPJURIDICA, ' +
   '   DOCPFISICA, CORMESTRE, CORCABECALHO, CODCENTRORESPON, CAMINHOCOMUNICA, ' +
   '   FLGCONTABPARTDOB, INSCESTADUAL, INSCMUNICIPAL, IDPESSOA AS IDUSUARIO, ' +

   // Pendência 23894 - 12/01/07
   ' FLGSEGORCOMFIN, FLGSEGORADMFIN, ' +

   { 01/12/2003 - pendência 14891 - inclui o campo FLGCGCAGENCIA }
   '   FLGSUBCONTAFORN, FLGSUBCONTACLIE, NVL(FLGCGCAGENCIA, 0) AS FLGCGCAGENCIA, ' +
   // 10/12 - Pend 15773  // 18/10/2004 pend. 17193
   '   FLGSEGREGAVIRTUAL,  IDPLANOPREVADM, FLGSEGREGAORCOMUM, FLGSEGREGAORADM, '+
   '   DTSEGREGAVIRTUAL, FLGORDENASIGLA '  +  //  pendência 18778 - 13/09/2005 - inclui o camco FLGORDENASIGLA

   // 30.03.2007 24190
   ' ,CRITICAGRUPO ' +
   'FROM ' +
   '  PARAMGLOBAL ';

  If IdEmpresa <> 0 Then
     Sql := Sql + 'WHERE IDPESSOA = ' + FloatToStr( IdEmpresa )
  Else
     Sql := Sql + 'ORDER BY IDPESSOA';

  Result := GetDataPacket( Sql );
end;

function TCtrlParamGlobal.ListaPatro: OleVariant;
var
  sSql: String;
begin
  sSql := 'SELECT PATRO.IDPESSOA AS IDPATRO, PESSOA.NOME ' +
            'FROM PATRO, PESSOA ' +
           'WHERE PATRO.IDPESSOA = PESSOA.IDPESSOA ' +
           'ORDER BY PESSOA.NOME';
  Result := GetDataPacket( sSql );
end;

function TCtrlParamGlobal.ListaPlanoPrevContabil: OleVariant;
var
  sSql: String;
begin
  sSql := 'SELECT IDPLANOPREV, NOME ' +
            'FROM PLANPREVCONTABIL ' +
           'ORDER BY NOME';
  Result := GetDataPacket( sSql );
end;

procedure TCtrlParamGlobal.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlParamGlobal.OnApplyCdsRecord( aCds: TClientDataSet; Const sTableName:
          String; CdsState: TUpdateStatus; Var Accept: Boolean );
var
  iseq: Integer;
  cds: TClientDataset;
  sql: String;
begin
  If CdsState = usInserted Then Begin
     cds := TClientDataset.Create( Nil );
     cds.Data := GetDataPacket( 'SELECT CODCENTRORESPON FROM CENTRESPON WHERE CODCENTRORESPON = ''9999999999'' AND IDPESSOA = ' +
                                ACds.FieldByName( 'IdPessoa' ).AsString );

     If cds.IsEmpty Then Begin
        Sql := 'INSERT INTO CENTRESPON ( CODCENTRORESPON, IDPESSOA, NOME, ANALITICOSINTET, IDUSUARIOINCLUSAO, RESPONSAVEL, ATIVO ) '+
               ' VALUES( ''9999999999'', ' + ACds.FieldByName( 'IdPessoa' ).AsString +
               ', ''C. Responsabilidade Padrão'', ''A'' ,' + ACds.FieldByName( 'IdUsuario' ).AsString +
               ', ''CM'', ''S'')';

        If Not ExecSQL( Sql, True ) Then
           Abort;

        aCds.Edit;
        aCds.FieldByName( 'CODCENTRORESPON' ).AsString := '9999999999';
        aCds.Post;
     End;

     cds.Data := GetDataPacket( 'SELECT UNIDNEGOC FROM UNIDNEGOCIO WHERE IDPESSOA = ' +
                                ACds.FieldByName( 'IdPessoa' ).AsString );

     If cds.IsEmpty Then Begin
        Sql := 'INSERT INTO UNIDNEGOCIO ( UNIDNEGOC, IDPESSOA, NOME, UNECODIGO, UNETIPO ) VALUES( -1, ' +
               ACds.FieldByName( 'IdPessoa' ).AsString + ', ''Atividade Padrão'', ''0'', ''A'')';

        If Not ExecSQL( Sql, True ) Then
           Abort;

        iSeq := -1;
     End Else
        iSeq := Acds.FieldByName( 'UNIDNEGOC' ).AsInteger;

     If Acds.FieldByName( 'UNIDNEGOC' ).IsNull Then Begin
        aCds.Edit;
        aCds.FieldByName( 'UNIDNEGOC' ).AsInteger := iSeq;
        aCds.Post;
     End;

     cds.Free;
  End;
end;

end.

