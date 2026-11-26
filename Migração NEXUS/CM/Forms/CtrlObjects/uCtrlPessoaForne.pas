{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Rotina             : SelDadosForne, GetInidcativoSusp, SelProcessos,
                      GetInidcativoSusp, SelProcessos,
                      SelProcessosXIndicativoSusp, SelIndicativoSusp,
 										  GetProxIdProcessosXIndicativoSusp, GetProxIdProcesso,
                      GravaProcesso, VerificaExistenciaProcesso,
                      GravaProcxIndicativo,
                      VerificaExistenciaProcessoXIndicativoSusp,
                      ExcluiSuspensaoProcesso
 N. SIG..........   : 23656.57136
 Data da Alteração: : 27/10/2017
 Alteração Form:    : uCtrlPessoaForm
 Responsável:       : Cássio Rovaroto
 Descrição.......   : Inclusão de rotinas para tratamento do campo
                      "Contribuinte da Contribuição Previdenciário sobre a Renda
                      Bruta (CPRB)" e dos campos da aba "Processos",  para o
                      cumprimento da Instrução Normativa IN 1701.
--------------------------------------------------------------------------------
 Nº SOL............: 229878.16779
 Nº PPM............: 610132
 Data da Alteração.: 17/07/2015
 Alteração Form....: inclusão de functions
 Responsável.......: William Santana
 Descrição.........: Desenvolvimento do produto referente ao SOL 229878.
--------------------------------------------------------------------------------
 Marcus Oliveira P. 24573 26/03/2007 Pegar o tipo de Imposto.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Classe de controle do Cadastro de Fornecedor        }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }    
{ Atualizado Em: 07/03/2002                             }
{ Atualizado Em: 01/03/2004 - André Tavares -           }
{                pendência 15083 - listar somente os    }
{                tipo de desembolso ativos              }
{                                                       }
{*******************************************************}

unit uCtrlPessoaForne;

interface

Uses  SysUtils, Classes, DbClient, uCmControlObject, uCmTypes,
      uCtrlPessoa, uDbFornserv, uDbEmpresaforn, uDbForClixAgreg, uDbFornxdesemb,
      uDbFornxramo, wwQuery, uDbProcessosForn, uDbProcessosXIndicativoSuspForn;

Type
  TCtrlPessoaForne = Class(TCtrlPessoa)
  private
    FCdsFornXRamo: TClientDataSet;
    FCdsFornXDesemb: TClientDataSet;
    FCdsEmpresaForn: TClientDataSet;
    FCdsImAgregForn: TClientDataSet;
    FCriaSubConta: Boolean;
    //FCriaSubConta: Boolean;

    procedure SetCdsEmpresaForn(const Value: TClientDataSet);
    procedure SetCdsFornXDesemb(const Value: TClientDataSet);
    procedure SetCdsFornXRamo(const Value: TClientDataSet);
    procedure SetCdsImAgregForn(const Value: TClientDataSet);
    procedure SetCriaSubConta(const Value: Boolean);

  protected
    _DbFornserv: TDbFornserv;
    _DbEmpresaforn: TDbEmpresaforn;
    _DbFornxdesemb: TDbFornxdesemb;
    _DbFornxramo: TDbFornxramo;
    _DbForClixAgreg: TDbForClixAgreg;
    //Cássio  - SIG nº 57136 - Início
    _DbProcessos: TDbProcessosForn;
    _DbProcessosXIndicativoSusp: TDbProcessosXIndicativoSuspForn;
    //Cássio  - SIG nº 57136 - Fim

    procedure DoChangeDataBase; Override;

    function ProcessaOutros(Operacao: TOperacao; Var Mensagem: String): Boolean; Override;
    procedure OnCreateAppServer; Override;
    function ExecAppServer(Operacao: TOperacao): Boolean; Override;
  public

    Constructor Create; Override;
    Destructor Destroy; Override;

    property CdsImAgregForn: TClientDataSet read FCdsImAgregForn write SetCdsImAgregForn;
    property CdsEmpresaForn: TClientDataSet read FCdsEmpresaForn write SetCdsEmpresaForn;
    property CdsFornXDesemb: TClientDataSet read FCdsFornXDesemb write SetCdsFornXDesemb;
    property CdsFornXRamo: TClientDataSet read FCdsFornXRamo write SetCdsFornXRamo;
    property CriaSubConta: Boolean read FCriaSubConta write SetCriaSubConta;

    function SelFornecedor(rIdpessoa: Double): OleVariant;
    function SelEmpresaForne(rIdpessoa, rIdForCli: Double): OleVariant;

    function SelImpAgreg(rIdPessoa, rIdForCli: Double): OleVariant;
    function SelImpAgregForne(rIdPessoa, rIdForCli: Double): Olevariant;

    function SelTipoDesemb(rIdPessoa, rIdForCli: Double): OleVariant;
    function SelTipoDesembForn(rIdPessoa, rIdForCli: Double): OleVariant;
    function SelRamos(rIdForCli: Double): Olevariant;
    function SelRamosFrone(rIdForCli: Double): Olevariant;

    function SelDadosForne(rIdEmpresa, rIdForCli: Double; aCdsSubTipo, aCdsEmpresaForne,
    aCdsTipoDesemb, aCdsImAgreg, aCdsRamoForne, aCdsTipoDesembForn, aCdsImAgregForn,
    aCdsRamoXForne: TClientDataSet): Boolean;

    //Início - William Santana - SOL 229878.16779 PPM 610132
    function SelGrauInstrucao(): OleVariant;
    function SelGrauExpAgNocivo(): OleVariant;
    function SelGrupoCategoria(): OleVariant;
    function SelDescCategoria(Grupo: string): OleVariant;
    function GetGrupoCategoria(Idcategtrabaesocial: Double): OleVariant;
    //Término - William Santana - SOL 229878.16779 PPM 610132

  end;

