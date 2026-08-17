unit fMTInvProcessar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, DBTables,
  Wwdatsrc, Wwquery, IvDictio, IvMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbedit, Mask, wwdbdatetimepicker,
  CMDateTimePicker, uCmSqlParams, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes,
  uCtrlInventarioBens, uCtrlParamCAF, uCtrlMovTransfBem, DBCtrls, IvEMulti;

type
  TfrmMTInvProcessar = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    pnlDetalhe: TPanel;
    Panel2: TPanel;
    dbeDataInicio: TCMDateTimePicker;
    Label3: TLabel;
    bbtnPesquisa: TBitBtn;
    dbeIdInventario: TwwDBEdit;
    Label1: TLabel;
    dbeResponsavel: TwwDBEdit;
    Label4: TLabel;
    dbGrd: TwwDBGrid;
    MontaSelect: TMontaSelect;
    dsDet: TwwDataSource;
    cdsDet: TCMClientDataSet;
    sqlDet: TCMSqlParams;
    cds: TCMClientDataSet;
    ds: TwwDataSource;
    GroupBox1: TGroupBox;
    edDataFim: TCMDateTimePicker;
    ckbEncerrado: TDBCheckBox;
    dsTermoTransf: TwwDataSource;
    cdsTermoTransf: TCMClientDataSet;
    sqlTermoTransf: TCMSqlParams;
    sqlDetDes: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnPesquisaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    InventarioBens : TCtrlInventarioBens;
    ParamCAF       : TCtrlParamCAF;
    //------------------------------------------------------------------------------------
    iDigMascPlaca : Integer;
    //------------------------------------------------------------------------------------
    procedure SelInventarioBens(fIdPessoa, fIdInventarioBens : Extended);
  public
    { Public declarations }
  end;

var
  frmMTInvProcessar: TfrmMTInvProcessar;

implementation

{$R *.DFM}

uses uSistema, uMensErro, fMTInvProcSelTermo, fAguarde;

