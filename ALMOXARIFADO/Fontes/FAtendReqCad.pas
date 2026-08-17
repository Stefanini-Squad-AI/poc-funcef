unit FAtendReqCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, TEdNum, wwdblook, Db, DBTables, Wwquery,
  Wwdatsrc, Mask, wwdbedit, TREdit, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmAtendReqCad = class(TfrmSairAjuda)
    GrpGrid: TGroupBox;
    BtAtender: TBitBtn;
    btSelecionar: TBitBtn;
    pnlDet: TPanel;
    GrdReq: TwwDBGrid;
    Label1: TLabel;
    GrpData: TGroupBox;
    edDataReq: TCMDateTimePicker;
    EdDataNec: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryCCust: TwwQuery;
    dblcCCust: TwwDBLookupCombo;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    qryGrid: TwwQuery;
    GrpSubGrid: TGroupBox;
    grdReqOut: TwwDBGrid;
    dsGrid: TwwDataSource;
    EdNumReq: TEditNum;
    BtOk: TBitBtn;
    btCancela: TBitBtn;
    BtLimpa: TBitBtn;
    edCadArt: TwwDBEdit;
    EdDescArt: TwwDBEdit;
    EdReqArt: TwwDBEdit;
    GrpSaldo: TGroupBox;
    Label5: TLabel;
    Label10: TLabel;
    GrpQtde: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    EdQtdeSolic: TDBRealEdit;
    EdQtdeAtend: TRealEdit;
    qrySubGrid: TwwQuery;
    dsSubGrid: TwwDataSource;
    qryAux: TwwQuery;
    EdSalComp: TRealEdit;
    qryAlmox: TwwQuery;
    qrySaldo: TwwQuery;
    edLocalizacao: TEdit;
    reSaldo: TRealEdit;
    gbSolicitante: TGroupBox;
    lblDpto: TLabel;
    lblNome: TLabel;
    qrySolic: TwwQuery;
    edDepto: TEdit;
    edNome: TEdit;
    GroupBox1: TGroupBox;
    edDataAtend: TCMDateTimePicker;
    qryGridCODARTIGO: TStringField;
    qryGridCODMEDCUSTO: TStringField;
    qryGridCODMEDIDA: TStringField;
    qryGridDESCRICAO: TStringField;
    qryGridNUMREQUISICAO: TFloatField;
    qryGridQTDEPEDIDA: TFloatField;
    qryGridQTDEPENDENTE: TFloatField;
    qryGridVALORUN: TFloatField;
    qryGridCODCENTROCUSTO: TStringField;
    qryGridCUSTOTRANSF: TStringField;
    qryGridCODALMOXADESTINO: TFloatField;
    qryGridIDUSUARIOINCLUSAO: TFloatField;
    BtnEstornar: TBitBtn;
    qryGridNOME: TStringField;
    qryGridUNIDNEGOC: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure BtAtenderClick(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure BtLimpaClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure EdQtdeAtendExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataAtendExit(Sender: TObject);
    procedure BtnEstornarClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelSubGrid( S : String; N : LongInt );
    Function  VerifEntrega( N : longInt ) : Boolean;
    Procedure SelTipoMov;
    Function  GerarMovimento : Boolean;
    Procedure Atender;
    Procedure Estornar;
  public
    { Public declarations }
  end;

var
  FrmAtendReqCad : TFrmAtendReqCad;
  TipoMovEnt     : Char;
  TipoMovSai     : Char;
  sAlmoxOrigem   : String[01];
  sAlmoxDestino  : String[01];
  sCCusto        : String;
  iCodCusteio    : Integer;
implementation

{$R *.DFM}
 Uses uSistema,uMensErro, uModulo, uDataBase,uMovNew,UConversaoMed, DBaseDados;
procedure TFrmAtendReqCad.FormCreate(Sender: TObject);
begin
  inherited;
  EdDataAtend.Date := Date; 
  qrySubGrid.Prepare;
  qryCCust.Close;
  qryCCust.Sql.text := ' SELECT CODCENTROCUSTO,NOME FROM CENTCUST ' +
                       ' WHERE (IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa )+')'+
                       ' ORDER BY NOME ';
  qryCCust.Open;
  //
  GrdReq.BringToFront;
  //
  qryAlmox.Close;
  qryAlmox.Sql.Text := ' SELECT CODALMOXARIFADO, PRINCIPSECUND FROM ALMOX ' +
                       ' WHERE  (CODALMOXARIFADO = ' + IntToStr( Modulo.icodAlmoxa )+')';
  qryAlmox.Open;
  sAlmoxOrigem := qryAlmox.FieldbyName('PRINCIPSECUND').AsString;
  //
  qryAlmox.Close;
  qryAlmox.Sql.Text := ' SELECT A.CODALMOXARIFADO, A.DESCALMOX,A.PRINCIPSECUND, A.CODCENTROCUSTO, A.CODCUSTEIO FROM ALMOX A,TRANSFALMOX T'+
                       ' WHERE (A.CODALMOXARIFADO <> ' + IntToStr(Modulo.icodAlmoxa ) + ') AND (A.IDPESSOA =  ' +IntToStr(Sistema.IdEmpresa)+')'+
                       ' AND (T.CODALMOXARIFADO = '+ IntToStr(Modulo.icodAlmoxa )+') AND (A.CODALMOXARIFADO = T.CODALMOXPERMITE)'+
                       ' ORDER BY A.DESCALMOX ';
  qryAlmox.Open;

