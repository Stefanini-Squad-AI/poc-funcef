// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 136124
Nº KINTANA..: 812334
Data........: 10/10/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação de novas funções e procedimentos para validação de datas
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina ......: recuperaAtividadePerd
SOL..........: 163982
Kintana......: 1404974
Data.........: 20/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi criada uma rotina para retornar atividades cadastradas e
               desativadas.
--------------------------------------------------------------------------------
Data      : 10.07.2007
Autor     : Antonio Marcos Fernandes de Souza(amf)
Pendencia : 24180
Descrição : Corrigido o teste da Data de Emissão. Quando a data era igual, dava erro no resultado da
function pois, a data do banco se tornava maior devido a parte das horas.
---------------------------------------------------------------------------------------------------
Data      : 13.12.2006
Autor     : Antonio Marcos Fernandes de Souza(amf)
Pendencia : 23860
Descrição : Replicação do função VerifGrauGrupoProd(método do RAD antigo). Ver comentários na assinatura
            da função.
---------------------------------------------------------------------------------------------------
Rotina    : ListPatro, ListPlanoPrev
Data      : 21/05/2004
Autor     : André Pontes
Pendencia : -
Descrição : Retirada das funções, que estavam redundantes. Passa-se a usar as da CMGlobalOBJ50.
---------------------------------------------------------------------------------------------------}

unit uCtrlAlmoxCompra;

interface

uses
   DB, uDataBase, udbAlmox, uCmControlObject, Classes, udbParalmox,
   udbParamCompras, dbclient, sysutils,uSistema, uMidasUtil, uCMTypes, uDbParamRelats,
    uCMClientDataSet, //Vinicius Maciel - SOL 163982 KTN 1404974
   uFuncaoGeral, UCmSqlParams, Forms;

type
   TCtrlAlmoxCompra = class(TCmControlObject)

   _sql              : TCmSqlParams;

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;

   private
      _dbParalmox       : TdbParalmox;
      _dbParamCompras   : TdbParamCompras;
      _DbParamRelats    : TDbParamRelats;

      FCds              : TClientDataSet;
      FCdsParamRel      : TClientDataSet;

      FuncaoGeral       : TFuncaoGeral;

      procedure SetCds(const Value: TClientDataSet);
      procedure SetCdsParamRel(const Value: TClientDataSet);


    function carregaAtividade(sCodAtividade: String): OleVariant;//Vinicius Maciel - SOL 163982 KTN 1404974


   public

      function recuperaAtividadePerd(sCodAtividade: String): String; //Vinicius Maciel - SOL 163982 KTN 1404974
      property Cds         : TClientDataSet read FCds write SetCds;
      property CdsParamRel : TClientDataSet read FCdsParamRel write SetCdsParamRel;

      constructor Create; override;
      destructor  Destroy; override;

      // Perepara para gravação os parãmetros de relatório do Almoxarifado
      function PreparaAssinatura(IdPessoa, IdModulo: Double) : Boolean;

      // Grava os parãmetros da tela de parâmetros do Almoxarifado.
      function GravaParalmox : Boolean;

      // Pega os parãmetros do  Almoxarifado para determinada Empresa.
      function GetParalmox(IdPessoa : Integer) : OleVariant;

      // Verifica se já existe grupo de produtos cadatrados
      function ExisteGrupoProduto : Boolean;

      // Verifica se já existe movimentação de produtos no almoxarifado
      function ExisteMovimentacao : Boolean;

      // Lista as assinatura dos visto para relatórios
      function ListAssinaturas(IdPessoa, IdModulo: Double) : OleVariant;

      // Grava os parãmetros da tela de parâmetros do Compras
      function GravaParamCompras : Boolean;

      // Pegaos parãmetros do Compras para determinada Empresa.
      function GetParamCompras(IdPessoa : Integer) : OleVariant;

      function ListTipoDoc : OleVariant;
      function ListAlterardor(IdPessoa : Integer) : OleVariant;

      {
      no RAD antigo, há a dependência do modelo RAD em relação a verificação do grau do grupo de
      produto. Chegamos a conclusão que esta responsabilidade não é do RAD. Com base nesta análise,
      retiramos da visão do modelo RAD, o atributo GRAUGRUPOPROD (que continua existindo no RAD antigo)
      e o adicionamos aos parâmetros do Almoxarifado(tela) tabela PARALMOX nesta Ctrl.
      }
      function VerifGrauGrupoProd(Idpessoa: integer;
                                  IdTipoProcesso: extended;
                                  sGrupoProd1, sGrupoProd2: string): boolean;

      function  DataEmissaoMenorQueAtual(dataemissao: TDateTime): boolean;
      function  SelecionaGrupoUsuario: OleVariant; //Thaise Amaral SOL:136124 KTN:812334
      function  SelecionaUsuBloqDes(idGrupo: Integer; Status: ShortString): OleVariant; //Thaise Amaral SOL:136124 KTN:812334
      function  SelecionaDiaUtilMensal: Integer; //Thaise Amaral SOL:136124 KTN:812334
      procedure AtualizaStatus(BloqDes: ShortString; idUsuario: Integer); //Thaise Amaral SOL:136124 KTN:812334
      function  Mensagem(Msg: String; Tipo: Integer; Imprime: Boolean): Boolean; //Thaise Amaral SOL:136124 KTN:812334
      procedure AtualizaDiaUtil(iDia: Integer); //Thaise Amaral SOL:136124 KTN:812334
      function  LimiteDiaUtil: Integer; //Thaise Amaral SOL:136124 KTN:812334
      function  MesAtualPorExtenso: String; //Thaise Amaral SOL:136124 KTN:812334
   end;



