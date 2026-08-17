unit FAdvogxProcJur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, Db,
  Wwdatsrc, DBTables, Wwquery, CMProcuraSubTipo, MontaSelect, TB97Ctls;

type
  TfrmAdvogxProcJur = class(TfrmSairAjuda)
    upd: TUpdateSQL;
    qry: TwwQuery;
    ds: TwwDataSource;
    updProcAdv2: TUpdateSQL;
    qryProcAdv2: TwwQuery;
    dsProcAdv2: TwwDataSource;
    Panel1: TPanel;
    grdAdv1: TwwDBGrid;
    Panel2: TPanel;
    grdAdv2: TwwDBGrid;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    EdAdv1: TEdit;
    EdAdv2: TEdit;
    sbtnProcurar1: TToolbarButton97;
    sbtnProcurar2: TToolbarButton97;
    MontaSelect1: TMontaSelect;
    MontaSelect2: TMontaSelect;
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure grdAdv1DblClick(Sender: TObject);
    procedure grdAdv2DblClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    procedure MudaAdv1;
    procedure MudaAdv2;
    function  VerificaAdvs : Boolean;
    procedure sbtnProcurar1Click(Sender: TObject);
    procedure sbtnProcurar2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdvogxProcJur: TfrmAdvogxProcJur;

implementation

uses UMensErro, DBaseDados;

{$R *.DFM}

procedure TfrmAdvogxProcJur.sbtnAdicionarClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  If Not qry.IsEmpty Then
    Begin
       With qry Do
          Begin
            Edit;
            FieldByName('IDADVOGRECDA').asString := MontaSelect2.ValoresChave[0];
            Post;
           End;
       DtmBaseDados.dbBaseDados.AplicaUpdates([qry,qryProcAdv2]);
       MudaAdv1;
       MudaAdv2;
    End;

end;

procedure TfrmAdvogxProcJur.sbtnRemoverClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  If Not qryProcAdv2.IsEmpty Then
    Begin
       With qryProcAdv2 Do
          Begin
            Edit;
            FieldByName('IDADVOGRECDA').asString := MontaSelect1.ValoresChave[0];
            Post;
          End;
       DtmBaseDados.dbBaseDados.AplicaUpdates([qry,qryProcAdv2]);
       MudaAdv1;
       MudaAdv2;
    End;
end;

procedure TfrmAdvogxProcJur.grdAdv1DblClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  sbtnAdicionar.Click;
end;

procedure TfrmAdvogxProcJur.grdAdv2DblClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  sbtnRemover.Click;
end;

procedure TfrmAdvogxProcJur.sbtnAdicionarTudoClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  qry.First;
  while not(qry.EOF) do
    sbtnAdicionar.Click;
end;

procedure TfrmAdvogxProcJur.sbtnRemoverTudoClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  qryProcAdv2.First;
  while not(qryProcAdv2.EOF) do
    sbtnRemover.Click;
end;

procedure TfrmAdvogxProcJur.MudaAdv1;
begin
     qry.Close;
     qry.ParamByName('pIDUSU').asString  := MontaSelect1.ValoresChave[0];
     qry.Open;
end;

procedure TfrmAdvogxProcJur.MudaAdv2;
begin
     qryProcAdv2.Close;
     qryProcAdv2.ParamByName('pIDUSU2').asString  := MontaSelect2.ValoresChave[0];
     qryProcAdv2.Open;
end;

function TfrmAdvogxProcJur.VerificaAdvs : Boolean;
begin
   Result := True;
   If (Trim(EdAdv1.Text) = '') or (Trim(EdAdv2.Text) = '') Then
      Begin
          MsgDlg('Ambos advogados devem estar selecionados','Atenção',mtWarning,[mbOk],0);
          Result := False;
      End
end;

procedure TfrmAdvogxProcJur.sbtnProcurar1Click(Sender: TObject);
begin
  inherited;
  MontaSelect1.Executar;
  sbtnProcurar1.down := false;

  if (MontaSelect1.ValoresChave.Count > 0) and (MontaSelect1.ValoresChave[0] <> '') then
  begin
     EdAdv1.Text := MontaSelect1.ValoresChave[1];
     MudaAdv1;
  end;

end;

procedure TfrmAdvogxProcJur.sbtnProcurar2Click(Sender: TObject);
begin
  inherited;
  MontaSelect2.Executar;
  sbtnProcurar2.down := false;

  if (MontaSelect2.ValoresChave.Count > 0) and (MontaSelect2.ValoresChave[0] <> '') then
  begin
     EdAdv2.Text := MontaSelect2.ValoresChave[1];
     MudaAdv2;
  end;

end;

end.
