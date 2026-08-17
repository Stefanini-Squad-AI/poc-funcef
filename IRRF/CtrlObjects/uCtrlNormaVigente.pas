{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 28/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre
Unit uCtrlNormaVigente;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, UDbNormaVigente, DB,
   uDataBase, uSistema, DbClient, dialogs, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF};

Type
   TCtrlNormaVigente = Class(TCmControlObject)

   Private
      FDbNormaVigente: TDbNormaVigente;

      FCdsNormaVigente: TClientDataSet;
      FDataInicio: TDateTime;
      FDataFim: TDateTime;
      FIdNorma: Integer;
      FIdTipo: Integer;
      FDescricao: String;
      FDescricaoTipo: String;

      Procedure SetDbNormaVigente(Const Value: TDbNormaVigente);
      Procedure SetCdsNormaVigente(Const Value: TClientDataSet);
      Procedure SetDataFim(Const Value: TDateTime);
      Procedure SetDataInicio(Const Value: TDateTime);
      Procedure SetDescricao(Const Value: String);
      Procedure SetIdNorma(Const Value: Integer);
      Procedure SetIdTipo(Const Value: Integer);
      Procedure SetDescricaoTipo(Const Value: String);
      Procedure CarregaDadosInternos(Const oSql: TClientDataSet);
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
      Function SelecionaNormaVigenteAtual_Dados(Const pNorma: Integer = 0; Const pTipo: Integer = 0): OleVariant;

   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property CdsNormaVigente: TClientDataSet Read FCdsNormaVigente Write SetCdsNormaVigente;
      Property DbNormaVigente: TDbNormaVigente Read FDbNormaVigente Write setDbNormaVigente;

      Property IdNorma: Integer Read FIdNorma Write SetIdNorma;
      Property IdTipo: Integer Read FIdTipo Write SetIdTipo;
      Property Descricao: String Read FDescricao Write SetDescricao;
      Property DataInicio: TDateTime Read FDataInicio Write SetDataInicio;
      Property DataFim: TDateTime Read FDataFim Write SetDataFim;
      Property DescricaoTipo: String Read FDescricaoTipo Write SetDescricaoTipo;

      Function GravarNormaVigente: Boolean;
      Function ProcurarNormaVigente(iIdNorma: Integer): OleVariant; Overload;
      Function ProcurarNormaVigente(sNome: String): OleVariant; Overload;
      Function ListNormaVigente: OleVariant;
      Function SelecionaNormaVigenteAtual(Const pNorma: Integer = 0; Const pTipo: Integer = 0): OleVariant;
      Function SelecionaNormaVigenteFiltro(Const pTipo: integer; Const pNorma: Integer = -1): OleVariant;
      Function SelecionaNormaVigenteData(Const pTipo: integer): OleVariant;
      Function ExcluirNormaVigente(iIdNorma: Integer; Var sMsg: String): Boolean;
      Function IsExcluirNormaVigente(iIdNorma: Integer): Boolean;
   End;

Implementation

{ TCtrlNatuRendimento }

Constructor TCtrlNormaVigente.Create;
Begin
   Inherited;
   FDbNormaVigente := TDbNormaVigente.create(self);
End;

Destructor TCtrlNormaVigente.Destroy;
Begin
   FDbNormaVigente.Free;
   If isAppServer Then
      Begin
         FCdsNormaVigente.free;
      End;
   Inherited;
End;

Procedure TCtrlNormaVigente.DoChangeDataBase;
Begin
   Inherited;
   DbNormaVigente.DataBaseName := DataBaseName;
End;

Procedure TCtrlNormaVigente.SetCdsNormaVigente(Const Value: TClientDataSet);
Begin
   FCdsNormaVigente := Value;
End;

Procedure TCtrlNormaVigente.SetDbNormaVigente(Const Value: TDbNormaVigente);
Begin
   FDbNormaVigente := Value;
End;

Function TCtrlNormaVigente.GravarNormaVigente: Boolean;
Var
   Msg: String;
Begin
   Try
      StartTransaction;
      // Pai
      Result := ApplyCds(FCdsNormaVigente, FDbNormaVigente, [], []);
      Msg := FDbNormaVigente.MessageInfo;
      If Not Result Then
         Raise Exception.Create(Msg);
      Commit;
   Except
      On E: Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
End;

Function TCtrlNormaVigente.ProcurarNormaVigente(iIdNorma: Integer): OleVariant;
Var sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      '  FROM Norma_Vigente ' + #13#10 +
      ' WHERE IDNorma = ' + IntToStr(iIdNorma);
   Result := GetDataPacket(sSql);
End;

Procedure TCtrlNormaVigente.OnCreateAppServer;
Begin
   Inherited;
   FcdsNormaVigente := TClientDataSet.Create(Nil);