implementation

Uses uMidasUtil;


{ TCtrlPessoaForne }

constructor TCtrlPessoaForne.Create;
begin
  inherited;
  FCriaSubConta := false;
  
  _DbForClixAgreg := TDbForClixAgreg.Create(self);
  _DbFornserv :=  TDbFornserv.Create(self);
  _DbEmpresaforn := TDbEmpresaforn.Create(self);
  _DbFornxdesemb := TDbFornxdesemb.Create(Self);
  _DbFornxramo := TDbFornxramo.Create(self);
  //Cássio - SIG nº 57136 - Início
  _DbProcessos := TDbProcessosForn.Create(Self);
  _DbProcessosXIndicativoSusp  := TDbProcessosXIndicativoSuspForn.Create(Self);
  //Cássio - SIG nº 57136 - Fim
end;

destructor TCtrlPessoaForne.Destroy;
begin
  _DbForClixAgreg.Free;
  _DbFornserv.Free;
  _DbEmpresaforn.Free;
  _DbFornxdesemb.Free;
  _DbFornxramo.Free;
  //Cássio - SIG nº 57136 - Início
  _DbProcessos.Free;
  _DbProcessosXIndicativoSusp.Free;
  //Cássio - SIG nº 57136 - Fim


  If IsAppServer Then
  Begin
    FCdsFornXRamo.Free;
    FCdsFornXDesemb.Free;
    FCdsEmpresaForn.Free;
    FCdsImAgregForn.Free;
  End;

  inherited;
end;

procedure TCtrlPessoaForne.DoChangeDataBase;
begin
  inherited;
  _DbForClixAgreg.DataBaseName := DataBaseName;
  _DbFornserv.DataBaseName := DataBaseName;
  _DbEmpresaforn.DataBaseName := DataBaseName;
  _DbFornxdesemb.DataBaseName := DataBaseName;
  _DbFornxramo.DataBaseName := DataBaseName;
  _DbForClixAgreg.DataBaseName := DataBaseName;
  //Cássio - SIG nº 57136 - Início
  _DbProcessos.DataBaseName := DataBaseName;
  _DbProcessosXIndicativoSusp.DataBaseName := DataBaseName;
  //Cássio - SIG nº 57136 - Fim

end;

procedure TCtrlPessoaForne.OnCreateAppServer;
begin
  inherited;
  FCdsFornXRamo := TClientDataSet.Create(nil);
  FCdsFornXDesemb := TClientDataSet.Create(nil);
  FCdsEmpresaForn := TClientDataSet.Create(nil);
  FCdsImAgregForn :=  TClientDataSet.Create(nil);
end;

