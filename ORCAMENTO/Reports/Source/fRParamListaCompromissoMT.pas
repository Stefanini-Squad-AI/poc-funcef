unit fRParamListaCompromissoMT;
{-------------------------------------------------------------------------------
 Autor     : Rodolpho da Silva
 Data      : 28/10/2005
 Pendência : 20085
 Descrição : Incluir no MontaSelect a opção de filtro por Grupo de Contas Orçamentárias
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, MontaSelect;

type
  TfrmRParamListaCompromissoMT = class(TfrmParamReports_Padrao)
    MontaSelectConta: TMontaSelect;
    lblDataIni: TLabel;
    dteDataIni: TCMDateTimePicker;
    Label1: TLabel;
    dteDataFim: TCMDateTimePicker;
    lblCodigoConta: TLabel;
    edtCodigoConta: TEdit;
    bbtnBuscaConta: TBitBtn;
    edtNomeConta: TEdit;
    GroupBox1: TGroupBox;
    chkEfetivadas: TCheckBox;
    chkCanceladas: TCheckBox;
    rdgOrdenacao: TRadioGroup;
    rgAtivas: TRadioGroup;
    ChkAguardando: TCheckBox;
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure edtCodigoContaExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamListaCompromissoMT: TfrmRParamListaCompromissoMT;

implementation

uses UCtrlOrcamento, UModulo, UMensErro;

{$R *.DFM}

procedure TfrmRParamListaCompromissoMT.bbtnBuscaContaClick(
  Sender: TObject);
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
      edtCodigoConta.text := MontaSelectConta.ValoresChave[1];
      edtNomeConta.text   := sNomeConta;
    end else begin
      edtCodigoConta.SetFocus;
    end;
  end;
end;

procedure TfrmRParamListaCompromissoMT.edtCodigoContaExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if Trim(edtCodigoConta.text) <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc, edtCodigoConta.text,
       true, false, sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
       sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro) = 0 then begin
      edtNomeConta.text  := sNomeConta;
    end else begin
      edtCodigoConta.SetFocus;
    end;
  end;
end;

procedure TfrmRParamListaCompromissoMT.bbtnConfirmarClick(Sender: TObject);
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
      Cmp_Padrao.ParamValues[2].AsString   := Trim(edtCodigoConta.Text);
      Cmp_Padrao.ParamValues[3].AsString   := Trim(edtNomeConta.Text);
      Cmp_Padrao.ParamValues[4].AsBoolean  := chkEfetivadas.Checked;
      Cmp_Padrao.ParamValues[5].AsBoolean  := chkCanceladas.Checked;
      Cmp_Padrao.ParamValues[6].AsInteger  := rdgOrdenacao.ItemIndex;
      Cmp_Padrao.ParamValues[7].AsInteger  := rgAtivas.ItemIndex;
      Cmp_Padrao.ParamValues[8].AsBoolean  := chkAguardando.Checked;
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
