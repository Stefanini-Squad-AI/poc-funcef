unit FUsuxProcJur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, Db,
  Wwdatsrc, DBTables, Wwquery;

type
  TFrmUsuxProcJur = class(TfrmSairAjuda)
    qryAdvCasa1: TwwQuery;
    qryAdvCasa2: TwwQuery;
    upd: TUpdateSQL;
    qry: TwwQuery;
    ds: TwwDataSource;
    updProcAdv2: TUpdateSQL;
    qryProcAdv2: TwwQuery;
    dsProcAdv2: TwwDataSource;
    Label1: TLabel;
    dblcAdvCasa: TwwDBLookupCombo;
    Label2: TLabel;
    dblcAdvCasa2: TwwDBLookupCombo;
    Panel1: TPanel;
    grdAdv1: TwwDBGrid;
    Panel2: TPanel;
    grdAdv2: TwwDBGrid;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure grdAdv1DblClick(Sender: TObject);
    procedure grdAdv2DblClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    procedure dblcAdvCasaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcAdvCasa2CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure MudaAdv1;
    procedure MudaAdv2;
    function  VerificaAdvs : Boolean;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuxProcJur: TFrmUsuxProcJur;

implementation

uses UMensErro, DBaseDados;

{$R *.DFM}

procedure TFrmUsuxProcJur.FormCreate(Sender: TObject);
begin
  inherited;
  qryAdvCasa1.Open;
  qryAdvCasa2.Open;
end;

procedure TFrmUsuxProcJur.sbtnAdicionarClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  If Not qry.IsEmpty Then
    Begin
       With qry Do
          Begin
            Edit;
            FieldByName('IDADVOGCASA').asString := qryAdvCasa2.FieldByName('IDUSUARIO').asString;
            Post;
           End;
       DtmBaseDados.dbBaseDados.AplicaUpdates([qry,qryProcAdv2]);
       MudaAdv1;
       MudaAdv2;
    End;

end;

procedure TFrmUsuxProcJur.sbtnRemoverClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  If Not qryProcAdv2.IsEmpty Then
    Begin
       With qryProcAdv2 Do
          Begin
            Edit;
            FieldByName('IDADVOGCASA').asString := qryAdvCasa1.FieldByName('IDUSUARIO').asString;
            Post;
          End;
       DtmBaseDados.dbBaseDados.AplicaUpdates([qry,qryProcAdv2]);
       MudaAdv1;
       MudaAdv2;
    End;
end;

procedure TFrmUsuxProcJur.grdAdv1DblClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  sbtnAdicionar.Click;
end;

procedure TFrmUsuxProcJur.grdAdv2DblClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  sbtnRemover.Click;
end;

procedure TFrmUsuxProcJur.sbtnAdicionarTudoClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  qry.First;
  while not(qry.EOF) do
    sbtnAdicionar.Click;
end;

procedure TFrmUsuxProcJur.sbtnRemoverTudoClick(Sender: TObject);
begin
  If Not VerificaAdvs then exit;
  inherited;
  qryProcAdv2.First;
  while not(qryProcAdv2.EOF) do
    sbtnRemover.Click;
end;

procedure TFrmUsuxProcJur.dblcAdvCasaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then MudaAdv1;
end;

procedure TFrmUsuxProcJur.dblcAdvCasa2CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then MudaAdv2;
end;

procedure TFrmUsuxProcJur.MudaAdv1;
begin
     qry.Close;
     qry.ParamByName('pIDUSU').asString  := qryAdvCasa1.FieldByName('IDUSUARIO').asString;
     qry.Open;
end;

procedure TFrmUsuxProcJur.MudaAdv2;
begin
     qryProcAdv2.Close;
     qryProcAdv2.ParamByName('pIDUSU2').asString  := qryAdvCasa2.FieldByName('IDUSUARIO').asString;
     qryProcAdv2.Open;
end;

function TFrmUsuxProcJur.VerificaAdvs : Boolean;
begin
   Result := True;
   If (Trim(dblcAdvCasa.Text) = '') or (Trim(dblcAdvCasa2.Text) = '') Then
      Begin
          MsgDlg('Ambos advogados devem estar selecionados','Atenção',mtWarning,[mbOk],0);
          Result := False;
      End
end;

end.
