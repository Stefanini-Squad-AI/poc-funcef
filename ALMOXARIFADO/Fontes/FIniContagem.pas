unit FIniContagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DBCtrls,  ComCtrls, CMTree, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList;

type
  TfrmIniContagem = class(TfrmCadastroCS)
    treeGrupoProd: TCMTreeView;
    dbeNumInventario: TDBEdit;
    lblAlmoxarifado: TLabel;
    Label6: TLabel;
    edGrupoProd: TMaskEdit;
    spdGrupoProd: TSpeedButton;
    gbDescGrupo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dbrMostraSaldo: TDBRadioGroup;
    dbrSitInventario: TDBRadioGroup;
    dbedDataInv: TCMDateTimePicker;
    dbrAbrangencia: TDBRadioGroup;
    qryGrupoProd: TwwQuery;
    dsGrupoProd: TwwDataSource;
    qryGrupoProdCODGRUPOPROD: TStringField;
    qryGrupoProdDESCGRUPOPROD: TStringField;
    qryGrupoProdSTATUSGRUPO: TStringField;
    dbedAlmoxarifado: TEdit;
    lblDescProduto: TLabel;
    qryAux: TwwQuery;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure FazerQryPrincipal;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spdGrupoProdClick(Sender: TObject);
    procedure treeGrupoProdExit(Sender: TObject);
    procedure edGrupoProdExit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIniContagem: TfrmIniContagem;
  iInventario : LongInt;
implementation

uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema,uFuncaoGeral;

{$R *.DFM}

procedure TfrmIniContagem.FormActivate(Sender: TObject);
begin
  inherited;
  //
  dbedAlmoxarifado.Text:=Modulo.sAlmoxaUsuario;
  //
  sbtnAlterar.Enabled:=False;
  //
  MontaSelect.Filtro.Add('INVENTAR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('INVENTAR.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
  MontaSelect.Filtro.Add('INVENTAR.CONTAGEMENCERRADA <> ''T''');
  //
  iInventario:=0;
  FazerQryPrincipal;
  //
  treeGrupoProd.Mascara:=trim(Modulo.sMascaraGrupoProd);
  edGrupoProd.editmask :=trim(Modulo.sMascaraGrupoProd)+ ';0;_';
  edGrupoProd.Text:='';
  lblDescProduto.Caption:='';
  qryGrupoProd.Close;
  qryGrupoProd.SQL.text := 'SELECT CODGRUPOPROD,DESCGRUPOPROD,STATUSGRUPO FROM '+
                           ' GRUPPROD ORDER BY CODGRUPOPROD';
  qryGrupoProd.Open;
  treeGrupoProd.montaarvore;
end;

procedure TfrmIniContagem.FazerQryPrincipal;
begin
  inherited;
  qry.Close;
  qry.SQL.text := ' SELECT I.*,G.DESCGRUPOPROD '+
                  ' FROM '+
                  ' GRUPPROD G, INVENTAR I, ALMOX A '+
                  ' WHERE '+
                  '       (I.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                  '   AND (I.IDINVENTARIO = '+IntToStr(iInventario)+')'+
                  '   AND (I.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa)+')'+
                  '   AND (I.CODGRUPOPROD = G.CODGRUPOPROD(+) )';
  qry.Open;
end;

procedure TfrmIniContagem.CmeCadastroFind(Sender: TObject);
begin
     if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
     begin
        iInventario:=StrToInt(MontaSelect.ValoresChave[0]);
        FazerQryPrincipal;
        edGrupoProd.Text:=qry.FieldByName('CODGRUPOPROD').AsString;
        lblDescProduto.Caption := qry.FieldByName('DESCGRUPOPROD').AsString;
     end;
end;

procedure TfrmIniContagem.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  edGrupoProd.Enabled := True;
  edGrupoProd.Text:='';
  lblDescProduto.Caption:='';
  edGrupoProd.SetFocus;
  qry.FieldByName('IDPESSOA').AsInteger:=Sistema.IdEmpresa;
  qry.FieldByName('CODALMOXARIFADO').AsInteger:=Modulo.iCodAlmoxa;
  qry.FieldByName('PARCIALTOTAL').AsString:='T';
  qry.FieldByName('CONTAGEMENCERRADA').AsString:='F';
  qry.FieldByName('ABERTOFECHADO').AsString:='A';
  if Modulo.LeDataRepresa > Date then
     qry.FieldByName('DATAINVENTARIO').asDateTime := Date
  else
     qry.FieldByName('DATAINVENTARIO').asDateTime := Modulo.LeDataRepresa;
end;