end;
procedure TFrmAtendReqCad.SelSubGrid( S : String; N : LongInt );
var rSaldoComp:Real;
    sSql:String;
Begin
   sSql:='Select IP.CODMEDIDA,IP.CodArtigo, IP.QTDEPEDIDA,IP.NUMREQUISICAO,IP.QTDEPENDENTE '+
         ' From ITEMPEDI IP, REQMAT R Where  (IP.CodArtigo  = '''+Trim(S)+''')'+
         ' and  (R.CODALMOXAORIGEM = '+IntToStr(Modulo.icodAlmoxa)+')'+
         ' and  (IP.NumRequisicao <> '+IntToStr(N)+')'+
         ' and  (IP.QtdePendente <> 0) '+
         ' and  (IP.NUMREQUISICAO = R.NUMREQUISICAO)';
  FazQuery(qrySubGrid,sSql);
  rSaldocomp:=0;
  qrySubGrid.First;
  While not qrySubGrid.EOF do
  Begin
     rSaldoComp:=rSaldoComp+(ConversaoMed.ConverteSaldoQtde(S,qrySubGrid.FieldByName('CODMEDIDA').AsString,
                             qryGrid.FieldByName('CODMEDIDA').AsString,
                             qrySubGrid.FieldByName('QTDEPENDENTE').AsFloat));
     qrySubGrid.Next;
  End;
  EdSalComp.Value:=rSaldoComp;
End;
procedure TFrmAtendReqCad.btSelecionarClick(Sender: TObject);
begin
  inherited;
  With qryGrid Do
    Begin
         Close;
         Sql.Text :=  ' Select ' +
                      '       A.CodArtigo,    ' +
                      '       (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO, ' +
                      '       IP.NumRequisicao,' +
                      '       P.CodMedCusto,   ' +
                      '       IP.QTDEPEDIDA,   ' +
                      '       IP.QTDEPENDENTE, ' +
                      '       IP.VALORUN,      ' +
                      '       IP.CodMedida,    ' +
                      '       R.IDUSUARIOINCLUSAO, '+
                      '       R.CODCENTROCUSTO,' +
                      '       R.CustoTransf,    ' +
                      '       R.CodAlmoxaDestino, '+
                      '       R.UNIDNEGOC, '+
                      '       CC.NOME            '+
                      '  From                    '+
                      '       Artigo A,        ' +
                      '       Produto P,       ' +
                      '       ITEMPEDI IP,     ' +
                      '       REQMAT R,        ' +
                      '       RADINSTPROCESSO RP, '+
                      '       CENTCUST CC         '+
                      '  Where                    ' +
                      '       (IP.QtdePendente > 0)  '+
                      '       and (R.CodAlmoxaOrigem = '+ IntToStr( Modulo.icodAlmoxa )+')' +
                      '       and (R.idPessoa = '+IntToStr(Sistema.IdEmpresa)+') ';
          If Sistema.UsaRAD then
              Sql.Add('  And ((RP.FLGOK = ''S'') OR (R.IDPROCESSO IS NULL)) ');
          If Trim(edNumReq.Text) <> '' Then
              Sql.Add('  And (IP.NumRequisicao = '+EdNumReq.Text+')');
          If Trim(dblcCCust.Text) <> '' Then
              Sql.Add('  And (RTRIM(R.CodCentroCusto) ='''+Trim(dblcCCust.LookUpValue)+''')');
          If Trim(edDataReq.Text) <> '' Then
              Sql.Add('  And (R.DataEmissao = To_Date('''+DateToStr(edDataReq.Date)+''',''dd/mm/yyyy''))' );
          If Trim(edDataNec.Text) <> '' Then
              Sql.Add('  AND (R.DataNecessidade = To_Date('''+DateToStr(edDataNec.Date)+''',''dd/mm/yyyy''))');
          Sql.Add('      AND (A.CODPRODUTO = p.CODPRODUTO)        ' +
                  '      AND (A.CODARTIGO  = IP.CODARTIGO)        ' +
                  '      AND (R.IDPROCESSO = RP.IDPROCESSO(+))    ' +
                  '      AND (IP.NUMREQUISICAO = R.NUMREQUISICAO) ' +
                  '      AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO) '+
                  '      AND (R.IDEMPRESA = CC.IDEMPRESA) '
                  );
          Sql.Add('  ORDER BY DESCRICAO ');
      Open;
   End;
end;

procedure TFrmAtendReqCad.BtAtenderClick(Sender: TObject);
var
    rSaldo : Double;
    sSql   : String;
begin
  inherited;
  If Not qryGrid.Active Then
     Begin
        MsgDlg('Não há nehum Artigo Selecionado','Erro',mtError,[mbOk],0);
        Exit;
     End;
 If qryGrid.IsEmpty Then
     Begin
        MsgDlg('Não há requisição para ser atendida','Erro',mtError,[mbOk],0);
        Exit;
     End;
  rSaldo := MovNew.InfoSaldo(qryGrid.FieldByName('CODARTIGO').AsString,Modulo.icodAlmoxa,edDataAtend.Date);
  If (rSaldo <=0) then
     Begin
         MsgDlg('Atendimento não pode ser realizado, saldo igual a zero', 'Erro', mtError, [mbOk, mbHelp], 0);
         Exit;
     End;
  edNome.Clear;
  edDepto.Clear;
  //
  sSql:='SELECT NOME FROM PESSOA WHERE (IDPESSOA = '+IntToStr(qryGrid.FieldByName('IDUSUARIOINCLUSAO').AsInteger)+')';
  if FazQuery(qrySolic,sSql) then
     edNome.Text:=qrySolic.FieldByName('NOME').AsString;
  //
  sSql:='SELECT NOME FROM CENTCUST WHERE (IDEMPRESA = '+IntToStr(Sistema.IdEmpresa)+')'+
        ' AND (CODCENTROCUSTO = '''+qryGrid.FieldByName('CODCENTROCUSTO').AsString+''')';
  if FazQuery(qrySolic,sSql) then
     edDepto.Text:=qrySolic.FieldByName('NOME').AsString;
  //
  sSql := 'SELECT LOCALIZACAO FROM SALDO WHERE  (RTRIM(CODARTIGO) = '''+qryGrid.FieldByName('CODARTIGO').AsString+''')'+
                                          ' AND (CODALMOXARIFADO = '+IntToStr(Modulo.icodAlmoxa)+')';
  if FazQuery(qrySaldo,sSql) then
     edLocalizacao.Text:= qrySaldo.FieldByName('LOCALIZACAO').AsString;
  reSaldo.Value:= ConversaoMed.ConverteSaldoQtde(qryGrid.FieldByName('CODARTIGO').AsString,
                                          qryGrid.FieldByName('CODMEDCUSTO').AsString,
                                          qryGrid.FieldByName('CODMEDIDA').AsString,
                                          rSaldo);
  if (reSaldo.Value < EdQtdeSolic.Value) then
     EdQtdeAtend.Value := reSaldo.Value
  else
     EdQtdeAtend.Value := EdQtdeSolic.Value;

  btAtender.Enabled := False;
  pnlDet.BringToFront;
  SelSubGrid(qryGrid.FieldByName('CodArtigo').AsString,
             qryGrid.FieldByName('NumRequisicao').AsInteger );
  EdQtdeAtend.SetFocus;
end;

procedure TFrmAtendReqCad.btCancelaClick(Sender: TObject);
begin
  inherited;
  GrdReq.BringToFront;
  btAtender.Enabled := True;
end;

procedure TFrmAtendReqCad.BtLimpaClick(Sender: TObject);
begin
  inherited;
  EdNumReq.text   := '';
  dblcCCust.text  := '';
  edDataReq.text  := '';
  edDataNec.text  := '';
end;

Function TFrmAtendReqCad.VerifEntrega( N : longInt ) : Boolean;
Begin
  With QryAux Do
     Begin
        Close;
        Sql.text := ' Select NumRequisicao From ITEMPEDI ' +
                    ' Where (NumRequisicao = ' + IntToStr( N ) +')'+
                    '   AND (QTDEPENDENTE <> 0 ) ';
        Open;
        VerifEntrega := isEmpty;
     End;
End;

Procedure TFrmAtendReqCad.SelTipoMov;
Begin
    If QryGrid.FieldByName('CUSTOTRANSF').AsString = 'T' Then
        Begin
              If qryAlmox.Locate('CODALMOXARIFADO',QryGrid.FieldByName('CODALMOXADESTINO').AsInteger,[]) Then
                 Begin
                    sAlmoxDestino := qryAlmox.FieldbyName('PRINCIPSECUND').AsString;
                    sCCusto       := qryAlmox.FieldbyName('CODCENTROCUSTO').AsString;
                    iCodCusteio   := qryAlmox.FieldbyName('CODCUSTEIO').AsInteger;
                 End;
                 IF (sAlmoxOrigem = 'P') And (sAlmoxDestino= 'S') Then
                   Begin
                      TipoMovSai := 'F';
                      TipoMovEnt := 'B';
                   End
                Else
                IF (sAlmoxOrigem = 'P') And (sAlmoxDestino= 'P') Then
                   Begin
                      TipoMovSai := 'F';
                      TipoMovEnt := 'B';
                   End
                Else
                IF (sAlmoxOrigem = 'S') And (sAlmoxDestino= 'P') Then
                   Begin
                      TipoMovSai := 'R';
                      TipoMovEnt := 'S';
                   End
                Else
                IF (sAlmoxOrigem = 'S') And (sAlmoxDestino= 'S') Then
                   Begin
                      TipoMovSai := 'G';
                      TipoMovEnt := 'B';
                   End;
           End;
End;
Function TFrmAtendReqCad.GerarMovimento : Boolean;
var iMov : LongInt;
    rValor : Double;
Begin
    Result := True;
    SelTipoMov;
    If QryGrid.FieldByName('CustoTransf').AsString = 'T' Then
          Begin
             iMov := MovNew.GeraMov('S',
                              0,
                              EdQtdeAtend.Value,
                              Modulo.iCodCusteio,
                              Modulo.iCodAlmoxa,
                              qryGrid.FieldByName('CodArtigo').AsString,
                              '',
                              TipoMovSai,
                              qryGrid.FieldByName('CodMedida').AsString,
                              '',
                              DateToStr(EdDataAtend.Date),
                              qryGrid.FieldByName('NumRequisicao').AsString,
                              sCCusto,
                              Sistema.IdEmpresa,
                              qryGrid.FieldByName('CodAlmoxaDestino').AsInteger,
                              qryGrid.FieldByName('UNIDNEGOC').AsInteger );
             If iMov < 0 Then
                Begin
                   Result := False;
                   Exit;
                End;
            rValor := 0;
            If FazQuery(dtmBaseDados.qry,'SELECT VALORMOV*(-1) AS VALOR FROM MOVIMENT WHERE (IDMOV = '+IntToStr(iMov)+')') Then
               rValor := dtmBaseDados.qry.FieldByName('VALOR').AsFloat;
            If MovNew.GeraMov('E',
                              rValor,
                              EdQtdeAtend.Value,
                              iCodCusteio,
                              QryGrid.FieldByName('CodAlmoxaDestino').asInteger,
                              qryGrid.FieldByName('CodArtigo').AsString,
                              '',
                              TipoMovEnt,
                              qryGrid.FieldByName('CodMedida').AsString,
                              '',
                              DateToStr(EdDataAtend.Date),
                              qryGrid.FieldByName('NumRequisicao').AsString,
                              Modulo.sCCustoAlmoxa,
                              Sistema.IdEmpresa,
                              Modulo.iCodAlmoxa,
                              qryGrid.FieldByName('UNIDNEGOC').AsInteger ) < 0
            Then
                Begin
                   Result := False;
                   Exit;
                End;
          End
    Else
         Begin
             If MovNew.GeraMov('S',
                             0,
                             EdQtdeAtend.Value,
                             Modulo.iCodCusteio,
                             Modulo.iCodAlmoxa,
                             qryGrid.FieldByName('CodArtigo').AsString,
                             '',
                             'E',
                             qryGrid.FieldByName('CodMedida').AsString,
                             '',
                             DateToStr(EdDataAtend.Date),
                             qryGrid.FieldByName('NumRequisicao').AsString,
                             qryGrid.FieldByName('CodCentroCusto').AsString,
                             Sistema.IdEmpresa,
                             -1,
                             qryGrid.FieldByName('UNIDNEGOC').AsInteger ) < 0
             Then
                Begin
                   Result := False;
                   Exit;
                End;
         End;
End;
procedure TFrmAtendReqCad.Atender;
Var
  rResto    : Double;
  idItemEnt : LongInt;
  cDecsep   : Char;
Begin
   rResto := 0;
   If Format('%15.5f',[EdQtdeAtend.Value]) < Format('%15.5f',[edQtdeSolic.Value]) Then
      Begin
          if MsgDlg('A quantidade atendida é menor que a solicitada. Deseja deixar o restante pendente',
                    'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
             Begin
                rResto := edQtdeSolic.Value - edQtdeAtend.Value;
             End
          Else
             rResto := 0;
      End;
    Try
        StartTransacao;
        If Not GerarMovimento Then
            Abort;
       // Insere um Item de Entrega
        With qryAux Do
            Begin
                idItemEnt := LeUltRegistro(nil,'ITEMENTR');
                cDecsep := DecimalSeparator;
                DecimalSeparator := '.';
                SQL.Text:= ' INSERT INTO ITEMENTR (IdItemEntrega,NUMREQUISICAO,CodArtigo, ' +
                           ' CodMedida,QtdeEntrega,DATAENTREGA,DataReceb, ' +
                           ' FLGSTATUS,IDATENDENTE,ValorUN) VALUES (' +
                            IntToStr(IdItemEnt)+ ',' +
                            IntToStr(qryGrid.FieldByName('NUMREQUISICAO').asInteger)+ ',' +
                            ''''+ qryGrid.FieldByName('CodArtigo').AsString+''',' +
                            ''''+ qryGrid.FieldByName('CodMedida').AsString+''',' +
                            FloatToStr( EdQtdeAtend.Value )+ ',' +
                            'TO_DATE('''+DateToStr(edDataAtend.Date)+''',''DD/MM/YYYY''), '+
                            'NULL,''F'', ' +
                            IntToStr(Sistema.idUsuario) +','+
                            FloatToStr(qryGrid.FieldByName('ValorUn').AsFloat )+ ')';
                ExecSQL;
            End;
            DecimalSeparator := cDecSep;
      // Atualizar a qtde pendente na tbl ItemPedi
        With QryAux Do
            Begin
                cDecSep := DecimalSeparator;
                DecimalSeparator := '.';
                Close;
                Sql.text := ' Update ItemPedi Set ' +
                            ' QtdePendente = ' + FloatToStr( rResto ) +
                            ' Where (RTRIM(CodArtigo) = '''+Trim(QryGrid.FieldByName('CodArtigo').AsString)+''') '+
                            '   and (NumRequisicao = ' + QryGrid.FieldByName('NumRequisicao').AsString+')';
                ExecSql;
                DecimalSeparator := cDecSep;
           End;
        if  VerifEntrega(QryGrid.FieldByName('NumRequisicao').asInteger) Then
          Begin
             With QryAux Do
                Begin
                   cDecSep := DecimalSeparator;
                   DecimalSeparator := '.';
                   Close;
                   Sql.text := ' Update REQMAT SET ' +
                               ' REQATENDIDA = ''T''' +
                               ' Where (NumRequisicao = ' + QryGrid.FieldByName('NumRequisicao').AsString+')';
                   ExecSql;
                   DecimalSeparator := cDecSep;
                end;
          End
        Else
          Begin
             With QryAux Do
                Begin
                   cDecSep := DecimalSeparator;
                   DecimalSeparator := '.';
                   Close;
                   Sql.text := ' Update REQMAT SET ' +
                               ' REQATENDIDA = ''P''' +
                               ' Where (NumRequisicao = ' + QryGrid.FieldByName('NumRequisicao').AsString+')';
                   ExecSql;
                   DecimalSeparator := cDecSep;
                end;
          End;
        CommitTransacao;
    Except
        MsgDlg('Não foi possível efetuar atendimento','Erro',mtError,[mbOk],0);
        RollBackTransacao;
        Raise;
    End;
