{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
//***************************************************************************************************
// Data       : 05/02/2019
// SIG        : 81798
// Autor      : Andre Imakawa
// Descrição  : Recompilação
//***************************************************************************************************
//Alteração  : AlterSessionBD
//Nº SIG.....: 81948
//Data.......: 07/02/2019
//Responsável: Andre Imakawa
//Descrição..: Executa SQL
//***************************************************************************************************

unit UDataBase;

interface

uses
    Forms, DB, DBTables, wwTable, wwQuery, Controls, SysUtils, Dialogs, classes,
    Math, dbclient, windows, uCMTypes, wwdbgrid,UMensErro; //KTN 767861 - SOL 132659 UMensErro

{Funções baseadas em TTable}

{Aplica o parêmetro sFiltro a tabela retornando false se a expressão apresentar erro}
function FiltraTab(var tbl : TwwTable; sFiltro : string) : Boolean;
{Limpa a propriedade filter da tabela disabilitando o status de filtered}
procedure TiraFiltro(var tbl : TwwTable);
{Atribui a um TTable o dDatabAseNamee o Table Name executando o open e verificando se existem registros}
function AbrirTab(tbl : TTable; const BaseName,TblName : String) : Boolean;
{Abre um TdataBase baseado com Driver's baseados em PATH's}
function AbrirDataBase(db : TDatabase; const sDBaseName, sPath : string; sDriverName : string) : Boolean;
{Retorna o valor do maior identificador de uma tabela com a chave primária baseada em ID}
function ValorUltRegistro(tbl : TwwTable; const sIndice, sCampo : string  ) : Integer;
{Atribui uma instrução SQl a um Table}
function FazQueryEmTab(var qry : TwwTable; str : string) : Boolean;
{Abre a tabela passada como parâmetro}
function AbrirTabela(tbl: TTable): Boolean;
{!Depreciado!}
function CriarTabela(const DBName, TblName: String): TTable;
{Copia o registro de uma TTable para outro. Os fields devem ser os mesmos e estar na mesma ordem}
function CopiarRegistro(tblFonte, tblDestino: TTable): Boolean;
{Configura o table passado como Detalhe do vinculado ao MSource}
procedure MasterDetail(tbl: TTable ; MSource: TDataSource; MFields: String);

{Funções baseadas em Query}

{!Depreciado! - Abre a query com a string passada e retorna se a mesma está vazia - Usar FazQuery}
function Localiza(var qry : TwwQuery; str : string) : Boolean;
{Abre a Instrução SQL em um TwwQuery e retorna se a consulta está vazia}
function FazQuery(qry : TwwQuery; str : string) : Boolean; Overload;
{Abre a Instrução SQL em um TClientDataSet e retorna se a consulta está vazia}
function FazQuery(qry : TClientDataSet; str : string) : Boolean; Overload;
{Executa a Instrução SQL em um TwwQuery e retorna se a execução foi bem sucedida}
function ExecutarQuery(qry : TwwQuery; const str :string): Boolean; Overload;
{Executa a Instrução SQL em um TClientDataSet e retorna se a execução foi bem sucedida}
function ExecutarQuery(qry : TClientDataSet; const str :string): Boolean; Overload;
{!Depreciado! Executa uma instrução de insert baseada nos Fields e Values passados como parâmetro - Usar SqlInsert}
function InsereQry(qry:TwwQuery; tbl:String; var sSQLIncFields,sSQLIncValues:String):Boolean;
{!Depreciado! Executa uma instrução de update baseada nos Fields e Values passados como parâmetro - Usar SqlInsert}
function AtualizaQry(qry:TwwQuery; tbl:String; var sSQLFields:String;sFiltro:String):Boolean;
{Retorna o valor do sequence iniciado por SEQ + NomeTbl, caso o sequence não exista cria o mesmo no banco}
function LeUltRegistro (qryParPont : TwwQuery; NomeTbl : string) : Cardinal; Overload;
{Retorna o valor do sequence iniciado por SEQ + NomeTbl, caso o sequence não exista cria o mesmo no banco,
controlando a exibiçõa da mensagem, nome do database e o tipo de servidor}
function LeUltRegistro (Nometbl :string; bExibeMensagem :Boolean = True; sDataBaseName :string = 'BaseDados'; DriverServidor :String = DriverDB2; sSessionName :string = '') : Cardinal;  Overload;
{Retorna o valor do maior identificador de uma tabela com a chave primária baseada em ID}
function RetUltRegQry(qry : TwwQuery; sField, sTab, sAlias, sFiltro : string ) : integer;
{Incrementa o valor da coluna especificada em fld do DataSet}
procedure IncField(dset: TDataSet; fld: String; incr: Real);
{Decrementa o valor da coluna especificada em fld do DataSet}
procedure DecField(dset: TDataSet; fld: String; decr: Real);
{Abre a transação com o DataBase}
procedure StartTransacao;
{Commita a transação com o DataBase}
procedure CommitTransacao;
{"RolBeka" a transão com o DataBase}
procedure RollBackTransacao;
{Executa o ApplliUpdates, CommitUpdates e COmmit com os DataSets Passados no array}
procedure AplicaAlteracoes(pDataSet : array of TDBDataSet);
{Monta a frase de insert como os parâmetros passados. Parâmetros do tipo TDateTime devem ser
 passados como Variant}
function SqlInsert(Values : array of const;
                   TableName : string;
                   ColNames : array of string) : string; overload;
{Monta a frase de insert como os parâmetros passados. Parâmetros do tipo TDateTime devem ser
 passados como Variant}
function SqlInsert(Values : array of const;
                   TableName : string) : string; overload;
{Monta a frase de insert como os parâmetros passados. Parâmetros do tipo TDateTime devem ser
 passados como Variant}
function SqlInsert(Values : array of const;
                   TableName : string;
                   ColNames : array of string;
                   NullIfZero : array of boolean;
                   aFloatPrecision :Array of Integer; aSaveDateTimeFormat: Array of Boolean) : string; overload;
{Monta a frase de update como os parâmetros passados. Parâmetros do tipo TDateTime devem ser
 passados como Variant}
function SqlUpdate(Values : array of const;
                   TableName : string;
                   ColNames : array of string;
                   WhereClause : string) : string; overload;

function SqlUpdate(Values : array of const;
                   TableName : string;
                   ColNames : array of string;
                   WhereClause : string;
                   NullIfZero : array of boolean;
                   aFloatPrecision :Array of Integer;
                   aSaveDateTimeFormat: Array of Boolean) : string; overload;

{Gera um database name e atribui para todas as Queryes do DataModulo ou form passado com  Owner.}
function GeraDataBaseName(Owner :TComponent; DataBase: TDataBase;
    SetaNetDir: Boolean = false; DbSession: TSession = nil):String;
{Altera o DataBaseName das queryes passadas no array caso seja diferente do parâmetro}
procedure ChangeDataBaseName(Q: array of TDataSet; sDataBaseName :String = 'BaseDados'; sSessionName :string = '');

{** Implementado na uDataBase **}
procedure MoveRegistros(GrdOrigem, GrdDestino: TwwDbGrid);
procedure MoveFields(DsOrigem, DsDestino: TDataSet; Operacao: TOperacao; bApagaOrigem: Boolean);

function  VerificaLinhaGrid(DataSet: TDataSet; iTagChave, iTagVazio: Integer; sTabelaMensagem: String; bPermiteChaveVazia: Boolean):Boolean;
Procedure FechaQry(DataSets: Array of TDataSet; bFree, bUnPrepare: Boolean);

procedure AlterSessionBD(pValue: String); // Andre Imakawa - SIG 81948

implementation

uses dBaseDados, uSistema, uSequence, uCMFileUtils, JCLFileUtils, uCtrlPadroes;

const CrLf = #13#10;

function FiltraTab(var tbl : TwwTable; sFiltro : string) : Boolean;

begin
    result := True;
  if tbl.Active then
  try
    tbl.wwFilter.Clear;
    tbl.wwFilter.Add(sFiltro);
    tbl.FilterActivate;
    tbl.First;
  except
    result := False;
  end;
end;

{
----------------------------------------------------------------
}
function AbrirTab(tbl : TTable; const BaseName,TblName : String) : Boolean;
begin
  Screen.Cursor := crHourglass;
  Result := True;
  tbl.Active := False;
  try
    tbl.DatabaseName := BaseName;
    tbl.TableName    := TblName;
    tbl.Active       := True;
  except
    Result := False;
  end;
  Screen.Cursor := crDefault;
end;

{
----------------------------------------------------------------
}
{ +++ Procedimento para conectar uma Base de dados.}
function AbrirDataBase(db : TDatabase; const sDBaseName, sPath : string; sDriverName : string) : Boolean;
begin
   Result := True;
   db.Connected := False;
   db.Params.Clear;
   db.Params.Add('path='+ sPath);
   db.DriverName := sDriverName;
   db.DataBaseName := sDBaseName;
   try
      {Ativa a base}
      db.Connected := True;
   except
      on EDBEngineError do
         begin

         end;
   end;
   Screen.Cursor := crDefault;
end;

{
----------------------------------------------------------------
}
function ValorUltRegistro(tbl : TwwTable; const sIndice, sCampo : string  ) : Integer;
begin
   Result := -1;
   TiraFiltro(tbl);
   tbl.IndexName := sIndice;
   if tbl.RecordCount = 0
   then begin
     Result := 0;
     Exit;
   end;
   if tbl.State = dsBrowse
   then tbl.Last
   else Exit;
   Result := tbl.FieldByName(sCampo).AsInteger;
end;

{
----------------------------------------------------------------
}
procedure TiraFiltro(var tbl : TwwTable);
begin
   tbl.wwFilter.Clear;
   tbl.FilterActivate;
end;

{
----------------------------------------------------------------
}
function Localiza(var qry : TwwQuery; str : string) : Boolean;
begin
   with qry do
   begin
   Try
      Close;
      SQL.Clear;
      SQL.Add(str);
      Open;
      Except
              Result := False;
              Exit;
      end;
      Result := Not IsEmpty;
   end;
end;

{
----------------------------------------------------------------
}

function ExecutarQuery(qry: TWWQuery; const str :string): Boolean; Overload;
begin
   with qry do
   begin
        try
           Close;
           SQL.Clear;
           SQL.Add(str);
           ExecSQL;
           Result := true;
        //KTN 767861 - SOL 132659 Inicio
        Except on E : Exception do begin
           TratarErro(E.Message);
        //KTN 767861 - SOL 132659 Fim
           Result := false;
        end;
   end;

   end;
end;

function ExecutarQuery(qry: TClientDataSet; const str :string): Boolean; Overload;
begin
   with qry do
   begin
        try
           Close;
           CommandText := str;
           Execute;
           Result := true;
        //KTN 767861 - SOL 132659 Inicio
        Except on E : Exception do begin
           TratarErro(E.Message);
        //KTN 767861 - SOL 132659 Fim
           Result := false;
        end;
   end;
   //KTN 767861 - SOL 132659 Fim
   end;
end;


{
----------------------------------------------------------------
}
function FazQuery(qry : TwwQuery; str : string) : Boolean; OverLoad;
begin
     with qry do
     begin
     	  Try
	     Close;
	     SQL.Clear;
             SQL.Add(str);
	     Open;
             Result := not isEmpty;
          Except
             raise;
          end;
     end;
end;

function FazQuery(qry : TClientDataSet; str : string) : Boolean; OverLoad;
begin
   with qry do
   begin
        Try
           Close;
           Data := Padroes.GetDataPacket(Str);
           Open;
           Result := not isEmpty;
        Except
           raise;
        end;
   end;
end;


{
----------------------------------------------------------------
}
function InsereQry(qry:TwwQuery; tbl:String; var sSQLIncFields,sSQLIncValues:String):Boolean;
begin
   Result := True;
   with qry do begin
      Close;
      Sql.Clear;
      Sql.Add('INSERT INTO '+ tbl + '('+sSQLIncFields+')');
      Sql.Add('VALUES ('+sSQLIncValues+')');
      try
        ExecSql;
      except
        Result := False;
      end;
      Close;
   end;
end;

{-----------------------------------------------------------------------------}
function AtualizaQry(qry:TwwQuery; tbl:String; var sSQLFields:String;sFiltro:String):Boolean;
begin
   Result := True;
   with qry do begin
      Close;
      Sql.Clear;
      SQL.Add('UPDATE '+ tbl +' SET '+sSQLFields);
      SQL.Add(' WHERE '+ sFiltro);
      try
         ExecSql;
      except
            raise;

            Result := False;

      end;
      Close;
   end;
end;

{-----------------------------------------------------------------------------}
function RetUltRegQry(qry : TwwQuery; sField, sTab, sAlias, sFiltro : string ) : integer;
begin
  with qry do begin
   Try
      Close;
      SQL.Clear;
      if sFiltro <> '' then sFiltro := ' WHERE '+sFiltro;
         SQL.Add('SELECT MAX('+sField+') '+sAlias+ ' FROM '+ sTab+sFiltro);
      Open;
      Result := qry.FieldByName(sAlias).AsInteger;
   except
         raise;
         Result := -10;
   end;
    Close;
  end;
end;
(******************************************************************************)

function LeUltRegistro (qryParPont : TwwQuery; NomeTbl : string) : Cardinal; Overload;
var Sequence : TSequence;
    SeqOracle : TSeqOracle;
    iProx : integer;
begin
      if (UpperCase(Trim(Sistema.DriverServidor)) =  DriverOracle) then
      begin
           SeqOracle := TSeqOracle.Create('SEQ'+AnsiUpperCase(Nometbl), 'BaseDados');
           try
              {Tenta pegar o maior número de sequencia}
              SeqOracle.Trava;




              iProx := SeqOracle.Proximo;


              if (iProx = -7) then
              Begin
                 Screen.Cursor := crDefault;
                 Raise Exception.Create('O usuário não possui direito a criação da sequence ' + 'SEQ' + AnsiUpperCase(Nometbl) + ' no banco.');
              End
              Else
              if (iProx = -9) then
              Begin
                 Screen.Cursor := crDefault;
                 Raise Exception.Create('O Sequence solicitado não existe no banco local e é um sequence com a faixa contolada.'+#10+#13+' Atualize as faixas através do módulo CENTRALIZA');
              End
              Else
              if (iProx = -8) then
              begin
                   // Estouro de faixa
                   Result := 0;
                   ExecutarQuery(dtmBaseDados.qry, 'UPDATE FAIXASEQUENCE SET '+
                                                   'VLRINISEQ = VLRINISEQRESERVA, '+
                                                   'VLRFINSEQ = VLRFINSEQRESERVA, '+
                                                   'VLRINISEQRESERVA = 0 '+
                                                   'WHERE NOMESEQ = '''+SeqOracle.Nome+'''');

                   FazQuery(dtmBaseDados.qry, 'SELECT VLRINISEQ, VLRFINSEQ '+
                                         ' FROM FAIXASEQUENCE WHERE NOMESEQ = '''+
                                         SeqOracle.Nome+'''');

                   // Testa o estoura da segunda faixa
                   if dtmBaseDados.qry.FieldByName('VLRINISEQ').AsInteger > 0 then
                   begin
                        if SeqOracle.Altera( dtmBaseDados.qry.FieldByName('VLRINISEQ').AsInteger,
                                       dtmBaseDados.qry.FieldByName('VLRFINSEQ').AsInteger,
                                       dtmBaseDados.qry.FieldByName('VLRINISEQ').AsInteger) then
                           Result := SeqOracle.Proximo;

                   end
                   else
                   begin
                      Screen.Cursor := crDefault;
                      Raise Exception.Create('Estouro da segunda faixa de sequences'+#10+#13+'Atualize as faixas através do módulo CENTRALIZA');
                   end;
              end
              else
                  Result := iProx;

              SeqOracle.Libera;
           except
              On E:Exception Do
              Begin
                 SeqOracle.Libera;
                 Raise Exception.Create('Não foi possível encontrar o sequence: '+SeqOracle.Nome + (#13+#10) + E.Message);
              End;
           end;
           SeqOracle.free;
      end
      else
      begin
           Sequence := TSequence.Cria(AnsiUpperCase(Nometbl), 'BaseDados');
           try
              {Tenta pegar o maior número de sequencia}
              iProx := Sequence.Proximo;
              if (iProx = -8) then
              begin
                   // Estouro de faixa
                   ExecutarQuery(dtmBaseDados.qry, 'UPDATE FAIXASEQUENCE SET '+
                                              'VLRINISEQ = VLRINISEQRESERVA, '+
                                              'VLRFINSEQ = VLRFINSEQRESERVA, '+
                                              'VLRINISEQRESERVA = 0 '+
                                              'WHERE NOMESEQ = '''+Sequence.Nome+'''');

                   FazQuery(dtmBaseDados.qry, 'SELECT VLRINISEQ, VLRFINSEQ '+
                                         ' FROM FAIXASEQUENCE WHERE NOMESEQ = '''+
                                         Sequence.Nome+'''');

                   // Testa o estoura da segunda faixa
                   if dtmBaseDados.qry.FieldByName('VLRINISEQ').AsInteger > 0 then
                   begin
                        Sequence.Minimo := dtmBaseDados.qry.FieldByName('VLRINISEQ').AsInteger;
                        Sequence.Maximo := dtmBaseDados.qry.FieldByName('VLRFINSEQ').AsInteger;
                        Sequence.Atual  := dtmBaseDados.qry.FieldByName('VLRINISEQ').AsInteger;
                        Result := Sequence.Proximo;
                   end
                   else
                   begin
                        Screen.Cursor := crDefault;
                        Raise Exception.Create('Estouro da segunda faixa de sequences'+#10+#13+'Atualize as faixas através do módulo CENTRALIZA');
                   end;
              end
              else
                  Result := iProx;

           except
              On E:Exception Do
                 Raise Exception.Create('Não foi possível encontrar o sequence: '+Sequence.Nome + (#13+#10) + E.Message);
           end;
           Sequence.free;
      end;
end;

{-----------------------------------------------------------------------------}
function FazQueryEmTab(var qry : TwwTable; str : string) : Boolean;
begin
  with qry do begin
    Try
      Close;
      Query.Clear;
      Query.Add(str);
      Open;
    Except
      Result := False;
      Exit;
    end;
    Result := Not IsEmpty;
 end;
end;

{-----------------------------------------------------------------------------}
procedure IncField(dset: TDataSet; fld: String; incr: Real);
begin
   dset.FieldByName(fld).AsFloat := dset.FieldByName(fld).AsFloat + incr;
end;

{-----------------------------------------------------------------------------}
procedure DecField(dset: TDataSet; fld: String; decr: Real);
begin
   dset.FieldByName(fld).AsFloat := dset.FieldByName(fld).AsFloat - decr;
end;

{-----------------------------------------------------------------------------}
procedure MasterDetail(tbl : TTable ; MSource : TDataSource; MFields : String);
begin
   tbl.Active := False;
   tbl.MasterSource := MSource;
   tbl.MasterFields := MFields;
   tbl.Active := True;
   tbl.Refresh;
end;

{-----------------------------------------------------------------------------}
function CopiarRegistro(tblFonte, tblDestino: TTable): Boolean;
var   i: Integer;
begin
   tblFonte.Cancel;
   tblDestino.Insert;
   for i := 0 to tblFonte.FieldCount-1 do begin
      tblDestino.FieldByName(tblFonte.Fields[i].FieldName).Assign(
                                tblFonte.FieldByName(tblFonte.Fields[i].FieldName));
   end;
   Result := True;
end;

{-----------------------------------------------------------------------------}
function CriarTabela(const DBName, TblName: String): TTable;
begin
  Result := nil;

end;

{-----------------------------------------------------------------------------}
function AbrirTabela(tbl: TTable): Boolean;
begin
   Result := True;
   try
      if Not tbl.Active
      then tbl.Open;
   except
      Result := False;
   end;
end;

procedure StartTransacao;
begin
     dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure CommitTransacao;
begin
     with dtmBaseDados.dbBaseDados do
          if InTransaction then
             Commit;
end;

procedure RollBackTransacao;
begin
     with dtmBaseDados.dbBaseDados do
          if InTransaction then
             RollBack;
end;

procedure AplicaAlteracoes( pDataSet : array of TDBDataSet) ;
begin
     dtmBaseDados.dbBaseDados.AplicaUpdates(pDataSet);
     if Sistema.ConectaRemoto then
        dtmBaseDados.dbBaseRemota.AplicaUpdates(pDataSet);
end;

function LeUltRegistro (Nometbl :string; bExibeMensagem :Boolean = True; sDataBaseName :string = 'BaseDados'; DriverServidor :String = DriverDB2; sSessionName :string = '') : Cardinal; Overload;
var Sequence : TSequence;
    SeqOracle : TSeqOracle;
    iProx : integer;
    QrySeq :TwwQuery;
    sMensagem :String;
begin
   QrySeq := TwwQuery.Create(nil);
   QrySeq.DataBaseName := sDataBaseName;
   QrySeq.SessionName := sSessionName;
                        {** MB20 Padroes.DataBase.SessionName **};                
   sMensagem := '';


   if (UpperCase(Trim(DriverServidor)) =  DriverOracle) then
   begin

        SeqOracle := TSeqOracle.Create('SEQ'+AnsiUpperCase(Nometbl), sDataBaseName, sSessionName);

        try
           {Tenta pegar o maior número de sequencia}

           SeqOracle.Trava;




           iProx := SeqOracle.Proximo;



           if (iProx = -7) then
           Begin
              Screen.Cursor := crDefault;
              Raise Exception.Create('O usuário não possui direito a criação da sequence ' + 'SEQ' + AnsiUpperCase(Nometbl) + ' no banco.');
           End
           Else
           if (iProx = -9) then
              Raise Exception.Create('O Sequence solicitado não existe no banco local e é um sequence com a faixa contolada.'+#10+#13+' Atualize as faixas através do módulo CENTRALIZA')
           Else
           if (iProx = -8) then
           begin
                // Estouro de faixa
                Result := 0;
                ExecutarQuery(QrySeq, 'UPDATE FAIXASEQUENCE SET '+
                                                'VLRINISEQ = VLRINISEQRESERVA, '+
                                                'VLRFINSEQ = VLRFINSEQRESERVA, '+
                                                'VLRINISEQRESERVA = 0 '+
                                                'WHERE NOMESEQ = '''+SeqOracle.Nome+'''');

                FazQuery(QrySeq, 'SELECT VLRINISEQ, VLRFINSEQ '+
                                      ' FROM FAIXASEQUENCE WHERE NOMESEQ = '''+
                                      SeqOracle.Nome+'''');

                // Testa o estoura da segunda faixa
                if QrySeq.FieldByName('VLRINISEQ').AsInteger > 0 then
                begin
                     if SeqOracle.Altera( QrySeq.FieldByName('VLRINISEQ').AsInteger,
                                    QrySeq.FieldByName('VLRFINSEQ').AsInteger,
                                    QrySeq.FieldByName('VLRINISEQ').AsInteger) then
                        Result := SeqOracle.Proximo;

                end
                else
                begin
                  Raise Exception.Create('Estouro da segunda faixa de sequences'+#10+#13+'Atualize as faixas através do módulo CENTRALIZA');
                end;
           end
           else
               Result := iProx;


           SeqOracle.Libera;

           QrySeq.Free;

           SeqOracle.free;
        except
           On E:Exception Do
           Begin
              SeqOracle.Libera;

              sMensagem := E.Message + (#13+#10) + 'Não foi possível encontrar o sequence: '+SeqOracle.Nome;

              QrySeq.Free;
              SeqOracle.free;

              raise Exception.Create(sMensagem)
           End;
        end;
   end
   else
   begin

        Sequence := TSequence.Cria(AnsiUpperCase(Nometbl), sDataBaseName, sSessionName);
        try

           iProx := Sequence.Proximo;                                
           if (iProx = -8) then
           begin
                // Estouro de faixa
                ExecutarQuery(QrySeq, 'UPDATE FAIXASEQUENCE SET '+
                                           'VLRINISEQ = VLRINISEQRESERVA, '+
                                           'VLRFINSEQ = VLRFINSEQRESERVA, '+
                                           'VLRINISEQRESERVA = 0 '+
                                           'WHERE NOMESEQ = '''+Sequence.Nome+'''');

                FazQuery(QrySeq, 'SELECT VLRINISEQ, VLRFINSEQ '+
                                      ' FROM FAIXASEQUENCE WHERE NOMESEQ = '''+
                                      Sequence.Nome+'''');

                // Testa o estoura da segunda faixa
                if QrySeq.FieldByName('VLRINISEQ').AsInteger > 0 then
                begin
                     Sequence.Minimo := QrySeq.FieldByName('VLRINISEQ').AsInteger;
                     Sequence.Maximo := QrySeq.FieldByName('VLRFINSEQ').AsInteger;
                     Sequence.Atual  := QrySeq.FieldByName('VLRINISEQ').AsInteger;
                     Result := Sequence.Proximo;
                end
                else
                  Raise Exception.Create('Estouro da segunda faixa de sequences'+#10+#13+'Atualize as faixas através do módulo CENTRALIZA');
           end
           else
               Result := iProx;

           QrySeq.Free;
           Sequence.free;
        except
           On E:Exception Do
           Begin
              sMensagem := E.Message + (#13+#10) + 'Não foi possível encontrar o sequence: '+Sequence.Nome;

              QrySeq.Free;
              Sequence.free;

              raise Exception.Create(sMensagem)
           End;
        end;
   end;
End;

// Pass TDateTime in Values (array of const)
// typecasted to Variant

function SqlInsert(Values : array of const;
                   TableName : string;
                   ColNames : array of string;
                   NullIfZero : array of boolean;
                   aFloatPrecision :Array of Integer;
                   aSaveDateTimeFormat: Array of Boolean) : string; overload;
var RetVar : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';

     RetVar := '';

     for i := 0 to High(ColNames) do
        If ColNames[i] <> CMFieldBlob Then
        Begin
           If RetVar = '' Then
              RetVar := 'insert into ' + TableName + CrLf +
                 '(' + ColNames[i]
           Else
              RetVar := RetVar + ',' + ColNames[i];
        End;

     RetVar := RetVar + ')' + CrLf;

     RetVar := RetVar + 'values (';

     for i := 0 to High(Values) do begin
        case Values[i].VType of
             vtInteger,
             vtInt64    :
               If NullIfZero[i] And (Values[i].VInteger = 0) Then
                 RetVar := RetVar + 'null'
               Else
                 RetVar := RetVar + IntToStr(Values[i].VInteger);
             vtChar     :
               If NullIfZero[i] And (Values[i].VChar = '') Then
                 RetVar := RetVar + 'null'
               Else
                 RetVar := RetVar + QuotedStr(Values[i].VChar);
             vtString   :
             Begin
               If ColNames[i] <> CMFieldBlob Then
               Begin
                 If NullIfZero[i] And (Values[i].VString^ = '') Then
                   RetVar := RetVar + 'null'
                 Else
                   RetVar := RetVar + QuotedStr(Values[i].VString^);
               End;
             End;
             vtPChar    :
               If NullIfZero[i] And (Values[i].VPChar = '') Then
                 RetVar := RetVar + 'null'
               Else
                 RetVar := RetVar + QuotedStr(Values[i].VPChar);
             vtExtended :
               If NullIfZero[i] And (Values[i].VExtended^ = 0) Then
                 RetVar := RetVar + 'null'
               Else
               begin
                 if aFloatPrecision[i] > -1 then
                    RetVar := RetVar + 'ROUND(' + FloatToStr(Values[i].VExtended^) + ',' + IntToStr(aFloatPrecision[i]) + ')'
                 else
                    RetVar := RetVar + FloatToStr(Values[i].VExtended^);
               end;
             vtAnsiString :
               If NullIfZero[i] And (string(Values[i].VAnsiString) = '') Then
                 RetVar := RetVar + 'null'
               Else
                 RetVar := RetVar +
                            QuotedStr(string(Values[i].VAnsiString));

             vtVariant  :
             Begin
                 If NullIfZero[i] And (TDateTime(Values[i].VVariant^) = 0) Then
                    RetVar := RetVar + 'null'
                 Else
                 begin
                    if aSaveDateTimeFormat[i] then
                      RetVar := RetVar + 'to_date(' +
                                   QuotedStr(FormatdateTime('DD/MM/YYYY HH:NN:SS',
                                   TDateTime(Values[i].VVariant^))) + ',' +
                                   QuotedStr('DD/MM/YYYY HH24:MI:SS') + ')'
                    else
                      RetVar := RetVar + 'to_date(' +
                                   QuotedStr(FormatdateTime('dd/mm/yyyy',
                                   TDateTime(Values[i].VVariant^))) + ',' +
                                   QuotedStr('dd/mm/yyyy') + ')';
                 end;
             end;
        else
          RetVar := RetVar + '??????';
        end;

        If ColNames[i] <> CMFieldBlob Then
           RetVar := RetVar + ',';
     end;

     Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + ')';
     if High(Values) < High(ColNames) then
        ShowMessage('SQL Insert - Foram passados menos valores do que colunas.');
     if High(Values) > High(ColNames) then
        ShowMessage('SQL Insert - Foram passadas mais valores do que colunas.');

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end;

function SqlInsert(Values : array of const;
                   TableName : string;
                   ColNames : array of string) : string;
var RetVar : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';

     RetVar := 'insert into ' + TableName + CrLf +
               '(' + ColNames[0];
     for i := 1 to High(ColNames) do
        RetVar := RetVar + ',' + ColNames[i];
     RetVar := RetVar + ')' + CrLf;

     RetVar := RetVar + 'values (';

     for i := 0 to High(Values) do begin
        case Values[i].VType of
             vtInteger,
             vtInt64    : RetVar := RetVar + IntToStr(Values[i].VInteger);
             vtChar     : RetVar := RetVar + QuotedStr(Values[i].VChar);
             vtString   : RetVar := RetVar + QuotedStr(Values[i].VString^);
             vtPChar    : RetVar := RetVar + QuotedStr(Values[i].VPChar);
             vtExtended : RetVar := RetVar + FloatToStr(Values[i].VExtended^);
             vtAnsiString : RetVar := RetVar +
                            QuotedStr(string(Values[i].VAnsiString));
             // TDateTime - otherwise comes thru as vtExtended
             vtVariant  : RetVar := RetVar + 'to_date(' +
                          QuotedStr(FormatdateTime('dd/mm/yyyy',
                          TDateTime(Values[i].VVariant^))) + ',' +
                          QuotedStr('dd/mm/yyyy') + ')';
        else
          RetVar := RetVar + '??????';
        end;

        RetVar := RetVar + ',';
     end;

     Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + ')';
     if High(Values) < High(ColNames) then
        ShowMessage('SQL Insert - Foram passados menos valores do que colunas.');
     if High(Values) > High(ColNames) then
        ShowMessage('SQL Insert - Foram passadas mais valores do que colunas.');

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end;


function SqlInsert(Values : array of const;
                   TableName : string) : string; overload;
var RetVar : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';
     RetVar := 'insert into ' + TableName + CrLf;
     RetVar := RetVar + 'values (';

     for i := 0 to High(Values) do begin
        case Values[i].VType of
             vtInteger,
             vtInt64    : RetVar := RetVar + IntToStr(Values[i].VInteger);
             vtChar     : RetVar := RetVar + QuotedStr(Values[i].VChar);
             vtString   : RetVar := RetVar + QuotedStr(Values[i].VString^);
             vtPChar    : RetVar := RetVar + QuotedStr(Values[i].VPChar);
             vtExtended : RetVar := RetVar + FloatToStr(Values[i].VExtended^);
             vtAnsiString : RetVar := RetVar +
                            QuotedStr(string(Values[i].VAnsiString));
             // TDateTime - otherwise comes thru as vtExtended
             vtVariant  : RetVar := RetVar + 'to_date(' +
                          QuotedStr(FormatdateTime('dd/mm/yyyy',
                          TDateTime(Values[i].VVariant^))) + ',' +
                          QuotedStr('dd/mm/yyyy') + ')';
        else
          RetVar := RetVar + '??????';
        end;

        RetVar := RetVar + ',';
     end;

     Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + ')';

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end;

function SqlUpdate(Values : array of const;
                   TableName : string;
                   ColNames : array of string;
                   WhereClause : string;
                   NullIfZero : array of boolean;
                   aFloatPrecision :Array of Integer;
                   aSaveDateTimeFormat: Array of Boolean) : string; overload;
var RetVar,Parm : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';

     RetVar := 'update ' + TableName + ' set' + CrLf;

     for i := 0 to Min(High(Values),High(ColNames)) do begin
        case Values[i].VType of
             vtInteger,
             vtInt64    :
               If NullIfZero[i] And (Values[i].VInteger = 0) Then
                 Parm := 'null'
               Else
                 Parm := IntToStr(Values[i].VInteger);
             vtChar     :
               If NullIfZero[i] And (Values[i].VChar = '') Then
                 Parm := 'null'
               Else
                 Parm := QuotedStr(Values[i].VChar);
             vtString   :
             Begin
               If (ColNames[i] <> CMFieldBlob) And
                  (ColNames[i] <> CMInvalidField) Then
               Begin
                 If NullIfZero[i] And (Values[i].VString^ = '') Then
                   Parm := 'null'
                 Else
                   Parm := QuotedStr(Values[i].VString^);
               End;
             End;
             vtPChar    :
               If NullIfZero[i] And (Values[i].VPChar = '') Then
                 Parm := 'null'
               Else
                 Parm := QuotedStr(Values[i].VPChar);
             vtExtended :
               If NullIfZero[i] And (Values[i].VExtended^ = 0) Then
                 Parm := 'null'
               Else
               begin
                 if aFloatPrecision[i] > -1 then
                    Parm := 'ROUND(' + FloatToStr(Values[i].VExtended^) + ',' + IntToStr(aFloatPrecision[i]) + ')'
                 else
                    Parm := FloatToStr(Values[i].VExtended^);
               end;
             vtAnsiString :
               If NullIfZero[i] And (string(Values[i].VAnsiString) = '') Then
                 Parm := 'null'
               Else
                 Parm := QuotedStr(string(Values[i].VAnsiString));
             // TDateTime - otherwise comes thru as vtExtended
             vtVariant  :
             Begin
               If NullIfZero[i] And (TDateTime(Values[i].VVariant^) = 0) Then
                 Parm := 'null'
               Else                                                    
               begin
                 if aSaveDateTimeFormat[i] then
                   Parm := 'to_date(' +
                                QuotedStr(FormatdateTime('DD/MM/YYYY HH:NN:SS',
                                TDateTime(Values[i].VVariant^))) + ',' +
                                QuotedStr('DD/MM/YYYY HH24:MI:SS') + ')'
                 else
                   Parm := 'to_date(' +
                                QuotedStr(FormatdateTime('DD/MM/YYYY',
                                TDateTime(Values[i].VVariant^))) + ',' +
                                QuotedStr('DD/MM/YYYY') + ')';
               end;
             End;
        else
          Parm := '??????';
        end;

        If (ColNames[i] <> CMFieldBlob) And
           (ColNames[i] <> CMInvalidField) Then
           RetVar := RetVar + ColNames[i] + '=' + Parm + ',';
     end;

     Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + CrLf + 'where ' + WhereClause;

     if High(Values) < High(ColNames) then
        ShowMessage('SQL Update - Foram passados menos valores do que colunas.');
     if High(Values) > High(ColNames) then
        ShowMessage('SQL Update - Foram passadas mais valores do que colunas.');

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end;

function SqlUpdate(Values : array of const;
                   TableName : string;
                   ColNames : array of string;
                   WhereClause : string) : string; overload;
var RetVar,Parm : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';

     RetVar := 'update ' + TableName + ' set' + CrLf;

     for i := 0 to Min(High(Values),High(ColNames)) do begin
        case Values[i].VType of
             vtInteger,
             vtInt64    : Parm := IntToStr(Values[i].VInteger);
             vtChar     : Parm := QuotedStr(Values[i].VChar);
             vtString   : Parm := QuotedStr(Values[i].VString^);
             vtPChar    : Parm := QuotedStr(Values[i].VPChar);
             vtExtended : Parm := FloatToStr(Values[i].VExtended^);
             vtAnsiString : Parm := QuotedStr(string(Values[i].VAnsiString));
             // TDateTime - otherwise comes thru as vtExtended
             vtVariant  : Parm := 'to_date(' +
                          QuotedStr(FormatdateTime('dd/mm/yyyy',
                          TDateTime(Values[i].VVariant^))) + ',' +
                          QuotedStr('dd/mm/yyyy') + ')';
        else
          Parm := '??????';
        end;

        RetVar := RetVar + ColNames[i] + '=' + Parm + ',';
     end;

     Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + CrLf + 'where ' + WhereClause;

     if High(Values) < High(ColNames) then
        ShowMessage('SQL Update - Foram passados menos valores do que colunas.');
     if High(Values) > High(ColNames) then
        ShowMessage('SQL Update - Foram passadas mais valores do que colunas.');

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end;

procedure ChangeDataBaseName(Q: array of TDataSet; sDataBaseName :String = 'BaseDados'; sSessionName :string = '');
Var
  iNumDs, X :Integer;
begin
  iNumDs := High(Q);
  For X:=0 To iNumDs Do
     If Q[x] Is TwwQuery Then
        With (Q[x] As TwwQuery) Do
          If (DataBaseName <> sDataBaseName) OR
             (SessionName <> sSessionName) Then
          Begin
             If Active Then Close;
             DataBaseName := sDataBaseName;

             SessionName := sSessionName;

                           {** MB20 Padroes.DataBase.SessionName **};
          End;
end;

function GeraDataBaseName(Owner :TComponent; DataBase: TDataBase;
         SetaNetDir: Boolean = false; DbSession: TSession = nil): String;
Var
  iDir: Integer;
  sAux, sBaseDir, sPrivateDir: String;
Begin
  If DataBase.Connected Then DataBase.Close;



  sAux := IntToStr(Abs(gettickcount) + Random(40));

  If SetaNetDir Then
  Begin
     sBaseDir :=  cmGetTempPath + '\BdeTmp\T';

     iDir := 1;
     repeat
        Inc(iDir);
        sPrivateDir := sBaseDir + sAux + IntToStr(iDir);
     until (not DirectoryExists(sPrivateDir));

     ForceDirectories(sPrivateDir);



     If DbSession = nil Then
     Begin

       Session.PrivateDir := sPrivateDir;
     End
     Else
     Begin

       If DbSession.Active Then DbSession.CLose;
       DbSession.SessionName := 'Ssn' + sAux;
       DbSession.PrivateDir := sPrivateDir;
     End;

     Result := sPrivateDir;
  End
  Else
    Result := '';


  DataBase.DatabaseName := 'Dbn' + sAux;



  If DbSession <> nil Then
  Begin

     If DbSession.Active Then DbSession.Close;
     DbSession.Active := True;
     DataBase.SessionName := DbSession.SessionName;     
  End;

  
End;

procedure MoveRegistros(GrdOrigem, GrdDestino: TwwDbGrid);
Var
  Y: Integer;
Begin
  If (Not GrdOrigem.DataSource.DataSet.IsEmpty) and (GrdOrigem.SelectedList.count > 0) Then
  Begin
    For Y := 0 To GrdOrigem.SelectedList.count - 1 Do
    Begin
       GrdOrigem.DataSource.DataSet.GotoBookmark(GrdOrigem.SelectedList[Y]);

       MoveFields(GrdOrigem.DataSource.DataSet, GrdDestino.DataSource.DataSet, OpInserir, True);
    End;
    GrdOrigem.SelectedList.Clear;
    GrdDestino.DataSource.Dataset.First;
    GrdOrigem.DataSource.Dataset.First;
  End;
End;

Function VerificaLinhaGrid(DataSet: TDataSet; iTagChave, iTagVazio: Integer;
         sTabelaMensagem:String;bPermiteChaveVazia:Boolean):Boolean;
Var X:Integer;
    sChave: String;
    ListaChave: TStrings;
Begin
   ListaChave := TStringList.Create;

   If DataSet.IsEmpty Then
   Begin
      Result := True;
      Exit;
   End;

   Try
      DataSet.First;
      While Not DataSet.Eof Do
      Begin
          sChave := '';
          For X:=0 To DataSet.FieldCount - 1 Do
              If (DataSet.Fields[X].Tag = iTagChave) Or (DataSet.Fields[X].Tag = iTagVazio) Then
              Begin
                 sChave  := sChave + Trim(DataSet.Fields[X].AsString);
                 If (Not bPermiteChaveVazia) And (DataSet.Fields[X].Tag <> iTagVazio) Then
                 Begin
                     If DataSet.Fields[X].IsNull Then
                     Begin
                       Application.MessageBox(PChar('O Campo ' + DataSet.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado'),'Atenção',Mb_IconInformation);
                       Result := False;
                       Exit;
                     End;
                 End;
              End;
          If ListaChave.IndexOf(sChave) <> -1 Then
          Begin
               Application.MessageBox(PChar('O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
          End
          Else
            If sChave = '' Then
            Begin
               Application.MessageBox(Pchar('O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
            End
            Else
               ListaChave.Add(sChave);
          DataSet.Next;
      End;
      DataSet.First;
      Result := True;
   Finally
      ListaChave.Free;
   End;
End;

Procedure FechaQry(DataSets: Array of TDataSet; bFree, bUnPrepare: Boolean);
Var
  NumQry: Integer;
Begin
  For NumQry := 0 To High(DataSets) Do
  Begin
      If DataSets[NumQry].Active Then
      Begin
        If (DataSets[NumQry] Is TQuery) And
           TQuery(DataSets[NumQry]).CachedUpdates And
           TQuery(DataSets[NumQry]).UpdatesPending Then
           TQuery(DataSets[NumQry]).CancelUpdates;

        If (DataSets[NumQry] Is TClientDataSet) And
           (TClientDataSet(DataSets[NumQry]).ChangeCount > 0) Then
           TClientDataSet(DataSets[NumQry]).CancelUpdates;
           
        DataSets[NumQry].Close;
      End;

      If (DataSets[NumQry] Is TQuery) And
         bUnPrepare And
         TQuery(DataSets[NumQry]).Prepared Then
         TQuery(DataSets[NumQry]).UnPrepare;

      If bFree Then
         DataSets[NumQry].Free;
  End;
End;

procedure MoveFields(DsOrigem, DsDestino: TDataSet;
  Operacao: TOperacao; bApagaOrigem: Boolean);
Var
  X: Integer;
begin
  Case Operacao of
    opInserir: DsDestino.Append;
    opAlterar: DsDestino.Edit;
  Else
    Raise Exception.Create('Operação inválida para o "MoveFields".');
  End;

  For X:=0 To DsOrigem.FieldCount -1 Do
  Begin
     If DsDestino.FindField(DsOrigem.Fields[x].FieldName) <> nil Then
        Case DsOrigem.FieldByName(DsOrigem.Fields[x].FieldName).DataType of
        ftBoolean:
            DsDestino.FieldByName(DsOrigem.Fields[x].FieldName).AsBoolean  := DsOrigem.Fields[x].AsBoolean;
        ftSmallint, ftInteger, ftWord, ftBytes:
            DsDestino.FieldByName(DsOrigem.Fields[x].FieldName).AsInteger  := DsOrigem.Fields[x].AsInteger;
        ftFloat, ftCurrency:
            DsDestino.FieldByName(DsOrigem.Fields[x].FieldName).AsFloat  := DsOrigem.Fields[x].AsFloat;
        ftString:
            DsDestino.FieldByName(DsOrigem.Fields[x].FieldName).AsString  := DsOrigem.Fields[x].AsString;
        ftDate, ftTime, ftDateTime:
            DsDestino.FieldByName(DsOrigem.Fields[x].FieldName).AsDateTime  := DsOrigem.Fields[x].AsDateTime;
        Else
           DsDestino.FieldByName(DsOrigem.Fields[x].FieldName).Value  := DsOrigem.Fields[x].Value;
        End;
  End;

  DsDestino.Post;

  If bApagaOrigem Then DsOrigem.Delete;
end;

// Andre Imakawa - SIG 81948 - Inicio
procedure AlterSessionBD(pValue: String);
var
  qryAux : TwwQuery;
begin
  qryAux := TwwQuery.Create(nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Text :=  pValue;

  try
    qryAux.ExecSQL;
  finally
    FreeAndNil(qryAux);
  end;

end;
// Andre Imakawa - SIG 81948 - Fim
end.