procedure TfrmIniContagem.bbtnConfirmarClick(Sender: TObject);
var iNumMax:Integer;
begin
  //
  qryAux.Close;
  qryAux.SQL.text := 'SELECT CODGRUPOPROD,PARCIALTOTAL FROM INVENTAR '+
                  'WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+
                  ' AND CONTAGEMENCERRADA <> ''T'''+
                  ' AND CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa);
  qryAux.Open;
  //
  if (not qryAux.IsEmpty) and ((qryAux.FieldByName('PARCIALTOTAL').AsString = 'T') or (qry.FieldByName('PARCIALTOTAL').AsString = 'T')) then
  Begin
     MsgDlg('Já existe inventário aberto para o almoxarifado. Encerre ou Exclua o Inventário Anterior','Erro',mtError,[mbOk],0);
     bbtnCancelarClick(Self);
     exit;
  end;
  //
  if trim(edGrupoProd.Text) <> '' then
     qry.FieldByName('CODGRUPOPROD').AsString:=edGrupoProd.Text;
  //
  qryAux.First;
  While not qryAux.Eof do
  Begin
     if (length(trim(qryAux.FieldByName('CODGRUPOPROD').AsString))) <= (length(trim(qry.FieldByName('CODGRUPOPROD').AsString))) then
        iNumMax:=(length(trim(qryAux.FieldByName('CODGRUPOPROD').AsString)))
     else
        iNumMax:=(length(trim(qry.FieldByName('CODGRUPOPROD').AsString)));
     if copy(trim(qryAux.FieldByName('CODGRUPOPROD').AsString),1,iNumMax) = copy(trim(qry.FieldByName('CODGRUPOPROD').AsString),1,iNumMax) then
     Begin
        MsgDlg('Já existe inventário aberto para este grupo neste almoxarifado. Encerre ou Exclua o Inventário Anterior','Erro',mtError,[mbOk],0);
        bbtnCancelarClick(Self);
        exit;
     end;
     qryAux.Next;
  end;
  //
  if Trim(dbedDataInv.Text)='' then
  Begin
     MsgDlg('Obrigatório preencher a Data do Inventário','Erro',mtError,[mbOk],0);
     dbedDataInv.SetFocus;
     exit;
  end;
  if dbedDataInv.Date > Date then
  Begin
     MsgDlg('Data do Inventário não pode ser maior que a data de hoje','Erro',mtError,[mbOk],0);
     dbedDataInv.SetFocus;
     exit;
  end;
  if dbedDataInv.Date > Modulo.LeDataRepresa then
  Begin
     MsgDlg('Data do Inventário não pode ser maior que a data de represamento','Erro',mtError,[mbOk],0);
     dbedDataInv.SetFocus;
     exit;
  end;
  if qry.FieldByName('IDINVENTARIO').AsInteger <= 0 then
     qry.FieldByName('IDINVENTARIO').AsInteger := LeUltRegistro(nil,'INVENTAR');
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmIniContagem.CmeCadastroConfirma(Sender: TObject);
var sSql,scSql:String;
begin
  Try
     StartTransacao;
     //Inserindo INVENTAR
     scSql:='';
     if edGrupoProd.Text <> '' then
        scSql:=scSql +','''+edGrupoProd.Text+''''
     else
        scSql:=scSql +',NULL';
     scSql:=scSql +',to_date('''+qry.FieldByName('DATAINVENTARIO').AsString+''',''dd/MM/yyyy'')';
     scSql:=scSql +',to_date('''+qry.FieldByName('DATAINVENTARIO').AsString+''',''dd/MM/yyyy'')';
     scSql:=scSql +','''+qry.FieldByName('ABERTOFECHADO').AsString+'''';
     scSql:=scSql +','''+qry.FieldByName('CONTAGEMENCERRADA').AsString+'''';
     scSql:=scSql +','''+qry.FieldByName('PARCIALTOTAL').AsString+''')';
     with qryAux do begin
        Close;
        sSql :='INSERT INTO INVENTAR(IDINVENTARIO,IDPESSOA,CODALMOXARIFADO,'+
               'CODGRUPOPROD,DATAINVENTARIO,DATATRAVA,ABERTOFECHADO,CONTAGEMENCERRADA,'+
               'PARCIALTOTAL) VALUES(';
        sSql :=sSql+InttoStr(qry.FieldByName('IDINVENTARIO').AsInteger)+','+InttoStr(Sistema.IdEmpresa)+','+IntToStr(qry.FieldByName('CODALMOXARIFADO').AsInteger)+scSql;
        Sql.Clear;
        Sql.Add(sSql);
        ExecSQL;
     end;

     //Inserindo QTDECONT
     with qryAux do begin
        Close;
        scSql:='';
        scSql:=scSql+'(SELECT I.IDINVENTARIO,S.CODARTIGO,P.CODMEDCUSTO FROM INVENTAR I, SALDO S, GRUPPROD G, PRODUTO P, ARTIGO A ';
        scSql:=scSql+' WHERE (I.IDINVENTARIO = '+IntToStr(qry.FieldByName('IDINVENTARIO').AsInteger)+') AND ';
        if Trim(edGrupoProd.Text) <> '' then
           scSql:=scSql+'(G.CODGRUPOPROD LIKE '''+trim(edGrupoProd.Text)+'%'') AND ';
        scSql:=scSql+' (G.CODGRUPOPROD = P.CODGRUPOPROD) AND ';
        scSql:=scSql+' (P.CODPRODUTO = A.CODPRODUTO) AND ';
        scSql:=scSql+' (A.CODARTIGO = S.CODARTIGO) AND ';
        scSql:=scSql+' (I.CODALMOXARIFADO = S.CODALMOXARIFADO))';
        //
        sSql :='INSERT INTO QTDECONT(IDINVENTARIO,CODARTIGO,CODMEDIDA) '+scSql;
        Sql.Clear;
        Sql.Add(sSql);
        ExecSQL;
     end;
     //
     CommitTransacao;
     qry.CancelUpdates;
  Except
     RollBackTransacao;
     MsgDlg('Inicialização do Inventário não Efetuada','Erro',mtError,[mbOk],0);
     FuncaoGeral.TiraIcone;
     Raise;
  end;
 inherited;
  bbtnCancelar.Click;
