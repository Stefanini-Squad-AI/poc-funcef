unit FContagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TREdit, wwdblook, Wwkeycb, Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBTables, Db, Wwdatsrc, Wwquery, MontaSelect, IvDictio, IvMulti, IvEMulti;

type
  TfrmContagem = class(TfrmOkCancelar)
    grpArtigo: TGroupBox;
    Label1: TLabel;
    edAlmoxa: TEdit;
    dbgrdArtigos: TwwDBGrid;
    grpSaldo: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedDescProd: TDBEdit;
    IncschArtigo: TwwIncrementalSearch;
    dblckcmbArtigo: TwwDBLookupCombo;
    edCusto: TDBRealEdit;
    edSaldo: TDBRealEdit;
    dbeUnidade: TDBEdit;
    qry: TwwQuery;
    dsGrid: TwwDataSource;
    qryArtigo: TwwQuery;
    updSaldo: TUpdateSQL;
    qryAux: TwwQuery;
    MontaSelect: TMontaSelect;
    sbSelecionaInv: TSpeedButton;
    qryInventario: TwwQuery;
    rgOrdena: TRadioGroup;
    qryGrupo: TwwQuery;
    Label7: TLabel;
    dblcGrupoProd: TwwDBLookupCombo;
    edNum: TEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblckcmbArtigoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure AlteraSaldo;
    procedure sbSelecionaInvClick(Sender: TObject);
    procedure FazerQryPrincipal;
    procedure dbgrdArtigosExit(Sender: TObject);
    procedure rgOrdenaClick(Sender: TObject);
    procedure dblcGrupoProdCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContagem: TfrmContagem;
  sCod,sSql        : String;
  bIncluiSaldo,bIncluiCusto:Boolean;
  iInventario:LongInt;
  rSaldoAnt,
  rCustoAnt,
  rSaldoAntCM,
  rSaldo,
  rCustoMedio      : Real;
implementation

{$R *.DFM}
uses UMensErro, UFuncaoGeral, USistema, uString,uModulo,uDataBase;

Procedure TfrmContagem.AlteraSaldo;
var sValor,sSQLAlteracao : string;
begin
    { Atualizar Tabela de Saldo }
    sValor := FuncaoGeral.OraNumero(edSaldo.Value);
    sSQLAlteracao := 'SET QTDECONTADA = '+sValor;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE QTDECONT ' + sSQLAlteracao);
    qryAux.SQL.Add('WHERE (IDINVENTARIO = '+ IntToStr(iInventario)+') AND '+
                   '      (RTRIM(CodArtigo) = '''+ qry.FieldbyName('CodArtigo').AsString+''') AND '+
                   '      (RTRIM(CodMEDIDA) = '''+ qry.FieldbyName('CODMEDIDA').AsString+''')');
    qryAux.ExecSql;
End;

procedure TfrmContagem.FormCreate(Sender: TObject);
begin
  inherited;
  edNum.Clear;
  edAlmoxa.Text := Modulo.sAlmoxaUsuario;
  iInventario:=0;
  //
  MontaSelect.Filtro.Add('INVENTAR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('INVENTAR.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
  MontaSelect.Filtro.Add('INVENTAR.CONTAGEMENCERRADA <> ''T''');
  qryGrupo.Open;
  //
  FazerQryPrincipal;

