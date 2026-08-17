{ --------------------------------------------------------------------------------------------------
Rotina......: Create
Nº SOL......: 132992, 132743
Nº KINTANA..: 770843, 767392
Data........: 10/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração dos IdReports de 20404->20406 e 20405->20407
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 132742, 132741, 132744, 132758, 132992, 132743
Nº KINTANA..: 767273, 767272, 767396, 767599, 770843, 767392
Data........: 21/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Unit de parâmetros dos relatórios para atender a CGPC28
---------------------------------------------------------------------------------------------------}
unit fParamCGPC28;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, Db, DBClient, uCMClientDataSet,
  uCtrlPadroes, uSistema, uCtrlRptCGPC28, Spin;

type
  TfrmParamCGPC28 = class(TfrmParamReports_Padrao)
    CdsPlano: TCMClientDataSet;
    dsPlano: TDataSource;
    CdsPatro: TCMClientDataSet;
    dsPatro: TDataSource;
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
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkMes: TwwDBLookupCombo;
    CdsExercicio: TCMClientDataSet;
    CdsPeriodo: TCMClientDataSet;
    chkMovimentacao: TCheckBox;
    chkRMil: TCheckBox;
    Label10: TLabel;
    spnPagIni: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btMarcaTodosPlanoClick(Sender: TObject);
    procedure btInverteSelecaoPlanoClick(Sender: TObject);
    procedure btMarcaTodosPatroClick(Sender: TObject);
    procedure btInverteSelecaoPatroClick(Sender: TObject);
    procedure dblkMesEnter(Sender: TObject);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlRptCGPC28: TCtrlRptCGPC28;
    function VerificaCamposDeTela: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; IdReports: Integer); reintroduce;
  end;

var
  frmParamCGPC28: TfrmParamCGPC28;

implementation

uses UMensErro;

{$R *.DFM}

constructor TfrmParamCGPC28.Create(AOwner: TComponent; IdReports: Integer);
begin
  inherited Create(AOwner);

  case IdReports of
    20400: Caption := 'Demonstração da Mutação do Ativo Líquido por Plano de Benefício';
    20401: Caption := 'Demonstração da Mutação do Ativo Líquido';
    20402: Caption := 'Demonstração do Plano de Gestão Administrativa (Consolidada)';
    20403: Caption := 'Balanço Patrimonial';
    20406: Caption := 'Demonstração das Obrigações Atuariais do Plano de Benefícios';
    20407: Caption := 'Demonstração do Ativo Líquido por Plano de Benefícios';
  end;

end;

procedure TfrmParamCGPC28.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptCGPC28 := TCtrlRptCGPC28.Create;
  CtrlRptCGPC28.InitializeAs(Padroes);

  CdsExercicio.Data := CtrlRptCGPC28.ListaExercicio(Sistema.IdEmpresa);
  CdsPeriodo.Data   := CtrlRptCGPC28.ListaPeriodo(Sistema.IdEmpresa,-1);
  CdsPlano.Data     := CtrlRptCGPC28.ListaPlano;
  CdsPatro.Data     := CtrlRptCGPC28.ListaPatro;

  PageControl.ActivePageIndex := 0;
end;

procedure TfrmParamCGPC28.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptCGPC28.Free;
end;

procedure TfrmParamCGPC28.btMarcaTodosPlanoClick(Sender: TObject);
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

procedure TfrmParamCGPC28.btInverteSelecaoPlanoClick(Sender: TObject);
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

procedure TfrmParamCGPC28.btMarcaTodosPatroClick(Sender: TObject);
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

procedure TfrmParamCGPC28.btInverteSelecaoPatroClick(Sender: TObject);
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

procedure TfrmParamCGPC28.dblkMesEnter(Sender: TObject);
begin
  inherited;
  CdsPeriodo.Data := CtrlRptCGPC28.ListaPeriodo(Sistema.IdEmpresa, StrToIntDef(dblkExercicio.Text, -1));
end;

procedure TfrmParamCGPC28.CdsAfterOpen(DataSet: TDataSet);
begin
  TStringField(DataSet.FieldByName('NOME')).ReadOnly := True;
end;