function TCtrlPessoaForne.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
   Try
      If ( Operacao = opApagar ) Then
      Begin
        EmptyCds([CdsSubTipo, CdsEmpresaForn, CdsFornXDesemb, CdsFornXRamo, CdsImAgregForn]);

        Result := ApplyCds(CdsImAgregForn , _DbForClixAgreg, [], [] );
        If Not Result Then Raise Exception.Create(_DbForClixAgreg.MessageInfo);

        Result := ApplyCds(CdsFornXRamo , _DbFornxramo, [], [] );
        If Not Result Then Raise Exception.Create(_DbFornxramo.MessageInfo);

        Result := ApplyCds(CdsFornXDesemb , _DbFornxdesemb, [], [] );
        If Not Result Then Raise Exception.Create(_DbFornxdesemb.MessageInfo);

        Result := ApplyCds(CdsEmpresaForn , _DbEmpresaforn, [], [] );
        If Not Result Then Raise Exception.Create(_DbEmpresaforn.MessageInfo);

        Result := ApplyCds(CdsSubTipo , _DbFornserv, [], [] );
        If Not Result Then Raise Exception.Create(_DbFornserv.MessageInfo);

      End
      Else
      Begin
        Result := ApplyCds(CdsSubTipo , _DbFornserv, [_DbPessoa.Idpessoa], [_DbFornserv.Idpessoa] );
        If Not Result Then Raise Exception.Create(_DbFornserv.MessageInfo);

        Result := ApplyCds(CdsEmpresaForn , _DbEmpresaforn, [_DbPessoa.Idpessoa], [_DbEmpresaforn.IdForCli] );
        If Not Result Then Raise Exception.Create(_DbEmpresaforn.MessageInfo);

        Result := ApplyCds(CdsImAgregForn , _DbForClixAgreg, [_DbPessoa.Idpessoa], [_DbForClixAgreg.IdForcli] );
        If Not Result Then Raise Exception.Create(_DbForClixAgreg.MessageInfo);

        Result := ApplyCds(CdsFornXRamo , _DbFornxramo, [_DbPessoa.Idpessoa], [_DbFornxramo.Idpessoa] );
        If Not Result Then Raise Exception.Create(_DbFornxramo.MessageInfo);

        Result := ApplyCds(CdsFornXDesemb , _DbFornxdesemb, [_DbPessoa.Idpessoa], [_DbFornxdesemb.Idpessoa] );
        If Not Result Then Raise Exception.Create(_DbFornxdesemb.MessageInfo);

      End;
   Except
      On E:Exception Do
      Begin
        Result := false;
        Mensagem := E.Message;
      End;
   End;
end;

function TCtrlPessoaForne.SelFornecedor(rIdpessoa: Double): OleVariant;
begin
  _DbFornserv.Idpessoa.AsFloat := rIdpessoa;
  Result := GetDataPacket(_DbFornserv.sSqlSelect);
end;

function TCtrlPessoaForne.SelEmpresaForne(rIdpessoa,
  rIdForCli: Double): OleVariant;
begin
  _DbEmpresaforn.IdForCli.AsFloat := rIdForCli;
  _DbEmpresaforn.Idpessoa.AsFloat := rIdpessoa;
  Result := GetDataPacket(_DbEmpresaforn.sSqlSelect);
end;

function TCtrlPessoaForne.SelImpAgreg(rIdPessoa,
  rIdForCli: Double): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   TIPOAGRE.DESCCUSTAGREG, ' +
                           '   TIPOAGRE.CODTIPOCUSTAGREG ' +
                           '   , TIPOAGRE.CODIMPOSTO ' +
                           
                           ' FROM ' +
                           '  TIPOAGRE, TIPOALTERADOR ' +
                           ' WHERE ' +
                           '   (TIPOAGRE.CODTRATFISCD IN (''B'',''8'',''9'',''A'')) AND ' +
                           '   (((TIPOAGRE.CODTRATFISCD = ''8'') AND (TIPOALTERADOR.ACRESDECRES = ''D'')) OR ' +
                           '    ((TIPOAGRE.CODTRATFISCD = ''A'') AND (TIPOALTERADOR.ACRESDECRES = ''C'')) OR ' +
                           '     (TIPOALTERADOR.ACRESDECRES IS NULL)) AND ' +
                           '   (TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+)) AND ' +
                           '   (TIPOAGRE.CODTIPOCUSTAGREG NOT IN ' +
                           '   (SELECT ' +
                           '     F.CODTIPOCUSTAGREG ' +
                           '    FROM ' +
                           '     FORCLIXAGREG F ' +
                           '    WHERE ' +
                           '     (F.IDFORCLI = ' + FloatToStr(rIdForCli) + ') AND ' +
                           '     (F.IDPESSOA = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '     (F.RECPAG = ''P''))) ');
end;

