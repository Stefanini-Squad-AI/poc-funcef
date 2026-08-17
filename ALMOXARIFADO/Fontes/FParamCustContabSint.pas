//inicio andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit FParamCustContabSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, CMProcuraMask,uCMTypes;

type
  TFrmParamCustContabSint = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    gbDatas: TGroupBox;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    rgConta: TRadioGroup;
    chkResumido: TCheckBox;
    cmpConta: TCMProcuraMaskContabil;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
    Function  CriaTabela( Var T : TTable ) : Boolean;
    Function  GravaTabela : Boolean;
    Procedure DelTabela;
    Procedure LeContaContabil( sCodArt,sCodCentroCusto :String; Var sContaEnt,sContaSai : String; Var iUnidNegoc : Integer );        
  end;

var
  FrmParamCustContabSint: TFrmParamCustContabSint;

implementation

{$R *.DFM}

Uses uSistema, dBaseDados, uDataBase, uModulo, FAguarde,uIntegraBack,
     DRptRelats, uMensErro, uFuncaoGeral, uString;

Procedure TFrmParamCustContabSint.FazQry;
Begin
   With DtmRptRelats.qryCustContabSint Do
      Begin
         DataBaseName := Copy(Sistema.TempDir,1,Length(Sistema.TempDir)-1);
         Close;
         Sql.Clear;
         Sql.Add(' SELECT ID,CONTA,DATA,CODCENTROCUSTO,CODARTIGO,VALOR,DESCARTIGO,CONTANOME ');
         Sql.Add(' FROM  ALMOX ');
         if (cmpConta.Conta.Numero <> '') And (cmpConta.Valida = vcOK) Then
            Sql.Add(' WHERE (CONTA = '''+Trim(cmpConta.Conta.Numero)+''' )');
         Sql.Add(' ORDER BY CONTA,DATA,CODARTIGO,CODCENTROCUSTO');
         Open;
      End;
DtmRptRelats.lbPer14.Caption  := 'De '+edDataIni.Text+' a '+edDataFim.Text+' ';
End;

procedure TFrmParamCustContabSint.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If GravaTabela Then
     FazQry
  Else
     Begin
       MsgDlg('Não há dados para o relatório','Informação',mtInformation,[mbOK],0);
       ModalResult := MrCancel;
     End;
end;

procedure TFrmParamCustContabSint.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := (Date-1);
  edDataFim.Date := (Date-1);
  //
  cmpConta.Plano   := Modulo.iPlano;
  cmpConta.Mascara := Modulo.sMascaraPlano;  
end;

Function TFrmParamCustContabSint.CriaTabela( Var T : TTable ) : Boolean;
Begin
  Try
      if DtmRptRelats.qryCustContabSint.Active Then
         DtmRptRelats.qryCustContabSint.Close;
      DelTabela;
      T := TTable.Create( Application );
      T.Active       := False;
      T.DataBaseName := Copy(Sistema.TempDir,1,Length(Sistema.TempDir)-1);
      T.TableType    := ttParadox;
      T.TableName    := 'Almox.Db';
      T.FieldDefs.Clear;
      T.FieldDefs.add('ID'             ,ftInteger ,0  ,True  );
      T.FieldDefs.add('CONTA'          ,ftString  ,18 ,False );
      T.FieldDefs.add('CONTANOME'      ,ftString  ,40 ,False );
      T.FieldDefs.add('DATA'           ,ftDate    ,0  ,False );
      T.FieldDefs.add('CODCENTROCUSTO' ,ftString  ,10 ,False );
      T.FieldDefs.add('CODARTIGO'      ,ftString  ,14 ,False );
      T.FieldDefs.add('DESCARTIGO'     ,ftString  ,30 ,False );
      T.FieldDefs.add('VALOR'          ,ftFloat   ,0  ,False );
      // Adicionando Indice Primário a Tabela
      T.IndexDefs.Clear;
      T.IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
      T.CreateTable;
      Result := True;
  Except
      Raise;
      Result := False;
  End;
End;

Function TFrmParamCustContabSint.GravaTabela : Boolean;
Var
   sSql       : String;
   TB         : TTable;
   sContaEnt  : String;
   sContaSai  : String;
   iUnidNegoc : Integer;
   x          : LongInt;
   sObr       : String;
   sNome      : String;
   sSub       : String;
Begin
   x      := 0;
   Result := True;
   sSql := ' SELECT '+
           '      G.CODGRUPOPROD,  '+
           '      G.DESCGRUPOPROD, '+
           '      C.NOME,          '+
           '      M.CODARTIGO,     ';
  if Not chkResumido.Checked Then
        sSql:= sSql+ ' M.DATAMOV, '
  Else
        sSql:= sSql+ ' TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'') AS  DATAMOV, ';

 sSql:= sSql+ '   M.CODCENTROCUSTO, '+
           '      SUM(round(M.VALORMOV, 2)) AS VALORMOV '+
           ' FROM '+
           '      MOVIMENT M, '+
           '      ALMOX A,    '+
           '      PRODUTO P,  '+
           '      ARTIGO AR, '+
           '      ALMOX T,    '+
           '      GRUPPROD G, '+
           '      CENTCUST C  '+
           ' WHERE '+
           '      (M.CODTIPOMOV <> ''A'') '+
           '  AND (M.CODTIPOMOV <> ''K'') '+
           '  AND (M.CODTIPOMOV <> ''Z'') ';
        If rgConta.ItemIndex = 0 Then
           sSql:= sSql+ '  AND (M.FLGENTRADACUSTO <> ''S'') ';
        sSql:= sSql+
           '  AND (M.DATAMOV BETWEEN TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'') AND TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) '+
           '  AND (M.IDPESSOA = '+IntToStr(sistema.idempresa)+')'+
           '  AND (A.CONTABIL = ''T'') '+
           '  AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO) '+
           '  AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+)) '+
           '  AND ( (M.CODALMOXTRANSF IS NULL) OR                                        '+
           '      ((M.CODALMOXTRANSF IS NOT NULL) AND ( A.CODCUSTEIO <> T.CODCUSTEIO)    '+
           '       AND ((T.CONTABIL <> ''T'') OR (T.CONTABIL IS NULL))))'+
           '  AND (M.CODARTIGO = AR.CODARTIGO) '+
           '  AND (AR.CODPRODUTO = P.CODPRODUTO) '+
           '  AND (P.CODGRUPOPROD = G.CODGRUPOPROD) '+
           '  AND (M.CODCENTROCUSTO = C.CODCENTROCUSTO) '+
           '  AND (M.IDEMPRESA = C.IDEMPRESA) '+
           ' GROUP BY '+
           '      G.CODGRUPOPROD,  '+
           '      G.DESCGRUPOPROD, '+
           '      C.NOME,          '+
           '      M.CODARTIGO,     ';
      if Not chkResumido.Checked Then
           sSql:= sSql+ '      M.DATAMOV,       ';
      sSql:= sSql+ '      M.CODCENTROCUSTO ';
      if Not chkResumido.Checked Then
          sSql:= sSql+ ' ORDER BY M.DATAMOV ';
  // Ajusta o LayOut do Relatorio para o Resumido
  if Not chkResumido.Checked Then
    Begin
        DtmRptRelats.CabecCustContabSint.Visible  := True;
        DtmRptRelats.RodapeCustContabSint.Visible := True;
        DtmRptRelats.LbCentCust3.Visible          := True;
        DtmRptRelats.LbGrupo.Caption              := 'GRUPO';
    End
  Else
    Begin
        DtmRptRelats.CabecCustContabSint.Visible  := False;
        DtmRptRelats.RodapeCustContabSint.Visible := False;
        DtmRptRelats.LbCentCust3.Visible          := False;
        DtmRptRelats.LbGrupo.Caption              := 'CENTRO DE CUSTO';
    End;

  If FazQuery(qryAux ,sSql) Then
    Begin
        FrmAguarde.Min := 0;
        FrmAguarde.Max := qryAux.RecordCount -1;
        FrmAguarde.Pos := x;
        CriaTabela( Tb );
        Tb.Open;
        FrmAguarde.Mostra('Processando Informações');
        qryAux.First;
        While Not qryAux.EOF Do
           Begin
               Inc( x );
               LeContaContabil( qryAux.FieldByName('CODARTIGO').asString,
                                       qryAux.FieldByName('CODCENTROCUSTO').asString,
                                       sContaEnt,sContaSai, iUnidNegoc );
               Tb.Append;
               If RgConta.ItemIndex = 0 Then
                  Begin
                     Tb.FieldByName('CONTA').asString := sContaEnt;
                     FuncaoGeral.TestaContaCC(true,IntegraBack.Plano,sContaEnt,sObr,sNome,sSub);
                     Tb.FieldByName('CONTANOME').asString := sNome;
                  End
               Else
                  Begin
                     Tb.FieldByName('CONTA').asString := sContaSai;
                     FuncaoGeral.TestaContaCC(true,IntegraBack.Plano,sContaSai,sObr,sNome,sSub);
                     Tb.FieldByName('CONTANOME').asString := sNome;
                  End;
               Tb.FieldByName('DATA').asString           := qryAux.FieldByName('DATAMOV').asString;
               if Not chkResumido.Checked Then
                 Begin
                     Tb.FieldByName('CODCENTROCUSTO').asString := qryAux.FieldByName('CODCENTROCUSTO').asString;
                     Tb.FieldByName('CODARTIGO').asString      := qryAux.FieldByName('CODGRUPOPROD').asString;
                     Tb.FieldByName('DESCARTIGO').asString     := qryAux.FieldByName('DESCGRUPOPROD').asString;
                 End
               Else
                 Begin
                     Tb.FieldByName('CODCENTROCUSTO').asString := '';
                     Tb.FieldByName('CODARTIGO').asString      := qryAux.FieldByName('CODCENTROCUSTO').asString;
                     Tb.FieldByName('DESCARTIGO').asString     := qryAux.FieldByName('NOME').asString;
                 End;
               Tb.FieldByName('VALOR').asFloat           := (qryAux.FieldByName('VALORMOV').asFloat*(-1));
               Tb.FieldByName('ID').asInteger            := x;
               Tb.Post;
               FrmAguarde.Pos := x;
               qryAux.Next;
           End;
           FrmAguarde.Apaga;
           Tb.Close;
           Tb.Free;
    End
  Else
    Result := False;

End;

procedure TFrmParamCustContabSint.DelTabela;
Begin
   if FileExists(Sistema.TempDir +'Almox.db') then
      Begin
         DeleteFile(Sistema.TempDir +'Almox.db');
         DeleteFile(Sistema.TempDir +'Almox.px');
         DeleteFile(Sistema.TempDir +'Almox.val');
      End;
End;



procedure TFrmParamCustContabSint.LeContaContabil(sCodArt,
  sCodCentroCusto: String; var sContaEnt, sContaSai: String;
  var iUnidNegoc: Integer);
Var
   sGrupoProd  : String;
Begin
       If FazQuery(dtmBaseDados.qry,' SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                    '(CODARTIGO = '''+Espaco(sCodArt,14)+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')')
       Then
          Begin
              sContaEnt  := dtmBaseDados.qry.FieldByName('CONTAENTRADA').asString;
              sContaSai  := dtmBaseDados.qry.FieldByName('CONTASAIDA').asString;
              iUnidNEgoc := dtmBaseDados.qry.FieldByName('UNIDNEGOC').asInteger;
          End
       Else
          Begin
                 sGrupoProd := Modulo.LeGrupoProd(sCodArt);
                 If FazQuery(dtmBaseDados.qry,'SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                              '(CODGRUPOPROD = '''+Espaco(sGrupoProd,10)+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') '+
                                              ' AND (CODCENTROCUSTO = '''+Espaco(sCodCentroCusto,10)+''')' )
                 Then
                    Begin
                        sContaEnt  := dtmBaseDados.qry.FieldByName('CONTAENTRADA').asString;
                        sContaSai  := dtmBaseDados.qry.FieldByName('CONTASAIDA').asString;
                        iUnidNEgoc := dtmBaseDados.qry.FieldByName('UNIDNEGOC').asInteger;
                    End
                 Else
                 If FazQuery(dtmBaseDados.qry,'SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                              '(CODGRUPOPROD = '''+Espaco(sGrupoProd,10)+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')')
                 Then
                    Begin
                       sContaEnt := dtmBaseDados.qry.FieldByName('CONTAENTRADA').asString;
                       sContaSai := dtmBaseDados.qry.FieldByName('CONTASAIDA').asString;
                       iUnidNEgoc := dtmBaseDados.qry.FieldByName('UNIDNEGOC').asInteger;
                    End
                 Else
                    Begin
                       sContaEnt  := '';
                       sContaSai  := '';
                       iUnidNEgoc := 0;
                    End;
          End;
end;

end.
