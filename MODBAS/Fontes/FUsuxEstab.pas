unit FUsuxEstab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TFrmUsuxEstab = class(TfrmCadastroCS)
    qryEstab: TwwQuery;
    dsEstab: TwwDataSource;
    updEstab: TUpdateSQL;
    qryEstabIDFILIALPESSOA: TFloatField;
    qryEstabNOME: TStringField;
    Label1: TLabel;
    Bevel1: TBevel;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    grgEstab: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    edNomeUsu: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure grgEstabDblClick(Sender: TObject);
    procedure grdTranfDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    iIdUsu: LongInt;

    procedure SelEstab(idUsu, idEmpresa: LongInt);
    procedure SelUsu(idUsu: LongInt);
  end;

var
  FrmUsuxEstab: TFrmUsuxEstab;

implementation

{$R *.DFM}

uses {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
  uSistema, uMensErro, dBaseDados;

procedure TFrmUsuxEstab.SelEstab(idUsu, idEmpresa: LongInt);
begin
  qryEstab.Close;
  qryEstab.ParamByName('IDUSUARIO').Value := idUsu;
  qryEstab.ParamByName('IDEMPRESA').Value := idEmpresa;
  qryEstab.Open;
end;

procedure TFrmUsuxEstab.SelUsu(idUsu: LongInt);
begin
  qry.Close;
  qry.ParamByName('IDUSUARIO').asInteger := idUsu;
  qry.Open;
end;

procedure TFrmUsuxEstab.FormCreate(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := false;
  iIdUsu := -1;
  SelUsu(-1);
  SelEstab(-1, -1);
  edNomeUsu.Text := '';
end;

procedure TFrmUsuxEstab.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    SelUsu(StrToInt(MontaSelect.ValoresChave[0]));
    SelEstab(StrToInt(MontaSelect.ValoresChave[0]), Sistema.IdEmpresa);

    iIdUsu := StrToInt(MontaSelect.ValoresChave[0]);
    edNomeUsu.Text := '  ' + MontaSelect.ValoresChave[1];
  end;
end;

procedure TFrmUsuxEstab.CmeCadastroInsert(Sender: TObject);
begin
  if (Trim(edNomeUsu.Text) = '') then
  begin
    MsgDlg('Não há Usuário selecionado.', 'Atenção', mtWarning, [mbOk], 0);
    bbtnCancelar.Click;
  end;
end;

procedure TFrmUsuxEstab.sbtnAdicionarClick(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao in [opInserir, opAlterar]) then
  begin
    if not(qryEstab.IsEmpty) then
    begin
      with (qry) do
      begin
        Append;
        FieldByName('IDFILIALPESSOA').asString := qryEstab.FieldByName('IDFILIALPESSOA').asString;
        //FieldByName('IDUSUARIO').asInteger     := qryEstab.FieldByName('IDUSUARIO').asInteger;
        FieldByName('NOME').asString           := qryEstab.FieldByName('NOME').asString;
      end;
      qryEstab.Delete;
    end;
  end;
end;

procedure TFrmUsuxEstab.CmeCadastroConfirma(Sender: TObject);
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
    qryEstab.CancelUpdates;
    SelEstab(StrToInt(MontaSelect.ValoresChave[0]), Sistema.IdEmpresa);

    dtmBaseDados.dbBaseDados.AplicaUpdates([qry]);
  end;
end;

procedure TFrmUsuxEstab.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if (Trim(edNomeUsu.Text) <> '') then
  begin
    SelUsu(iIdUsu);
    SelEstab(iIdUsu, Sistema.IdEmpresa);
  end
  else
  begin
    SelUsu(-1);
    SelEstab(-1, -1);
    edNomeUsu.Text := '';
  end;
end;

procedure TFrmUsuxEstab.sbtnRemoverClick(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao in [opInserir,opAlterar]) then
  begin
    if not(qry.IsEmpty) then
    begin
      with (qryEstab) do
      begin
        Append;
        FieldByName('IDFILIALPESSOA').asString := qry.FieldByName('IDFILIALPESSOA').asString;
        //FieldByName('IDEMPRESA').asInteger     := qry.FieldByName('IDEMPRESA').asInteger;
        FieldByName('NOME').asString           := qry.FieldByName('NOME').asString;
      end;
      qry.Delete;
    end;
  end;
end;

procedure TFrmUsuxEstab.grgEstabDblClick(Sender: TObject);
begin
  inherited;
  sbtnAdicionar.Click;
end;

procedure TFrmUsuxEstab.grdTranfDblClick(Sender: TObject);
begin
  inherited;
  sbtnRemover.Click;
end;

procedure TFrmUsuxEstab.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmUsuxEstab.sbtnAdicionarTudoClick(Sender: TObject);
begin
  inherited;
  qryEstab.First;
  while not(qryEstab.EOF) do
    sbtnAdicionar.Click;
end;

procedure TFrmUsuxEstab.sbtnRemoverTudoClick(Sender: TObject);
begin
  inherited;
  qry.First;
  while not(qry.EOF) do
    sbtnRemover.Click;
end;

end.
