// Alterações:
{ --------------------------------------------------------------------------------------------------
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

   uFuncaoGeral;

type
   TCtrlAlmoxCompra = class(TCmControlObject)

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


   public

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

      function DataEmissaoMenorQueAtual(dataemissao: TDateTime): boolean;

   end;



implementation
{ TCtrlAlmoxCompra }



constructor TCtrlAlmoxCompra.Create;
begin
   inherited;
   _dbParalmox       := TdbParalmox.Create(Self);
   _dbParamCompras   := TDbParamCompras.Create(Self);
   _DbParamRelats    := TDbParamRelats.Create(Self);
   FuncaoGeral       := TFuncaoGeral.Create;
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



procedure TCtrlAlmoxCompra.SetCds(const Value: TClientDataSet);
begin
   FCds := Value;
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

end.