implementation
{ TCtrlAlmoxCompra }

procedure TCtrlAlmoxCompra.AtualizaDiaUtil(iDia: Integer);
begin
  Try
     StartTransaction;
     // DISPFINANC
     _sql.SQL.Clear;
     _sql.SQL.Add('UPDATE PARALMOX SET ');
     _sql.SQL.Add('DIAUTILMENSAL = ' + InttoStr(iDia));
     _sql.Prepare;

     if not ExecSQL(_sql.SQLChanged,False) Then
        Raise Exception.Create(MessageInfo);

     Commit;
     //Result := True;
  except
     on E:Exception do
     begin
        Rollback;
        //Result := False;
        MessageInfo := E.Message;
     end;
  end;

end;

procedure TCtrlAlmoxCompra.AtualizaStatus(BloqDes: ShortString;
  idUsuario: Integer);
begin
  Try
     StartTransaction;
     // DISPFINANC
     _sql.SQL.Clear;
     _sql.SQL.Add('UPDATE USUARIOSISTEMA SET ');
     _sql.SQL.Add('FLGDISPALMOX = ' + QuotedStr(BloqDes));
     _sql.SQL.Add('WHERE IDUSUARIO = ' + QuotedStr(InttoStr(idUsuario)));
     _sql.Prepare;

     if not ExecSQL(_sql.SQLChanged,False) Then
        Raise Exception.Create(MessageInfo);

     Commit;
     //Result := True;
  except
     on E:Exception do
     begin
        Rollback;
        //Result := False;
        MessageInfo := E.Message;
     end;
  end;

end;

constructor TCtrlAlmoxCompra.Create;
begin
   inherited;
   _dbParalmox       := TdbParalmox.Create(Self);
   _dbParamCompras   := TDbParamCompras.Create(Self);
   _DbParamRelats    := TDbParamRelats.Create(Self);
   FuncaoGeral       := TFuncaoGeral.Create;
   _sql               := TCmSqlParams.Create(nil);
   _sql.ControlObject := Self;
end;



