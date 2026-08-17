unit fUsuxCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask,
  DBCtrls, wwdbedit, CmEventosCadastro, ImgList;

type
  TFrmUsuxCCusto = class(TfrmCadastroCS)
    Label1: TLabel;
    updCCusto: TUpdateSQL;
    qryCCusto: TwwQuery;
    dsCCusto: TwwDataSource;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    grgCCusto: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    edNomeUsu: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure grgCCustoDblClick(Sender: TObject);
    procedure grdTranfDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    iIdUsu: LongInt;

    procedure SelCCusto(idUsu,idEmpresa: LongInt);
    procedure SelUsu(idUsu,idEmpresa: LongInt);
  end;

var
  FrmUsuxCCusto: TFrmUsuxCCusto;

implementation

{$R *.DFM}

uses {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
  uSistema, uMensErro, dBaseDados;

procedure TFrmUsuxCCusto.FormCreate(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := false;
  iIdUsu := -1;
  SelUsu (-1,-1);
  SelCCusto (-1,-1);
  edNomeUsu.Text := '';
end;

procedure TFrmUsuxCCusto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    SelUsu(StrToInt(MontaSelect.ValoresChave[0]), Sistema.IdEmpresa);
    SelCCusto(StrToInt(MontaSelect.ValoresChave[0]), Sistema.IdEmpresa);

    iIdUsu := StrToInt(MontaSelect.ValoresChave[0]);
    edNomeUsu.Text := '  ' + MontaSelect.ValoresChave[1];
  end;
end;

procedure TFrmUsuxCCusto.CmeCadastroInsert(Sender: TObject);
begin
  if (Trim(edNomeUsu.Text) = '') then
  begin
    MsgDlg('Não há Usuário selecionado!','Atenção',mtWarning,[mbOk],0);
    bbtnCancelar.Click;
  end;
end;

procedure TFrmUsuxCCusto.CmeCadastroConfirma(Sender: TObject);
begin
  if (CmeCadastro.Operacao in [opInserir,opAlterar]) then
  begin
    if not(qry.IsEmpty) then
    begin
      qry.First;
      while not(qry.EOF) do
      begin
        qry.Edit;
        qry.FieldByName('IDUSUARIO').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
        qry.Next;
      end;
    end;
    qryCCusto.CancelUpdates;
    SelCCusto(StrToInt(MontaSelect.ValoresChave[0]), Sistema.IdEmpresa);

    dtmBaseDados.dbBaseDados.AplicaUpdates([qry]);
  end;
end;

procedure TFrmUsuxCCusto.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if (Trim(edNomeUsu.Text) <> '') then
  begin
    SelUsu (iIdUsu, Sistema.IdEmpresa);
    SelCCusto (iIdUsu, Sistema.IdEmpresa);
  end
  else
  begin
    SelUsu (-1, -1);
    SelCCusto (-1, -1);
    edNomeUsu.Text := '';
  end;
end;

procedure TFrmUsuxCCusto.sbtnAdicionarClick(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao in [opInserir,opAlterar]) then
  begin
    if not(qryCCusto.IsEmpty) then
    begin
      with (qry) do
      begin
//        Insert;
        Append;
        FieldByName('CODCENTROCUSTO').asString := qryCCusto.FieldByName('CODCENTROCUSTO').asString;
        FieldByName('IDEMPRESA').asInteger     := qryCCusto.FieldByName('IDEMPRESA').asInteger;
        FieldByName('NOME').asString           := qryCCusto.FieldByName('NOME').asString;
      end;
      qryCCusto.Delete;
    end;
  end;
end;

procedure TFrmUsuxCCusto.sbtnRemoverClick(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao in [opInserir,opAlterar]) then
  begin
    if not(qry.IsEmpty) then
    begin
      with (qryCCusto) do
      begin
//        Insert;
        Append;
        FieldByName('CODCENTROCUSTO').asString := qry.FieldByName('CODCENTROCUSTO').asString;
        FieldByName('IDEMPRESA').asInteger     := qry.FieldByName('IDEMPRESA').asInteger;
        FieldByName('NOME').asString           := qry.FieldByName('NOME').asString;
      end;
      qry.Delete;
    end;
  end;
end;

procedure TFrmUsuxCCusto.grgCCustoDblClick(Sender: TObject);
begin
  inherited;
  sbtnAdicionar.Click;
end;

procedure TFrmUsuxCCusto.grdTranfDblClick(Sender: TObject);
begin
  inherited;
  sbtnRemover.Click;
end;

procedure TFrmUsuxCCusto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmUsuxCCusto.sbtnAdicionarTudoClick(Sender: TObject);
begin
  inherited;
  qryCCusto.First;
  while not(qryCCusto.EOF) do
    sbtnAdicionar.Click;
end;

procedure TFrmUsuxCCusto.sbtnRemoverTudoClick(Sender: TObject);
begin
  inherited;
  qry.First;
  while not(qry.EOF) do
    sbtnRemover.Click;
end;

procedure TFrmUsuxCCusto.SelUsu(idUsu,idEmpresa: LongInt);
begin
  qry.Close;
  qry.ParamByName('IDUSUARIO').asInteger := idUsu;
  qry.Open;
end;

procedure TFrmUsuxCCusto.SelCCusto(idUsu,idEmpresa: LongInt);
begin
  qryCCusto.Close;
  qryCCusto.ParamByName('IDUSUARIO').asInteger := idUsu;
  qryCCusto.ParamByName('IDEMPRESA').asInteger := idEmpresa;
  qryCCusto.Open;
end;

end.