end;
//
procedure TfrmContagem.FazerQryPrincipal;
Begin
     //
     qry.Close;
     qry.Sql.Text:=''+
          '  SELECT '+
          '      (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO, '+
          '       A.CODARTIGO,S.SALDOQTDE,CM.CUSTOMEDIO,QC.QTDECONTADA, QC.CODMEDIDA '+
          ' FROM '+
          '      ARTIGO A,    '+
          '      PRODUTO P,   '+
          '      SALDO S,     '+
          '      CUSTOMED CM, '+
          '      QTDECONT QC  '+
          ' WHERE '+
          '     (S.CODALMOXARIFADO(+) = ' + intToStr(Modulo.iCodAlmoxa)+')'+
          ' AND (CM.CODCUSTEIO(+) = ' + intToStr(Modulo.iCodCusteio)+')';
  If Trim(dblcGrupoProd.Text) <> '' Then
      qry.SQL.Add(' AND (RTRIM(P.CODGRUPOPROD) = '''+dblcGrupoProd.LookupValue+''')');
  qry.SQL.Add(' AND (QC.IDINVENTARIO = '+ IntToStr(iInventario)+')'+
              ' AND (P.ITEMESTOCAVEL = ''S'')'+
              ' AND (P.CODPRODUTO = A.CODPRODUTO)'+
              ' AND (A.CODARTIGO = S.CODARTIGO(+)) '+
              ' AND (A.CODARTIGO = CM.CODARTIGO(+)) '+
              ' AND (A.CODARTIGO = QC.CODARTIGO) ');
     if rgOrdena.ItemIndex = 0 then
        qry.sql.Add(' ORDER BY DESCRICAO')
     else
        qry.sql.Add(' ORDER BY A.CODARTIGO');
     qry.Open;
     //
     sSql:= ' SELECT (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO, '+
          '          A.CODARTIGO '+
          ' FROM '+
          '    ARTIGO A,  '+
          '    PRODUTO P, '+
          '    SALDO S,   '+
          '    CUSTOMED CM, '+
          '    QTDECONT QC '+
          ' WHERE (S.CODALMOXARIFADO(+) = ' + intToStr(Modulo.iCodAlmoxa)+')'+
          ' AND (CM.CODCUSTEIO(+) = ' + intToStr(Modulo.iCodCusteio)+')'+
          ' AND (QC.IDINVENTARIO = '+IntToStr(iInventario)+')'+
          ' AND (A.FLGATIVO = ''S'') '+
          ' AND (P.CODPRODUTO = A.CODPRODUTO)'+
          ' AND (A.CODARTIGO = S.CODARTIGO(+)) '+
          ' AND (A.CODARTIGO = CM.CODARTIGO(+)) '+
          ' AND (A.CODARTIGO = QC.CODARTIGO) ';
     if rgOrdena.ItemIndex = 0 then
        sSql:=sSql+' ORDER BY DESCRICAO'
     else
        sSql:=sSql+' ORDER BY A.CODARTIGO';
     qryArtigo.Close;
     qryArtigo.Sql.Clear;
     qryArtigo.Sql.Add(sSql);
     qryArtigo.Open;
     //
     qryInventario.Close;
     qryInventario.SQL.text := 'SELECT ABERTOFECHADO FROM INVENTAR WHERE (IDINVENTARIO = '+IntToStr(iInventario)+')';
     qryInventario.Open;
end;

//

procedure TfrmContagem.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qry.CancelUpdates;
  edSaldo.SetFocus;
end;

procedure TfrmContagem.bbtnConfirmarClick(Sender: TObject);
Var
   sPos : String;
begin
  inherited;
   sPos := trim(qry.FieldByName('CodArtigo').AsString)+' ';
   Try
      StartTransacao;
      AlteraSaldo;
      CommitTransacao;
      qry.Close;
      qry.Open;
      If qry.Locate('CodArtigo',sPos,[LoPartialKey]) Then
         Begin
            If Not qry.Eof Then
                qry.Next;
            dbgrdArtigos.SetFocus;
            edSaldo.SetFocus;
            qry.Edit;
         End;
   Except
       RollbackTransacao;
       MsgDlg('Gravação do Saldo não efetuada','Erro',mtError,[mbOk],0);
       FuncaoGeral.TiraIcone;
       Raise;
   End;
end;

procedure TfrmContagem.dblckcmbArtigoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   sCod :=  trim(LookupTable.FieldByName('CodArtigo').AsString)+' ';
   if not qry.Locate('CODARTIGO',sCod,[loPartialKey])
   then begin
      MsgDlg('Já existe movimentação com esse Artigo. Implantação de Saldo não permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
      FuncaoGeral.TiraIcone;
      exit;
   end;
end;

procedure TfrmContagem.sbSelecionaInvClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
     iInventario:=StrToInt(MontaSelect.ValoresChave[0]);
     FazerQryPrincipal;
     dbgrdArtigos.SetFocus;
     EdNum.Text := MontaSelect.ValoresChave[0];

  end;
end;

procedure TfrmContagem.dbgrdArtigosExit(Sender: TObject);
begin
  inherited;
  if (qryInventario.FieldByName('ABERTOFECHADO').AsString = 'A') and (qry.FieldByName('QTDECONTADA').IsNull) then
  Begin
     qry.Edit;
     qry.FieldByName('QTDECONTADA').AsFloat := qry.FieldByName('SALDOQTDE').AsFloat;
     qry.Post;
  end;
     qry.Edit;
end;

procedure TfrmContagem.rgOrdenaClick(Sender: TObject);
begin
  inherited;
  FazerQryPrincipal;
end;

procedure TfrmContagem.dblcGrupoProdCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  FazerQryPrincipal;
end;

end.
