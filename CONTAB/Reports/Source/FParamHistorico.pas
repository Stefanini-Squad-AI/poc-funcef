unit FParamHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  MontaSelect, Spin, StdCtrls, ExtCtrls, Mask, CmParamReport, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TfrmParamHistorico = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    lblGrupo: TLabel;
    Label1: TLabel;
    mskHistIni: TMaskEdit;
    btnHistIni: TBitBtn;
    mskHistFim: TMaskEdit;
    btnHistFim: TBitBtn;
    rdgOrdenacao: TRadioGroup;
    spnPagIni: TSpinEdit;
    Label10: TLabel;
    MontaSelectHist: TMontaSelect;
    cdsHist: TCMClientDataSet;
    sqlHist: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure mskHistIniExit(Sender: TObject);
    procedure btnHistIniClick(Sender: TObject);
    procedure mskHistFimExit(Sender: TObject);
    procedure btnHistFimClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamHistorico: TfrmParamHistorico;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamHistorico.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelectHist.Filtro.Add('HISTOPADRAO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmParamHistorico.mskHistIniExit(Sender: TObject);
var sHist : string;
begin
   inherited;

   if mskHistIni.text <> '' then begin
      sHist := mskHistIni.text;
      with sqlHist do begin
         prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('HITCODHIST').asString   := sHist;
         Open;
         if not cdsHist.isEmpty then begin
            mskHistIni.text := cdsHist.FieldByName('HITCODHIST').asString;
         end else begin
            MsgDlg('O código do histórico padrão informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskHistIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamHistorico.btnHistIniClick(Sender: TObject);
var
 sHist: string;
begin
   inherited;

   MontaSelectHist.Executar;
   Repaint;
   if MontaSelectHist.RetornouValor then begin
      sHist := MontaSelectHist.ValoresChave[0];
      with sqlHist do begin
         prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('HITCODHIST').asString   := sHist;
         Open;
         mskHistIni.text  := cdsHist.FieldByName('HITCODHIST').asString;
      end;
   end;

end;

procedure TfrmParamHistorico.mskHistFimExit(Sender: TObject);
var sHist : string;
begin
   inherited;

   if mskHistFim.text <> '' then
   begin
      sHist := mskHistFim.text;
      with sqlHist do
      begin
         prepare;
         ParamByName('IDPESSOA').asFloat    := sistema.idEmpresa;
         ParamByName('HITCODHIST').asString := sHist;
         Open;
         if not cdsHist.isEmpty then
         begin
            mskHistFim.text := cdsHist.FieldByName('HITCODHIST').asString;
         end else
         begin
            MsgDlg('O código do histórico padrão informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskHistFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamHistorico.btnHistFimClick(Sender: TObject);
var
 sHist: string;
begin
   inherited;

   MontaSelectHist.Executar;
   Repaint;
   if MontaSelectHist.RetornouValor then begin
      sHist := MontaSelectHist.ValoresChave[0];
      with sqlHist do begin
         prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('HITCODHIST').asString   := sHist;
         Open;
         mskHistFim.text  := cdsHist.FieldByName('HITCODHIST').asString;
      end;
   end;

end;

procedure TfrmParamHistorico.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString  := mskHistIni.Text;
  Cmp_Padrao.ParamValues[1].AsString  := mskHistFim.Text;
  Cmp_Padrao.ParamValues[2].AsInteger := rdgOrdenacao.ItemIndex;
  Cmp_Padrao.ParamValues[3].AsInteger := StrToInt(spnPagIni.text);

end;

end.
