unit uReajustaPercPensao;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//******************************************************************************
//******************************************************************************
//Nº WO.......: 19556
//Data        : 11/03/2025
//Responsavel : Edilaine
//Alteração   : Refatoraçao do processo da previa
//              - usar NIL na crição dos objetos e usar FreeAndNil para liberar
//------------------------------------------------------------------------------


interface

Uses sysutils, wwQuery, UDatabase, usistema, Classes, Forms, uMensErro, Dialogs,
     ComCtrls, uObjFolha, dBaseDados, stdCtrls, uFuncoesFolha, uAdmPrevFB;

procedure ProcessaReajuste(sMesCob : String; MemoResult : TMemo; lblMensagem : TLabel );
procedure AtualizaExecucoes(nParm : Integer; sMesCob : String);
function NumExecs(sMesCob : String): String;

implementation

procedure AtualizaExecucoes(nParm : Integer; sMesCob : String);
var sSql: String;
    qryExecucoes: TwwQuery;
Begin
  qryExecucoes              := TwwQuery.Create(Application);
  qryExecucoes.DatabaseName := 'BaseDados';
  qryExecucoes.Close;
  qryExecucoes.Sql.clear;
  Case nParm Of
    1 : Begin
          sSql := 'SELECT NVL(NUMVEZES,0) AS NUMVEZES '+
                  'FROM ESTATREAJPENSAO '+
                  'WHERE MESCOBRANCA = '+QuotedStr(sMesCob)+' '+
                  'AND IDFUNDACAO = '+inttostr(iidFundacao)+' ';
          qryExecucoes.Sql.Add(sSql);
          qryExecucoes.Open;
        End;
    2 : Begin
          sSql := 'UPDATE ESTATREAJPENSAO '+
                  'SET NUMVEZES = NUMVEZES + 1'+
                  'WHERE MESCOBRANCA = '+QuotedStr(sMesCob)+' '+
                  'AND IDFUNDACAO = '+inttostr(iidFundacao)+' ';
          qryExecucoes.Sql.Add(sSql);
          qryExecucoes.ExecSQL;
        End;
    3 : Begin
          sSql := 'INSERT INTO ESTATREAJPENSAO '+
                  '(IDFUNDACAO, MESCOBRANCA, NUMVEZES) VALUES '+
                  '('+inttostr(iidFundacao)+','+QuotedStr(sMesCob)+','+'''0'''+')';
          qryExecucoes.Sql.Add(sSql);
          qryExecucoes.ExecSQL;
        End;
  End;
  qryExecucoes.Close;
  qryExecucoes.Free;
End;

function NumExecs(sMesCob : String): String;
var qryTmp: TwwQuery;
Begin
  qryTmp              := TwwQuery.Create(Application);
  qryTmp.DatabaseName := 'BaseDados';
  qryTmp.Close;
  qryTmp.Sql.Add(' SELECT NVL(NUMVEZES,0) AS NUMVEZES '+
                 ' FROM ESTATREAJPENSAO '+
                 ' WHERE MESCOBRANCA = '+QuotedStr(sMesCob)+' '+
                  'AND IDFUNDACAO = '+inttostr(iidFundacao));
  qryTmp.Open;
  If qryTmp.isempty Then
    Result := '0'
  Else
    Result := qryTmp.FieldByName('NUMVEZES').AsString;
  qryTmp.Close;
  qryTmp.Free;
end;

