unit FParamSubConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, uCmSqlParams, Db, DBClient, uCMClientDataSet, Spin,
  StdCtrls, ExtCtrls, Mask, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect;

type
  TfrmParamSubConta = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    lblGrupo: TLabel;
    Label1: TLabel;
    mskSubContaIni: TMaskEdit;
    btnContaIni: TBitBtn;
    mskSubContaFim: TMaskEdit;
    btnContaFim: TBitBtn;
    rdgOrdenacao: TRadioGroup;
    spnPagIni: TSpinEdit;
    Label10: TLabel;
    cdsSub: TCMClientDataSet;
    sqlSub: TCMSqlParams;
    MontaSelectSubConta: TMontaSelect;
    cdsSubF: TCMClientDataSet;
    sqlSubF: TCMSqlParams;
    procedure mskSubContaIniExit(Sender: TObject);
    procedure mskSubContaFimExit(Sender: TObject);
    procedure btnContaIniClick(Sender: TObject);
    procedure btnContaFimClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamSubConta: TfrmParamSubConta;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamSubConta.mskSubContaIniExit(Sender: TObject);
var sSubConta : string;
begin
   inherited;

   if mskSubContaIni.text <> '' then begin
      sSubConta := mskSubContaIni.text;
      with sqlSub do begin
         prepare;
         ParamByName('IDPESSOA').asFloat     := sistema.idEmpresa;
         ParamByName('CODSUBCONTA').asString := sSubConta;
         Open;
         if not cdsSub.isEmpty then begin
            mskSubContaIni.text := cdsSub.FieldByName('CODSUBCONTA').asString;
         end else begin
            MsgDlg('O código da sub-conta informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskSubContaIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamSubConta.mskSubContaFimExit(Sender: TObject);
var sSubConta : string;
begin
   inherited;

   if mskSubContaFim.text <> '' then begin
      sSubConta := mskSubContaFim.text;
      with sqlSubF do begin
         prepare;
         ParamByName('IDPESSOA').asFloat     := sistema.idEmpresa;
         ParamByName('CODSUBCONTA').asString := sSubConta;
         Open;
         if not cdsSubF.isEmpty then begin
            mskSubContaFim.text := cdsSubF.FieldByName('CODSUBCONTA').asString;
         end else begin
            MsgDlg('O código da sub-conta informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskSubContaFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamSubConta.btnContaIniClick(Sender: TObject);
var
 sSubConta: string;
begin
   inherited;

   MontaSelectSubConta.Executar;
   Repaint;
   if MontaSelectSubConta.RetornouValor then begin
      sSubConta := MontaSelectSubConta.ValoresChave[1];
      with sqlSub do begin
         prepare;
         ParamByName('IDPESSOA').asFloat     := sistema.idEmpresa;
         ParamByName('CODSUBCONTA').asString := sSubConta;
         Open;
         mskSubContaIni.text  := cdsSub.FieldByName('CODSUBCONTA').asString;
      end;
   end;

end;

procedure TfrmParamSubConta.btnContaFimClick(Sender: TObject);
var
 sSubConta: string;
begin
   inherited;

   MontaSelectSubConta.Executar;
   Repaint;
   if MontaSelectSubConta.RetornouValor then begin
      sSubConta := MontaSelectSubConta.ValoresChave[1];
      with sqlSubF do begin
         prepare;
         ParamByName('IDPESSOA').asFloat     := sistema.idEmpresa;
         ParamByName('CODSUBCONTA').asString := sSubConta;
         Open;
         mskSubContaFim.text  := cdsSubF.FieldByName('CODSUBCONTA').asString;
      end;
   end;

end;

procedure TfrmParamSubConta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString  := mskSubContaIni.Text;
  Cmp_Padrao.ParamValues[1].AsString  := mskSubContaFim.Text;
  Cmp_Padrao.ParamValues[2].AsInteger := rdgOrdenacao.ItemIndex;
  Cmp_Padrao.ParamValues[3].AsInteger := StrToInt(spnPagIni.text);

end;

procedure TfrmParamSubConta.FormCreate(Sender: TObject);
begin
  inherited;
   MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

end.
