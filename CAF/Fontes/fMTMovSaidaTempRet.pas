unit fMTMovSaidaTempRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  Wwdbigrd, Wwdatsrc, Grids, Wwdbgrid, MontaSelect, Mask, wwdbedit, DBCtrls,
  TB97Ctls, fcLabel, wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlMovSaidaTemporaria, uCmSqlParams, IvEMulti;

type
  TfrmMTMovSaidaTempRet = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    Label1: TLabel;
    dbgBensTermo: TwwDBGrid;
    Termo: TLabel;
    dbeTermo: TwwDBEdit;
    dsTermoBens: TwwDataSource;
    Label3: TLabel;
    Label34: TLabel;
    dbeLocalizacao: TwwDBEdit;
    Label4: TLabel;
    dbeResponsavel: TwwDBEdit;
    Label2: TLabel;
    dbeMotivo: TwwDBEdit;
    Label6: TLabel;
    dbeObs: TDBMemo;
    pnlData: TPanel;
    dbeData: TCMDateTimePicker;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnSelTermo: TToolbarButton97;
    bbtnSelTermoBem: TToolbarButton97;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    bbtnRegRetorno: TToolbarButton97;
    Toolbar973: TToolbar97;
    edDataRetorno: TCMDateTimePicker;
    fcLabel1: TfcLabel;
    dsTermo: TwwDataSource;
    cdsTermo: TCMClientDataSet;
    MSTermo: TMontaSelect;
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    cdsTermoBens: TCMClientDataSet;
    sqlTermoBens: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTermoClick(Sender: TObject);
    procedure bbtnSelTermoBemClick(Sender: TObject);
    procedure bbtnRegRetornoClick(Sender: TObject);
  private
    { Private declarations }
    SaidaTemporaria : TCtrlMovSaidaTemporaria;
    procedure SelSaidaTemporaria(fIdPessoa, fIdSaidaTemporaria : Extended);
  public
    { Public declarations }
  end;

var
  frmMTMovSaidaTempRet: TfrmMTMovSaidaTempRet;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

//========================================================================================
procedure TfrmMTMovSaidaTempRet.FormCreate(Sender: TObject);
begin
   SaidaTemporaria := TCtrlMovSaidaTemporaria.Create;
   SaidaTemporaria.InitializeAs(Padroes);
   SaidaTemporaria.cds              := cdsTermo;
   SaidaTemporaria.cdsSaidaTempBens := cdsTermoBens;
   //-------------------------------------------------------------------------------------
   MSTermo.Filtro.Add('SAIDATEMPORARIA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   SelSaidaTemporaria(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TFrmMTMovSaidaTempRet.SelSaidaTemporaria(fIdPessoa, fIdSaidaTemporaria : Extended);
begin
   cdsTermo.Data := SaidaTemporaria.ListaSaidaTemporaria(fIdPessoa, fIdSaidaTemporaria);
   if not cdsTermo.IsEmpty then
   begin
      cdsTermoBens.Data := SaidaTemporaria.ListaSaidaTempBensRet(cdsTermo.FieldByName('IDPESSOA').AsFloat,
                                                                 cdsTermo.FieldByName('IDSAIDATEMPORARIA').AsFloat);
      pnlDetalhe.Enabled := True;
   end else
   begin
      cdsTermoBens.Data := SaidaTemporaria.ListaSaidaTempBensRet(Sistema.IdEmpresa, 0);
      pnlDetalhe.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempRet.bbtnSelTermoBemClick(Sender: TObject);
var
   fIdSaidaTemp : Extended;

begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      fIdSaidaTemp := SaidaTemporaria.PesquisaTermoSaidaTempxBem(strtofloat(MSBem.ValoresChave[0]),
                                                                 strtofloat(MSBem.ValoresChave[1]));
      //----------------------------------------------------------------------------------
      SelSaidaTemporaria(strtofloat(MSBem.ValoresChave[0]), fIdSaidaTemp);
      //----------------------------------------------------------------------------------
      if cdsTermo.FieldByName('STPFLGEXEC').AsInteger = 0 then
      begin
         MsgDlg('Termo de Saída Temporária não executado','Erro',mtError,[mbOK],0);
         pnlDetalhe.Enabled := False;
      end;
      cdsTermoBens.Locate('IDBEM',strtoint(MSBem.ValoresChave[1]),[]);
   end;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempRet.bbtnSelTermoClick(Sender: TObject);
begin
   inherited;
   MSTermo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSTermo.RetornouValor then
   begin
      SelSaidaTemporaria(Sistema.IdEmpresa, StrToInt(MSTermo.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      if cdsTermo.FieldByName('STPFLGEXEC').AsInteger = 0 then
      begin
         MsgDlg('Termo de Saída Temporária não executado','Erro',mtError,[mbOK],0);
         pnlDetalhe.Enabled := False;
      end;
   end else
      SelSaidaTemporaria(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTMovSaidaTempRet.bbtnRegRetornoClick(Sender: TObject);
var
   fIdSaidaTemporaria, fIdBem : Extended;

begin
   inherited;
   fIdSaidaTemporaria := cdsTermoBens.FieldByName('IDSAIDATEMPORARIA').AsFloat;
   fIdBem := cdsTermoBens.FieldByName('IDBEM').AsFloat;
   //-------------------------------------------------------------------------------------
   if (cdsTermoBens.FieldByName('MARCADO').AsInteger = 0) and (edDataRetorno.Text = '') then
   begin
      MsgDlg('Informe a data de retorno do bem!','Erro',mtError,[mbOK],0);
      edDataRetorno.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if not SaidaTemporaria.ProcessaRetornoTermoSaidaTemp(cdsTermoBens.FieldByName('IDPESSOA').AsFloat,
                                                        cdsTermoBens.FieldByName('IDBEM').AsFloat,
                                                        cdsTermoBens.FieldByName('IDSAIDATEMPORARIA').AsFloat,
                                                        edDataRetorno.Date) then
   begin
      MsgDlg(SaidaTemporaria.MessageInfo, 'Erro', mtError, [mbOK], 0);
      edDataRetorno.SetFocus;
   end;
   //-------------------------------------------------------------------------------------
   SelSaidaTemporaria(Sistema.IdEmpresa, fIdSaidaTemporaria);
   cdsTermoBens.Locate('IDBEM',fIdBem,[]);
end;
//========================================================================================
procedure TfrmMTMovSaidaTempRet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   SaidaTemporaria.Free;
end;

end.
