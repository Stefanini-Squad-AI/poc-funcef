unit FApagaProdMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, MontaSelect, ComCtrls;

type
  TFrmApagaProdMov = class(TfrmSairAjuda)
    qryTabela: TwwQuery;
    btnExecutar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    GrpOrigem: TGroupBox;
    Label1: TLabel;
    edCodOrigem: TEdit;
    Label2: TLabel;
    edDescOrigem: TEdit;
    Label3: TLabel;
    edUnOrigem: TEdit;
    GrpDestino: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edCodDestino: TEdit;
    edDescDestino: TEdit;
    edUnDestino: TEdit;
    btnSelOrigem: TSpeedButton;
    btnSelDestino: TSpeedButton;
    MontaSelect: TMontaSelect;
    qryTabelaTABLE_NAME: TStringField;
    qryTabelaCOLUMN_NAME: TStringField;
    pgBar: TProgressBar;
    lbProcess: TLabel;
    qryAlmox: TwwQuery;
    qryAux: TwwQuery;
    qryChaveTab: TwwQuery;
    qryChaveTabTABELA: TStringField;
    qryChaveTabCHAVE: TStringField;
    qryChaveTabPOSITION: TFloatField;
    procedure btnSelOrigemClick(Sender: TObject);
    procedure btnSelDestinoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
    Function TrocaArtTabela( sNomeTabela,sCampo,sOrigem,sDestino : String ) : Boolean;
    Procedure Processa;
    Function VerifConversao : Boolean;
    Function AjustaSaldo(sOrigem,sDestino : String ) : Boolean;
    Function AjustaCusto(sOrigem,sDestino : String ) : Boolean;
    Function AjustaImpSaldo(sOrigem,sDestino : String ) : Boolean;
    Function MontaUpdChave(sTabela,sCampo :String) : String;
  public
    { Public declarations }
  end;

var
  FrmApagaProdMov: TFrmApagaProdMov;

implementation

{$R *.DFM}

Uses uDataBase, DBaseDados, uModulo, uMovNew,
     uMensErro,uSistema,DMoviment;

procedure TFrmApagaProdMov.btnSelOrigemClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
     Begin
        edCodOrigem.Text  := MontaSelect.ValoresChave[0];
        edDescOrigem.Text := MontaSelect.ValoresChave[1];
        edUnOrigem.Text   := MontaSelect.ValoresChave[2];
     End;
end;

procedure TFrmApagaProdMov.btnSelDestinoClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
     Begin
        edCodDestino.Text  := MontaSelect.ValoresChave[0];
        edDescDestino.Text := MontaSelect.ValoresChave[1];
        edUnDestino.Text   := MontaSelect.ValoresChave[2];
     End;
end;

Function TFrmApagaProdMov.TrocaArtTabela( sNomeTabela,sCampo,sOrigem,sDestino : String ) : Boolean;
Var
   SQL : String;
begin
    Result := True;
    If (sNomeTabela = 'MOVIMENT') Then
       Begin
          // Soma o saldo inicial do produto a ser excluido para o produto de destino
          If Not AjustaImpSaldo(sOrigem,sDestino) Then
             Result := False;
          // Exclui a implantação de saldo do produto a ser excluido (Moivento tipo 'Z' )
          SQL :=' DELETE FROM '+sNomeTabela+
                ' WHERE  ('+sCampo + ' = '+QuotedStr(sOrigem)+')'+
                '   AND (CODTIPOMOV = ''Z'') ';
          If Not ExecutarQuery(DtmBaseDados.qry,SQL) Then
             Result := False;
       End;
    // Troca o código antigo pelo o novo
    SQL :=' UPDATE '+sNomeTabela+ ' SET '+sCampo + ' = '+QuotedStr(Trim(sDestino));
    SQL := SQL + MontaUpdChave(sNomeTabela,sCampo);
    SQL := SQL + ' WHERE  ('+sCampo + ' = '+QuotedStr(Trim(sOrigem))+')';
    If Not ExecutarQuery(DtmBaseDados.qry,SQL) Then
       Result := False;
end;

