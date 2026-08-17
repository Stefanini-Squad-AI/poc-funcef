//********************************************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_1
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//******************************************************************************
// Data     : 23/01/2007
// Código   :
// Pendencia: 24254
// SOL      :
// Desc     : Implementação do Altera Plano Contábil e Patrocinadora
//            em 3 camadas
//******************************************************************************
unit FAlteraPatroPlanPrevContabMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid,uctrlinvestimento,uCtrlPadroes,
  uCtrlParamInvest;

type
  TfrmAlteraPatroPlanPrevContabMT = class(TfrmOkCancelarInv)
    wwDBGrid1: TwwDBGrid;
    Cds: TCMClientDataSet;
    Ds: TwwDataSource;
    CdsTipoInvUsu: TCMClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure GeraPlanPrevCtbPatro;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);

  private
    { Private declarations }
    CtrlInvestimento  : TCtrlInvestimento;
  public
    { Public declarations }
  end;

var
  frmAlteraPatroPlanPrevContabMT: TfrmAlteraPatroPlanPrevContabMT;

implementation

//** Vou utilizar ubibliotecainvest enquanto precisar utilizar as varaveis globais
uses FPrincipal,UBibliotecaInvest;

{$R *.DFM}

procedure TfrmAlteraPatroPlanPrevContabMT.FormShow(Sender: TObject);
begin
  //AL_1
  inherited;

  Cds.Data := CtrlInvestimento.ListPlanoPatro;
  CdsTipoInvUsu.Data := CtrlInvestimento.ListTipoInvUsu(CtrlPInv.IDUsuario);
  Cds.Locate('IDPLANPREVCTBPATR',CtrlPInv.IdPlanPrevCtbPatr,[]);

  if wwDBGrid1.CanFocus then
    wwDBGrid1.SetFocus;
end;

procedure TfrmAlteraPatroPlanPrevContabMT.GeraPlanPrevCtbPatro;
begin
  //** Atribuindo dados para a variavel global do sistema, que em breve irá ser extinta
  iPatrocinadora    := Cds.FieldByName('IDPATRO').AsInteger;
  iPlanoPrevContab  := Cds.FieldByName('IDPLANOPREV').AsInteger;
  iPlanPrevCtbPatro := Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger;
  sPlanPrevCtbPatro := Cds.FieldByName('PLANPRVCONTABPATRO').AsString;

  //** Alterando dados do objeto parametros do sistema, após escolha
  CtrlPInv.IdPatrocinadora := Cds.FieldByName('IDPATRO').AsInteger;
  CtrlPInv.IdPlanPrevCtbPatr := Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger;
  CtrlPInv.IdPlanoPrevContab := Cds.FieldByName('IDPLANOPREV').AsInteger;
  CtrlPInv.PlanPrevCtbPatr := Cds.FieldByName('PLANPRVCONTABPATRO').AsString;

  case CtrlPInv.IdTipoInvest of
    1: FrmPrincipal.MudaMenu(CtrlPInv.IdTipoInvest,'F');
    2: FrmPrincipal.MudaMenu(CtrlPInv.IdTipoInvest,'V');
    5: FrmPrincipal.MudaMenu(CtrlPInv.IdTipoInvest,'I');
    6: FrmPrincipal.MudaMenu(CtrlPInv.IdTipoInvest,'I');
    7: FrmPrincipal.MudaMenu(CtrlPInv.IdTipoInvest,'I');
    8: FrmPrincipal.MudaMenu(CtrlPInv.IdTipoInvest,'B');
    9: FrmPrincipal.MudaMenu(CtrlPInv.IdTipoInvest,'I');
    10: FrmPrincipal.MudaMenu(CtrlPInv.IdTipoInvest,'I');
  else  FrmPrincipal.MudaMenu(CtrlPInv.IdTipoInvest,'A');
  end;

  //AL_1
end;

procedure TfrmAlteraPatroPlanPrevContabMT.bbtnConfirmarClick(Sender: TObject);
begin
  //AL_1
  GeraPlanPrevCtbPatro;
  inherited;
end;

procedure TfrmAlteraPatroPlanPrevContabMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlInvestimento := TCtrlInvestimento.Create;
  CtrlInvestimento.InitializeAs(Padroes);
end;

procedure TfrmAlteraPatroPlanPrevContabMT.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  //AL_1
  Cds.Close;
  CdsTipoInvUsu.Close;
  FreeAndNil(CtrlInvestimento);
  inherited;
end;


procedure TfrmAlteraPatroPlanPrevContabMT.wwDBGrid1CalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // Se a Celula atual pertence a linha selecionada
  if (Sender as TwwDBGrid).CalcCellRow = (Sender as TwwDBGrid).GetActiveRow then
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end
  else
  begin
     // Se a celula atual não está selecionada nem fixada
     if (not (gdSelected in State)) and (not (gdFixed in State)) then
     begin
        if not Highlight then
        begin
           // linhas ímpares = amarelo, linhas pares = branco
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              ABrush.Color := $00C0FFFF // amarelo bebê
           else
              ABrush.Color := clWhite;
        end;
     end
     else
     // Se a celula atual é a selecionada
     if State = [gdSelected] then
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

end.
