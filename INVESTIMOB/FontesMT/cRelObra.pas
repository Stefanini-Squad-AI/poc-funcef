{
Rotina..........: FormCreate, bbtnConfirmarClick, FormDestroy
N. Sol..........: 126313
N. Kintana......: 660139
Data............: 11/01/2010
Responsável.....: Marilza Colpani
Descrição.......: Ajuste no relatório Lançamentos de Obras para que no mesmo
                  informe o rateio entre os planos de benefícios.
}
unit cRelObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, mImovelObra, fcCombo, fcColorCombo,
  wwdblook, Db, DBClient, uCMClientDataSet, uCtrlPlanPrevContabil, uCtrlImovel,
  uCtrlPlanPrevContabPatro, uCtrlPatrocinadora;

type
  TcfgRelObra = class(TfrmParamReports_Padrao)
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    molImovelObra1: TmolImovelObra;
    GroupBox1: TGroupBox;
    edtLimite: TCMDateTimePicker;
    cbAtiva: TCheckBox;
    dbcboPlanPrev: TwwDBLookupCombo;
    dbcboPatro: TwwDBLookupCombo;
    cdsPlano: TCMClientDataSet;
    cdsPlanoNOME: TStringField;
    cdsPlanoIDPLANOPREV: TFloatField;
    cdsPatro: TCMClientDataSet;
    cdsPatroNOME: TStringField;
    cdsPatroIDPESSOA: TFloatField;
    lblPlano: TLabel;
    lblPatro: TLabel;
    dsPlano: TDataSource;
    dsPatro: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molImovelObra1btnBuscaImovelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    //Marilza Colpani SOL 126313/KTN 660139 - Início
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlPlanPrev : TCtrlPlanPrevContabil;
    CtrlImovel : TCtrlImovel;
    CtrlPatrocinadora: TCtrlPatrocinadora;
    CtrlPlanoPrev: TCtrlPlanPrevContabil;
    CtrlPlanoPatro: TCtrlPlanPrevContabPatro;
    //Marilza Colpani SOL 126313/KTN 660139 - Fim

  public
    { Public declarations }
  end;

var
  cfgRelObra: TcfgRelObra;

implementation

uses uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}

procedure TcfgRelObra.FormCreate(Sender: TObject);
begin
  inherited;
  // Limpa o Frame
  molImovelObra1.btnLimpaImovelClick( Self );
  edtLimite.Date := Date;

  //Marilza Colpani SOL 126313/KTN 660139
  CtrlPatrocinadora := TCtrlPatrocinadora.Create;
  CtrlPatrocinadora.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPrev := TCtrlPlanPrevContabil.Create;
  CtrlPlanoPrev.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanoPatro.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true);


  cdsPatro.Data := CtrlPatrocinadora.ListaPatrocinadora();
  cdsPlano.Data := CtrlPlanoPrev.ListaPlanPrevContabil();
  //Marilza Colpani SOL 126313/KTN 660139 - Fim

end;

procedure TcfgRelObra.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  //Marilza Colpani SOL 126313/KTN 660139  - Início
  if ( ( dbcboPlanPrev.Text <> '' ) and ( dbcboPatro.Text = '' ) ) or
    ( ( dbcboPlanPrev.Text = '' ) and ( dbcboPatro.Text <> '' ) )  then
  begin
    MessageDlg(  'Se o Plano Previdenciário ou a Patrocinadora' +
      ' estiver preenchido obrigatoriamente ambos os campos devem ser preenchidos.', mtWarning, [mbOK], 0);
    Exit;
  end;

  inherited;

  if ( dbcboPlanPrev.Text <> '' ) then
  begin
    // valida plano x patrocinadora
    if not CtrlPlanoPatro.ValidaPlanoPatro( StrToInt(dbcboPatro.LookupValue),
                                            StrToInt(dbcboPlanPrev.LookupValue) ) then
    begin
      MessageDlg( CtrlPlanoPatro.MessageInfo, mtWarning, [mbOK], 0);
      Exit;
    end;

    cmp_Padrao.ParamByName('iIdPatro').AsInteger := StrToInt(dbcboPatro.LookupValue);
    cmp_Padrao.ParamByName('iIdPlanoPrev').AsInteger := StrToInt(dbcboPlanPrev.LookupValue);
  end
  else
  begin
    cmp_Padrao.ParamByName('iIdPatro').AsInteger := -1;
    cmp_Padrao.ParamByName('iIdPlanoPrev').AsInteger := -1;
  end;
  //Marilza Colpani SOL 126313/KTN 660139 - FIM

  cmp_Padrao.ParamByName('iIdObra').AsInteger  := molImovelObra1.iObra;
  cmp_Padrao.ParamByName('dLimite').AsDateTime := edtLimite.Date;
  cmp_Padrao.ParamByName('bAtiva').AsBoolean   := cbAtiva.Checked;

  // Carrega variáveis com os parametros de cores de linha e separadores
  iPosCor  := 0;
  CorLinha := cboCorLinha.SelectedColor;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
  cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
  cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
  cmp_Padrao.ParamByName('iCorLinha').AsInteger  := iPosCor;

  if bbtnConfirmar.ModalResult <> mrOk then begin
     bbtnConfirmar.ModalResult := mrOk;
     bbtnConfirmar.Click;
  end;
end;

procedure TcfgRelObra.molImovelObra1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  // Abre o MontaSelect exibindo todas as obras (em aberto ou encerradas)
  molImovelObra1.btnBuscaImovelClick(Sender, 0);
end;

procedure TcfgRelObra.FormDestroy(Sender: TObject);
begin
  inherited;
      //Marilza Colpani SOL 126313/KTN 660139 - Início
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlImovel);
  FreeAndNil(CtrlPlanPrev);
  FreeAndNil( CtrlPatrocinadora );
  FreeAndNil( CtrlPlanoPrev );
  FreeAndNil( CtrlPlanoPatro );
      //Marilza Colpani SOL 126313/KTN 660139 - Fim
end;

end.
