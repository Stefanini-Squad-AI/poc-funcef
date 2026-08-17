unit FParamDemoSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, ComCtrls,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBClient, uCMClientDataSet,
  uCtrlPadroes, uCtrlRptDemonstrativo, uSistema, uMensErro;

type
  TFrmParamDemoSPC = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    Label2: TLabel;
    cboExercicio: TwwDBLookupCombo;
    Label1: TLabel;
    cboPerFinal: TwwDBLookupCombo;
    Panel2: TPanel;
    PageControl: TPageControl;
    tbsPlano: TTabSheet;
    tbsPatro: TTabSheet;
    GridPlano: TwwDBGrid;
    GridPatro: TwwDBGrid;
    CdsPlano: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    Panel3: TPanel;
    Panel4: TPanel;
    btMarcaTodosPlano: TSpeedButton;
    btInverteSelecaoPlano: TSpeedButton;
    btMarcaTodosPatro: TSpeedButton;
    btInverteSelecaoPatro: TSpeedButton;
    cbDesconsideraResult: TCheckBox;
    chk1000: TCheckBox;
    CdsPeriodo: TCMClientDataSet;
    CdsExercicio: TCMClientDataSet;
    Edit1: TEdit;
    Label4: TLabel;
    dsPlano: TDataSource;
    dsPatro: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboPerFinalEnter(Sender: TObject);
    procedure btMarcaTodosPlanoClick(Sender: TObject);
    procedure btMarcaTodosPatroClick(Sender: TObject);
    procedure btInverteSelecaoPlanoClick(Sender: TObject);
    procedure btInverteSelecaoPatroClick(Sender: TObject);
    procedure CdsPlanoAfterOpen(DataSet: TDataSet);
    procedure CdsPatroAfterOpen(DataSet: TDataSet);
    procedure GridPlanoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridPlanoTopRowChanged(Sender: TObject);
    procedure CdsPlanoAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlDemonstrativo    : TCtrlRptDemonstrativo;

    function VerificaPreenchimento: boolean;


  public
    { Public declarations }
  end;

var
  FrmParamDemoSPC: TFrmParamDemoSPC;

implementation

{$R *.DFM}

procedure TFrmParamDemoSPC.FormCreate(Sender: TObject);
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




procedure TFrmParamDemoSPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlDemonstrativo);
  inherited;
end;




procedure TFrmParamDemoSPC.cboPerFinalEnter(Sender: TObject);
begin
  inherited;
  CdsPeriodo.Data := CtrlDemonstrativo.ListaPeriodo(Sistema.IdEmpresa,CdsExercicio.FieldByName('PEREXERCICIO').AsInteger);
end;




procedure TFrmParamDemoSPC.btMarcaTodosPlanoClick(Sender: TObject);
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




procedure TFrmParamDemoSPC.btMarcaTodosPatroClick(Sender: TObject);
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




procedure TFrmParamDemoSPC.btInverteSelecaoPlanoClick(Sender: TObject);
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




procedure TFrmParamDemoSPC.btInverteSelecaoPatroClick(Sender: TObject);
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




procedure TFrmParamDemoSPC.CdsPlanoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TStringField(CdsPlano.FieldByName('NOME')).ReadOnly := True;
end;




procedure TFrmParamDemoSPC.CdsPatroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TStringField(CdsPatro.FieldByName('NOME')).ReadOnly := True;
end;




procedure TFrmParamDemoSPC.GridPlanoCalcCellColors(Sender: TObject;
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




procedure TFrmParamDemoSPC.GridPlanoTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TFrmParamDemoSPC.CdsPlanoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Trim(DataSet.FieldByName('SELECIONA').AsString) = '' then
     DataSet.FieldByName('SELECIONA').ReadOnly := True
  else
     DataSet.FieldByName('SELECIONA').ReadOnly := False;
end;




procedure TFrmParamDemoSPC.bbtnConfirmarClick(Sender: TObject);
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
  Cmp_Padrao.ParamValues[0].AsString   := cboExercicio.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString   := cboPerFinal.LookupValue;
  Cmp_Padrao.ParamValues[2].AsString   := '';
  Cmp_Padrao.ParamValues[3].AsBoolean  := chk1000.Checked;
  Cmp_Padrao.ParamValues[4].AsBoolean  := cbDesconsideraResult.Checked;
  Cmp_Padrao.ParamValues[5].AsString   := sPlano;
  Cmp_Padrao.ParamValues[6].AsString   := sPatro;
end;




function TFrmParamDemoSPC.VerificaPreenchimento: boolean;
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

end.
