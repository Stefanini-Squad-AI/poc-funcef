unit fCadRegContaBanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar, Db,
  DBClient, uCMClientDataSet, StdCtrls, CheckLst, wwdblook, wwdbdatetimepicker, IvMulti,
  CMDateTimePicker, IvDictio, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  BfDialogs, BrowseFolder, uProcuraDir, uCtrlListTerceirosRH,
  ColorCheckListBox, Wwdatsrc, DBCtrls, TREdit, Mask, wwdbedit, MontaSelect,
  Menus;

type
  TfrmCadRegContaBanc = class(TfrmOkCancelar)
    CdsEtapa: TCMClientDataSet;
    dsEtapa: TwwDataSource;
    CdsContaBancaria: TCMClientDataSet;
    DsContaBancaria: TwwDataSource;
    Label14: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dblkContaBancaria: TwwDBLookupCombo;
    dbedNumAgencia: TwwDBEdit;
    dbedConta: TwwDBEdit;
    dbedAgencia: TwwDBEdit;
    Label1: TLabel;
    dbedNumBanco: TwwDBEdit;
    dbedBanco: TwwDBEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedNumAgencia3: TwwDBEdit;
    dbedConta3: TwwDBEdit;
    dbedAgencia3: TwwDBEdit;
    dbedNumBanco3: TwwDBEdit;
    dbedBanco3: TwwDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    dblcTitular: TwwDBLookupCombo;
    CdsContaBancaria3: TCMClientDataSet;
    dsContaBancaria3: TwwDataSource;
    spbtnProcTitular: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblkContaBancariaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbtnProcTitularClick(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    CodPortadorAntes, IdCBancariaAntes: variant;
  public
    class function ExibirTelaContaBanc(CdsEtapaOrigem: TCMClientDataSet): boolean;
  end;

var
  frmCadRegContaBanc: TfrmCadRegContaBanc;

implementation

uses dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, uSistema, uMensErro,
  fProcuraPessoaDoc;

{$R *.DFM}

procedure TfrmCadRegContaBanc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CdsContaBancaria.Data := CtrlListTerceirosRH.ListContaBancaria;
end;

procedure TfrmCadRegContaBanc.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadRegContaBanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

class function TfrmCadRegContaBanc.ExibirTelaContaBanc(CdsEtapaOrigem: TCMClientDataSet): boolean;
var
  frm: TfrmCadRegContaBanc;
begin
  frm := TfrmCadRegContaBanc.Create(Application);
  frm.CdsEtapa := CdsEtapaOrigem;
  frm.dsEtapa.DataSet := CdsEtapaOrigem;
  frm.CodPortadorAntes := frm.CdsEtapa.FieldByName('CODPORTADOR').Value;
  frm.IdCBancariaAntes := frm.CdsEtapa.FieldByName('IDCBANCARIA').Value;
  if not frm.CdsEtapa.FieldByName('IDCBANCARIA').IsNull then
  begin
    frm.CdsContaBancaria3.Data :=
      frm.CtrlListTerceirosRH.ListContaBancariaTerceiros(0,
        frm.CdsEtapa.FieldByName('IDCBANCARIA').asFloat);
    frm.CdsContaBancaria3.Data :=
      frm.CtrlListTerceirosRH.ListContaBancariaTerceiros(
        frm.CdsContaBancaria3.FieldByName('IDPESSOA').asFloat, 0);
  end
  else
    frm.CdsContaBancaria3.Data :=
      frm.CtrlListTerceirosRH.ListContaBancariaTerceiros(0, -1);
  Result := (frm.ShowModal = mrOk);
  frm.CdsEtapa := Nil;
  frm.Free;
end;

procedure TfrmCadRegContaBanc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  CdsEtapa.FieldByName('CODPORTADOR').Value := CodPortadorAntes;
  CdsEtapa.FieldByName('IDCBANCARIA').Value := IdCBancariaAntes;
end;

procedure TfrmCadRegContaBanc.dblkContaBancariaChange(Sender: TObject);
begin
  inherited;
  if dblkContaBancaria.Text = '' then
  begin
    dbedNumBanco.DataSource := nil;
    dbedBanco.DataSource := nil;
    dbedNumAgencia.DataSource := nil;
    dbedAgencia.DataSource := nil;
    dbedConta.DataSource := nil;
  end
  else
  begin
    dbedNumBanco.DataSource := DsContaBancaria;
    dbedBanco.DataSource := DsContaBancaria;
    dbedNumAgencia.DataSource := DsContaBancaria;
    dbedAgencia.DataSource := DsContaBancaria;
    dbedConta.DataSource := DsContaBancaria;
  end;
end;

procedure TfrmCadRegContaBanc.FormShow(Sender: TObject);
begin
  inherited;
  dblkContaBancariaChange(Self);
end;

procedure TfrmCadRegContaBanc.spbtnProcTitularClick(Sender: TObject);
begin
  inherited;
  if (CdsEtapa.State in [dsInsert,dsEdit]) and (frmProcuraPessoaDoc.ShowModal = mrOk) then
  begin
    CdsContaBancaria3.Data :=
      CtrlListTerceirosRH.ListContaBancariaTerceiros(StrToFloat(frmProcuraPessoaDoc.sIDPessoa), 0);
    CdsEtapa.FieldByName('IDCBANCARIA').Value := CdsContaBancaria3.FieldByName('IDCBANCARIA').Value;
  end;
end;

end.
