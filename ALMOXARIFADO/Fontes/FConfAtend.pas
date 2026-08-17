unit FConfAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, TEdNum, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  Wwdatsrc, Mask, wwdbedit, TREdit, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmConfAtend = class(TfrmSairAjuda)
    qryGrid: TwwQuery;
    qryCCust: TwwQuery;
    Label1: TLabel;
    Label4: TLabel;
    dblcCCust: TwwDBLookupCombo;
    EdNumReq: TEditNum;
    GrpData: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edDataReq: TCMDateTimePicker;
    EdDataNec: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    grdReq: TwwDBGrid;
    pnlDet: TPanel;
    dsGrid: TwwDataSource;
    BtOk: TBitBtn;
    btCancela: TBitBtn;
    Label6: TLabel;
    edCadArt: TwwDBEdit;
    Label7: TLabel;
    EdDescArt: TwwDBEdit;
    Label9: TLabel;
    EdReqArt: TwwDBEdit;
    Bevel4: TBevel;
    Label11: TLabel;
    EdQtdeSolic: TDBRealEdit;
    qryAux: TwwQuery;
    qryAlmox: TwwQuery;
    pnlOp: TPanel;
    BtLimpa: TBitBtn;
    btDevolver: TSpeedButton;
    btConfirmar: TSpeedButton;
    btSelecionar: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure BtLimpaClick(Sender: TObject);
    procedure btDevolverClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Confirmar;
    Procedure Devolver;
    Procedure SelTipoMov;
    Function  GerarMovimento : Boolean;
  public
    { Public declarations }
  end;

var
  FrmConfAtend   : TFrmConfAtend;
  TipoMovEnt     : Char;
  TipoMovSai     : Char;
  sAlmoxOrigem   : String[01];
  sAlmoxDestino  : String[01];
  sCCusto        : String;
  iCodCusteio    : Integer;
implementation

{$R *.DFM}
Uses uModulo, uMensErro, uSistema, UDataBase, uMovNew, dBaseDados;
procedure TFrmConfAtend.FormCreate(Sender: TObject);
begin
  inherited;
  qryCCust.Close;
  qryCCust.Sql.text := ' SELECT CODCENTROCUSTO,NOME FROM CENTCUST ' +
                       ' WHERE (IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa )+')'+
                       '   AND (STATUSGRUPOCDC = ''S'') '+
                       '   AND (ATIVO =''S'')'+
                       ' ORDER BY NOME ';
  qryCCust.Open;
  //
  GrdReq.BringToFront;
  pnlOp.Enabled   := True;
  //
  qryAlmox.Close;
  qryAlmox.Sql.Text := ' Select CodAlmoxarifado, PRINCIPSECUND From Almox ' +
                       ' Where  (CodAlmoxarifado = ' + IntToStr( Modulo.icodAlmoxa )+')';
  qryAlmox.Open;
  sAlmoxDestino := qryAlmox.FieldbyName('PRINCIPSECUND').AsString;
  //
  qryAlmox.Close;
  qryAlmox.Sql.Text := ' Select A.CodAlmoxarifado, A.DescAlmox,A.PRINCIPSECUND, A.CodCentroCusto, A.CodCusteio From Almox A,TransfAlmox T'+
                       ' Where (A.CodAlmoxarifado <> ' + IntToStr(Modulo.icodAlmoxa ) + ') and (A.idpessoa =  ' +IntToStr(Sistema.IdEmpresa)+')'+
                       ' and (t.codalmoxarifado = '+ IntToStr(Modulo.icodAlmoxa )+') AND (A.CODALMOXARIFADO = T.CODALMOXPERMITE)'+
                       ' Order By A.DescAlmox ';
  qryAlmox.Open;
end;