procedure TfrmMTInvProcessar.FormCreate(Sender: TObject);
begin
   inherited;
   InventarioBens := TCtrlInventarioBens.Create;
   InventarioBens.InitializeAs(Padroes);
   InventarioBens.cds := cds;
   InventarioBens.cdsItensInvBens := cdsDet;
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   iDigMascPlaca := ParamCAF.DIGMASCPLACA;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('INVENTARIOBENS.IDEMPRESA = ' + inttostr(Sistema.IdEmpresa));
   SelInventarioBens(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTInvProcessar.FormShow(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnSair.SetFocus;
end;
//========================================================================================
procedure TFrmMTInvProcessar.SelInventarioBens(fIdPessoa, fIdInventarioBens : Extended);
begin
   cds.Data := InventarioBens.ListaInventarioBens(fIdPessoa, fIdInventarioBens);
   if not cds.IsEmpty then
   begin
      sqlDet.Prepare;
      sqlDet.ParamByName('IDEMPRESA').AsFloat := cds.FieldByName('IDEMPRESA').AsFloat;
      sqlDet.ParamByName('IDINVENTARIOBENS').AsFloat := cds.FieldByName('IDINVENTARIOBENS').AsFloat;
      sqlDet.Open;
   end else
   begin
      cdsDet.Close;
      sqlDet.Prepare;
      sqlDet.ParamByName('IDEMPRESA').AsFloat := 0;
      sqlDet.ParamByName('IDINVENTARIOBENS').AsFloat := 0;
      sqlDet.Open;
   end;
   bbtnConfirmar.Enabled := not cdsDet.IsEmpty;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvProcessar.bbtnPesquisaClick(Sender: TObject);
begin
   inherited;
   MontaSelect.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MontaSelect.RetornouValor then
      SelInventarioBens(strtofloat(MontaSelect.ValoresChave[1]),
                        strtofloat(MontaSelect.ValoresChave[0]));
   //-------------------------------------------------------------------------------------
   if cds.FieldByName('STATUS').AsInteger > 1 then
   begin
      sqlTermoTransf.Prepare;
      sqlTermoTransf.ParamByName('IDSELBAIXA').AsFloat := cds.FieldByName('IDSELBAIXA').AsFloat;
      sqlTermoTransf.ParamByName('IDPESSOA').AsFloat := cds.FieldByName('IDEMPRESA').AsFloat;
      sqlTermoTransf.Open;
      MsgDlg('Inventário já Processado! ' + #13 +
             'Termo de Transferência Número ' + cdsTermoTransf.FieldByName('SBXTERMO').AsString + ' Gerado.',
             'Erro', mtError, [mbOk], 0);
      cdsTermoTransf.Close;
      SelInventarioBens(Sistema.IdEmpresa, 0);
      Exit;
   end;
end;
//========================================================================================
procedure TfrmMTInvProcessar.bbtnConfirmarClick(Sender: TObject);
var
   dDataTermo          : tDateTime;
   sProcesso           : String;
   fTermo, fRespTermo  : Extended;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Códigos de Status
   //-------------------------------------------------------------------------------------
   // 0 - Inventário em Andamento
   // 1 - Inventário Encerrado
   // 2 - Inventário Processado
   //-------------------------------------------------------------------------------------
   // Códigos de iibFlgPlaca
   //-------------------------------------------------------------------------------------
   // 0 - Sem Resultado
   // 1 - Ok
   // 2 - Placa não encontrada
   // 3 - Placa EM outro Local
   // 4 - Placa DE outro Local
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   //-------------------------------------------------------------------------------------
   if dbeIdInventario.Text = '' then
   begin
      MsgDlg('Selecione um Levantamento antes de executar o processamento! ',
             'Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      dbeIdInventario.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se todos os bens com Mudança de Local estão com os novos conjuntos
   // definidos
   //-------------------------------------------------------------------------------------
   cdsDet.DisableControls;
   cdsDet.First;
   while not cdsDet.EOF do
   begin
      if cdsDet.Fieldbyname('IIBCONJUNTONOVO').IsNull then
      begin
         MsgDlg('O Bem ' + cdsDet.FieldByName('IIBPLACA').AsString + ' está sem o novo conjunto definido!',
                'Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         cdsDet.EnableControls;
         dbGrd.SetFocus;
         exit;
      end;
      cdsDet.Next;
   end;
   //-------------------------------------------------------------------------------------
   // Le os Dados para a Geração do Termo de Transferência
   //-------------------------------------------------------------------------------------
   Application.CreateForm(TfrmMTInvProcSelTermo,frmMTInvProcSelTermo);
   frmMTInvProcSelTermo.FormStyle := FsNormal;
   frmMTInvProcSelTermo.Visible   := False;
   frmMTInvProcSelTermo.ShowModal;
   //-------------------------------------------------------------------------------------
   if ((frmMTInvProcSelTermo.edTermo.Value    = 0 )  or
       (frmMTInvProcSelTermo.edTermo.Text     = '')  or
       (frmMTInvProcSelTermo.edProcesso.Text  = '')  or
       (frmMTInvProcSelTermo.edDataTermo.Text = '')  or
       (frmMTInvProcSelTermo.edNomeResp.Text  = '')) then
   begin
      frmMTInvProcSelTermo.Release;
      MsgDlg('Informe os dados corretos do Termo de Transferência! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      dbeIdInventario.SetFocus;
      exit;
   end else
   //-------------------------------------------------------------------------------------
   begin
      fTermo     := frmMTInvProcSelTermo.edTermo.Value;
      sProcesso  := frmMTInvProcSelTermo.edProcesso.Text;
      dDataTermo := frmMTInvProcSelTermo.edDataTermo.Date;
      fRespTermo := frmMTInvProcSelTermo.fResponsavel;
      frmMTInvProcSelTermo.Release;
   end;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if InventarioBens.GerarTermoTransferencia(Sistema.IdEmpresa, fTermo, sProcesso,
                                             dDataTermo, fRespTermo, iDigMascPlaca) then
      MsgDlg('Termo de Transferência Gerado. Processe-o em TRANSFERÊNCIA DE BENS.',
             'Informação', mtInformation, [mbOk], 0)
   else
      MsgDlg('Erro na Geração do Termo de Transferência!' + #13 +
             'Causa : ' + InventarioBens.MessageInfo, 'Erro', mtError, [mbOk], 0);
   //-------------------------------------------------------------------------------------
   SelInventarioBens(Sistema.IdEmpresa, 0);
   bbtnConfirmar.Enabled := False;
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvProcessar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   InventarioBens.Free;
   ParamCAF.Free;
end;

end.
