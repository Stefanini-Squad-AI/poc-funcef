unit FParamCustContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, ComCtrls, Wwquery, IvDictio, IvMulti, IvEMulti,uCmTypes,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, CMProcuraMask;

type
  TFrmParamCustContab = class(TfrmOkCancelar)
    gbDatas: TGroupBox;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    rgConta: TRadioGroup;
    qryAux: TwwQuery;
    qryCCust: TwwQuery;
    Label3: TLabel;
    dblcCCust: TwwDBLookupCombo;
    cmpConta: TCMProcuraMaskContabil;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
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
  FrmParamCustContab: TFrmParamCustContab;

implementation

{$R *.DFM}
Uses uSistema, dBaseDados, uDataBase, uModulo, FAguarde,uIntegraBack,
     DRptRelats, uMensErro,uFuncaoGeral, uString;

Function TFrmParamCustContab.CriaTabela( Var T : TTable ) : Boolean;
Begin
  Try

      if DtmRptRelats.qryCustContab.Active Then
         DtmRptRelats.qryCustContab.Close;
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
      T.FieldDefs.add('NUMDOCUMENTO'   ,ftString  ,18 ,False );
      T.FieldDefs.add('CODMOV'         ,ftString  ,1  ,False );
      T.FieldDefs.add('DESCMOV'        ,ftString  ,15 ,False );
      T.FieldDefs.add('ALMOXORIGEM'    ,ftInteger ,0  ,False );
      T.FieldDefs.add('ALMOXDESINO'    ,ftInteger ,0  ,False );
      T.FieldDefs.add('VALOR'          ,ftFloat   ,0  ,False );
      T.FieldDefs.add('NOMECC'         ,ftString  ,30 ,False );      
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

Function TFrmParamCustContab.GravaTabela : Boolean;
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
           '      M.IDMOV, '+
           '      M.CODALMOXTRANSF, '+
           '      M.CODALMOXARIFADO, '+
           '      M.CODARTIGO, '+
           '      A.CODCUSTEIO, '+
           '      T.CODCUSTEIO AS CODCUSTRANSF, '+
           '      P.DESCPROD AS DESCARTIGO, '+
           '      M.DATAMOV, '+
           '      ROUND(M.VALORMOV, 2) AS VALORMOV, '+
           '      M.CODCENTROCUSTO, '+
           '      M.CODTIPOMOV, '+
           '      M.NUMDOCUMENTO, '+
           '      TM.DESCRESUMIDA,'+
           '      CC.NOME AS NOMECC '+
           ' FROM '+
           '      MOVIMENT M, '+
           '      ALMOX A,  '+
           '      PRODUTO P,  '+
           '      ARTIGO AR, '+
           '      ALMOX T, '+
           '      TIPOMOV TM, '+
           '      CENTCUST CC'+
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
           '  AND (M.CODTIPOMOV = TM.CODTIPOMOV ) '+
           '  AND (M.CODARTIGO = AR.CODARTIGO) '+
           '  AND (M.CODCENTROCUSTO = CC.CODCENTROCUSTO)'+
           '  AND (M.IDPESSOA = CC.IDEMPRESA)'+           
           '  AND (AR.CODPRODUTO = P.CODPRODUTO) '+
           ' ORDER BY M.DATAMOV ';
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
                     Try
                        FuncaoGeral.TestaContaCC(true,IntegraBack.Plano,sContaEnt,sObr,sNome,sSub);
                     Except
                        On E: Exception Do
                           Begin
                              MsgDlg(E.Message,'Erro',mtError,[mbOK],0);
                              Abort;
                           End;
                     End;
                     Tb.FieldByName('CONTANOME').asString := sNome;

                  End
               Else
                  Begin
                     Tb.FieldByName('CONTA').asString := sContaSai;
                     FuncaoGeral.TestaContaCC(true,IntegraBack.Plano,sContaSai,sObr,sNome,sSub);
                     Tb.FieldByName('CONTANOME').asString := sNome;
                  End;
               Tb.FieldByName('DATA').asString           := qryAux.FieldByName('DATAMOV').asString;
               Tb.FieldByName('CODCENTROCUSTO').asString := qryAux.FieldByName('CODCENTROCUSTO').asString;
               Tb.FieldByName('CODARTIGO').asString      := qryAux.FieldByName('CODARTIGO').asString;
               Tb.FieldByName('DESCARTIGO').asString     := qryAux.FieldByName('DESCARTIGO').asString;
               Tb.FieldByName('NUMDOCUMENTO').asString   := qryAux.FieldByName('NUMDOCUMENTO').asString;
               Tb.FieldByName('DESCMOV').asString        := qryAux.FieldByName('DESCRESUMIDA').asString;
               Tb.FieldByName('CODMOV').asString         := qryAux.FieldByName('CODTIPOMOV').asString;
               Tb.FieldByName('ALMOXORIGEM').asInteger   := qryAux.FieldByName('CODALMOXARIFADO').asInteger;
               Tb.FieldByName('ALMOXDESINO').asInteger   := qryAux.FieldByName('CODALMOXTRANSF').asInteger;
               Tb.FieldByName('VALOR').asFloat           := (qryAux.FieldByName('VALORMOV').asFloat*(-1));
               Tb.FieldByName('NOMECC').asString         := qryAux.FieldByName('NOMECC').asString;
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