End;

Procedure TFrmAtendReqCad.Estornar;
Var
  cDecsep : Char;
Begin
   Try
      StartTransacao;
      With QryAux Do
          Begin
              cDecSep := DecimalSeparator;
              DecimalSeparator := '.';
              Close;
              Sql.text := ' Update ItemPedi Set ' +
                          ' QtdePendente = 0 '+
                          ' Where (RTRIM(CodArtigo) = '''+Trim(QryGrid.FieldByName('CodArtigo').AsString)+''') '+
                          '   and (NumRequisicao = ' + QryGrid.FieldByName('NumRequisicao').AsString+')';
              ExecSql;
              DecimalSeparator := cDecSep;
          End;
        if VerifEntrega(QryGrid.FieldByName('NumRequisicao').asInteger) Then
          Begin
             With QryAux Do
                Begin
                   cDecSep := DecimalSeparator;
                   DecimalSeparator := '.';
                   Close;
                   Sql.text := ' Update REQMAT SET ' +
                               ' REQATENDIDA = ''T''' +
                               ' Where (NumRequisicao = ' + QryGrid.FieldByName('NumRequisicao').AsString+')';
                   ExecSql;
                   DecimalSeparator := cDecSep;
                end;
          End
        Else
          Begin
             With QryAux Do
                Begin
                   cDecSep := DecimalSeparator;
                   DecimalSeparator := '.';
                   Close;
                   Sql.text := ' Update REQMAT SET ' +
                               ' REQATENDIDA = ''P''' +
                               ' Where (NumRequisicao = ' + QryGrid.FieldByName('NumRequisicao').AsString+')';
                   ExecSql;
                   DecimalSeparator := cDecSep;
                end;
          End;
       CommitTransacao;
   Except
        RollBackTransacao;
        MsgDlg('Não foi possível efetuar estorno','Erro',mtError,[mbOk],0);
        Raise;
   End;
   qryGrid.Close;
   qryGrid.Open;