procedure TFrmApagaProdMov.Processa;
begin
   Try
      lbProcess.Caption := 'Processando Atualização das Tabelas...  ';
      lbProcess.Visible := True;
      pgBar.Visible     := True;
      pgBar.Min         := 0;
      pgBar.Position    := 0;
      qryTabela.Open;
      If Not qryTabela.IsEmpty Then
         pgBar.Max  := qryTabela.RecordCount;
      Try
         StartTransacao;
         qryTabela.First;
         While Not qryTabela.Eof Do
            Begin
               // Faz o update nas tabelas que tem o campo CODARTIGO
               If Not TrocaArtTabela(qryTabelaTABLE_NAME.AsString,
                                     qryTabelaCOLUMN_NAME.AsString,
                                     edCodOrigem.Text,edCodDestino.Text)
               Then
                  Abort;
               qryTabela.Next;
               pgBar.Position    := pgBar.Position + 1;
               lbProcess.Caption := 'Processando Atualização das Tabelas - '+qryTabelaTABLE_NAME.AsString;
               Application.ProcessMessages;
            End;
         //
         lbProcess.Caption := 'Processando Atualização dos Movimentos...';
         pgBar.Position    := 0;
         If Not qryAlmox.IsEmpty Then
            pgBar.Max  := qryAlmox.RecordCount;
         //
         Application.ProcessMessages;
         qryAlmox.First;
         While not qryAlmox.EOF do
            Begin
               MovNew.AtualizaSaldo( (Modulo.LeDataImplantacao + 1)  ,edCodDestino.Text,qryAlmox.FieldByName('CODALMOXARIFADO').asInteger );
               qryAlmox.Next;
               pgBar.Position    := pgBar.Position + 1;
               Application.ProcessMessages;
            End;
         //Faz o tratamento da incorporação dos custo e valores do produto antigo
           If Not AjustaSaldo(edCodOrigem.Text,edCodDestino.Text) Then
              Abort;
           If Not AjustaCusto(edCodOrigem.Text,edCodDestino.Text) Then
              Abort;
         //
         lbProcess.Caption := 'Processando Custos e Valores...';
         pgBar.Visible := False;
         Application.ProcessMessages;
         //
         MovNew.GeraRetroativo((Modulo.LeDataImplantacao + 1)  ,edCodDestino.Text);
         //
         CommitTransacao;
         MsgDlg('Substituição realizada com sucesso. O artigo '+edDescOrigem.Text+' já pode ser excluido.','Informação',mtInformation,[mbOK],0);
      Except
         RollBackTransacao;
         Raise;
      End;
   Finally
      lbProcess.Visible := False;
      pgBar.Visible     := False;
   End;
end;

procedure TFrmApagaProdMov.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAlmox.Open;
end;

procedure TFrmApagaProdMov.btnExecutarClick(Sender: TObject);
begin
  inherited;
  btnExecutar.Enabled := False;
  If Trim(edUnOrigem.Text) <> Trim(edUnDestino.Text) Then
     Begin
        MsgDlg('Os produto precisam ter a mesma uniadade de custo médio','Erro',mtError,[mbOK],0);
     End
  Else
  If Not VerifConversao Then
     Begin
        MsgDlg('Os produto precisam ter as mesma uniadades de medida','Erro',mtError,[mbOK],0);
     End
  Else
     Processa;
  btnExecutar.Enabled := True;     
end;

function TFrmApagaProdMov.VerifConversao: Boolean;
Var
   SQL : String;
begin
   SQL := ' SELECT CODMEDIDA FROM CONVER WHERE (CODPRODUTO = '+QuotedStr(edCodOrigem.Text)+') '+
          ' MINUS '+
          ' SELECT CODMEDIDA FROM CONVER WHERE (CODPRODUTO = '+QuotedStr(edCodOrigem.Text)+')';
   FazQuery(DtmBasedados.qry,SQL);
   Result  := DtmBasedados.qry.IsEmpty;
end;