procedure TFrmParamCustContab.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := (Date-1);
  edDataFim.Date := (Date-1);
  //
  qryCCust.Close;
  qryCCust.Params[0].Value := Sistema.IdEmpresa;
  qryCCust.Open;
  //
  cmpConta.Plano   := Modulo.iPlano;
  cmpConta.Mascara := Modulo.sMascaraPlano;
end;

procedure TFrmParamCustContab.DelTabela;
Begin
   if FileExists(Sistema.TempDir +'Almox.db') then
      Begin
         DeleteFile(Sistema.TempDir +'Almox.db');
         DeleteFile(Sistema.TempDir +'Almox.px');
         DeleteFile(Sistema.TempDir +'Almox.val');
      End;

End;

Procedure TFrmParamCustContab.FazQry;
Begin
    with DtmRptRelats.qryCustContab Do
      Begin
         DataBaseName := Copy(Sistema.TempDir,1,Length(Sistema.TempDir)-1);
         Close;
         Sql.Text := ' SELECT '+
                     '       ID, '+
                     '       CONTA, '+
                     '       DATA, '+
                     '       CODCENTROCUSTO, '+
                     '       CODARTIGO, '+
                     '       NUMDOCUMENTO, '+
                     '       CODMOV, '+
                     '       DESCMOV, '+
                     '       ALMOXORIGEM, '+
                     '       ALMOXDESINO, '+
                     // 
                     '       ROUND(VALOR, 2) AS VALOR, '+
                     '       DESCARTIGO, '+
                     '       CONTANOME, '+
                     '       NOMECC '+
                     '  FROM '+
                     '      ALMOX '+
                     '  where (1=1)';
          if (cmpConta.Conta.Numero <> '') And (cmpConta.Valida = vcOK) Then
              Sql.Add(' AND (CONTA = '''+Trim(cmpConta.Conta.Numero)+''' )');
          if Trim (dblcCCust.Text) <> '' Then
              Sql.Add(' AND (CODCENTROCUSTO = '''+Trim(dblcCCust.LookupValue)+''' )');

          Sql.Add('  ORDER BY CONTA,DATA ');
         Open;
      End;
    DtmRptRelats.lblPerCust.Caption  := 'De '+edDataIni.Text+' a '+edDataFim.Text+' ';
    if Trim (dblcCCust.Text) <> '' Then
      DtmRptRelats.lbCentCust.Caption  := dblcCCust.Text;
End;

procedure TFrmParamCustContab.bbtnConfirmarClick(Sender: TObject);
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

procedure TFrmParamCustContab.LeContaContabil(sCodArt,
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
End;

end.