End;

procedure TFrmAtendReqCad.BtOkClick(Sender: TObject);
begin
  inherited;
    reSaldo.Value := ConversaoMed.ConverteSaldoQtde(qryGrid.FieldByName('CODARTIGO').AsString,
                                                    qryGrid.FieldByName('CODMEDCUSTO').AsString,
                                                    qryGrid.FieldByName('CODMEDIDA').AsString,
                                                    MovNew.InfoSaldo(qryGrid.FieldByName('CODARTIGO').AsString, Modulo.icodAlmoxa,edDataAtend.Date));
  If edQtdeAtend.Value = 0 Then
    Begin
        MsgDlg('Atendimento não pode ser realizado, quantida igual a zero', 'Erro', mtError, [mbOk, mbHelp], 0);
        edQtdeAtend.SetFocus;
    End
  Else
    If edQtdeAtend.Value > reSaldo.Value Then
    Begin
        MsgDlg('Atendimento não pode ser realizado, quantida maior que a em estoque nesta data', 'Erro', mtError, [mbOk, mbHelp], 0);
        edQtdeAtend.SetFocus;
    End
  Else
    Begin
       Atender;
       QryGrid.Close;
       QryGrid.Open;
       GrdReq.BringToFront;
       btAtender.Enabled := True;
    End;