End;

Function TCtrlNormaVigente.ListNormaVigente: OleVariant;
Var
   sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      '  FROM Norma_Vigente ' + #13#10 +
      ' ORDER BY IdNorma';
   Result := GetDataPacket(sSql);
End;

Function TctrlNormaVigente.SelecionaNormaVigenteFiltro(Const pTipo: integer;
   Const pNorma: integer = -1): OleVariant;
Var sSql: String;
   oSql: TClientDataSet;
Begin
   If pNorma > -1 Then
      oSql := TCLientDataSet.Create(Nil);
   sSql := 'SELECT distinct nv.IdNorma,' + #13#10 +
      '       nv.idTipo,' + #13#10 +
      '       nv.Descricao,' + #13#10 +
      '       tr.Descricao as DescricaoTipo,' + #13#10 +
      '       nv.datainicio,' + #13#10 +
      '       nv.datafim' + #13#10 +
      'FROM Norma_Vigente nv, Tipo_Relatorio tr' + #13#10 +
      'Where nv.idtipo = tr.idtipo AND (nv.DATAFIM IS NULL or nv.DATAFIM = TO_DATE(''30/12/1899'',''DD/MM/YYYY'')) ' + #13#10;//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908

   If pTipo > 0 Then
      Begin
         sSql := sSql + '  and nv.IdTipo = ' + IntToStr(pTipo) + #13#10;
         If pNorma > -1 Then
            sSql := sSql + '  and nv.IdNorma = ' + IntToStr(pNorma) + #13#10;
      End;
   sSql := sSql + 'ORDER BY nv.datainicio';
   Result := GetDataPacket(sSql);
   If pNorma > -1 Then
      Begin
         oSql.Data := Result;
         CarregaDadosInternos(oSql);
         oSql.Close;
         FreeAndNil(oSql)
      End;
End;

Function TctrlNormaVigente.SelecionaNormaVigenteData(Const pTipo: integer): OleVariant;
Var sSql: String;
Begin
   sSql := 'SELECT distinct nv.IdNorma,' + #13#10 +
      '       nv.datainicio' + #13#10 +
      'FROM Norma_Vigente nv' + #13#10;
   If pTipo > 0 Then
      sSql := sSql + 'Where nv.IdTipo = ' + IntToStr(pTipo) + #13#10;
   sSql := sSql + 'ORDER BY nv.datainicio';
   Result := GetDataPacket(sSql);
End;

Function TCtrlNormaVigente.SelecionaNormaVigenteAtual_Dados(Const pNorma: Integer = 0; Const pTipo: Integer = 0): OleVariant; //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
Var sSql: String;
Begin
   sSql := 'SELECT nv.IdNorma,' + #13#10 +
      '       nv.Descricao,' + #13#10 +
      '       nv.IdTipo,' + #13#10 +
      '       tr.Descricao as DescricaoTipo,' + #13#10 +
      '       nv.datainicio,' + #13#10 +
      '       nv.datafim' + #13#10 +
      'FROM Norma_Vigente nv, Tipo_Relatorio tr' + #13#10 +
      'Where nv.idtipo = tr.idtipo' + #13#10;
      sSql := sSql + '  and (nv.DATAFIM IS NULL or nv.DATAFIM = TO_DATE(''30/12/1899'',''DD/MM/YYYY''))' + #13#10 ;
   If pNorma <> 0 Then
      sSql := sSql + '  and nv.IdNorma = ' + IntToStr(pNorma) + #13#10;
   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
   if (pTipo <> 0) Then
      sSql := sSql + '  and nv.IdTipo = ' + IntToStr(pTipo) + #13#10;
   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
   sSql := sSql + 'ORDER BY IdNorma';
   Result := GetDataPacket(sSql);
End;

Function TCtrlNormaVigente.SelecionaNormaVigenteAtual(Const pNorma: Integer = 0; Const pTipo: Integer = 0): OleVariant;
Var oSql: tClientDataSet;
Begin
   oSql := TClientDataSet.Create(Nil);
   oSql.Data := SelecionaNormaVigenteAtual_Dados(pNorma, pTipo);//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
   CarregaDadosInternos(oSql);
   Result := oSql.Data;
   oSql.Close;
   FreeAndNil(oSql);
End;

Procedure TCtrlNormaVigente.CarregaDadosInternos(Const oSql: TClientDataSet);
Begin
   Self.IdNorma := oSql.FieldByName('IdNorma').AsInteger;
   Self.Descricao := oSql.FieldByName('Descricao').asString;
   Self.IdTipo := oSql.FieldByName('IdTipo').asInteger;
   Self.DescricaoTipo := oSql.FieldByName('DescricaoTipo').asString;
   Self.DataInicio := oSql.FieldByName('DataInicio').asDateTime;
   Self.DataFim := oSql.FieldByName('DataFim').asDateTime;
