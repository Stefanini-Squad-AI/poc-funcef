unit FBalPatrSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBClient,
  uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, wwdblook,
  uCtrlRptDemonstrativo, uCtrlPadroes, uSistema, uMensErro;

type
  TFrmBalPatrSPC = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    cboExercicio: TwwDBLookupCombo;
    cboPerFinal: TwwDBLookupCombo;
    Edit1: TEdit;
    Panel2: TPanel;
    chk1000: TCheckBox;
    PageControl: TPageControl;
    tbsPlano: TTabSheet;
    GridPlano: TwwDBGrid;
    Panel3: TPanel;
    btMarcaTodosPlano: TSpeedButton;
    btInverteSelecaoPlano: TSpeedButton;
    tbsPatro: TTabSheet;
    GridPatro: TwwDBGrid;
    Panel4: TPanel;
    btMarcaTodosPatro: TSpeedButton;
    btInverteSelecaoPatro: TSpeedButton;
    CdsPeriodo: TCMClientDataSet;
    CdsExercicio: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    dsPlano: TDataSource;
    dsPatro: TDataSource;
    CdsPatro: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btMarcaTodosPlanoClick(Sender: TObject);
    procedure btInverteSelecaoPlanoClick(Sender: TObject);
    procedure btMarcaTodosPatroClick(Sender: TObject);
    procedure btInverteSelecaoPatroClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cboPerFinalEnter(Sender: TObject);
    procedure CdsPlanoAfterScroll(DataSet: TDataSet);
    procedure CdsPlanoAfterOpen(DataSet: TDataSet);
    procedure CdsPatroAfterOpen(DataSet: TDataSet);
    procedure CdsPatroAfterScroll(DataSet: TDataSet);
    procedure GridPatroCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridPatroTopRowChanged(Sender: TObject);
  private
    { Private declarations }
    CtrlDemonstrativo : TCtrlRptDemonstrativo;


    function VerificaPreenchimento: boolean;

  public
    { Public declarations }
  end;

var
  FrmBalPatrSPC: TFrmBalPatrSPC;

implementation

{$R *.DFM}

procedure TFrmBalPatrSPC.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDemonstrativo    := TCtrlRptDemonstrativo.Create;
  CtrlDemonstrativo.InitializeAs(Padroes);

  CdsPlano.Data               := CtrlDemonstrativo.ListaPlano;
  CdsPatro.Data               := CtrlDemonstrativo.ListaPatro;
  CdsExercicio.Data           := CtrlDemonstrativo.ListaExercicio(Sistema.IdEmpresa);
  CdsPeriodo.Data             := CtrlDemonstrativo.ListaPeriodo(Sistema.IdEmpresa,-1);
  PageControl.ActivePageIndex := 0;
end;




procedure TFrmBalPatrSPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlDemonstrativo);
  inherited;

end;




procedure TFrmBalPatrSPC.btMarcaTodosPlanoClick(Sender: TObject);
begin
  inherited;
  try
     CdsPlano.DisableControls;
     CdsPlano.First;
     while not CdsPlano.Eof do
     begin
        CdsPlano.Edit;
        CdsPlano.FieldByName('SELECIONA').AsString := 'S';
        CdsPlano.Post;
        CdsPlano.Next;
     end;

  finally
     CdsPlano.EnableControls;
  end;
end;




procedure TFrmBalPatrSPC.btInverteSelecaoPlanoClick(Sender: TObject);
begin
  inherited;
  try
     CdsPlano.DisableControls;
     CdsPlano.First;
     while not CdsPlano.Eof do
     begin
        CdsPlano.Edit;
        if CdsPlano.FieldByName('SELECIONA').AsString = 'S' then
           CdsPlano.FieldByName('SELECIONA').AsString := 'N'
        else
           CdsPlano.FieldByName('SELECIONA').AsString := 'S';

        CdsPlano.Post;
        CdsPlano.Next;
     end;

  finally
     CdsPlano.EnableControls;
  end;
end;




procedure TFrmBalPatrSPC.btMarcaTodosPatroClick(Sender: TObject);
begin
  inherited;
   try
     CdsPatro.DisableControls;
     CdsPatro.First;
     while not CdsPatro.Eof do
     begin
        CdsPatro.Edit;
        CdsPatro.FieldByName('SELECIONA').AsString := 'S';
        CdsPatro.Post;
        CdsPatro.Next;
     end;

  finally
     CdsPatro.EnableControls;
  end;