function TFrmApagaProdMov.AjustaSaldo(sOrigem,sDestino : String ): Boolean;
begin
   Result := False;
   Try
      qryAux.Close;
      qryAux.Sql.Text := ' SELECT '+
                         '      CODALMOXARIFADO, '+
                         '      SUM(SALDOQTDE) AS SALDO '+
                         '  FROM SALDO  '+
                         '  WHERE (CODARTIGO = '+QuotedStr(Trim(sOrigem))+') OR (CODARTIGO = '+QuotedStr(Trim(sDestino))+') '+
                         '  GROUP BY  CODALMOXARIFADO ';
      qryAux.Open;
      //Delete todos os saldos do item de origem.
      If Not ExecutarQuery(DtmBaseDados.qry,' DELETE FROM SALDO WHERE  (CODARTIGO = '+QuotedStr(sOrigem)+')')
      Then
         Exit;
      // Recria os Saldos do Destino
      qryAux.First;
      While Not qryAux.Eof Do
         Begin
            DtmMoviment.qryUpdSaldo.ParamByName('pSALDOQTDE').AsFloat         := qryAux.FieldByName('SALDO').AsFloat;
            DtmMoviment.qryUpdSaldo.ParamByName('pCODARTIGO').asString        := sDestino;
            DtmMoviment.qryUpdSaldo.ParamByName('pCODALMOX').AsInteger        := qryAux.FieldByName('CODALMOXARIFADO').AsInteger;
            DtmMoviment.qryUpdSaldo.ExecSQL;
            //Verifiva se fez o update
            if DtmMoviment.qryUpdSaldo.RowsAffected <= 0 Then
            begin
               DtmMoviment.qryInsertSaldo.ParamByName('pSALDOQTDE').AsFloat         := qryAux.FieldByName('SALDO').AsFloat;
               DtmMoviment.qryInsertSaldo.ParamByName('pCODARTIGO').asString        := sDestino;
               DtmMoviment.qryInsertSaldo.ParamByName('pCODALMOXARIFADO').AsInteger := qryAux.FieldByName('CODALMOXARIFADO').AsInteger;
               DtmMoviment.qryInsertSaldo.ParamByName('pDATAULTLANC').AsDateTime    := Date;
               DtmMoviment.qryInsertSaldo.ParamByName('pIDPESSOA').AsInteger        := Sistema.IdEmpresa;
               DtmMoviment.qryInsertSaldo.ExecSQL;
            End;
            qryAux.Next;
         End;
         Result := True;
   Except
      Raise;
   End;
end;

function TFrmApagaProdMov.AjustaCusto(sOrigem,sDestino: String): Boolean;
begin
   Result := False;
   Try
      qryAux.Close;
      qryAux.Sql.Text := ' SELECT '+
                         '      CODCUSTEIO, '+
                         '      (SUM(CUSTOMEDIO)/COUNT(*)) AS CUSTOMEDIO, '+
                         '      SUM(SALDOQTDEUC) AS SALDOQTDEUC '+
                         '  FROM CUSTOMED  '+
                         '  WHERE (CODARTIGO = '+QuotedStr(Trim(sOrigem))+') OR (CODARTIGO = '+QuotedStr(Trim(sDestino))+') '+
                         '  GROUP BY CODCUSTEIO ';
      qryAux.Open;
      //Delete todos os custos médios  do item de origem .
      If Not ExecutarQuery(DtmBaseDados.qry,' DELETE FROM CUSTOMED WHERE  (CODARTIGO = '+QuotedStr(sOrigem)+')')
      Then
         Exit;
      // Recria os custos médios  do item de Destino .
      qryAux.First;
      While Not qryAux.Eof Do
         Begin
            DtmMoviment.qryUpdCustoMed.ParamByName('pCUSTOMEDIO').AsFloat   := qryAux.FieldByName('CUSTOMEDIO').AsFloat;
            DtmMoviment.qryUpdCustoMed.ParamByName('pSALDOQTDEUC').AsFloat  := qryAux.FieldByName('SALDOQTDEUC').AsFloat;
            DtmMoviment.qryUpdCustoMed.ParamByName('pCODARTIGO').asString   := sDestino;
            DtmMoviment.qryUpdCustoMed.ParamByName('pCODCUSTEIO').AsInteger := qryAux.FieldByName('CODCUSTEIO').AsInteger;
            DtmMoviment.qryUpdCustoMed.ExecSQL;
            //Verifiva se fez o update
            if DtmMoviment.qryUpdCustoMed.RowsAffected <= 0 Then
            begin
               DtmMoviment.qryInsertCustoMed.ParamByName('pCUSTOMEDIO').AsFloat   := qryAux.FieldByName('CUSTOMEDIO').AsFloat;
               DtmMoviment.qryInsertCustoMed.ParamByName('pSALDOQTDEUC').AsFloat  := qryAux.FieldByName('SALDOQTDEUC').AsFloat;
               DtmMoviment.qryInsertCustoMed.ParamByName('pCODARTIGO').asString   := sDestino;
               DtmMoviment.qryInsertCustoMed.ParamByName('pCODCUSTEIO').AsInteger := qryAux.FieldByName('CODCUSTEIO').AsInteger;
               DtmMoviment.qryInsertCustoMed.ExecSQL;
            End;
            qryAux.Next;
         End;
         Result := True;
   Except
      Raise;
   End;