procedure ProcessaReajuste(sMesCob : String; MemoResult : TMemo; lblMensagem : TLabel );
Var
  lstAlterados : TStringList;
  qryAux,
  qryPrinc,
  qryAlimentados,
  qrySomaPerc,
  qryAlteraPerc,
  qryAltera        : TwwQuery;
  iIdFavorecido, K : Integer;
  bAlterou         : Boolean;

  procedure VerificaSeAlguemSaiu;
  Var
    dIdade          : TDateTime;
    iIdade          : Integer;
    sNomeAlimentado : String;
  Begin
    dIdade          := qryAlimentados.FieldByName('DATANASC').AsDateTime;
    iIdade          := CalcIdade(dIdade);
    sNomeAlimentado := qryAlimentados.fieldbyname('NOMEALIMENTADO').asstring;
    If dIdade = 0 Then
    Begin
      MemoResult.Lines.Add(' O alimentado '+sNomeAlimentado+' não tem data de nascimento cadastrado.');
      Exit;
    End;
    If ((iIdade = qryAlimentados.FieldByName('IDADESAIDA').AsInteger) And
       (Int(qryAlimentados.FieldByName('PERCENTUAL').AsFloat) > 0)) Then
    Begin
      bAlterou := True;
      Try
        qryAltera.close;
        qryAltera.ParamByName('PPERCENTUAL').AsFloat     := 0;
        qryAltera.ParamByName('IIDFAVORECIDO').AsInteger := qryAlimentados.FieldByName('IDFAVORECIDO').AsInteger;
        qryAltera.ParamByName('IIDALIMENTADO').AsInteger := qryAlimentados.FieldByName('IDALIMENTADO').AsInteger;
        qryAltera.ExecSQL;
        MemoResult.Lines.Add(' O alimentado '+sNomeAlimentado+
          ' perdeu o direito a pensão alimentícia por ter completado '+
          IntToStr(iIdade)+' anos');
        MemoResult.Lines.Add('');
        lstAlterados.Add(
        IntToStr(qryPrinc.FieldByName('IDTITULAR').AsInteger)+';'+
        IntToStr(qryPrinc.FieldByName('IDPESSOA').AsInteger)+';'+
        IntToStr(qryAlimentados.FieldByName('IDFAVORECIDO').AsInteger)+';'+
        IntToStr(qryPrinc.FieldByName('IDRUBRICA').AsInteger)+';'+
        IntToStr(qryPrinc.FieldByName('SEQRUBRICAINDIV').AsInteger)+';'+
        qryPrinc.FieldByName('MATRICULATITULAR').AsString+';'+
        qryPrinc.FieldByName('NOMETITULAR').AsString+';'+
        FloatToStr(qryPrinc.FieldByName('VALORRUBRICA').AsFloat));
      Except
      End;
    End;
  End; {Fim da procedure VerificaSeAlguemSaiu}