end;

procedure TfrmIniContagem.CmeCadastroDelete(Sender: TObject);
var sSql:String;
begin
  Try
     StartTransacao;
     with qryAux do begin
        Close;
        sSql :='DELETE QTDECONT WHERE IDINVENTARIO = '+InttoStr(qry.FieldByName('IDINVENTARIO').AsInteger);
        Sql.Clear;
        Sql.Add(sSql);
        ExecSQL;
     end;
     with qryAux do begin
        Close;
        sSql :='DELETE RESCONT WHERE IDINVENTARIO = '+InttoStr(qry.FieldByName('IDINVENTARIO').AsInteger);
        Sql.Clear;
        Sql.Add(sSql);
        ExecSQL;
     end;
     with qryAux do begin
        Close;
        sSql :='DELETE INVENTAR WHERE IDINVENTARIO = '+InttoStr(qry.FieldByName('IDINVENTARIO').AsInteger);
        Sql.Clear;
        Sql.Add(sSql);
        ExecSQL;
     end;
     CommitTransacao;
     qry.CancelUpdates;
  Except
     RollBackTransacao;
     MsgDlg('Exclusão do Inventário não Efetuada','Erro',mtError,[mbOk],0);
     FuncaoGeral.TiraIcone;
  end;
end;

procedure TfrmIniContagem.spdGrupoProdClick(Sender: TObject);
begin
  inherited;
  treeGrupoProd.Visible := not treeGrupoProd.Visible;
  if treeGrupoProd.Visible
  then treeGrupoProd.SetFocus;
end;

procedure TfrmIniContagem.treeGrupoProdExit(Sender: TObject);
begin
  inherited;
  treeGrupoProd.Visible := false;
  edGrupoProd.Text := '';
  edGrupoProd.Text := treeGrupoProd.ValorChave;
  edGrupoProd.SetFocus;
end;

procedure TfrmIniContagem.edGrupoProdExit(Sender: TObject);
begin
  inherited;
  If (qry.state in [dsedit,dsinsert]) then
  Begin
     if trim(edGrupoProd.Text) <> '' then
     Begin
        qryAux.Close;
        qryAux.SQL.text := 'SELECT CODGRUPOPROD,DESCGRUPOPROD FROM GRUPPROD WHERE CODGRUPOPROD = '''+edGrupoProd.Text+'''';
        qryAux.Open;
        if qryAux.IsEmpty then
        Begin
           MsgDlg('Grupo de Produto não cadastrado','Erro',mtError,[mbOk],0);
           edGrupoProd.SetFocus;
           exit;
        end;
        qry.FieldByName('PARCIALTOTAL').AsString:='P';
        lblDescProduto.Caption := qryAux.FieldByName('DESCGRUPOPROD').AsString;
     end
     else
     Begin
        qry.FieldByName('PARCIALTOTAL').AsString:='T';
        lblDescProduto.Caption := '';
     end;
  end;
end;

procedure TfrmIniContagem.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   sbtnAlterar.Enabled:=False;
end;

procedure TfrmIniContagem.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
//
end;

end.
