{==================================================================================================
Alterações:
===================================================================================================
Rotina    :
Data      : 26/08/2006
Autor     : Claudio Faria
Pendencia : 22217
Descrição : Criado Cadastro de Plano Previdênciario
---------------------------------------------------------------------------------------------------}

unit FCadPlanPrevMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlPadroes, uCtrlPlanPrevidencia, Mask, DBCtrls;

type
  TFrmCadPlanPrev = class(TFrmCadastroMT)
    DBEdit1: TDBEdit;
    dbeSPC: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlPlanPrevidencia : TCtrlPlanPrevidencia;
  public
    { Public declarations }
  end;

var
  FrmCadPlanPrev: TFrmCadPlanPrev;

implementation

{$R *.DFM}

procedure TFrmCadPlanPrev.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlPlanPrevidencia := TCtrlPlanPrevidencia.Create;
   CtrlPlanPrevidencia.InitializeAs(Padroes);
   CtrlPlanPrevidencia.cds := cds;
   cds.Data := CtrlPlanPrevidencia.ListaPlanPrev(-1);
end;

procedure TFrmCadPlanPrev.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   If MontaSelect.RetornouValor Then
      cds.Data := CtrlPlanPrevidencia.ListaPlanPrev(StrToInt(MontaSelect.ValoresChave[ 0 ]));
end;

procedure TFrmCadPlanPrev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   CtrlPlanPrevidencia.Free;
end;

procedure TFrmCadPlanPrev.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPlanPrevidencia.Gravar;
end;

procedure TFrmCadPlanPrev.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPlanPrevidencia.Gravar;
end;

procedure TFrmCadPlanPrev.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPlanPrevidencia.Gravar;
end;

end.