procedure TFrmConfAtend.btSelecionarClick(Sender: TObject);
begin
  inherited;
  With QryGrid Do
     Begin
         Close;
         Sql.Text :=  ' Select    ' +
                      '       A.CodArtigo,    ' +
                      '       (P.DESCPROD || '' '' || T.CODTAMANHO || '' '' || C.CODCOR) AS DESCRICAO, ' +
                      '       IE.NumRequisicao, ' +
                      '       IE.IDITEMENTREGA, ' +
                      '       IE.QTDEEntrega,   ' +
                      '       I.QTDEPENDENTE,   ' +
                      '       IE.VALORUN,      ' +
                      '       IE.CodMedida,    ' +
                      '       R.CODCENTROCUSTO,' +
                      '       R.CustoTransf,     ' +
                      '       R.CodAlmoxaDestino,' +
                      '       R.CodAlmoxaOrigem, ' +
                      '       R.UNIDNEGOC        ' +
                      '  From                    ' +
                      '       Artigo A,        ' +
                      '       Produto P,       ' +
                      '       Cor C,           ' +
                      '       Tamanho T,       ' +
                      '       REQMAT R,        ' +
                      '       ItemEntr IE,     ' +
                      '       ItemPEDI I       ' +
                      '  Where                 ' +
                      '           (R.CodAlmoxaDestino = '+ IntToStr( Modulo.icodAlmoxa ) +')'+
                      '       and (R.idPessoa = '+IntToStr(Sistema.IdEmpresa)+') ' +
                      '       and (IE.DataReceb is Null and IE.FLGSTATUS = ''F'') ';
          If Trim(edNumReq.Text) <> '' Then
              Sql.Add('  And (IE.NumRequisicao = '+EdNumReq.Text+')');
          If Trim(dblcCCust.Text) <> '' Then
              Sql.Add('  And (RTRIM(R.CodCentroCusto) ='''+Trim(dblcCCust.LookUpValue)+''')');
          If Trim(edDataReq.Text) <> '' Then
              Sql.Add('  And (R.DataEmissao = To_Date('''+DateToStr(edDataReq.Date)+''',''dd/mm/yyyy'') )' );
          If Trim(edDataNec.Text) <> '' Then
              Sql.Add('  And (R.DataNecessidade = To_Date('''+DateToStr(edDataNec.Date)+''',''dd/mm/yyyy'') )');

              Sql.Add('  And (A.CodProduto = p.CodProduto)        ' +
                      '  and (A.Codtamanho = T.CodTamanho(+))     ' +
                      '  and (A.CodCor     = C.CodCor(+))         ' +
                      '  and (A.CodArtigo  = IE.CODARTIGO)        ' +
                      '  and (IE.NUMREQUISICAO = R.NUMREQUISICAO) ' +
                      '  and (A.CodArtigo  = I.CODARTIGO)         ' +
                      '  and (I.NUMREQUISICAO = R.NUMREQUISICAO)  ');
          Sql.Add('  Order By Descricao ');
         Open;
     End;
end;

procedure TFrmConfAtend.btCancelaClick(Sender: TObject);
begin
  inherited;
  grdReq.BringToFront;
  pnlOp.Enabled    := True;
  btConfirmar.Down := False;
  btDevolver.Down  := False;
end;

procedure TFrmConfAtend.BtConfirmarClick(Sender: TObject);
begin
  inherited;
  If Not qryGrid.Active Then
     Begin
        MsgDlg('Não há nehum Artigo Selecionado','Erro',mtError,[mbOk],0);
        btConfirmar.Down := False;
        Exit;
     End;
 If qryGrid.IsEmpty Then
     Begin
        MsgDlg('Não há requisição para ser atendida','Erro',mtError,[mbOk],0);
        btConfirmar.Down := False;
        Exit;
     End;

  btConfirmar.Down := True;
  pnlOp.Enabled    := False;

  pnlDet.BringToFront;
  BtOk.SetFocus;
end;

procedure TFrmConfAtend.BtLimpaClick(Sender: TObject);
begin
  inherited;
  EdNumReq.text   := '';
  dblcCCust.text  := '';
  edDataReq.text  := '';
  edDataNec.text  := '';
end;

procedure TFrmConfAtend.btDevolverClick(Sender: TObject);
begin
  inherited;
  If Not qryGrid.Active Then
     Begin
        MsgDlg('Não há nehum Artigo Selecionado','Erro',mtError,[mbOk],0);
        btDevolver.Down := False;
        Exit;
     End;
 If qryGrid.IsEmpty Then
     Begin
        MsgDlg('Não há requisição para ser atendida','Erro',mtError,[mbOk],0);
        btDevolver.Down := False;
        Exit;
     End;
  btDevolver.Down := True;
  pnlOp.Enabled   := False;
  pnlDet.BringToFront;
  BtOk.SetFocus;
end;

procedure TFrmConfAtend.Confirmar;
Begin
     try
        StartTransacao;
        With qryAux Do
           Begin
               Close;
               Sql.Text := ' Update ItemEntr Set '+
                           ' DataReceb = To_Date('''+DateToStr( Date )+''',''dd/mm/yyyy'')'+
                           ',FLGSTATUS = ''T'''+
                           ',IDUSUARIOCONFDEV = '+IntToStr(Sistema.idUsuario)+
                           ' Where (IDITEMENTREGA = '+ qryGrid.FieldByName('IDITEMENTREGA').AsString +')';
               ExecSql;
           End;
        CommitTransacao;
     except
        RollBackTransacao;
        MsgDlg('Não foi possível efetuar confirmação','Erro',mtError,[mbOk],0);
        Exit;
        Raise;
     end;
     qryGrid.Close;
     qryGrid.Open;
End;

Procedure TFrmConfAtend.SelTipoMov;
Begin
    If QryGrid.FieldByName('CustoTransf').AsString = 'T' Then
        Begin
              If qryAlmox.Locate('CodAlmoxarifado',QryGrid.FieldByName('CodAlmoxaOrigem').AsString,[LoPartialKey]) Then
                 Begin
                    sAlmoxOrigem  := qryAlmox.FieldbyName('PRINCIPSECUND').AsString;
                    sCCusto       := qryAlmox.FieldbyName('CodCentroCusto').AsString;
                    iCodCusteio   := qryAlmox.FieldbyName('CodCusteio').AsInteger;
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

Function TFrmConfAtend.GerarMovimento : Boolean;
var iMov : LongInt;
    rValor : Double;
Begin
    Result := True;
    SelTipoMov;
    If QryGrid.FieldByName('CustoTransf').AsString = 'T' Then
          Begin
              iMov:=MovNew.GeraMov('S',
                                 0,
                                 qryGrid.FieldByName('QtdeEntrega').AsFloat,
                                 Modulo.iCodCusteio,
                                 Modulo.iCodAlmoxa,
                                 qryGrid.FieldByName('CodArtigo').AsString,
                                 '',
                                 TipoMovSai,
                                 qryGrid.FieldByName('CodMedida').AsString,
                                 '',
                                 DateToStr( Date ),
                                 qryGrid.FieldByName('NumRequisicao').AsString,
                                 qryGrid.FieldByName('CodCentroCusto').AsString,
                                 Sistema.IdEmpresa,
                                 qryGrid.FieldByName('CodAlmoxaOrigem').AsInteger,
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
                               qryGrid.FieldByName('QtdeEntrega').AsFloat,
                               iCodCusteio,
                               QryGrid.FieldByName('CodAlmoxaOrigem').asInteger,
                               qryGrid.FieldByName('CodArtigo').AsString,
                               '',
                               TipoMovEnt,
                               qryGrid.FieldByName('CodMedida').AsString,
                               '',
                               DateToStr( Date ),
                               qryGrid.FieldByName('NumRequisicao').AsString,
                               qryGrid.FieldByName('CodCentroCusto').AsString,
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
             If  MovNew.GeraMov('S',
                              0,
                              qryGrid.FieldByName('QtdeEntrega').AsFloat*(-1),
                              Modulo.iCodCusteio,
                              Modulo.iCodAlmoxa,
                              qryGrid.FieldByName('CodArtigo').AsString,
                              '',
                              'E',
                              qryGrid.FieldByName('CodMedida').AsString,
                              '',
                              DateToStr( Date ),
                              qryGrid.FieldByName('NumRequisicao').AsString,
                              sCCusto,
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
procedure TFrmConfAtend.Devolver;
Begin
    Try
        StartTransacao;
        If Not GerarMovimento Then
          Abort;
        With qryAux Do
           Begin
               Close;
               Sql.Text := ' Update ItemEntr Set '+
                           ' DataReceb = To_Date('''+DateToStr( Date )+''',''dd/mm/yyyy'')'+
                           ',FLGSTATUS = ''D'''+
                           ',IDUSUARIOCONFDEV = '+IntToStr(Sistema.idUsuario)+
                           ' Where (IDITEMENTREGA = '+ qryGrid.FieldByName('IDITEMENTREGA').AsString +')';
               ExecSql;
           End;
       CommitTransacao;
    Except
        RollBackTransacao;
        MsgDlg('Não foi possível efetuar confirmação','Erro',mtError,[mbOk],0);
        Exit;
    End;
    qryGrid.Close;
    qryGrid.Open;

End;

procedure TFrmConfAtend.BtOkClick(Sender: TObject);
begin
  inherited;
    If btConfirmar.Down Then
       Begin
          Confirmar;
       End
  Else
    If btDevolver.Down Then
      Begin
         Devolver;
      End;
      grdReq.BringToFront;
      pnlOp.Enabled    := True;
      btConfirmar.Down := False;
      btDevolver.Down  := False;

end;

end.
