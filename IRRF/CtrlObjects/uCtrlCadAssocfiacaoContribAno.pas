//Alterações
//==============================================================================
//Autor.........: Ricardo de Freitas Araújo
//Rotina........: Criação da Classe de Controle
//SOL...........: 134353
//Kintana.......: 790561
//Atualização...: Form
//==============================================================================

unit uCtrlCadAssociacaoContribAno;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, Classes, sysutils, wwQuery, provider, uMidasUtil,
   uCMTypes, CmEventosCadastro, CMDBLookupCombo;

//Nome da tabela
const
     strTableName:string = 'CM.CONTRIBUICAO_ANO';
     
type


   TCtrlCadAssociacaoContribAno = class(TCmControlObject)

   protected


   private

   public
      //Listar Contribuições não que estão vinculadas pelo Ano
      function ListarContrDisponivel(Ano:integer):OleVariant;
      //Listar Contribuições que estão vinculadas pelo Ano
      function ListarContrAno(Ano:integer):OleVariant;
      //Gravar Contribuições vinculadas ao Ano
      function GravarContrAno(Ano:Integer;cds:TClientDataSet):Boolean;
      //Apagar Contribuições vinculadas ao Ano
      function ApagarContrAno(Ano:Integer):Boolean;
      //Retornar último ano com contribuições cadastrado
      function RetornarUltimoAno: integer;
end;

implementation

{ TCtrlCadAssociacaoContribAno }

function TCtrlCadAssociacaoContribAno.ApagarContrAno(Ano: Integer): Boolean;
var
     sSQL:Widestring;
begin
     Result := False;
     //Excluir todos as contribuições do Ano
     sSQL :=  ' DELETE FROM  ' + ' CONTRIBUICAO_ANO ' + ' WHERE ANO = ' + IntToStr(Ano);
     sSQL := Trim(sSQL);
     ExecSQL(sSQL);
     Result := true;
end;

function TCtrlCadAssociacaoContribAno.GravarContrAno(Ano: Integer;
  cds: TClientDataSet): Boolean;
var
   sSQL:string;
begin
     Result := false;

     //Iniciar Transação
     StartTransaction();

     TRY
        //Excluir todas as contribuições do Ano
        ApagarContrAno(Ano);

        //Insere Registros
        cds.First;
        while not cds.Eof Do
        begin
           sSQL  := ' INSERT INTO ' +
                    strTableName +
                    ' (ANO,IDCONTRIBUICAO) VALUES (' +
                    Trim(IntToStr(Ano))  + ',' +
                    cds.Fieldbyname('IDCONTRIBUICAO').asString  + ')';
           ExecSQL(sSQL);

           cds.Next;
        end;

        //Confirmar Transação
        if InTransaction then
           Commit();

     finally
        if InTransaction then
           Rollback();
     end;

     Result := True;

end;

function TCtrlCadAssociacaoContribAno.ListarContrAno(Ano: integer): OleVariant;
var
   sSQL:string;
begin
   sSQL :=     ' SELECT ' +
               '    CO.IDCONTRIBUICAO, ' +
               '    CO.IDTPPERIODICIDADE, ' +
               '    CO.IDBENEFICIO, ' +
               '    CO.IDTPCONTRIBUICAO, ' +
               '    CO.NOME, ' +
               '    CO.IDCONTRIBUICAOPGA, ' +
               '    TE.NOME AS PERIODICIDADE, ' +
               '    BE.NOME AS BENEFICIO ' +
               ' FROM ' +
               '       CONTRIBUICAO CO ' +
               ' LEFT JOIN ' +
               '       TPPERIODICIDADE TE ' +
               ' ON ' +
               '       CO.IDTPPERIODICIDADE = TE.IDTPPERIODICIDADE ' +
               ' LEFT JOIN ' +
               '       BENEFICIO BE ' +
               ' ON ' +
               '       CO.IDBENEFICIO = BE.IDBENEFICIO ' +
               ' JOIN ' +
               '       CM.CONTRIBUICAO_ANO CA ' +
               ' ON   ' +
               '       CO.IDCONTRIBUICAO = CA.IDCONTRIBUICAO ' +
               ' WHERE ' +
               '       CA.ANO = ' +  QuotedStr(IntToStr(Ano))  + ' ' + 
               ' ORDER BY      ' +
               '       CO.NOME ';
   Result := GetDataPacket(sSQL);
end;

function TCtrlCadAssociacaoContribAno.ListarContrDisponivel(
  Ano: integer): OleVariant;
var
   sSQL:string;
begin
    sSQL :=    ' SELECT ' +
               '    CO.IDCONTRIBUICAO, ' +
               '    CO.IDTPPERIODICIDADE, ' +
               '    CO.IDBENEFICIO, ' +
               '    CO.IDTPCONTRIBUICAO, ' +
               '    CO.NOME, ' +
               '    CO.IDCONTRIBUICAOPGA, ' +
               '    TE.NOME AS PERIODICIDADE, ' +
               '    BE.NOME AS BENEFICIO ' +
               ' FROM ' +
               '       CONTRIBUICAO CO ' +
               ' LEFT JOIN ' +
               '       TPPERIODICIDADE TE ' +
               ' ON ' +
               '       CO.IDTPPERIODICIDADE = TE.IDTPPERIODICIDADE ' +
               ' LEFT JOIN ' +
               '       BENEFICIO BE ' +
               ' ON ' +
               '       CO.IDBENEFICIO = BE.IDBENEFICIO ' +

               ' WHERE ' +
               '    CO.IDCONTRIBUICAO NOT IN ' +
               '    (SELECT IDCONTRIBUICAO FROM CM.CONTRIBUICAO_ANO ' +
               '    WHERE ANO = ' + QuotedStr(IntToStr(Ano)) + ')' +

               ' ORDER BY      ' +
               '       CO.NOME ';
   Result := GetDataPacket(sSQL);
end;

function TCtrlCadAssociacaoContribAno.RetornarUltimoAno: integer;
var
   sSQL:string;
   cds:TClientDataSet;
begin

   TRY
      Result := 0;

      cds := TClientDataSet.Create(nil);
      sSQL := 'SELECT MAX(ANO) AS ANO FROM CM.CONTRIBUICAO_ANO';
      cds.Data := GetDataPacket(sSQL);

      if (cds.RecordCount > 0) then
         Result := cds.Fields[0].AsInteger;

   FINALLY
      if cds <> nil then
      begin
         cds.close;
         FreeAndNil(cds);
      end;
   end;
end;

end.
