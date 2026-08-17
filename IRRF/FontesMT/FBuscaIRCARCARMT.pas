unit FBuscaIRCARCARMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, wwdblook, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, uCtrlNatuRendimento,
  uCtrlBuscaIRCARCAR, uCtrlParamIRRF, uCtrlDARF, uCtrlInforme, UCtrlModuloIRRF;

type
  TfrmBuscaIRCARCARMT = class(TfrmSairAjuda)
    gbFaixaDatas: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    cdsNaturendimento: TCMClientDataSet;
    cdsParamIRRF: TCMClientDataSet;
    cdsEmpresaProp: TCMClientDataSet;
    cdsInforme: TCMClientDataSet;
    bbtnConfirmaGeracao: TBitBtn;
    chkSomenteEmpProp: TCheckBox;
    rdgNatureza: TRadioGroup;
    pnlPosicao: TPanel;
    ProgressBar1: TProgressBar;
    lblContagem: TLabel;
    memResult: TMemo;
    dblcNatRendimento: TwwDBLookupCombo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgNaturezaClick(Sender: TObject);
  private
    NatuRendimento : TCtrlNatuRendimento;
    BuscaIRCAR : TCtrlBuscaIRCARCAR;
    ParamIRRF : TCtrlParamIRRF;
    Darf : TCtrlDARF;
    Informe : TCtrlInforme;
    ModuloIRRF : TCtrlModuloIRRF;
  public
    

  end;

var
  frmBuscaIRCARCARMT: TfrmBuscaIRCARCARMT;

implementation

Uses USistema, UMensErro, UDatabase, DBaseDados;

{$R *.DFM}

procedure TfrmBuscaIRCARCARMT.FormCreate(Sender: TObject);
Var
  dDataVenc : TDateTime;
begin
  inherited;
  NatuRendimento := TCtrlNatuRendimento.Create;
  NatuRendimento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  BuscaIRCAR := TCtrlBuscaIRCARCAR.Create;
  BuscaIRCAR.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  ParamIRRF := TCtrlParamIRRF.Create;
  ParamIRRF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  Informe := TCtrlInforme.Create;
  Informe.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  Darf := TCtrlDarf.Create;
  Darf.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  ModuloIRRF := TCtrlModuloIRRF.Create;
  ModuloIRRF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  cdsNaturendimento.data := NatuRendimento.ListNaturendimento_Filtrada;
  cdsParamIRRF.data      := ParamIRRF.ProcurarParamIRRF(sistema.IdEmpresa);
  cdsEmpresaProp.data    := Darf.ListEmpresaProp(sistema.IdEmpresa);
  cdsInforme.data        := Informe.listinformeBase;

  dDataVenc  := ModuloIRRF.CalcProxDiaSemana(sistema.IdEmpresa, Date,3,True);
  //
  edtDataIni.Date   := ModuloIRRF.CalcDataIni(dDataVenc);
  edtDataFim.Date   := ModuloIRRF.CalcDataFim(dDataVenc);
  //

  begin
     HelpContext := 240007;
     bbtnAjuda.HelpContext          := 240007;
  end;
  progressbar1.position := 0;
  lblcontagem.caption   := '';
  pnlPosicao.caption    := '';
end;

procedure TfrmBuscaIRCARCARMT.bbtnConfirmaGeracaoClick(Sender: TObject);
Var
  iIdModulo : integer;
begin
  iIdModulo := 0;
  if (cdsInforme.IsEmpty) or (cdsInforme.RecordCount < 2) then begin
     MsgDlg('Favor preencher o Cadastro "Linhas para o Informe de Rendimento"','Erro',mtError,[mbOK],0);
     bbtnSairClick(Self);
     exit;
  end;

 if (cdsParamIRRF.FieldByName('CODALTIRRFCAP').AsInteger = 0) or (cdsParamIRRF.FieldByName('CODALTINSS').AsInteger = 0) then
 begin
    MsgDlg('Parâmetros para Gerar os dados a partir do Contas a Pagar não Preenchidos','Erro',mtError,[mbOK],0);
    bbtnSairClick(Self);
    exit;
 end;
 iIdModulo := 3;

  if edtDataIni.Text = '' then
  begin
     MsgDlg('Obrigatório Preencher a Data Inicial','Erro',mtError,[mbOK],0);
     edtDataIni.SetFocus;
     exit;
  end;
  if edtDataFim.Text = '' then
  begin
     MsgDlg('Obrigatório Preencher a Data Final','Erro',mtError,[mbOK],0);
     edtDataFim.SetFocus;
     exit;
  end;
  if edtDataFim.Date < edtDataIni.Date then
  begin
     MsgDlg('Data Final não pode ser menor do que Data Inicial','Erro',mtError,[mbOK],0);
     edtDataFim.SetFocus;
     exit;
  end;
  If rdgNatureza.ItemIndex = 1 then
      if dblcNatRendimento.Text = '' then
      begin
         MsgDlg('Obrigatório Preencher a Natureza de Rendimento Global','Erro',mtError,[mbOK],0);
         dblcNatRendimento.SetFocus;
         exit;
      end;


  if not(BuscaIRCAR.BuscaIRRF(dblcnatrendimento.lookupvalue,
                              cdsInforme.data,
                              cdsParamIRRF.data,
                              sistema.IdEmpresa,
                              'P',
                              edtDataIni.Date,
                              edtDataFim.Date,
                              iIdModulo,
                              sistema.UsaPlanoPatro,
                              chkSomenteEmpProp.Checked,
                              rdgnatureza.ItemIndex
                             )) then
  begin
    MsgDlg(BuscaIRCAR.MessageInfo,'Erro',mtError,[mbOK],0);
    Repaint;
    Exit
  end
  else
     begin
         If (Copy(pnlPosicao.caption,1,1) <> '>') then
             MsgDlg('Operação efetuada com sucesso!','Aviso',mtWarning,[mbOK],0);
     end;

  inherited;
end;

procedure TfrmBuscaIRCARCARMT.FormShow(Sender: TObject);
begin
  inherited;
  edtDataIni.SetFocus;
  rdgnatureza.ItemIndex     := 0;
  dblcNatRendimento.Enabled := False;
end;

procedure TfrmBuscaIRCARCARMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  NatuRendimento.Free;
  BuscaIRCAR.Free;
  ParamIRRF.Free;
  Darf.Free;
  Informe.Free;
  ModuloIRRF.Free;
end;

procedure TfrmBuscaIRCARCARMT.rdgNaturezaClick(Sender: TObject);
begin
  inherited;
  dblcNatRendimento.Enabled := (rdgnatureza.ItemIndex=1);
  If (rdgnatureza.ItemIndex=1) then
     cdsNaturendimento.data := NatuRendimento.ListNaturendimento_Filtrada
  else
  begin
      cdsNaturendimento.Close;
      dblcNatRendimento.Text := '';
  end;
end;

end.