End;

Function TCtrlNormaVigente.ProcurarNormaVigente(sNome: String): OleVariant;
Var sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      'FROM Norma_Vigente ' + #13#10 +
      'WHERE DESCRICAO = ' + QuotedStr(sNome);
   Result := GetDataPacket(sSql);
End;

Procedure TCtrlNormaVigente.SetDataFim(Const Value: TDateTime);
Begin
   FDataFim := Value;
End;

Procedure TCtrlNormaVigente.SetDataInicio(Const Value: TDateTime);
Begin
   FDataInicio := Value;
End;

Procedure TCtrlNormaVigente.SetDescricao(Const Value: String);
Begin
   FDescricao := Value;
End;

Procedure TCtrlNormaVigente.SetIdNorma(Const Value: Integer);
Begin
   FIdNorma := Value;
End;

Procedure TCtrlNormaVigente.SetIdTipo(Const Value: Integer);
Begin
   FIdTipo := Value;
End;

Procedure TCtrlNormaVigente.SetDescricaoTipo(Const Value: String);
Begin
   FDescricaoTipo := Value;
End;

Function TCtrlNormaVigente.IsExcluirNormaVigente(iIdNorma: Integer): Boolean;
Var sSql: String;
   oCds: TClientDataSet;
Begin
   oCds := TClientDataSet.Create(Nil);
   Try
      sSql := 'Select 1 from linha_relatorio where idnorma = ' + IntToStr(iIdNorma);
      oCds.data := GetDataPacket(sSql);
      Result := oCds.IsEmpty;
      If Result Then
         Begin
            sSql := 'Select 1 from CargoxRubrica where idnorma = ' + IntToStr(iIdNorma);
            oCds.data := GetDataPacket(sSql);
            Result := oCds.IsEmpty;
         End;
      If Result Then
         Begin
            sSql := 'SELECT IDTIPO FROM RELATORIO_DADOS_CADASTRAIS WHERE IDNORMA = ' + IntToStr(iIdNorma);
            //PNOBRE
            // sSql := 'Select 1 from Declaracao_Contribuicoes where idnorma = ' + IntToStr(iIdNorma);
            oCds.data := GetDataPacket(sSql);
            Result := oCds.IsEmpty;
         End;
      If Result Then
         Begin
            sSql := 'Select 1 from Linhas_Dacon where idnorma = ' + IntToStr(iIdNorma);
            oCds.data := GetDataPacket(sSql);
            Result := oCds.IsEmpty;
         End;
      oCds.Close;
   Finally
      FreeAndNil(oCds);
   End;
End;

Function TCtrlNormaVigente.ExcluirNormaVigente(iIdNorma: Integer; Var sMsg: String): Boolean;
Const aTabelas: Array[0..3] Of String = ('LINHAS_DACON', 'LINHA_DIPJ', 'LINHA_RELATORIO', 'RELATORIO_DADOS_CADASTRAIS');
Var sSql        : String;
   oCds         : TClientDataSet;
   aTexto       : String;
   i            : Integer;
   oUltimaNorma : TClientDataSet;
Begin
   oCds := TClientDataSet.Create(Nil);
   oUltimaNorma := TClientDataSet.Create(Nil);

   For i := 0 To 3 Do
      Begin
         oCds.data := GetDataPacket('Select 1 from ' + aTabelas[i] + #13#10 +
            'Where IdNorma = ' + IntToStr(iIdNorma));
         Result := oCds.IsEmpty;
         aTexto := aTabelas[i];
         If Not Result Then
            Break;
      End;
   oCds.Close;
   FreeAndNil(oCds);
   If Result Then
      Begin
         sSql := 'Select idTipo from norma_vigente where IdNorma = ' +IntToStr(iIDNorma);
         oUltimaNorma.data := GetDataPacket(sSql);

         sSql := 'Select max(idNorma) as idNorma from norma_vigente '  +
                 ' where idtipo = ' + oUltimaNorma.FieldByName('idTipo').AsString + ' and datafim is not null';
         oUltimaNorma.data := GetDataPacket(sSql);

         sSql := 'Delete From Norma_Vigente' + #13#10 +
            'Where IdNorma = ' + IntToStr(iIDNorma) + #13#10;
         GetDataPacket(sSql);

         sSql := 'Update norma_Vigente set datafim = null where idNorma = ' + oUltimaNorma.FieldByName('idNorma').AsString;
         GetDataPacket(sSql);
         Result := True;
      End
   Else
      sMsg := 'Primeiro, é necessário excluir a(s) linha(s) lançada(s) para esta Norma e Vigência !';
End;

End.