function TCtrlAlmoxCompra.DataEmissaoMenorQueAtual(dataemissao: TDateTime): boolean;
var
  cdsLocal: TClientDataSet;
begin
  try
     try
       Result := False;
       cdsLocal := TClientDataSet.Create(nil);
       cdsLocal.Data := GetDataPacket('SELECT SYSDATE FROM DUAL');
       Result := (dataemissao < Trunc(cdsLocal.FieldByName('SYSDATE').AsDateTime));
     except
     on e: exception do
       raise Exception.Create('Falha ao pesquisar data atual no servidor');
     end
  finally
     FreeAndNil(cdsLocal);
  end;
end;

destructor TCtrlAlmoxCompra.Destroy;
begin
   if IsAppServer then FreeCds([Cds,CdsParamRel]);

   _dbParalmox.Free;
   _dbParamCompras.Free;
   _DbParamRelats.Free;
   FreeAndNil(FuncaoGeral);
   inherited;
end;


procedure TCtrlAlmoxCompra.DoChangeDataBase;
begin
   inherited;

   _dbParalmox.DataBaseName     := DataBaseName;
   _dbParamCompras.DataBaseName := DataBaseName;
   _DbParamRelats.DataBaseName  := DataBaseName;
end;



function TCtrlAlmoxCompra.ExisteGrupoProduto: Boolean;
begin
   _Cds.Data := GetDataPacket('SELECT COUNT(CODGRUPOPROD) AS TOTAL FROM GRUPPROD');
   Result    := _Cds.FieldByName('TOTAL').AsInteger > 0;
end;



function TCtrlAlmoxCompra.ExisteMovimentacao: Boolean;
begin
   _Cds.Data := GetDataPacket('SELECT COUNT(IDMOV) AS TOTAL FROM MOVIMENT');
   Result    := _Cds.FieldByName('TOTAL').AsInteger > 0;
end;



function TCtrlAlmoxCompra.GetParalmox(IdPessoa: Integer): OleVariant;
begin
   _dbParalmox.IdPessoa.AsFloat  := IdPessoa;
   Result                        := GetDataPacket(_dbParalmox.SSqlSelect);
end;



function TCtrlAlmoxCompra.GetParamCompras(IdPessoa: Integer): OleVariant;
begin
   _dbParamCompras.IdPessoa.AsFloat := IdPessoa;
   Result                           := GetDataPacket(_dbParamCompras.SSqlSelect);
end;



