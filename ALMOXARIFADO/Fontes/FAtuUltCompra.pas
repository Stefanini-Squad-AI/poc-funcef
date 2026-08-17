unit FAtuUltCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TREdit, wwdblook, Wwkeycb, Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBTables, Db, Wwdatsrc, Wwquery, MontaSelect, IvDictio, IvMulti, IvEMulti;

type
  TfrmAtuUltCompra = class(TfrmOkCancelar)
    grpArtigo: TGroupBox;
    dbgrdArtigos: TwwDBGrid;
    grpSaldo: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedDescProd: TDBEdit;
    IncschArtigo: TwwIncrementalSearch;
    dblckcmbArtigo: TwwDBLookupCombo;
    edPreco: TDBRealEdit;
    dbeUnidade: TDBEdit;
    qry: TwwQuery;
    dsGrid: TwwDataSource;
    qryArtigo: TwwQuery;
    updSaldo: TUpdateSQL;
    qryAux: TwwQuery;
    sbSelecionaItem: TSpeedButton;
    rgOrdena: TRadioGroup;
    qryGrupo: TwwQuery;
    Label7: TLabel;
    dblcGrupoProd: TwwDBLookupCombo;
    qryDESCRICAO: TStringField;
    qryCODARTIGO: TStringField;
    qryCODMEDIDA: TStringField;
    qryVALULTCOMPRA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure AlteraPreco;
    procedure sbSelecionaItemClick(Sender: TObject);
    procedure FazerQryPrincipal;
    procedure dbgrdArtigosExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtuUltCompra: TfrmAtuUltCompra;
  sCod,sSql        : String;
  bIncluiSaldo,bIncluiCusto:Boolean;
  rSaldoAnt,
  rCustoAnt,
  rSaldoAntCM,
  rSaldo,
  rCustoMedio      : Real;
implementation

{$R *.DFM}
uses UMensErro, UFuncaoGeral, USistema, uString,uModulo,uDataBase;

Procedure TfrmAtuUltCompra.AlteraPreco;
var sValor : string;
begin
    { Atualizar Tabela de Artigo }
    sValor := FuncaoGeral.OraNumero(edPreco.Value);
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE ARTIGO SET VALULTCOMPRA = ' + sValor);
    qryAux.SQL.Add('WHERE (RTRIM(CodArtigo) = '''+ qry.FieldbyName('CodArtigo').AsString+''')');
    qryAux.ExecSql;
End;

procedure TfrmAtuUltCompra.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrupo.Close;
  qryGrupo.Open;
  //
  FazerQryPrincipal;
end;
//
procedure TfrmAtuUltCompra.FazerQryPrincipal;
Begin
     //
     qry.Close;
     qry.Sql.Text:=''+
          '  SELECT '+
          '      (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO, '+
          '       A.CODARTIGO, P.CODMEDCUSTO AS CODMEDIDA, A.VALULTCOMPRA '+
          ' FROM '+
          '      ARTIGO A,    '+
          '      PRODUTO P    '+
          ' WHERE ';
     qry.SQL.Add('     (RTRIM(P.CODGRUPOPROD) = '''+dblcGrupoProd.LookupValue+''')');
     qry.SQL.Add(' AND (P.CODPRODUTO = A.CODPRODUTO)');
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
          '    PRODUTO P  '+
          ' WHERE (P.CODPRODUTO = A.CODPRODUTO)';
     if rgOrdena.ItemIndex = 0 then
        sSql:=sSql+' ORDER BY DESCRICAO'
     else
        sSql:=sSql+' ORDER BY A.CODARTIGO';
     qryArtigo.Close;
     qryArtigo.Sql.Clear;
     qryArtigo.Sql.Add(sSql);
     qryArtigo.Open;
end;

//

procedure TfrmAtuUltCompra.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qry.CancelUpdates;
  edPreco.SetFocus;
end;

procedure TfrmAtuUltCompra.bbtnConfirmarClick(Sender: TObject);
Var
   sPos : String;
begin
  inherited;
   sPos := trim(qry.FieldByName('CodArtigo').AsString)+' ';
   Try
      StartTransacao;
      AlteraPreco;
      CommitTransacao;
      qry.Close;
      qry.Open;
      If qry.Locate('CodArtigo',sPos,[LoPartialKey]) Then
         Begin
            If Not qry.Eof Then
                qry.Next;
            dbgrdArtigos.SetFocus;
            edPreco.SetFocus;
            qry.Edit;
         End;
   Except
       RollbackTransacao;
       MsgDlg('Gravação de Preço não efetuada','Erro',mtError,[mbOk],0);
       Raise;
   End;
end;

procedure TfrmAtuUltCompra.sbSelecionaItemClick(Sender: TObject);
begin
  inherited;
  FazerQryPrincipal;
  dbgrdArtigos.SetFocus;
end;

procedure TfrmAtuUltCompra.dbgrdArtigosExit(Sender: TObject);
begin
  inherited;
  qry.Edit;
end;

end.
