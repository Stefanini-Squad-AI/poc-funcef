// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 14.10.2003
// Alteração   : Retirada de campos que não fazem sentido para assistencial
//------------------------------------------------------------------------------
unit FCadContribuicaoCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, ExtCtrls, DBCtrls, Mask, wwdbedit,
  CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, wwdblook;

type
  TfrmCadContribuicaoCS = class(TfrmCadastroCS)
    dsTpPer: TwwDataSource;
    qryTpPer: TwwQuery;
    lbPeriodicidade: TLabel;
    lbqtdeParcelas: TLabel;
    Label1: TLabel;
    dbedQtdParcela: TwwDBEdit;
    dbedNomeContrib: TwwDBEdit;
    chkTmpContrib: TCheckBox;
    dblkcmbPeriodicidade: TwwDBLookupCombo;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbedNomeResum: TwwDBEdit;
    procedure chkTmpContribClick(Sender: TObject);
    procedure dbedQtdParcelaEnter(Sender: TObject);
//    procedure qryAfterCancel(DataSet: TDataSet);
    procedure chkTmpContribEnter(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    vTmpContribCheched : Boolean;
    procedure ArrumaTObrigatoria;
    procedure ArrumaTFacultativa;

  public
    { Public declarations }
  end;

var
  frmCadContribuicaoCS: TfrmCadContribuicaoCS;

implementation

uses UDataBase, UMensErro;

{$R *.DFM}

procedure TfrmCadContribuicaoCS.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor
  then begin
     qry.Close;
     qry.ParamByName('IDCONTRIBUICAO').AsInteger := StrToIntDef(MontaSelect.ValoresChave[0],0);
     qry.Open;

     if qry.fieldbyname('FlgObrigatoria').AsString = 'E'
     then ArrumaTFacultativa
     else ArrumaTObrigatoria;

  end;
end;

procedure TfrmCadContribuicaoCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedNomeContrib.SetFocus;

end;

procedure TfrmCadContribuicaoCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedNomeContrib.SetFocus;
end;


// ROTINAS INTERNAS
procedure TfrmCadContribuicaoCS.ArrumaTFacultativa;
begin
     lbPeriodicidade.Visible      := False;
     dblkcmbPeriodicidade.Visible := False;
     chkTmpContrib.Visible        := False;
     lbQtdeParcelas.Visible       := False;
     dbedQtdParcela.Visible       := False;
     dblkcmbPeriodicidade.Text    := '';
     qryTpPer.close;
     qryTpPer.Open;
     chkTmpContrib.Checked        := False;
     dbedQtdParcela.Text          := '';
end;

procedure TfrmCadContribuicaoCS.ArrumaTObrigatoria;
begin
  lbPeriodicidade.Visible      := True;
  dblkcmbPeriodicidade.Visible := True;
  chkTmpContrib.Visible        := True;
  lbQtdeParcelas.Visible       := True;
  dbedQtdParcela.Visible       := True;
  vTmpContribCheched           := qry.FieldByName('QTDEPARCELAS').AsInteger <> 0;
  chkTmpContrib.Checked        := qry.FieldByName('QTDEPARCELAS').AsInteger <> 0;
  if not chkTmpContrib.Checked then
  begin
     lbQtdeParcelas.Visible       := False;
     dbedQtdParcela.Visible       := False;
  end;
end;

procedure TfrmCadContribuicaoCS.chkTmpContribClick(Sender: TObject);
begin
  inherited;
  if not (ds.DataSet.State in [dsEdit,dsInsert]) then
     chkTmpContrib.Checked := vTmpContribCheched
  else begin
     lbQtdeParcelas.Visible := chkTmpContrib.Checked;
     dbedQtdParcela.Visible := chkTmpContrib.Checked;
  end;

end;

procedure TfrmCadContribuicaoCS.dbedQtdParcelaEnter(Sender: TObject);
begin
  inherited;
  lbQtdeParcelas.Visible := chkTmpContrib.Checked;
  dbedQtdParcela.Visible := chkTmpContrib.Checked;

end;

{procedure TfrmCadContribuicaoCS.qryAfterCancel(DataSet: TDataSet);
begin
  inherited;
/  if qry.fieldbyname('FlgObrigatoria').AsString = 'E'
  then ArrumaTFacultativa
  else ArrumaTObrigatoria;

end;
}
procedure TfrmCadContribuicaoCS.chkTmpContribEnter(Sender: TObject);
begin
  inherited;
  if not (ds.DataSet.State in [dsEdit,dsInsert]) then
    vTmpContribCheched := chkTmpContrib.Checked
end;


procedure TfrmCadContribuicaoCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dbedNomeContrib.Text = '' then
  begin
    MsgDlg('Descrição da Contribuição não preenchido','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;



  if (dblkcmbPeriodicidade.Text = '') then
  begin
    MsgDlg('Periodicidade não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  if (chkTmpContrib.Checked) and
     (dbedQtdParcela.Text = '') then
  begin
    MsgDlg('Quantidade de Parcelas não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;


  if (not chkTmpContrib.checked)
  then //qry.Fieldbyname('QTDEPARCELAS').AsString      := '';
       qry.Fieldbyname('QTDEPARCELAS').Clear;

  if dblkcmbPeriodicidade.Text = '' then
     //qry.FieldByName('IDTPPERIODICIDADE').AsString := '';
       qry.FieldByName('IDTPPERIODICIDADE').Clear;

  QRY.FIELDBYNAME('FLGOBRIGATORIA').AsString := 'O'; // CAMILLE - 14.10.2003

  if qry.State = dsInsert
  then begin
     try
       qry.FieldByName('IDCONTRIBUICAO').AsInteger := LeUltRegistro(nil,'CONTRIBUICAO');
     except
       ShowMessage('Erro na geração do código');
     end;
  end;

end;

procedure TfrmCadContribuicaoCS.FormActivate(Sender: TObject);
begin
  inherited;
  qryTpPer.close;
  qryTpPer.Open;

end;

end.