end;

function TFrmApagaProdMov.AjustaImpSaldo(sOrigem,
  sDestino: String): Boolean;
Var
   SQL  : String;
   cAux : Char;
begin
  // Result := False;
   Try
      qryAux.Close;
      qryAux.Sql.Text := ' SELECT '+
                         '     CODALMOXARIFADO,    '+
                         '     SALDOQTDEMOV,  '+
                         '     CUSTOMEDIOMOV,VALORMOV,QTDEMOV, '+
                         '     CODCENTROCUSTO '+
                         ' FROM MOVIMENT  '+
                         ' WHERE   (CODARTIGO = '+QuotedStr(Trim(sOrigem))+') '+
                         '     AND (CODTIPOMOV = ''Z'')  ';
      qryAux.Open;
      qryAux.First;
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      While Not qryAux.Eof Do
         Begin
            SQL :=' UPDATE MOVIMENT SET SALDOQTDEMOV = SALDOQTDEMOV + '+FormatFloat('#0.00000',qryAux.FieldByName('CODALMOXARIFADO').asFloat)+
                  ' WHERE  (CODARTIGO = '+QuotedStr(Trim(sDestino))+')'+
                  '    AND (CODALMOXARIFADO = '+IntToStr(qryAux.FieldByName('CODALMOXARIFADO').asInteger)+')'+
                  '    AND (CODTIPOMOV = ''Z'')  ';
            ExecutarQuery(DtmBaseDados.qry,SQL); 
            If DtmBaseDados.qry.RowsAffected <= 0 Then
               Begin
                    MovNew.GeraMov('E',
                                   qryAux.FieldByName('QTDEMOV').asFloat * qryAux.FieldByName('VALORMOV').asFloat,
                                   qryAux.FieldByName('QTDEMOV').asFloat,
                                   Modulo.LeUnCusteio(qryAux.FieldByName('CODALMOXARIFADO').asInteger),
                                   qryAux.FieldByName('CODALMOXARIFADO').asInteger,
                                   qryAux.FieldByName('CODARTIGO').AsString,
                                   '',
                                   'Z',
                                   edCodDestino.Text,
                                   DateToStr(Modulo.LeDataImplantacao),
                                   DateToStr(Modulo.LeDataImplantacao),
                                   '',
                                   qryAux.FieldByName('CODCENTROCUSTO').AsString,
                                   Sistema.IdEmpresa,
                                   -1,
                                   -1 );
               End;
            qryAux.Next;
         End;
      DecimalSeparator := cAux;
      Result := True;
   Except
      Raise;
   End;

end;

function TFrmApagaProdMov.MontaUpdChave(sTabela, sCampo: String): String;
Var
   Total : Integer;
   SQL   : String;
begin
   Result := '';
   SQL := ' SELECT CONSTRAINT_NAME AS TOTAL FROM USER_CONSTRAINTS C '+
          ' WHERE (RTRIM(C.TABLE_NAME) = '+QuotedStr(Trim(sTabela))+')'+
          '   AND (C.CONSTRAINT_TYPE = ''P'') ';
   FazQuery(DtmBasedados.qry,SQL);
   Total := DtmBasedados.qry.FieldByName('TOTAL').AsInteger;
   //
   if TOTAL > 1 Then
      Begin
         qryChaveTab.Close;
         qryChaveTab.ParamByName('TABELA').AsString := Trim(sTabela);
         qryChaveTab.Open;
         qryChaveTab.First;
         //
         While Not qryChaveTab.Eof Do
            Begin
               If Trim(qryChaveTabCHAVE.AsString) <> Trim(sCampo) Then
                  Begin
                     Result := ','+qryChaveTabCHAVE.AsString +' = '+qryChaveTabCHAVE.AsString
                  End;

               qryChaveTab.Next;
            End;
      End;
end;

end.