end;




procedure TFrmBalPatrSPC.btInverteSelecaoPatroClick(Sender: TObject);
begin
  inherited;
  try
     CdsPatro.DisableControls;
     CdsPatro.First;
     while not CdsPatro.Eof do
     begin
        CdsPatro.Edit;
        if CdsPatro.FieldByName('SELECIONA').AsString = 'S' then
           CdsPatro.FieldByName('SELECIONA').AsString := 'N'
        else
           CdsPatro.FieldByName('SELECIONA').AsString := 'S';

        CdsPatro.Post;
        CdsPatro.Next;
     end;

  finally
     CdsPatro.EnableControls;
  end;
end;




function TFrmBalPatrSPC.VerificaPreenchimento: boolean;
begin
   Result := False;
   if Trim(cboExercicio.Text) = '' then
   begin
      MsgDlg('É necessário informar o exercício!','Aviso',mtWarning,[mbOk],0);
      cboExercicio.SetFocus;
      Exit;
   end;

   if Trim(cboPerFinal.Text) = '' then
   begin
      MsgDlg('É necessário informar o período final!','Aviso',mtWarning,[mbOk],0);
      cboPerFinal.SetFocus;
      Exit;
   end;

   Result := true;
end;




procedure TFrmBalPatrSPC.bbtnConfirmarClick(Sender: TObject);
var
 sPlano, sPatro: string;
begin
  inherited;
  if not VerificaPreenchimento then
  begin
     ModalResult := mrNone;
     Exit;
  end;

  // Pega os Planos selecionados...
  CdsPlano.First;
  while not CdsPlano.Eof do
  begin
     if CdsPlano.FieldByName('SELECIONA').AsString = 'S' then
     begin
        if Trim(sPlano) <> '' then
           sPlano := sPlano + ',' + CdsPlano.FieldByName('IDPLANOPREV').AsString
        else
           sPlano := CdsPlano.FieldByName('IDPLANOPREV').AsString;
     end;

     CdsPlano.Next;
  end;


  // Pega as Platros selecionadas...
  CdsPatro.First;
  while not CdsPatro.Eof do
  begin
     if CdsPatro.FieldByName('SELECIONA').AsString = 'S' then
     begin
        if Trim(sPatro) <> '' then
           sPatro := sPatro + ',' + CdsPatro.FieldByName('IDPATRO').AsString
        else
           sPatro := CdsPatro.FieldByName('IDPATRO').AsString;
     end;

     CdsPatro.Next;
  end;


  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString  := cboExercicio.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString  := cboPerFinal.LookupValue;
  Cmp_Padrao.ParamValues[2].AsBoolean := chk1000.Checked;
  Cmp_Padrao.ParamValues[4].AsString  := sPlano;
  Cmp_Padrao.ParamValues[5].AsString  := sPatro;
end;




procedure TFrmBalPatrSPC.cboPerFinalEnter(Sender: TObject);
begin
  inherited;
  CdsPeriodo.Data := CtrlDemonstrativo.ListaPeriodo(Sistema.IdEmpresa,CdsExercicio.FieldByName('PEREXERCICIO').AsInteger);
end;




procedure TFrmBalPatrSPC.CdsPlanoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Trim(DataSet.FieldByName('SELECIONA').AsString) = '' then
     DataSet.FieldByName('SELECIONA').ReadOnly := True
  else
     DataSet.FieldByName('SELECIONA').ReadOnly := False;
end;




procedure TFrmBalPatrSPC.CdsPlanoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TStringField(CdsPlano.FieldByName('NOME')).ReadOnly := True;
end;




procedure TFrmBalPatrSPC.CdsPatroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TStringField(CdsPatro.FieldByName('NOME')).ReadOnly := True;
end;




procedure TFrmBalPatrSPC.CdsPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Trim(DataSet.FieldByName('SELECIONA').AsString) = '' then
     DataSet.FieldByName('SELECIONA').ReadOnly := True
  else
     DataSet.FieldByName('SELECIONA').ReadOnly := False;
end;




procedure TFrmBalPatrSPC.GridPatroCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TFrmBalPatrSPC.GridPatroTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBgrid).Invalidate;
end;

end.