function TCtrlPessoaForne.SelImpAgregForne(rIdPessoa,
  rIdForCli: Double): Olevariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   T.DESCCUSTAGREG, F.IDPESSOA, F.IDFORCLI, F.CODTIPOCUSTAGREG, ' +
                           '   T.CODIMPOSTO, ' +

                           '   F.RECPAG ' +
                           ' FROM ' +
                           '  TIPOAGRE T, FORCLIXAGREG F ' +
                           ' WHERE ' +
                           '   (T.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG) AND ' +
                           '   (F.IDFORCLI = ' + FloatToStr(rIdForCli) + ') AND ' +
                           '   (F.IDPESSOA = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '   (F.RECPAG = ''P'') ');
end;

procedure TCtrlPessoaForne.SetCdsEmpresaForn(const Value: TClientDataSet);
begin
  FCdsEmpresaForn := Value;
end;

procedure TCtrlPessoaForne.SetCdsFornXDesemb(const Value: TClientDataSet);
begin
  FCdsFornXDesemb := Value;
end;

procedure TCtrlPessoaForne.SetCdsFornXRamo(const Value: TClientDataSet);
begin
  FCdsFornXRamo := Value;
end;

procedure TCtrlPessoaForne.SetCdsImAgregForn(const Value: TClientDataSet);
begin
  FCdsImAgregForn := Value;
end;

function TCtrlPessoaForne.SelRamos(rIdForCli: Double): Olevariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '  IDRAMOFORNECEDOR,DESCRAMOFORNECEDOR ' +
                           ' FROM ' +
                           '   RAMOFORNECEDOR ' +                       
                           ' WHERE ' +
                           '   IDRAMOFORNECEDOR NOT IN ' +
                           '  (SELECT ' +
                           '    IDRAMOFORNECEDOR ' +
                           '   FROM ' +
                           '    FORNXRAMO ' +
                           '   WHERE ' +
                           '    (IDPESSOA = ' + FloatToStr(rIdForCli) + ')) ');
end;

function TCtrlPessoaForne.SelRamosFrone(rIdForCli: Double): Olevariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   FR.IDPESSOA,FR.IDRAMOFORNECEDOR, RM.DESCRAMOFORNECEDOR ' +
                           ' FROM ' +
                           '    FORNXRAMO FR, RAMOFORNECEDOR RM ' +
                           ' WHERE ' +
                           '    (FR.IDPESSOA = ' + FloatToStr(rIdForCli) + ')  AND ' +
                           '    (FR.IDRAMOFORNECEDOR = RM.IDRAMOFORNECEDOR) ');
end;

function TCtrlPessoaForne.SelTipoDesemb(rIdPessoa,
  rIdForCli: Double): OleVariant;
begin                                                                
   Result := GetDataPacket(' SELECT ' +
                           '    CODTIPRECDES,RECPAG,IDPESSOA,DESCRICAO,ANASINT ' +
                           ' FROM ' +
                           '    TIPORECEBDESEMB ' +
                           ' WHERE ' +
                           '    (RECPAG = ''P'') AND ' +
                           '    (IDPESSOA = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           // listar somente os tipo de desembolso ativos
                           '    (ATIVO = ''S'') AND '+
                           '    (CODTIPRECDES NOT IN ' +
                           '     (SELECT ' +
                           '        CODTIPRECDES ' +
                           '      FROM ' +
                           '        FORNXDESEMB ' +
                           '      WHERE ' +
                           '        (RECPAG = ''P'') AND ' +
                           '        (IDEMPRESAPROP =  ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '        (IDPESSOA =  ' + FloatToStr(rIdForCli) + '))) ');
end;

function TCtrlPessoaForne.SelTipoDesembForn(rIdPessoa,
  rIdForCli: Double): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '    DS.IDFORNXDESEMB,DS.CODTIPRECDES,DS.RECPAG,DS.IDPESSOA,DS.IDEMPRESAPROP,TP.DESCRICAO,TP.ANASINT ' +
                           ' FROM ' +
                           '    FORNXDESEMB DS,TIPORECEBDESEMB TP ' +
                           ' WHERE ' +
                           '     (DS.RECPAG = ''P'') AND ' +
                           '     (DS.IDEMPRESAPROP = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '     (DS.IDPESSOA = ' + FloatToStr(rIdForCli) + ')  AND ' +
                           '     (TP.RECPAG = DS.RECPAG) AND ' +
                           '     (TP.IDPESSOA = DS.IDEMPRESAPROP) AND ' +
                           '     (DS.CODTIPRECDES = TP.CODTIPRECDES) ');
end;