Begin
  //edilaine WO19556 : inicio
  try
    qryAux                      := TwwQuery.Create(nil);
    qryPrinc                    := TwwQuery.Create(nil);
    qryAlimentados              := TwwQuery.Create(nil);
    qrySomaPerc                 := TwwQuery.Create(nil);
    qryAlteraPerc               := TwwQuery.Create(nil);
    qryAltera                   := TwwQuery.Create(nil);
    //edilaine WO19556 : fim
    qryAux.DatabaseName         := 'BaseDados';
    qryPrinc.DatabaseName       := 'BaseDados';
    qryAlimentados.DatabaseName := 'BaseDados';
    qrySomaPerc.DataBaseName    := 'BaseDados';
    qryAlteraPerc.DatabaseName  := 'BaseDados';
    qryAltera.DatabaseName      := 'BaseDados';
    lstAlterados                := TStringList.Create;
    lstAlterados.Sorted         := True;
    lstAlterados.Duplicates     := dupIgnore;
    lstAlterados.Clear;
    lblMensagem.Update;
    MemoResult.Lines.Add('==================================================');
    MemoResult.Lines.Add('Atualização de Pensão Alimentícia para Benefíciários ');
    MemoResult.Lines.Add('==================================================');
    MemoResult.Lines.Add('');
    lblMensagem.Caption := 'Verificando informações a processar ...';
    lblMensagem.Update;
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('SELECT VALORRUBRICA '+
                   'FROM RUBRICAINDIV '+
                   'WHERE IDFAVORECIDO = :PIDFAVOREC '+
                   'AND IDEMPRESA = '+inttostr(iidFundacao)+' '+
                   'AND FLGPENSAOALIM = 1');

    qryPrinc.Close;
    qryPrinc.Sql.Clear;
    qryPrinc.Sql.Add(
    ' SELECT DISTINCT '+
            ' RI.IDTITULAR, '+
            ' P1.NOME AS NOMETITULAR, '+
     ' EL.MATRICULA AS MATRICULATITULAR, '+
            ' RI.IDPESSOA, '+
     ' P2.NOME AS NOMEPAGADOR, '+
            ' RI.IDFAVORECIDO, '+
     ' P3.NOME AS NOMERECEBEDOR, '+
     ' RI.VALORRUBRICA, '+
     ' RI.IDRUBRICA, '+
     ' RI.SEQRUBRICAINDIV '+
    ' FROM '+
      ' RUBRICAINDIV RI, '+
      ' PESSOA P1, '+
      ' PESSOA P2, '+
      ' PESSOA P3, '+
      ' ELEGPATRO EL '+
    ' WHERE '+
      ' RI.FLGPENSAOALIM = 1 AND '+
      ' RI.FLGTPRUBMANUT = ''1'' AND '+
      ' RI.IDFAVORECIDO IS NOT NULL AND '+
      ' ((RI.FLGPERMANENTE = 1) OR ((RI.FLGPERMANENTE = 0) AND '+
      '((TO_CHAR(RI.DATAFINAL,''YYYY/MM'') >= '+QuotedStr(sMesCob)+' ) OR (RI.DATAFINAL IS NULL)) '+
      ' AND ((TO_CHAR(RI.DATAINICIO,''YYYY/MM'') <= '+QuotedStr(sMesCob)+') OR (RI.DATAINICIO IS NULL)) '+
      ' AND (RI.NUMOCORRENCIAS < RI.PARCELAS))) AND '+
      ' (RI.FLGDESATIVADO IS NULL OR RI.FLGDESATIVADO = 0) AND '+
      '(RI.ULTMESPREPARO IS NULL OR RI.ULTMESPREPARO < '+QuotedStr(sMesCob)+') AND '+
      ' (RI.ULTMESPREPARO IS NULL OR RI.ULTMESPREPARO < '+QuotedStr(sMesCob)+') AND '+
      ' P1.IDPESSOA = RI.IDTITULAR AND '+
      ' P2.IDPESSOA = RI.IDPESSOA  AND '+
      ' P3.IDPESSOA = RI.IDFAVORECIDO AND '+
      ' EL.IDPESSOA = RI.IDTITULAR '+
      'AND RI.IDEMPRESA = '+inttostr(iidFundacao)+' '+
    ' ORDER BY RI.IDTITULAR,RI.IDPESSOA,RI.IDFAVORECIDO ');
    qryPrinc.Open;

    qryAlimentados.Close;
    qryAlimentados.Sql.Clear;
    qryAlimentados.Sql.Add(
    ' SELECT DISTINCT '+
      ' FA.IDFAVORECIDO, '+
      ' FA.IDALIMENTADO, '+
      ' P4.NOME AS NOMEALIMENTADO, '+
      ' DT.IDDEPENDENCIA, '+
      ' FA.PERCENTUAL, '+
      ' FA.FLGREDISTRIBUICAO, '+
      ' NVL(FA.IDADESAIDA,0) AS IDADESAIDA, '+
      ' PF.DATANASC, '+
      ' DT.IDTITULAR, '+
      ' DT.IDPESSOA '+
    ' FROM '+
      ' FAVORECXALIMENTADOS FA, '+
      ' PESSOA P4, '+
      ' DEPENTIT DT, '+
      ' PESSOAFISICA PF '+
    ' WHERE '+
      ' FA.IDFAVORECIDO = :IIDFAVORECIDO AND '+
      ' P4.IDPESSOA = FA.IDALIMENTADO  AND '+
      ' DT.IDPESSOA = FA.IDALIMENTADO AND '+
      ' PF.IDPESSOA = DT.IDPESSOA ');

    qrySomaPerc.Close;
    qrySomaPerc.Sql.Clear;
    qrySomaPerc.Sql.Add(
    ' SELECT SUM(PERCENTUAL) AS PERCTOTAL FROM	FAVORECXALIMENTADOS '+
    ' WHERE	IDFAVORECIDO = :IIDFAVORECIDO ');

    qryAlteraPerc.Close;
    qryAlteraPerc.Sql.Clear;
    qryAlteraPerc.Sql.Add(
    ' UPDATE RUBRICAINDIV '+
    ' SET VALORRUBRICA = :VVALOR '+
    ' WHERE '+
      ' IDTITULAR = :IIDTITULAR AND '+
      ' IDPESSOA  = :IIDPESSOA  AND '+
      ' IDFAVORECIDO = :IIDFAVORECIDO AND '+
      ' IDRUBRICA = :IIDRUBRICA AND '+
      ' SEQRUBRICAINDIV = :SSEQRUBRICAINDIV '+
      ' AND IDEMPRESA = '+inttostr(iidFundacao));

    qryAltera.Close;
    qryAltera.Sql.Clear;
    qryAltera.Sql.Add(
    ' UPDATE FAVORECXALIMENTADOS '+
    ' SET  PERCENTUAL = :PPERCENTUAL '+
    ' WHERE '+
      ' IDFAVORECIDO = :IIDFAVORECIDO AND '+
      ' IDALIMENTADO = :IIDALIMENTADO ');

    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    {Verifica se houve alimentado que perdeu o direito ao seu percentual de pensão}
    lblMensagem.Caption := 'Verificando a idade dos alimentados ...';
    lblMensagem.Update;
    qryPrinc.first;
    MemoResult.Lines.Add('==================================================');
    MemoResult.Lines.Add(' Verificação da Idade dos Alimentados ');
    MemoResult.Lines.Add('==================================================');
    MemoResult.Lines.Add('');
    While Not qryPrinc.Eof Do
    Begin
      MemoResult.Lines.Add(' Alimentante : '+qryPrinc.FieldByName('NOMEPAGADOR').AsString+
                           ' Matricula : '+qryPrinc.FieldByName('MATRICULATITULAR').AsString);
      MemoResult.Lines.Add(' Favorecido  : '+qryPrinc.FieldByName('NOMERECEBEDOR').AsString);
      iIdFavorecido := qryPrinc.FieldByName('IDFAVORECIDO').AsInteger;
      bAlterou      := False;
      qryAlimentados.Close;
      qryAlimentados.parambyname('IIDFAVORECIDO').asInteger := iIdFavorecido;
      qryAlimentados.open;

      While Not qryAlimentados.Eof Do
      Begin
        {Só verifica se o alimentado não é vitalício (idadesaida=0 -> alimentado vitalicio)}
        If ((qryAlimentados.FieldByName('IDADESAIDA').AsInteger > 0) And
           (Trim(qryAlimentados.FieldByName('IDDEPENDENCIA').AsString) <> 'COP')) Then
          VerificaSeAlguemsaiu;
        qryAlimentados.Next;
      end;
      If Not bAlterou Then
      Begin
        MemoResult.Lines.Add(' Não houveram alterações.');
        MemoResult.Lines.Add('');
      End;
      qryPrinc.Next;
    End;
    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;

    {Verifíca se houve alimentado que perdeu o direito ao seu percentual de pensão}
    MemoResult.Lines.Add('==================================================');
    MemoResult.Lines.Add(' Alteração dos percentuais das Pensões Alimentícias ');
    MemoResult.Lines.Add('==================================================');
    MemoResult.Lines.Add('');
    // GRAVA RUBRICAINDIV APENAS PARA OS ALTERADOS
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    If (lstAlterados.Count =  0) then
      MemoResult.Lines.Add('Não houveram alterações.')
    Else
    Begin
      For K := 0 To lstAlterados.Count-1 Do
      Begin
        qrySomaPerc.Close;
        qrySomaPerc.ParamByName('IIDFAVORECIDO').AsInteger := StrToInt(Piece(lstAlterados[K],';',3));
        qrySomaPerc.open;
        If Not qrySomaPerc.Eof Then
        Begin
          qryAlteraPerc.Close;
          qryAlteraPerc.ParamByName('VVALOR').AsFloat             := qrySomaPerc.FieldByName('PERCTOTAL').AsFloat;
          qryAlteraPerc.ParamByName('IIDTITULAR').AsInteger       := StrToInt(Piece(lstAlterados[K],';',1));
          qryAlteraPerc.ParamByName('IIDPESSOA').AsInteger        := StrToInt(Piece(lstAlterados[K],';',2));
          qryAlteraPerc.ParamByName('IIDFAVORECIDO').AsInteger    := StrToInt(Piece(lstAlterados[K],';',3));
          qryAlteraPerc.ParamByName('IIDRUBRICA').AsInteger       := StrToInt(Piece(lstAlterados[K],';',4));
          qryAlteraPerc.ParamByName('SSEQRUBRICAINDIV').AsInteger := StrToInt(Piece(lstAlterados[K],';',5));
          qryAlteraPerc.ExecSQL;
        End;
        MemoResult.Lines.Add(' Alimentante : '+Piece(lstAlterados[K],';',7)+
                             ' Matricula : '+Piece(lstAlterados[K],';',6)+
                             ' Passou de '+Piece(lstAlterados[K],';',8)+
                             '% para '+FloatToStr(qrySomaPerc.FieldByName('PERCTOTAL').AsFloat)+'%');
      End;
      AtualizaExecucoes(2, sMesCob);
    End;
    qryPrinc.First;
    MemoResult.Lines.Add('============================================');
    MemoResult.Lines.Add(' Verificando os percentuais dos favorecidos ');
    MemoResult.Lines.Add('============================================');
    MemoResult.Lines.Add(' ');
    While Not qryPrinc.Eof Do
    Begin
      qrySomaPerc.Close;
      qrySomaPerc.ParamByName('IIDFAVORECIDO').AsInteger := qryPrinc.FieldByName('IDFAVORECIDO').AsInteger;
      qrySomaPerc.Open;
      qryAux.Close;
      qryAux.ParamByName('PIDFAVOREC').AsInteger         := qryPrinc.FieldByName('IDFAVORECIDO').AsInteger;
      qryAux.Open;
      If qrySomaPerc.FieldByName('PERCTOTAL').AsInteger <>
         qryAux.FieldByName('VALORRUBRICA').AsInteger Then
      Begin
        MemoResult.Lines.Add(
          'A soma do percentual está diferente do percentual '+
          'cadastrado no Cadastro de Rubricas Individuais para o favorecido '+
          qryPrinc.FieldByName('NOMERECEBEDOR').AsString);
        MemoResult.Lines.Add(' ');
      End;
      qryPrinc.Next;
    End;

    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;
    AtualizaExecucoes(2, sMesCob);
    AtualizaExecucoes(1, sMesCob);
  finally
    lstAlterados.Clear;
    qryPrinc.Close;
    qryAux.Close;
    qryAlimentados.Close;
    qrySomaPerc.Close;
    qryAlteraPerc.Close;
    qryAltera.Close;

    FreeAndNil(lstAlterados);
    FreeAndNil(qryAux);
    FreeAndNil(qryPrinc);
    FreeAndNil(qryAlimentados);
    FreeAndNil(qrySomaPerc);
    FreeAndNil(qryAlteraPerc);
    FreeAndNil(qryAltera);
  end;
End;

end.
{------------------------------------------------------------------------------|
| UNIT: UREAJUSTAPERCPENSAO                                                    |
| DESCRIÇÃO FUNCIONAL:                                                         |
| - ROTINAS PARA FAZER O REAJUSTE DE PERCENTUAIS DE PENSÃO ALIMENTÍCIA.        |
| - USADAS NA TELA DE REAJUSTE E NA PRÉVIA NORMAL.                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2003 A 18/07/2003                         |
| PENDÊNCIA: 14600                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDACAO.                                              |
|                                                                              |
|------------------------------------------------------------------------------}