procedure TfrmParamCGPC28.CdsAfterScroll(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('SELECIONA').AsString) = '' then
    DataSet.FieldByName('SELECIONA').ReadOnly := True
  else
    DataSet.FieldByName('SELECIONA').ReadOnly := False;
end;

procedure TfrmParamCGPC28.GridCalcCellColors(Sender: TObject;
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

procedure TfrmParamCGPC28.bbtnConfirmarClick(Sender: TObject);
var
  sPlanoPrev, sPatro, sFiltro, sFiltroPrev, sFiltroPatro: String;
  bTodosPlanoPrev, bTodosPatro: Boolean;
begin
  inherited;
  if not VerificaCamposDeTela then
  begin
     ModalResult := mrNone;
     Exit;
  end;

  sFiltroPrev := '';
  sPlanoPrev := '';
  bTodosPlanoPrev := True;
  try
    CdsPlano.First;
    CdsPlano.DisableControls;
    while not(CdsPlano.Eof) do
    begin
      if CdsPlano.FieldByName('Seleciona').AsString = 'S' then
      begin
        if sPlanoPrev <> '' then begin
          sPlanoPrev := sPlanoPrev + ',';
          sFiltroPrev := sFiltroPrev + '/';
        end;
        sPlanoPrev := sPlanoPrev + CdsPlano.FieldByName('IdPlanoPrev').AsString;
        sFiltroPrev := sFiltroPrev + CdsPlano.FieldByName('Nome').AsString;
      end
      else
        bTodosPlanoPrev := False;
      CdsPlano.Next;
    end;
  finally
    CdsPlano.First;
    CdsPlano.EnableControls;
  end;

  sFiltroPatro := '';
  sPatro := '';
  bTodosPatro := True;
  try
    CdsPatro.First;
    CdsPatro.DisableControls;
    while not(CdsPatro.Eof) do
    begin
      if CdsPatro.FieldByName('Seleciona').AsString = 'S' then
      begin
        if sPatro <> '' then begin
          sPatro := sPatro + ',';
          sFiltroPatro := sFiltroPatro + '/';
        end;
        sPatro := sPatro + CdsPatro.FieldByName('IdPatro').AsString;
        sFiltroPatro := sFiltroPatro + CdsPatro.FieldByName('Nome').AsString;
      end
      else
        bTodosPatro := False;
      CdsPatro.Next;
    end;
  finally
    CdsPatro.First;
    CdsPatro.EnableControls;
  end;

  sFiltro := '';

  if (sFiltroPatro <> '') and not(bTodosPatro) then begin
    if Pos(',', sPlanoPrev) = 1 then
      sFiltro := sFiltro + 'Patrocinadora: '
    else
      sFiltro := sFiltro + 'Patrocinadoras: ';

    sFiltro := sFiltro + sFiltroPatro;
  end;

  if (sFiltroPrev <> '') and not(bTodosPlanoPrev) then begin
    if sFiltro <> '' then
      sFiltro := sFiltro + ' ';

    if Pos(',', sPatro) = 1 then
      sFiltro := sFiltro + 'Plano: '
    else
      sFiltro := sFiltro + 'Planos: ';

    sFiltro := sFiltro + sFiltroPrev;
  end;

  Cmp_Padrao.ParamByName('Exercicio').AsString     := dblkExercicio.Text;
  Cmp_Padrao.ParamByName('Mes').AsString           := dblkMes.LookupValue;
  Cmp_Padrao.ParamByName('PlanoPrev').AsString     := sPlanoPrev;
  Cmp_Padrao.ParamByName('Patro').AsString         := sPatro;
  Cmp_Padrao.ParamByName('Movimentacao').AsBoolean := chkMovimentacao.Checked;
  Cmp_Padrao.ParamByName('RMil').AsBoolean         := chkRMil.Checked;
  Cmp_Padrao.ParamByName('Filtro').AsString        := sFiltro;
  Cmp_Padrao.ParamByName('PaginaInicial').AsString := spnPagIni.Text;

end;

function TfrmParamCGPC28.VerificaCamposDeTela: Boolean;
begin
   Result := False;

   if dblkExercicio.Text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.', 'Erro', mtError, [mbOk], 0);
      Exit;
   end;

   Result := True;
end;

end.