function TCtrlPessoaForne.ExecAppServer(Operacao: TOperacao): Boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaForne(Integer(Operacao),
            CdsPessoa.Data, CdsPessoafisica.Data,
            CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
            CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
            CdsImagensPessoa.Data, CdsImagensDOC.Data, CdsImAgregForn.Data,
            CdsEmpresaForn.Data, CdsFornXDesemb.Data, CdsFornXRamo.Data,
            fCriaSubConta);
end;

function TCtrlPessoaForne.SelDadosForne(rIdEmpresa, rIdForCli: Double;
  aCdsSubTipo, aCdsEmpresaForne, aCdsTipoDesemb, aCdsImAgreg,
  aCdsRamoForne, aCdsTipoDesembForn, aCdsImAgregForn,
  aCdsRamoXForne: TClientDataSet): Boolean;
Var
  ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne, ovTipoDesembForn,
  ovImAgregForn, ovRamoXForne, ovProcessos, ovProcessoxIndicativoSusp: OleVariant;

  rIdProcesso: Double;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.SelDadosForne(rIdEmpresa, rIdForCli, ovSubTipo, ovEmpresaForne,
             ovTipoDesemb, ovImAgreg, ovRamoForne, ovTipoDesembForn, ovImAgregForn, ovRamoXForne,
             ovProcessos, ovProcessoxIndicativoSusp);


     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo
     Else
     Begin
        aCdsSubTipo.Data := ovSubTipo;
        aCdsEmpresaForne.Data := ovEmpresaForne;
        aCdsTipoDesemb.Data := ovTipoDesemb;
        aCdsImAgreg.Data := ovImAgreg;
        aCdsRamoForne.Data := ovRamoForne;
        aCdsTipoDesembForn.Data := ovTipoDesembForn;
        aCdsImAgregForn.Data := ovImAgregForn;
        aCdsRamoXForne.Data := ovRamoXForne;
     End;
  End
  Else
  Begin
     Try
       aCdsSubTipo.Data := SelFornecedor(rIdForCli);
       aCdsEmpresaForne.Data := SelEmpresaForne(rIdEmpresa, rIdForCli);
       aCdsTipoDesemb.Data := SelTipoDesemb(rIdEmpresa, rIdForCli); ;
       aCdsImAgreg.Data := SelImpAgreg(rIdEmpresa, rIdForCli);
       aCdsRamoForne.Data := SelRamos(rIdForCli);
       aCdsTipoDesembForn.Data := SelTipoDesembForn(rIdEmpresa, rIdForCli);
       aCdsImAgregForn.Data := SelImpAgregForne(rIdEmpresa, rIdForCli);
       aCdsRamoXForne.Data := SelRamosFrone(rIdForCli);

       Result := True;
     Except
       On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
     End;
  End;
end;

procedure TCtrlPessoaForne.SetCriaSubConta(const Value: Boolean);
begin
  FCriaSubConta := Value;
  _DbEmpresaForn.CriaSubConta := fCriaSubConta;  
end;

//Início - William Santana - SOL 229878.16779 PPM 610132
function TCtrlPessoaForne.SelGrauInstrucao(): OleVariant;
begin
   Result := GetDataPacket('SELECT G.IDGRINSTR, G.DESCRICAO FROM GRINSTR G');
end;

function TCtrlPessoaForne.SelGrauExpAgNocivo(): OleVariant;
begin
   Result := GetDataPacket('SELECT G.IDGRAUEXPAGENTESOCIAL, SUBSTR(G.DESCRICAO,1,255) DESCRICAO FROM GRAUEXPAGENTESOCIAL G');
end;

function TCtrlPessoaForne.SelGrupoCategoria(): OleVariant;
begin
   Result := GetDataPacket('SELECT C.GRUPO FROM CATEGTRABAESOCIAL C GROUP BY C.GRUPO');
end;

function TCtrlPessoaForne.SelDescCategoria(Grupo: string): OleVariant;
begin
   Result := GetDataPacket('SELECT C.IDCATEGTRABAESOCIAL, C.GRUPO, SUBSTR(C.DESCRICAO,1,255) DESCRICAO FROM CATEGTRABAESOCIAL C '+
                           ' WHERE C.GRUPO = '+ QuotedStr(Grupo) );
end;

function TCtrlPessoaForne.GetGrupoCategoria(Idcategtrabaesocial: Double): OleVariant;
begin
   Result := GetDataPacket('SELECT C.IDCATEGTRABAESOCIAL, C.GRUPO FROM CATEGTRABAESOCIAL C '+
                           ' WHERE C.IDCATEGTRABAESOCIAL = '+ floatToStr(Idcategtrabaesocial) );
end;
//Término - William Santana - SOL 229878.16779 PPM 610132

end.

