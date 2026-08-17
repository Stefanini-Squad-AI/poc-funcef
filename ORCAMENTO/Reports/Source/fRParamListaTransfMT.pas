unit fRParamListaTransfMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, MontaSelect;

type
  TfrmRParamListaTransfMT = class(TfrmParamReports_Padrao)
    MontaSelectConta: TMontaSelect;
    lblDataIni: TLabel;
    dteDataIni: TCMDateTimePicker;
    Label1: TLabel;
    dteDataFim: TCMDateTimePicker;
    lblCodigoConta: TLabel;
    edtCodigoContaOri: TEdit;
    bbtnBuscaContaOri: TBitBtn;
    edtNomeContaOri: TEdit;
    Label2: TLabel;
    edtCodigoContaDes: TEdit;
    bbtnBuscaContaDes: TBitBtn;
    edtNomeContaDes: TEdit;
    rdgOrdenacao: TRadioGroup;
    procedure bbtnBuscaContaOriClick(Sender: TObject);
    procedure edtCodigoContaOriExit(Sender: TObject);
    procedure bbtnBuscaContaDesClick(Sender: TObject);
    procedure edtCodigoContaDesExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamListaTransfMT: TfrmRParamListaTransfMT;

implementation

uses UCtrlOrcamento, UModulo, UMensErro;

{$R *.DFM}

procedure TfrmRParamListaTransfMT.bbtnBuscaContaOriClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  if MontaSelectConta.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelectConta.ValoresChave[1], true, false, sNomeConta,
       sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid,
       sPPrev, sCCusto, sPatro) = 0 then begin
      edtCodigoContaOri.text := MontaSelectConta.ValoresChave[1];
      edtNomeContaOri.text  := sNomeConta;
    end else begin
      edtCodigoContaOri.SetFocus;
    end;
  end;
end;

procedure TfrmRParamListaTransfMT.edtCodigoContaOriExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if Trim(edtCodigoContaOri.text) <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       edtCodigoContaOri.text, true, false, sNomeConta, sCodCentroRespon,
       sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
       sPatro) = 0 then begin
      edtNomeContaOri.text  := sNomeConta;
    end else begin
      edtCodigoContaOri.SetFocus;
    end;
  end;
end;

procedure TfrmRParamListaTransfMT.bbtnBuscaContaDesClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  if MontaSelectConta.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelectConta.ValoresChave[1], true, false, sNomeConta,
       sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid,
       sPPrev, sCCusto, sPatro) = 0 then begin
      edtCodigoContaDes.text := MontaSelectConta.ValoresChave[1];
      edtNomeContaDes.text  := sNomeConta;
    end else begin
      edtCodigoContaDes.SetFocus;
    end;
  end;
end;

procedure TfrmRParamListaTransfMT.edtCodigoContaDesExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if Trim(edtCodigoContaDes.text) <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       edtCodigoContaDes.text, true, false, sNomeConta, sCodCentroRespon,
       sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
       sPatro) = 0 then begin
      edtNomeContaDes.text  := sNomeConta;
    end else begin
      edtCodigoContaDes.SetFocus;
    end;
  end;
end;

procedure TfrmRParamListaTransfMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //Filtra os dados da tela para passar para o relatório
  if not ((Trim(dteDataIni.Text) = '') or (Trim(dteDataFim.Text) = '')) then 
     begin
    //Verifica se a data final é maior ou igual à inicial
    if OrcamentoBackMT.VerificaDatas(dteDataIni.date, dteDataFim.date) then
       begin
      Cmp_Padrao.ParamValues[0].AsDateTime := dteDataIni.Date;
      Cmp_Padrao.ParamValues[1].AsDateTime := dteDataFim.Date;
      Cmp_Padrao.ParamValues[2].AsString   := Trim(edtCodigoContaOri.Text);
      Cmp_Padrao.ParamValues[3].AsString   := Trim(edtNomeContaOri.Text);
      Cmp_Padrao.ParamValues[4].AsString   := Trim(edtCodigoContaDes.Text);
      Cmp_Padrao.ParamValues[5].AsString   := Trim(edtNomeContaDes.Text);
      Cmp_Padrao.ParamValues[6].AsInteger  := rdgOrdenacao.ItemIndex;
    end else begin
      MsgDlg('Data Inicial posterior à Data Final.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
    end;
  end else begin
    MsgDlg('O Período de Datas de Referência deve ser preenchido.','Erro',
           mtError,[mbOk],0);
    modalResult := mrNone;
  end;
end;

end.
