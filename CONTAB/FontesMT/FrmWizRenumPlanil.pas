unit FrmWizRenumPlanil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  DBCtrls, Grids, Wwdbigrd, Wwdbgrid, Menus, wwriched, Db, Wwdatsrc,
  uCmSqlParams, DBClient, uCMClientDataSet, uCtrlParamContab, usistema,
  uCtrlPadroes, uCtrlPeriodo;

type
  TfrmWizardMT1 = class(TfrmWizardMT)
    Panel1: TPanel;
    DbChkRenum: TDBCheckBox;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel4: TPanel;
    meErros: TwwDBRichEdit;
    PopupMenu2: TPopupMenu;
    MenuItem2: TMenuItem;
    PopupMenu1: TPopupMenu;
    Salvar1: TMenuItem;
    Imprimir1: TMenuItem;
    SaveDialog1: TSaveDialog;
    CdsPeriodos: TCMClientDataSet;
    sqlPeriodos: TCMSqlParams;
    DsPeriodo: TwwDataSource;
    cdsParamContab: TCMClientDataSet;
    DsParamContab: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlParamContab :TCtrlParamContab;
    CtrlPeriodo :TCtrlPeriodo;
  public
    { Public declarations }
  end;

var
  frmWizardMT1: TfrmWizardMT1;

implementation

{$R *.DFM}

procedure TfrmWizardMT1.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamContab := TCtrlParamContab.Create;
  CtrlParamContab.InitializeAs(Padroes);
  CtrlParamContab.CdsParamContab := CdsParamContab;
  CdsParamContab.Data := CtrlParamContab.ListParamContab(Sistema.IdEmpresa);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(Padroes);
  CtrlPeriodo.cdsPeriodo := CdsPeriodos;

  DbChkRenum.Enabled := cdsParamContab.fieldByName('FLGPLNSEQUENCE').asString = 'N';
end;

procedure TfrmWizardMT1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlParamContab.Free;
  CtrlPeriodo.Free;
end;

procedure TfrmWizardMT1.btnContinuarClick(Sender: TObject);
begin
  if PagControle.ActivePageIndex = 0 then
  begin
    if cdsParamContab.fieldByName('FLGPLNSEQUENCE').asString = 'N' then
    begin
      cdsParamContab.Edit;
      cdsParamContab.fieldByName('FLGPLNSEQUENCE').asString = 'S';
      cdsParamContab.Post;
    end;
  end else begin
    CdsPeriodos.Data := CtrlPeriodo.ListPeriodo(sistema.IdEmpresa, tbpSoNaoBloq, 0, 0);
  end;

  inherited;
end;

procedure TfrmWizardMT1.btnVoltarClick(Sender: TObject);
begin
  inherited;
  DbChkRenum.Enabled := cdsParamContab.fieldByName('FLGPLNSEQUENCE').asString = 'N';
end;

end.

