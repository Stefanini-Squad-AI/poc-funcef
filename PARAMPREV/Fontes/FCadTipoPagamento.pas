unit FCadTipoPagamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, DBCtrls, Mask, CmEventosCadastro, ImgList;

type
  TfrmCadTipoPagamento = class(TfrmCadastroCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbedNome: TDBEdit;
    qryPeriodicidade: TwwQuery;
    dbrgrpTpPagto: TDBRadioGroup;
    lbPeriodicidade: TLabel;
    dblkcmbPeriodicidade: TwwDBLookupCombo;
    lblQtdeMeses: TLabel;
    dbedQtdeMeses: TDBEdit;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure dbrgrpTpPagtoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoPagamento: TfrmCadTipoPagamento;

implementation

uses UMensErro, UDataBase, usistema;

{$R *.DFM}

procedure TfrmCadTipoPagamento.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedNome.SetFocus;
end;

procedure TfrmCadTipoPagamento.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedNome.SetFocus;

  if qry.fieldbyname('FlgFrequencia').asString = 'U'
  then begin // Pagamento Unico
     lbPeriodicidade.Visible      := False;
     dblkcmbPeriodicidade.Visible := False;
     dblkcmbPeriodicidade.Text    := '';
     lblQtdeMeses.Visible         := False;
     dbedQtdeMeses.Visible        := False;
     dbedQtdeMeses.Text           := '';
  end
  else if Qry.fieldbyname('FlgFrequencia').asString = 'I' // Indeterminado
       then begin
          lbPeriodicidade.Visible      := True;
          dblkcmbPeriodicidade.Visible := True;
          qryPeriodicidade.Locate('IDTPPERIODICIDADE', qry.FieldByName('IDTPPERIODICIDADE').AsInteger,[]);
          dblkcmbPeriodicidade.Text    := qryPeriodicidade.FieldbyName('Nome').AsString;
          lblQtdeMeses.Visible         := False;
          dbedQtdeMeses.Visible        := False;
          dbedQtdeMeses.Text           := '';
       end
       else begin // Determinado
          lbPeriodicidade.Visible      := True;
          dblkcmbPeriodicidade.Visible := True;
          qryPeriodicidade.Locate('IDTPPERIODICIDADE', qry.FieldByName('IDTPPERIODICIDADE').AsInteger,[]);
          dblkcmbPeriodicidade.Text    := qryPeriodicidade.FieldbyName('Nome').AsString;
          lblQtdeMeses.Visible         := True;
          dbedQtdeMeses.Visible        := True;
          dbedQtdeMeses.Text           := '';
       end;


end;

procedure TfrmCadTipoPagamento.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    With qry do
    begin
      Close;
      qry.ParamByName('IDTPPAGTOBENEFIC').Value := StrToInt(MontaSelect.ValoresChave[0]);
      Open;
    end
  end;
end;


procedure TfrmCadTipoPagamento.CmeCadastroConfirma(Sender: TObject);
var
  ssql : string;
begin

  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadTipoPagamento.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if Trim(dbedNome.Text) = ''
  then begin
    MsgDlg('Descrição da Forma de Pagamento do Benefício não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  if dbrgrpTpPagto.ItemIndex = -1
  then begin
    MsgDlg('Tipo de Pagamento não selecionado.','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  if (((dbrgrpTpPagto.ItemIndex = 1) or (dbrgrpTpPagto.ItemIndex = 2)) and (Trim(dblkcmbPeriodicidade.Text) = ''))
  then begin
    MsgDlg('Periodicidade não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  if (dbrgrpTpPagto.ItemIndex = 2) and (Trim(dbedQtdeMeses.Text) = '')
  then begin
    MsgDlg('Quantidade de Meses não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  
  if dbrgrpTpPagto.ItemIndex = 0
  
  then qry.Fieldbyname('IDTPPERIODICIDADE').Clear;

  if (dbrgrpTpPagto.ItemIndex = 0) or (dbrgrpTpPagto.ItemIndex = 1)
  then qry.Fieldbyname('FLGPRAZOCERTO').AsInteger := 0
  else qry.Fieldbyname('FLGPRAZOCERTO').AsInteger := 1;

  if qry.State = dsInsert
  then qry.FieldByName('IDTPPAGTOBENEFIC').AsInteger := LeUltRegistro(nil,'TPPAGTOBENEFICIO');

end;

procedure TfrmCadTipoPagamento.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDTPPAGTOBENEFIC').Value := 0;
  qry.Open;

  qryPeriodicidade.Close;
  qryPeriodicidade.Open;
end;

procedure TfrmCadTipoPagamento.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qry.Active then Exit;

  if Qry.fieldbyname('FlgFrequencia').asString = 'U'
  then begin // Pagamento Unico
     lbPeriodicidade.Visible      := False;
     dblkcmbPeriodicidade.Visible := False;
     dblkcmbPeriodicidade.Text    := '';
     lblQtdeMeses.Visible         := False;
     dbedQtdeMeses.Visible        := False;
     dbedQtdeMeses.Text           := '';
  end
  else if Qry.fieldbyname('FlgFrequencia').asString = 'I' // Indeterminado
       then begin
          lbPeriodicidade.Visible      := True;
          dblkcmbPeriodicidade.Visible := True;
          qryPeriodicidade.Locate('IDTPPERIODICIDADE', qry.FieldByName('IDTPPERIODICIDADE').AsInteger,[]);
          dblkcmbPeriodicidade.Text    := qryPeriodicidade.FieldbyName('Nome').AsString;
          lblQtdeMeses.Visible         := False;
          dbedQtdeMeses.Visible        := False;
          dbedQtdeMeses.Text           := '';
       end
       else begin // Determinado
          lbPeriodicidade.Visible      := True;
          dblkcmbPeriodicidade.Visible := True;
          qryPeriodicidade.Locate('IDTPPERIODICIDADE', qry.FieldByName('IDTPPERIODICIDADE').AsInteger,[]);
          dblkcmbPeriodicidade.Text    := qryPeriodicidade.FieldbyName('Nome').AsString;
          lblQtdeMeses.Visible         := True;
          dbedQtdeMeses.Visible        := True;
          dbedQtdeMeses.Text           := '';
       end;
end;

procedure TfrmCadTipoPagamento.dbrgrpTpPagtoClick(Sender: TObject);
begin
  inherited;

  if dbrgrpTpPagto.ItemIndex = 0
  then begin // Pagamento Unico
     lbPeriodicidade.Visible      := False;
     dblkcmbPeriodicidade.Visible := False;
     dblkcmbPeriodicidade.Text    := '';
     lblQtdeMeses.Visible         := False;
     dbedQtdeMeses.Visible        := False;
     dbedQtdeMeses.Text           := '';
  end
  else if dbrgrpTpPagto.ItemIndex = 1 // Indeterminado
       then begin
          lbPeriodicidade.Visible      := True;
          dblkcmbPeriodicidade.Visible := True;
          qryPeriodicidade.Locate('IDTPPERIODICIDADE', qry.FieldByName('IDTPPERIODICIDADE').AsInteger,[]);
          dblkcmbPeriodicidade.Text    := qryPeriodicidade.FieldbyName('Nome').AsString;
          lblQtdeMeses.Visible         := False;
          dbedQtdeMeses.Visible        := False;
          dbedQtdeMeses.Text           := '';
       end
       else begin // Determinado
          lbPeriodicidade.Visible      := True;
          dblkcmbPeriodicidade.Visible := True;
          qryPeriodicidade.Locate('IDTPPERIODICIDADE', qry.FieldByName('IDTPPERIODICIDADE').AsInteger,[]);
          dblkcmbPeriodicidade.Text    := qryPeriodicidade.FieldbyName('Nome').AsString;
          lblQtdeMeses.Visible         := True;
          dbedQtdeMeses.Visible        := True;
          dbedQtdeMeses.Text           := '';
       end;
end;

procedure TfrmCadTipoPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  qryPeriodicidade.Close;
  qryPeriodicidade.Open;

end;

end.
