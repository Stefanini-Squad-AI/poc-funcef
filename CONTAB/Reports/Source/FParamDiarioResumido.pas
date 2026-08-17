unit FParamDiarioResumido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, Spin, ExtCtrls, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Db, Wwdatsrc, uCmSqlParams, DBClient, wwclient,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls;

type
  TfrmParamDiarioResumido = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    lblDataIni: TLabel;
    Label4: TLabel;
    dteDataFim: TCMDateTimePicker;
    dteDataIni: TCMDateTimePicker;
    rdgPla: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    tbsEmpresas: TTabSheet;
    dbgrEmpresaProp: TwwDBGrid;
    chkZeradas: TCheckBox;
    chkConsolidado: TCheckBox;
    chkJuntaHist: TCheckBox;
    Label13: TLabel;
    spnPagIni: TSpinEdit;
    cdsEmpresa: TwwClientDataSet;
    sqlEmpresa: TCMSqlParams;
    dsEmpresa: TwwDataSource;
    chkImprimeMatricial: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;

  public
    { Public declarations }
  end;

var
  frmParamDiarioResumido: TfrmParamDiarioResumido;

implementation

uses UMensErro, uSistema,  uFuncaoGeral;

{$R *.DFM}

procedure TfrmParamDiarioResumido.bbtnConfirmarClick(Sender: TObject);
var sIdPessoa :string;

begin
  inherited;
   if not ((dteDataIni.Text = '') or (dteDataFim.Text = '')) then
   begin

      if VerificaDatas(dteDataIni.date, dteDataFim.date) then
      begin

          sIdPessoa := '';
          cdsEmpresa.First;
          While not cdsEmpresa.EOF do
          begin
             if cdsEmpresa.FieldByName('FLGCONSOL').AsString = 'S' then
             begin
                if sIdPessoa = '' then
                begin
                   sIdPessoa := trim(IntToStr(cdsEmpresa.FieldByName('IDPESSOA').AsInteger));
                end else begin
                   sIdPessoa := sIdPessoa+','+trim(IntToStr(cdsEmpresa.FieldByName('IDPESSOA').AsInteger));
                end;
             end;
             cdsEmpresa.Next;
         end;

         Cmp_Padrao.ParamValues[0].AsString   := dteDataIni.Text;
         Cmp_Padrao.ParamValues[1].AsString   := dteDataFim.Text;
         Cmp_Padrao.ParamValues[2].AsBoolean  := chkZeradas.Checked;
         Cmp_Padrao.ParamValues[3].AsInteger  := rdgPla.ItemIndex;
         Cmp_Padrao.ParamValues[4].AsBoolean  := chkConsolidado.Checked;
         Cmp_Padrao.ParamValues[5].AsInteger  := StrToInt(spnPagIni.text);
         Cmp_Padrao.ParamValues[6].AsBoolean  := chkJuntaHist.Checked;
         Cmp_Padrao.ParamValues[7].AsString   := sIdPessoa;
         Cmp_Padrao.ParamValues[8].AsBoolean  := chkImprimeMatricial.Checked;

      end;

   end;

end;

function TfrmParamDiarioResumido.VerificaDatas(dDataIni,
  dDataFim: TDateTime): boolean;
begin
   //Faz a verificação se a data final é maior que a data inicial
   result := true;

   if dDataFim < dDataIni then begin
      MsgDlg('A Data Final deve ser maior ou igual que a Data Inicial.','Erro',mtError,[mbOk],0);
      result := false;
   end;

end;

procedure TfrmParamDiarioResumido.FormCreate(Sender: TObject);
begin
  inherited;
   sqlEmpresa.Open;
   TwwClientDataSet(cdsEmpresa).ControlType.Add('FLGCONSOL;CheckBox;S;N');

end;

procedure TfrmParamDiarioResumido.FormActivate(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;

end;

end.