end;

procedure TFrmAtendReqCad.EdQtdeAtendExit(Sender: TObject);
begin
  inherited;
  If EdQtdeAtend.Value >  reSaldo.Value  Then
     Begin
        MsgDlg('Quantidade maior que a quantidade em estoque', 'Erro', mtError, [mbOk, mbHelp], 0);
        EdQtdeAtend.SetFocus;
        Exit;
     End;
  If EdQtdeAtend.Value > ( EdQtdeSolic.Value +(  EdQtdeSolic.Value * Modulo.iPercReqMat )/100 ) Then
    Begin
        MsgDlg('Quantidade maior que a quantidade solicitada', 'Erro', mtError, [mbOk, mbHelp], 0);
        EdQtdeAtend.SetFocus;
        Exit;
    End;
end;

procedure TFrmAtendReqCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrySubGrid.Close;
  qrySubGrid.UnPrepare;
end;

procedure TFrmAtendReqCad.edDataAtendExit(Sender: TObject);
begin
  inherited;
  If edDataAtend.Date > Date Then
    Begin
        MsgDlg('Data da Atendimento não pode ser maior que a data de hoje','Erro',mtError,[mbOk],0);
        edDataAtend.SetFocus;
    End
  Else
    Begin
       reSaldo.Value:= ConversaoMed.ConverteSaldoQtde(qryGrid.FieldByName('CODARTIGO').AsString,
                                                      qryGrid.FieldByName('CODMEDCUSTO').AsString,
                                                      qryGrid.FieldByName('CODMEDIDA').AsString,
                                                      MovNew.InfoSaldo(qryGrid.FieldByName('CODARTIGO').AsString, Modulo.icodAlmoxa,edDataAtend.Date));
    End;
end;

procedure TFrmAtendReqCad.BtnEstornarClick(Sender: TObject);
begin
  inherited;
  If Not qryGrid.Active Then
     Begin
        MsgDlg('Não há nehum Artigo Selecionado','Erro',mtError,[mbOk],0);
     End
  Else
  If qryGrid.IsEmpty Then
     Begin
        MsgDlg('Não há requisição para ser atendida','Erro',mtError,[mbOk],0);
     End
  Else
     If MsgDlg('Confirma o Estorno','Confirmação',mtConfirmation,[mbOk,mbCancel],0)= MrOK Then
        Estornar;
end;

end.
