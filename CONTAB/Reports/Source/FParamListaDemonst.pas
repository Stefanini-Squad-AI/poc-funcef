unit FParamListaDemonst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, Mask, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamListaDemonst = class(TfrmParamReports_Padrao)
    mskDemo: TMaskEdit;
    edtCodDemo: TEdit;
    btnDemo: TBitBtn;
    lblGrupo: TLabel;
    MontaSelectDemo: TMontaSelect;
    dtDataRef: TCMDateTimePicker;
    lblDataLimite: TLabel;
    Label1: TLabel;
    procedure btnDemoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamListaDemonst: TfrmParamListaDemonst;

implementation

uses uSistema;
{$R *.DFM}

procedure TfrmParamListaDemonst.btnDemoClick(Sender: TObject);
begin
  inherited;
   edtCodDemo.text := '';

   MontaSelectDemo.Executar;
   Repaint;
   if MontaSelectDemo.RetornouValor then begin
      edtCodDemo.text := MontaSelectDemo.ValoresChave[0];
      mskDemo.text    := MontaSelectDemo.ValoresChave[1];
   end;

end;

procedure TfrmParamListaDemonst.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cmp_Padrao.ParamValues[0].AsString  :=edtCodDemo.text;
  Cmp_Padrao.ParamValues[1].AsString  := dtDataRef.Text;

end;

procedure TfrmParamListaDemonst.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelectDemo.Filtro.Add('DEMONSTRATIVO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

end.