function TCtrlAlmoxCompra.GravaParalmox: Boolean;
begin
if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaParalmox(FCds.Data , FCdsParamRel.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
else
   begin
      Try
         StartTransaction;

           Result := ApplyCds(Fcds,_dbParAlmox,[],[]);
           if not Result then Raise
              Exception.Create(_dbParAlmox.MessageInfo);

           Result := ApplyCds(FCdsParamRel,_DbParamRelats,[],[]);
           if not Result then Raise
              Exception.Create(_DbParamRelats.MessageInfo);

         Commit;
      except
         On E:Exception Do
          begin
             Rollback;
             Result := False;
             MessageInfo := E.Message;
          end;
      end;
   end;
end;

function TCtrlAlmoxCompra.GravaParamCompras: Boolean;
begin
if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaParamCompras(FCds.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
else
   begin
      Try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbParamCompras ,[],[]);
         if not Result then Raise
            Exception.Create(_dbParamCompras.MessageInfo);

         Commit;
      except
         On E:Exception Do
          begin
             Rollback;
             Result := False;
             MessageInfo := E.Message;
          end;
      end;
   end;
end;

function TCtrlAlmoxCompra.LimiteDiaUtil: Integer;

  //Trazendo a data atual do banco
  function DataAtual: TDateTime;
  begin
    _Cds.Data:= GetDataPacket('SELECT TRUNC(SYSDATE) DATAATUAL FROM DUAL');
    Result:= _Cds.FieldByName('DATAATUAL').AsDateTime;
  end;

  //Carregando o primeiro dia do mês para começarmos a contar dele os dias úteis.
  function PrimeiroDiadoMes: TDateTime;
  begin
    _Cds.Data:= GetDataPacket('SELECT TRUNC(SYSDATE,''MONTH'') PRIMEIRODIAMES FROM DUAL');
    Result:= _Cds.FieldByName('PRIMEIRODIAMES').AsDateTime;
  end;

  //Carregando ultimo DIA do mês
  function DiaFinalMes: Integer;
  begin
    _Cds.Data:= GetDataPacket('SELECT EXTRACT(DAY FROM LAST_DAY(SYSDATE)) ULTIMODIAMES FROM DUAL');
    Result:= _Cds.FieldByName('ULTIMODIAMES').AsInteger;
  end;

  //Carregando a ultima data do mês
  function UltDiaMes: TDateTime;
  begin
    _Cds.Data:= GetDataPacket('SELECT TRUNC(LAST_DAY(SYSDATE)) ULTDATAMES FROM DUAL');
    Result:= _Cds.FieldByName('ULTDATAMES').AsDateTime;
  end;

  //Verificando se a data em questão é um feriado. Se for, não será contada como
  //dia útil
  function VerificaFeriado(Data: TDateTime): Boolean;
  var sSql: String;
  begin
    sSql:= 'SELECT DATAFERIADO FROM FERIADOS ' +
           'WHERE DATAFERIADO = ' + QuotedStr(DateToStr(Data)) +
           ' AND IDPAIS =  1 ';
           

    _Cds.Data:= GetDataPacket(sSql);

    Result:= _Cds.FieldByName('DATAFERIADO').AsDateTime = 0;
  end;



  var sSql: String;
      dUltDiaMes, dPrimeiroDiaMes, dDiaUtil: TDatetime;
      iDiaUtil, iContDias: Integer;

begin
  dPrimeiroDiaMes:= PrimeiroDiadoMes;
  dUltDiaMes:= UltDiaMes;

  iDiaUtil:= DiaFinalMes;
  iContDias:= 1;

  while dPrimeiroDiaMes <> dUltDiaMes do
  begin
    if (DayOfWeek(dPrimeiroDiaMes) <> 7) and
       (DayOfWeek(dPrimeiroDiaMes) <> 1) and
       (VerificaFeriado(dPrimeiroDiaMes)) then
    begin
      dDiaUtil:= dPrimeiroDiaMes;
      Inc(iContDias);
    end;
    dPrimeiroDiaMes:= dPrimeiroDiaMes + 1;
  end;
  Result:= iContDias;
end;

function TCtrlAlmoxCompra.ListAlterardor(IdPessoa: Integer): OleVariant;
var
  SQL : String;
begin
   SQL := ' SELECT  CODALTERADOR, DESCRICAO '+
          ' FROM  TIPOALTERADOR '+
          ' WHERE  (RECPAG = ''P'') '+
          '    AND (ACRESDECRES = ''D'') '+
          '    AND (IDPESSOA = '+IntToStr(IdPessoa)+') ';

   Result := GetDataPacket(SQL);
end;



function TCtrlAlmoxCompra.ListAssinaturas(IdPessoa, IdModulo: Double): OleVariant;
var
   SQL : String;
begin
   SQL :=
   ' SELECT IDPARAMRELATS,IDMODULO,IDPESSOA,NOMECOMPO,DESCRICAO,VALOR,'+
   '        NOMERELATORIO '+
   ' FROM PARAMRELATS '+
   ' WHERE (IDMODULO = '+FloatToStr(IdModulo)+') '+
   '   AND (IDPESSOA = '+FloatToStr(IdPessoa)+') '+
   ' ORDER BY DESCRICAO ';

   Result := GetDataPacket(SQL);
end;


function TCtrlAlmoxCompra.ListTipoDoc: OleVariant;
var
   SQL : String;
begin
   SQL :=
   'SELECT '                  + #13 +
   '  CODTIPDOC, DESCRICAO '  + #13 +
   'FROM  TIPODOCRECPAG '     + #13 +
   'WHERE '                   + #13 +
   '       RECPAG = ''P'' '   + #13 +
   '   AND DEBCRE = ''C'' ';

   Result := GetDataPacket(SQL);
end;



function TCtrlAlmoxCompra.Mensagem(Msg: String; Tipo: Integer; Imprime: Boolean): Boolean;
begin
  Result:= True;
  if Imprime then
  begin
    Application.MessageBox(Pchar(Msg), Pchar(ExtractFileName(Application.Title)), Tipo);
    Result:= False;
  end;
end;

function TCtrlAlmoxCompra.MesAtualPorExtenso: String;
begin
  _Cds.Data:= GetDataPacket(' SELECT DECODE(EXTRACT(MONTH FROM SYSDATE),' +
                            '        1,  ''Janeiro'',' +
                            '        2,  ''Fevereiro'',' +
                            '        3,  ''Março'',' +
                            '        4,  ''Abril'',' +
                            '        5,  ''Maio'',' +
                            '        6,  ''Junho'',' +
                            '        7,  ''Julho'',' +
                            '        8,  ''Agosto'',' +
                            '        9,  ''Setembro'',' +
                            '        10, ''Outubro'',' +
                            '        11, ''Novembro'',' +
                            '        12, ''Dezembro'') MESCORRENTE FROM DUAL');
                            
  Result:= _Cds.FieldByName('MESCORRENTE').AsString;
end;

procedure TCtrlAlmoxCompra.OnCreateAppServer;
begin
   inherited;
   FCds         := TClientDataSet.Create(nil);
   FCdsParamRel := TClientDataSet.Create(nil);
end;



function TCtrlAlmoxCompra.PreparaAssinatura(IDPessoa, IDModulo: Double): Boolean;
var
   x   : Integer;
   SQL : String;
begin
   Result := True;

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.PreparaAssinatura(IdPessoa, IdModulo);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         SQL :=
         'SELECT '                                          + #13 +
         '   COUNT(*) AS TOTAL FROM PARAMRELATS '           + #13 +
         'WHERE '                                           + #13 +
         '       IDMODULO = ' + FormatFloat('#0', IDModulo) + #13 +
         '   AND IDPESSOA = ' + FormatFloat('#0', IDPessoa);

         _Cds.Data := GetDataPacket(SQL);

         if _Cds.FieldByName('TOTAL').AsInteger = 0  then
         begin
            StartTransaction;

            for x := 1 To 4 Do
            begin
               _DbParamRelats.IDMODULO.AsFloat       := IdModulo;
               _DbParamRelats.IDPESSOA.AsFloat       := IdPessoa;
               _DbParamRelats.NOMECOMPO.AsString     := 'LbAssinatura ' + IntToStr(x);
               _DbParamRelats.DESCRICAO.AsString     := 'Assinatura ' + IntToStr(x);
               _DbParamRelats.VALOR.AsString         := '';
               _DbParamRelats.NOMERELATORIO.AsString := 'Requisições Cadastradas';

               if not _DbParamRelats.Insert then Raise Exception.Create(_DbParamRelats.MessageInfo);
            end;

            Commit;
         end;

      except
         on E:Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;


function TCtrlAlmoxCompra.SelecionaDiaUtilMensal: Integer;
var sSql: String;
begin
  sSql:= 'SELECT DIAUTILMENSAL FROM PARALMOX';
  _Cds.Data:= GetDataPacket('SELECT DIAUTILMENSAL FROM PARALMOX');
  Result:= _Cds.FieldByName('DIAUTILMENSAL').AsInteger;
end;

procedure TCtrlAlmoxCompra.SetCds(const Value: TClientDataSet);
begin
   FCds := Value;
end;
//Thaise Amaral SOL:136124 KTN:812334
function TCtrlAlmoxCompra.SelecionaGrupoUsuario: OleVariant;
begin
  Result := GetDataPacket('SELECT IDGRUPO, NOMEGRUPO ' +
                          ' FROM GRUPOACESSO         ' +
                          'ORDER BY DECODE(IDGRUPO, 86, NULL, NOMEGRUPO) NULLS FIRST');
end;

//Thaise Amaral SOL:136124 KTN:812334
function TCtrlAlmoxCompra.SelecionaUsuBloqDes(idGrupo: Integer; Status: ShortString): OleVariant;
var sSql: String;
begin
  sSql:= 'SELECT DISTINCT U.IDUSUARIO, U.NOMEUSUARIO, U.FLGDISPALMOX ' +
         'FROM USUARIOSISTEMA U, GRUPOUSU GR '                +
         'WHERE U.IDUSUARIO = GR.IDUSUARIO '               +
         'AND GR.IDGRUPO = ' + InttoStr(idGrupo) ;
         if Status = 'S' then
           sSql:= sSql + ' AND (FLGDISPALMOX IS NULL OR FLGDISPALMOX = ''S'')'
         else
           sSql:= sSql + ' AND (FLGDISPALMOX = ''N'')';
         sSql:= sSql + ' ORDER BY U.NOMEUSUARIO';


  Result := GetDataPacket(sSql);
end;



procedure TCtrlAlmoxCompra.SetCdsParamRel(const Value: TClientDataSet);
begin
   FCdsParamRel := Value;
end;


function TCtrlAlmoxCompra.VerifGrauGrupoProd(Idpessoa: integer;
  IdTipoProcesso: extended; sGrupoProd1, sGrupoProd2: string): boolean;
Var
   iGrauGrupo, Tam: Integer;
   sMascara, SQL: String;
begin
   Result := True;

   Try
      SQL := 'SELECT GRAUGRUPPROD FROM PARALMOX '+
             ' WHERE ( IDPESSOA = ' + IntToStr( IdPessoa ) + ' )';

      _Cds.Data  := GetDataPacket( SQL );
      iGrauGrupo :=  _Cds.FieldByName( 'GRAUGRUPPROD' ).asInteger;

      If iGrauGrupo > 0 Then
         Begin
            SQL := 'SELECT MASCGRUPOPROD FROM PARALMOX '+
                   ' WHERE ( IDPESSOA = ' + IntToStr( IdPessoa ) + ' )';

            _Cds.Data := GetDataPacket( SQL );
            sMascara  := _Cds.FieldByName( 'MASCGRUPOPROD' ).asString;

            Tam := FuncaoGeral.CalcNumEleGrau( sMascara, iGrauGrupo );

            If Copy( sGrupoProd1, 1, Tam ) <> Copy( sGrupoProd2, 1, Tam ) Then
               raise Exception.Create('Este produto é de um grupo diferente dos outros produtos selecionados' );
         End;
   Except
      On E:Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
end;

//Vinicius Maciel - SOL 163982 KTN 1404974
function TCtrlAlmoxCompra.recuperaAtividadePerd(sCodAtividade : String) : String;
var
    CdsAux : TCMClientDataSet;
begin
    CdsAux := TcmClientDataSet.create(nil);
    CdsAux.Data := carregaAtividade(sCodAtividade);
    Result := CdsAux.FieldByName('Nome').asString;
    CdsAux.Free;
end;


function TCtrlAlmoxCompra.carregaAtividade(sCodAtividade : String) :OleVariant;
var
    sSQl : String;
begin
    sSQL := 'SELECT NOME FROM UNIDNEGOCIO WHERE UNIDNEGOC = '+sCodAtividade;
    result := GetDataPacket(sSQL);
end;
//Vinicius Maciel - SOL 163982 KTN 1404974 - FIM

end.
